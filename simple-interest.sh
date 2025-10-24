#!/usr/bin/env bash
# simple-interest.sh
# Usage: ./simple-interest.sh PRINCIPAL RATE TIME
# Example: ./simple-interest.sh 1000 5 2

set -e

if [ $# -ne 3 ]; then
  echo "Usage: $0 PRINCIPAL RATE TIME"
  echo "Example: $0 1000 5 2"
  exit 1
fi

P=$1
R=$2
T=$3

# Validate numeric inputs (integers or decimals)
re='^[0-9]+([.][0-9]+)?$'
if ! [[ $P =~ $re ]] || ! [[ $R =~ $re ]] || ! [[ $T =~ $re ]]; then
  echo "All arguments must be non-negative numbers."
  exit 1
fi

# Compute simple interest: SI = (P * R * T) / 100
SI=$(awk "BEGIN { printf \"%.2f\", ($P * $R * $T) / 100 }")
TOTAL=$(awk "BEGIN { printf \"%.2f\", $P + $SI }")

echo "Principal: $P"
echo "Rate: $R% per annum"
echo "Time: $T years"
echo "Simple Interest: $SI"
echo "Total Amount: $TOTAL"
