#!/bin/bash

# Install dbt-core if dbt_version is provided
if [ -n "$INPUT_DBT_VERSION" ]; then
    echo "Installing dbt-core version $INPUT_DBT_VERSION"
    if [ -n "$INPUT_DBT_ADAPTER" ]; then
        echo "Installing $INPUT_DBT_ADAPTER adapter"
        pip install "$INPUT_DBT_ADAPTER" "dbt-core==$INPUT_DBT_VERSION"
    fi
else
    echo "Installing latest version of dbt-core"
    if [ -n "$INPUT_DBT_ADAPTER" ]; then
        echo "Installing $INPUT_DBT_ADAPTER adapter"
        pip install "$INPUT_DBT_ADAPTER" "dbt-core"
    else
        pip install "dbt-core"
    fi
fi

# Install pre-commit
echo "Installing pre-commit"
pip install pre-commit

# Run pre-commit with extra arguments
git config --global --add safe.directory $GITHUB_WORKSPACE
cd $GITHUB_WORKSPACE
pre-commit run $INPUT_EXTRA_ARGS
