#!/usr/bin/bash
#cd /home/vasadmin/
source /home/vasadmin/.bash_profile


fun_POOL_NG_10501_10502_ServerPort_10509(){
vTmpFilName="/tmp/vPoolLst"
>${vTmpFilName}
echo -e "\nF5_POOL_NG_10501_10502_ServerPort_10509\n"
vSPort="10509"
for vHst in 10.64.26.14 10.64.26.15 10.64.84.59 10.64.84.60
do
vProcID=`ssh -q vasadmin@${vHst} "/usr/sbin/lsof -i:${vSPort} 2> /dev/null|grep LISTEN"|awk '{print $2}'`
vFilBulk=`ssh -q vasadmin@${vHst} "/usr/sbin/lsof -p ${vProcID} 2> /dev/null|grep log" |awk '{print substr($9,1,48)"*.log"}'`
ssh -q vasadmin@${vHst} "/usr/bin/grep '\-from' ${vFilBulk} |/usr/bin/grep Cmd_Status:00000000" |awk -F"[" '{print $3}'|awk -F"-" '{print substr($1,1,length($1)-10)}' |sort -n  |uniq>>${vTmpFilName}
done
sort -n ${vTmpFilName} |uniq
}





fun_POOL_NS_10503_10504_ServerPort_10507(){
vTmpFilName="/tmp/vPoolLst"
>${vTmpFilName}
echo -e "\nF5_POOL_NS_10503_10504_ServerPort_10507\n"
vSPort="10507"

for vHst in 10.64.26.14 10.64.26.15 10.64.84.59 10.64.84.60
do
vProcID=`ssh -q vasadmin@${vHst} "/usr/sbin/lsof -i:${vSPort} 2> /dev/null|grep LISTEN"|awk '{print $2}'`
vFilBulk=`ssh -q vasadmin@${vHst} "/usr/sbin/lsof -p ${vProcID} 2> /dev/null|grep log" |awk '{print substr($9,1,48)"*.log"}'`
ssh -q vasadmin@${vHst} "/usr/bin/grep '\-from' ${vFilBulk} |/usr/bin/grep Cmd_Status:00000000" |awk -F"[" '{print $3}'|awk -F"-" '{print substr($1,1,length($1)-10)}' |sort -n|uniq  >>${vTmpFilName}
done
sort -n ${vTmpFilName}|uniq
}

fun_POOL_SDP_10501_10502_ServerPort_10507(){
vTmpFilName="/tmp/vPoolLst"
>${vTmpFilName}
echo -e "\nF5_POOL_SDP_10501_10502_ServerPort_10507\n"
vSPort="10507"
for vHst in 10.64.26.12 10.64.26.13 10.64.84.57 10.64.84.58
do
vProcID=`ssh -q vasadmin@${vHst} "/usr/sbin/lsof -i:${vSPort} 2> /dev/null|grep LISTEN"|awk '{print $2}'`
vFilBulk=`ssh -q vasadmin@${vHst} "/usr/sbin/lsof -p ${vProcID} 2> /dev/null|grep log" |awk '{print substr($9,1,48)"*.log"}'`
ssh -q vasadmin@${vHst} "/usr/bin/grep '\-from' ${vFilBulk}" |awk -F"[" '{print $3}'|awk -F"-" '{print substr($1,1,length($1)-10)}' |sort -n |uniq >>${vTmpFilName}
done
sort -n ${vTmpFilName}|uniq
}


fun_POOL_Other_10503_10504_10505_ServerPort_10509(){
vTmpFilName="/tmp/vPoolLst"
>${vTmpFilName}
echo -e "\nF5_POOL_Other_10503_10504_10505_ServerPort_10507\n"
vSPort="10509"
for vHst in 10.64.26.12 10.64.26.13 10.64.84.57 10.64.84.58
do
vProcID=`ssh -q vasadmin@${vHst} "/usr/sbin/lsof -i:${vSPort} 2> /dev/null|grep LISTEN"|awk '{print $2}'`
vFilBulk=`ssh -q vasadmin@${vHst} "/usr/sbin/lsof -p ${vProcID} 2> /dev/null|grep log" |awk '{print substr($9,1,48)"*.log"}'`
ssh -q vasadmin@${vHst} "/usr/bin/grep '\-from' ${vFilBulk} |/usr/bin/grep Cmd_Status:00000000" |awk -F"[" '{print $3}'|awk -F"-" '{print substr($1,1,length($1)-10)}' |sort -n |uniq >>${vTmpFilName}
done
sort -n ${vTmpFilName}|uniq
}

fun_POOL_4444_10503_ServerPort_10503(){
vTmpFilName="/tmp/vPoolLst"
>${vTmpFilName}
echo -e "\nF5_POOL_4444_10503_ServerPort_10503\n"
vSPort="10503"
for vHst in 10.64.26.13 10.64.84.58
do
vProcID=`ssh -q vasadmin@${vHst} "/usr/sbin/lsof -i:${vSPort} 2> /dev/null|grep LISTEN"|awk '{print $2}'`
vFilBulk=`ssh -q vasadmin@${vHst} "/usr/sbin/lsof -p ${vProcID} 2> /dev/null|grep log" |awk '{print substr($9,1,48)"*.log"}'`
ssh -q vasadmin@${vHst} "/usr/bin/grep '\-from' ${vFilBulk} |/usr/bin/grep Cmd_Status:00000000" |awk -F"[" '{print $3}'|awk -F"-" '{print substr($1,1,length($1)-10)}' |sort -n |uniq >>${vTmpFilName}
done
sort -n ${vTmpFilName}|uniq
}

fun_POOL_BULK_A2P_10505_ServerPort_10505(){
vTmpFilName="/tmp/vPoolLst"
>${vTmpFilName}
echo -e "\nF5_POOL_BULK_A2P_10505_ServerPort_10505\n"
vSPort="10505"
for vHst in 10.64.26.15 10.64.84.60
do
vProcID=`ssh -q vasadmin@${vHst} "/usr/sbin/lsof -i:${vSPort} 2> /dev/null|grep LISTEN"|awk '{print $2}'`
vFilBulk=`ssh -q vasadmin@${vHst} "/usr/sbin/lsof -p ${vProcID} 2> /dev/null|grep log" |awk '{print substr($9,1,48)"*.log"}'`
ssh -q vasadmin@${vHst} "/usr/bin/grep '\-from' ${vFilBulk} |/usr/bin/grep Cmd_Status:00000000" |awk -F"[" '{print $3}'|awk -F"-" '{print substr($1,1,length($1)-10)}' |sort -n |uniq >>${vTmpFilName}
done
sort -n ${vTmpFilName}|uniq
}



fun_POOL_NG_10501_10502_ServerPort_10509_checkTraffic(){
date
vTmpFilName="/tmp/vPoolLst"
vTmpFilName1="/tmp/vPoolLst_t1"
>${vTmpFilName}
>${vTmpFilName1}
vCounter=1
echo -e "\nF5_POOL_NG_10501_10502_ServerPort_10509_CheckTrafffic\n"
vSPort="10509"
for vHst in 10.64.26.14 10.64.26.15 10.64.84.59 10.64.84.60
do
vProcID=`ssh -q vasadmin@${vHst} "/usr/sbin/lsof -i:${vSPort} 2> /dev/null|grep LISTEN"|awk '{print $2}'`
vFilBulk=`ssh -q vasadmin@${vHst} "/usr/sbin/lsof -p ${vProcID} 2> /dev/null|grep log" |awk '{print $9}'`
if [ ${vCounter} -eq 1 ]
then
        for vClientID in bimatx did_tr lms_r lms_t nstm3 SLMS SLMS2
        do
        vCnt=`ssh -q vasadmin@${vHst} "/usr/bin/grep '\-from' ${vFilBulk} |/usr/bin/grep Cmd_Status:00000000 |/usr/bin/grep ${vClientID} |head -1|wc -l"|awk '{print $1}'`
        if [ ${vCnt} -eq 0 ]
        then
        echo "${vClientID}" >>${vTmpFilName}
        else
        echo ${vClientID}
        ssh -q vasadmin@${vHst} "/usr/bin/grep '\-from' ${vFilBulk} |/usr/bin/grep Cmd_Status:00000000 |/usr/bin/grep ${vClientID} |tail -1"
        fi
        done
else
for vClientID in `cat ${vTmpFilName}`
        do
        vCnt=`ssh -q vasadmin@${vHst} "/usr/bin/grep '\-from' ${vFilBulk} |/usr/bin/grep Cmd_Status:00000000 |/usr/bin/grep ${vClientID} |tail -1|wc -l"|awk '{print $1}'`
        if [ ${vCnt} -eq 0 ]
        then
        echo "${vClientID}" >>${vTmpFilName1}
        else
        echo ${vClientID}
        ssh -q vasadmin@${vHst} "/usr/bin/grep '\-from' ${vFilBulk} |/usr/bin/grep Cmd_Status:00000000 |/usr/bin/grep ${vClientID} |tail -1"
        fi
        done
if [ -e ${vTmpFilName1} ]
then
mv ${vTmpFilName1} ${vTmpFilName}
else
> ${vTmpFilName}
fi
fi
vCounter=`expr ${vCounter} + 1`
done
if [ -e ${vTmpFilName1} ]
then
echo -e "\nNot connected !!!"
cat ${vTmpFilName}
else
echo -e "\nAll connected \n"
fi
}


fun_POOL_NS_10503_10504_ServerPort_10507_checkTraffic(){
date
vTmpFilName="/tmp/vPoolLst"
vTmpFilName1="/tmp/vPoolLst_t1"
>${vTmpFilName}
>${vTmpFilName1}
vCounter=1
echo -e "\nF5_POOL_NS_10503_10504_ServerPort_10507_checkTraffic\n"
vSPort="10507"

for vHst in 10.64.26.14 10.64.26.15 10.64.84.59 10.64.84.60
do
vProcID=`ssh -q vasadmin@${vHst} "/usr/sbin/lsof -i:${vSPort} 2> /dev/null|grep LISTEN"|awk '{print $2}'`
vFilBulk=`ssh -q vasadmin@${vHst} "/usr/sbin/lsof -p ${vProcID} 2> /dev/null|grep log" |awk '{print $9}'`
if [ ${vCounter} -eq 1 ]
then
        for vClientID in angie angierx angiex bccsrx bccstx indns1_rx indns1_tx indns2_rx infoA2A_rx infoP2A_rx mauA2A_rx mauA2A_tx mauP2A_rx mauP2A_tx ns323rx ns323tx ns765rx ns765tx nsangiemo nsinfoA2A_rx nsinfoA2A_tx nsinfoP2A_rx nsinfoP2A_tx nstm1 nstm2 nstm3 ssp tmbctx tmhr vmsuser 3survey
        do
        vCnt=`ssh -q vasadmin@${vHst} "/usr/bin/grep '\-from' ${vFilBulk} |/usr/bin/grep Cmd_Status:00000000 |/usr/bin/grep ${vClientID} |head -1|wc -l"|awk '{print $1}'`
        if [ ${vCnt} -eq 0 ]
        then
        echo "${vClientID}" >>${vTmpFilName}
        else
        echo ${vClientID}
        ssh -q vasadmin@${vHst} "/usr/bin/grep '\-from' ${vFilBulk} |/usr/bin/grep Cmd_Status:00000000 |/usr/bin/grep ${vClientID} |tail -1"
        fi
        done
else
for vClientID in `cat ${vTmpFilName}`
        do
        vCnt=`ssh -q vasadmin@${vHst} "/usr/bin/grep '\-from' ${vFilBulk} |/usr/bin/grep Cmd_Status:00000000 |/usr/bin/grep ${vClientID} |tail -1|wc -l"|awk '{print $1}'`
        if [ ${vCnt} -eq 0 ]
        then
        echo "${vClientID}" >>${vTmpFilName1}
        else
        echo ${vClientID}
        ssh -q vasadmin@${vHst} "/usr/bin/grep '\-from' ${vFilBulk} |/usr/bin/grep Cmd_Status:00000000 |/usr/bin/grep ${vClientID} |tail -1"
        fi
        done
if [ -e ${vTmpFilName1} ]
then
mv ${vTmpFilName1} ${vTmpFilName}
else
> ${vTmpFilName}
fi
fi
vCounter=`expr ${vCounter} + 1`
done
if [ -e ${vTmpFilName1} ]
then
echo -e "\nNot connected !!!"
cat ${vTmpFilName}
else
echo -e "\nAll connected \n"
fi


}




fun_POOL_Other_10503_10504_10505_ServerPort_10509_checkTraffic(){
date
vTmpFilName="/tmp/vPoolLst"
vTmpFilName1="/tmp/vPoolLst_t1"
>${vTmpFilName}
>${vTmpFilName1}
vCounter=1
echo -e "\nF5_POOL_Other_10503_10504_10505_ServerPort_10507_checkTraffic\n"
vSPort="10509"
for vHst in 10.64.26.12 10.64.26.13 10.64.84.57 10.64.84.58
do
vProcID=`ssh -q vasadmin@${vHst} "/usr/sbin/lsof -i:${vSPort} 2> /dev/null|grep LISTEN"|awk '{print $2}'`
vFilBulk=`ssh -q vasadmin@${vHst} "/usr/sbin/lsof -p ${vProcID} 2> /dev/null|grep log" |awk '{print $9}'`
if [ ${vCounter} -eq 1 ]
then
        for vClientID in CellTickTX celltrx COMEVC1 COMEVC2 CVMPROD111 CVMPROD3 CVMPRODNOTI CVMPRODRO111 daarx daatx dms2 h3itrx hwrbtadv ictom2 ictom3 jussd6d omni otatrx otatrx2 pcrftrx rbthw1 rbtrpt siesme wsmsc wsmsc1
        do
        vCnt=`ssh -q vasadmin@${vHst} "/usr/bin/grep '\-from' ${vFilBulk} |/usr/bin/grep Cmd_Status:00000000 |/usr/bin/grep ${vClientID} |head -1|wc -l"|awk '{print $1}'`
        if [ ${vCnt} -eq 0 ]
        then
        echo "${vClientID}" >>${vTmpFilName}
        else
        echo ${vClientID}
        ssh -q vasadmin@${vHst} "/usr/bin/grep '\-from' ${vFilBulk} |/usr/bin/grep Cmd_Status:00000000 |/usr/bin/grep ${vClientID} |tail -1"
        fi
        done
else
for vClientID in `cat ${vTmpFilName}`
        do
        vCnt=`ssh -q vasadmin@${vHst} "/usr/bin/grep '\-from' ${vFilBulk} |/usr/bin/grep Cmd_Status:00000000 |/usr/bin/grep ${vClientID} |tail -1|wc -l"|awk '{print $1}'`
        if [ ${vCnt} -eq 0 ]
        then
        echo "${vClientID}" >>${vTmpFilName1}
        else
        echo ${vClientID}
        ssh -q vasadmin@${vHst} "/usr/bin/grep '\-from' ${vFilBulk} |/usr/bin/grep Cmd_Status:00000000 |/usr/bin/grep ${vClientID} |tail -1"
        fi
        done
if [ -e ${vTmpFilName1} ]
then
mv ${vTmpFilName1} ${vTmpFilName}
else
> ${vTmpFilName}
fi
fi
vCounter=`expr ${vCounter} + 1`
done
if [ -e ${vTmpFilName1} ]
then
echo -e "\nNot connected !!!"
cat ${vTmpFilName}
else
echo -e "\nAll connected \n"
fi

}


fun_POOL_SDP_10501_10502_ServerPort_10507_checkTraffic(){
date
vTmpFilName="/tmp/vPoolLst"
vTmpFilName1="/tmp/vPoolLst_t1"
>${vTmpFilName}
>${vTmpFilName1}
vCounter=1
echo -e "\nF5_POOL_SDP_10501_10502_ServerPort_10507_checkTraffic\n"
vSPort="10507"
for vHst in 10.64.26.12 10.64.26.13 10.64.84.57 10.64.84.58
do
vProcID=`ssh -q vasadmin@${vHst} "/usr/sbin/lsof -i:${vSPort} 2> /dev/null|grep LISTEN"|awk '{print $2}'`
vFilBulk=`ssh -q vasadmin@${vHst} "/usr/sbin/lsof -p ${vProcID} 2> /dev/null|grep log" |awk '{print $9}'`
if [ ${vCounter} -eq 1 ]
then
        for vClientID in gem44445 mca1 mca2 mcatrx mmsuser nagios nsnsmsbr sdp10rx sdp11rx sdp1rx sdp1tx sdp2rx sdp2tx sdp5rx sdp6rx sdp7rx sdp8rx sdp9rx sdpcms01 sdpcms02 siesme wsmsc2 wsmsc3
        do
        vCnt=`ssh -q vasadmin@${vHst} "/usr/bin/grep '\-from' ${vFilBulk} |/usr/bin/grep Cmd_Status:00000000 |/usr/bin/grep ${vClientID} |tail -1|wc -l"|awk '{print $1}'`
        if [ ${vCnt} -eq 0 ]
        then
        echo "${vClientID}" >>${vTmpFilName}
        else
        echo ${vClientID}
        ssh -q vasadmin@${vHst} "/usr/bin/grep '\-from' ${vFilBulk} |/usr/bin/grep Cmd_Status:00000000 |/usr/bin/grep ${vClientID} |tail -1"
        fi
        done
else
for vClientID in `cat ${vTmpFilName}`
        do
        vCnt=`ssh -q vasadmin@${vHst} "/usr/bin/grep '\-from' ${vFilBulk} |/usr/bin/grep Cmd_Status:00000000 |/usr/bin/grep ${vClientID} |tail -1|wc -l"|awk '{print $1}'`
        if [ ${vCnt} -eq 0 ]
        then
        echo "${vClientID}" >>${vTmpFilName1}
        else
        echo ${vClientID}
        ssh -q vasadmin@${vHst} "/usr/bin/grep '\-from' ${vFilBulk} |/usr/bin/grep Cmd_Status:00000000 |/usr/bin/grep ${vClientID} |tail -1"
        fi
        done
if [ -e ${vTmpFilName1} ]
then
mv ${vTmpFilName1} ${vTmpFilName}
else
> ${vTmpFilName}
fi
fi
vCounter=`expr ${vCounter} + 1 `
done
if [ -e ${vTmpFilName1} ]
then
echo -e "\nNot connected !!!"
cat ${vTmpFilName}
echo
else
echo -e "\nAll connected \n"
fi
echo
}




fun_POOL_4444_10503_ServerPort_10503_checkTraffic(){
date
vTmpFilName="/tmp/vPoolLst"
vTmpFilName1="/tmp/vPoolLst_t1"
>${vTmpFilName}
>${vTmpFilName1}
vCounter=1
echo -e "\nF5_POOL_4444_10503_ServerPort_10503_checkTraffic\n"
vSPort="10503"
for vHst in 10.64.26.13 10.64.84.58
do
vProcID=`ssh -q vasadmin@${vHst} "/usr/sbin/lsof -i:${vSPort} 2> /dev/null|grep LISTEN"|awk '{print $2}'`
vFilBulk=`ssh -q vasadmin@${vHst} "/usr/sbin/lsof -p ${vProcID} 2> /dev/null|grep log" |awk '{print $9}'`
if [ ${vCounter} -eq 1 ]
then
        for vClientID in eir4444pair ns4444rx ns4444tx
        do
        vCnt=`ssh -q vasadmin@${vHst} "/usr/bin/grep '\-from' ${vFilBulk} |/usr/bin/grep Cmd_Status:00000000 |/usr/bin/grep ${vClientID} |tail -1|wc -l"|awk '{print $1}'`
        if [ ${vCnt} -eq 0 ]
        then
        echo "${vClientID}" >>${vTmpFilName}
        else
        echo ${vClientID}
        ssh -q vasadmin@${vHst} "/usr/bin/grep '\-from' ${vFilBulk} |/usr/bin/grep Cmd_Status:00000000 |/usr/bin/grep ${vClientID} |tail -1"
        fi
        done
else
for vClientID in `cat ${vTmpFilName}`
        do
        vCnt=`ssh -q vasadmin@${vHst} "/usr/bin/grep '\-from' ${vFilBulk} |/usr/bin/grep Cmd_Status:00000000 |/usr/bin/grep ${vClientID} |tail -1|wc -l"|awk '{print $1}'`
        if [ ${vCnt} -eq 0 ]
        then
        echo "${vClientID}" >>${vTmpFilName1}
        else
        echo ${vClientID}
        ssh -q vasadmin@${vHst} "/usr/bin/grep '\-from' ${vFilBulk} |/usr/bin/grep Cmd_Status:00000000 |/usr/bin/grep ${vClientID} |tail -1"
        fi
        done
if [ -e ${vTmpFilName1} ]
then
mv ${vTmpFilName1} ${vTmpFilName}
else
> ${vTmpFilName}
fi
fi
vCounter=`expr ${vCounter} + 1 `
done
if [ -e ${vTmpFilName1} ]
then
echo -e "\nNot connected !!!"
cat ${vTmpFilName}
echo
else
echo -e "\nAll connected \n"
fi
echo
}




main(){
clear
#fun_POOL_NS_10503_10504_ServerPort_10507
#fun_POOL_NG_10501_10502_ServerPort_10509
#fun_POOL_SDP_10501_10502_ServerPort_10507
#fun_POOL_Other_10503_10504_10505_ServerPort_10509
#fun_POOL_4444_10503_ServerPort_10503
#fun_POOL_BULK_A2P_10505_ServerPort_10505
fun_POOL_NG_10501_10502_ServerPort_10509_checkTraffic
fun_POOL_NS_10503_10504_ServerPort_10507_checkTraffic
fun_POOL_Other_10503_10504_10505_ServerPort_10509_checkTraffic
fun_POOL_SDP_10501_10502_ServerPort_10507_checkTraffic
fun_POOL_4444_10503_ServerPort_10503_checkTraffic
}

main $*
