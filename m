Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C25C857F496
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 24 Jul 2022 11:58:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oFYNp-0004s3-68; Sun, 24 Jul 2022 09:58:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1oFYNo-0004rt-K6
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 24 Jul 2022 09:58:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jw9R3Oiuqy9INwlaeDVGPeva8kDy6HJcQD+wnfvvI7I=; b=YubDL8dinrx7qkaihAVn9wSsxU
 OdqxWDzPnW2OZGcGhs9a3JMu/qnSoZKcR6NLOl3kDthd38h9rtkt6mdrHaeoi+rTfedIkW5FznCWe
 6idDKYQoAVn4A+qfahFtNy/XkkWidIt8F8XBsiHYigXZV090MtMfwfgxQ9L4WphwjiH8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:
 Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jw9R3Oiuqy9INwlaeDVGPeva8kDy6HJcQD+wnfvvI7I=; b=VWypiomHeOPAXbFTtAxBWPezve
 b4tAKcLOcMdrjbubR8RHSXjb+D6CYqNlsxGJHl+pHJGh/t+YYVIoz+HEaNovA8KrpxnpTUz8AC7IU
 LGOlPU5vkDFmkIfCa7q8nXLHyGeTTlvhnjhi6cTtrOGr0RvXre+oL86obZqNoqj0Q7qI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oFYNi-0005N6-H3
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 24 Jul 2022 09:58:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1A52460C5E;
 Sun, 24 Jul 2022 09:58:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AA42C3411E;
 Sun, 24 Jul 2022 09:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658656712;
 bh=NTrh4BHaSFLp5xVlDh2CpZGnuJ9UsvUD7nbqAReigCE=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=D0IXjXMypJLhVAHdpIgb/4xUQ5/mcz2qDclcfC+eML4AIaIOQM4zHRjzbKFAfPnmn
 oXouLTq8PB7uwXlnV6S+KhMCH3m5WcfpfEJ8O3wKy3xKY579kHtOvVAJfltUXSynR8
 ClQqmefkyLOxsbNj/yg2hyjP6PTeVs5tiHt4i0xMlQJXoqQWli+ncTqOl4DXBCC7kX
 B39f4PJ2p77ksXC2wIHnpJvOHOtifNUhvceTjWsMZII7exLx4+BusXzll9/VnD/cXa
 nTFTygE0W+mQ2/nql/VOkX+GvEWtg/X5Fbj4jiOiFeyyQG9l96JsIw5ol9HT2YZ27A
 Oe9apiDAozjCg==
Message-ID: <a931509e-aba2-1d67-789a-72b830d872cc@kernel.org>
Date: Sun, 24 Jul 2022 17:58:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Chao Yu <chao@kernel.org>
To: Fengnan Chang <fengnanchang@gmail.com>, jaegeuk@kernel.org
References: <20220717053207.192372-1-fengnanchang@gmail.com>
 <20220717053207.192372-4-fengnanchang@gmail.com>
Content-Language: en-US
In-Reply-To: <20220717053207.192372-4-fengnanchang@gmail.com>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/7/17 13:32,
 Fengnan Chang wrote: > From: Fengnan Chang
 <changfengnan@vivo.com> > > Try to support compressed file write and
 amplifiction
 accounting. > > Signed-off-by: Fengnan Chang <changfeng [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oFYNi-0005N6-H3
Subject: Re: [f2fs-dev] [PATCH v3 3/3] f2fs: support compressed file
 write/read amplifiction
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
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/7/17 13:32, Fengnan Chang wrote:
> From: Fengnan Chang <changfengnan@vivo.com>
> 
> Try to support compressed file write and amplifiction accounting.
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>   fs/f2fs/data.c  | 26 +++++++++++++++++++++-----
>   fs/f2fs/debug.c |  7 +++++--
>   fs/f2fs/f2fs.h  | 34 ++++++++++++++++++++++++++++++++++
>   3 files changed, 60 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index d2d2cfd54210..d0532958835b 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2132,7 +2132,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>   	struct extent_info ei = {0, };
>   	bool from_dnode = true;
>   	int i;
> -	int ret = 0;
> +	int ret = 0, nr_cache_hit = 0;
>   
>   	f2fs_bug_on(sbi, f2fs_cluster_is_empty(cc));
>   
> @@ -2223,6 +2223,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>   		if (f2fs_load_compressed_page(sbi, page, blkaddr)) {
>   			if (atomic_dec_and_test(&dic->remaining_pages))
>   				f2fs_decompress_cluster(dic);
> +			nr_cache_hit++;
>   			continue;
>   		}
>   
> @@ -2261,6 +2262,15 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>   		*last_block_in_bio = blkaddr;
>   	}
>   
> +	if (cc->nr_cpages - nr_cache_hit > cc->nr_rpages)
> +		f2fs_i_compr_ra_blocks_update(inode,
> +				cc->nr_cpages - nr_cache_hit - cc->nr_rpages,

I guess nr_rpages is not accurate here, due to it always equals to cluster_size,
however user may just want to read one page data.

Hmm...I found iostat framework has already accounted FS_CDATA_READ_IO IO, how
about adjusting it to support accounting compressed inode's read/write IOs?

Thanks,

> +				true);
> +	else
> +		f2fs_i_compr_ra_blocks_update(inode,
> +				cc->nr_rpages - cc->nr_cpages + nr_cache_hit,
> +				false);
> +
>   	if (from_dnode)
>   		f2fs_put_dnode(&dn);
>   
> @@ -2929,11 +2939,11 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>   	int range_whole = 0;
>   	xa_mark_t tag;
>   	int nwritten = 0;
> -	int submitted = 0;
> +	int submitted = 0, raw_dirty_pages = 0;
>   	int i;
>   
> -	if (get_dirty_pages(mapping->host) <=
> -				SM_I(F2FS_M_SB(mapping))->min_hot_blocks)
> +	raw_dirty_pages = get_dirty_pages(mapping->host);
> +	if (raw_dirty_pages <= SM_I(F2FS_M_SB(mapping))->min_hot_blocks)
>   		set_inode_flag(mapping->host, FI_HOT_DATA);
>   	else
>   		clear_inode_flag(mapping->host, FI_HOT_DATA);
> @@ -3067,7 +3077,6 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>   #endif
>   			nwritten += submitted;
>   			wbc->nr_to_write -= submitted;
> -
>   			if (unlikely(ret)) {
>   				/*
>   				 * keep nr_to_write, since vfs uses this to
> @@ -3133,6 +3142,12 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>   	if (bio)
>   		f2fs_submit_merged_ipu_write(sbi, &bio, NULL);
>   
> +	if (f2fs_compressed_file(inode)) {
> +		if (nwritten > raw_dirty_pages)
> +			f2fs_i_compr_wa_blocks_update(inode, nwritten - raw_dirty_pages, true);
> +		else
> +			f2fs_i_compr_wa_blocks_update(inode, raw_dirty_pages - nwritten, false);
> +	}
>   	return ret;
>   }
>   
> @@ -3482,6 +3497,7 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
>   			err = ret;
>   			goto fail;
>   		} else if (ret) {
> +			f2fs_i_compr_wa_blocks_update(inode, ret - 1, true);
>   			return 0;
>   		}
>   	}
> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
> index c92625ef16d0..2bbf7fa49097 100644
> --- a/fs/f2fs/debug.c
> +++ b/fs/f2fs/debug.c
> @@ -136,6 +136,8 @@ static void update_general_status(struct f2fs_sb_info *sbi)
>   	si->inline_dir = atomic_read(&sbi->inline_dir);
>   	si->compr_inode = atomic_read(&sbi->compr_inode);
>   	si->compr_blocks = atomic64_read(&sbi->compr_blocks);
> +	si->compr_wa_blocks = atomic64_read(&sbi->compr_wa_blocks);
> +	si->compr_ra_blocks = atomic64_read(&sbi->compr_ra_blocks);
>   	si->append = sbi->im[APPEND_INO].ino_num;
>   	si->update = sbi->im[UPDATE_INO].ino_num;
>   	si->orphans = sbi->im[ORPHAN_INO].ino_num;
> @@ -383,8 +385,9 @@ static int stat_show(struct seq_file *s, void *v)
>   			   si->inline_inode);
>   		seq_printf(s, "  - Inline_dentry Inode: %u\n",
>   			   si->inline_dir);
> -		seq_printf(s, "  - Compressed Inode: %u, Blocks: %llu\n",
> -			   si->compr_inode, si->compr_blocks);
> +		seq_printf(s, "  - Compressed Inode: %u, Blocks: %llu, WA Blocks: %lld, RA Blocks %lld\n",
> +			   si->compr_inode, si->compr_blocks,
> +			   si->compr_wa_blocks, si->compr_ra_blocks);
>   		seq_printf(s, "  - Orphan/Append/Update Inode: %u, %u, %u\n",
>   			   si->orphans, si->append, si->update);
>   		seq_printf(s, "\nMain area: %d segs, %d secs %d zones\n",
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 06d0370fd760..9d0429e91718 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1749,6 +1749,8 @@ struct f2fs_sb_info {
>   	atomic_t inline_dir;			/* # of inline_dentry inodes */
>   	atomic_t compr_inode;			/* # of compressed inodes */
>   	atomic64_t compr_blocks;		/* # of compressed blocks */
> +	atomic64_t compr_wa_blocks;		/* # of compressed WA blocks */
> +	atomic64_t compr_ra_blocks;		/* # of compressed RA blocks */
>   	atomic_t max_aw_cnt;			/* max # of atomic writes */
>   	unsigned int io_skip_bggc;		/* skip background gc for in-flight IO */
>   	unsigned int other_skip_bggc;		/* skip background gc for other reasons */
> @@ -3829,6 +3831,8 @@ struct f2fs_stat_info {
>   	int inline_xattr, inline_inode, inline_dir, append, update, orphans;
>   	int compr_inode;
>   	unsigned long long compr_blocks;
> +	long long compr_wa_blocks;
> +	long long compr_ra_blocks;
>   	int aw_cnt, max_aw_cnt;
>   	unsigned int valid_count, valid_node_count, valid_inode_count, discard_blks;
>   	unsigned int bimodal, avg_vblocks;
> @@ -3916,6 +3920,14 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
>   		(atomic64_add(blocks, &F2FS_I_SB(inode)->compr_blocks))
>   #define stat_sub_compr_blocks(inode, blocks)				\
>   		(atomic64_sub(blocks, &F2FS_I_SB(inode)->compr_blocks))
> +#define stat_add_compr_wa_blocks(inode, blocks)				\
> +	(atomic64_add(blocks, &F2FS_I_SB(inode)->compr_wa_blocks))
> +#define stat_sub_compr_wa_blocks(inode, blocks)				\
> +	(atomic64_sub(blocks, &F2FS_I_SB(inode)->compr_wa_blocks))
> +#define stat_add_compr_ra_blocks(inode, blocks)				\
> +	(atomic64_add(blocks, &F2FS_I_SB(inode)->compr_ra_blocks))
> +#define stat_sub_compr_ra_blocks(inode, blocks)				\
> +	(atomic64_sub(blocks, &F2FS_I_SB(inode)->compr_ra_blocks))
>   #define stat_inc_meta_count(sbi, blkaddr)				\
>   	do {								\
>   		if (blkaddr < SIT_I(sbi)->sit_base_addr)		\
> @@ -4000,6 +4012,10 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
>   #define stat_dec_compr_inode(inode)			do { } while (0)
>   #define stat_add_compr_blocks(inode, blocks)		do { } while (0)
>   #define stat_sub_compr_blocks(inode, blocks)		do { } while (0)
> +#define stat_add_compr_wa_blocks(inode, blocks)		do { } while (0)
> +#define stat_sub_compr_wa_blocks(inode, blocks)		do { } while (0)
> +#define stat_add_compr_ra_blocks(inode, blocks)		do { } while (0)
> +#define stat_sub_compr_ra_blocks(inode, blocks)		do { } while (0)
>   #define stat_update_max_atomic_write(inode)		do { } while (0)
>   #define stat_inc_meta_count(sbi, blkaddr)		do { } while (0)
>   #define stat_inc_seg_type(sbi, curseg)			do { } while (0)
> @@ -4428,6 +4444,24 @@ static inline void f2fs_i_compr_blocks_update(struct inode *inode,
>   	f2fs_mark_inode_dirty_sync(inode, true);
>   }
>   
> +static inline void f2fs_i_compr_wa_blocks_update(struct inode *inode,
> +						u64 blocks, bool add)
> +{
> +	if (add)
> +		stat_add_compr_wa_blocks(inode, blocks);
> +	else
> +		stat_sub_compr_wa_blocks(inode, blocks);
> +}
> +
> +static inline void f2fs_i_compr_ra_blocks_update(struct inode *inode,
> +						u64 blocks, bool add)
> +{
> +	if (add)
> +		stat_add_compr_ra_blocks(inode, blocks);
> +	else
> +		stat_sub_compr_ra_blocks(inode, blocks);
> +}
> +
>   static inline int block_unaligned_IO(struct inode *inode,
>   				struct kiocb *iocb, struct iov_iter *iter)
>   {


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
