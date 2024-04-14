#!/bin/bash

# steps:::::
# 1)providing the required arguments
# 2)correct ga options esthunana ledha and options ki ayrgument esthunana ledha
# 3)making two arguments as mandotory
# 4)eppudu third option ki delete kani archeive kani two options evali

Third_Option=false #intial ga false ani thesukuntunna 
Third_option_arg="" #intal ga arugment value kuda empty string thesukunta 
usage() {
    echo "usage:$0  -s <arg1> -a <arg2>  -d <delete/archieve>  -t  <arg4> -m <arg5>"
    exit 1
}
while getopts "s:a:d:t:m:" opt; do
  case ${opt} in
    s )  
      arg1=$OPTARG
      ;;
    a )
      arg2=$OPTARG
      if [[ "$arg2" = "archieve" ]]
      then
            Third_Option=true
      fi
      ;;
    d )
      Third_option_arg=$OPTARG
      ;;
    t )
      arg2=$OPTARG
      ;;
    m )
      arg2=$OPTARG
      ;;

    \? )
      echo "Invalid option: $OPTARG"  #this will though error if we give any wrong option
      usage
      exit 1
      ;;
    : )
      echo "Option -$OPTARG requires an argument." #it will tell this requires an argument 
      usage
      exit 1
      ;;
  esac
done
shift $((OPTIND -1))

if [ -z "$arg1" || -z "$arg2" ]  #-z check chesthadhi length of string if zero aythe true 
then
    echo "usage:$0  -s <arg1>"
    exit 1
fi

if [[ $Third_Option == true && -z $Third_option_arg ]]
then
    echo "My third option \$Third_option_arg is mandatory"
    echo "usage:$0  -s <arg1>"
    exit 1
fi

