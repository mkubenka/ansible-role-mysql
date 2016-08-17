# Ansible Role MySQL [![Build Status](https://travis-ci.org/mkubenka/ansible-role-mysql.svg?branch=master)](https://travis-ci.org/mkubenka/ansible-role-mysql)

MySQL is an open-source relational database management system (RDBMS). This role use [MySQL Community Yum repository](https://dev.mysql.com/downloads/repo/yum/).

> Inspired by https://github.com/mjanser/ansible-role-mysql

## Requirements

None

## Role Variables

The variables that can be passed to this role and a brief description about
them are as follows. (For all variables, take a look at [defaults/main.yml](defaults/main.yml))

```yaml

# Supported versions 5.5, 5.6 and 5.7
mysql_version: '5.7'

# Required variable.
mysql_root_password: ''

mysql_import_timezones: true

mysql_bind_address: 127.0.0.1

mysql_server_options:
  ## Memory usage
  'table_open_cache': '64'
  'key_buffer_size': '16M'
  'innodb_buffer_pool_size': '16M'
  'thread_cache_size': '8'
  'ft_min_word_len': '3'

  'innodb_log_file_size': '5M'
  'innodb_log_buffer_size': '8M'
  'innodb_flush_log_at_trx_commit': '1'
  'innodb_lock_wait_timeout': '50'

  ## Limitations
  'max_connections': '100'
  'max_connect_errors': '100'
  'long_query_time': '5'
  'max_tmp_tables': '40'
  'wait_timeout': '100'
  'interactive_timeout': '900'
  'connect_timeout': '4'
  'max_allowed_packet': '2MB'

  ## Query cache
  'query_cache_limit': '2M'
  'query_cache_size': '32M'
  'query_prealloc_size': '10M'

# Define additional mysql users.
mysql_users:
  - name: datadog
    password: "CorrectHorseBatteryStaple1$"
    privileges: "*.*:REPLICATION CLIENT,PROCESS/performance_schema.*:SELECT"

# Password for repl user with replication privileges
mysql_slave_password: ''

# List of hosts allowed to connect as repl user
mysql_slaves_hosts: 
  - 10.10.0.2
  - db2

```

## Dependencies

None

## Example Playbook

    - hosts: servers
      roles:
         - { role: mkubenka.mysql, mysql_root_password: 'CorrectHorseBatteryStaple1$' }

## License

BSD

## Author Information

Michal Kubenka <mkubenka@gmail.com>
