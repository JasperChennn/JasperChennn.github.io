---
# 标题：Decouple Distortion from Perception: 面向极低码率感知图像压缩的区域自适应扩散模型
title: '[CVPR2025]Decouple Distortion from Perception: Region Adaptive Diffusion for Extreme-low Bitrate Perception Image Compression'

# 日期：真实发表日期（格式：YYYY-MM-DD）
date: 2025-06-17

# 语言：中文文章请填 zh，英文填 en
lang: zh

# 配对 ID：同一篇内容的中英两篇文章用同一个 pair_id
pair_id: region-adaptive-diffusion-compression-20250617

# 可选：固定链接
permalink: /region-adaptive-diffusion-extreme-low-bitrate-compression/

# 标签
tags:
  - 图像压缩
  - 扩散生成
  - 极低码率
  - 感知质量
  - 区域自适应
  - CVPR2025
---

## 摘要
生成式图像压缩借助扩散模型的生成能力，在极低码率下已实现优异的感知保真度，但现有方法忽略了图像的非均匀复杂度，难以平衡全局感知质量与局部纹理一致性，也无法实现编码资源的高效分配。为此，本文提出地图引导掩码真实感图像扩散编解码器（MRIDC），旨在优化极低码率压缩中局部失真与全局感知质量的权衡关系。MRIDC整合了向量量化图像编码器与扩散基解码器，在编码端设计地图引导潜变量掩码（MLM）模块实现基于图像复杂度的自适应资源分配，解码端通过双向预测可控生成（BPCG）模块完成掩码潜变量的补全与图像重建。实验结果表明，MRIDC在极低码率下取得了 sota 级的感知压缩质量，有效保留了关键区域的特征一致性，推动了率失真感知性能曲线的提升，为平衡压缩效率与视觉保真度建立了新基准。

## 方法 / 内容主体

### 1. 问题定义
本研究聚焦**极低码率下的感知图像压缩问题**，核心目标是解决现有扩散基生成式压缩方法因忽略图像非均匀复杂度，导致的编码资源分配低效、局部纹理失真、关键区域特征不一致等问题，实现**全局感知质量**、**局部纹理一致性**与**压缩效率**的三重优化，提升率失真感知综合性能。

### 2. 解决思路 / 理论推导
提出**地图引导掩码真实感图像扩散编解码器（MRIDC）**，核心思路是通过**区域自适应的编码资源分配**与**约束性的扩散重建**，解耦图像压缩中的失真与感知质量，实现二者的精准权衡，整体架构为**向量量化编码器 + 扩散基解码器**的联合设计，核心模块包括：
1. **地图引导潜变量掩码（MLM）模块（编码端）**：基于图像复杂度先验信息，对潜变量空间进行选择性掩码，为复杂/关键区域保留更多潜变量信息，为简单区域掩码更多冗余信息，实现编码资源的自适应分配，提升资源利用效率；
2. **双向预测可控生成（BPCG）模块（解码端）**：在扩散模型的生成过程中加入约束引导，基于未掩码的潜变量信息，双向预测补全掩码区域的潜变量，实现受约束的图像重建，保证局部纹理一致性与关键特征的保真度。

<figure>
  <img src="/images/posts/region-adaptive-diffusion-compression-20250617/overview.png" alt="简短说明" style="max-width:100%;" />
  <figcaption>MRIDC整体框架</figcaption>
</figure>

### 3. 实验设置 / 实现细节
- **实验基准**：在极低码率图像压缩的主流公开数据集上开展实验，对比当前 sota 级的生成式图像压缩方法与传统压缩方法；
- **评价指标**：从**感知质量**（如LPIPS、SSIM、MOS主观评分）、**率失真性能**（RD曲线）、**关键区域特征一致性**三个维度进行全面评估；
- **核心验证**：验证MRIDC的区域自适应资源分配效果、局部纹理重建能力，以及在不同极低码率下的泛化性能。

### 4. 结果与分析
1. **SOTA 性能验证**：MRIDC在极低码率下取得了**当前最优的感知压缩质量**，在LPIPS、SSIM等客观指标及主观MOS评分上均显著优于对比方法；
2. **关键区域保真性**：通过区域自适应的资源分配与约束性重建，模型有效保留了图像关键区域的特征一致性，解决了现有方法局部纹理失真、特征丢失的问题；
3. **率失真感知优化**：模型显著**推动了率失真感知性能曲线的提升**，在相同码率下实现更高的感知质量，在相同感知质量下实现更低的码率，为平衡压缩效率与视觉保真度建立了新的行业基准；
4. **模块有效性**：消融实验验证了MLM与BPCG核心模块的必要性，移除任一模块均会导致资源分配效率下降、感知质量与局部一致性降低。

<figure>
  <img src="/images/posts/region-adaptive-diffusion-compression-20250617/results.png" alt="简短说明" style="max-width:100%;" />
  <figcaption>定量结果</figcaption>
</figure>

<figure>
  <img src="/images/posts/region-adaptive-diffusion-compression-20250617/mask_type.png" alt="简短说明" style="max-width:100%;" />
  <figcaption>不同的区域自适应MASK方法</figcaption>
</figure>

<figure>
  <img src="/images/posts/region-adaptive-diffusion-compression-20250617/ablation.png" alt="简短说明" style="max-width:100%;" />
  <figcaption>消融定性结构</figcaption>
</figure>

## 总结与展望

### 主要收获
1. 提出MRIDC扩散编解码器，首次将**区域自适应资源分配**融入扩散基生成式图像压缩，解耦了压缩中的失真与感知质量，解决了现有方法资源分配不均的核心问题；
2. 设计编码端MLM与解码端BPCG专用模块，实现了从潜变量掩码到约束性重建的端到端优化，保证了极低码率下全局感知质量与局部纹理一致性的双重提升；
3. 在CVPR 2025发表的研究成果中，MRIDC在极低码率感知图像压缩上取得SOTA性能，推动了率失真感知性能曲线的进步，建立了压缩效率与视觉保真度平衡的新基准。

### 个人小结
当时没注意到，后面一系列的visual tokenizer都用到了类似的双编码器结构，可惜当时只探究了压缩重建，没有探索生成的方面。


## 参考资料
- [Decouple Distortion from Perception (CVPR 2025 OpenAccess)](https://openaccess.thecvf.com/content/CVPR2025/html/Xu_Decouple_Distortion_from_Perception_Region_Adaptive_Diffusion_for_Extreme-low_Bitrate_CVPR_2025_paper.html)
- [CVPR 2025 Conference Proceedings](https://cvpr.thecvf.com/2025/)