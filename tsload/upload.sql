\copy tmp_mktdata  (id,q,t,p,r,ts,region) from '/srv/tsload/tmp2.csv' delimiter ',' CSV;
insert into mktdata (id,q,t,p,r,ts,region)
	select id, q,t,p,r,to_timestamp(ts),region from tmp_mktdata;
truncate table tmp_mktdata;
