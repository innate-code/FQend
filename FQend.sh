PWD=$(pwd)
source ${PWD}/.tools/doc/var.sh

trap ctrl_c int
	
	function ctrl_c(){
		clear
		banner
		echo -e "\n${green}[${white}${flicker}*${end}${green}] You are exiting to script. ${end}"
		sleep 3; clear
		exit 1
	}

	function server(){
		sleep 1
		echo -e "${green} Server: ${red} > 1${end} \n"
		echo -e "${green} Server: ${red} > 2${end} \n"
		echo -e "${green} Server: ${red} > 3${end} \n"
		read -p $'\033[1;32m Server \033[0;31m> \033[0m' server

		case $server in
			
			1) server=$server1
			fakemail
			;;

			2) server=$server2
			fakemail
			;;

			3) server=$server3
			fakemail
			;;

			*) clear; banner
			   echo -e "\n${green}[${white}${flicker}*${end}${green}] You are exiting to script. ${end}"
			   sleep 3; clear
			;;

		esac
	}

	function fakemail() {

		clear; banner; sleep 1

		read -p $'\033[1;32mEMAIL SPOOFER \033[0;31m> \033[0m' faker
		clear; banner

		read -p $'\033[1;32mTARGET EMAIL \033[0;31m> \033[0m' fakiado
		clear; banner

		read -p $'\033[1;32mHEAD (title) \033[0;31m> \033[0m' title
		clear; banner

		read -p $'\033[1;32mBODY MESSAGE \033[0;31m> \033[0m' message
		sleep 1; clear; banner

		echo -e "${white} The mail will send be like: \n ${end}"
		echo -e "${red} Spoofer:${green} $faker ${end} \n"
		echo -e "${red} Target:${green} $fakiado ${end} \n"
		echo -e "${red} Title:${green} $title ${end} \n"
		echo -e "${red} Message:${green} $message ${end} \n"

		sleep 1

		read -p $'\033[1;32m Are you sure to send this mail? \033[0;31m[y/n] > \033[0m' sure
		case $sure in

					y)
					curl --data "destinatario=$fakiado && asunto=$title && mensaje=$message && remitente=$faker" $server
			 clear
			 banner
			 sleep 1
			 echo -e "\n${green}[${red}+${green}]${end} Sended. "
			 		;;

			 		n)
			 clear
			 banner
			 exit 1
			 		;;
		*)	 clear; banner
			 echo -e "\n${green}[${white}${flicker}*${end}${green}] You are exiting to script. ${end}"
			 sleep 3
			 		;;
			 esac

	}

	function main(){
		clear
		banner
		sleep 1
		server
	}

main