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