#!/bin/bash
# by Troy Powell

function process {
  python mk_license.py --email $email --name "$name" --company "$company" --product $product --packages "$packages" --qty $qty
  return
}

if [ $# -ne 0 ]
then
  if [[ "$1" != "-h" ]]
  then
    read -p 'Name: ' name
    read -p 'Company: ' company
    read -p 'Email: ' email
    read -p 'Quantity: ' qty
  fi
  for arg in "$@"
  do
    case "$arg" in
      -h|--help )
        echo ''
        echo 'Usage: $licgen.sh [options]'
        echo ''     
        echo "options:"
        echo '-h, --help            Help/Usage'
        echo '-a, --accelerate      Accelerate Product License'
        echo '-i, --iopro           IOPro Product License'
        echo "-m, --mkl             MKL Product License"
        echo "-academic             Academic License"
        echo ''
        ;;
      -a|--accelerate )
        product='accelerate'
        packages='numbapro mkl'
        ;;
      -i|--iopro )
        product='iopro'
        packages='iopro'
        ;;
      -m|--mkl )
        product='mkl-optimizations'
        packages='mkl'
        ;;
      -academic )
        product='academic'
        packages='iopro numbapro mkl'
        ;;
    esac
    process
  done
fi