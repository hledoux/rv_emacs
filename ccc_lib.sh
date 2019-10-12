# This is not a script, but a library of common routines for shell scripts (SH / BASH)
#
# The [f_console_...] functions exposed here are quite similar to the Perl ones
# defined in [PM_CCC::T_Console]
#
# By the way, ther are implemented thanks to the utility [ccc_console.pl]
#
#
# environment variable officially exposed by this API:
#
#  - CS_CONSOLE_PROGNAME   ==> basename of $0, without the suffix
#  - CS_CONSOLE_TODAY      ==> [%Y-%m-%d]
#  - CS_CONSOLE_TIMESTAMP  ==> [%Y-%m-%d-%H-%M-%S]
#  - CS_CONSOLE_BASEDIR    ==> [log/progname/today/timestamp] you can assume the directory has been created
#  - CS_CONSOLE_LOG_MAIN   ==> [basedir/progname.log]
#  - CS_CONSOLE_LOG_PAT    ==> [basedir/*.log]
#  - CS_CONSOLE_PID_FILE   ==> [log/progname/progname.pid]
#





# ********************************************************************
#  - PUBLIC API
# ********************************************************************

export CS_CONSOLE_PROGNAME=$(basename $0 .sh)



function f_console_info
{
  ccc_console.pl "$0" f_console_info "$@"
}

function f_console_usage
{
  ccc_console.pl "$0" f_console_usage "$@"
}

function f_console_separator
{
  ccc_console.pl "$0" f_console_separator "$@"
}

function f_console_start
{
  ccc_console.pl "$0" f_console_start "$@"
}

function f_console_stop
{
  ccc_console.pl "$0" f_console_stop "$@"
}

function f_console_OUTGOING_CNX
{
  ccc_console.pl "$0" f_console_OUTGOING_CNX "$@"
}

function f_console_warning
{
  ccc_console.pl "$0" f_console_warning "$@"
}

function f_console_alert
{
  ccc_console.pl "$0" f_console_alert "$@"
}

function f_console_error
{
  ccc_console.pl "$0" f_console_error "$@"
}

function f_console_fatal
{
  ccc_console.pl "$0" f_console_fatal "$@"

 # Stop immediately !
  exit 2
}

function f_console_assert
{
  ccc_console.pl "$0" f_console_assert "$@"
}



function f_console_fetch_param_as_env
{
  ps_ParamTable=$1
  ps_ParamName=$2
  ps_EnvName=$3

  ls_tmp_work_file="${TMP}/f_console_fetch_param_as_env-$$-${RANDOM}.tmp"

  $ESQL --line-mode --output ${ls_tmp_work_file} --colsep '=' --header <<EOF

select 'export ${ps_EnvName}' = ('"' + p.param_value + '"')
from ${ps_ParamTable} p
where (p.param_name = '${ps_ParamName}')
go

EOF

. ${ls_tmp_work_file}
/bin/rm ${ls_tmp_work_file}
}




# ********************************************************************
#  - PRIVATE
# ********************************************************************

function _f_console_init
{
  if [[ "${_GB_CONSOLE_INIT}" = "" ]]
  then
    export _GB_CONSOLE_INIT="1"

    # All the variable below rely on a time stamp. This time stamp may
    # have been set by the caller - for instance in [PM_CCC::T_Cron]
    if [[ "${CS_CONSOLE_TIMESTAMP}" = "" ]]
    then
      CS_CONSOLE_TIMESTAMP=$(date '+%Y-%m-%d-%H-%M-%S')
      CS_CONSOLE_TODAY=$(date '+%Y-%m-%d')
    fi

    # in any case, we make these variables visible to any child process
    export CS_CONSOLE_TIMESTAMP
    export CS_CONSOLE_TODAY


    # Compute names of log files
    if [[ "${LOG}" = "" ]]
    then
      export LOG="$HOME/log"
    fi

    export CS_CONSOLE_BASEDIR="${LOG}/${CS_CONSOLE_PROGNAME}/${CS_CONSOLE_TODAY}/${CS_CONSOLE_TIMESTAMP}"
    mkdir -p "${CS_CONSOLE_BASEDIR}"
    touch "${CS_CONSOLE_BASEDIR}/.ccc_lib"

    export CS_CONSOLE_PID_FILE="${LOG}/${CS_CONSOLE_PROGNAME}/${CS_CONSOLE_PROGNAME}.pid"
    export CS_CONSOLE_LOG_MAIN="${CS_CONSOLE_BASEDIR}/${CS_CONSOLE_PROGNAME}.log"

    # ##DEPRECATED## for ascending compatibility only, when still
    # using the old cron scheme, and not yet migrated to [ccc_cron].
    export CS_CONSOLE_LOG_PAT="${CS_CONSOLE_BASEDIR}/*.log"
  fi
}



# Force initialisation of log / trace / console
_f_console_init
