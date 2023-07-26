Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C019F762824
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Jul 2023 03:25:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOTGx-00072W-2w;
	Wed, 26 Jul 2023 01:25:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qOTGv-00072N-EE
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 01:25:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z2JWsdZng/wy82oyw+Jt0LN5rE3m0kE9g+PZ2zwZZCY=; b=MofuIXIBFrKkoLsxhZ8Ziu0e/M
 yeD7bfAy78tGJOixHblgL2ZBbUtkao4NQZKeGqt5x1HvNsdO+Tqpq5bgfb/fG3fxjhPloot7trbPi
 cAs5iAEPFWxQ6/hFFFZzpQazAGb5soZ7CxHHdDdXNYKQB8BLZG7/Nq2wyuZGNGWFh25w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z2JWsdZng/wy82oyw+Jt0LN5rE3m0kE9g+PZ2zwZZCY=; b=MtZP1XcIhjmijBGED4m1K4pCYm
 L3k18CJF621Mp4q/vn3NsHxe2AoEV2eBUaT/gX+ZlYktm7LNhV4SZPrAcN3ffOuu78dCu/C8iRQUz
 ftVf4B5bqT+oOaLyHt6KBLWfyjLcVixVGqOqPWEdMoRm1Miatoc9VmxUaS4xkWNQVFH0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qOTGs-002TW0-55 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 01:25:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 443366140F;
 Wed, 26 Jul 2023 01:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B4C4C433C7;
 Wed, 26 Jul 2023 01:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690334688;
 bh=TDYGviEhpX5ACllUm9tuh8DUX/RaBzuoFvskgQSUFhU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=d8c9L0jY2U1zx/UGyKhEyoXy6ZuapD4Iave4GXF6Ns2pkTFKZay9TMDmyCsV3h7lb
 m/o+UzgJZrYOtuV+rBFQ7nL93u8A/CVDba8tUSvnDgKpIZ0H66EswCHeTwG8wnZZDO
 nr/ioyOe+eP9880EzkNeMhc/3JyvNQ6cVZVIW85Wn3CNeo4ibV/i+fqmyHjXic5jb7
 wDXLy4k9DIoM8fEqpyIWhVU7n8NJYzMmZnWsYB8trThu4+9vmqm4x+zYGsFCiBfv2z
 YEbKLdf7lom2095UsB6xIFORDQrHyHshvRiFljmI9EtaRMEZDsqH3NizeSQmLfhrh6
 1+qUz6tjKRcBw==
Message-ID: <16625fbb-3dc0-34d5-ee75-fe010aa0d9ec@kernel.org>
Date: Wed, 26 Jul 2023 09:24:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Chao Liu <chaoliu719@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230725013607.4134123-1-chaoliu719@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230725013607.4134123-1-chaoliu719@gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/7/25 9:36,
 Chao Liu wrote: > From: Chao Liu <liuchao@coolpad.com>
 > > This patch is a cleanup: > 1. Merge __drop_largest_extent() since it
 has only one caller. > 2. Introduce __unlock_tree_wit [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qOTGs-002TW0-55
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce two helper functions for
 the largest cached extent
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
Cc: Chao Liu <liuchao@coolpad.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/7/25 9:36, Chao Liu wrote:
> From: Chao Liu <liuchao@coolpad.com>
> 
> This patch is a cleanup:
> 1. Merge __drop_largest_extent() since it has only one caller.
> 2. Introduce __unlock_tree_with_checking_largest() and
>     __drop_largest_extent() to help manage largest and largest_update
>     in extent_tree.
> 
> Signed-off-by: Chao Liu <liuchao@coolpad.com>
> ---
> v2: Make sure et->largest_updated gets updated within &et->lock.
>      Thanks to Chao Yu for pointing out.
> ---
>   fs/f2fs/extent_cache.c | 66 ++++++++++++++++++++----------------------
>   fs/f2fs/f2fs.h         |  4 +--
>   2 files changed, 33 insertions(+), 37 deletions(-)
> 
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index 0e2d49140c07f..cfc69621a8a26 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -19,6 +19,12 @@
>   #include "node.h"
>   #include <trace/events/f2fs.h>
>   
> +static void __drop_largest_extent(struct extent_tree *et)
> +{
> +	et->largest.len = 0;
> +	et->largest_updated = true;
> +}
> +
>   bool sanity_check_extent_cache(struct inode *inode)
>   {
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> @@ -35,8 +41,7 @@ bool sanity_check_extent_cache(struct inode *inode)
>   
>   	/* Let's drop, if checkpoint got corrupted. */
>   	if (is_set_ckpt_flags(sbi, CP_ERROR_FLAG)) {
> -		ei->len = 0;
> -		et->largest_updated = true;
> +		__drop_largest_extent(et);

__drop_largest_extent_force(et);

>   		return true;
>   	}
>   
> @@ -310,6 +315,8 @@ static void __detach_extent_node(struct f2fs_sb_info *sbi,
>   
>   	if (et->cached_en == en)
>   		et->cached_en = NULL;
> +
> +	/* keep the largest as we can still use it */

The comments doesn't match below code?

>   	kmem_cache_free(extent_node_slab, en);
>   }
>   
> @@ -385,15 +392,6 @@ static unsigned int __free_extent_tree(struct f2fs_sb_info *sbi,
>   	return count - atomic_read(&et->node_cnt);
>   }
>   
> -static void __drop_largest_extent(struct extent_tree *et,
> -					pgoff_t fofs, unsigned int len)
> -{
> -	if (fofs < et->largest.fofs + et->largest.len &&
> -			fofs + len > et->largest.fofs) {
> -		et->largest.len = 0;
> -		et->largest_updated = true;
> -	}
> -}

What about:

static void __drop_largest_extent_cond(struct extent_tree *et,
					pgoff_t fofs, unsigned int len,
					bool force)
{
	if (force || (fofs < et->largest.fofs + et->largest.len &&
			fofs + len > et->largest.fofs)) {
		et->largest.len = 0;
		et->largest_updated = true;
	}
}

static void __drop_largest_extent_force(struct extent_tree *et)
{
	__drop_largest_extent_cond(et, 0, 0, true);
}

>   
>   void f2fs_init_read_extent_tree(struct inode *inode, struct page *ipage)
>   {
> @@ -601,6 +599,19 @@ static struct extent_node *__insert_extent_tree(struct f2fs_sb_info *sbi,
>   	return en;
>   }
>   
> +static void __unlock_tree_with_checking_largest(struct extent_tree *et,
> +						struct inode *inode)
> +{
> +	if (et->type == EX_READ && et->largest_updated) {
> +		et->largest_updated = false;
> +		write_unlock(&et->lock);
> +		f2fs_mark_inode_dirty_sync(inode, true);
> +		return;
> +	}
> +
> +	write_unlock(&et->lock);
> +}
> +
>   static void __update_extent_tree_range(struct inode *inode,
>   			struct extent_info *tei, enum extent_type type)
>   {
> @@ -612,7 +623,6 @@ static void __update_extent_tree_range(struct inode *inode,
>   	struct rb_node **insert_p = NULL, *insert_parent = NULL;
>   	unsigned int fofs = tei->fofs, len = tei->len;
>   	unsigned int end = fofs + len;
> -	bool updated = false;
>   	bool leftmost = false;
>   
>   	if (!et)
> @@ -636,11 +646,10 @@ static void __update_extent_tree_range(struct inode *inode,
>   		prev = et->largest;
>   		dei.len = 0;
>   
> -		/*
> -		 * drop largest extent before lookup, in case it's already
> -		 * been shrunk from extent tree
> -		 */
> -		__drop_largest_extent(et, fofs, len);

__drop_largest_extent_cond(et, fofs, len, false);

> +		/* updates may cause largest extent cache to become invalid */
> +		if (fofs < et->largest.fofs + et->largest.len &&
> +		    fofs + len > et->largest.fofs)
> +			__drop_largest_extent(et);
>   	}
>   
>   	/* 1. lookup first extent node in range [fofs, fofs + len - 1] */
> @@ -733,8 +742,7 @@ static void __update_extent_tree_range(struct inode *inode,
>   		if (dei.len >= 1 &&
>   				prev.len < F2FS_MIN_EXTENT_LEN &&
>   				et->largest.len < F2FS_MIN_EXTENT_LEN) {
> -			et->largest.len = 0;
> -			et->largest_updated = true;
> +			__drop_largest_extent(et);

__drop_largest_extent_force(et);

>   			set_inode_flag(inode, FI_NO_EXTENT);
>   		}
>   	}
> @@ -742,10 +750,6 @@ static void __update_extent_tree_range(struct inode *inode,
>   	if (is_inode_flag_set(inode, FI_NO_EXTENT))
>   		__free_extent_tree(sbi, et);
>   
> -	if (et->largest_updated) {
> -		et->largest_updated = false;
> -		updated = true;
> -	}

I guess we'd better keep previous logic.

>   	goto out_read_extent_cache;
>   update_age_extent_cache:
>   	if (!tei->last_blocks)
> @@ -757,10 +761,7 @@ static void __update_extent_tree_range(struct inode *inode,
>   		__insert_extent_tree(sbi, et, &ei,
>   					insert_p, insert_parent, leftmost);
>   out_read_extent_cache:
> -	write_unlock(&et->lock);
> -
> -	if (updated)
> -		f2fs_mark_inode_dirty_sync(inode, true);

Ditto,

> +	__unlock_tree_with_checking_largest(et, inode);
>   }
>   
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
> @@ -1092,7 +1093,6 @@ static void __drop_extent_tree(struct inode *inode, enum extent_type type)
>   {
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	struct extent_tree *et = F2FS_I(inode)->extent_tree[type];
> -	bool updated = false;
>   
>   	if (!__may_extent_tree(inode, type))
>   		return;
> @@ -1101,14 +1101,10 @@ static void __drop_extent_tree(struct inode *inode, enum extent_type type)
>   	__free_extent_tree(sbi, et);
>   	if (type == EX_READ) {
>   		set_inode_flag(inode, FI_NO_EXTENT);
> -		if (et->largest.len) {
> -			et->largest.len = 0;
> -			updated = true;
> -		}
> +		if (et->largest.len)
> +			__drop_largest_extent(et);
>   	}
> -	write_unlock(&et->lock);
> -	if (updated)
> -		f2fs_mark_inode_dirty_sync(inode, true);

Ditto,

Thanks,

> +	__unlock_tree_with_checking_largest(et, inode);
>   }
>   
>   void f2fs_drop_extent_tree(struct inode *inode)
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index d372bedb0fe4e..da02e120e5ea6 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -665,7 +665,7 @@ struct extent_tree {
>   
>   struct extent_tree_info {
>   	struct radix_tree_root extent_tree_root;/* cache extent cache entries */
> -	struct mutex extent_tree_lock;	/* locking extent radix tree */
> +	struct mutex extent_tree_lock;		/* locking extent radix tree */
>   	struct list_head extent_list;		/* lru list for shrinker */
>   	spinlock_t extent_lock;			/* locking extent lru list */
>   	atomic_t total_ext_tree;		/* extent tree count */
> @@ -766,7 +766,7 @@ enum {
>   	FI_ACL_MODE,		/* indicate acl mode */
>   	FI_NO_ALLOC,		/* should not allocate any blocks */
>   	FI_FREE_NID,		/* free allocated nide */
> -	FI_NO_EXTENT,		/* not to use the extent cache */
> +	FI_NO_EXTENT,		/* not to use the read extent cache */
>   	FI_INLINE_XATTR,	/* used for inline xattr */
>   	FI_INLINE_DATA,		/* used for inline data*/
>   	FI_INLINE_DENTRY,	/* used for inline dentry */


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
