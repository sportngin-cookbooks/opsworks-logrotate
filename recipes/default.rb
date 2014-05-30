include_recipe "logrotate::global"


logrotate_app 'syslog' do
  path %w(/var/log/cron /var/log/maillog /var/log/messages /var/log/secure /var/log/spooler)
  options   %w(sharedscripts)
  postrotate "/bin/kill -HUP `cat /var/run/syslogd.pid 2> /dev/null` 2> /dev/null || true"
end
