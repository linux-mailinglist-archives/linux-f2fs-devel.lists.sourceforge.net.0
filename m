Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2339644F1D5
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 13 Nov 2021 07:36:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mlmdp-000670-Cg; Sat, 13 Nov 2021 06:35:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mlmdo-00066p-1X
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 13 Nov 2021 06:35:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V6TjgWyuvPAcEFW/cf6xf/A2z8gQBdRvtpgah42xx/E=; b=TdIfZpRKeVgiCX0qgBS7YOvc+X
 gjocA4tlcLFRQZUydBZlz2y6sIdO5U97/Sci7oO0NsEk7QUs2nBWNf8ZyNTrkgV9Ft140EWjMFNJW
 2e11LnujD+/SLJR7V63KXTzaGg7cdebFW8VJs9ILpFu/Eaqg9Ayt7D3nRtCLLcI6v40I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V6TjgWyuvPAcEFW/cf6xf/A2z8gQBdRvtpgah42xx/E=; b=M+1QAZxSfEAzaVPLnob6MumVOC
 Hjx6aoSNL7qB3ox5E7XKw98eOJQ/tzNeJIjgU7DGH8xDX53c873IWXFc8axQoSj7BOWzKe7ftX6il
 uvWE9aEXYxzwBcYOeVlOK6Pp1w4EVoZhzcf0lDaoWqmUWfJtCiS29VicjJhq380xsNlo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mlmdm-00BU3b-AG
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 13 Nov 2021 06:35:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D61260F6E;
 Sat, 13 Nov 2021 06:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636785348;
 bh=5RuWFBu974qvccl+AOrYvjfBw4cuVbtNsDfCHV4Yuio=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=asLgYkyQrNn9BjLHWujbvWs6LHlOP0T24oBf8yRrYI6ZNrfa92TZMPLdlKmGDtu9V
 o8tR1pSjmSMd1/vmQbdfrDnrpfua3shuXO6b6YtZ6SKwyVM7M6fgKDkvZsHFMwn+Pa
 RBiGIC7pdnRAJovLSaDrv+c084WFIfBWKJXvztOaF/9eUQIzqcA5O5FacS45POkRph
 Cpc2EJgYuPDb5TJob51/WdM9aWbfpnTRkUk6IFP4ts+vBsNgozMdalK0vxf/FSNczD
 V7znrXkIhz9uz2F2B6AtVgHjwN8L4rPH1+VjjFe27lhtmk5DEzKw2/dXsZFwvq1Goi
 qJTuZ717OssYg==
Message-ID: <2fa09598-c967-18e9-1672-2b109320bcdb@kernel.org>
Date: Sat, 13 Nov 2021 14:35:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Content-Language: en-US
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20211028112433.23879-1-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20211028112433.23879-1-changfengnan@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/10/28 19:24,
 Fengnan Chang wrote: > Add "f2fs_lzo_compress_private"
 and "f2fs_lz4_compress_private" slab > cache, to speed up memory allocation
 when init compress ctx. > No slab cache is added [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mlmdm-00BU3b-AG
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs:compress: introduce compress
 private data slab cache
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/10/28 19:24, Fengnan Chang wrote:
> Add "f2fs_lzo_compress_private" and "f2fs_lz4_compress_private" slab
> cache, to speed up memory allocation when init compress ctx.
> No slab cache is added to zstd as the private data for zstd is related to
> mount option, and too big.
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>   fs/f2fs/compress.c | 45 ++++++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 40 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 7588e4e817b8..4a8a4858d358 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -171,10 +171,11 @@ void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page)
>   }
>   
>   #ifdef CONFIG_F2FS_FS_LZO
> +static struct kmem_cache *lzo_compress_private_slab;
>   static int lzo_init_compress_ctx(struct compress_ctx *cc)
>   {
> -	cc->private = f2fs_kvmalloc(F2FS_I_SB(cc->inode),
> -				LZO1X_MEM_COMPRESS, GFP_NOFS);
> +	cc->private = f2fs_kmem_cache_alloc(lzo_compress_private_slab,
> +			GFP_F2FS_ZERO, false, F2FS_I_SB(cc->inode));
>   	if (!cc->private)
>   		return -ENOMEM;
>   
> @@ -184,7 +185,7 @@ static int lzo_init_compress_ctx(struct compress_ctx *cc)
>   
>   static void lzo_destroy_compress_ctx(struct compress_ctx *cc)
>   {
> -	kvfree(cc->private);
> +	kmem_cache_free(lzo_compress_private_slab, cc->private);
>   	cc->private = NULL;
>   }
>   
> @@ -234,6 +235,7 @@ static const struct f2fs_compress_ops f2fs_lzo_ops = {
>   #endif
>   
>   #ifdef CONFIG_F2FS_FS_LZ4
> +static struct kmem_cache *lz4_compress_private_slab;
>   static int lz4_init_compress_ctx(struct compress_ctx *cc)
>   {
>   	unsigned int size = LZ4_MEM_COMPRESS;
> @@ -243,7 +245,8 @@ static int lz4_init_compress_ctx(struct compress_ctx *cc)
>   		size = LZ4HC_MEM_COMPRESS;
>   #endif
>   
> -	cc->private = f2fs_kvmalloc(F2FS_I_SB(cc->inode), size, GFP_NOFS);

The size could be LZ4HC_MEM_COMPRESS rather than LZ4_MEM_COMPRESS if we enable
lz4hc algorithm, so they should never share the same lz4_compress_private_slab
slab cache.

Other concern is I'm not sure whether there is any side-effect if we introduce
slab cache which has such large object size...

Thanks,

> +	cc->private = f2fs_kmem_cache_alloc(lz4_compress_private_slab,
> +			GFP_F2FS_ZERO, false, F2FS_I_SB(cc->inode));
>   	if (!cc->private)
>   		return -ENOMEM;
>   
> @@ -258,7 +261,7 @@ static int lz4_init_compress_ctx(struct compress_ctx *cc)
>   
>   static void lz4_destroy_compress_ctx(struct compress_ctx *cc)
>   {
> -	kvfree(cc->private);
> +	kmem_cache_free(lz4_compress_private_slab, cc->private);
>   	cc->private = NULL;
>   }
>   
> @@ -1944,6 +1947,32 @@ void f2fs_destroy_page_array_cache(struct f2fs_sb_info *sbi)
>   {
>   	kmem_cache_destroy(sbi->page_array_slab);
>   }
> +static int __init f2fs_init_compress_private_cache(void)
> +{
> +#ifdef CONFIG_F2FS_FS_LZ4
> +	lz4_compress_private_slab = f2fs_kmem_cache_create("f2fs_lz4_compress_private",
> +					LZ4_MEM_COMPRESS);
> +	if (!lz4_compress_private_slab)
> +		return -ENOMEM;
> +#endif
> +#ifdef CONFIG_F2FS_FS_LZO
> +	lzo_compress_private_slab = f2fs_kmem_cache_create("f2fs_lzo_compress_private",
> +					LZO1X_MEM_COMPRESS);
> +	if (!lzo_compress_private_slab)
> +		return -ENOMEM;
> +#endif
> +	return 0;
> +}
> +
> +static void f2fs_destroy_compress_private_cache(void)
> +{
> +#ifdef CONFIG_F2FS_FS_LZ4
> +	kmem_cache_destroy(lz4_compress_private_slab);
> +#endif
> +#ifdef CONFIG_F2FS_FS_LZO
> +	kmem_cache_destroy(lzo_compress_private_slab);
> +#endif
> +}
>   
>   static int __init f2fs_init_cic_cache(void)
>   {
> @@ -1983,7 +2012,12 @@ int __init f2fs_init_compress_cache(void)
>   	err = f2fs_init_dic_cache();
>   	if (err)
>   		goto free_cic;
> +	err = f2fs_init_compress_private_cache();
> +	if (err)
> +		goto free_dic;
>   	return 0;
> +free_dic:
> +	f2fs_destroy_dic_cache();
>   free_cic:
>   	f2fs_destroy_cic_cache();
>   out:
> @@ -1994,4 +2028,5 @@ void f2fs_destroy_compress_cache(void)
>   {
>   	f2fs_destroy_dic_cache();
>   	f2fs_destroy_cic_cache();
> +	f2fs_destroy_compress_private_cache();
>   }
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
