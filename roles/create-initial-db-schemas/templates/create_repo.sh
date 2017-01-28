#!/bin/bash

SCRIPT=$(readlink -f $0)
SCRIPT_PATH=$(dirname $SCRIPT)

JAVA_HOME={{ java_home }}
export JAVA_HOME

{{ oracle_home }}/oracle_common/bin/rcu -silent -createRepository -databaseType ORACLE -connectString {{ dbserver_name }}:{{ dbserver_port }}:{{ dbserver_service }} -dbUser sys -dbRole SYSDBA -schemaPrefix {{ repository_prefix }} -useSamePasswordForAllSchemaUsers true -component IAU -component IAU_APPEND -component IAU_VIEWER -component OPSS -component STB -component MDS -f < {{ software_location }}/rcu.passwd.txt
