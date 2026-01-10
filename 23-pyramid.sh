#!/bin/bash

set -euo pipefail

rows=5

# Upper triangle (expanding)
for (( i=1; i<=rows; i++ )); do
    # Leading spaces
    for (( space=rows-i; space>=1; space-- )); do
        echo -n " "
    done
    # Stars (odd number: 2*i-1)
    for (( j=0; j<2*i-1; j++ )); do
        echo -n "*"
    done
    echo ""
done

# # Lower triangle (contracting)
# for (( i=rows-1; i>=1; i-- )); do
#     # Leading spaces
#     for (( space=rows-i; space>=1; space-- )); do
#         echo -n " "
#     done
#     # Stars (odd number: 2*i-1)
#     for (( j=0; j<2*i-1; j++ )); do
#         echo -n "*"
#     done
#     echo ""
# done