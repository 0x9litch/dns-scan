#!/bin/bash

venv_name="myenv"

virtualenv "$venv_name"

source "$venv_name/bin/activate"

libraries=("dnspython" "socket" "requests" "termcolor")

for library in "${libraries[@]}"
do
    if ! python -c "import ${library}" &> /dev/null; then
        echo "${library} Downloading..."
        pip install "${library}"
    fi
done

deactivate
