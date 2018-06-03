//#pragma option (strict,on)
#include 'slick.sh'

_command ei() name_info(MULTI_FILE_ARG','VSARG2_NCW | VSARG2_READ_ONLY)
{
	/*
	 * PROJECT_EI_PATH is typically set using the Open command for the project.
	 * GLOBAL_EI_PATH is set in vslick.ini
	 */
    _str env_vars = \
        'project_ei_path' :+ ';' :+
        'global_ei_path'  :+ ';' :+
        '';

    boolean changed_dir = jpush_project_root_dir();

    int status = j_edit_path (
        'e',            // command
        arg(1),         // file spec
        getcwd(),       // list of directories to search
        env_vars,       // list of env vars to search
        true,           // current project?
        true,           // multi-select?
        false);         // display error?

    if (changed_dir)
        jpop_project_root_dir ();

    if (status == FILE_NOT_FOUND_RC)
        message ('No files found matching "' arg(1) '"');
}


/*+-------------------------------------------------------------------------*
 * jpush_project_root_dir
 *
 * If a project is open, changes the editor's current directory (not the
 * concurrent process's directory) to the project's root directory.  If a 
 * project is not open, no action is taken.
 * 
 * Returns true if the directory was changed, false otherwise
 *-----------------------------------------------------------------(jeffro)-*/
boolean jpush_project_root_dir()
{
    project_root_dir = jget_project_root_dir();
    changed_dir      = false;

    /*
     * make sure we're in the root directory of the project, so searching
     * the current project will work as expected
     */
    if (project_root_dir != '')
    {
        status = quiet_pushd (project_root_dir);

        if (status == 0)
            changed_dir = true;
    }

    return (changed_dir);
}


/*+-------------------------------------------------------------------------*
 * jpop_project_root_dir
 *
 * Restores the directory pushed by jpush_project_root_dir.
 *-----------------------------------------------------------------(jeffro)-*/
void jpop_project_root_dir()
{
    quiet_popd();
}


/*+-------------------------------------------------------------------------*
 * jget_project_root_dir
 *
 * Returns the directory containing the current project file.  Returns ''
 * if a project isn't open.
 *-----------------------------------------------------------------(jeffro)-*/
_str jget_project_root_dir()
{
    proj_file = _project_get_filename();

    if (proj_file == '')
        return ('');

    root_dir = substr (proj_file, 1, lastpos('\', proj_file)-1);
    return (root_dir);
}


/*+-------------------------------------------------------------------------*
 * quiet_pushd
 *
 * "pushd's" to the current directory for the editor, but not the concurrent
 * process buffer.  It also suppresses the "Current directory is xxx"
 * message.
 *-----------------------------------------------------------------(jeffro)-*/
int quiet_pushd (_str dir)
{
    cmdline = '-p ' maybe_quote_filename(dir);
    quiet   = 'quiet';

    return (pushd (cmdline, quiet));
}


/*+-------------------------------------------------------------------------*
 * quiet_popd
 *
 * Restores the directory that was current before the most recent call to
 * (quiet_)pushd, but doesn't affect the concurrent process buffer.
 * It also suppresses the "Current directory is xxx" message.
 *-----------------------------------------------------------------(jeffro)-*/
int quiet_popd ()
{
    quiet = 'quiet';
    return (popd (quiet, false /*fChangeProcessBuffer*/));
}
