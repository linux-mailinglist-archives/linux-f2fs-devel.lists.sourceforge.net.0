Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 180B51C6A49
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 May 2020 09:44:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWEik-0000Gx-8v; Wed, 06 May 2020 07:43:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jWEij-0000Gh-2j
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 07:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nx4ILyLLDNA3d+GNinmAHLTuM48UdB6KVc/isnFjC8I=; b=NlJvF8dqtJdkILXPK619WOIFkh
 d+q7f8QPXfNjG/LjEpv+qElaFfabYSLkXJRiQwD3XTnnraPTAxys1C6eFnCbiSbumYg/O4OM7Lptg
 wuHWAftsKxfQhF+8ZCNbY4bGEI0x4yEk/8eKuZIqhZByCEUUehEHkt2c7GEJNK8+vb3w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nx4ILyLLDNA3d+GNinmAHLTuM48UdB6KVc/isnFjC8I=; b=NH1u7I4FLl6cauc1Hw1qix1wCg
 shZpHmqX5M9NBNnccd+w5cgcqyESl+SfoRpMOYRAAbvdPYhmq/p14uvstN/AOsf4Cw2+KUeBIIPbg
 XurNgj3Efx7boIQugCYwbUJ8hM69R+VD6EuFnPgOH9jVUdJDRED+V/3JXRftNFxQhHWE=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWEie-009Opo-BM
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 06 May 2020 07:43:57 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D3A9C58B80A0BF31197A;
 Wed,  6 May 2020 15:43:37 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 6 May 2020
 15:43:37 +0800
To: Eric Biggers <ebiggers@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20200505204823.211214-1-ebiggers@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <4143486a-41bf-e92f-cc99-c6a2d0a8270c@huawei.com>
Date: Wed, 6 May 2020 15:43:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200505204823.211214-1-ebiggers@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWEie-009Opo-BM
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't return vmalloc() memory from
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/5/6 4:48, Eric Biggers wrote:
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

I've submitted one patch since you suggested when commented in compression
support patch.

I remember Jaegeuk prefer to use f2fs_kvmalloc() to instead f2fs_kmalloc(),
and keep the order of kmalloc - failed - kvmalloc.

Thanks,

> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/f2fs/checkpoint.c | 4 ++--
>  fs/f2fs/f2fs.h       | 8 +-------
>  fs/f2fs/node.c       | 8 ++++----
>  3 files changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 97b6378554b406..ac5b47f15f5e77 100644
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
> index d036a31a97e84e..bc4c5b9b1bf14c 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2953,18 +2953,12 @@ static inline bool f2fs_may_extent_tree(struct inode *inode)
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
> index 4da0d8713df5cb..e660af55565c61 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -2934,7 +2934,7 @@ static int __get_nat_bitmaps(struct f2fs_sb_info *sbi)
>  		return 0;
>  
>  	nm_i->nat_bits_blocks = F2FS_BLK_ALIGN((nat_bits_bytes << 1) + 8);
> -	nm_i->nat_bits = f2fs_kzalloc(sbi,
> +	nm_i->nat_bits = f2fs_kvzalloc(sbi,
>  			nm_i->nat_bits_blocks << F2FS_BLKSIZE_BITS, GFP_KERNEL);
>  	if (!nm_i->nat_bits)
>  		return -ENOMEM;
> @@ -3067,9 +3067,9 @@ static int init_free_nid_cache(struct f2fs_sb_info *sbi)
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
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
