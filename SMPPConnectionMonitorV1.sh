#!/bin/bash

ArrPoolList(){
Aplst[0]=POOL_OTH_10503_10504_10505=POOL_SDP_10501_10502_10507_10508:10.64.26.12:10509=10507:MM
Aplst[1]=POOL_OTH_10503_10504_10505=POOL_SDP_10501_10502_10507_10508=POOL_SMPP_4444_10503:10.64.26.13:10509=10507=10503:MM
Aplst[2]=POOL_NS_10503_10504=POOL_NG_10501_10502:10.64.26.14:10507=10509:MM
Aplst[3]=POOL_NS_10503_10504=POOL_NG_10501_10502=POOL_SCP_BULK_A2P_10505:10.64.26.15:10507=10509=10505:MM
Aplst[4]=POOL_OTH_10503_10504_10505=POOL_SDP_10501_10502_10507_10508:10.64.84.57:10509=10507:PK
Aplst[5]=POOL_OTH_10503_10504_10505=POOL_SDP_10501_10502_10507_10508=POOL_SMPP_4444_10503:10.64.84.58:10509=10507=10503:PK
Aplst[6]=POOL_NS_10503_10504=POOL_NG_10501_10502:10.64.84.59:10507=10509:PK
Aplst[7]=POOL_NS_10503_10504=POOL_NG_10501_10502=POOL_SCP_BULK_A2P_10505:10.64.84.60:10507=10509=10505:PK
}

getDClst(){
vdc=$1
for i in "${Aplst[@]}"
do
if [ ${vdc} == "MM" ]
then
for j in `echo "${i}" |awk -F: -v vdc=${vdc} '{if( $4 == "MM") print $0}'`
do
fun_valdate_v1 ${j}
done
elif [ ${vdc} == "PK" ]
then
for j in `echo "${i}" |awk -F: -v vdc=${vdc} '{if( $4 == "PK") print $0}'`
do
fun_valdate_v1 ${j}
done
else
echo "argument not passed"
fi
done
}

fun_valdate_v1(){
vLstDtl=${1}
vPoolNm=`echo ${vLstDtl}|awk -F: '{print $1}'`
vSPort=`echo ${vLstDtl}|awk -F: '{print $3}'`
vHst=`echo ${vLstDtl}|awk -F: '{print $2}'`
vFilBulk=`ssh -q vasadmin@${vHst} "/usr/sbin/lsof -u vasadmin 2>/dev/null|grep log|grep 'LB' |sort -n"|awk '{print $9}'|sort -n |uniq |tr '\n' ' '`
ssh -q vasadmin@${vHst} "/usr/bin/grep '\-from' ${vFilBulk} |/usr/bin/grep Cmd_Status:00000000" |awk -F"[" '{print $3}'|awk -F"-" '{print substr($1,1,length($1)-10)}'  |sort -n  |uniq |awk -v vvs=${vPoolNm} -v hs=${vHst} -v vprt=${vSPort} '{print vvs,hs,vprt,$1 }'>>${vTmpFilName}
}

getDBActesme(){
sqlplus -s "OPS_RECON"/"OPS_RECON#123"@ussddb_scan:1521/CDR<<EOF >/dev/null
SET TERMOUT OFF;
set echo off;
set feedback off;
set pagesize 0;
set heading off;
spool /tmp/vDBEsmeLst.dat
select user_name from smsc_config.mm_auth_users@to_smsc_config where user_status ='A';
spool off;
quit;
EOF
export vDBOutputFil="/tmp/vDBEsmeLst.dat"
}

fun_comp(){
for i in `cat ${vDBOutputFil}`
do
grep -q $i ${vTmpFilName}
if [ $? -eq 1 ]
then
echo -e "\033[0;31m$i   ==========> not connected \033[0m "
fi
done
}

main(){
export vTmpFilName="/tmp/vPoolLst"
>${vTmpFilName}
getDBActesme
ArrPoolList
getDClst MM
getDClst PK
fun_comp
}

main $*
