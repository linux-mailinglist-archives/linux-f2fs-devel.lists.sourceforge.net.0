Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD09866B4B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Feb 2024 08:47:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1reVhY-0003K0-RO;
	Mon, 26 Feb 2024 07:47:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1reVhX-0003Ju-Lk
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 07:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+vwNIP0cHv0nQiQWjuFDGRTmE4KKHo0lBvzdGkbqf/4=; b=bGpJKpG7n+fB/TacGhLHv1jLU7
 0rEaXE++va9pDC7zIuttdHi147qblSZm9buaSARubvfKu4U3MMdi+Q7H1UjJKC/FoN9ZFH2b+kaqZ
 oKvw/jPZM8NiuaV0iiLlRekUmr34IuckXUO8Y/d2I4JeQGO/nPuq/e6fGEBljcgIyt58=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+vwNIP0cHv0nQiQWjuFDGRTmE4KKHo0lBvzdGkbqf/4=; b=MrQJrq5d8TuZ/EPoN0m/oNUE4p
 Sau1MPKp7osbRx0X2knquZ8pxmwCXSpyASscMmfn20hR4oXd5EoPmvv8vpyZJg8kP6/SJfYJZXeza
 1HyBjCvUEMFMR8mU/OMCTU+CNRFhznbtBKGIH0YR5tMhzSN4+4b80Ua76XPlYaNKI5w8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1reVhW-0003MD-Oc for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 07:47:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4EB9460ED2;
 Mon, 26 Feb 2024 07:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9067AC433C7;
 Mon, 26 Feb 2024 07:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708933617;
 bh=ll8/sE0ujmmsvGfDVHHhSa0z4hjoynpDUiku1IY80Ek=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fHuQJWf8ZUhqbHcXkHy/nhNEOkrh6EH1dRrrv691s1Jb2eowmhT/RDRLUZURInqwZ
 bFlBuSGJGe42uorpMW5TnIBpCpS50ImONcAY7lN9wpIpZXjYzRcbrC4hop89johpqd
 b8Bb67W4+G27jt1NcEXDcdMkJiuEmUysdpZtYFAWMkZ2e5Lr/eHWsdUd0rOep0irBW
 e4nxFBpCTTCK2g4O7+wPVF+WE/bK/C96rvjQr8MIBAfmrMRp91f1wW0w+THQWsAhmj
 LZvdUT4v0oYovmlPZTi2cqq4glWa8Q25M+Zkc7kyawdqqaxL/r3i/DPUdolODYeZ71
 ju2XijZqx032Q==
Message-ID: <873304dc-112d-4c34-b966-e0905ee748fb@kernel.org>
Date: Mon, 26 Feb 2024 15:46:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Zhiguo Niu <niuzhiguo84@gmail.com>, Zhiguo Niu <zhiguo.niu@unisoc.com>
References: <20240222121851.883141-1-chao@kernel.org>
 <20240222121851.883141-3-chao@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240222121851.883141-3-chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Loop to Zhiguo, On 2024/2/22 20:18,
 Chao Yu wrote: > If CONFIG_F2FS_CHECK_FS
 is off, and for very rare corner case that > we run out of free segment,
 we should not panic kernel, instead, > let's handle such error cor [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1reVhW-0003MD-Oc
Subject: Re: [f2fs-dev] [PATCH 3/4] f2fs: fix to handle segment allocation
 failure correctly
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Loop to Zhiguo,

On 2024/2/22 20:18, Chao Yu wrote:
> If CONFIG_F2FS_CHECK_FS is off, and for very rare corner case that
> we run out of free segment, we should not panic kernel, instead,
> let's handle such error correctly in its caller.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>   fs/f2fs/data.c    |  7 +++++--
>   fs/f2fs/f2fs.h    |  2 +-
>   fs/f2fs/file.c    |  7 ++++++-
>   fs/f2fs/gc.c      |  7 ++++++-
>   fs/f2fs/segment.c | 46 +++++++++++++++++++++++++++++++++++++++-------
>   5 files changed, 57 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 0c9aa3082fcf..c21b92f18463 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -1416,8 +1416,11 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
>   
>   	set_summary(&sum, dn->nid, dn->ofs_in_node, ni.version);
>   	old_blkaddr = dn->data_blkaddr;
> -	f2fs_allocate_data_block(sbi, NULL, old_blkaddr, &dn->data_blkaddr,
> -				&sum, seg_type, NULL);
> +	err = f2fs_allocate_data_block(sbi, NULL, old_blkaddr,
> +				&dn->data_blkaddr, &sum, seg_type, NULL);
> +	if (err)
> +		return err;
> +
>   	if (GET_SEGNO(sbi, old_blkaddr) != NULL_SEGNO)
>   		f2fs_invalidate_internal_cache(sbi, old_blkaddr);
>   
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index fbbe9a0a4221..6390c3d551cb 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3726,7 +3726,7 @@ void f2fs_replace_block(struct f2fs_sb_info *sbi, struct dnode_of_data *dn,
>   			block_t old_addr, block_t new_addr,
>   			unsigned char version, bool recover_curseg,
>   			bool recover_newaddr);
> -void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
> +int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>   			block_t old_blkaddr, block_t *new_blkaddr,
>   			struct f2fs_summary *sum, int type,
>   			struct f2fs_io_info *fio);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 088d0e79fbbc..d6ec744f1545 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2262,8 +2262,11 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
>   	case F2FS_GOING_DOWN_METASYNC:
>   		/* do checkpoint only */
>   		ret = f2fs_sync_fs(sb, 1);
> -		if (ret)
> +		if (ret) {
> +			if (ret == -EIO)
> +				ret = 0;
>   			goto out;
> +		}
>   		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN);
>   		break;
>   	case F2FS_GOING_DOWN_NOSYNC:
> @@ -2279,6 +2282,8 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
>   		set_sbi_flag(sbi, SBI_IS_DIRTY);
>   		/* do checkpoint only */
>   		ret = f2fs_sync_fs(sb, 1);
> +		if (ret == -EIO)
> +			ret = 0;
>   		goto out;
>   	default:
>   		ret = -EINVAL;
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 6d160d50e14e..42e75e9b8b6b 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1358,8 +1358,13 @@ static int move_data_block(struct inode *inode, block_t bidx,
>   	set_summary(&sum, dn.nid, dn.ofs_in_node, ni.version);
>   
>   	/* allocate block address */
> -	f2fs_allocate_data_block(fio.sbi, NULL, fio.old_blkaddr, &newaddr,
> +	err = f2fs_allocate_data_block(fio.sbi, NULL, fio.old_blkaddr, &newaddr,
>   				&sum, type, NULL);
> +	if (err) {
> +		f2fs_put_page(mpage, 1);
> +		/* filesystem should shutdown, no need to recovery block */
> +		goto up_out;
> +	}
>   
>   	fio.encrypted_page = f2fs_pagecache_get_page(META_MAPPING(fio.sbi),
>   				newaddr, FGP_LOCK | FGP_CREAT, GFP_NOFS);
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 8edc42071e6f..71f523431e87 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -400,6 +400,9 @@ int f2fs_commit_atomic_write(struct inode *inode)
>    */
>   void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
>   {
> +	if (f2fs_cp_error(sbi))
> +		return;
> +
>   	if (time_to_inject(sbi, FAULT_CHECKPOINT))
>   		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_FAULT_INJECT);
>   
> @@ -2636,7 +2639,7 @@ static int is_next_segment_free(struct f2fs_sb_info *sbi,
>    * Find a new segment from the free segments bitmap to right order
>    * This function should be returned with success, otherwise BUG
>    */
> -static void get_new_segment(struct f2fs_sb_info *sbi,
> +static int get_new_segment(struct f2fs_sb_info *sbi,
>   			unsigned int *newseg, bool new_sec, bool pinning)
>   {
>   	struct free_segmap_info *free_i = FREE_I(sbi);
> @@ -2711,6 +2714,7 @@ static void get_new_segment(struct f2fs_sb_info *sbi,
>   		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_NO_SEGMENT);
>   		f2fs_bug_on(sbi, 1);
>   	}
> +	return ret;
>   }
>   
>   static void reset_curseg(struct f2fs_sb_info *sbi, int type, int modified)
> @@ -2719,6 +2723,10 @@ static void reset_curseg(struct f2fs_sb_info *sbi, int type, int modified)
>   	struct summary_footer *sum_footer;
>   	unsigned short seg_type = curseg->seg_type;
>   
> +	/* only happen when get_new_segment() fails */
> +	if (curseg->next_segno == NULL_SEGNO)
> +		return;
> +
>   	curseg->inited = true;
>   	curseg->segno = curseg->next_segno;
>   	curseg->zone = GET_ZONE_FROM_SEG(sbi, curseg->segno);
> @@ -2783,7 +2791,10 @@ static int new_curseg(struct f2fs_sb_info *sbi, int type, bool new_sec)
>   		write_sum_page(sbi, curseg->sum_blk, GET_SUM_BLOCK(sbi, segno));
>   
>   	segno = __get_next_segno(sbi, type);
> -	get_new_segment(sbi, &segno, new_sec, pinning);
> +	if (get_new_segment(sbi, &segno, new_sec, pinning)) {
> +		curseg->segno = NULL_SEGNO;
> +		return -ENOSPC;
> +	}
>   	if (new_sec && pinning &&
>   	    !f2fs_valid_pinned_area(sbi, START_BLOCK(sbi, segno))) {
>   		__set_free(sbi, segno);
> @@ -3425,7 +3436,7 @@ static void f2fs_randomize_chunk(struct f2fs_sb_info *sbi,
>   		get_random_u32_inclusive(1, sbi->max_fragment_hole);
>   }
>   
> -void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
> +int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>   		block_t old_blkaddr, block_t *new_blkaddr,
>   		struct f2fs_summary *sum, int type,
>   		struct f2fs_io_info *fio)
> @@ -3442,6 +3453,9 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>   	mutex_lock(&curseg->curseg_mutex);
>   	down_write(&sit_i->sentry_lock);
>   
> +	if (curseg->segno == NULL_SEGNO)
> +		goto out_err;
> +
>   	if (from_gc) {
>   		f2fs_bug_on(sbi, GET_SEGNO(sbi, old_blkaddr) == NULL_SEGNO);
>   		se = get_seg_entry(sbi, GET_SEGNO(sbi, old_blkaddr));
> @@ -3500,6 +3514,9 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>   				change_curseg(sbi, type);
>   			stat_inc_seg_type(sbi, curseg);
>   		}
> +
> +		if (curseg->segno == NULL_SEGNO)
> +			goto out_err;
>   	}
>   
>   skip_new_segment:
> @@ -3534,8 +3551,15 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
>   	}
>   
>   	mutex_unlock(&curseg->curseg_mutex);
> -
>   	f2fs_up_read(&SM_I(sbi)->curseg_lock);
> +	return 0;
> +out_err:
> +	*new_blkaddr = NULL_ADDR;
> +	up_write(&sit_i->sentry_lock);
> +	mutex_unlock(&curseg->curseg_mutex);
> +	f2fs_up_read(&SM_I(sbi)->curseg_lock);
> +	return -ENOSPC;
> +
>   }
>   
>   void f2fs_update_device_state(struct f2fs_sb_info *sbi, nid_t ino,
> @@ -3573,8 +3597,16 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
>   	if (keep_order)
>   		f2fs_down_read(&fio->sbi->io_order_lock);
>   
> -	f2fs_allocate_data_block(fio->sbi, fio->page, fio->old_blkaddr,
> -			&fio->new_blkaddr, sum, type, fio);
> +	if (f2fs_allocate_data_block(fio->sbi, fio->page, fio->old_blkaddr,
> +			&fio->new_blkaddr, sum, type, fio)) {
> +		if (fscrypt_inode_uses_fs_layer_crypto(fio->page->mapping->host))
> +			fscrypt_finalize_bounce_page(&fio->encrypted_page);
> +		if (PageWriteback(fio->page))
> +			end_page_writeback(fio->page);
> +		if (f2fs_in_warm_node_list(fio->sbi, fio->page))
> +			f2fs_del_fsync_node_entry(fio->sbi, fio->page);
> +		goto out;
> +	}
>   	if (GET_SEGNO(fio->sbi, fio->old_blkaddr) != NULL_SEGNO)
>   		f2fs_invalidate_internal_cache(fio->sbi, fio->old_blkaddr);
>   
> @@ -3582,7 +3614,7 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
>   	f2fs_submit_page_write(fio);
>   
>   	f2fs_update_device_state(fio->sbi, fio->ino, fio->new_blkaddr, 1);
> -
> +out:
>   	if (keep_order)
>   		f2fs_up_read(&fio->sbi->io_order_lock);
>   }


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
