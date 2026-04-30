#!/bin/bash
mkdir -p /opt/3cxwm/mcu && mkdir -p /opt/3cxwm/mcumanager && mkdir -p /opt/3cxwm/cert && mkdir -p /opt/3cxwm/setup && mkdir -p /var/lib/3cxpbx/WebMeeting/Logs
date > /var/lib/3cxpbx/WebMeeting/Logs/onboard-install.log
export NCURSES_NO_UTF8_ACS=1
unset LANG
unset LC_ALL
export LANG=C.UTF-8
export PYTHONWARNINGS=ignore
echo 'OnBoard MCU install script started' >> /var/lib/3cxpbx/WebMeeting/Logs/onboard-install.log
MYID=$( id -u )
if [ $(id -u) -ne 0 ]; then
echo 'This script must be run as root' ; kill -INT $$
fi
echo -n 'Installing required packages... '
apt-get update ; apt-get -y install dialog gnupg curl apt-transport-https sudo cron >> /var/lib/3cxpbx/WebMeeting/Logs/onboard-install.log 2>&1
echo 'done'
license=$(echo "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" | base64 --decode | gunzip)
dialog --title "End User License Agreement (EULA)" --yes-label "Agree" --no-label "Decline" --yesno "$license" 30 84
if [ $? -ne 0 ]; then
  echo 'Installation canceled.'
  exit 1
fi
clear
echo -n 'Adding 3CX repository... '
until curl -o /tmp/webmeeting-onboard.asc -s https://wmrepo.3cx.net/webmeeting-onboard.asc >> /var/lib/3cxpbx/WebMeeting/Logs/onboard-install.log ; do sleep 2 ; done
mv -f /tmp/webmeeting-onboard.asc /etc/apt/trusted.gpg.d >> /var/lib/3cxpbx/WebMeeting/Logs/onboard-install.log 2>&1
echo deb https://wmrepo.3cx.net/ bookworm main | tee /etc/apt/sources.list.d/webmeeting-onboard.list >> /var/lib/3cxpbx/WebMeeting/Logs/onboard-install.log
echo 'done'
echo -n 'Updating packages... '
apt-get update >> /var/lib/3cxpbx/WebMeeting/Logs/onboard-install.log 2>&1
echo 'done'
echo -n 'Installing certbot... '
apt-get -y install certbot >> /var/lib/3cxpbx/WebMeeting/Logs/onboard-install.log 2>&1
echo 'done'
systemctl stop 3CXWMMcu > /dev/null 2>&1
systemctl stop 3CXWMMcuManager > /dev/null 2>&1
echo -n 'Creating configuration files... '
echo ewogICJhZGRyX2ludGVyZmFjZSI6ICIwLjAuMC4wIiwKICAiYWRkcl9tYWluIjogIjEwLjEuMS4xMTMiLAogICJhZGRyX2FsdCI6ICIzMS40NC45NC4xMTYiLAogICJhZGRyX2ludGVyZmFjZV9pcHY2IjogIiIsCiAgImFkZHJfbWFpbl9pcHY2IjogIiIsCiAgImFkZHJfYWx0X2lwdjYiOiAiIiwKICAiZnFkbiI6ICJkaGRxYi13bXIubXkzY3gubmV0IiwKICAiem9uZSI6ICIiLAogICJ3bXJfYWN0aXZlX3VybCI6ICIiLAogICJzZXJ2aWNlX2NoYW5uZWxfc2VjcmV0IjogInFmVGRtYlYxeHR0bzZwdE4wMVc2d3ZvSmhBbTVNMGxtd0xJWHVDbENzb2pSVXltMDZFRlIwZ3hDSElxeGlwaGwiLAogICJsb2dfcmVtb3RlX3VybCI6ICIiLAogICJsb2dfc2V2ZXJpdHkiOiAid2FybmluZyIsCiAgImJhbmRjYXAiOiAwLAogICJwYXJ0c2NhcCI6IDAsCiAgIm1lZXRpbmdzY2FwIjogMCwKICAib25ib2FyZCI6IHRydWUKfQ== | base64 --decode > /opt/3cxwm/mcu/config.json
echo ewogICJsb2dfbGV2ZWwiOiAzLAogICJsb2dfZGF5cyI6IDcsCiAgImxvZ190b19jb25zb2xlIjogZmFsc2UsCiAgImxvZ190b19maWxlIjogdHJ1ZSwKICAibG9nX3RvX3N0YWNrZHJpdmVyIjogZmFsc2UsCiAgInJlY29yZGluZ19kYXlzIjogNywKICAicG9ydCI6IDYwNDQzLAogICJ1cGxvYWRfbGltaXQiOiA3NSwKICAidXBsb2FkX3RpbWVvdXQiOiAxMDAwMCwKICAibWN1X3BhdGgiOiAiIiwKICAicGRmZ2VuZXJhdG9yX2NvbnNvbGV0aW1lb3V0IjogMzAwMDAsCiAgInVzZV9zZWN1cmVfaGFzaCI6IGZhbHNlLAogICJmaXJld2FsbF9idWZmZXJfc2Vjb25kcyI6IDMwLAogICJmaXJld2FsbF90YXJnZXRfc2NvcmUiOiAxMDAsCiAgImZpcmV3YWxsX2Jsb2NrX3NlY29uZHMiOiAzMDAsCiAgImZpcmV3YWxsX2hhY2tfbXVsdGlwbGllciI6IDEwMCwKICAiZmlyZXdhbGxfbm90Zm91bmRfbXVsdGlwbGllciI6IDUsCiAgImZpcmV3YWxsX2JhZHJlcXVlc3RfbXVsdGlwbGllciI6IDAuNwp9 | base64 --decode > /opt/3cxwm/mcumanager/config.json
echo 'done'
echo -n 'Configuring Certbot update... '
echo IyEvYmluL2Jhc2gKaWYgWyAtZiAvZXRjL2xldHNlbmNyeXB0L2xpdmUvZGhkcWItd21yLm15M2N4Lm5ldC9mdWxsY2hhaW4ucGVtIF07IHRoZW4KICBsbiAtc2YgL2V0Yy9sZXRzZW5jcnlwdC9saXZlL2RoZHFiLXdtci5teTNjeC5uZXQvZnVsbGNoYWluLnBlbSAvb3B0LzNjeHdtL2NlcnQvc2VydmVyLmNydC5saXZlCiAgbG4gLXNmIC9ldGMvbGV0c2VuY3J5cHQvbGl2ZS9kaGRxYi13bXIubXkzY3gubmV0L3ByaXZrZXkucGVtIC9vcHQvM2N4d20vY2VydC9zZXJ2ZXIua2V5LmxpdmUKICBjcCAvb3B0LzNjeHdtL2NlcnQvc2VydmVyLmNydC5saXZlIC9vcHQvM2N4d20vY2VydC9zZXJ2ZXIuY3J0CiAgY3AgL29wdC8zY3h3bS9jZXJ0L3NlcnZlci5rZXkubGl2ZSAvb3B0LzNjeHdtL2NlcnQvc2VydmVyLmtleQogIGNobW9kIDY0NCAvb3B0LzNjeHdtL2NlcnQvc2VydmVyLmNydCA7IGNobW9kIDY0NCAvb3B0LzNjeHdtL2NlcnQvc2VydmVyLmtleQpmaQppZiBzZXJ2aWNlIC0tc3RhdHVzLWFsbCB8IGdyZXAgLUZxICczQ1hXTU1jdU1hbmFnZXInOyB0aGVuCnN5c3RlbWN0bCByZXN0YXJ0IDNDWFdNTWN1TWFuYWdlcgpmaQppZiBzZXJ2aWNlIC0tc3RhdHVzLWFsbCB8IGdyZXAgLUZxICczQ1hXTU1jdSc7IHRoZW4Kc3lzdGVtY3RsIHJlc3RhcnQgM0NYV01NY3UKZmk= | base64 --decode > /opt/3cxwm/setup/le-posthook.sh
chmod 700 /opt/3cxwm/setup/le-posthook.sh >> /var/lib/3cxpbx/WebMeeting/Logs/onboard-install.log
echo 'done'
max_retries=0
retry_delay=10
while :
do
echo 'Requesting SSL certificate'
/usr/bin/certbot certonly --no-autorenew --standalone --non-interactive -m "itsupport@nt-serv.com" --agree-tos --preferred-challenges http -d dhdqb-wmr.my3cx.net --post-hook /opt/3cxwm/setup/le-posthook.sh >> /var/lib/3cxpbx/WebMeeting/Logs/onboard-install.log
if [[ $? != 0 ]]; then
  if [[ $max_retries -lt 3 ]]; then
    max_retries=$((max_retries + 1))
    echo 'CertBot challenge failed, retrying in '$retry_delay' seconds'
    sleep $retry_delay
  else
    tail /var/log/letsencrypt/letsencrypt.log
    echo 'CertBot Error. Read above and fix problems.'
    return 1
  fi
else
  break
fi
done
(crontab -l | grep -F "0 3 * * * /usr/bin/certbot certonly --no-autorenew --standalone --non-interactive -m \"itsupport@nt-serv.com\" --agree-tos --preferred-challenges http -d dhdqb-wmr.my3cx.net --post-hook /opt/3cxwm/setup/le-posthook.sh >> /var/lib/3cxpbx/WebMeeting/Logs/onboard-install.log" > /dev/null 2>&1) || (crontab -l; echo "0 3 * * * /usr/bin/certbot certonly --no-autorenew --standalone --non-interactive -m \"itsupport@nt-serv.com\" --agree-tos --preferred-challenges http -d dhdqb-wmr.my3cx.net --post-hook /opt/3cxwm/setup/le-posthook.sh >> /var/lib/3cxpbx/WebMeeting/Logs/onboard-install.log") | crontab -
echo 'SSL certificate created successfully.'
echo -n 'Configuring SSL certificate... '
ln -sf /etc/letsencrypt/live/dhdqb-wmr.my3cx.net/fullchain.pem /opt/3cxwm/cert/server.crt.live >> /var/lib/3cxpbx/WebMeeting/Logs/onboard-install.log
ln -sf /etc/letsencrypt/live/dhdqb-wmr.my3cx.net/privkey.pem /opt/3cxwm/cert/server.key.live >> /var/lib/3cxpbx/WebMeeting/Logs/onboard-install.log
cp /opt/3cxwm/cert/server.crt.live /opt/3cxwm/cert/server.crt >> /var/lib/3cxpbx/WebMeeting/Logs/onboard-install.log
cp /opt/3cxwm/cert/server.key.live /opt/3cxwm/cert/server.key >> /var/lib/3cxpbx/WebMeeting/Logs/onboard-install.log
chmod 644 /opt/3cxwm/cert/server.crt ; chmod 644 /opt/3cxwm/cert/server.key >> /var/lib/3cxpbx/WebMeeting/Logs/onboard-install.log
echo 'done'
#echo -n 'Downloading MCU packages... '
#until curl -O -s "https://downloads.3cx.net/archive/onboard/3cx-mcu_20.0.8.39041_amd64.deb" >> /var/lib/3cxpbx/WebMeeting/Logs/onboard-install.log ; do sleep 2; done
#until curl -O -s "https://downloads.3cx.net/archive/onboard/3cx-mcumanager_20.0.8.39041_amd64.deb" >> /var/lib/3cxpbx/WebMeeting/Logs/onboard-install.log ; do sleep 2; done
#echo 'done'
echo 'Installing MCU packages...'
until apt-get -y --allow-downgrades install ./3cx-mcumanager_20.0.8.39041_amd64.deb >> /var/lib/3cxpbx/WebMeeting/Logs/onboard-install.log ; do sleep 2; done
until apt-get -y --allow-downgrades install ./3cx-mcu_20.0.8.39041_amd64.deb >> /var/lib/3cxpbx/WebMeeting/Logs/onboard-install.log ; do sleep 2; done
echo 'Installation complete.'
while :
do
  echo -n 'Checking DNS Propagation... '
  REPLY=$(curl -s --max-time 90 https://3cx.nt-serv.com:443/webmeeting/onboard/d4d26de4-d6e7-47ab-a2cf-4846c47d627e?step=2)
  if [[ $REPLY == OK ]]; then
    echo 'done'
    break
  else
    echo 'DNS not yet propagated '$REPLY
  fi
  sleep 5
done
echo -n 'Restarting services... '
systemctl restart 3CXWMMcuManager
systemctl restart 3CXWMMcu
apt-get -y install unattended-upgrades >> /var/lib/3cxpbx/WebMeeting/Logs/onboard-install.log 2>&1
echo 'done'
echo 'OnBoard MCU Install Successfully Completed'
