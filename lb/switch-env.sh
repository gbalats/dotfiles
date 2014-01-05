#! /bin/bash
#
# This script is intended to be sourced, otherwise it will
# not work since `pathmunge' is not exported.

if [[ -z $LB_ENV_INITIALIZED ]]; then
    echo "Initializing logicblox environment..."
    source ${HOME}/bin/lb-setup-env.sh
fi

function switch-runtime()
{
    for pathvar in PATH LD_LIBRARY_PATH; do
        eval "export $pathvar=\"\${$pathvar//\"$1\"/$2}\""
    done
}

case $LOGICBLOX_HOME in
    "$LB_ORT_HOME")
        echo "Using old runtime. Switching to new..."
        export LOGICBLOX_HOME=${LB_NRT_HOME}

        # Substituting runtime in environment variables
        switch-runtime $LB_ORT_HOME $LB_NRT_HOME
        ;;
    "$LB_NRT_HOME")
        echo "Using new runtime. Switching to old..."
        export LOGICBLOX_HOME=${LB_ORT_HOME}

        # Substituting runtime in environment variables
        switch-runtime $LB_NRT_HOME $LB_ORT_HOME
        ;;
esac
