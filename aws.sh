#!/bin/bash

export LOG=/tmp/awsauto.log
rm -f $LOG

echo -e "\n\e[1;33m You can find all the scripts in following location\e[0m\nhttps://github.com/satishsatti3789/automation/tree/master/aws\n"

source /tmp/automation/dry/common-functions.sh

if [ ! -d /tmp/automation  ]; then
	git clone https://github.com/satishsatti3789/automation.git /tmp/automation &>/dev/null
else
	cd /tmp/labautomation
	git stash &>/dev/null
	git pull &>/dev/null
fi

echo -e "${Y}>>>>> Select a AWS Operation to Perform${N}"
export PS3="Select Action> "
cd /tmp/automation/aws
select action in `ls -1 *.sh | sed -e 's/.sh$//'`; do
		echo -e "\e[1;33m★★★ Performing $action ★★★\e[0m"
		sh /tmp/automation/aws/$action.sh
		break
done
