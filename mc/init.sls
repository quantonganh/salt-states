{%- from "macros.jinja2" import user with context %}

{%- set version = '4.8.15' %}

include:
  - brew

mc:
  pkg:
    - installed
    - unless: test -x /usr/local/Cellar/midnight-commander/{{ version }}/bin/mc
    - require:
      - cmd: brew
  file:
    - managed
    - name: /usr/local/Cellar/midnight-commander/{{ version }}/etc/mc/mc.keymap
    - source: salt://mc/keymap
    - user: {{ user }}
    - group: admin
    - mode: 644
    - require:
      - pkg: mc
