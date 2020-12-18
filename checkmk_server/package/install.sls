# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import checkmk_server with context %}

checkmk_server-package-install-pkg-installed:
  pkg.installed:
    - name: {{ checkmk_server.pkg.name }}
