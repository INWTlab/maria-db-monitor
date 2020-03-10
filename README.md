# MariaDB Monitor

[![License](https://img.shields.io/github/license/INWTlab/ggCorpIdent.svg?color=%2393bb51&style=popout)](https://www.gnu.org/licenses/gpl-3.0)
[![Twitter](https://img.shields.io/twitter/follow/INWT_Statistics.svg?label=Follow%20us%21&style=social)](https://twitter.com/INWT_Statistics)
![Build](https://img.shields.io/badge/build-passing-%2393bb51.svg)

## Shiny App: MariaDB Monitor

The MariaDB Monitor is an INWT solution for monitoring and optimizing internal database infrastructure. 
For the implementation of the solution the open source programming environment R was chosen in conjunction with the Shiny package. 
We would be pleased about every participation in the further development.

![](http://www.inwt-statistics.de/files/INWT/images_blog/MariaDBAppHome.PNG)

## Installation

```r
devtools::install_github("INWT/MariaDB_Monitor")
```

## Configuration
To run the app, the **cnf.file** configuration file should be customized. The database user of the app 
must have sufficient privileges to retrieve performance data (e.g., performance_schema). The following 
create-script is a possibility, but should be adapted from the point of view of security:

```SQL
CREATE USER 'MariaDBstat'@'%' IDENTIFIED BY 'abc';
GRANT SELECT, PROCESS  ON *.* TO 'MariaDBstat'@'%';
GRANT SELECT  ON `information\_schema`.* TO 'MariaDBstat'@'%';
GRANT SELECT  ON `mysql`.* TO 'MariaDBstat'@'%';
GRANT SELECT  ON `performance\_schema`.* TO 'MariaDBstat'@'%';
FLUSH PRIVILEGES;
```

The username, password, database host and database port must
be entered into the **cnf.file** file, located in `~/.INWTdbMonitor/cnf.file`. 
Specifying a database is optional.
Instead of manually entering the data a configuration wizard
can be used by runnung the function `promptCnfData()`.

```
[client]
user=
password=
database=
host=
port=
```

In addition, it is necessary that the following entry is set under `[mysqld]` in the my.cnf of the MariaDB server. It ensures that the server's performance data is collected.

```
performance_schema = on
```

## Further Information
Further information and explanations can be found in our blog article: 

- [English-Version](https://www.inwt-statistics.com/read-blog/mariadb-monitor.html)
- [Deutsche-Version](https://www.inwt-statistics.de/blog-artikel-lesen/mariadb_monitor.html)

The App is tested on MariaDB-Server 10.1-10.3 with Performance Schema Version 5.6.35.
