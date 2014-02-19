#! /bin/bash
#
# This script is intended to be sourced, otherwise it will
# not work since `pathmunge' is not exported.

function clear-path()
{
    tmp_path=:${1}:
    shift

    for pat in $@; do
        tmp_path=${tmp_path/":$pat:"/:}
    done

    tmp_path=${tmp_path%:}
    tmp_path=${tmp_path#:}

    echo "$tmp_path"
    unset tmp_path
}

echo >&2 -e "Cleaning environment from LB setup ...\n"

# Cleanup PATH
echo >&2 -e "  Before PATH:\n    $PATH\n"
PATH=$(clear-path $PATH /opt/lb/{default,latest}/bin)
echo >&2 -e "  After PATH:\n    $PATH\n"

echo

# Cleanup LD_LIBRARY_PATH
echo >&2 -e "  Before LD_LIBRARY_PATH:\n    $LD_LIBRARY_PATH\n"
LD_LIBRARY_PATH=$(clear-path "$LD_LIBRARY_PATH" /opt/lb/lib /opt/lb/{default,latest}/bin)
echo >&2 -e "  After LD_LIBRARY_PATH:\n    $LD_LIBRARY_PATH"

# Cleanup the rest of the variables
unset LB_DEPLOYMENT_HOME LB_CONNECTBLOX_ENABLE_ADMIN
unset LB_LIBRARY_HOME LB_ORT_HOME LB_NRT_HOME
unset LOGICBLOX_HOME LB_ENV_INITIALIZED
export PATH LD_LIBRARY_PATH
