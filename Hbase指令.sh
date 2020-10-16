fsdatanode1.cminl.oa

#hdfs table space
hdfs dfs -du -h --block-size=g /apps/hbase/data/data/default
hdfs dfs -du /apps/hbase/data/data/default | awk '/^[0-9]+/ { print int($1/(1024**3)) " [GB]\t" $2 }' | grep BLC_EDC.EDC_ALL_

#hbase table count
count 'BLC_EDC.EDC'

#hbase shell
hbase shell
hbase exit


#Hbase TTL setting (31536000  1Y) (7776000  3M)
hbase shell
describe  'BLC_EDC.EDC_ALL_20180426'
disable 'BLC_EDC.EDC_ALL_20180426'
alter 'BLC_EDC.EDC_ALL_20180426' , {NAME=>'0',TTL=>'7776000'}
enable 'BLC_EDC.EDC_ALL_20180426'
describe 'BLC_EDC.EDC_ALL_20180426'
major_compact  'BLC_EDC.EDC_ALL_20180426'

#How to convert Hbase table's TTL from epoch time to date
hbase(main):019:0> import java.util.Date
=> Java::JavaUtil::Date
 
hbase(main):024:0> Date.new(2147483647).toString()
=> "Mon Jan 18 19:14:07 PST 2038"


#Hbase TTL Limit (FOREVER)
TTL=>'2147483647'

#dbeaver adjust column length
SELECT
    TENANT_ID, 
    TABLE_SCHEM,
    TABLE_NAME,
    COLUMN_NAME,
    COLUMN_FAMILY,
    COLUMN_SIZE
FROM SYSTEM.CATALOG 
WHERE 
    TABLE_SCHEM='PHM' 
AND TABLE_NAME='DELTEST01'

UPSERT INTO SYSTEM.CATALOG (
    TENANT_ID, 
    TABLE_SCHEM,
    TABLE_NAME,
    COLUMN_NAME,
    COLUMN_FAMILY,
    COLUMN_SIZE)
VALUES (
    null,
    'PHM',
    'DELTEST01',
    'FAC_ID',
    '0'
    200)
