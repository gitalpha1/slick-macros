
/******************************************************************************
*  $Revision: 1.1 $
******************************************************************************/


#include "slick.sh"

#pragma option(strictsemicolons,on)
#pragma option(strict,on)
#pragma option(autodecl,off)
#pragma option(strictparens,on)

/****************************************************************************** 
 * dlinklist is a doubly linked list handler slightly similar to C++ STL list 
 * container except there is no "one past the end". dlist_end returns an 
 * iterator to the last item in the list, not one past the end. 
 *  
 * Elements of the list do not have to be all of the same type. 
 *  
 * When a list is constructed it may be selected as overwriting or 
 * non-overwriting type.  If overwriting is enabled and the list already 
 * contains max allowed nodes, push_front pops the last entry in the list to 
 * make room for the new one, push_back pops the first entry in the list and 
 * insert pops the last. 
 *  
 * Some debug code is included at the end of this module if 
 * DLIST_INCLUDE_DEBUG_CODE is defined. To run it, use the cmd test_dlist and 
 * inspect the functions testdll1 & testdll2 to see what it's doing, and inspect 
 * dlist_iterate to see what keys to press to step through the test.  The 
 * contents of the "test list" are displayed on the cmd line as you step through 
 * the test  - use the ENTER key (see dlist_iterate) to step to the next part of
 * the test. 
 *  
 * dlist_iterate iterates through a list, calling the supplied callback function
 * for each item in the list.  Look at the debug function dlist_callback2 to see 
 * how it uses dlist_getp to access the data stored in a list item. 
 * dlist_iterate_default_callback is a default callback function that displays a 
 * list item on the cmd line.  The item needs to be a string or be convertible 
 * to a string. 
 *  
 *  
 *  
 * The following functions are provided. 
 *  
 * << list creation >> 
 * ===================
 * void dlist_construct(dlist & dl, int nmax, boolean overwritef)
 * void dlist_reset(dlist & dl)
 * dlist_iterator dlist_iterator_new(dlist & dl, dlist_node_handle x = -1)
 * void dlist_invalidate_iterator(dlist_iterator & iter)
 *  
 *  
 * << add/remove list items >> 
 * ===========================
 * boolean dlist_push_front(dlist & dl, typeless & val)
 * boolean dlist_push_back(dlist & dl, typeless & val)
 * void dlist_pop_front(dlist & dl)
 * void dlist_pop_back(dlist & dl)
 * void dlist_move_to_front(dlist_iterator iter)
 * void dlist_erase(dlist_iterator & iter)
 * boolean dlist_insert(dlist_iterator iter, typeless & val)
 *  
 *  
 * << iterator manipulation >> 
 * ===========================
 * dlist_iterator dlist_begin(dlist & dl)
 * dlist_iterator dlist_end(dlist & dl)
 * boolean dlist_iterator_end(dlist_iterator & dl)
 * boolean dlist_iterator_begin(dlist_iterator & dl)
 * boolean dlist_prev(dlist_iterator & iter, int steps = 1)
 * boolean dlist_next(dlist_iterator & iter, int steps = 1)
 *  
 *  
 * << access list item data >> 
 * ===========================
 * typeless * dlist_getp(dlist_iterator & iter)
 * typeless * dlist_get_at(dlist_iterator iter, int steps)           (untested!)
 * boolean dlist_getp_next(dlist_iterator & iter, typeless * & dp)   (untested!)
 * boolean dlist_getp_prev(dlist_iterator & iter, typeless * & dp)   (untested!)
 *  
 *  
 * << query functions >> 
 * =====================
 * int dlist_get_distance(dlist_iterator iter, boolean backwards = false)
 * int dlist_size(dlist & dl)
 * boolean dlist_is_empty(dlist & dl)
 * boolean dlist_query_full(dlist & dl)
 * boolean dlist_iterator_at_end(dlist_iterator & dl)
 * boolean dlist_iterator_at_start(dlist_iterator & dl)
 * boolean dlist_iter_valid(dlist_iterator iter)
 *  
 *  
 * << iterate and search functions >>
 * ==================================
 * void dlist_iterate(dlist_iterator & iter, _str callback_name = 'dlist_iterate_default_callback', 
 *           boolean auto_iterate = false, boolean backwards = false, boolean quiet = false)
 * 
 * boolean dlist_iterate_list(dlist & dl, _str callback_name = 'dlist_iterate_default_callback', 
 *                         boolean auto_iterate = false, boolean backwards = false, boolean quiet = false)
 * 
 * boolean dlist_find(dlist_iterator & iter, typeless & val)
 * boolean dlist_find2(dlist & dl, typeless & val)
 *  
 * 
******************************************************************************/

typedef int dlist_node_handle;

struct dlist_node {
   int s_next;
   int s_prev;
   typeless s_data;
};

struct dlist {
   int s_head;   
   int s_tail;
   int max_nodes;
   boolean overwrite_f;
   dlist_node nodes[];
   int free_head;
   int free_count;
};

struct dlist_iterator {
   dlist * listptr;
   dlist_node_handle hndl;
};


// create a new list with nmax max nodes
void dlist_construct(dlist & dl, int nmax, boolean overwritef)
{
   dl.nodes._makeempty();
   dl.s_head = dl.s_tail = -1;
   dl.max_nodes = nmax;
   dl.overwrite_f = overwritef;
   dl.free_head = -1;
   dl.free_count = 0;
}


// make the list empty
void dlist_reset(dlist & dl)
{
   dlist_construct(dl, dl.max_nodes, dl.overwrite_f);
}

// return a list iterator referring to the item with handle x
dlist_iterator dlist_iterator_new(dlist & dl, dlist_node_handle x = -1)
{
   dlist_iterator iter;
   iter.listptr = &dl;
   iter.hndl = x;
   return iter;
}

// invalidate the iterator
void dlist_invalidate_iterator(dlist_iterator & iter)
{
   iter.hndl = -1;
}

// return true if the iterator is valid
boolean dlist_iter_valid(dlist_iterator iter)
{
   return iter.hndl >= 0  &&  iter.hndl < iter.listptr->nodes._length() && 
          iter.listptr->nodes[iter.hndl].s_prev > -2;
}


static void delink_node(dlist & dl, int nodex)
{
   int nextn = dl.nodes[nodex].s_next;
   int prevn = dl.nodes[nodex].s_prev;

   if ( (prevn < -1 || prevn > dl.nodes._length()) ||
        (nextn < -1 || nextn > dl.nodes._length()) ) {
      dlist_reset(dl);
      return;   // throw exception!
   }

   // adjust the node before this
   if (prevn >= 0) {
      dl.nodes[prevn].s_next = nextn;
   }
   else {
      // no previous node, this is the head
      dl.s_head = nextn;
   }

   // adjust the node after this
   if (nextn >= 0) {
      dl.nodes[nextn].s_prev = prevn;
   }
   else {
      // no next node, this is the tail
      dl.s_tail = prevn;
   }
}


static insert_at_front(dlist & dl, int nodex)
{
   dl.nodes[nodex].s_next = dl.s_head;
   dl.nodes[nodex].s_prev = -1;  // this node is first
   if (dl.s_head >= 0) {
      dl.nodes[dl.s_head].s_prev = nodex;
   }
   else {
      // list was empty, adjust tail
      dl.s_tail = nodex;
   }
   dl.s_head = nodex;
}


static void insert_at_back(dlist & dl, int nodex)
{
   dl.nodes[nodex].s_prev = dl.s_tail;
   dl.nodes[nodex].s_next = -1;  // this node is last
   if (dl.s_tail >= 0) {
      dl.nodes[dl.s_tail].s_next = nodex;
   }
   else {
      // list was empty, adjust head
      dl.s_head = nodex;
   }
   dl.s_tail = nodex;
}


// move the item referred to by iter to the front of the list
void dlist_move_to_front(dlist_iterator iter)
{
   if (iter.hndl >= 0) {
      delink_node(*iter.listptr, iter.hndl);
      insert_at_front(*iter.listptr, iter.hndl);
   }
}


static void move_to_free_list(dlist & dl, int nodex)
{
   if (nodex < 0) {
      return;
   }
   delink_node(dl, nodex);
   dl.nodes[nodex].s_next = dl.free_head;
   dl.nodes[nodex].s_prev = -2;  // free list is singly linked
   dl.free_head = nodex;
   ++dl.free_count;
}


// return true if the list is full
boolean dlist_query_full(dlist & dl)
{
   if (dl.free_head >= 0) {
      return false;
   }
   return dl.nodes._length() >= dl.max_nodes;
}


static int dlist_get_new_node(dlist & dl, boolean front)
{
   int nnode = dl.free_head;
   if (nnode >= 0) {
      dl.free_head = dl.nodes[nnode].s_next;
      --dl.free_count;
      return nnode;
   } 
   else 
   {
      // nothing in the free list, see if we can allocate a new node
      nnode = dl.nodes._length();
      if (nnode >= dl.max_nodes) {
         // can't allocate a new one, can we overwrite
         if (!dl.overwrite_f) {
            return -1;
         }
         nnode = front ? dl.s_tail : dl.s_head;
         delink_node(dl, nnode);
      }
      return nnode;
   }
   return 0;
}


// return true if val is successfully added to the front of the list
boolean dlist_push_front(dlist & dl, typeless & val)
{
   int nnode = dlist_get_new_node(dl, true);
   if (nnode < 0) {
      return false;
   }
   insert_at_front(dl, nnode);
   dl.nodes[nnode].s_data = val;
   return true;
}


// return true if val is successfully added to the end of the list
boolean dlist_push_back(dlist & dl, typeless & val)
{
   int nnode = dlist_get_new_node(dl, false);
   if (nnode < 0) {
      return false;
   }
   insert_at_back(dl, nnode);
   dl.nodes[nnode].s_data = val;
   return true;
}


// remove the first item in the list, if any
void dlist_pop_front(dlist & dl)
{
   move_to_free_list(dl,dl.s_head);
}


// remove the last item in the list, if any
void dlist_pop_back(dlist & dl)
{
   move_to_free_list(dl, dl.s_tail);
}


// Return the distance the item referred to by "it" is from the start (or end)
// The first item in the list is a distance of "1" from the start.
int dlist_get_distance(dlist_iterator iter, boolean backwards = false)
{
   dlist * dl = iter.listptr;
   int dist = 1;
   int mx = dl->nodes._length();
   int sx = iter.hndl;
   int x = backwards ? dl->s_tail : dl->s_head;
   if (sx < 0 || sx >= dl->nodes._length()) {
      return 0;  // it is invalid
   }
   while (x >= 0) {
      if (sx == x) {
         return dist;
      }
      if (++dist > mx || x >= mx) {
         return -1;
      }
      x = (backwards ? dl->nodes[x].s_prev : dl->nodes[x].s_next);
   }
   return 0;
}


// If the iterator is invalid on entry, then it goes to the end of the list.
// If the iterator is already at the start of the list then it is made invalid.
boolean dlist_prev(dlist_iterator & iter, int steps = 1)
{
   dlist * dl = iter.listptr;
   int sx = iter.hndl;
   if (sx < 0) {
      sx = dl->s_tail;
      steps -= 1;
   }
   while (--steps >= 0) {
      if (sx < 0) {
         break;
      }
      sx = dl->nodes[sx].s_prev;
   }
   iter.hndl = sx;
   return sx >= 0;
}


// If the iterator is invalid on entry, then it goes to the start of the list.
// If the iterator is already at the end of the list then it is made invalid.
boolean dlist_next(dlist_iterator & iter, int steps = 1)
{
   dlist * dl = iter.listptr;
   int sx = iter.hndl;
   if (sx < 0) {
      sx = dl->s_head;
      steps -= 1;
   }
   while (--steps >= 0) {
      if (sx < 0) {
         break;
      }
      sx = dl->nodes[sx].s_next;
   }
   iter.hndl = sx;
   return sx >= 0;
}


// return true if pointing at the last item in the list.
// Assumes the iterator is valid and the list isn't empty.
boolean dlist_iterator_at_end(dlist_iterator & dl)
{
   return dl.hndl == dl.listptr->s_tail;
}


// return true if pointing at the first item in the list.
// Assumes the iterator is valid and the list isn't empty.
boolean dlist_iterator_at_start(dlist_iterator & dl)
{
   return dl.hndl == dl.listptr->s_head;
}


// return an iterator to the first item in the list
dlist_iterator dlist_begin(dlist & dl)
{
   return dlist_iterator_new(dl, dl.s_head);
}


// return an iterator to the last item in the list
dlist_iterator dlist_end(dlist & dl)
{
   return dlist_iterator_new(dl, dl.s_tail);
}


// assign the referenced iterator to the last item in the list
// return false if the list is empty
boolean dlist_iterator_end(dlist_iterator & dl)
{
   dl = dlist_end(*dl.listptr);
   return dlist_iter_valid(dl);
}


// assign the referenced iterator to the first item in the list
// return false if the list is empty
boolean dlist_iterator_begin(dlist_iterator & dl)
{
   dl = dlist_begin(*dl.listptr);
   return dlist_iter_valid(dl);
}


// return a pointer to the data of the list entry referenced by iter
typeless * dlist_getp(dlist_iterator & iter)
{
   if (dlist_iter_valid(iter)) {
      return &iter.listptr->nodes[iter.hndl].s_data;
   }
   return null;
}

#if 0
// next 3 functions are untested

 
// return a pointer to the data of the list entry referenced by (iter + steps)
typeless * dlist_get_at(dlist_iterator iter, int steps)
{
   if (steps < 0) {
      if (dlist_prev(iter, -steps)) {
         return &iter.listptr->nodes[iter.hndl].s_data;
      }
      return null;
   }
   if (dlist_next(iter, steps)) {
      return &iter.listptr->nodes[iter.hndl].s_data;
   }
   return null;
}


// return a pointer to the data of the list entry referenced by (iter + 1)
boolean dlist_getp_next(dlist_iterator & iter, typeless * & dp)
{
   if (dlist_next(iter)) {
      dp = dlist_getp(iter);
      if (dp != null) {
         return true;
      }
   }
   return false;
}


// return a pointer to the data of the list entry referenced by (iter - 1)
boolean dlist_getp_prev(dlist_iterator & iter, typeless * & dp)
{
   if (dlist_prev(iter)) {
      dp = dlist_getp(iter);
      if (dp != null) {
         return true;
      }
   }
   return false;
}
#endif


// remove the entry referenced by iter.  On exit, the supplied iterator refers 
// to the next item in the list after the item that was erased.
void dlist_erase(dlist_iterator & iter)
{
   if (dlist_iter_valid(iter)) {
      int x = iter.hndl;
      dlist_next(iter);
      delink_node(*iter.listptr, x);
      move_to_free_list(*iter.listptr, x);
   }
}


// dlist_size returns the number of items in the list
int dlist_size(dlist & dl)
{
   return dl.nodes._length() - dl.free_count;
}


// dlist_is_empty returns true if the list is empty
boolean dlist_is_empty(dlist & dl)
{
   return dl.s_head < 0;
}


// dlist_insert inserts after the node referred to by iter. If iter, or
// the node it refers to are invalid, the value is inserted at the front of
// the list. 
boolean dlist_insert(dlist_iterator iter, typeless & val)
{
   dlist_node * np;
   if (iter.hndl < 0 || iter.hndl >= iter.listptr->nodes._length() || iter.listptr->nodes[iter.hndl].s_prev < -1) {
      // if the dereference (*) creates a (large) temporary list object here,
      // the push_front will fail!
      return dlist_push_front(*iter.listptr, val);
   }
   int nnode = dlist_get_new_node(*iter.listptr, true);
   if (nnode < 0) {
      return false;
   }
   np = &iter.listptr->nodes[iter.hndl];
   int nextn = np->s_next;
   iter.listptr->nodes[nnode].s_next = nextn;
   if (nextn < 0 || nextn >= iter.listptr->nodes._length()) {
      // there is no (valid) next node so make the new node the tail
      iter.listptr->s_tail = nnode;
   }
   else {
      // link to the next node
      iter.listptr->nodes[nextn].s_prev = nnode;
   }
   // link to the prev node
   iter.listptr->nodes[nnode].s_prev = iter.hndl;
   np->s_next = nnode;
   // copy the value
   iter.listptr->nodes[nnode].s_data = val;
   return true;
}



#define QM_QQM 0     // query quietly message
#define QM_SQON 1    // set quietly on
#define QM_SQOFF 2   // set quietly off
#define QM_QQMB 3    // query quietly msg box
#define QM_IQMB 4    // ignore quietly msg box


static void qmessage(_str str, int quiet = 0)
{
   static boolean quietly;
   if (quiet == QM_SQON) {
      quietly = true;
   } else if (quiet == QM_SQOFF) {
      quietly = false;
   } else if ((quiet == QM_QQMB && !quietly) || quiet == QM_IQMB) {
      _message_box(str);
      return;
   }
   if (!quietly) {
      message(str);
   }
}


// negative numbers reserved for caller
#define LIST_CALLBACK_PROCESS_ITEM 0
#define LIST_CALLBACK_ERROR 1
#define LIST_CALLBACK_RESET 2
#define LIST_CALLBACK_INIT 3
#define LIST_CALLBACK_INIT2 4
#define LIST_CALLBACK_DONE 5


int dlist_iterate_default_callback(int cmd, dlist_iterator & iter)
{
   if (cmd == LIST_CALLBACK_ERROR) {
      dlist_reset(*iter.listptr);
      qmessage('List error, resetting',QM_QQMB);
      return 0;
   }

   if (cmd == LIST_CALLBACK_RESET) {
      dlist_reset(*iter.listptr);
      qmessage('Resetting list');
      return 0;
   }

   if (cmd == LIST_CALLBACK_PROCESS_ITEM) {
      // not quietly
      message('List item ' :+ *dlist_getp(iter) :+ ' Handle ' :+ iter.hndl :+ 
                 ' Pos ' :+ dlist_get_distance(iter));
      return 0;
   }
   return 0;
}


/*******************************************************************************
 * dlist_iterate 
 *  
 * Allows iterating through a list either one entry at a time when the LEFT 
 * RIGHT keys are pressed, or automatically through the entire list. The 
 * callback function is called for each item in the list.  The first param to 
 * the callback function is the callback type, the second param is an iterator 
 * to the list item being processed. 
 *  
 * Pressing C-S-END twice makes the list empty. 
 * Pressing ESC exits and restores the cursor line/buffer to where it was 
 * on entry .  Pressing ENTER exits without restoring the cursor. 
 ******************************************************************************/
void dlist_iterate(dlist_iterator & iter, _str callback_name = 'dlist_iterate_default_callback', 
          boolean auto_iterate = false, boolean backwards = false, boolean quiet = false)
{
   int lpos,k;
   int start_line = _mdi.p_child.p_line;
   int start_buf_id = _mdi.p_child.p_buf_id;
   int start_col = _mdi.p_child.p_col;
   int kill_list = 0;

   dlist * listptr = iter.listptr;

   qmessage('', quiet ? 1 : 2);  // initialize quietly!

   int cbindex = find_index(callback_name, PROC_TYPE);
   if (cbindex <= 0) {
      qmessage('Call back function "' :+ callback_name :+ '" not found', QM_QQMB);
      return;
   }

   if (!auto_iterate) 
      call_index(LIST_CALLBACK_INIT, iter, cbindex);

   while (true) {
      if (!dlist_iter_valid(iter)) {
         if (!(backwards ? dlist_iterator_end(iter) : dlist_iterator_begin(iter))) {
            qmessage('List empty');
            return;
         }
      }

      if (auto_iterate) {
         // step through the list with no event loop
         while (1) {
            k = call_index(LIST_CALLBACK_PROCESS_ITEM, iter, cbindex);
            if (k < 0) {
               return;
            }
            if (backwards){
               if (!dlist_prev(iter))
                   return;
            } else {
               if (!dlist_next(iter))
                  return;
            }
         }
      }

      lpos = dlist_get_distance(iter, backwards);
      if (lpos <= 0) {
         // something is wrong, tell the caller
         call_index(LIST_CALLBACK_ERROR, iter, cbindex);
         return;
      }
      k = call_index(LIST_CALLBACK_PROCESS_ITEM, iter, cbindex);
      if (k == -1) {
         return;
      }

      _str key = get_event('N');   // refresh screen and get a key
      _str keyt = event2name(key);

      switch (keyt) {
         case 'UP' :
         case 'RIGHT' :
            if (!dlist_next(iter))
               dlist_iterator_begin(iter);
            break;

         case 'DOWN' :
         case 'LEFT' :
            if (!dlist_prev(iter))
               dlist_iterator_end(iter);
            break;

         case 'C-S-END' :
            // press twice for user requested list reset
            if (kill_list > 0) {
               call_index( LIST_CALLBACK_RESET, iter, cbindex);
            }
            else {
               kill_list += 2;
            }
            break;
            // fall through
         case 'ESC' :
            edit('+Q +BI ' :+ start_buf_id);
            _mdi.p_child.p_line = start_line;
            _mdi.p_child.p_col = start_col;
            return;
         case 'ENTER' :
            return;
         default:
            break;
      }
      if (kill_list > 0) {
         --kill_list;
      }
   }
}


// dlist_iterate_list is same as dlist_iterate except a ref to a list is passed
// instead of an iterator.
boolean dlist_iterate_list(dlist & dl, _str callback_name = 'dlist_iterate_default_callback', 
                        boolean auto_iterate = false, boolean backwards = false, boolean quiet = false)
{
   dlist_iterator iter = dlist_iterator_new(dl); 
   dlist_iterate(iter, callback_name, auto_iterate, backwards, quiet);
   return dlist_iter_valid(iter);
}


// dlist_find searches the list from the start, looking for val.
// If found, the return value is true and iter refers to the found item.
boolean dlist_find(dlist_iterator & iter, typeless & val)
{
   dlist_invalidate_iterator(iter);
   while (dlist_next(iter)) {
      if (*dlist_getp(iter) == val)
         return true;
   }
   return false;
}


// dlist_find2 returns true if val is in the list
boolean dlist_find2(dlist & dl, typeless & val)
{
   dlist_iterator ab = dlist_iterator_new(dl);
   while (dlist_next(ab)) {
      if (*dlist_getp(ab) == val)
         return true;
   }
   return false;
}



//============================================================================
//   Optional debug code follows
//============================================================================

#define DLIST_INCLUDE_DEBUG_CODE

#ifdef DLIST_INCLUDE_DEBUG_CODE


static int nlist[];


// copy the items in the linked list to an ordered array
// the last item in the list becomes the first array element
int dlist_callback2(int cmd, dlist_iterator & iter = null)
{
   if (cmd == LIST_CALLBACK_INIT) {
      nlist._makeempty();
      return -2;
   }
   if (cmd == LIST_CALLBACK_PROCESS_ITEM) {
      if (nlist._length() < 20) {
         nlist[nlist._length()] = *dlist_getp(iter);
         return 0;
      }
      else{
         qmessage(' too big ', QM_IQMB);
         return -1;
      }
   }

   if (cmd == LIST_CALLBACK_DONE) {
      _str str2 = 'Press any key : ';
      int k = 0;
      while (k < nlist._length()) {
         str2 = str2 :+ nlist[k++] :+ ' ';
      }
      messageNwait(str2);  
      return 0;
   }
   return 0;
}

static dlist_iterate_l2(dlist & dl, _str callback_name, boolean auto_iterate = true, 
                             boolean backwards = false, boolean quiet = false)
{
   dlist_callback2(LIST_CALLBACK_INIT);
   dlist_iterate_list(dl,callback_name, auto_iterate, backwards, quiet);
   dlist_callback2(LIST_CALLBACK_DONE);
}


static void testdll1() 
{
   dlist mylist;
   dlist_iterator iter;

   // create the list 'mylist' with max 9 nodes and no overwrite
   dlist_construct(mylist, 11, false);
   // cycle thru empty list
   dlist_iterate_list(mylist, 'dlist_iterate_default_callback');

   // push 21 at the end of the list
   dlist_push_back(mylist,21);
   // use up / down to cycle through the list
   dlist_iterate_list(mylist, 'dlist_iterate_default_callback');

   // push 22 at the end of the list
   dlist_push_back(mylist,22);
   dlist_iterate_list(mylist, 'dlist_iterate_default_callback');

   // push 23 and 24
   dlist_push_back(mylist,23);
   dlist_push_back(mylist,24);
   dlist_iterate_list(mylist, 'dlist_iterate_default_callback');

   // push 25 26 27 28 to fill the list
   dlist_push_back(mylist,25);
   dlist_push_back(mylist,26);
   dlist_push_back(mylist,27);
   dlist_push_back(mylist,28);
   dlist_iterate_list(mylist, 'dlist_iterate_default_callback');

   iter = dlist_iterator_new(mylist);
   dlist_insert(iter,101);
   dlist_find(iter, 25);
   dlist_insert(iter,35);
   dlist_find(iter, 35);
   dlist_insert(iter,45);
   dlist_find(iter, 28);
   dlist_insert(iter,38);
   dlist_iterate_list(mylist, 'dlist_iterate_default_callback');

   if (dlist_push_back(mylist,29))  // should fail
      qmessage('overwrite not working',QM_IQMB);

   if (dlist_push_front(mylist,29))  // should fail
      qmessage('overwrite not working',QM_IQMB);

   dlist_pop_front(mylist);
   dlist_iterate_l2(mylist, 'dlist_callback2');

   dlist_pop_back(mylist);
   dlist_iterate_l2(mylist, 'dlist_callback2');

   dlist_iterator x = dlist_begin(mylist);
   dlist_next(x);
   dlist_erase(x);
   dlist_iterate_l2(mylist, 'dlist_callback2');

   x = dlist_end(mylist);
   dlist_prev(x);
   dlist_erase(x);
   dlist_iterate_l2(mylist, 'dlist_callback2');

   dlist_pop_front(mylist);
   dlist_pop_front(mylist);
   dlist_pop_front(mylist);
   dlist_iterate_l2(mylist, 'dlist_callback2');

   dlist_pop_front(mylist);
   dlist_iterate_l2(mylist, 'dlist_callback2');

   dlist_push_back(mylist,141);
   dlist_push_back(mylist,142);
   dlist_push_back(mylist,143);
   dlist_push_back(mylist,144);
   dlist_push_back(mylist,145);
   dlist_push_back(mylist,146);
   dlist_iterate_l2(mylist, 'dlist_callback2');

   dlist_iterator dli = dlist_iterator_new(mylist);
   if (dlist_find(dli, 147)) {
      message('yes');
   }
   else
      message('no');
}



static void testdll2() 
{
   dlist mylist;

   // create the list 'mylist' with max 4 nodes with overwrite
   dlist_construct(mylist, 4, true);
   // cycle thru empty list
   dlist_iterate_l2(mylist, 'dlist_callback2', true, false);
   // push 21 at the end of the list
   dlist_push_front(mylist,'a1');
   // use up / down to cycle through the list
   dlist_iterate_l2(mylist, 'dlist_callback2', true, false);

   // mixed data types
   dlist_push_front(mylist,32);
   dlist_iterate_l2(mylist, 'dlist_callback2', true, false);

   dlist_push_front(mylist,'a3');
   dlist_push_front(mylist,'a4');
   dlist_iterate_l2(mylist, 'dlist_callback2', true, false);
   // overwrite 
   dlist_push_front(mylist,'a5');
   dlist_iterate_l2(mylist, 'dlist_callback2', true, false);

   dlist_push_front(mylist,'a6');
   dlist_push_front(mylist,'a7');
   dlist_push_front(mylist,'a8');
   dlist_iterate_l2(mylist, 'dlist_callback2', true, false);
   dlist_pop_back(mylist);
   dlist_iterate_l2(mylist, 'dlist_callback2', true, false);
   dlist_pop_front(mylist);
   dlist_iterate_l2(mylist, 'dlist_callback2', true, false);
   dlist_pop_front(mylist);
   dlist_pop_front(mylist);
   dlist_iterate_l2(mylist, 'dlist_callback2', true, false);
   dlist_push_back(mylist,'a9');
   dlist_iterate_l2(mylist, 'dlist_callback2', true, false);
   dlist_pop_back(mylist);
   dlist_iterate_l2(mylist, 'dlist_callback2', true, false);
}




_command void test_dlist(int cmd = 1) name_info(',')
{
   switch (cmd) {
      case 1 : testdll1(); return;
      case 2 : testdll2(); return;
//      case 3 : testdll3(); return;
   }
}


// end of dlist debug code
#endif
