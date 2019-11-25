Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A2D109391
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Nov 2019 19:36:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iZJDR-0004hO-Rx; Mon, 25 Nov 2019 18:36:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bart.vanassche@gmail.com>) id 1iZJDP-0004hG-Vt
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 18:36:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:Subject:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5wNA4KHBKZEp6N1N62CKTMhksw9S2p7XTOcetbk9WWE=; b=hMwUzDy8frJq4atnVq1QTFp+nD
 nH2vufEB4h5upTGKW/KSvVZhrD5bj7YyQ2IL6ay02ExBhSeNzRhnZHz+sh2ukVRk7tnqqxlkmRD/S
 UPbymvFy1zvlsfEGpJ2adsyYmrmH3NERu+ndX82BfBT8hXL6ZWhB2FrvK/cnJXZRb7/g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:Cc:To:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5wNA4KHBKZEp6N1N62CKTMhksw9S2p7XTOcetbk9WWE=; b=Qki3P9AsYHqr2Tz1QWWOVsVfhT
 850cCZ/LDmCy7xgw0ISXXq+TINtv0TOvZb8udPBVDq8Mx8GUjO96zgscRBzuR/OLPSWTcB0D8lpzg
 kVonX0DRSPVoYsx8ghr2Tilr6RjeOoTrxBF6ibH7CUcGuS0P+erTR507D+nP0D+A37Ao=;
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iZJDO-00DXtM-7v
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 18:36:03 +0000
Received: by mail-pf1-f193.google.com with SMTP id c184so7803169pfb.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 25 Nov 2019 10:36:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5wNA4KHBKZEp6N1N62CKTMhksw9S2p7XTOcetbk9WWE=;
 b=f6FCeB6NFY4m9K0qFVJDsjta9mO7XAfvX5vAk1AgCNdKw/tAcCPHRgR7Y8ThjsR/+r
 b4m0/X+/og7SLGTeycnHtJjzNqg16KZ9KHKnpm7D0vzzxsPL5g5eC8d7sqQi92nZotuY
 84EwG9qpJVfgC/3bL4+opS8sxpYrlkO/NwrBmyYFQz2x/y/oXQIW0gVF14Tmsu+eFHqP
 i63aB4Mk4M4BURHgo5uz8/+I1d30qZIJT7yNxUWYwlogbt5yCQ92oZsMF3KFp7QXN3wX
 WJ4Oq2T2iUu5Arftd9PK9fxgcRQ1BmV05a4i64YY+QBRNjZpFyurS37NLtpD1ZYQfY+e
 W5kQ==
X-Gm-Message-State: APjAAAXyky9vv6Jf/p2uxx+oKgAoWOp9MYvwafZERxHSJF91YZc34Jlt
 7eJ+hx5c2YqPfEhm7rabCWU=
X-Google-Smtp-Source: APXvYqzErU6dZ23s05ZiNGrtpG6AeWwc8RJzdWdziKcpVZeVa76TXRWv7WDf2HY1ETAGufIWNDQbhg==
X-Received: by 2002:a63:6c3:: with SMTP id 186mr33414159pgg.282.1574706956286; 
 Mon, 25 Nov 2019 10:35:56 -0800 (PST)
Received: from desktop-bart.svl.corp.google.com
 ([2620:15c:2cd:202:4308:52a3:24b6:2c60])
 by smtp.gmail.com with ESMTPSA id r5sm9373499pfh.179.2019.11.25.10.35.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2019 10:35:55 -0800 (PST)
From: Bart Van Assche <bvanassche@acm.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190518004751.18962-1-jaegeuk@kernel.org>
 <20190518005304.GA19446@jaegeuk-macbookpro.roam.corp.google.com>
 <1e1aae74-bd6b-dddb-0c88-660aac33872c@acm.org>
 <20191125175913.GC71634@jaegeuk-macbookpro.roam.corp.google.com>
Message-ID: <a4e5d6bd-3685-379a-c388-cd2871827b21@acm.org>
Date: Mon, 25 Nov 2019 10:35:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191125175913.GC71634@jaegeuk-macbookpro.roam.corp.google.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (bart.vanassche[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: acm.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.193 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 -0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iZJDO-00DXtM-7v
Subject: Re: [f2fs-dev] [PATCH v2] loop: avoid EAGAIN,
 if offset or block_size are changed
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/25/19 9:59 AM, Jaegeuk Kim wrote:
> On 11/19, Bart Van Assche wrote:
>> On 5/17/19 5:53 PM, Jaegeuk Kim wrote:
>>> This patch tries to avoid EAGAIN due to nrpages!=0 that was originally trying
>>> to drop stale pages resulting in wrong data access.
>>>
>>> Report: https://bugs.chromium.org/p/chromium/issues/detail?id=938958#c38
>>
>> Please provide a more detailed commit description. What is wrong with the
>> current implementation and why is the new behavior considered the correct
>> behavior?
> 
> Some history would be:
> 
> Original bug fix is:
> commit 5db470e229e2 ("loop: drop caches if offset or block_size are changed"),
> which returns EAGAIN so that user land like Chrome would require enhancing their
> error handling routines.
> 
> So, this patch tries to avoid EAGAIN while addressing the original bug.
> 
>>
>> This patch moves draining code from before the following comment to after
>> that comment:
>>
>> /* I/O need to be drained during transfer transition */
>>
>> Is that comment still correct or should it perhaps be updated?
> 
> IMHO, it's still valid.

Hi Jaegeuk,

Thank you for the additional and very helpful clarification. Can you have a look at the (totally untested) patch below? I prefer that version because it prevents concurrent processing of requests and syncing/killing the bdev.

Thanks,

Bart.


Subject: [PATCH] loop: Avoid EAGAIN if offset or block_size are changed

After sync_blockdev() and kill_bdev() have been called, more requests
can be submitted to the loop device. These requests dirty additional
pages, causing loop_set_status() to return -EAGAIN. Not all user space
code that changes the offset and/or the block size handles -EAGAIN
correctly. Hence make sure that loop_set_status() does not return
-EAGAIN.

Fixes: 5db470e229e2 ("loop: drop caches if offset or block_size are changed")
Reported-by: Gwendal Grignou <gwendal@chromium.org>
Reported-by: grygorii tertychnyi <gtertych@cisco.com>
Reported-by: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: <stable@vger.kernel.org>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
  drivers/block/loop.c | 35 +++++++----------------------------
  1 file changed, 7 insertions(+), 28 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 739b372a5112..48cfc8b9c247 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1264,15 +1264,15 @@ loop_set_status(struct loop_device *lo, const struct loop_info64 *info)
  		goto out_unlock;
  	}

+	/* I/O need to be drained during transfer transition */
+	blk_mq_freeze_queue(lo->lo_queue);
+
  	if (lo->lo_offset != info->lo_offset ||
  	    lo->lo_sizelimit != info->lo_sizelimit) {
  		sync_blockdev(lo->lo_device);
  		kill_bdev(lo->lo_device);
  	}

-	/* I/O need to be drained during transfer transition */
-	blk_mq_freeze_queue(lo->lo_queue);
-
  	err = loop_release_xfer(lo);
  	if (err)
  		goto out_unfreeze;
@@ -1298,14 +1298,6 @@ loop_set_status(struct loop_device *lo, const struct loop_info64 *info)

  	if (lo->lo_offset != info->lo_offset ||
  	    lo->lo_sizelimit != info->lo_sizelimit) {
-		/* kill_bdev should have truncated all the pages */
-		if (lo->lo_device->bd_inode->i_mapping->nrpages) {
-			err = -EAGAIN;
-			pr_warn("%s: loop%d (%s) has still dirty pages (nrpages=%lu)\n",
-				__func__, lo->lo_number, lo->lo_file_name,
-				lo->lo_device->bd_inode->i_mapping->nrpages);
-			goto out_unfreeze;
-		}
  		if (figure_loop_size(lo, info->lo_offset, info->lo_sizelimit)) {
  			err = -EFBIG;
  			goto out_unfreeze;
@@ -1531,39 +1523,26 @@ static int loop_set_dio(struct loop_device *lo, unsigned long arg)

  static int loop_set_block_size(struct loop_device *lo, unsigned long arg)
  {
-	int err = 0;
-
  	if (lo->lo_state != Lo_bound)
  		return -ENXIO;

  	if (arg < 512 || arg > PAGE_SIZE || !is_power_of_2(arg))
  		return -EINVAL;

+	blk_mq_freeze_queue(lo->lo_queue);
+
  	if (lo->lo_queue->limits.logical_block_size != arg) {
  		sync_blockdev(lo->lo_device);
  		kill_bdev(lo->lo_device);
  	}
-
-	blk_mq_freeze_queue(lo->lo_queue);
-
-	/* kill_bdev should have truncated all the pages */
-	if (lo->lo_queue->limits.logical_block_size != arg &&
-			lo->lo_device->bd_inode->i_mapping->nrpages) {
-		err = -EAGAIN;
-		pr_warn("%s: loop%d (%s) has still dirty pages (nrpages=%lu)\n",
-			__func__, lo->lo_number, lo->lo_file_name,
-			lo->lo_device->bd_inode->i_mapping->nrpages);
-		goto out_unfreeze;
-	}
-
  	blk_queue_logical_block_size(lo->lo_queue, arg);
  	blk_queue_physical_block_size(lo->lo_queue, arg);
  	blk_queue_io_min(lo->lo_queue, arg);
  	loop_update_dio(lo);
-out_unfreeze:
+
  	blk_mq_unfreeze_queue(lo->lo_queue);

-	return err;
+	return 0;
  }

  static int lo_simple_ioctl(struct loop_device *lo, unsigned int cmd,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
