Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 544236F62B5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 May 2023 03:44:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1puO0m-0000nd-Vc;
	Thu, 04 May 2023 01:44:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1puO0i-0000nX-IJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 01:43:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DP/gh+Y3p/bDM5UF6k67cgSCrb9Lweuv/V5vt3XRftE=; b=JWeogziVJV5UtZegKj/rDsDrGO
 nX/iNJ8OF9rNCt0C+meUONajjZVK1cxSlQnV7XPCTd5HN9/Yek1awaazvE8rVD5NN9J+RCS/t4mP5
 2sFmrM+xU/UsMweF5xCAjMTzisXnyt+jkIcos18LtC7KFKpQsuM9K9n7T9+ZiqnBE9Y4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DP/gh+Y3p/bDM5UF6k67cgSCrb9Lweuv/V5vt3XRftE=; b=R3+VF3D+t7DQ3pk8F+zui+aHOW
 BYm4dA8xvek+9YCfuAt3uX+Xjdb+hjlisc3FNRhtIBy4QMCxC00p+GBfBGhTi58H+IjYi0pVqPfjf
 5yYD4zwEdDoNxP2SC4KZCL78Fl0ADuHOwUdOi8JtKHqBNZCWfw4X5zAPCJC9yQDWWP+I=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1puO0h-0005Wi-Ok for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 May 2023 01:43:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 90558619C4;
 Thu,  4 May 2023 01:43:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1465DC433D2;
 Thu,  4 May 2023 01:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683164620;
 bh=rvpKaggMszfYip+0djm2qEsluKsxOtwAuEPdkTFMsMk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Bd3Ks804e8Dg3xIGkiux87A6xJhhYMXyiFSqE5jdNLdlQa28lotVHijpF+f+FLY90
 JrMYvKKkzXjZZu1ijPd8sgcHK1p696lJQZRXJmjs+dW/dkpXMIhyVDT8EhRaTs+zUk
 lWVIBRF9IxbNkKKxq25oPqs5I3yw+QeY28d20fZsowvzYPAxXt33ZIJuPP7i8L19+H
 eF71fpWYVN6AM4xeSe9OHxqxpSe54RmVCTHau10eiEXAft5M+tZ4OzTgO2Oam6A4sQ
 fwCoqBYpmnMFyDGh3NS28M9TNblwalIE3T4iB/aqB0HDouHTr8Z14EAr6lk6Mcmd93
 zxTBrpegkw7tA==
Message-ID: <6596335b-2448-20f7-30ea-42ba40f1af72@kernel.org>
Date: Thu, 4 May 2023 09:43:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: daejun7.park@samsung.com, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
References: <CGME20230502041628epcms2p7233a97389cebafb73fc525a47215e707@epcms2p7>
 <20230502041628epcms2p7233a97389cebafb73fc525a47215e707@epcms2p7>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230502041628epcms2p7233a97389cebafb73fc525a47215e707@epcms2p7>
X-Spam-Score: -9.7 (---------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/2 12:16, Daejun Park wrote: > Changelog: > > v3
 -> v4 > Fixed build error caused by unused function. > > v2 -> v3 > Modified
 arguments to be correct for ftrace parameter. > Changed __submit_ [...] 
 Content analysis details:   (-9.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -4.3 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1puO0h-0005Wi-Ok
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: add async reset zone command support
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

On 2023/5/2 12:16, Daejun Park wrote:
> Changelog:
> 
> v3 -> v4
> Fixed build error caused by unused function.
> 
> v2 -> v3
> Modified arguments to be correct for ftrace parameter.
> Changed __submit_zone_reset_cmd to void return.
> Refactored the f2fs_wait_discard_bio function.
> Fixed code that was previously incorrectly merged.
> 
> v1 -> v2
> Changed to apply the optional async reset write pointer by default.
> 
> This patch enables submit reset zone command asynchornously. It helps
> decrease average latency of write IOs in high utilization scenario by
> faster checkpointing.
> 
> Signed-off-by: Daejun Park <daejun7.park@samsung.com>
> ---
>   fs/f2fs/segment.c           | 83 +++++++++++++++++++++++++++++++++++--
>   include/trace/events/f2fs.h | 18 +++++++-
>   2 files changed, 96 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 6db410f1bb8c..ec7a8de71198 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1196,6 +1196,44 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
>   static void __update_discard_tree_range(struct f2fs_sb_info *sbi,
>   				struct block_device *bdev, block_t lstart,
>   				block_t start, block_t len);
> +
> +#ifdef CONFIG_BLK_DEV_ZONED
> +static void __submit_zone_reset_cmd(struct f2fs_sb_info *sbi,
> +				   struct discard_cmd *dc, blk_opf_t flag,
> +				   struct list_head *wait_list,
> +				   unsigned int *issued)
> +{
> +	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
> +	struct block_device *bdev = dc->bdev;
> +	struct bio *bio = bio_alloc(bdev, 0, REQ_OP_ZONE_RESET | flag, GFP_NOFS);
> +	unsigned long flags;
> +
> +	trace_f2fs_issue_reset_zone(bdev, dc->di.start);
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

How about accounting iostat info for zone reset command?

f2fs_update_iostat(sbi, NULL, FS_ZONE_RESET_IO, len * F2FS_BLKSIZE);

> +
> +	atomic_inc(&dcc->issued_discard);
> +}
> +#endif
> +
>   /* this function is copied from blkdev_issue_discard from block/blk-lib.c */
>   static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
>   				struct discard_policy *dpolicy,
> @@ -1217,6 +1255,13 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
>   	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK))
>   		return 0;
>   
> +#ifdef CONFIG_BLK_DEV_ZONED
> +	if (f2fs_sb_has_blkzoned(sbi) && bdev_is_zoned(bdev)) {
> +		__submit_zone_reset_cmd(sbi, dc, flag, wait_list, issued);
> +		return 0;
> +	}
> +#endif
> +
>   	trace_f2fs_issue_discard(bdev, dc->di.start, dc->di.len);
>   
>   	lstart = dc->di.lstart;
> @@ -1461,6 +1506,19 @@ static void __update_discard_tree_range(struct f2fs_sb_info *sbi,
>   	}
>   }
>   
> +#ifdef CONFIG_BLK_DEV_ZONED
> +static void __queue_zone_reset_cmd(struct f2fs_sb_info *sbi,
> +		struct block_device *bdev, block_t blkstart, block_t lblkstart,
> +		block_t blklen)
> +{
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
> @@ -1724,6 +1782,19 @@ static void f2fs_wait_discard_bio(struct f2fs_sb_info *sbi, block_t blkaddr)
>   
>   	mutex_lock(&dcc->cmd_lock);
>   	dc = __lookup_discard_cmd(sbi, blkaddr);
> +#ifdef CONFIG_BLK_DEV_ZONED
> +	if (dc && f2fs_sb_has_blkzoned(sbi) && bdev_is_zoned(dc->bdev)) {
> +		/* force submit zone reset */
> +		if (dc->state == D_PREP)
> +			__submit_zone_reset_cmd(sbi, dc, REQ_SYNC,
> +						&dcc->wait_list, NULL);
> +		dc->ref++;

IIUC, should be?

else
	dc->ref++;

Thanks,

> +		mutex_unlock(&dcc->cmd_lock);
> +		/* wait zone reset */
> +		__wait_one_discard_bio(sbi, dc);
> +		return;
> +	}
> +#endif
>   	if (dc) {
>   		if (dc->state == D_PREP) {
>   			__punch_discard_cmd(sbi, dc, blkaddr);
> @@ -1876,9 +1947,15 @@ static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
>   				 blkstart, blklen);
>   			return -EIO;
>   		}
> -		trace_f2fs_issue_reset_zone(bdev, blkstart);
> -		return blkdev_zone_mgmt(bdev, REQ_OP_ZONE_RESET,
> -					sector, nr_sects, GFP_NOFS);
> +
> +		if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING))) {
> +			trace_f2fs_issue_reset_zone(bdev, blkstart);
> +			return blkdev_zone_mgmt(bdev, REQ_OP_ZONE_RESET,
> +						sector, nr_sects, GFP_NOFS);
> +		}
> +
> +		__queue_zone_reset_cmd(sbi, bdev, blkstart, lblkstart, blklen);
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
