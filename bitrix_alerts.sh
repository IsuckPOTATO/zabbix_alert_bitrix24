  GNU nano 5.4                                                                    bitrix_alerts.sh
#!/bin/bash

# Parameters
to=chatXXXXX //change it to ID of channel you want to send to
subject="$1"
body="$2"
now=$(date)

# Bitrix24 URL webhook
webhook_url="https://xxxx.bitrix24.pl/rest/85/xxxx/im.message.add.json" // here change it to your bitrix24 webhook

# Massage formating
message="${body}"

# Logging whats send
echo "[Zabbix Problem]" + "$now" >> /usr/lib/zabbix/alertscripts/problem.txt
echo "$message" >> /usr/lib/zabbix/alertscripts/problem.txt

# Sending message to Bitrix24 and logging it in response.txt
echo "" >> /usr/lib/zabbix/alertscripts/response.txt
echo "" >> /usr/lib/zabbix/alertscripts/response.txt
echo "[Bitrix Response] " + "$now" >> /usr/lib/zabbix/alertscripts/response.txt
curl -X POST -H 'Content-Type: application/json' -d "{\"DIALOG_ID\":\"$to\", \"MESSAGE\":\"$message\"}" $webhook_url >> /usr/lib/zabbix/alertscripts/response.txt
