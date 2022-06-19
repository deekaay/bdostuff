#!/bin/sh

while /bin/true
do
	dt=`date +%s`
	curl -L "https://docs.google.com/spreadsheets/d/1NsGi5c648KgnCyLdYWvtfkr36zjXK6FdBFxMjVQ_-9I/export?format=csv" -o /srv/data/na-en/$dt.csv
	curl -L "https://docs.google.com/spreadsheets/d/1q50gm4O8Vx6qfXEOmZ7xOgSZ_h70oExmtagTZM1TvUk/export?format=csv" -o /srv/data/eu-en/$dt.csv
	gzip /srv/data/na-en/$dt.csv
	gzip /srv/data/eu-en/$dt.csv
	#s3cmd put /srv/data/na-en/$dt.csv.gz s3://cc-bdo/na-en/
	#s3cmd put /srv/data/eu-en/$dt.csv.gz s3://cc-bdo/eu-en/
	sleep 600
done
