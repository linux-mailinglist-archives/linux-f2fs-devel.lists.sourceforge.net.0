Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 959EF6BD6CC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Mar 2023 18:13:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pcrAN-00082n-E3;
	Thu, 16 Mar 2023 17:13:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pcrAL-00082h-KJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Mar 2023 17:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=au2yUYFP+LbCM1/or6Fp9BSOTlEzwCj5Xgm30tOEEMI=; b=hIMTAr6ee26GcqbX+wLzDsaUal
 GuGZLGMxv5gQ7aQl86aH+vPy/L990+3egfLAzHEFhd422UjgtREeiktvBOHj5KrLOmGzfbFvB2oHo
 AF8bYjeYhQppKNZQrkXp7kGHIAEuJ6stygBzSCvYCeHeIfX62Tgtaiqsd+ko2bk58hMc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=au2yUYFP+LbCM1/or6Fp9BSOTlEzwCj5Xgm30tOEEMI=; b=Y/QFcNojMXC1pfmewTBVxcsAB5
 k1oO2clceB+e5vgYqDYl04qPnD3lOMW0hQ4+x8UY8jtv3hEaxHCftG3skXoNT60k6JWVIs00PO2zH
 pf7XuU2Xqe0l6USw1sIR1SKO6GA96bSxFQFtSpI8z/LHAB3Qyp6kHFDkf2rbu5HJbnPc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pcrAL-0002i3-UV for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Mar 2023 17:13:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 56C4E62082;
 Thu, 16 Mar 2023 17:13:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95829C433D2;
 Thu, 16 Mar 2023 17:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678986796;
 bh=ycI170u42IGu7QqLc2ahGz0aUq50c3KdvJb5OQc+Q0k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q4t5CCaa4BuZj1m9HFZmGbfN08085T2gc3nW50QIyG/BM6LiUNy+vfrfQVXiTE0NR
 9Gq4Tt/t+eKK5YKK1VRWysO7cHJWeZbtzbl7IGSCie9c26q4s5xtj3I19zEwpRp5/w
 pUT+IA5XYdSZsowkbI9zb1IiA15XJK4p4ad2F1oxuyKnzovKgjgn7QdSIjERuRCQFB
 ZwvuAGg94fPrwQYwOKMsgLfIbIB6yhCBEOqDyKRdPY3vEvXv2OM+Qe8m0zqtSqURr5
 dYPZHD+0Gbhh/OJdg4UdqCTndwTmcoaYLhSIpiIOme/D1xCP2/l07JAaN9eQjinJMY
 T46jqdVzL8r4g==
Date: Thu, 16 Mar 2023 10:13:14 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yonggil Song <yonggil.song@samsung.com>
Message-ID: <ZBNOKq/EYNMnMSFi@google.com>
References: <CGME20230314074733epcms2p511d7a7fa11d5b54ac2fbaa840db3f1cb@epcms2p5>
 <20230314074733epcms2p511d7a7fa11d5b54ac2fbaa840db3f1cb@epcms2p5>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230314074733epcms2p511d7a7fa11d5b54ac2fbaa840db3f1cb@epcms2p5>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/14, Yonggil Song wrote: > When f2fs tries to checkpoint
 during foreground gc in LFS mode, system > crash occurs due to lack of free
 space if the amount of dirty node and > dentry pages generated [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pcrAL-0002i3-UV
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: Fix system crash due to lack of
 free space in LFS
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/14, Yonggil Song wrote:
> When f2fs tries to checkpoint during foreground gc in LFS mode, system
> crash occurs due to lack of free space if the amount of dirty node and
> dentry pages generated by data migration exceeds free space.
> The reproduction sequence is as follows.
> 
>  - 20GiB capacity block device (null_blk)
>  - format and mount with LFS mode
>  - create a file and write 20,000MiB
>  - 4k random write on full range of the file
> 
>  RIP: 0010:new_curseg+0x48a/0x510 [f2fs]
>  Code: 55 e7 f5 89 c0 48 0f af c3 48 8b 5d c0 48 c1 e8 20 83 c0 01 89 43 6c 48 83 c4 28 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc cc <0f> 0b f0 41 80 4f 48 04 45 85 f6 0f 84 ba fd ff ff e9 ef fe ff ff
>  RSP: 0018:ffff977bc397b218 EFLAGS: 00010246
>  RAX: 00000000000027b9 RBX: 0000000000000000 RCX: 00000000000027c0
>  RDX: 0000000000000000 RSI: 00000000000027b9 RDI: ffff8c25ab4e74f8
>  RBP: ffff977bc397b268 R08: 00000000000027b9 R09: ffff8c29e4a34b40
>  R10: 0000000000000001 R11: ffff977bc397b0d8 R12: 0000000000000000
>  R13: ffff8c25b4dd81a0 R14: 0000000000000000 R15: ffff8c2f667f9000
>  FS: 0000000000000000(0000) GS:ffff8c344ec80000(0000) knlGS:0000000000000000
>  CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>  CR2: 000000c00055d000 CR3: 0000000e30810003 CR4: 00000000003706e0
>  DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>  DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>  Call Trace:
>  <TASK>
>  allocate_segment_by_default+0x9c/0x110 [f2fs]
>  f2fs_allocate_data_block+0x243/0xa30 [f2fs]
>  ? __mod_lruvec_page_state+0xa0/0x150
>  do_write_page+0x80/0x160 [f2fs]
>  f2fs_do_write_node_page+0x32/0x50 [f2fs]
>  __write_node_page+0x339/0x730 [f2fs]
>  f2fs_sync_node_pages+0x5a6/0x780 [f2fs]
>  block_operations+0x257/0x340 [f2fs]
>  f2fs_write_checkpoint+0x102/0x1050 [f2fs]
>  f2fs_gc+0x27c/0x630 [f2fs]
>  ? folio_mark_dirty+0x36/0x70
>  f2fs_balance_fs+0x16f/0x180 [f2fs]
> 
> This patch adds checking whether free sections are enough before checkpoint
> during gc.
> 
> Signed-off-by: Yonggil Song <yonggil.song@samsung.com>
> ---
>  fs/f2fs/gc.c      |  7 ++++++-
>  fs/f2fs/segment.h | 26 +++++++++++++++++++++-----
>  2 files changed, 27 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 4546e01b2ee0..b22f49a6f128 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1773,6 +1773,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>  		.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
>  	};
>  	unsigned int skipped_round = 0, round = 0;
> +	unsigned int nr_needed_secs = 0, node_blocks = 0, dent_blocks = 0;
>  
>  	trace_f2fs_gc_begin(sbi->sb, gc_type, gc_control->no_bg_gc,
>  				gc_control->nr_free_secs,
> @@ -1858,8 +1859,12 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>  		}
>  	}
>  
> +	/* need more three extra sections for writer's data/node/dentry */
> +	nr_needed_secs = get_min_need_secs(sbi, &node_blocks, &dent_blocks) + 3;

	get_min_need_secs(&lower, &upper)
	{
		...

		*lower = node_secs + dent_secs;
		*upper = *lower + (node_blocks ? 1 : 0) + (dent_blocks ? 1 : 0);
	}

> +	nr_needed_secs += ((node_blocks ? 1 : 0) + (dent_blocks ? 1 : 0));
> +
>  	/* Write checkpoint to reclaim prefree segments */
> -	if (free_sections(sbi) < NR_CURSEG_PERSIST_TYPE &&
> +	if (free_sections(sbi) <= nr_needed_secs &&

#define NR_GC_CHECKPOINT_SECS	(3)	/* data/node/dentry sections */

	if (free_sections(sbi) <= upper + NR_GC_CHECKPOINT_SECS &&

>  				prefree_segments(sbi)) {
>  		ret = f2fs_write_checkpoint(sbi, &cpc);
>  		if (ret)
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index be8f2d7d007b..ac11c47bfe37 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -605,8 +605,11 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
>  	return true;
>  }
>  
> -static inline bool has_not_enough_free_secs(struct f2fs_sb_info *sbi,
> -					int freed, int needed)
> +/*
> + * calculate the minimum number of sections (needed) for dirty node/dentry
> + */
> +static inline unsigned int get_min_need_secs(struct f2fs_sb_info *sbi,
> +		unsigned int *node_blocks, unsigned int *dent_blocks)
>  {
>  	unsigned int total_node_blocks = get_pages(sbi, F2FS_DIRTY_NODES) +
>  					get_pages(sbi, F2FS_DIRTY_DENTS) +
> @@ -614,15 +617,28 @@ static inline bool has_not_enough_free_secs(struct f2fs_sb_info *sbi,
>  	unsigned int total_dent_blocks = get_pages(sbi, F2FS_DIRTY_DENTS);
>  	unsigned int node_secs = total_node_blocks / CAP_BLKS_PER_SEC(sbi);
>  	unsigned int dent_secs = total_dent_blocks / CAP_BLKS_PER_SEC(sbi);
> -	unsigned int node_blocks = total_node_blocks % CAP_BLKS_PER_SEC(sbi);
> -	unsigned int dent_blocks = total_dent_blocks % CAP_BLKS_PER_SEC(sbi);
> +
> +	f2fs_bug_on(sbi, (!node_blocks || !dent_blocks));
> +
> +	*node_blocks = total_node_blocks % CAP_BLKS_PER_SEC(sbi);
> +	*dent_blocks = total_dent_blocks % CAP_BLKS_PER_SEC(sbi);
> +
> +	return (node_secs + dent_secs);
> +}
> +
> +static inline bool has_not_enough_free_secs(struct f2fs_sb_info *sbi,
> +					int freed, int needed)
> +{
> +	unsigned int node_blocks = 0;
> +	unsigned int dent_blocks = 0;
>  	unsigned int free, need_lower, need_upper;
>  
>  	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
>  		return false;
>  
>  	free = free_sections(sbi) + freed;
> -	need_lower = node_secs + dent_secs + reserved_sections(sbi) + needed;
> +	need_lower = get_min_need_secs(sbi, &node_blocks, &dent_blocks) + needed +
> +				reserved_sections(sbi);
>  	need_upper = need_lower + (node_blocks ? 1 : 0) + (dent_blocks ? 1 : 0);
>  
>  	if (free > need_upper)
> -- 
> 2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
