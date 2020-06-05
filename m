Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8F41EF0CA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Jun 2020 07:03:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jh4W9-0004ZX-CQ; Fri, 05 Jun 2020 05:03:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jh4W8-0004ZK-7p
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jun 2020 05:03:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9SfYwud17a8hVSTx+4Njl0J6U2KmGflC10Ffpfmolv0=; b=geAfY/1yMiBuKmczxWrugeruI/
 yHQKW2GQjWpY6l2NMkqtOZ4l8KtRwR0XHhVIAR0Lw4Wk3kvf/loS6qOQ3oCffupUF8CEw4q4m35Xd
 H7WFHsSsR/uUvccYHELLATJdUa+9k6iq9FP8TopHQ8s8hPpf6R7Y4lGyQNitDW26dSPU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9SfYwud17a8hVSTx+4Njl0J6U2KmGflC10Ffpfmolv0=; b=GBfsFYomcaOqrX/dOiP3S0JTmw
 8+//7pnMRRhnBRZfAXHARHZyDLoqTplhDXpc1jouNUtGKf0oetll2bzrShjZ+ddIrdtlPDeB4ELmi
 X5/IAhcx6FNz92Sarojx8QgCR4bQVZucbFEMfNjfKUAPJKsgmyy7Xkn7972uBVQvcCag=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jh4W6-00CRCJ-P9
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jun 2020 05:03:44 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A37A207D3;
 Fri,  5 Jun 2020 05:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591333412;
 bh=Oiz0GEPc/OP4A+IKrY546UnzX9cKqMrRegSqqiHACGk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uhqcfsULVmFmJu4qj3baImDVvWnt3beuxHI27EQwJfYUGXwT81G5MHvJh1U06a8/m
 vFRkcmN/IuPX69Fu4BpoCn1WOd2uwRZDlrksAIfNlT0KxkblSu2r5jHa61ohxg6g6m
 rvPJU+k/jeg6LeBfCYAbIbLDBh66a7D22j51KJ4k=
Date: Thu, 4 Jun 2020 22:03:31 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200605050331.GA109296@google.com>
References: <20200605045748.34018-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200605045748.34018-1-ebiggers@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jh4W6-00CRCJ-P9
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: don't return vmalloc() memory from
 f2fs_kmalloc()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/04, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> kmalloc() returns kmalloc'ed memory, and kvmalloc() returns either
> kmalloc'ed or vmalloc'ed memory.  But the f2fs wrappers, f2fs_kmalloc()
> and f2fs_kvmalloc(), both return both kinds of memory.
> 
> It's redundant to have two functions that do the same thing, and also
> breaking the standard naming convention is causing bugs since people
> assume it's safe to kfree() memory allocated by f2fs_kmalloc().  See
> e.g. the various allocations in fs/f2fs/compress.c.
> 
> Fix this by making f2fs_kmalloc() just use kmalloc().  And to avoid
> re-introducing the allocation failures that the vmalloc fallback was
> intended to fix, convert the largest allocations to use f2fs_kvmalloc().
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
> 
> v2: also use f2fs_kvzalloc() in init_blkz_info()

Thanks, applied.

> 
>  fs/f2fs/checkpoint.c | 4 ++--
>  fs/f2fs/f2fs.h       | 8 +-------
>  fs/f2fs/node.c       | 8 ++++----
>  fs/f2fs/super.c      | 2 +-
>  4 files changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 3dc3ac6fe14324..23606493025165 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -895,8 +895,8 @@ int f2fs_get_valid_checkpoint(struct f2fs_sb_info *sbi)
>  	int i;
>  	int err;
>  
> -	sbi->ckpt = f2fs_kzalloc(sbi, array_size(blk_size, cp_blks),
> -				 GFP_KERNEL);
> +	sbi->ckpt = f2fs_kvzalloc(sbi, array_size(blk_size, cp_blks),
> +				  GFP_KERNEL);
>  	if (!sbi->ckpt)
>  		return -ENOMEM;
>  	/*
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 50e6cdf20b7331..c812fb8e2d9c7a 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2998,18 +2998,12 @@ static inline bool f2fs_may_extent_tree(struct inode *inode)
>  static inline void *f2fs_kmalloc(struct f2fs_sb_info *sbi,
>  					size_t size, gfp_t flags)
>  {
> -	void *ret;
> -
>  	if (time_to_inject(sbi, FAULT_KMALLOC)) {
>  		f2fs_show_injection_info(sbi, FAULT_KMALLOC);
>  		return NULL;
>  	}
>  
> -	ret = kmalloc(size, flags);
> -	if (ret)
> -		return ret;
> -
> -	return kvmalloc(size, flags);
> +	return kmalloc(size, flags);
>  }
>  
>  static inline void *f2fs_kzalloc(struct f2fs_sb_info *sbi,
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index e0bb0f7e0506ee..03e24df1c84f5c 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -2993,7 +2993,7 @@ static int __get_nat_bitmaps(struct f2fs_sb_info *sbi)
>  		return 0;
>  
>  	nm_i->nat_bits_blocks = F2FS_BLK_ALIGN((nat_bits_bytes << 1) + 8);
> -	nm_i->nat_bits = f2fs_kzalloc(sbi,
> +	nm_i->nat_bits = f2fs_kvzalloc(sbi,
>  			nm_i->nat_bits_blocks << F2FS_BLKSIZE_BITS, GFP_KERNEL);
>  	if (!nm_i->nat_bits)
>  		return -ENOMEM;
> @@ -3126,9 +3126,9 @@ static int init_free_nid_cache(struct f2fs_sb_info *sbi)
>  	int i;
>  
>  	nm_i->free_nid_bitmap =
> -		f2fs_kzalloc(sbi, array_size(sizeof(unsigned char *),
> -					     nm_i->nat_blocks),
> -			     GFP_KERNEL);
> +		f2fs_kvzalloc(sbi, array_size(sizeof(unsigned char *),
> +					      nm_i->nat_blocks),
> +			      GFP_KERNEL);
>  	if (!nm_i->free_nid_bitmap)
>  		return -ENOMEM;
>  
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index a71da699cb2d55..f3c15116954218 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3033,7 +3033,7 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
>  	if (nr_sectors & (bdev_zone_sectors(bdev) - 1))
>  		FDEV(devi).nr_blkz++;
>  
> -	FDEV(devi).blkz_seq = f2fs_kzalloc(sbi,
> +	FDEV(devi).blkz_seq = f2fs_kvzalloc(sbi,
>  					BITS_TO_LONGS(FDEV(devi).nr_blkz)
>  					* sizeof(unsigned long),
>  					GFP_KERNEL);
> -- 
> 2.26.2
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
