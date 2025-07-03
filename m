Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F088AF71FA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Jul 2025 13:22:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shFvKGTIlTBBKiltz7SDyS/RsD1auxDlq9NDBSBnRwU=; b=BOQVz/nqeqKgvpxAK4MtjDjUOm
	P5NJwnfF5gWmI7VMITQjhWTvfLOqxBaWqoKWu8FEJglLYX4vCx+z+AFEfitLWEwkzmQuyl/m0kJ0d
	eWBYyLOlfgvaf2iOMoo9XFERr5cU9RksmlU3QKh8HYHhNIt3daGyj3GBkr0S/is2lqk8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uXI0c-0005cn-Vt;
	Thu, 03 Jul 2025 11:21:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uXI0a-0005cV-G4
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Jul 2025 11:21:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R4Sz7UWiivb/KBLdGAVaqd966FkcRCN5zwwVF+Cy1rQ=; b=iTCTHK5ZgEA1VIa8EtMwFr6HYh
 5sT/hGD+Q6N/VIYTntBaV0yXnoniA6XQeErG1n1wPBDrL7QbrW3ZohlZik5738VeKSh+ujWzVXRqh
 Efy/l+De2RAup4nDTwoXw8G+TSEd/+5dQPBMx8yQPBq6mi6YNhfp4kkVosBuG340orqU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R4Sz7UWiivb/KBLdGAVaqd966FkcRCN5zwwVF+Cy1rQ=; b=FJ5ksXwo7/tQpDzeEXZkv5b1Wy
 fyDSbaF/rYp9bb3l5a5qU+FdrM/AWEC1gkTc/TgS0xAcbQbRkZvebCIB39WF9yHKoZ2SO5P7igL4q
 Ny7ZwDEZOyI1OOKMSs/Pk0XjwOi6/a6/y5x1RTT4AdlWxJ9H4vEhuYa10O43IC+5eQ9Y=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uXI0a-0001sF-18 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Jul 2025 11:21:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4441945650;
 Thu,  3 Jul 2025 11:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23355C4CEE3;
 Thu,  3 Jul 2025 11:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751541694;
 bh=eZ2wZrqvO37gkclL4TPOd6LJSnexB0K+rQp6ZNaouz8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=fuk7C/FtVhlXz8inIfJssz7dNk7PqcJTVIq3In7rPm/udxQb7e7bmSE+m17Jbg1pr
 GvMjCfB1oCJf7Rcq+lO4O1McRN50FZQjqkHMhH94+0LurTPBoz1ZFA2g2nOvxL2NyL
 6AULC1hFDuAOdWY83uOc3IsDN4zgVUU4nUIy6CmakwvzgUcvj6n0r7pcltRuWwZUsn
 kCfNTJDsS6AThF8fpKQMyvpLMNsmPgG6ekPmPu156FVXY226a31+4ymhVX0r2atEHn
 LJ7Cw2kG+tbfZNT6ups3Vb2ut4BKNjFhEiOh9L78XZcOb1U+i82bnPefNniKYgUdKc
 EXTgwxwe5REwQ==
Message-ID: <7e0d3bc3-b552-4545-8892-19998c9cd33b@kernel.org>
Date: Thu, 3 Jul 2025 19:21:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiazi Li <jqqlijiazi@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250703061358.13425-1-jqqlijiazi@gmail.com>
Content-Language: en-US
In-Reply-To: <20250703061358.13425-1-jqqlijiazi@gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/3/25 14:13, Jiazi Li wrote: > options in f2fs_fill_super
 is alloc by kstrdup: > options = kstrdup((const char *)data, GFP_KERNEL)
 > sit_bitmap[_mir], nat_bitmap[_mir] are alloc by kmemdup: > sit_ [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uXI0a-0001sF-18
Subject: Re: [f2fs-dev] [PATCH] f2fs: use kfree() instead of kvfree() to
 free some memory
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: "peixuan.qiu" <peixuan.qiu@transsion.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/3/25 14:13, Jiazi Li wrote:
> options in f2fs_fill_super is alloc by kstrdup:
> 	options = kstrdup((const char *)data, GFP_KERNEL)
> sit_bitmap[_mir], nat_bitmap[_mir] are alloc by kmemdup:
> 	sit_i->sit_bitmap = kmemdup(src_bitmap, sit_bitmap_size, GFP_KERNEL);
> 	sit_i->sit_bitmap_mir = kmemdup(src_bitmap,
> 					sit_bitmap_size, GFP_KERNEL);
> 	nm_i->nat_bitmap = kmemdup(version_bitmap, nm_i->bitmap_size,
> 					GFP_KERNEL);
> 	nm_i->nat_bitmap_mir = kmemdup(version_bitmap, nm_i->bitmap_size,
> 					GFP_KERNEL);
> write_io is alloc by f2fs_kmalloc:
> 	sbi->write_io[i] = f2fs_kmalloc(sbi,
> 			array_size(n, sizeof(struct f2fs_bio_info))
> 
> Use kfree is more efficient.
> 
> Signed-off-by: Jiazi Li <jqqlijiazi@gmail.com>
> Signed-off-by: peixuan.qiu <peixuan.qiu@transsion.com>
> ---
>  fs/f2fs/node.c    | 4 ++--
>  fs/f2fs/segment.c | 4 ++--
>  fs/f2fs/super.c   | 8 ++++----
>  3 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 2fd287f2bca4..be3d38d1fdee 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -3408,10 +3408,10 @@ void f2fs_destroy_node_manager(struct f2fs_sb_info *sbi)
>  	}
>  	kvfree(nm_i->free_nid_count);
>  
> -	kvfree(nm_i->nat_bitmap);
> +	kfree(nm_i->nat_bitmap);
>  	kvfree(nm_i->nat_bits);
>  #ifdef CONFIG_F2FS_CHECK_FS
> -	kvfree(nm_i->nat_bitmap_mir);
> +	kfree(nm_i->nat_bitmap_mir);
>  #endif
>  	sbi->nm_info = NULL;
>  	kfree(nm_i);
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 5653716460ea..b6baf099c407 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -5813,9 +5813,9 @@ static void destroy_sit_info(struct f2fs_sb_info *sbi)
>  	kvfree(sit_i->dirty_sentries_bitmap);
>  
>  	SM_I(sbi)->sit_info = NULL;
> -	kvfree(sit_i->sit_bitmap);
> +	kfree(sit_i->sit_bitmap);
>  #ifdef CONFIG_F2FS_CHECK_FS
> -	kvfree(sit_i->sit_bitmap_mir);
> +	kfree(sit_i->sit_bitmap_mir);
>  	kvfree(sit_i->invalid_segmap);
>  #endif
>  	kfree(sit_i);
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 9b58cf891a66..c4810ddc1db0 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1718,7 +1718,7 @@ static void f2fs_put_super(struct super_block *sb)
>  	destroy_percpu_info(sbi);
>  	f2fs_destroy_iostat(sbi);
>  	for (i = 0; i < NR_PAGE_TYPE; i++)
> -		kvfree(sbi->write_io[i]);
> +		kfree(sbi->write_io[i]);
>  #if IS_ENABLED(CONFIG_UNICODE)
>  	utf8_unload(sb->s_encoding);
>  #endif
> @@ -4935,7 +4935,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  		if (err)
>  			goto sync_free_meta;
>  	}
> -	kvfree(options);
> +	kfree(options);

It will conflict w/ new mount API patchset, anyway, it looks good to me.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

>  
>  	/* recover broken superblock */
>  	if (recovery) {
> @@ -5018,7 +5018,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  	f2fs_destroy_iostat(sbi);
>  free_bio_info:
>  	for (i = 0; i < NR_PAGE_TYPE; i++)
> -		kvfree(sbi->write_io[i]);
> +		kfree(sbi->write_io[i]);
>  
>  #if IS_ENABLED(CONFIG_UNICODE)
>  	utf8_unload(sb->s_encoding);
> @@ -5030,7 +5030,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
>  		kfree(F2FS_OPTION(sbi).s_qf_names[i]);
>  #endif
>  	fscrypt_free_dummy_policy(&F2FS_OPTION(sbi).dummy_enc_policy);
> -	kvfree(options);
> +	kfree(options);
>  free_sb_buf:
>  	kfree(raw_super);
>  free_sbi:



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
