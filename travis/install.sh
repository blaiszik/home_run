#!/bin/bash

# Update the build environment
pip install --upgrade pip setuptools wheel

# Install mandatory packages
pip install -e .
pip install coveralls flake8

# Adding keras and TF1 for some tests
if [ -n "$KERAS_VERSION" ]; then
  pip install keras=="$KERAS_VERSION" "tensorflow<2"
else
  # Otherwise, use TF2
  pip install "tensorflow>2"
fi

# Install the packages required for tests
pip install -r test-requirements.txt
pip install -r example-requirements.txt

# Manually-specifying the version of scikit-learn
if [ -n "$SKLEARN_VERSION" ]; then
  pip install scikit-learn=="$SKLEARN_VERSION"
fi
