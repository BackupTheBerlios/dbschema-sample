#!/usr/bin/perl

use strict;

use FindBin ;
use DBIx::Recordset ;

$DBIx::Recordset::Debug = 2;

# mysql sample setup
my %auth =
  ( grant_access_user => 'princepawn',
    dsn    => 'dbi:mysql:dbname=princepawn',
    dbuser => 'princepawn',
    dbpass => 'money1'
    );

# postgresql sample setup
my %auth =
  ( grant_access_user => 'metaperl',
    dsn    => 'dbi:Pg:dbname=ssample',
    dbuser => '',
    dbpass => ''
    );

# sqlite sample setup
my %auth =
  ( grant_access_user => 'metaperl',
    dsn    => "dbi:SQLite:dbname=ssample.sqlite",
    dbuser => '',
    dbpass => ''
    );


my %dbh =
  (
   '!DataSource' => $auth{dsn},
   '!Username'   => $auth{dbuser},
   '!Password'   => $auth{dbpass},
   '!KeepOpen'   => 1
   );

my $dbschema     = "$FindBin::Bin/db.schema" ;

    
my $dbh = DBIx::Database -> new (\%dbh) ;

$dbh -> CreateTables ($dbschema, '', $auth{grant_access_user})  ;


