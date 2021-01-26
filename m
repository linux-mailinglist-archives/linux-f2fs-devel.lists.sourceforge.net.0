Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD393041B7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Jan 2021 16:11:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4Q0I-00028b-Kk; Tue, 26 Jan 2021 15:11:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+b7a2078c382f6036dc0e+6365+infradead.org+hch@casper.srs.infradead.org>)
 id 1l4Q0G-00028R-FQ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 15:11:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o7VUFbuCs40X37XHTmVmjDE9l+0qzfo+L5D5+3HB/Xs=; b=bJ2D5MBFl4Xd+RX/ORK/Hqgipp
 sy3RkfKXO0GRFzG0lV3DlQl5PTpH1YXzssHc/KD+Gqtn/ClrNBTNRhkgPT7jivP1IRgjKhgkS9g4S
 P3jDugqp+6TLIQkNu1crpLI4bJsYE0Fgk3/QQGS8aRcTWI/ePrEIU9TwtBnid6beZcHo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o7VUFbuCs40X37XHTmVmjDE9l+0qzfo+L5D5+3HB/Xs=; b=emWYziH8D+W5LwYJO2jlJ1s5vQ
 Z1VtrSB6yvEp42d1k4xWnhehW8+wvnRNSLL1SWBmBE5VCtmLwEg9umE3NHlCm+edGyc5bLQ2sRRoR
 ThafA9WedQYgpDFcMPxYo9mTFM6XWCa9mxtMn0X9Z7bs0pZhpDcVgUQ+0XrbM90NgJ04=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l4Q0C-00AM20-0w
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 26 Jan 2021 15:11:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=o7VUFbuCs40X37XHTmVmjDE9l+0qzfo+L5D5+3HB/Xs=; b=aV79kHDk99zhkL6s5WblnMsXYm
 MUeYdtQAir6ZpBM6WxTX2uHNWa9GoJblM5+y9lvBViksx2RanhFgtOVoykjDrNKUAASUImAhQ2S9S
 kCfJVL4xwzijj26ZqmZV0RNsrXFPbf4N+/Nr6bUnSe70GhYydpXzWfT1u3SDcEBkvvxsPZwC5/Opl
 QrXnJfVNQdYsJMZo5rcHFwaYuDhpw+B9jZZ2qD3QFDvKwydp8nBngTufhjUIOGN8sMm7ejCwV76Ba
 wQKngqSt6P9/gxTf3mYfoWEoeugpEM9qEEobeCMKiVADWZmeomcieNiE/g3oi2zy++X/iQc0gI0gY
 x6aONCMg==;
Received: from [2001:4bb8:191:e347:5918:ac86:61cb:8801] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l4PuS-005nI7-1q; Tue, 26 Jan 2021 15:06:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Song Liu <song@kernel.org>
Date: Tue, 26 Jan 2021 15:52:38 +0100
Message-Id: <20210126145247.1964410-9-hch@lst.de>
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
X-Headers-End: 1l4Q0C-00AM20-0w
Subject: [f2fs-dev] [PATCH 08/17] f2fs: remove FAULT_ALLOC_BIO
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

Sleeping bio allocations do not fail, which means that injecting an error
into sleeping bio allocations is a little silly.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 Documentation/filesystems/f2fs.rst |  1 -
 fs/f2fs/data.c                     | 29 ++++-------------------------
 fs/f2fs/f2fs.h                     |  1 -
 fs/f2fs/super.c                    |  1 -
 4 files changed, 4 insertions(+), 28 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index dae15c96e659e2..624f5f3ed93e86 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -179,7 +179,6 @@ fault_type=%d		 Support configuring fault injection type, should be
 			 FAULT_KVMALLOC		  0x000000002
 			 FAULT_PAGE_ALLOC	  0x000000004
 			 FAULT_PAGE_GET		  0x000000008
-			 FAULT_ALLOC_BIO	  0x000000010
 			 FAULT_ALLOC_NID	  0x000000020
 			 FAULT_ORPHAN		  0x000000040
 			 FAULT_BLOCK		  0x000000080
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 0cf0c605992431..9fb6be65592b1f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -50,28 +50,6 @@ void f2fs_destroy_bioset(void)
 	bioset_exit(&f2fs_bioset);
 }
 
-static inline struct bio *__f2fs_bio_alloc(gfp_t gfp_mask,
-						unsigned int nr_iovecs)
-{
-	return bio_alloc_bioset(gfp_mask, nr_iovecs, &f2fs_bioset);
-}
-
-static struct bio *f2fs_bio_alloc(struct f2fs_sb_info *sbi, int npages,
-		bool noio)
-{
-	if (noio) {
-		/* No failure on bio allocation */
-		return __f2fs_bio_alloc(GFP_NOIO, npages);
-	}
-
-	if (time_to_inject(sbi, FAULT_ALLOC_BIO)) {
-		f2fs_show_injection_info(sbi, FAULT_ALLOC_BIO);
-		return NULL;
-	}
-
-	return __f2fs_bio_alloc(GFP_KERNEL, npages);
-}
-
 static bool __is_cp_guaranteed(struct page *page)
 {
 	struct address_space *mapping = page->mapping;
@@ -433,7 +411,7 @@ static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
 	struct f2fs_sb_info *sbi = fio->sbi;
 	struct bio *bio;
 
-	bio = f2fs_bio_alloc(sbi, npages, true);
+	bio = bio_alloc_bioset(GFP_NOIO, npages, &f2fs_bioset);
 
 	f2fs_target_device(sbi, fio->new_blkaddr, bio);
 	if (is_read_io(fio->op)) {
@@ -1029,8 +1007,9 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 	struct bio_post_read_ctx *ctx;
 	unsigned int post_read_steps = 0;
 
-	bio = f2fs_bio_alloc(sbi, min_t(int, nr_pages, BIO_MAX_PAGES),
-								for_write);
+	bio = bio_alloc_bioset(for_write ? GFP_NOIO : GFP_KERNEL,
+			       min_t(int, nr_pages, BIO_MAX_PAGES),
+			       &f2fs_bioset);
 	if (!bio)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 902bd3267c03e1..6c78365d80ceb5 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -43,7 +43,6 @@ enum {
 	FAULT_KVMALLOC,
 	FAULT_PAGE_ALLOC,
 	FAULT_PAGE_GET,
-	FAULT_ALLOC_BIO,
 	FAULT_ALLOC_NID,
 	FAULT_ORPHAN,
 	FAULT_BLOCK,
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index b4a07fe62d1a58..3a312642907e86 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -45,7 +45,6 @@ const char *f2fs_fault_name[FAULT_MAX] = {
 	[FAULT_KVMALLOC]	= "kvmalloc",
 	[FAULT_PAGE_ALLOC]	= "page alloc",
 	[FAULT_PAGE_GET]	= "page get",
-	[FAULT_ALLOC_BIO]	= "alloc bio",
 	[FAULT_ALLOC_NID]	= "alloc nid",
 	[FAULT_ORPHAN]		= "orphan",
 	[FAULT_BLOCK]		= "no more block",
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
