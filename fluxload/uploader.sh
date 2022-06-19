for i in /srv/data/na-en/*.gz
	do
		echo $i
		cp $i ./tmp.csv.gz
		gzip -d tmp.csv.gz
		ts=`echo $i | tr "/" " " | tr "." " "| awk ' { print $4 }'`
		cat tmp.csv | egrep -v '^,' > tmp2.csv
		influx write -b bdo -f ./header.csv -f ./tmp2.csv \
			--header "#constant dateTime,${ts}000000000" -o DK --host $INFLUX_HOST \
			--token $INFLUX_TOKEN
		rm tmp.csv
		mv $i /srv/data/na-en/done/
	done
