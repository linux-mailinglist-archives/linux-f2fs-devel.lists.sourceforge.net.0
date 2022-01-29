Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A7F4A2A9F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 Jan 2022 01:35:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nDbi9-0002Qq-8b; Sat, 29 Jan 2022 00:35:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nDbi7-0002Qh-EK
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 29 Jan 2022 00:35:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jrj8+mZSwnWirQV8+7eqsdj9hbVY3/p3l44vFnIombE=; b=VdYhFsHDxQCBv1kKFH4gKcSB5J
 /YpR0WsMkycTJejSncSUobtNYSBgwsTMrQ2bWb88gFyd47Wkx1YZ/X15jCFw6zXQGqvnbbC60VQ9a
 4d2AayzO+SCr7XCetgfx2TnomasvoyiY+MHUYq2H+lasy7KqYRjhbcMqjooo/OqYNfAs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jrj8+mZSwnWirQV8+7eqsdj9hbVY3/p3l44vFnIombE=; b=QntjOO/Bcx7oSBd3VC13GAcwbQ
 mKCef3x5snKDOlKPvtYHA8UzGmmzzFspJR1JD02X5/qllMU5L23NDHPh9fYFCY/1pmjAhYbq+h4L7
 8whag/tnwQXMecG28CRf6sgjFT2jwdf78PNKWefI+hyLTcHCVtBpJSN9V7nzswQdBBk8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nDbi5-001cxy-6F
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 29 Jan 2022 00:35:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8CD1BB80D99
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 29 Jan 2022 00:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 350A9C340E7;
 Sat, 29 Jan 2022 00:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643416513;
 bh=kw+3OTuPDX3/tG8tmhcjVaDk/mA/bOZLCX0XvOcKmD4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YaOC4DvVe8kU3LsMjzXMw9wjm5SiYfjaXhHKNuthOgxNYw9ArzXaEVQPqh0wNlQ7s
 ZoYEfSaoc8fjwbltCZQkywbTTmnO+n+n5rj/ySoSTjp3oDH7KDJKYvkorLiJIMVzxN
 BfXpBVA7IN1htEKssXqfgUZnD+xclxAZgyW0I353BjSavykv0S4Kt49qb18xbOGG8u
 3EwG9XkURp2V9Butaz+BcMDRAGB+j973hWaD4Se1csufGfa9+vW3E+Xz0Hx95UV7Vo
 iKJDOawtMg6v0jqX8CfddBzhTAPiQ+HW0XHDT6t8OqTxrC1oZtqkPqIFn6x1XboEzz
 i2TNzanbRPmtg==
Date: Fri, 28 Jan 2022 16:35:11 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YfSLvyMUd3lam415@google.com>
References: <20220128091920.1556480-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220128091920.1556480-1-chao@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/28, Chao Yu wrote: > Once IPU policy is enabled in some
 cases: > a) f2fs forces to use F2FS_IPU_FORCE in a small-sized volume > b)
 user configures IPU policy via sysfs It's contradictory to each other. How
 about just letting users decide to do what they want to do? IOWs, if user
 wants to do defrag, they should change ipu_policy on the fly. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nDbi5-001cxy-6F
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't check IPU policy during file
 defragment
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/28, Chao Yu wrote:
> Once IPU policy is enabled in some cases:
> a) f2fs forces to use F2FS_IPU_FORCE in a small-sized volume
> b) user configures IPU policy via sysfs

It's contradictory to each other. How about just letting users decide to do what
they want to do? IOWs, if user wants to do defrag, they should change ipu_policy
on the fly.

> 
> Then we may fail to defragment file via ioctl due to IPU policy check,
> it doesn't make sense, so let's change to use IPU policy for common
> data writeback, rather than for specific data writeback, e.g. GC,
> defragment, and so on.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/data.c | 15 ++++++++++-----
>  fs/f2fs/f2fs.h |  3 ++-
>  fs/f2fs/file.c | 17 ++++++++++-------
>  3 files changed, 22 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 0f124e8de1d4..bce7ecac8976 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2530,6 +2530,9 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
>  	if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
>  		return true;
>  
> +	if (is_inode_flag_set(inode, FI_DEFRAG_PROCESS))
> +		return true;
> +
>  	if (fio) {
>  		if (page_private_gcing(fio->page))
>  			return true;
> @@ -3154,8 +3157,8 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
>  			f2fs_available_free_memory(sbi, DIRTY_DENTS))
>  		goto skip_write;
>  
> -	/* skip writing during file defragment */
> -	if (is_inode_flag_set(inode, FI_DO_DEFRAG))
> +	/* skip writing in file defragment preparing stage */
> +	if (is_inode_flag_set(inode, FI_DEFRAG_PREPARE))
>  		goto skip_write;
>  
>  	trace_f2fs_writepages(mapping->host, wbc, DATA);
> @@ -3733,7 +3736,7 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
>  		f2fs_allocate_new_section(sbi, CURSEG_COLD_DATA_PINNED, false);
>  		f2fs_unlock_op(sbi);
>  
> -		set_inode_flag(inode, FI_DO_DEFRAG);
> +		set_inode_flag(inode, FI_DEFRAG_PREPARE);
>  
>  		for (blkofs = 0; blkofs < blk_per_sec; blkofs++) {
>  			struct page *page;
> @@ -3750,9 +3753,11 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
>  			f2fs_put_page(page, 1);
>  		}
>  
> -		clear_inode_flag(inode, FI_DO_DEFRAG);
> +		clear_inode_flag(inode, FI_DEFRAG_PREPARE);
>  
> +		set_inode_flag(inode, FI_DEFRAG_PROCESS);
>  		ret = filemap_fdatawrite(inode->i_mapping);
> +		clear_inode_flag(inode, FI_DEFRAG_PROCESS);
>  
>  		f2fs_up_write(&sbi->pin_sem);
>  
> @@ -3761,7 +3766,7 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
>  	}
>  
>  done:
> -	clear_inode_flag(inode, FI_DO_DEFRAG);
> +	clear_inode_flag(inode, FI_DEFRAG_PREPARE);
>  	clear_inode_flag(inode, FI_ALIGNED_WRITE);
>  
>  	filemap_invalidate_unlock(inode->i_mapping);
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 8178a9152e49..4b905059a81e 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -733,7 +733,8 @@ enum {
>  	FI_DROP_CACHE,		/* drop dirty page cache */
>  	FI_DATA_EXIST,		/* indicate data exists */
>  	FI_INLINE_DOTS,		/* indicate inline dot dentries */
> -	FI_DO_DEFRAG,		/* indicate defragment is running */
> +	FI_DEFRAG_PREPARE,	/* indicate defragment is preparing */
> +	FI_DEFRAG_PROCESS,	/* indicate defragment is processing */
>  	FI_DIRTY_FILE,		/* indicate regular/symlink has dirty pages */
>  	FI_PREALLOCATED_ALL,	/* all blocks for write were preallocated */
>  	FI_HOT_DATA,		/* indicate file is hot */
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 6ccdd6e347e2..696f4a175228 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2559,10 +2559,6 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
>  	bool fragmented = false;
>  	int err;
>  
> -	/* if in-place-update policy is enabled, don't waste time here */
> -	if (f2fs_should_update_inplace(inode, NULL))
> -		return -EINVAL;
> -
>  	pg_start = range->start >> PAGE_SHIFT;
>  	pg_end = (range->start + range->len) >> PAGE_SHIFT;
>  
> @@ -2570,6 +2566,11 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
>  
>  	inode_lock(inode);
>  
> +	if (f2fs_is_pinned_file(inode)) {
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
>  	/* writeback all dirty pages in the range */
>  	err = filemap_write_and_wait_range(inode->i_mapping, range->start,
>  						range->start + range->len - 1);
> @@ -2651,7 +2652,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
>  			goto check;
>  		}
>  
> -		set_inode_flag(inode, FI_DO_DEFRAG);
> +		set_inode_flag(inode, FI_DEFRAG_PREPARE);
>  
>  		idx = map.m_lblk;
>  		while (idx < map.m_lblk + map.m_len && cnt < blk_per_seg) {
> @@ -2676,14 +2677,16 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
>  		if (map.m_lblk < pg_end && cnt < blk_per_seg)
>  			goto do_map;
>  
> -		clear_inode_flag(inode, FI_DO_DEFRAG);
> +		clear_inode_flag(inode, FI_DEFRAG_PREPARE);
>  
> +		set_inode_flag(inode, FI_DEFRAG_PROCESS);
>  		err = filemap_fdatawrite(inode->i_mapping);
> +		clear_inode_flag(inode, FI_DEFRAG_PROCESS);
>  		if (err)
>  			goto out;
>  	}
>  clear_out:
> -	clear_inode_flag(inode, FI_DO_DEFRAG);
> +	clear_inode_flag(inode, FI_DEFRAG_PREPARE);
>  out:
>  	inode_unlock(inode);
>  	if (!err)
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
