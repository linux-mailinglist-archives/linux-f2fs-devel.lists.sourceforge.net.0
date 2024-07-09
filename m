Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 072A892C41B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Jul 2024 21:50:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sRGqv-0004lR-3a;
	Tue, 09 Jul 2024 19:50:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1sRGqu-0004lL-Hs
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Jul 2024 19:50:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lxTs50DBSTmsiTQviipN/qgtan2Mbgwn6OeiLpxMXd0=; b=jfsJYe9lSBArtBTV5CVsaf/y41
 EAxnVYLuJq6cu4Vpip7pVkjTBA4ZxFn5Tg7a/cqQlNfBhKEsG5o9KOVLXAmFdxKLA0cPmeWgyragL
 U9UehG84KUjDUc0J89XDwofXUVbjxgWI4p9+728nC3nV5SqX63Vzv8FjH5WA5Uyb9hpQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lxTs50DBSTmsiTQviipN/qgtan2Mbgwn6OeiLpxMXd0=; b=PzinB4EYHmwGh+YaLpq/YuYeWq
 WcCsKSGdK14n9DVu0fohMdrLR59bInDENBUqBCw7iEB1+5h8fhagaZTpUaCQjzUSLUNtJ8TkD/GVj
 V0b9XN9vg2TUmjWOVktC3GCQ5UaeuugNfmN3+baLWXAhckiWZu5065lxNbsh+EYEphtc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sRGqv-0002tE-KU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Jul 2024 19:50:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 80EA661668;
 Tue,  9 Jul 2024 19:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D582FC3277B;
 Tue,  9 Jul 2024 19:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720554611;
 bh=wTpFruy4QlOp+IaKu4ahKKLhcoqKRDGxWh3lrQmJap8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DC6/JKL7/m5e30Rv7QkrOmXcfknkCtJMTiGeLiKL9/A2rbunwmgPe/6kdNUTzITca
 0Y+sclCBd31eu4PAyhydU9cyYHjMSfRLi39Epyw4kQHjv+bUHNBwFNcZRHPlZT5c3P
 XFEsSxxCyHOnrDkyZXXehgmfHniFcg7EwbzAeaEYE0xbToEk+pwWwMKSeEic8ROp0T
 AOmezV8EXPRcHxDOqxJt2KCf5jl2DHc9LwbTpe74japDxV+VmWYHBlpoqoiZ0GBv0v
 05SnICsKKYsijXT6D7enAidAj35coMu5x6q+5u5I4siIx4RifTheXbY2JN5ZPuQB3G
 L9VH130yHHRMA==
Date: Tue, 9 Jul 2024 19:50:09 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Sunmin Jeong <s_min.jeong@samsung.com>
Message-ID: <Zo2UcW4AtAp2WTOy@google.com>
References: <CGME20240705082511epcas1p24b7b63d5e714a25213dbe07affa52f69@epcas1p2.samsung.com>
 <20240705082503.805358-1-s_min.jeong@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240705082503.805358-1-s_min.jeong@samsung.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 07/05, Sunmin Jeong wrote: > In case of the COW file, new
 updates and GC writes are already > separated to page caches of the atomic
 file and COW file. As some cases > that use the meta inode for G [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sRGqv-0002tE-KU
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: use meta inode for GC of COW
 file
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
Cc: daehojeong@google.com, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Sungjong Seo <sj1557.seo@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/05, Sunmin Jeong wrote:
> In case of the COW file, new updates and GC writes are already
> separated to page caches of the atomic file and COW file. As some cases
> that use the meta inode for GC, there are some race issues between a
> foreground thread and GC thread.
> 
> To handle them, we need to take care when to invalidate and wait
> writeback of GC pages in COW files as the case of using the meta inode.
> Also, a pointer from the COW inode to the original inode is required to
> check the state of original pages.
> 
> For the former, we can solve the problem by using the meta inode for GC
> of COW files. Then let's get a page from the original inode in
> move_data_block when GCing the COW file to avoid race condition.
> 
> Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
> Cc: stable@vger.kernel.org #v5.19+
> Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
> Reviewed-by: Yeongjin Gil <youngjin.gil@samsung.com>
> Signed-off-by: Sunmin Jeong <s_min.jeong@samsung.com>
> ---
> v2:
> - use union for cow inode to point to atomic inode
>  fs/f2fs/data.c   |  2 +-
>  fs/f2fs/f2fs.h   | 13 +++++++++++--
>  fs/f2fs/file.c   |  3 +++
>  fs/f2fs/gc.c     | 12 ++++++++++--
>  fs/f2fs/inline.c |  2 +-
>  fs/f2fs/inode.c  |  3 ++-
>  6 files changed, 28 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 9a213d03005d..f6b1782f965a 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2606,7 +2606,7 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
>  		return true;
>  	if (IS_NOQUOTA(inode))
>  		return true;
> -	if (f2fs_is_atomic_file(inode))
> +	if (f2fs_used_in_atomic_write(inode))
>  		return true;
>  	/* rewrite low ratio compress data w/ OPU mode to avoid fragmentation */
>  	if (f2fs_compressed_file(inode) &&
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 796ae11c0fa3..4a8621e4a33a 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -843,7 +843,11 @@ struct f2fs_inode_info {
>  	struct task_struct *atomic_write_task;	/* store atomic write task */
>  	struct extent_tree *extent_tree[NR_EXTENT_CACHES];
>  					/* cached extent_tree entry */
> -	struct inode *cow_inode;	/* copy-on-write inode for atomic write */
> +	union {
> +		struct inode *cow_inode;	/* copy-on-write inode for atomic write */
> +		struct inode *atomic_inode;
> +					/* point to atomic_inode, available only for cow_inode */
> +	};
>  
>  	/* avoid racing between foreground op and gc */
>  	struct f2fs_rwsem i_gc_rwsem[2];
> @@ -4263,9 +4267,14 @@ static inline bool f2fs_post_read_required(struct inode *inode)
>  		f2fs_compressed_file(inode);
>  }
>  
> +static inline bool f2fs_used_in_atomic_write(struct inode *inode)
> +{
> +	return f2fs_is_atomic_file(inode) || f2fs_is_cow_file(inode);
> +}
> +
>  static inline bool f2fs_meta_inode_gc_required(struct inode *inode)
>  {
> -	return f2fs_post_read_required(inode) || f2fs_is_atomic_file(inode);
> +	return f2fs_post_read_required(inode) || f2fs_used_in_atomic_write(inode);
>  }
>  
>  /*
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index e4a7cff00796..547e7ec32b1f 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2183,6 +2183,9 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>  
>  		set_inode_flag(fi->cow_inode, FI_COW_FILE);
>  		clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
> +
> +		/* Set the COW inode's atomic_inode to the atomic inode */
> +		F2FS_I(fi->cow_inode)->atomic_inode = inode;
>  	} else {
>  		/* Reuse the already created COW inode */
>  		ret = f2fs_do_truncate_blocks(fi->cow_inode, 0, true);
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index cb3006551ab5..61913fcefd9e 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1186,7 +1186,11 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
>  	};
>  	int err;

How about giving the right mapping like this?

	mapping = f2fs_is_cow_file() ?
		F2FS_I(inode)->actomic_inode->i_mapping : inode->i_mapping;
	page = f2fs_grab_cache_page(mapping, index, true);

>  
> -	page = f2fs_grab_cache_page(mapping, index, true);
> +	if (f2fs_is_cow_file(inode))
> +		page = f2fs_grab_cache_page(F2FS_I(inode)->atomic_inode->i_mapping,
> +						index, true);
> +	else
> +		page = f2fs_grab_cache_page(mapping, index, true);
>  	if (!page)
>  		return -ENOMEM;
>  
> @@ -1282,7 +1286,11 @@ static int move_data_block(struct inode *inode, block_t bidx,
>  				CURSEG_ALL_DATA_ATGC : CURSEG_COLD_DATA;
>  
>  	/* do not read out */

ditto?

> -	page = f2fs_grab_cache_page(inode->i_mapping, bidx, false);
> +	if (f2fs_is_cow_file(inode))
> +		page = f2fs_grab_cache_page(F2FS_I(inode)->atomic_inode->i_mapping,
> +						bidx, false);
> +	else
> +		page = f2fs_grab_cache_page(inode->i_mapping, bidx, false);
>  	if (!page)
>  		return -ENOMEM;
>  
> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> index 1fba5728be70..cca7d448e55c 100644
> --- a/fs/f2fs/inline.c
> +++ b/fs/f2fs/inline.c
> @@ -16,7 +16,7 @@
>  
>  static bool support_inline_data(struct inode *inode)
>  {
> -	if (f2fs_is_atomic_file(inode))
> +	if (f2fs_used_in_atomic_write(inode))
>  		return false;
>  	if (!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))
>  		return false;
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 7a3e2458b2d9..18dea43e694b 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -804,8 +804,9 @@ void f2fs_evict_inode(struct inode *inode)
>  
>  	f2fs_abort_atomic_write(inode, true);
>  
> -	if (fi->cow_inode) {
> +	if (fi->cow_inode && f2fs_is_cow_file(fi->cow_inode)) {
>  		clear_inode_flag(fi->cow_inode, FI_COW_FILE);
> +		F2FS_I(fi->cow_inode)->atomic_inode = NULL;
>  		iput(fi->cow_inode);
>  		fi->cow_inode = NULL;
>  	}
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
