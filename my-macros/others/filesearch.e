#pragma option (strict,on)
#include "slick.sh"
//#include "jhelper.sh"


/*+-------------------------------------------------------------------------*
 * j_edit_path
 *
 *
 *--------------------------------------------------------------------------*/

typeless j_edit_path (
    _str    command,                    /* I:command to execute against files*/
    _str    filelist,                   /* I:file specifiers                */
    _str    directories,                /* I:PATH-style list of directories */
    _str    env_var_list,               /* I:PATH-style list of env vars    */
    boolean fCheckCurrentProject,       /* I:search the current project?    */
    boolean fMultiSelect,               /* I:allow multiple selection?      */
    boolean fShowError = true)          /* I:display error on "not found"?  */
{
    _str list = '';
    _str original_filelist = filelist;

    while (filelist != '')
    {
        _str file;
        parse filelist with file filelist;

        list = list " " j_search_path (file,
                                       directories,
                                       env_var_list,
                                       fCheckCurrentProject,
                                       fMultiSelect);
    }

    if (list == '')
    {
        if (fShowError)
            message ('No files found matching "' original_filelist '"');

        return (FILE_NOT_FOUND_RC);
    }

    return (execute (command " " list));
}


/*+-------------------------------------------------------------------------*
 * j_search_path
 *
 * Searches in various locations for the specified file.
 *--------------------------------------------------------------------------*/

_str j_search_path (
    _str    file,                       /* I:file specification             */
    _str    directories,                /* I:PATH-style list of directories */
    _str    env_var_list,               /* I:PATH-style list of env vars    */
    boolean fCheckCurrentProject,       /* I:search the current project?    */
    boolean fMultiSelect)               /* I:allow multiple selection?      */
{
    _str files[];

    /*
     * get matching project files, if requested
     */
    if (fCheckCurrentProject)
        j_append_files_from_project_to_array (files, file);

    /*
     * get matching files in the given directory list
     */
    j_append_files_from_path_to_array (files, file, directories);

    /*
     * for each environment variable, get the matching files in its path
     */
    while (env_var_list != '')
    {
        _str env_var;
        parse env_var_list with env_var ';' env_var_list;
        j_append_files_from_environment_to_array (files, file, env_var);
    }

    /*
     * make all the names fully qualified, so j_remove_array_duplicates can
     * do a more thorough job
     */
    j_fully_qualify_filenames_in_array (files);

    /*
     * make filenames relative to the current directory
     */
    j_relativize_filenames_in_array (files);

    /*
     * sort the files and remove duplicates
     */
    j_remove_array_duplicates (files, false, true, 'f');

    /*
     * select the file(s)
     */
    boolean fWildcard;
    fWildcard = (pos('[\*\?]', file, 1, 'r') != 0);
    fWildcard = false;
    file      = j_choose_from_array (
                        files,          // files to choose from
                        fMultiSelect,   // select more than one?
                        fWildcard);     // show list if only one item in list?

    return (file);
}


/*+-------------------------------------------------------------------------*
 * j_fully_qualify_filenames_in_array
 *
 *
 *-----------------------------------------------------------------(jeffro)-*/
void j_fully_qualify_filenames_in_array (
    _str    (&files)[])                 /* I:array to work on               */
{
    int i;
    for (i = 0; i < files._length(); i++)
    {
        /*
         * change '/' characters to '\'
         */
        files[i] = translate (files[i], '\', '/');

        /*
         * fully qualify the filename
         */
        files[i] = absolute (files[i]);
    }
}


/*+-------------------------------------------------------------------------*
 * j_remove_array_duplicates
 *
 * Removes the duplicate entries in an array.  The array is sorted before
 *--------------------------------------------------------------------------*/

void j_remove_array_duplicates (
    _str    (&word_list)[],             /* I:array to work on               */
    boolean fAlreadySorted,             /* I:is the array sorted on input   */
    boolean fSortForMe,                 /* I:should we sort it?             */
    _str    sort_options)               /* I:sort options                   */
{
    /*
     * if we're asked to, sort the array
     */
    if (fSortForMe)
    {
        word_list._sort (sort_options);

        /*
         * remember that it's sorted now
         */
        fAlreadySorted = true;
    }

    /*
     * if it's sorted, things are easier
     */
    if (fAlreadySorted)
    {
        int iUnique = 0;

        while (iUnique+1 < word_list._length())
        {
            if (file_eq (word_list[iUnique], word_list[iUnique+1]))
                word_list._deleteel (iUnique+1);
            else
                iUnique++;
        }
    }

    /*
     * otherwise, do things the hard way
     */
    else
    {
        _message_box ("Can't remove duplicates from an unsorted array",
                      "j_remove_array_duplicates");
    }
}


/*+-------------------------------------------------------------------------*
 * j_append_files_from_environment_to_array
 *
 * Searches the path specified by the given environment variable for all
 * files matching the given file specifier.  All matching files are appended
 * to the file list.
 *
 * Returns the number of files in the file list.
 *--------------------------------------------------------------------------*/

int j_append_files_from_environment_to_array (
    _str    (&files)[],                 /* o:array to append to             */
    _str    filespec,                   /* i:file specifier (maybe wildcard)*/
    _str    env_var)                    /* i:environment var specifying path*/
{
    return (j_append_files_from_path_to_array(files, filespec, get_env(env_var)));
}


/*+-------------------------------------------------------------------------*
 * j_append_files_from_path_to_array
 *
 * Searches the supplied path for all files matching the given file
 * specifier.  All matching files are appended to the file list.
 *
 * Returns the number of files in the file list.
 *--------------------------------------------------------------------------*/

int j_append_files_from_path_to_array (
    _str    (&files)[],                 /* o:array to append to             */
    _str    filespec,                   /* i:file specifier (maybe wildcard)*/
    _str    path)                       /* i:path to search ("dir1;dir2")   */
{
    while (path != '')
    {
        _str directory;
        parse path with directory ';' path;

        if (directory != "")
            j_append_files_from_directory_to_array(files, filespec, directory);
    }

    return (files._length());
}


/*+-------------------------------------------------------------------------*
 * j_append_files_from_directory_to_array
 *
 * Searches the supplied directory for all files matching the given file
 * specifier.  All matching files are appended to the file list.
 *
 * Returns the number of files in the file list.
 *--------------------------------------------------------------------------*/

int j_append_files_from_directory_to_array (
    _str    (&files)[],                 /* o:array to append to             */
    _str    filespec,                   /* i:file specifier (maybe wildcard)*/
    _str    directory)                  /* i:directory to search            */
{
    /*
     * make sure that a directory or drive specifier terminates the
     * directory string
     */
    _str last_char = substr(directory,length(directory),1);

    if (last_char!='\' && last_char!=':')
        directory = directory :+ '\';

    /*
     * find the first matching file, excluding directories and prefix matches
     */
    _str filename;
    filespec = '"' directory filespec '"';
    filename = file_match (filespec' -d -p', 1);

    while (filename != "")
    {
        /*
         * Append the file to the file list.  Note that files must have
         * been declared by the caller (i.e. "_str files[];") or a Slick-C
         * error will occur on files._length().
         */
        files[files._length()] =     filename;

        /*
         * find the next matching file
         */
        filename = file_match (filename, 0);
    }

    return (files._length());
}


/*+-------------------------------------------------------------------------*
 * j_append_files_from_project_to_array
 *
 * Searches the currently active project for all files matching the given
 * file specifier.  All matching files are appended to the file list.  If
 * there isn't an active project, the array is unchanged.
 *
 * Returns the number of files in the file list.
 *--------------------------------------------------------------------------*/

int j_append_files_from_project_to_array (
    _str    (&files)[],                 /* o:array to append to             */
    _str    filespec)                   /* i:file specifier (maybe wildcard)*/
{

    /*
     * Load the [files] section of the project file into a temporary
     * view.  If that fails (probably because there isn't a project open),
     * we'll short out.
     */
    int orig_view_id, temp_view_id;
    get_view_id (orig_view_id);

    int status = GetProjectFiles (_project_get_filename(),
                                  temp_view_id,
                                  "",
                                  null,
                                  "",
                                  true,
                                  false /*fFullyQualifyFilenames*/);

    if (status)
        return (files._length());

    /*
     * activate the view with the [files] section in it
     */
    activate_view (temp_view_id);
    top();

    if (p_Noflines == 0)
    {
        _delete_temp_view (temp_view_id, true);
        activate_view (orig_view_id);
        return (files._length());
    }

    /*
     * set up searching options: no error message, ignore case
     */
    _str search_opts = '@iw';

    /*
     * translate filespec wildcards (if any) into regular expressions
     */
    if (iswildcard (filespec))
    {
        _str re_filespec = '';

        int i;
        for (i = 1; i <= length(filespec); i++)
        {
            _str ch = substr (filespec, i, 1);

            switch (ch)
            {
                /*
                 * maximal match of zero or more occurences of any character
                 * except \
                 */
                case '*':
                    re_filespec = re_filespec '[~\\]@';
                    break;

                /*
                 * minimal match of at least 0 but not more than 1 occurence
                 * of any character
                 */
                case '?':
                    re_filespec = re_filespec '?:*0,1';
                    break;

                default:
                    re_filespec = re_filespec ch;
                    break;
            }
        }

        filespec    = re_filespec;
        search_opts = search_opts 'r';
    }

    /*
     * save the existing search state and search for the first matching file
     */
    typeless orig_string, orig_flags, orig_word_re, orig_reserved;
    save_search(orig_string, orig_flags, orig_word_re, orig_reserved);
//    JSearchState oldsearch = jsave_search();
    status = search (filespec, search_opts);

    while (status == 0)
    {
        /*
         * get the current line and append it to the array of files
         */
        _str filename = jget_line ();
        end_line ();

        /*
         * if the project file still exists in the file system, add it to the array
         */
        if (jfile_exists (filename))
            files[files._length()] = filename;

        /*
         * look for the next match
         */
        status = repeat_search (search_opts);
    }

    /*
     * restore the original search state and view
     */
    restore_search(orig_string, orig_flags, orig_word_re, orig_reserved);
//    jrestore_search (oldsearch);
    _delete_temp_view (temp_view_id, true);
    activate_view (orig_view_id);

    return (files._length());
}


/*+-------------------------------------------------------------------------*
 * j_choose_from_array
 *
 *
 *--------------------------------------------------------------------------*/

_str j_choose_from_array (
    _str    (&files)[],                 /* i:array to choose files from     */
    boolean fMultiSel,                  /* i:choose more than one file?     */
    boolean fShowListForSingleFile=false)   /* i:show the list even if there's only one choice? */
{
    _str file, title;
    int flags;

    switch (files._length())
    {
        case 0:
            file = '';
            break;

        case 1:
            if (!fShowListForSingleFile)
            {
                file = maybe_quote_filename (files[0]);
                break;
            }
            /* fall through to default case */

        default:
            if (fMultiSel)
            {
                title = "Select one or more files";
                flags = SL_SELECTCLINE |
                        SL_ALLOWMULTISELECT | SL_SELECTALL | SL_INVERT;
            }
            else
            {
                title = "Select a file";
                flags = SL_SELECTCLINE;
            }

            file = show ("_sellist_form -mdi -modal",
                         nls(title), flags, files);
        
            /*
             * With SL_MULTISELECT, returned items that contain spaces will be
             * surrounded with quotes; without it, it won't.  We always want items
             * containing spaces to be surrounded with quotes so put them there if
             * necessary
             */
            if (!fMultiSel)
                file = maybe_quote_filename (file);

            break;
    }

    return (file);
}


/*+-------------------------------------------------------------------------*
 * j_relativize_filenames_in_array
 *
 * If a filename in the array begins with the current working directory,
 * the current working directory is stripped from the filename.
 *--------------------------------------------------------------------------*/
void j_relativize_filenames_in_array(_str (&files)[])
{
#if 1   // manual way
#if 0        //*----------------------< jeffro >----------------------------*/
    current_dir        = getcwd() '\';
    current_dir_length = length(current_dir);
#endif       //*----------------------< jeffro >----------------------------*/

    int i;
    for (i = 0; i < files._length(); i++)
    {
        files[i] = jrelative (files[i]);
#if 0        //*----------------------< jeffro >----------------------------*/
        if (substr(files[i],1,current_dir_length) == current_dir)
        {
            files[i] = substr(files[i],current_dir_length+1);
        }
#endif       //*----------------------< jeffro >----------------------------*/
    }
#else
    /*
     * This looks handy, but doesn't give us the result we want.  If the file
     * is, say, in the directory above the current directory, it'll result
     * in "..\file.ext", instead of leaving it fully-qualified.
     */
    for (i = 0; i < files._length(); i++)
    {
        files[i] = relative (files[i]);
    }
#endif
}


/*+-------------------------------------------------------------------------*
 * jtest
 *
 *
 *--------------------------------------------------------------------------*/

_command jtest()
{
    _str t[];
    t[0]="Item 0";
    t[1]="Item 1";
    t[2]="Item 2";
    t[3]="Item 3";
    j_dump_array(t);
    j_dump_array(t, 'Here is the message prefix:');
#if 0    /*------------------------< jeffro >-------------------------------*/
    t._deleteel(2);
    // Traverse the elements in hash table
    for (i._makeempty();;) {
        t._nextel(i);
        if (i._isempty()) break;
        messageNwait("index="i" value="t[i]);
    }
#endif   /*------------------------< jeffro >-------------------------------*/

    j_append_files_from_project_to_array (t, "*?iew.cpp");
    _str file = j_choose_from_array (t, false);
    messageNwait('Picked "' file '"');
}


/*+-------------------------------------------------------------------------*
 * j_dump_array
 *
 *
 *--------------------------------------------------------------------------*/

void j_dump_array (
    _str    (&a)[],                     /* i:array to dump                  */
    _str    prefix = '')                /* i:optional message prefix        */
{
    _str text = '';

    if (prefix != '')
        text = prefix "\n";

    text = text "Array of " a._length() " items\n";

    typeless i;
    for (i._makeempty();;)
    {
        a._nextel(i);

        if (i._isempty())
            break;

        if (text != "")
            text = text "\n";

        text = text i ':  ' a[i];
    }

    _message_box (nls(text));
}
