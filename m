Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9A110B566
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Nov 2019 19:18:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ia1tK-0002Dh-P6; Wed, 27 Nov 2019 18:18:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ia1tI-0002DZ-Mr
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Nov 2019 18:18:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SENlQ9cvWsEyM3AX8Admdi7IIe4WDspoVdiOpylt/P4=; b=eO0kkV2LNWjBJsR9pqvneyM6Qs
 ska2/dmiWjXQPAJO9x98flEhpJEbWsIY2k2l4S3YqlJZGbWtLko3EK2WHQSK+Z0+d0SFgaHJLJORO
 u0dkIGmCiy/g7qAsXvoLi64WkIBqyiKBpA5HWrgByPvI+cGMNWDOUZ7/7BLBgyZV1t7w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SENlQ9cvWsEyM3AX8Admdi7IIe4WDspoVdiOpylt/P4=; b=H/NM8/0cxXa+1UAJKI0lo9gm+W
 GWwuSLULoF6iu1/Z0MNdbRypixaS5yKDQhx7XZrmB3JAZ6MI6jjtifWSbZRXaG79HHB04UhmnTW1H
 mX1GIqLre5KyZKJgCxvSIZAr5oJzdi5OxKD6d+Gp1MGr+dGdPdS1vWIpmwu/clZtgAk4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ia1tI-00FFrU-40
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Nov 2019 18:18:17 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8F92F207DD;
 Wed, 27 Nov 2019 18:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574878689;
 bh=i/se3RcsIPtxeow2Cfr1VyNjTABmBaPuWZQ0WCVcX7k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xRw2qL+FEZ3XWaQeCI4z4moDQmgMA5ZP8RI1XqHP6Hk8Wb4Rzhsc67EIACtWC5cKb
 RRlUbshXjgJD2y2U1aoJMkIwxHuPepARGx8rEIf+ZX4UVzqnuQ6EKlhm9o3/gVbTxk
 Qp+VqMW25truA+f5h8nVxdIRQW7CaOoT7gBUxceM=
Date: Wed, 27 Nov 2019 10:18:09 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20191127181809.GA42245@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190518004751.18962-1-jaegeuk@kernel.org>
 <20190518005304.GA19446@jaegeuk-macbookpro.roam.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190518005304.GA19446@jaegeuk-macbookpro.roam.corp.google.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: cisco.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ia1tI-00FFrU-40
Subject: Re: [f2fs-dev] [PATCH v3] loop: avoid EAGAIN,
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
 Bart Van Assche <bvanassche@acm.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Previously, there was a bug where user could see stale buffer cache (e.g, 512B)
attached in the 4KB-sized pager cache, when the block size was changed from
512B to 4KB. That was fixed by:
commit 5db470e229e2 ("loop: drop caches if offset or block_size are changed")

But, there were some regression reports saying the fix returns EAGAIN easily.
So, this patch removes previously added EAGAIN condition, nrpages != 0.

Instead, it changes the flow like this:
- sync_blockdev()
- blk_mq_freeze_queue()
 : change the loop configuration
- blk_mq_unfreeze_queue()
- sync_blockdev()
- invalidate_bdev()

After invalidating the buffer cache, we must see the full valid 4KB page.

Additional concern came from Bart in which we can lose some data when
changing the lo_offset. In that case, this patch adds:
- sync_blockdev()
- blk_set_queue_dying
- blk_mq_freeze_queue()
 : change the loop configuration
- blk_mq_unfreeze_queue()
- blk_queue_flag_clear(QUEUE_FLAG_DYING);
- sync_blockdev()
- invalidate_bdev()

Report: https://bugs.chromium.org/p/chromium/issues/detail?id=938958#c38

Cc: <stable@vger.kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org
Cc: Bart Van Assche <bvanassche@acm.org>
Fixes: 5db470e229e2 ("loop: drop caches if offset or block_size are changed")
Reported-by: Gwendal Grignou <gwendal@chromium.org>
Reported-by: grygorii tertychnyi <gtertych@cisco.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 drivers/block/loop.c | 65 ++++++++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 32 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index f6f77eaa7217..b583050d513a 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1232,6 +1232,8 @@ loop_set_status(struct loop_device *lo, const struct loop_info64 *info)
 	kuid_t uid = current_uid();
 	struct block_device *bdev;
 	bool partscan = false;
+	bool drop_request = false;
+	bool drop_cache = false;
 
 	err = mutex_lock_killable(&loop_ctl_mutex);
 	if (err)
@@ -1251,14 +1253,21 @@ loop_set_status(struct loop_device *lo, const struct loop_info64 *info)
 		goto out_unlock;
 	}
 
+	if (lo->lo_offset != info->lo_offset)
+		drop_request = true;
 	if (lo->lo_offset != info->lo_offset ||
-	    lo->lo_sizelimit != info->lo_sizelimit) {
-		sync_blockdev(lo->lo_device);
-		kill_bdev(lo->lo_device);
-	}
+	    lo->lo_sizelimit != info->lo_sizelimit)
+		drop_cache = true;
 
-	/* I/O need to be drained during transfer transition */
-	blk_mq_freeze_queue(lo->lo_queue);
+	sync_blockdev(lo->lo_device);
+
+	if (drop_request) {
+		blk_set_queue_dying(lo->lo_queue);
+		blk_mq_freeze_queue_wait(lo->lo_queue);
+	} else {
+		/* I/O need to be drained during transfer transition */
+		blk_mq_freeze_queue(lo->lo_queue);
+	}
 
 	err = loop_release_xfer(lo);
 	if (err)
@@ -1285,14 +1294,6 @@ loop_set_status(struct loop_device *lo, const struct loop_info64 *info)
 
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
@@ -1329,6 +1330,8 @@ loop_set_status(struct loop_device *lo, const struct loop_info64 *info)
 
 out_unfreeze:
 	blk_mq_unfreeze_queue(lo->lo_queue);
+	if (drop_request)
+		blk_queue_flag_clear(QUEUE_FLAG_DYING, lo->lo_queue);
 
 	if (!err && (info->lo_flags & LO_FLAGS_PARTSCAN) &&
 	     !(lo->lo_flags & LO_FLAGS_PARTSCAN)) {
@@ -1337,6 +1340,12 @@ loop_set_status(struct loop_device *lo, const struct loop_info64 *info)
 		bdev = lo->lo_device;
 		partscan = true;
 	}
+
+	/* truncate stale pages cached by previous operations */
+	if (!err && drop_cache) {
+		sync_blockdev(lo->lo_device);
+		invalidate_bdev(lo->lo_device);
+	}
 out_unlock:
 	mutex_unlock(&loop_ctl_mutex);
 	if (partscan)
@@ -1518,7 +1527,7 @@ static int loop_set_dio(struct loop_device *lo, unsigned long arg)
 
 static int loop_set_block_size(struct loop_device *lo, unsigned long arg)
 {
-	int err = 0;
+	bool drop_cache = false;
 
 	if (lo->lo_state != Lo_bound)
 		return -ENXIO;
@@ -1526,31 +1535,23 @@ static int loop_set_block_size(struct loop_device *lo, unsigned long arg)
 	if (arg < 512 || arg > PAGE_SIZE || !is_power_of_2(arg))
 		return -EINVAL;
 
-	if (lo->lo_queue->limits.logical_block_size != arg) {
-		sync_blockdev(lo->lo_device);
-		kill_bdev(lo->lo_device);
-	}
+	if (lo->lo_queue->limits.logical_block_size != arg)
+		drop_cache = true;
 
+	sync_blockdev(lo->lo_device);
 	blk_mq_freeze_queue(lo->lo_queue);
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
 	blk_mq_unfreeze_queue(lo->lo_queue);
 
-	return err;
+	/* truncate stale pages cached by previous operations */
+	if (drop_cache) {
+		sync_blockdev(lo->lo_device);
+		invalidate_bdev(lo->lo_device);
+	}
+	return 0;
 }
 
 static int lo_simple_ioctl(struct loop_device *lo, unsigned int cmd,
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
