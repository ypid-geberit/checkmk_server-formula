# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_package_install = tplroot ~ '.package.install' %}
{%- from tplroot ~ "/map.jinja" import checkmk_server with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

include:
  - {{ sls_package_install }}

checkmk_server-config-file-file-managed:
  file.managed:
    - name: {{ checkmk_server.config }}
    - source: {{ files_switch(['example.tmpl'],
                              lookup='checkmk_server-config-file-file-managed'
                 )
              }}
    - mode: 644
    - user: root
    - group: {{ checkmk_server.rootgroup }}
    - makedirs: True
    - template: jinja
    - require:
      - sls: {{ sls_package_install }}
    - context:
        checkmk_server: {{ checkmk_server | json }}
