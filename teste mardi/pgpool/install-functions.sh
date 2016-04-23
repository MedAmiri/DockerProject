#! /bin/sh
cd sql/pgpool-recovery
make
make install
psql -f pgpool-recovery.sql tem
psql -f pgpool-recovery.sql postgres
cd ../pgpool-regclass
make
make install
psql -f pgpool-regclass.sql tem
psql -f pgpool-regclass.sql postgres
