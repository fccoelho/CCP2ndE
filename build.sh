#!/bin/bash
make html
make latex
cd _build/latex/
make all-pdf
cd ../..
