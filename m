Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DA3304274
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Jan 2021 16:26:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4QER-00030V-V4; Tue, 26 Jan 2021 15:26:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+b7a2078c382f6036dc0e+6365+infradead.org+hch@casper.srs.infradead.org>)
 id 1l4QEQ-00030K-68
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 15:26:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=imDKE4404TVupECTT3CTRw+cqCPUxNPppd2/iiQCXMs=; b=Qlx2/3aHHSG2j7cXQLDNSIII+2
 1x5xZdi+JZJkRRmKV/0Q7v7Z4hVMVpKS90zw8vskH6uFJWtZ5JC930zvhFOvSbsa3YaAHxPXInaUv
 VzJ5f8nm6VQGAGFuNN9nNnR/k5onjiX+5taDpB/uNYAQ9OHOhmbA5OHAoFh1ibTeQn3w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=imDKE4404TVupECTT3CTRw+cqCPUxNPppd2/iiQCXMs=; b=UuHLXzTZ4CLuUJ/cB4HD35u3eL
 MYiz24ZH4TxnZR/J7w6IXhRmxC6XyTBV3d5P17gB9WdSfrLbYzrDUHnFZJtao3VZ1N2Nk+ZBdNaKT
 j6RYlPKXTrcKZzPWFcljF8fNEkOrDwCOLBX1vb1Rs9xG/3nZ24xhXqwYgs2bdfQEIZ5Y=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l4QEE-006mpF-49
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 15:26:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=imDKE4404TVupECTT3CTRw+cqCPUxNPppd2/iiQCXMs=; b=aQgfKd6q628v0njktwMXtO+tpa
 VQ6AN2ML+AjC9smASiy0wrdfS4sFFCnIEmcIXu/uC9Ta7v/gFWb+6z6PpQmY8jMFGWtYqV8VJSHA0
 dXAF/4pi0+HC8kVchlMaU5GmAZa714wa2/luSOmABw0GZfAT6AU7MbJuMKkGL5tnR0JtqQacKoy8n
 WCCfmaNoO8QrPSmsSJPHsjQGoOnH268uw3Hhya2Ewhml5arq/gCxUDMs/smtqApFBFC+qBFUve6kd
 hWTlztN9lb5yJebq1pTZJuSmAUl3qDJDAbW4e+pnBNWS1tiUosnRkCm/5hJV/Kb0mS6xYMUviraAV
 ixL6cw1Q==;
Received: from [2001:4bb8:191:e347:5918:ac86:61cb:8801] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l4QAZ-005opo-7d; Tue, 26 Jan 2021 15:22:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Song Liu <song@kernel.org>
Date: Tue, 26 Jan 2021 15:52:47 +0100
Message-Id: <20210126145247.1964410-18-hch@lst.de>
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
X-Headers-End: 1l4QEE-006mpF-49
Subject: [f2fs-dev] [PATCH 17/17] mm: remove get_swap_bio
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

Just reuse the block_device and sector from the swap_info structure,
just as used by the SWP_SYNCHRONOUS path.  Also remove the checks for
NULL returns from bio_alloc as that can't happen for sleeping
allocations.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/swap.h |  1 -
 mm/page_io.c         | 45 +++++++++++++-------------------------------
 mm/swapfile.c        | 10 ----------
 3 files changed, 13 insertions(+), 43 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 596bc2f4d9b03e..3f1f7ae0fbe9e1 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -468,7 +468,6 @@ extern int free_swap_and_cache(swp_entry_t);
 int swap_type_of(dev_t device, sector_t offset);
 int find_first_swap(dev_t *device);
 extern unsigned int count_swap_pages(int, int);
-extern sector_t map_swap_page(struct page *, struct block_device **);
 extern sector_t swapdev_block(int, pgoff_t);
 extern int page_swapcount(struct page *);
 extern int __swap_count(swp_entry_t entry);
diff --git a/mm/page_io.c b/mm/page_io.c
index a75f35464a4e73..92f7941c6d018b 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -26,25 +26,6 @@
 #include <linux/uio.h>
 #include <linux/sched/task.h>
 
-static struct bio *get_swap_bio(gfp_t gfp_flags,
-				struct page *page, bio_end_io_t end_io)
-{
-	struct bio *bio;
-
-	bio = bio_alloc(gfp_flags, 1);
-	if (bio) {
-		struct block_device *bdev;
-
-		bio->bi_iter.bi_sector = map_swap_page(page, &bdev);
-		bio_set_dev(bio, bdev);
-		bio->bi_iter.bi_sector <<= PAGE_SHIFT - 9;
-		bio->bi_end_io = end_io;
-
-		bio_add_page(bio, page, thp_size(page), 0);
-	}
-	return bio;
-}
-
 void end_swap_bio_write(struct bio *bio)
 {
 	struct page *page = bio_first_page_all(bio);
@@ -361,13 +342,13 @@ int __swap_writepage(struct page *page, struct writeback_control *wbc,
 		return 0;
 	}
 
-	bio = get_swap_bio(GFP_NOIO, page, end_write_func);
-	if (bio == NULL) {
-		set_page_dirty(page);
-		unlock_page(page);
-		return -ENOMEM;
-	}
+	bio = bio_alloc(GFP_NOIO, 1);
+	bio_set_dev(bio, sis->bdev);
+	bio->bi_iter.bi_sector = swap_page_sector(page);
 	bio->bi_opf = REQ_OP_WRITE | REQ_SWAP | wbc_to_write_flags(wbc);
+	bio->bi_end_io = end_write_func;
+	bio_add_page(bio, page, thp_size(page), 0);
+
 	bio_associate_blkg_from_page(bio, page);
 	count_swpout_vm_event(page);
 	set_page_writeback(page);
@@ -427,18 +408,18 @@ int swap_readpage(struct page *page, bool synchronous)
 	}
 
 	ret = 0;
-	bio = get_swap_bio(GFP_KERNEL, page, end_swap_bio_read);
-	if (bio == NULL) {
-		unlock_page(page);
-		ret = -ENOMEM;
-		goto out;
-	}
+	bio = bio_alloc(GFP_KERNEL, 1);
+	bio_set_dev(bio, sis->bdev);
+	bio->bi_opf = REQ_OP_READ;
+	bio->bi_iter.bi_sector = swap_page_sector(page);
+	bio->bi_end_io = end_swap_bio_read;
+	bio_add_page(bio, page, thp_size(page), 0);
+
 	disk = bio->bi_bdev->bd_disk;
 	/*
 	 * Keep this task valid during swap readpage because the oom killer may
 	 * attempt to access it in the page fault retry time check.
 	 */
-	bio_set_op_attrs(bio, REQ_OP_READ, 0);
 	if (synchronous) {
 		bio->bi_opf |= REQ_HIPRI;
 		get_task_struct(current);
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 9fffc5af29d1b9..bfa9e8b0c2ef61 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -2301,16 +2301,6 @@ static sector_t map_swap_entry(swp_entry_t entry, struct block_device **bdev)
 	return se->start_block + (offset - se->start_page);
 }
 
-/*
- * Returns the page offset into bdev for the specified page's swap entry.
- */
-sector_t map_swap_page(struct page *page, struct block_device **bdev)
-{
-	swp_entry_t entry;
-	entry.val = page_private(page);
-	return map_swap_entry(entry, bdev);
-}
-
 /*
  * Free all of a swapdev's extent information
  */
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
