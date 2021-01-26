Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7247930420F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Jan 2021 16:17:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4Q67-0003Wd-2n; Tue, 26 Jan 2021 15:17:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+b7a2078c382f6036dc0e+6365+infradead.org+hch@casper.srs.infradead.org>)
 id 1l4Q65-0003WI-Kz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 15:17:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BHMYrIZChAL94/n3vke3x6oFzyJ8B32MBvCjMF88fZE=; b=kP773uo80WJmbqG7XziofcltIa
 WzSqC+FhlvFKLKf9Mll/bEnhmo1hsLSBRaMo9J8ZOS+9ZOHBa5GZ3p8O7S5guP7uQyjUgb1wQAxGg
 8zvuHhpnzgBH1+5z/S6iNqgd9Nm0zvkLmNrsBCMr5hEKZisuRZnYBkndI+qXGx+2klOQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BHMYrIZChAL94/n3vke3x6oFzyJ8B32MBvCjMF88fZE=; b=WyN7NejQ6FGOHLGOrbLGwUGA2P
 ZsMeihvbYXBUDn1W8VBOALJp8g4KSSdLxY+DRYY0HJiYlr/ZknYfyy5uHi3HwJcdVwZWI6wHpPlau
 eHVuIcb4Hj5BI/U0qE4USJ6JQ7mIYpwhDra0OFbS841O754i7xuXdZy1RVJYhFmWtvMw=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l4Q61-00AMQR-GE
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 15:17:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=BHMYrIZChAL94/n3vke3x6oFzyJ8B32MBvCjMF88fZE=; b=tXXHDJVdVvzYbTZuPz+vJ3gRhW
 jTyCl6y3lR/FgMqfGC0lVlhwXd94x5vhpKZBrNHoOqTtI3LV3teXJVAaz7w8cPfWP4VkrJGte08SF
 9Q6bSGsBok6JddSpN1RFCvTMrsHZfRmmZx8zWVHDObMHKfpEOCTtzX/hMVvUGsgnztpcxkrjTiU8e
 9ZKf1w5OZ1Gg5GprmibourOhlPUC0iQXmI52+b0qHt50lICpjBVyWtje5ywxovoTUmjlO9zK8JOEp
 t3VJw8M1t3EG47qkxdW9FhyheKUWMulLMx0s0ramrZJVQ7jZKzhjeeBFDXHW6ml0AF/49zKUsC4C+
 WYc0/Kkg==;
Received: from [2001:4bb8:191:e347:5918:ac86:61cb:8801] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l4Pzl-005nol-TW; Tue, 26 Jan 2021 15:11:23 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Song Liu <song@kernel.org>
Date: Tue, 26 Jan 2021 15:52:41 +0100
Message-Id: <20210126145247.1964410-12-hch@lst.de>
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
X-Headers-End: 1l4Q61-00AMQR-GE
Subject: [f2fs-dev] [PATCH 11/17] md: remove bio_alloc_mddev
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

bio_alloc_mddev is never called with a NULL mddev, and ->bio_set is
initialized in md_run, so it always must be initialized as well.  Just
open code the remaining call to bio_alloc_bioset.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/md.c     | 12 +-----------
 drivers/md/md.h     |  2 --
 drivers/md/raid1.c  |  2 +-
 drivers/md/raid10.c |  2 +-
 4 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 7d1bb24add3107..e2b9dbb6e888f6 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -340,16 +340,6 @@ static int start_readonly;
  */
 static bool create_on_open = true;
 
-struct bio *bio_alloc_mddev(gfp_t gfp_mask, int nr_iovecs,
-			    struct mddev *mddev)
-{
-	if (!mddev || !bioset_initialized(&mddev->bio_set))
-		return bio_alloc(gfp_mask, nr_iovecs);
-
-	return bio_alloc_bioset(gfp_mask, nr_iovecs, &mddev->bio_set);
-}
-EXPORT_SYMBOL_GPL(bio_alloc_mddev);
-
 static struct bio *md_bio_alloc_sync(struct mddev *mddev)
 {
 	if (!mddev || !bioset_initialized(&mddev->sync_set))
@@ -613,7 +603,7 @@ static void submit_flushes(struct work_struct *ws)
 			atomic_inc(&rdev->nr_pending);
 			atomic_inc(&rdev->nr_pending);
 			rcu_read_unlock();
-			bi = bio_alloc_mddev(GFP_NOIO, 0, mddev);
+			bi = bio_alloc_bioset(GFP_NOIO, 0, &mddev->bio_set);
 			bi->bi_end_io = md_end_flush;
 			bi->bi_private = rdev;
 			bio_set_dev(bi, rdev->bdev);
diff --git a/drivers/md/md.h b/drivers/md/md.h
index f13290ccc1c248..bcbba1b5ec4a71 100644
--- a/drivers/md/md.h
+++ b/drivers/md/md.h
@@ -742,8 +742,6 @@ extern void md_rdev_clear(struct md_rdev *rdev);
 extern void md_handle_request(struct mddev *mddev, struct bio *bio);
 extern void mddev_suspend(struct mddev *mddev);
 extern void mddev_resume(struct mddev *mddev);
-extern struct bio *bio_alloc_mddev(gfp_t gfp_mask, int nr_iovecs,
-				   struct mddev *mddev);
 
 extern void md_reload_sb(struct mddev *mddev, int raid_disk);
 extern void md_update_sb(struct mddev *mddev, int force);
diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index 3b19141cdb4bc2..d2378765dc154f 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -1104,7 +1104,7 @@ static void alloc_behind_master_bio(struct r1bio *r1_bio,
 	int i = 0;
 	struct bio *behind_bio = NULL;
 
-	behind_bio = bio_alloc_mddev(GFP_NOIO, vcnt, r1_bio->mddev);
+	behind_bio = bio_alloc_bioset(GFP_NOIO, vcnt, &r1_bio->mddev->bio_set);
 	if (!behind_bio)
 		return;
 
diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index be8f14afb6d143..e1eefbec15d444 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -4531,7 +4531,7 @@ static sector_t reshape_request(struct mddev *mddev, sector_t sector_nr,
 		return sectors_done;
 	}
 
-	read_bio = bio_alloc_mddev(GFP_KERNEL, RESYNC_PAGES, mddev);
+	read_bio = bio_alloc_bioset(GFP_KERNEL, RESYNC_PAGES, &mddev->bio_set);
 
 	bio_set_dev(read_bio, rdev->bdev);
 	read_bio->bi_iter.bi_sector = (r10_bio->devs[r10_bio->read_slot].addr
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
