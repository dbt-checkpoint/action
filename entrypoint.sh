#!/bin/bash

# Install dbt-core if dbt_version is provided
if [ -n "$INPUT_DBT_VERSION" ]; then
    echo "Installing dbt-core version $INPUT_DBT_VERSION"
    pip install "dbt-core==$INPUT_DBT_VERSION"
else
    echo "Installing latest version of dbt-core"
    pip install "dbt-core"
fi

# Install specified dbt adapter if both dbt_adapter and dbt_version are provided
if [ -n "$INPUT_DBT_ADAPTER" ]; then
    echo "Installing dbt adapter: $INPUT_DBT_ADAPTER"
    pip install "$INPUT_DBT_ADAPTER"
fi

# Install pre-commit
echo "Installing pre-commit"
pip install pre-commit

# Run pre-commit with extra arguments
find / -name "dbt_project.yml"
ls -lha $GITHUB_WORKSPACE
cd $GITHUB_WORKSPACE
echo $PATH
git status
pre-commit run $INPUT_EXTRA_ARGS
