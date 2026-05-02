#!/bin/bash
set -e

NOTEBOOK="hello_world.ipynb"
OUTPUT="hello_world_executed.ipynb"

echo "Executing ${NOTEBOOK} -> ${OUTPUT} ..."
jupyter nbconvert \
    --to notebook \
    --execute "${NOTEBOOK}" \
    --output "${OUTPUT}" \
    --ExecutePreprocessor.timeout=120

#echo "Execution complete. Starting Jupyter server..."
#exec start-notebook.sh --NotebookApp.token='' --NotebookApp.password='' --ip=0.0.0.0
