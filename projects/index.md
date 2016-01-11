---
title: Projects
author: marc
layout: page
---

{% if site.github.public_repositories %}
{% assign repos = site.github.public_repositories | sort: 'stargazers_count' %}
{% else %}
{% assign repos = '' %}
{% endif %}

{% for repository in repos reversed %}
{% if site.active-projects[repository.name] %}
# [{{ repository.name }}]({{ repository.html_url }})
{{ repository.description }}
{% endif %}
{% endfor %}

<!-- Quick Adsense WordPress Plugin: http://quicksense.net/ -->

<div style="float:none;margin:10px 0 10px 0;text-align:center;">
</div>

<div style="font-size:0px;height:0px;line-height:0px;margin:0;padding:0;clear:both">
</div>
