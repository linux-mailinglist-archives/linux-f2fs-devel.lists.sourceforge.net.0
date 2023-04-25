Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5D36EE467
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Apr 2023 17:04:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1prKDU-0001km-Il;
	Tue, 25 Apr 2023 15:04:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1prKDS-0001kg-Uz
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Apr 2023 15:04:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dJ0mofA/FEuLflk7P+8wCnEQJig3yik5kKldLYgnPBQ=; b=gVadJe4URQjMXMDs1y0/GSl8om
 CGMb/KLyyKNW7t0GaAaScV8Tef8QwDuzJONJi72RJB7DRkwAHME3iRr2iIim+spA9pdUACLC2Cgiq
 R0q5T2XL7ZngL/Dp8AEOznMisTI90bdSPM5kUvaYtJl/4A7sLK+Hm/lkwXM4yBdARslc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dJ0mofA/FEuLflk7P+8wCnEQJig3yik5kKldLYgnPBQ=; b=nFk47abBPFRtFNWqA1BNe5wEhF
 Z8a+HH3IYvQV9VwFnCLs9eD8X+Fd5VDWbjQ6CsEso0q9AVqq4IV442TVUbs306JUD5IKOXT9suvxS
 bzuS+j891CzLIObkC6T96D20PsPNz2e20WB92O2bskAYCKpDqZHga22rsWlqi22u0M9c=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1prKDQ-001HX6-1J for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Apr 2023 15:04:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D34BB6264C;
 Tue, 25 Apr 2023 15:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A4DC433D2;
 Tue, 25 Apr 2023 15:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682435057;
 bh=O3ezZk4F0u+EDnSCgMTllu+XmCUbpS7GFbM9vxhBf20=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kwdCyVKB3PWhdDCUwgl4iLtMu2yDPZIL3XHVoB6depYYTASgegorif0quoy5FBcMD
 7mvgCAArpzVHTpX0gnNdEptlYb3Souf04h25iz8elTKAncwXyTcUwAtk23oDWmjL6O
 4hXr4Cibu0AEnfPJQHlKHU7deFfFp8EO+N7ILvtheGezIgHxUczrvisNBLdCHeom5z
 bZzmyMvitjABKAF4fjFvQzvXSVB6537zfInvLsMKMsTprp6OodqLKY+DHa+N5wGfuL
 6Pk2mA5kUrA/yuz5KwkqUfKklZ4Zyusy5vTy90is0evCL3cyvYSn+GDnOmIOy4dWtG
 cLxHfNZNeAreg==
Message-ID: <e5a26c5c-65f6-0c96-0915-cf751f53b7fc@kernel.org>
Date: Tue, 25 Apr 2023 23:04:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: daejun7.park@samsung.com, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
References: <CGME20230425081018epcms2p8fefa94810f0b341d2cbd70ba587e9e8c@epcms2p8>
 <20230425081018epcms2p8fefa94810f0b341d2cbd70ba587e9e8c@epcms2p8>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230425081018epcms2p8fefa94810f0b341d2cbd70ba587e9e8c@epcms2p8>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/25 16:10, Daejun Park wrote: > Changelog: > > v1
 -> v2 > Changed to apply the optional async reset write pointer by default.
 > > > This patch enables submit reset zone command asynchornously [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1prKDQ-001HX6-1J
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add async reset zone command support
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
Cc: Seokhwan Kim <sukka.kim@samsung.com>, beomsu kim <beomsu7.kim@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/4/25 16:10, Daejun Park wrote:
> Changelog:
> 
> v1 -> v2
> Changed to apply the optional async reset write pointer by default.
> 
> 
> This patch enables submit reset zone command asynchornously. It helps
> decrease average latency of write IOs in high utilization scenario by
> faster checkpointing.
> 
> Signed-off-by: Daejun Park <daejun7.park@samsung.com>
> ---
>   fs/f2fs/segment.c           | 95 ++++++++++++++++++++++++++++++++++---
>   include/trace/events/f2fs.h | 18 ++++++-
>   2 files changed, 105 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 82430f80c5da..27074a6eaf20 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1195,6 +1195,46 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
>   static void __update_discard_tree_range(struct f2fs_sb_info *sbi,
>   				struct block_device *bdev, block_t lstart,
>   				block_t start, block_t len);
> +
> +#ifdef CONFIG_BLK_DEV_ZONED
> +static int __submit_zone_reset_cmd(struct f2fs_sb_info *sbi,
> +				   struct discard_cmd *dc, blk_opf_t flag,
> +				   struct list_head *wait_list,
> +				   unsigned int *issued)
> +{
> +	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
> +	struct block_device *bdev = dc->bdev;
> +	struct bio *bio = bio_alloc(bdev, 0, REQ_OP_ZONE_RESET | flag, GFP_NOFS);
> +	unsigned long flags;
> +
> +	trace_f2fs_issue_reset_zone(bdev, SECTOR_FROM_BLOCK(dc->di.start));

trace_f2fs_issue_reset_zone(bdev, dc->di.start); ?

> +
> +	spin_lock_irqsave(&dc->lock, flags);
> +	dc->state = D_SUBMIT;
> +	dc->bio_ref++;
> +	spin_unlock_irqrestore(&dc->lock, flags);
> +
> +	if (issued)
> +		(*issued)++;
> +
> +	atomic_inc(&dcc->queued_discard);
> +	dc->queued++;
> +	list_move_tail(&dc->list, wait_list);
> +
> +	/* sanity check on discard range */
> +	__check_sit_bitmap(sbi, dc->di.lstart, dc->di.lstart + dc->di.len);
> +
> +	bio->bi_iter.bi_sector = SECTOR_FROM_BLOCK(dc->di.start);
> +	bio->bi_private = dc;
> +	bio->bi_end_io = f2fs_submit_discard_endio;
> +	submit_bio(bio);
> +
> +	atomic_inc(&dcc->issued_discard);
> +
> +	return 0;

Unneeded return value?

> +}
> +#endif
> +
>   /* this function is copied from blkdev_issue_discard from block/blk-lib.c */
>   static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
>   				struct discard_policy *dpolicy,
> @@ -1216,6 +1256,11 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
>   	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK))
>   		return 0;
>   
> +#ifdef CONFIG_BLK_DEV_ZONED
> +	if (f2fs_sb_has_blkzoned(sbi) && bdev_is_zoned(bdev))
> +		return __submit_zone_reset_cmd(sbi, dc, flag, wait_list, issued);
> +#endif
> +
>   	trace_f2fs_issue_discard(bdev, dc->di.start, dc->di.len);
>   
>   	lstart = dc->di.lstart;
> @@ -1460,21 +1505,42 @@ static void __update_discard_tree_range(struct f2fs_sb_info *sbi,
>   	}
>   }
>   
> +#ifdef CONFIG_BLK_DEV_ZONED
> +static void __queue_zone_reset_cmd(struct f2fs_sb_info *sbi,
> +		struct block_device *bdev, block_t blkstart, block_t blklen)

block_t lblkstart,

> +{
> +	block_t lblkstart = blkstart;

block_t blkstart = lblkstart;

> +
> +	if (f2fs_is_multi_device(sbi)) {
> +		int devi = f2fs_target_device_index(sbi, blkstart);
> +
> +		blkstart -= FDEV(devi).start_blk;
> +	}
> +
> +	trace_f2fs_queue_reset_zone(bdev, blkstart);
> +
> +	mutex_lock(&SM_I(sbi)->dcc_info->cmd_lock);
> +	__insert_discard_cmd(sbi, bdev, lblkstart, blkstart, blklen);
> +	mutex_unlock(&SM_I(sbi)->dcc_info->cmd_lock);
> +}
> +#endif
> +
>   static void __queue_discard_cmd(struct f2fs_sb_info *sbi,
>   		struct block_device *bdev, block_t blkstart, block_t blklen)
>   {
>   	block_t lblkstart = blkstart;
>   
> +	trace_f2fs_queue_discard(bdev, blkstart, blklen);

If device doesn't support discard, it's better not show above tracepoint?

> +
>   	if (!f2fs_bdev_support_discard(bdev))
>   		return;
>   
> -	trace_f2fs_queue_discard(bdev, blkstart, blklen);
> -
>   	if (f2fs_is_multi_device(sbi)) {
>   		int devi = f2fs_target_device_index(sbi, blkstart);
>   
>   		blkstart -= FDEV(devi).start_blk;
>   	}
> +
>   	mutex_lock(&SM_I(sbi)->dcc_info->cmd_lock);
>   	__update_discard_tree_range(sbi, bdev, lblkstart, blkstart, blklen);
>   	mutex_unlock(&SM_I(sbi)->dcc_info->cmd_lock);
> @@ -1725,7 +1791,18 @@ static void f2fs_wait_discard_bio(struct f2fs_sb_info *sbi, block_t blkaddr)
>   	dc = __lookup_discard_cmd(sbi, blkaddr);
>   	if (dc) {
>   		if (dc->state == D_PREP) {
> -			__punch_discard_cmd(sbi, dc, blkaddr);
> +			if (f2fs_sb_has_blkzoned(sbi) &&
> +			    bdev_is_zoned(dc->bdev)) {
> +				struct discard_policy dpolicy;
> +				/* force submit zone reset */
> +				__init_discard_policy(sbi, &dpolicy,
> +						      DPOLICY_FORCE, 1);
> +				__submit_discard_cmd(sbi, &dpolicy, dc, NULL);

Can we call __submit_zone_reset_cmd() directly?

Thanks,

> +				dc->ref++;
> +				need_wait = true;
> +			} else {
> +				__punch_discard_cmd(sbi, dc, blkaddr);
> +			}
>   		} else {
>   			dc->ref++;
>   			need_wait = true;
> @@ -1875,9 +1952,15 @@ static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
>   				 blkstart, blklen);
>   			return -EIO;
>   		}
> -		trace_f2fs_issue_reset_zone(bdev, blkstart);
> -		return blkdev_zone_mgmt(bdev, REQ_OP_ZONE_RESET,
> -					sector, nr_sects, GFP_NOFS);
> +
> +		if (unlikely(!is_sbi_flag_set(sbi, SBI_POR_DOING))) {
> +			trace_f2fs_issue_reset_zone(bdev, blkstart);
> +			return blkdev_zone_mgmt(bdev, REQ_OP_ZONE_RESET,
> +						sector, nr_sects, GFP_NOFS);
> +		}
> +
> +		__queue_zone_reset_cmd(sbi, bdev, lblkstart, blklen);
> +		return 0;
>   	}
>   
>   	/* For conventional zones, use regular discard if supported */
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index 99cbc5949e3c..ee1477de8324 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -1512,7 +1512,7 @@ DEFINE_EVENT(f2fs_discard, f2fs_remove_discard,
>   	TP_ARGS(dev, blkstart, blklen)
>   );
>   
> -TRACE_EVENT(f2fs_issue_reset_zone,
> +DECLARE_EVENT_CLASS(f2fs_reset_zone,
>   
>   	TP_PROTO(struct block_device *dev, block_t blkstart),
>   
> @@ -1528,11 +1528,25 @@ TRACE_EVENT(f2fs_issue_reset_zone,
>   		__entry->blkstart = blkstart;
>   	),
>   
> -	TP_printk("dev = (%d,%d), reset zone at block = 0x%llx",
> +	TP_printk("dev = (%d,%d), zone at block = 0x%llx",
>   		show_dev(__entry->dev),
>   		(unsigned long long)__entry->blkstart)
>   );
>   
> +DEFINE_EVENT(f2fs_reset_zone, f2fs_queue_reset_zone,
> +
> +	TP_PROTO(struct block_device *dev, block_t blkstart),
> +
> +	TP_ARGS(dev, blkstart)
> +);
> +
> +DEFINE_EVENT(f2fs_reset_zone, f2fs_issue_reset_zone,
> +
> +	TP_PROTO(struct block_device *dev, block_t blkstart),
> +
> +	TP_ARGS(dev, blkstart)
> +);
> +
>   TRACE_EVENT(f2fs_issue_flush,
>   
>   	TP_PROTO(struct block_device *dev, unsigned int nobarrier,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
