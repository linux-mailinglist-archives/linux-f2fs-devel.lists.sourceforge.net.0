Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BB072D435
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jun 2023 00:15:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8poQ-0000bx-1t;
	Mon, 12 Jun 2023 22:14:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1q8poO-0000br-S0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 22:14:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wY+IiaMVPkhs5BAxb4gNE8P7VZqGUgChV0nfCblCDV0=; b=TBTFNQZxx0379O+0boXWNr8qUD
 /x8B0zsfq6IeaUcnD/Zsvfzj7a/C1rhyVuO8CUJeVVb7YHnbxDIzINechGyUuDUyKBpDnp71O3V/C
 tMrowBK0pzfqeTuCvsvQi0ej+zBIv9aR+qbEUcl0JMzWiyEHxQdsjuOqPa4ueYRyjAyQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wY+IiaMVPkhs5BAxb4gNE8P7VZqGUgChV0nfCblCDV0=; b=Md+j5o1b5fXAP7I6UHTMuPGevk
 JTyF4GKl0UNkSDe/35shbVJEmguUwn8vctvtG/punl3m7bdKw16vsHKwnIu9186wut7JC5EgQ50Do
 zzwPGqBSKZsDLfEy9Q1Nkjki592zhxVGnpFbv7qeqCM2AUAHg/tkT9SSvHDPVcEvMks0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8poL-0016ti-Fj for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 22:14:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DAF1162BFA;
 Mon, 12 Jun 2023 22:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA97C433D2;
 Mon, 12 Jun 2023 22:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686608084;
 bh=/4GR9Hf1ASwJkuX0BXgNzC6bOV/3dAkzoO7nR0gcVMo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tf3wLXVKRuYFAJRgyhnirYHZlD6zj0nqI8Iz1cWqkKsSY0W/Oc7Uc6+c1aedVtb3u
 fIPtW7zHHHWCNTu0KtyyAcpQfJL2goJieV7p9ysE7kwDVK0nfJ/Y/AX19UQP9EeoWu
 cAp0wwjx7jbTOY15d5ILJuYz8f4ODEL4arghzgYQE5X18OxfULSjm8MxwZ8QV/6z36
 TEgBMUwGGNBcV1dToYTIfyOTbs1hYLkWIZcwKC2FlZzCxeADlUfx5f0blhWX/XSG/h
 GMEqFphosIyzkwUanZVeHqaPfp+q0TAyYqjO8XivKq4jDtaOhsX2SgOcJWrkISVAnt
 vYA2mhy0+GP4Q==
Date: Mon, 12 Jun 2023 15:14:42 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Sheng Yong <shengyong@oppo.com>
Message-ID: <ZIeY0qNjXgx419NZ@google.com>
References: <20230612030121.2393541-1-shengyong@oppo.com>
 <20230612030121.2393541-2-shengyong@oppo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230612030121.2393541-2-shengyong@oppo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Could you please check this version?
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev-test&id=9c84aad379019a0d86655bb50bd7b4bc92683c4b
 On 06/12, Sheng Yong wrote: > This patch adds a helper function to check
 if compression level is > valid. > > Signed-off-by: Sheng Yong
 <shengyong@oppo.com>
 > --- > fs/f2fs/compress.c | 31 +++++++++++ [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q8poL-0016ti-Fj
Subject: Re: [f2fs-dev] [PATCH v4 1/6] f2fs: add helper to check compression
 level
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: ebiggers@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Could you please check this version?

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev-test&id=9c84aad379019a0d86655bb50bd7b4bc92683c4b

On 06/12, Sheng Yong wrote:
> This patch adds a helper function to check if compression level is
> valid.
> 
> Signed-off-by: Sheng Yong <shengyong@oppo.com>
> ---
>  fs/f2fs/compress.c | 31 +++++++++++++++++++++++++++++++
>  fs/f2fs/f2fs.h     |  2 ++
>  fs/f2fs/super.c    |  4 ++--
>  3 files changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 1132d3cd8f337..63a496137ebe7 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -55,6 +55,7 @@ struct f2fs_compress_ops {
>  	int (*init_decompress_ctx)(struct decompress_io_ctx *dic);
>  	void (*destroy_decompress_ctx)(struct decompress_io_ctx *dic);
>  	int (*decompress_pages)(struct decompress_io_ctx *dic);
> +	bool (*is_level_valid)(int level);
>  };
>  
>  static unsigned int offset_in_cluster(struct compress_ctx *cc, pgoff_t index)
> @@ -308,11 +309,23 @@ static int lz4_decompress_pages(struct decompress_io_ctx *dic)
>  	return 0;
>  }
>  
> +static bool lz4_is_level_valid(int lvl)
> +{
> +	if (lvl == 0)
> +		return true;
> +#ifdef CONFIG_F2FS_FS_LZ4HC
> +	if (lvl >= LZ4HC_MIN_CLEVEL && lvl <= LZ4HC_MAX_CLEVEL)
> +		return true;
> +#endif
> +	return false;
> +}
> +
>  static const struct f2fs_compress_ops f2fs_lz4_ops = {
>  	.init_compress_ctx	= lz4_init_compress_ctx,
>  	.destroy_compress_ctx	= lz4_destroy_compress_ctx,
>  	.compress_pages		= lz4_compress_pages,
>  	.decompress_pages	= lz4_decompress_pages,
> +	.is_level_valid		= lz4_is_level_valid,
>  };
>  #endif
>  
> @@ -477,6 +490,13 @@ static int zstd_decompress_pages(struct decompress_io_ctx *dic)
>  	return 0;
>  }
>  
> +static bool zstd_is_level_valid(int lvl)
> +{
> +	if (lvl < zstd_min_clevel() || lvl > zstd_max_clevel())
> +		return false;
> +	return true;
> +}
> +
>  static const struct f2fs_compress_ops f2fs_zstd_ops = {
>  	.init_compress_ctx	= zstd_init_compress_ctx,
>  	.destroy_compress_ctx	= zstd_destroy_compress_ctx,
> @@ -484,6 +504,7 @@ static const struct f2fs_compress_ops f2fs_zstd_ops = {
>  	.init_decompress_ctx	= zstd_init_decompress_ctx,
>  	.destroy_decompress_ctx	= zstd_destroy_decompress_ctx,
>  	.decompress_pages	= zstd_decompress_pages,
> +	.is_level_valid		= zstd_is_level_valid,
>  };
>  #endif
>  
> @@ -542,6 +563,16 @@ bool f2fs_is_compress_backend_ready(struct inode *inode)
>  	return f2fs_cops[F2FS_I(inode)->i_compress_algorithm];
>  }
>  
> +bool f2fs_is_compress_level_valid(int alg, int lvl)
> +{
> +	const struct f2fs_compress_ops *cops = f2fs_cops[alg];
> +
> +	if (cops->is_level_valid)
> +		return cops->is_level_valid(lvl);
> +
> +	return lvl == 0;
> +}
> +
>  static mempool_t *compress_page_pool;
>  static int num_compress_pages = 512;
>  module_param(num_compress_pages, uint, 0444);
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 80c783215b5a3..1b17bbe7e8656 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4236,6 +4236,7 @@ bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
>  int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock);
>  void f2fs_compress_write_end_io(struct bio *bio, struct page *page);
>  bool f2fs_is_compress_backend_ready(struct inode *inode);
> +bool f2fs_is_compress_level_valid(int alg, int lvl);
>  int __init f2fs_init_compress_mempool(void);
>  void f2fs_destroy_compress_mempool(void);
>  void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task);
> @@ -4300,6 +4301,7 @@ static inline bool f2fs_is_compress_backend_ready(struct inode *inode)
>  	/* not support compression */
>  	return false;
>  }
> +static inline bool f2fs_is_compress_level_valid(int alg, int lvl) { return false; }
>  static inline struct page *f2fs_compress_control_page(struct page *page)
>  {
>  	WARN_ON_ONCE(1);
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 8fd23caa1ed99..023981824d240 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -606,7 +606,7 @@ static int f2fs_set_lz4hc_level(struct f2fs_sb_info *sbi, const char *str)
>  	if (kstrtouint(str + 1, 10, &level))
>  		return -EINVAL;
>  
> -	if (level < LZ4HC_MIN_CLEVEL || level > LZ4HC_MAX_CLEVEL) {
> +	if (!f2fs_is_compress_level_valid(COMPRESS_LZ4, level)) {
>  		f2fs_info(sbi, "invalid lz4hc compress level: %d", level);
>  		return -EINVAL;
>  	}
> @@ -640,7 +640,7 @@ static int f2fs_set_zstd_level(struct f2fs_sb_info *sbi, const char *str)
>  	if (kstrtouint(str + 1, 10, &level))
>  		return -EINVAL;
>  
> -	if (!level || level > zstd_max_clevel()) {
> +	if (!f2fs_is_compress_level_valid(COMPRESS_ZSTD, level)) {
>  		f2fs_info(sbi, "invalid zstd compress level: %d", level);
>  		return -EINVAL;
>  	}
> -- 
> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
