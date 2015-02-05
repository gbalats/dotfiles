#! /bin/bash
#
# This script is intended to be sourced, otherwise it will
# not work since `pathmunge' is not exported.

echo >&2 "Initializing personalized LogicBlox environment ..."

export LB_DEPLOYMENT_HOME="$HOME/.lb_deployment"
export LB_CONNECTBLOX_ENABLE_ADMIN=1
# export LB_PAGER_FORCE_START=true
# export LB_MEM_NOWARN=true

LB_LIBRARY_HOME=/opt/lb/lib
LB_ORT_HOME=/opt/lb/default
LB_NRT_HOME=/opt/lb/latest

export LOGICBLOX_HOME=${LB_ORT_HOME}
export LD_LIBRARY_PATH="$LOGICBLOX_HOME/bin:$LB_LIBRARY_HOME"

pathmunge $LOGICBLOX_HOME/bin

export LB_ENV_INITIALIZED=true
