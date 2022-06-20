for i in /srv/data/na-en/done/*.gz
	do
		echo $i
		cp $i ./tmp.csv.gz
		gzip -d tmp.csv.gz
		ts=`echo $i | tr "/" " " | tr "." " "| awk ' { print $5 }'`
		echo $ts
		cat tmp.csv | egrep -v '^,' | dos2unix | sed -e "s/\$/,$ts,na/g" | \
		       	awk -F ',' ' {print $2,$3,$4,$5,$6,$7,$8} ' | tr " " "," > tmp2.csv
		cat upload.sql | psql -d bdo
		rm tmp.csv
		mv $i /srv/data/na-en/done2/
	done
