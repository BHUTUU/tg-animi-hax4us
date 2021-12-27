#!/usr/bin/env bash
CWD=$(pwd)
#<<<-----colors----->>>#
S0="\033[1;30m" B0="\033[1;40m"
S1="\033[1;31m" B1="\033[1;41m"
S2="\033[1;32m" B2="\033[1;42m"
S3="\033[1;33m" B3="\033[1;43m"
S4="\033[1;34m" B4="\033[1;44m"
S5="\033[1;35m" B5="\033[1;45m"
S6="\033[1;36m" B6="\033[1;46m"
S7="\033[1;37m" B7="\033[1;47m"
R0="\033[00m"   R1="\033[1;00m"
#<---x--->#
#<========REQUIREMENTS===========>#
if [[ ! -d "$CWD/assets" ]]; then
   mkdir assets >  /dev/null 2>&1
   cd $CWD/assets >  /dev/null 2>&1
   wget -q https://raw.githubusercontent.com/BHUTUU/tg-animi-hax4us/main/assets/arrow
   wget -q https://raw.githubusercontent.com/BHUTUU/tg-animi-hax4us/main/assets/header
   wget -q https://raw.githubusercontent.com/BHUTUU/tg-animi-hax4us/main/assets/banner
fi
#<=============PROGRAM=============>#
signal_SIGINT() {
   printf "\r\033[8A"
   banner
   printf "\033[?12l\033[?25h"
   echo; exit 0
}
banner() {
   j=1
   for i in $(seq 10); do
      one=$(cat $CWD/assets/banner | sed "${i}q;d")
      two=$(cat $CWD/assets/arrow | sed "${i}q;d")
      three=$(cat $CWD/assets/header | sed "${i}q;d")
      printf "%s\t%s\t%s\n" "$two" "$one" "$three"
      i=$(($i+1))
   done
}
status() {
   width=${#1}
   back() {
      printf "\b\b\b\b\b\b\b\b\b"
      for b in $(seq $width); do
         printf "\b"
      done
   }
   while :;do
      printf "${R0}•••${R0} ${1}.    "
      back
      sleep 0.20
      printf "${R0}${S2}⦁${R0}•• ${1}..   "
      back
      sleep 0.10
      printf "${R0}•${S2}⦁${R0}• ${1}...  "
      back
      sleep 0.10
      printf "${R0}••${S2}⦁${R0} ${1}.... "
      back
      sleep 0.10
      printf "${R0}•••${R0} ${1}....."
      back
      sleep 0.20
   done
}
if [[ ! -z "$2" ]]; then
   typer="${1}, ${2}"
   grammer="are"
else
   typer="${1}"
   grammer="is"
fi
trap signal_SIGINT SIGINT
printf "\033[?25l"
banner
printf "                                     \033[2A"
status "${typer} ${grammer} typing"
