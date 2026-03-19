---
permalink: /
title: "Welcome to my website!"
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---

你好，我是 Jasper（Jintao Chen），北京大学二年级硕士研究生。

我的研究兴趣包括：
- image and video generation
- world models
- vision-language-action (VLA) models

我尤其关注如何构建通用视觉智能系统，使其能够在开放环境中进行感知、推理与决策。

## 关于我

目前我主要探索生成式建模与具身智能交叉方向的问题，
目标是发展可靠且可扩展的方法，连接感知、表征学习与决策过程。

如果你对相关方向感兴趣，欢迎通过邮件交流与合作。

## 研究方向

- **生成式建模（Generative Modeling）**：可控的图像/视频合成与扩散模型生成
- **世界模型（World Models）**：从视觉序列中学习可预测的潜在动力学
- **视觉-语言-动作（VLA）**：融合视觉理解与语言引导的动作决策

## 文章导览（最新）

下面展示的是我最近更新的中文文章与笔记：

{%- comment -%}
首页只展示中文（或未标注语言）的文章：
- 先过滤掉 hidden 的文章
- 再取 lang == 'zh' 的文章
- 再加上 lang 为空（未标注）的旧文章
{%- endcomment -%}
{% assign visible_posts = site.posts | where_exp: "post", "post.hidden != true" %}
{% assign zh_posts = visible_posts | where: "lang", "zh" %}
{% assign no_lang_posts = visible_posts | where_exp: "post", "post.lang == nil" %}
{% assign merged_posts = zh_posts | concat: no_lang_posts %}
{% assign recent_posts = merged_posts | slice: 0, 5 %}
{% if recent_posts.size > 0 %}
{% for post in recent_posts %}
### [{{ post.title }}]({{ post.url | relative_url }})

{% if post.excerpt %}
{{ post.excerpt | strip_html | truncate: 180 }}
{% else %}
该文章暂时还没有摘要。
{% endif %}

*发布日期：{{ post.date | date: "%Y-%m-%d" }}*

{% endfor %}
{% else %}
目前还没有文章，后续发布后会自动显示在这里。
{% endif %}
