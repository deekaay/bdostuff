\copy tmp_mktdata  (item_id,quantity,total,price,r,ts,region) from '/srv/tsload/tmp2.csv' delimiter ',' CSV;
insert into mktdata (item_id,quantity,total,price,r,ts,region)
	select item_id,quantity,total,price,r,to_timestamp(ts),region from tmp_mktdata;
truncate table tmp_mktdata;
