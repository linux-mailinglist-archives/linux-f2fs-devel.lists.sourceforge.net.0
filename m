Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1FD304184
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Jan 2021 16:08:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4Pwp-0001wJ-0K; Tue, 26 Jan 2021 15:08:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+b7a2078c382f6036dc0e+6365+infradead.org+hch@casper.srs.infradead.org>)
 id 1l4Pwo-0001w7-38
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 15:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KOVL9a1MkJeVtbO5wAEfyylWZoWniZN5JlBdpQ6RLVM=; b=jgfvkaYkKAMpVa1xPausRIkhgI
 J05wK5UY1q/uQpoez6gDv0Og04gI2pxLFTBRouscbtbi9Xs1DLP68AI4OGxjEAzJ6CeKc8yboBreV
 jznqw4Sk5HUgeq3Uwb1e4hjZMVG4DBVivtl1+GxtL5kLt9Vh08we0xZuIm11DXQHXWkA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KOVL9a1MkJeVtbO5wAEfyylWZoWniZN5JlBdpQ6RLVM=; b=Iqk1FQR0xGnTT/J8drP+e7P9WW
 iPO/EvmqGkUVwGQfYB9PeEZOx09nQjJ3sfN2T776He29+LLxltTgA8D+FnJNniCASWO+zXe3XNuGQ
 Z7IlwC8ZrZ34xNwT8vsISzIySRroGY2GXpOLfZJbeJt71XXLnLHpZ/9tvtUCJmUiYgAo=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l4Pwl-00ALfG-8m
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 15:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=KOVL9a1MkJeVtbO5wAEfyylWZoWniZN5JlBdpQ6RLVM=; b=UXprdS/M6ExT6y8z2YkV6ntwGP
 omDC0ofe3OnxV6Yi9f2pOA923E0+NvR1wQq66SRHdZNqeVD0AQ/Acio/9Gjfz/d10FJCj/4OtjPPq
 5vLqgkQ6Gw3w0jW1aGI3RDIv1430L0ay0COX8MLA1pUbgCL2jA3OvOmmWJjwcwk2myTY7jXxTdmLj
 Mi4ZHZsF7s1B2FS9/PgBbHuju0uOmuX3pLQJDcXwpWqzfDAQIQJbd7/DZ2lCXEyuoiqh6J3yWSM10
 2Im25S5t/YszSEhuYaz0/qYB7rknN6NIVA+IhRXWoJioq0M/9ZpeFlFCgmoUfgLlfbp5pszdUTI5J
 oiwn5nvQ==;
Received: from [2001:4bb8:191:e347:5918:ac86:61cb:8801] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l4Ps6-005mzo-8D; Tue, 26 Jan 2021 15:03:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Song Liu <song@kernel.org>
Date: Tue, 26 Jan 2021 15:52:36 +0100
Message-Id: <20210126145247.1964410-7-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210126145247.1964410-1-hch@lst.de>
References: <20210126145247.1964410-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l4Pwl-00ALfG-8m
Subject: [f2fs-dev] [PATCH 06/17] dm-clone: use blkdev_issue_flush in
 commit_metadata
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
Cc: Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org, dm-devel@redhat.com,
 drbd-dev@lists.linbit.com, Naohiro Aota <naohiro.aota@wdc.com>,
 linux-nilfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
 linux-nfs@vger.kernel.org, Coly Li <colyli@suse.de>,
 linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, linux-block@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Lars Ellenberg <lars.ellenberg@linbit.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use blkdev_issue_flush instead of open coding it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm-clone-target.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/md/dm-clone-target.c b/drivers/md/dm-clone-target.c
index bdb255edc20043..a90bdf9b2ca6bd 100644
--- a/drivers/md/dm-clone-target.c
+++ b/drivers/md/dm-clone-target.c
@@ -85,12 +85,6 @@ struct clone {
 
 	struct dm_clone_metadata *cmd;
 
-	/*
-	 * bio used to flush the destination device, before committing the
-	 * metadata.
-	 */
-	struct bio flush_bio;
-
 	/* Region hydration hash table */
 	struct hash_table_bucket *ht;
 
@@ -1155,11 +1149,7 @@ static int commit_metadata(struct clone *clone, bool *dest_dev_flushed)
 		goto out;
 	}
 
-	bio_reset(&clone->flush_bio);
-	bio_set_dev(&clone->flush_bio, clone->dest_dev->bdev);
-	clone->flush_bio.bi_opf = REQ_OP_WRITE | REQ_PREFLUSH;
-
-	r = submit_bio_wait(&clone->flush_bio);
+	r = blkdev_issue_flush(clone->dest_dev->bdev);
 	if (unlikely(r)) {
 		__metadata_operation_failed(clone, "flush destination device", r);
 		goto out;
@@ -1886,7 +1876,6 @@ static int clone_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	bio_list_init(&clone->deferred_flush_completions);
 	clone->hydration_offset = 0;
 	atomic_set(&clone->hydrations_in_flight, 0);
-	bio_init(&clone->flush_bio, NULL, 0);
 
 	clone->wq = alloc_workqueue("dm-" DM_MSG_PREFIX, WQ_MEM_RECLAIM, 0);
 	if (!clone->wq) {
@@ -1958,7 +1947,6 @@ static void clone_dtr(struct dm_target *ti)
 	struct clone *clone = ti->private;
 
 	mutex_destroy(&clone->commit_lock);
-	bio_uninit(&clone->flush_bio);
 
 	for (i = 0; i < clone->nr_ctr_args; i++)
 		kfree(clone->ctr_args[i]);
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
