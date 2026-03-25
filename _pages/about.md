---
permalink: /
title: "Welcome to my website!"
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---

你好 👋，我是 Jasper（Jintao Chen），北京大学二年级硕士研究生。

我的研究兴趣包括：
- 🎬 image / video generation
- 🌍 world models
- 🤖 vision-language-action (VLA) models


## 关于我 ✨

目前我主要探索视频生成、世界模型以及具身智能交叉方向的问题。
同时本人对视觉压缩、表征学习、强化学习等也有比较大的兴趣。

如果你对相关方向感兴趣，欢迎通过邮件交流与合作 🤝📧！

## 研究方向 🔭

- **生成式建模（Generative Modeling）** 🎨：可控的图像/视频合成、长视频生成、视频推理加速、视觉表征学习，
- **世界模型（World Models）** 🌐：构建 3D 一致和具备物理知识感知的世界模型、WM 驱动的动作决策 WAM/VA

## 开源项目 🧰

- **VideoGen / EasyVidGen** 🎥：自研、基于 Diffusers 的图像/视频生成仓库（个人感觉比 [diffusion-pipe](https://github.com/tdrussell/diffusion-pipe)、[diffsynth-studio](https://github.com/modelscope/diffsynth-studio) 更快捷高效）。正在迭代成更完善的版本，欢迎使用、提 issue 或 PR，顺便求个 Star ⭐～  
  👉 [EasyVidGen](https://github.com/JasperChennn/EasyVidGen)

- **AstraWorld** 🚀
- **ConceptWeaver** 🧵
- **Arxiv-Daily-AI** 📰：调用 DeepSeek API 做每日 arXiv 速读，欢迎加入收藏夹～  
  👉 [arxiv-daily-AI](https://jasperchennn.github.io/daily-arXiv-ai-enhanced/)

## 最近文章 📝

最近更新的一些文章与笔记：

{%- comment -%}
首页只展示中文文章：
- 直接筛选 lang == 'zh'
- 为避免 GitHub Pages 对 where_exp 的兼容性问题，这里不再使用 where_exp
{%- endcomment -%}
{% assign zh_posts = site.posts | where: "lang", "zh" %}
{% assign recent_posts = zh_posts | slice: 0, 20 %}
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
