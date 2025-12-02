Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D6EC9C829
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 02 Dec 2025 19:00:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7g5WLfxKQxGbIBZf6qVbz/2qCKvXO8DhWB+oU9ZAEE=; b=fOVL1Xey4LZx3+U3ZBrGtdqXzk
	se7YteKh1yMA2+5NEDtA8ai5n9O5qfee2zxDiXqurMb5QUcfJe5nTPIulhh+dKcwf062NABuX0IuS
	JeO8DpG0M8kDHs3fEyFY1VNnA0v90kXSzL9ZJoEqCphYkBTuz9YD6+o2rdHnCznVV1DY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQUg8-00083a-QL;
	Tue, 02 Dec 2025 18:00:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vQUg7-00083T-Gu
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Dec 2025 18:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LS3a3tvKBp5S2R9vE5tHyhlnoZn5hmgs9uIwcWHHfSI=; b=aRxutg/0Mw90NJf26oCBUFofEe
 6tngS/BPWynlB3oICOZgmKNFYry2Wb5ZCXYOnBiDn+SMEBKRvZ+mxd8d/E21CQGSsw2qzqdQJ+IOs
 CFkUZohObyqY6EQMsJ2zB7BPQyG0B4YX5EPVQnDB967iaT0vOaIu09YLhJEbWnHuz0cg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LS3a3tvKBp5S2R9vE5tHyhlnoZn5hmgs9uIwcWHHfSI=; b=aRFQULpajyWVORHEZqapUE0X6k
 qfhh1VM0MKsB4xN426saIJO/6MNhdf3eZkRaNv6ieucHOwTrQbO1xFk/zKEeXh8llSJEbW2wgUZ96
 PhTLAiP9UmkAloBH0hR94Tc3NB7oo2qB5y3MRE6CF7wvjcKTZHroWQaWPlox4vVN0V0U=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQUg6-00050w-Sv for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Dec 2025 18:00:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2724B6019A;
 Tue,  2 Dec 2025 18:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E5B0C4CEF1;
 Tue,  2 Dec 2025 18:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764698436;
 bh=h9f6fioitMCYIV/3E/k6YkyvuiuiX7bgdpTo0UL04XY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KpYQXF4rLKLqJizsHvSK6PjAxthl5cF6HmCvuagwDSleEc3EUWOVfFXRef5If88XA
 ktbf9j7u/mZPW2MlMpPAMHE8A00BLWOhx+UdeQgFtGEtxXiTQBNPUBsWmEaRotcge1
 YYiyExz1ahiw3l4zg6KAPnp52b8m5fcSYsBJcQuIUel5+ic8ITiZkm2UpKZwWayj/G
 hLQcKN7zayp4MMHdxue3I2kh9ljK+6OwDdmqw5rr51/5ch+GaW7nUk9tYUu10YLk02
 7c0u4pfE6H5KPxZSuUsq6M0N4fzId2njUuXjrCI/KOdzf5yynqF/AaXlgebUnRD8a5
 w8qwi8s/fFj1Q==
Date: Tue, 2 Dec 2025 18:00:34 +0000
To: Xiaole He <hexiaole1994@126.com>
Message-ID: <aS8pQtLGoigY25hi@google.com>
References: <20251111060557.337514-1-hexiaole1994@126.com>
 <20251111061051.337547-1-hexiaole1994@126.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251111061051.337547-1-hexiaole1994@126.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  I need to drop this patch, since this breaks xfstests such
 as f2fs/005. Please revisit the issue. On 11/11, Xiaole He wrote: > When
 active_logs == 6, dentry blocks can be allocated to HOT, WARM,
 or > COLD segments
 based on various conditions in __get_segment_type_6(): > - age extent cache
 (if enab [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vQUg6-00050w-Sv
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix has_curseg_enough_space to
 check all data segments for dentry blocks
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I need to drop this patch, since this breaks xfstests such as f2fs/005.

Please revisit the issue.

On 11/11, Xiaole He wrote:
> When active_logs == 6, dentry blocks can be allocated to HOT, WARM, or
> COLD segments based on various conditions in __get_segment_type_6():
> - age extent cache (if enabled)
> - FI_HOT_DATA flag (set when dirty_pages <= min_hot_blocks)
> - rw_hint (defaults to WARM via f2fs_rw_hint_to_seg_type)
> - file_is_hot(), FI_NEED_IPU, f2fs_is_cow_file(), etc.
> 
> However, has_curseg_enough_space() only checked CURSEG_HOT_DATA segment
> for dentry blocks, which could lead to incorrect space calculation when
> dentry blocks are actually allocated to WARM or COLD segments.
> 
> Reproducer:
> Note: This reproducer requires adding a tracepoint to observe segment
> type. Add the following tracepoint to include/trace/events/f2fs.h:
> 
> TRACE_EVENT(f2fs_allocate_data_block,
>         TP_PROTO(struct f2fs_sb_info *sbi, struct inode *inode,
>                 enum log_type type, block_t blkaddr),
> 
>         TP_ARGS(sbi, inode, type, blkaddr),
> 
>         TP_STRUCT__entry(
>                 __field(dev_t, dev)
>                 __field(ino_t, ino)
>                 __field(int, type)
>                 __field(block_t, blkaddr)
>                 __field(int, is_dir)
>         ),
> 
>         TP_fast_assign(
>                 __entry->dev = sbi->sb->s_dev;
>                 __entry->ino = inode ? inode->i_ino : 0;
>                 __entry->type = type;
>                 __entry->blkaddr = blkaddr;
>                 __entry->is_dir = inode ? S_ISDIR(inode->i_mode) : 0;
>         ),
> 
>         TP_printk("dev = (%d,%d), ino = %lu, %s, blkaddr = %u, is_dir = %d",
>                 show_dev(__entry->dev),
>                 (unsigned long)__entry->ino,
>                 show_data_type(__entry->type),
>                 __entry->blkaddr,
>                 __entry->is_dir)
> );
> 
> And add the tracepoint call in fs/f2fs/segment.c in
> f2fs_allocate_data_block() function. Find the location after
> locate_dirty_segment() calls and before IS_DATASEG() check:
> 
>         locate_dirty_segment(sbi, GET_SEGNO(sbi, old_blkaddr));
>         locate_dirty_segment(sbi, GET_SEGNO(sbi, *new_blkaddr));
> 
>         trace_f2fs_allocate_data_block(sbi, folio ? folio->mapping->host : NULL,
>                                         type, *new_blkaddr);
> 
>         if (IS_DATASEG(curseg->seg_type))
> 
> 1. Mount F2FS with active_logs=6 and age extent cache disabled:
>    # mkfs.f2fs -f /dev/sdb1
>    # mount -t f2fs -o active_logs=6 /dev/sdb1 /mnt/f2fs-test
> 
> 2. Enable tracing and f2fs_allocate_data_block tracepoint:
>    # echo 1 > /sys/kernel/debug/tracing/events/f2fs/f2fs_allocate_data_block/enable
>    # echo 1 > /sys/kernel/debug/tracing/tracing_on
>    # echo > /sys/kernel/debug/tracing/trace
> 
> 3. Create a directory and write enough files to trigger dirty_pages >
>    min_hot_blocks (default 16), which will clear FI_HOT_DATA flag:
>    # mkdir /mnt/f2fs-test/testdir
>    # cd /mnt/f2fs-test/testdir
>    # seq 1 8192 | xargs touch
>    # sync
> 
> 4. Observe dentry block allocation:
>    # cat /sys/kernel/debug/tracing/trace
> 
>    The trace output shows dentry blocks (is_dir = 1) allocated to WARM
>    segment because FI_HOT_DATA is cleared when dirty_pages >
>    min_hot_blocks (default 16). However, has_curseg_enough_space() only
>    checked HOT_DATA segment space.
> 
> Fix by merging the dentry block check into the main data/node block
> check loop and checking data_blocks + dent_blocks for data segments,
> since both regular data blocks and dentry blocks can be written to the
> same segment. When active_logs == 6, dentry blocks can be allocated to
> any of the three data segments (HOT, WARM, COLD), so all three segments
> need to account for dentry blocks. When active_logs != 6, dentry blocks
> are always allocated to HOT_DATA segment only, so only HOT_DATA segment
> needs to account for dentry blocks, while WARM and COLD segments only
> check data_blocks.
> 
> Fixes: ef095d19e82f ("f2fs: write small sized IO to hot log")
> Cc: stable@kernel.org
> Signed-off-by: Xiaole He <hexiaole1994@126.com>
> ---
> Changes in v2 (per Yongpeng's feedback):
> - Merged dentry block check into the main loop to avoid duplication
> - Check data_blocks + dent_blocks for data segments (both can write to same segment)
> ---
>  fs/f2fs/segment.h | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 1ce2c8abaf48..acda720a54eb 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -626,21 +626,21 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
>  
>  		left_blocks = get_left_section_blocks(sbi, i, segno);
>  
> -		blocks = i <= CURSEG_COLD_DATA ? data_blocks : node_blocks;
> +		if (i <= CURSEG_COLD_DATA) {
> +			blocks = data_blocks;
> +			/*
> +			 * With active_logs == 6, dentry blocks can be allocated to
> +			 * any data segment. With active_logs != 6, dentry blocks
> +			 * are always allocated to HOT_DATA segment.
> +			 */
> +			if ((F2FS_OPTION(sbi).active_logs == 6) || (i == CURSEG_HOT_DATA))
> +				blocks += dent_blocks;
> +		} else {
> +			blocks = node_blocks;
> +		}
>  		if (blocks > left_blocks)
>  			return false;
>  	}
> -
> -	/* check current data section for dentry blocks. */
> -	segno = CURSEG_I(sbi, CURSEG_HOT_DATA)->segno;
> -
> -	if (unlikely(segno == NULL_SEGNO))
> -		return false;
> -
> -	left_blocks = get_left_section_blocks(sbi, CURSEG_HOT_DATA, segno);
> -
> -	if (dent_blocks > left_blocks)
> -		return false;
>  	return true;
>  }
>  
> -- 
> 2.43.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
