Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8AAC4C0F7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Nov 2025 08:18:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xo6X6eid/bYW9KijVq/k4sFkC+ZNIifiP+n5PQvlpDY=; b=WIs+3XgJYP2QXHBCm8SgocbDZQ
	mAxokx60S9PcdmK5qJQLQN0MOpHNSwF5GIVF6mjknvsJpjrA/c34VrjLQlAmNt7p6g0J3CDI2OXrb
	sajb041hXA/plA5jf1Ak0qHn2fVHHNZpenaC2TIQ7gmmIqx+hkf7kkVqFAtbu93kJabM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIidi-00065m-A9;
	Tue, 11 Nov 2025 07:18:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vIidh-00065g-2Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 07:18:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tfn6sHDCFVy7caQGHvFFy+kMtU6EN30uYtryJkEogzE=; b=TttyA9dBszTus5LSR8GBwSaEk/
 uZcftyw3wkF8ehovAo/TJU3S03LlaTOQbw/V5Tpd6cmGR3WMKInILEkh59K6kdAdh6SnfLaiA0m/5
 Cjs/SzIlansaJrtV9LWswWN2wTKks8IPhr5Sgt+o5drRT5JFpjd5WVQMp/mMGKnure4g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tfn6sHDCFVy7caQGHvFFy+kMtU6EN30uYtryJkEogzE=; b=YGFCMYqMMTSSvffsYgj2RiQIrD
 SP+oi8vWSXKK4xCMJHc+pdBaQ2sFr8JZ/wzz1x7DAVNw7VITK5HqaBgzj+YNIf1xFE287Eh+4Qzt5
 QPxmb0DxmQqyOo67WhZWymcw6f4JGvua5Esaarr2oR7DEym+cSEQWAcB4Ebd0fB5u+Fc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIidg-00027M-Fa for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 07:18:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 058B2435FB;
 Tue, 11 Nov 2025 07:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C9EC19422;
 Tue, 11 Nov 2025 07:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762845473;
 bh=FybQ4/3AZJou/+49uOTNiyNNNev/lS1TDMWjNHq9vDA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=G+HVM2aCVSzuL0pvTj1iE2VNLH1L5Sfn60E2OZgCrVG908jaGBXCmnno+B4X2RUvc
 GvOro0DZqdcZwhle4q/IzEKZEX5B+JaJ4/fZT3hBADQaJIMVKhB7JunsyIVwl07NY1
 KRtRBIY+x9uELcsM7BuMX+kLISzcGeAwGjuCvAd+uYSiNacb6z+thwH5oOzd/lQZ2s
 ZCNP+PdfCsanPSapUfnNwMXSxa8VquCJNBJfyFDlTJtoCH894ESji3d2hPAtEs5uN1
 DtME2edrPC/MePZXv9+CNQvR0F8yyD4TsVDLBcazxNa6EdEzYJ7bjHfoBbBqT15Y9E
 M0Psty4mzqntQ==
Message-ID: <2eb3b1e7-931a-4a2c-92ac-4267a6a654ad@kernel.org>
Date: Tue, 11 Nov 2025 15:17:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Xiaole He <hexiaole1994@126.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20251111060557.337514-1-hexiaole1994@126.com>
 <20251111061051.337547-1-hexiaole1994@126.com>
Content-Language: en-US
In-Reply-To: <20251111061051.337547-1-hexiaole1994@126.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/11/25 14:10, Xiaole He wrote: > When active_logs ==
 6, dentry blocks can be allocated to HOT, WARM, or > COLD segments based on
 various conditions in __get_segment_type_6(): > - age extent cache [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vIidg-00027M-Fa
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/11/25 14:10, Xiaole He wrote:
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

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
