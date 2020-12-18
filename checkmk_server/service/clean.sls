# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import checkmk_server with context %}

checkmk_server-service-clean-service-dead:
  service.dead:
    - name: {{ checkmk_server.service.name }}
    - enable: False
