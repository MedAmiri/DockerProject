#! /bin/sh
cd sql/pgpool-recovery
make
make install
psql -f pgpool-recovery.sql template1
psql -f pgpool-recovery.sql postgres
cd ../pgpool-regclass
make
make install
psql -f pgpool-regclass.sql template1
psql -f pgpool-regclass.sql postgres
