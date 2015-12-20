munin-node:
  pkg:
    - installed
  service.running:
    - enable: True
    - watch:
      - pkg: logstash-forwarder
      - file: /etc/munin-node/munin-node.conf 


/etc/munin-node.conf:
  file:
    - managed
    - source: salt://munin-node/munin-node.conf
    - user: root
    - group: root
    - mode: 664
