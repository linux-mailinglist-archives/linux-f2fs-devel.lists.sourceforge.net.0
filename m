Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 613466491C5
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 11 Dec 2022 03:14:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4BrK-0004gl-G0;
	Sun, 11 Dec 2022 02:14:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1p4BrJ-0004gd-BE
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Dec 2022 02:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xmjg3notJnpwFyJaAfP0t/tbpfYAB2zX+B2IxJgoaAY=; b=fTVTvpgDPI2HF00GCB7lknRKTq
 epSePYg8SLb1bi9PpL0bxZMND08HRHiDKk2kTVgt0H3ll3YvpHDk9u6yRMUx+athddFR5Ui7B9zsr
 ckK5D5VsurtiWE87UX88BGwaGOSC3J+FsuBIXESx0MtnM8QNJ4SCB3bKgktAvoM79PrQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xmjg3notJnpwFyJaAfP0t/tbpfYAB2zX+B2IxJgoaAY=; b=JhKegZoanBveIAu4Iy6fQtH2Rg
 suv+o4xiBOwUrgDWIaMVtnJWIz0LoDfELZFcfNC2LaluEfL7msbiKHMYd49dcKOaH7h5bvwDklHvX
 aAslIzOuAH/SKTKBpRbszAZnULulTlV2pQhJy/XVn4JWMwJTB61Z7bXzjTyfTR9hGSF0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4BrI-0005Kr-CV for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Dec 2022 02:14:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 76394B80943;
 Sun, 11 Dec 2022 02:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3113C433EF;
 Sun, 11 Dec 2022 02:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670724859;
 bh=a/CnnirOSX63le7g9QtLB93xh749SBxQVugGpj4kMRw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AfEUgw8nwtGw7rtNMgJQQictwc7FC2Dd73Q0iOSQzbZMMjqA2vMkH1Ku3Yf1L4n+F
 6wceNmWHSHvDW3S0xVuDi6uOCDsuZYlq1Lcwj+mBDA8Y/MBfcEO7Yx8qMfpoJg5EW+
 TgX3pbExAuar59AExP77CNkPClVR4PY8ivL8ckQRVD+cThXKp8slk2nrLEwzeAsiC1
 W5fr19K2jPyL3Aux8PZ0fPNdADanuutkv2JrlJAHUBIhCpfYK/IN5eZ/WQZWCO/FXJ
 jXvP9Dc4dhcj1n7A3Xi02grA1rlVuZ9JwwHykAXSbRPfbSlH9/zUxc+1CFAY944nNb
 EkH/E5SGYFdoQ==
Message-ID: <b8c54a6b-1f6d-9a86-b87c-e980902aa3a3@kernel.org>
Date: Sun, 11 Dec 2022 10:14:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221125114736.19423-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221125114736.19423-1-frank.li@vivo.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/25 19:47, Yangtao Li wrote: > Just for cleanup,
 no functional changes. > > Signed-off-by: Yangtao Li <frank.li@vivo.com>
 > --- > fs/f2fs/compress.c | 46 ++++++ [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p4BrI-0005Kr-CV
Subject: Re: [f2fs-dev] [PATCH] f2fs: do some cleanup for f2fs module init
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/11/25 19:47, Yangtao Li wrote:
> Just for cleanup, no functional changes.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/compress.c | 46 ++++++----------------------------------------
>   fs/f2fs/data.c     | 14 ++++----------
>   fs/f2fs/gc.c       |  4 +---
>   fs/f2fs/recovery.c |  4 +---
>   fs/f2fs/super.c    |  8 ++------
>   5 files changed, 14 insertions(+), 62 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index d315c2de136f..f920ba8e0e85 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -567,10 +567,7 @@ MODULE_PARM_DESC(num_compress_pages,
>   int f2fs_init_compress_mempool(void)
>   {
>   	compress_page_pool = mempool_create_page_pool(num_compress_pages, 0);
> -	if (!compress_page_pool)
> -		return -ENOMEM;
> -
> -	return 0;
> +	return compress_page_pool ? 0 : -ENOMEM;

I don't think this needs cleanup, other part looks good to me.

Thanks,

>   }
>   
>   void f2fs_destroy_compress_mempool(void)
> @@ -1983,9 +1980,7 @@ int f2fs_init_page_array_cache(struct f2fs_sb_info *sbi)
>   
>   	sbi->page_array_slab = f2fs_kmem_cache_create(slab_name,
>   					sbi->page_array_slab_size);
> -	if (!sbi->page_array_slab)
> -		return -ENOMEM;
> -	return 0;
> +	return sbi->page_array_slab ? 0 : -ENOMEM;
>   }
>   
>   void f2fs_destroy_page_array_cache(struct f2fs_sb_info *sbi)
> @@ -1993,53 +1988,24 @@ void f2fs_destroy_page_array_cache(struct f2fs_sb_info *sbi)
>   	kmem_cache_destroy(sbi->page_array_slab);
>   }
>   
> -static int __init f2fs_init_cic_cache(void)
> +int __init f2fs_init_compress_cache(void)
>   {
>   	cic_entry_slab = f2fs_kmem_cache_create("f2fs_cic_entry",
>   					sizeof(struct compress_io_ctx));
>   	if (!cic_entry_slab)
>   		return -ENOMEM;
> -	return 0;
> -}
> -
> -static void f2fs_destroy_cic_cache(void)
> -{
> -	kmem_cache_destroy(cic_entry_slab);
> -}
> -
> -static int __init f2fs_init_dic_cache(void)
> -{
>   	dic_entry_slab = f2fs_kmem_cache_create("f2fs_dic_entry",
>   					sizeof(struct decompress_io_ctx));
>   	if (!dic_entry_slab)
> -		return -ENOMEM;
> -	return 0;
> -}
> -
> -static void f2fs_destroy_dic_cache(void)
> -{
> -	kmem_cache_destroy(dic_entry_slab);
> -}
> -
> -int __init f2fs_init_compress_cache(void)
> -{
> -	int err;
> -
> -	err = f2fs_init_cic_cache();
> -	if (err)
> -		goto out;
> -	err = f2fs_init_dic_cache();
> -	if (err)
>   		goto free_cic;
>   	return 0;
>   free_cic:
> -	f2fs_destroy_cic_cache();
> -out:
> +	kmem_cache_destroy(cic_entry_slab);
>   	return -ENOMEM;
>   }
>   
>   void f2fs_destroy_compress_cache(void)
>   {
> -	f2fs_destroy_dic_cache();
> -	f2fs_destroy_cic_cache();
> +	kmem_cache_destroy(dic_entry_slab);
> +	kmem_cache_destroy(cic_entry_slab);
>   }
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 560fa80590e9..35c19248b1e2 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -39,10 +39,8 @@ static struct bio_set f2fs_bioset;
>   
>   int __init f2fs_init_bioset(void)
>   {
> -	if (bioset_init(&f2fs_bioset, F2FS_BIO_POOL_SIZE,
> -					0, BIOSET_NEED_BVECS))
> -		return -ENOMEM;
> -	return 0;
> +	return bioset_init(&f2fs_bioset, F2FS_BIO_POOL_SIZE,
> +					0, BIOSET_NEED_BVECS);
>   }
>   
>   void f2fs_destroy_bioset(void)
> @@ -4090,9 +4088,7 @@ int f2fs_init_post_read_wq(struct f2fs_sb_info *sbi)
>   	sbi->post_read_wq = alloc_workqueue("f2fs_post_read_wq",
>   						 WQ_UNBOUND | WQ_HIGHPRI,
>   						 num_online_cpus());
> -	if (!sbi->post_read_wq)
> -		return -ENOMEM;
> -	return 0;
> +	return sbi->post_read_wq ? 0 : -ENOMEM;
>   }
>   
>   void f2fs_destroy_post_read_wq(struct f2fs_sb_info *sbi)
> @@ -4105,9 +4101,7 @@ int __init f2fs_init_bio_entry_cache(void)
>   {
>   	bio_entry_slab = f2fs_kmem_cache_create("f2fs_bio_entry_slab",
>   			sizeof(struct bio_entry));
> -	if (!bio_entry_slab)
> -		return -ENOMEM;
> -	return 0;
> +	return bio_entry_slab ? 0 : -ENOMEM;
>   }
>   
>   void f2fs_destroy_bio_entry_cache(void)
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 0f967b1e98f2..4b0d2fa3a769 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1903,9 +1903,7 @@ int __init f2fs_create_garbage_collection_cache(void)
>   {
>   	victim_entry_slab = f2fs_kmem_cache_create("f2fs_victim_entry",
>   					sizeof(struct victim_entry));
> -	if (!victim_entry_slab)
> -		return -ENOMEM;
> -	return 0;
> +	return victim_entry_slab ? 0 : -ENOMEM;
>   }
>   
>   void f2fs_destroy_garbage_collection_cache(void)
> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> index dea95b48b647..77fd453949b1 100644
> --- a/fs/f2fs/recovery.c
> +++ b/fs/f2fs/recovery.c
> @@ -923,9 +923,7 @@ int __init f2fs_create_recovery_cache(void)
>   {
>   	fsync_entry_slab = f2fs_kmem_cache_create("f2fs_fsync_inode_entry",
>   					sizeof(struct fsync_inode_entry));
> -	if (!fsync_entry_slab)
> -		return -ENOMEM;
> -	return 0;
> +	return fsync_entry_slab ? 0 : -ENOMEM;
>   }
>   
>   void f2fs_destroy_recovery_cache(void)
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 31435c8645c8..1d56cba495a5 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -288,9 +288,7 @@ static int __init f2fs_create_casefold_cache(void)
>   {
>   	f2fs_cf_name_slab = f2fs_kmem_cache_create("f2fs_casefolded_name",
>   							F2FS_NAME_LEN);
> -	if (!f2fs_cf_name_slab)
> -		return -ENOMEM;
> -	return 0;
> +	return f2fs_cf_name_slab ? 0 : -ENOMEM;
>   }
>   
>   static void f2fs_destroy_casefold_cache(void)
> @@ -4646,9 +4644,7 @@ static int __init init_inodecache(void)
>   	f2fs_inode_cachep = kmem_cache_create("f2fs_inode_cache",
>   			sizeof(struct f2fs_inode_info), 0,
>   			SLAB_RECLAIM_ACCOUNT|SLAB_ACCOUNT, NULL);
> -	if (!f2fs_inode_cachep)
> -		return -ENOMEM;
> -	return 0;
> +	return f2fs_inode_cachep ? 0 : -ENOMEM;
>   }
>   
>   static void destroy_inodecache(void)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
