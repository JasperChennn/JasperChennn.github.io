---
# 标题：写正式标题，建议英文或中英文
title: 'Your Post Title Here'

# 日期：建议创建新文件时改成真实日期（格式：YYYY-MM-DD）
date: 1999-01-01

# 语言：中文文章请填 zh，英文填 en
lang: zh

# 配对 ID：同一篇内容的中英两篇文章用同一个 pair_id
# 新建真实文章时建议改成类似：my-topic-20250319
pair_id: your-pair-id-here

# 可选：固定链接，不填则按全局 permalink 规则生成
permalink: 

# 标签：按需修改/增删
tags:
  - tag1
  - tag2
  - tag3
---

> 说明：这是一篇「模版文章」，用于快速复制创建新博文。
> 建议每次新建文章时复制整份内容到新文件，并修改上面的 front matter 字段。

## 摘要（可选）

在这里写一两句话，简要说明这篇文章的主要内容和结论。

## 引言 / 背景

介绍写这篇文章的动机：
- 问题是什么？
- 为什么值得记录？
- 目标读者是谁？

## 方法 / 内容主体

根据文章类型自行调整结构，例如：

### 1. 问题定义

### 2. 解决思路 / 理论推导

### 3. 实验设置 / 实现细节

### 4. 结果与分析

## 总结与展望

简单总结本文的核心观点，可以包括：
- 本文的主要收获
- 遇到的坑或经验
- 后续可以做的延伸工作

## 插入图片（文件结构）

博文在 `_posts/`，图片**不要**放在 `_posts` 里（路径容易乱、也不利于复用）。推荐：

### 推荐：`/images/` 下按文章分子目录

```
images/
  posts/
    2025-my-topic/        # 可用日期+简称，与某篇 post 对应
      figure1.png
      diagram.svg
  profile.png              # 站点已有：头像等
```

在 Markdown 里写（**站点根路径**，GitHub Pages 上最稳）：

```markdown
![图注说明](/images/posts/2025-my-topic/figure1.png)
```

带链接、控制大小可用 HTML（主题一般支持）：

```html
<figure>
  <img src="/images/posts/2025-my-topic/figure1.png" alt="简短说明" style="max-width:100%;" />
  <figcaption>图 1：说明文字</figcaption>
</figure>
```

### 备选：`/files/` 放 PDF 等大文件

模板说明里提到静态文件可放在 `files/`；图片也可以放这里，例如 `files/posts/xxx/`，同样用 `/files/...` 引用。

---

## 参考资料（可选）

- [论文/博客/代码链接 1](https://example.com)
- [论文/博客/代码链接 2](https://example.com)
