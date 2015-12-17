/etc/yum.repos.d/logstash-forwarder.repo:
  file:
    - managed
    - source: salt://logstash-forwarder/logstash-forwarder.repo
    - user: root
    - group: root
    - mode: 664

logstash-forwarder:
  pkg:
    - installed
  service.running:
    - enable: True
    - watch:
      - pkg: logstash-forwarder
      - file: /etc/logstash-forwarder.conf 

/etc/logstash-forwarder.conf:
  file:
    - managed
    - source: salt://logstash-forwarder/logstash-forwarder.conf
    - user: root
    - group: root
    - mode: 664

/etc/pki/tls/certs/logstash-forwarder.crt:
  file.copy:
    - source: /etc/pki/tls/certs/logstash-forwarder.crt
    - force: True
    - user: root
    - group: root
    - mode: 664
