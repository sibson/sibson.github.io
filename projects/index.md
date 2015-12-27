---
title: Projects
author: marc
layout: page
---

{% for repository in site.github.public_repositories %}
# [{{ repository.name }}]({{ repository.html_url }})
{{ repository.description }} [
{% endfor %}

<!-- Quick Adsense WordPress Plugin: http://quicksense.net/ -->

<div style="float:none;margin:10px 0 10px 0;text-align:center;">
</div>

<div style="font-size:0px;height:0px;line-height:0px;margin:0;padding:0;clear:both">
</div>
