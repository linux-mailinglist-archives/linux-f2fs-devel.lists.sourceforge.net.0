Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F10430419A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Jan 2021 16:09:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4Py0-0007Cm-OR; Tue, 26 Jan 2021 15:09:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+b7a2078c382f6036dc0e+6365+infradead.org+hch@casper.srs.infradead.org>)
 id 1l4Pxz-0007Ce-5T
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 15:09:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zy1yNACJwx6tY0xAylbc3LmDKE7IpoPxR60kvFb5LRI=; b=lPWx21MsR4dQ/+wqpwzC/ppL4h
 a1BWclidf6/sGx3NZ/V8KIEInia6wQPxLNGFRCAwhXYx22G3Dbt2Oj6NmfCgfsxEAB5ZLWKtC5yKx
 YV6u7CTXteC1Y9bUIPQ4xdKUtoxsx4yVQBFszIV7dX8m57qEa18j90lL2l+P6DQidSYk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Zy1yNACJwx6tY0xAylbc3LmDKE7IpoPxR60kvFb5LRI=; b=Yds+bMQhDHK9uGvfTXBU3P3EZL
 nTzuvBUp1D4s7DyKZP/CI1S9RCdNuCyvlBjkp5d7KFffySxETZtMsHEL9NIH0VCzn95qJXnPgnGPZ
 VDTazv/bnjbAQEshumbFKeYhq203T8g1Vx+tpolFv6oCvQLFdtunWCPZRvMZeW5Mxi6U=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l4Pxs-00ALk0-0U
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 15:09:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Zy1yNACJwx6tY0xAylbc3LmDKE7IpoPxR60kvFb5LRI=; b=ocoLOdEDKDs0IuNFSP9sgoTODv
 18PH5yYdILklt5Kcbk4RaNOumpH/dPygxlzzOi0F7kge6uR6vZPdKOW23YBL+UfRU3Hg53gGT+sdE
 L7Y2itAvM/yrtkW1Yulc5ANGTeem5ElQyw2MEJgaPcXb0rn6g2dRNjlXdsW0AdM00QuSgAQRTCF5i
 sG2hDmNa2gYg0o6VdGGNL4b7gjHoC3baCaLKFSmUBDtBto5EYLtmHVEA+eucEAVTT7YHamKlXI/RV
 cpzfxttXq3A3lFAC2B/WVmkxfelzhSzKudfS/jGmRwK27WhKvXoxcGP+EjBP96ON1vw/v2NYKF3Kb
 R3kKKz6w==;
Received: from [2001:4bb8:191:e347:5918:ac86:61cb:8801] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l4Pt5-005n5W-9A; Tue, 26 Jan 2021 15:04:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Song Liu <song@kernel.org>
Date: Tue, 26 Jan 2021 15:52:37 +0100
Message-Id: <20210126145247.1964410-8-hch@lst.de>
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
X-Headers-End: 1l4Pxs-00ALk0-0U
Subject: [f2fs-dev] [PATCH 07/17] f2fs: use blkdev_issue_flush in
 __submit_flush_wait
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

Use the blkdev_issue_flush helper instead of duplicating it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/data.c    |  3 ++-
 fs/f2fs/f2fs.h    |  1 -
 fs/f2fs/segment.c | 12 +-----------
 3 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 8cbf0315975228..0cf0c605992431 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -56,7 +56,8 @@ static inline struct bio *__f2fs_bio_alloc(gfp_t gfp_mask,
 	return bio_alloc_bioset(gfp_mask, nr_iovecs, &f2fs_bioset);
 }
 
-struct bio *f2fs_bio_alloc(struct f2fs_sb_info *sbi, int npages, bool noio)
+static struct bio *f2fs_bio_alloc(struct f2fs_sb_info *sbi, int npages,
+		bool noio)
 {
 	if (noio) {
 		/* No failure on bio allocation */
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index bb11759191dcc9..902bd3267c03e1 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3424,7 +3424,6 @@ void f2fs_destroy_checkpoint_caches(void);
  */
 int __init f2fs_init_bioset(void);
 void f2fs_destroy_bioset(void);
-struct bio *f2fs_bio_alloc(struct f2fs_sb_info *sbi, int npages, bool noio);
 int f2fs_init_bio_entry_cache(void);
 void f2fs_destroy_bio_entry_cache(void);
 void f2fs_submit_bio(struct f2fs_sb_info *sbi,
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index deca74cb17dfd8..c495f170ee400b 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -566,17 +566,7 @@ void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi, bool from_bg)
 static int __submit_flush_wait(struct f2fs_sb_info *sbi,
 				struct block_device *bdev)
 {
-	struct bio *bio;
-	int ret;
-
-	bio = f2fs_bio_alloc(sbi, 0, false);
-	if (!bio)
-		return -ENOMEM;
-
-	bio->bi_opf = REQ_OP_WRITE | REQ_SYNC | REQ_PREFLUSH;
-	bio_set_dev(bio, bdev);
-	ret = submit_bio_wait(bio);
-	bio_put(bio);
+	int ret = blkdev_issue_flush(bdev);
 
 	trace_f2fs_issue_flush(bdev, test_opt(sbi, NOBARRIER),
 				test_opt(sbi, FLUSH_MERGE), ret);
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
