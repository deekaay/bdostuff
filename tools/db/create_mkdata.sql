
create table tmp_mktdata
        (
        ts numeric(20),
        region varchar(3),
        id numeric(8,0),
        q numeric(12,0),
        t numeric(14,0),
        p numeric(14, 0),
        r numeric(12,0)
        );

create table mktdata
        (
        ts timestamp,
        region varchar(3),
        id numeric(8,0),
        q numeric(12,0),
        t numeric(14,0),
        p numeric(14, 0),
        r numeric(12,0)
        );
