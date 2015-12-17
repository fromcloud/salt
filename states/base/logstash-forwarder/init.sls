logstash-forwarder:
  pkg:
    - installed
  service.running:
    - enable: True
    - watch:
      - pkg: logstash-forwarder
      - file: /etc/logstash-forwarder.conf 
      - file: /etc/pki/tls/certs/logstash-forwarder.crt
      - file: /etc/yum.repos.d/logstash-forwarder.repo


/etc/logstash-forwarder.conf:
  file:
    - managed
    - source: salt://logstash-forwarder/logstash-forwarder.conf
    - user: root
    - group: root
    - mode: 664

/etc/pki/tls/certs/logstash-forwarder.crt:
  file:
    - managed
    - source: /etc/pki/tls/certs/logstash-forwarder.crt
    - user: root
    - group: root
    - mode: 664

/etc/yum.repos.d/logstash-forwarder.repo
  file:
    - managed
    - source: salt://logstash-forwarder/logstash-forwarder.repo
    - user: root
    - group: root
    - mode: 664
