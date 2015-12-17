pkgrepo.managed:
    - name: logstash-forwarder repository
    - baseurl: http://packages.elastic.co/logstashforwarder/centos
    - gpgkey: http://packages.elasticsearch.org/GPG-KEY-elasticsearch
    - gpgcheck: 1

logstash-forwarder:
  pkg:
    - installed
  service.running:
    - enable: True
    - watch:
      - pkg: logstash-forwarder
      - file: /etc/logstash-forwarder.conf 
      - file: /etc/pki/tls/certs/logstash-forwarder.crt


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
