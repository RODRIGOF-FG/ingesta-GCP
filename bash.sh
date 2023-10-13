  bq load \
    --autodetect \
    --source_format=CSV \
    dd_landing.covid \
    gs://raw-gcp-1/covid_1.csv
