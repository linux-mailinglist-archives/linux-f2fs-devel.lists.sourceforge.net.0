Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A85DB333DC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Aug 2025 04:09:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNpO/sGa0ANF47aONtkrSUxHJrEZpBYwe20JMJI0tSo=; b=N2qd1dlV977T3KUg+yLo3YP7JP
	29VgjUcF/scsdy0IDanPCKJd/0E2a9dOM8MNJ9tFxPBcPb29pGO8KreGkzt5kxqpLBfE5+bU2otlL
	bExU/hUmE0K9P/cd98P0YZVtFbiToeJFH+4ICeonlpxy0Fh3vGpd92QvHNTPJ6Z048eU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uqMds-0004w7-PR;
	Mon, 25 Aug 2025 02:09:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uqMdr-0004vz-G4
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 02:09:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v9dL1M+D4p5bjBtZ0h0/pBR4AH3GUyqxvfr0wmJkViA=; b=RAUnbhfda0gSFrwRX+n+m4B3vc
 OQqUwvEkaLzkmJ+1Em8HWAjKAcj2UPDuHdYuemPxtCCcguHR0//WRumZqOn7xFkagomAIefshyH6/
 fl5eq4ZwJ28baaCfOCmCR3GwBVFUgTUXWPA4C5HTNWDdyQhXsNa+ZozXmQ/2jd53qLNc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v9dL1M+D4p5bjBtZ0h0/pBR4AH3GUyqxvfr0wmJkViA=; b=CP/KUR5wgQAN5nxZ8MGEgCtnKk
 X09QQfcIegyJJxNdvm5JJ3iro6G7k4j7nSKF78XgGbohB8BLICorOPfBevL1oJ2tVDAYzihfcche+
 uQYPub3eHJVRkcXtoWrdVX8fNatyRqb2h1QdmNYNjN7Y2wpSh4bqdablAD9dXKjwJdcg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uqMdq-0003YS-S7 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Aug 2025 02:09:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8213643D50;
 Mon, 25 Aug 2025 02:08:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EED7C4CEEB;
 Mon, 25 Aug 2025 02:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756087732;
 bh=T6Q6ILYsPx5/QNLrvj6B1eMzAZq4JBxvU404Bn42Eb8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=CNRgsvFcZMyWiiGjv2y1CMz3qgVhs4Dp+BoinpYV5Fjc4zVKDyOf+oczLVH7os8Ve
 f3R65nb3+YVgQg2bTb2ZnG/q//oo6vJBKMWD7e7EPVed59uvaf9HMuia0RJnRmxc17
 9SnpY76VkP5VU7jrFfpi6KEZUlBQugua++YaV9T0CcJ1KI3M0nJoCUBMQjytX/SQfK
 z4aRv3foWgBcmkra8tNLm1mWBYcem4Xq/KyrQq6sK0khWPHaaq3fzQ72UlWIvVTIu1
 LzhgklqPOUq635DUO/Qzn915OyyWQI2bDc0XzM02a78SERnycX4QQxLUCuVprtu6Nv
 NUnpk0qYxpCiw==
Message-ID: <d0a1e0a3-bde1-485c-bee0-70c04ab3846d@kernel.org>
Date: Mon, 25 Aug 2025 10:08:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wang Xiaojun <wangxiaojun@vivo.com>, jaegeuk@kernel.org
References: <20250820075444.378907-1-wangxiaojun@vivo.com>
Content-Language: en-US
In-Reply-To: <20250820075444.378907-1-wangxiaojun@vivo.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/20/25 15:54,
 Wang Xiaojun wrote: > This patch fixes missing
 space reclamation during the recovery process. > > In the following scenarios, 
 F2FS cannot reclaim truncated space. > case 1: > write f [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uqMdq-0003YS-S7
Subject: Re: [f2fs-dev] [PATCH v4] f2fs:fix missing space reclamation during
 the recovery process
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/20/25 15:54, Wang Xiaojun wrote:
> This patch fixes missing space reclamation during the recovery process.
> 
> In the following scenarios, F2FS cannot reclaim truncated space.
> case 1:
> write file A, size is 1G | CP | truncate A to 1M | fsync A | SPO
> 
> case 2:
> CP | write file A, size is 1G | fsync A | truncate A to 1M | fsync A |SPO
> 
> During the recovery process, F2FS will recover file A,
> but the 1M-1G space cannot be reclaimed.
> 
> But the combination of truncate and falloc complicates the recovery
> process.
> For example, in the following scenario:
> write fileA 2M | fsync | truncate 256K | falloc -k 256K 1M | fsync A | SPO
> The falloc (256K, 1M) need to be recovered as pre-allocated space.
> 
> However in the following scenarios, the situation is the opposite.
> write fileA 2M | fsync | falloc -k 2M 10M | fsync A | truncate 256K |
> fsync A | SPO
> In this scenario, the space allocated by falloc needs to be truncated.
> 
> During the recovery process, it is difficult to distinguish
> between the above two types of falloc.
> 
> So in this case of falloc -k we need to trigger a checkpoint for fsync.
> 
> Fixes: d624c96fb3249 ("f2fs: add recovery routines for roll-forward")
> 
> Signed-off-by: Wang Xiaojun <wangxiaojun@vivo.com>
> ---
> v4: Trigger checkpoint for fsync after falloc -k
> v3: Add a Fixes line.
> v2: Apply Chao's suggestion from v1. No logical changes.
> v1: Fix missing space reclamation during the recovery process.
> ---
>  fs/f2fs/checkpoint.c |  3 +++
>  fs/f2fs/f2fs.h       |  3 +++
>  fs/f2fs/file.c       |  8 ++++++--
>  fs/f2fs/recovery.c   | 18 +++++++++++++++++-
>  4 files changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index db3831f7f2f5..775e3333097e 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1151,6 +1151,9 @@ static int f2fs_sync_inode_meta(struct f2fs_sb_info *sbi)
>  		if (inode) {
>  			sync_inode_metadata(inode, 0);
>  
> +			if (is_inode_flag_set(inode, FI_FALLOC_KEEP_SIZE))
> +				clear_inode_flag(inode, FI_FALLOC_KEEP_SIZE);
> +
>  			/* it's on eviction */
>  			if (is_inode_flag_set(inode, FI_DIRTY_INODE))
>  				f2fs_update_inode_page(inode);
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 46be7560548c..f5a54bc848d5 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -459,6 +459,7 @@ struct fsync_inode_entry {
>  	struct inode *inode;	/* vfs inode pointer */
>  	block_t blkaddr;	/* block address locating the last fsync */
>  	block_t last_dentry;	/* block address locating the last dentry */
> +	loff_t max_i_size;	/* previous max file size for truncate */
>  };
>  
>  #define nats_in_cursum(jnl)		(le16_to_cpu((jnl)->n_nats))
> @@ -835,6 +836,7 @@ enum {
>  	FI_ATOMIC_REPLACE,	/* indicate atomic replace */
>  	FI_OPENED_FILE,		/* indicate file has been opened */
>  	FI_DONATE_FINISHED,	/* indicate page donation of file has been finished */
> +	FI_FALLOC_KEEP_SIZE,	/* file allocate reserved space and keep size */
>  	FI_MAX,			/* max flag, never be used */
>  };
>  
> @@ -1193,6 +1195,7 @@ enum cp_reason_type {
>  	CP_SPEC_LOG_NUM,
>  	CP_RECOVER_DIR,
>  	CP_XATTR_DIR,
> +	CP_FALLOC_FILE,
>  };
>  
>  enum iostat_type {
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 42faaed6a02d..f0820f817824 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -236,6 +236,8 @@ static inline enum cp_reason_type need_do_checkpoint(struct inode *inode)
>  	else if (f2fs_exist_written_data(sbi, F2FS_I(inode)->i_pino,
>  							XATTR_DIR_INO))
>  		cp_reason = CP_XATTR_DIR;
> +	else if (is_inode_flag_set(inode, FI_FALLOC_KEEP_SIZE))
> +		cp_reason = CP_FALLOC_FILE;
>  
>  	return cp_reason;
>  }
> @@ -1953,10 +1955,12 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
>  	}
>  
>  	if (new_size > i_size_read(inode)) {
> -		if (mode & FALLOC_FL_KEEP_SIZE)
> +		if (mode & FALLOC_FL_KEEP_SIZE) {
> +			set_inode_flag(inode, FI_FALLOC_KEEP_SIZE);

Xiaojun,

Well, what about this case?

falloc -k ofs size file
flush all data and metadata of file
evict inode
write file & fsync file won't trigger a checkpoint?

Or am I missing something?

Thanks,

>  			file_set_keep_isize(inode);
> -		else
> +		} else {
>  			f2fs_i_size_write(inode, new_size);
> +		}
>  	}
>  
>  	return err;
> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
> index 4cb3a91801b4..68b62c8a74d3 100644
> --- a/fs/f2fs/recovery.c
> +++ b/fs/f2fs/recovery.c
> @@ -95,6 +95,7 @@ static struct fsync_inode_entry *add_fsync_inode(struct f2fs_sb_info *sbi,
>  	entry = f2fs_kmem_cache_alloc(fsync_entry_slab,
>  					GFP_F2FS_ZERO, true, NULL);
>  	entry->inode = inode;
> +	entry->max_i_size = i_size_read(inode);
>  	list_add_tail(&entry->list, head);
>  
>  	return entry;
> @@ -796,6 +797,7 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
>  	while (1) {
>  		struct fsync_inode_entry *entry;
>  		struct folio *folio;
> +		loff_t i_size;
>  
>  		if (!f2fs_is_valid_blkaddr(sbi, blkaddr, META_POR))
>  			break;
> @@ -828,6 +830,9 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
>  				break;
>  			}
>  			recovered_inode++;
> +			i_size = i_size_read(entry->inode);
> +			if (entry->max_i_size < i_size)
> +				entry->max_i_size = i_size;
>  		}
>  		if (entry->last_dentry == blkaddr) {
>  			err = recover_dentry(entry->inode, folio, dir_list);
> @@ -844,8 +849,19 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
>  		}
>  		recovered_dnode++;
>  
> -		if (entry->blkaddr == blkaddr)
> +		if (entry->blkaddr == blkaddr) {
> +			i_size = i_size_read(entry->inode);
> +			if (entry->max_i_size > i_size) {
> +				err = f2fs_truncate_blocks(entry->inode,
> +							i_size, false);
> +				if (err) {
> +					f2fs_folio_put(folio, true);
> +					break;
> +				}
> +				f2fs_mark_inode_dirty_sync(entry->inode, true);
> +			}
>  			list_move_tail(&entry->list, tmp_inode_list);
> +		}
>  next:
>  		ra_blocks = adjust_por_ra_blocks(sbi, ra_blocks, blkaddr,
>  					next_blkaddr_of_node(folio));



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
