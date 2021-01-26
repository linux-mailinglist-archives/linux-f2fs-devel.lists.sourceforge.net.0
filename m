Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D8730421F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Jan 2021 16:19:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4Q7o-0002SQ-LY; Tue, 26 Jan 2021 15:19:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+b7a2078c382f6036dc0e+6365+infradead.org+hch@casper.srs.infradead.org>)
 id 1l4Q7n-0002SH-AH
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 15:19:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W8aYaHALoHXbZuaFOXKQTvVh+y8Fd7IAvJYrZZoNhdA=; b=QU6dIHrUKvdiqYuFRmbfS51ffv
 eNINiO6PhfgxsaCBU9yS8uGJqCyPmfmyinw1JpPBUPlI1dbTBScszz47a88yvE4cxRDNbmXw2OvJX
 0PlmqKiQzae55FG8K9aRp07ca6z1/P9xUUGpVqDlDkdrLcy2J/fvfMcLqrp2evvg+wHA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W8aYaHALoHXbZuaFOXKQTvVh+y8Fd7IAvJYrZZoNhdA=; b=CqSbGHhrhb6q9IoTGnwQlmK24W
 KURO97d1Axgyeb4oNYvJzDGTmou9hrTT5sVgUuoeqN5ELKvsNPOoGQARPnJteG4Y4scDqdU+PTO4b
 HPQfjmuQQvgdUOUPSS9C7+y+z89wGbRfYeR/0PmsdVUV9+/vjZMah4ipe2QkctuHCIZo=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l4Q7k-006m34-1K
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 15:19:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=W8aYaHALoHXbZuaFOXKQTvVh+y8Fd7IAvJYrZZoNhdA=; b=JGt1JH63w8eiaQAEI4n5kVSxVw
 Yb98hQCjj4BuRaFELXNV4V1YWR5whaTFBuvsbS38JX90ZmqkewzosVaccIltP0wA2PaXodrpLDpB2
 dSjrXAgSsWvpd2IUnGUtb9AYtQSvL35vq7Nk0hrDytjnDJgyME8PkByHiOhSAl9mtgqEmnzC6m+1a
 27nBnbSxYEnE4x0UzJcki15gkshb+GwSUKKI0Oto59KylHdpnaNOwDbNnn+gdjEjJTFJ/NFEbW1sE
 0TONqXtHBo84FuLa/h+/kr81vIkdUY2Vm7qMY41RhMKFBZje5JtOQrBJAVRfoZsXINuN6WnyqR5mx
 9qSFgATA==;
Received: from [2001:4bb8:191:e347:5918:ac86:61cb:8801] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l4Q1A-005nvT-6a; Tue, 26 Jan 2021 15:13:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Song Liu <song@kernel.org>
Date: Tue, 26 Jan 2021 15:52:42 +0100
Message-Id: <20210126145247.1964410-13-hch@lst.de>
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
X-Headers-End: 1l4Q7k-006m34-1K
Subject: [f2fs-dev] [PATCH 12/17] md: simplify sync_page_io
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

Use an on-stack bio and biovec for the single page synchronous I/O.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/md.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index e2b9dbb6e888f6..6a27f52007c871 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -1021,29 +1021,29 @@ int md_super_wait(struct mddev *mddev)
 int sync_page_io(struct md_rdev *rdev, sector_t sector, int size,
 		 struct page *page, int op, int op_flags, bool metadata_op)
 {
-	struct bio *bio = md_bio_alloc_sync(rdev->mddev);
-	int ret;
+	struct bio bio;
+	struct bio_vec bvec;
+
+	bio_init(&bio, &bvec, 1);
 
 	if (metadata_op && rdev->meta_bdev)
-		bio_set_dev(bio, rdev->meta_bdev);
+		bio_set_dev(&bio, rdev->meta_bdev);
 	else
-		bio_set_dev(bio, rdev->bdev);
-	bio_set_op_attrs(bio, op, op_flags);
+		bio_set_dev(&bio, rdev->bdev);
+	bio.bi_opf = op | op_flags;
 	if (metadata_op)
-		bio->bi_iter.bi_sector = sector + rdev->sb_start;
+		bio.bi_iter.bi_sector = sector + rdev->sb_start;
 	else if (rdev->mddev->reshape_position != MaxSector &&
 		 (rdev->mddev->reshape_backwards ==
 		  (sector >= rdev->mddev->reshape_position)))
-		bio->bi_iter.bi_sector = sector + rdev->new_data_offset;
+		bio.bi_iter.bi_sector = sector + rdev->new_data_offset;
 	else
-		bio->bi_iter.bi_sector = sector + rdev->data_offset;
-	bio_add_page(bio, page, size, 0);
+		bio.bi_iter.bi_sector = sector + rdev->data_offset;
+	bio_add_page(&bio, page, size, 0);
 
-	submit_bio_wait(bio);
+	submit_bio_wait(&bio);
 
-	ret = !bio->bi_status;
-	bio_put(bio);
-	return ret;
+	return !bio.bi_status;
 }
 EXPORT_SYMBOL_GPL(sync_page_io);
 
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
