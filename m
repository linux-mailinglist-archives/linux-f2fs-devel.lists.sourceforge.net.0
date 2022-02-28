Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 909BC4C6CCF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Feb 2022 13:41:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nOfLT-00071A-P7; Mon, 28 Feb 2022 12:41:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+72096dbc355c8c690838+6763+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1nOfLR-000712-Dh
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Feb 2022 12:41:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sO2im4q5HIxQ/9U7/PnqC7nl9Uj+KF5Fp6rQ0FndRNE=; b=b6OcLb9uVfJ8BvplZHpo4q4S40
 07Kp3Ls5usFIjmpLJY5FCsiw429fKKMPplIUXdlDnA3P68GAq+m+fqTvAv0Dmt+2joPTliRCv9Wz9
 P0wGO7eDeCsrOW18kNsOFq+aKWbpev2cIe8wZwLFLyLXNA18dYLff7N+qfIbUzMrYuLg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sO2im4q5HIxQ/9U7/PnqC7nl9Uj+KF5Fp6rQ0FndRNE=; b=cDaeP3r2Susa7x8P4ipK0PUVK8
 qKtPAHKwtjqt1/vD7P1AkXWGlg5T2sQbFkgRMGLkA8mLCxV23fTGX5eUpmR4mja+vv8qePtHJzT0y
 /65/xTAY3Q5i2QbG+eLwlHs9hAW6rCWcTVpTQXQ0JEKIvXJJNoswNYy8S48E6rvyjnRU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nOfLN-0004Rr-Q7
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Feb 2022 12:41:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=sO2im4q5HIxQ/9U7/PnqC7nl9Uj+KF5Fp6rQ0FndRNE=; b=BivsgwChJw97A0S/uSpa52r0My
 qVGNhxb5MX50TYGOfNOirKymaMrAKXYyjuDLMIndNKkXI4O8YGNg3mDwPPiU8cmBECswKZtt0gdEX
 b26QYXNKP1GOPOhGt/UbPiWYTjgXQ6bQzkRgkrXdLJaELSdGK0/yl26l1kXK7MkwwX+baoQ5kG1Rm
 ap+36rhuuQqJXNe54vPbsa3fNTGr5Q9wg385nn5U7zCwpO7n1VXX+7nI1cjwGDbvZ2vdTEXhm6Hep
 TVfTRbIMFweU1LDWgxLSTy+bKKwSBH6Aq363FxxVzfdaHxHb+MEaAgJLUb+afUx0aYZSE5UoBfnaM
 kcZWDBLA==;
Received: from [2.53.163.181] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOfLG-00CHdk-Ex; Mon, 28 Feb 2022 12:41:30 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 28 Feb 2022 14:41:22 +0200
Message-Id: <20220228124123.856027-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220228124123.856027-1-hch@lst.de>
References: <20220228124123.856027-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Set the bdev at bio allocation time by changing the
 f2fs_target_device
 calling conventions, so that no bio needs to be passed in. Signed-off-by:
 Christoph Hellwig <hch@lst.de> --- fs/f2fs/data.c | 25 +++++++++++++
 fs/f2fs/f2fs.h
 | 2 +- 2 files changed, 14 insertions(+), 13 deletions(-) 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nOfLN-0004Rr-Q7
Subject: [f2fs-dev] [PATCH 1/2] f2fs: don't pass a bio to f2fs_target_device
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Set the bdev at bio allocation time by changing the f2fs_target_device
calling conventions, so that no bio needs to be passed in.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/data.c | 25 +++++++++++++------------
 fs/f2fs/f2fs.h |  2 +-
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index e71dde8de0db0..59dd0347c4bc8 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -354,7 +354,7 @@ static void f2fs_write_end_io(struct bio *bio)
 }
 
 struct block_device *f2fs_target_device(struct f2fs_sb_info *sbi,
-				block_t blk_addr, struct bio *bio)
+		block_t blk_addr, sector_t *sector)
 {
 	struct block_device *bdev = sbi->sb->s_bdev;
 	int i;
@@ -369,10 +369,9 @@ struct block_device *f2fs_target_device(struct f2fs_sb_info *sbi,
 			}
 		}
 	}
-	if (bio) {
-		bio_set_dev(bio, bdev);
-		bio->bi_iter.bi_sector = SECTOR_FROM_BLOCK(blk_addr);
-	}
+
+	if (sector)
+		*sector = SECTOR_FROM_BLOCK(blk_addr);
 	return bdev;
 }
 
@@ -392,11 +391,13 @@ int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr)
 static struct bio *__bio_alloc(struct f2fs_io_info *fio, int npages)
 {
 	struct f2fs_sb_info *sbi = fio->sbi;
+	struct block_device *bdev;
+	sector_t sector;
 	struct bio *bio;
 
-	bio = bio_alloc_bioset(NULL, npages, 0, GFP_NOIO, &f2fs_bioset);
-
-	f2fs_target_device(sbi, fio->new_blkaddr, bio);
+	bdev = f2fs_target_device(sbi, fio->new_blkaddr, &sector);
+	bio = bio_alloc_bioset(bdev, npages, 0, GFP_NOIO, &f2fs_bioset);
+	bio->bi_iter.bi_sector = sector;
 	if (is_read_io(fio->op)) {
 		bio->bi_end_io = f2fs_read_end_io;
 		bio->bi_private = NULL;
@@ -984,15 +985,15 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 	struct bio *bio;
 	struct bio_post_read_ctx *ctx = NULL;
 	unsigned int post_read_steps = 0;
+	sector_t sector;
+	struct block_device *bdev = f2fs_target_device(sbi, blkaddr, &sector);
 
-	bio = bio_alloc_bioset(NULL, bio_max_segs(nr_pages), REQ_OP_READ,
+	bio = bio_alloc_bioset(bdev, bio_max_segs(nr_pages), REQ_OP_READ,
 			       for_write ? GFP_NOIO : GFP_KERNEL, &f2fs_bioset);
 	if (!bio)
 		return ERR_PTR(-ENOMEM);
-
+	bio->bi_iter.bi_sector = sector;
 	f2fs_set_bio_crypt_ctx(bio, inode, first_idx, NULL, GFP_NOFS);
-
-	f2fs_target_device(sbi, blkaddr, bio);
 	bio->bi_end_io = f2fs_read_end_io;
 
 	if (fscrypt_inode_uses_fs_layer_crypto(inode))
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index eb22fa91c2b26..37faae388fe01 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3631,7 +3631,7 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio);
 int f2fs_merge_page_bio(struct f2fs_io_info *fio);
 void f2fs_submit_page_write(struct f2fs_io_info *fio);
 struct block_device *f2fs_target_device(struct f2fs_sb_info *sbi,
-			block_t blk_addr, struct bio *bio);
+		block_t blk_addr, sector_t *sector);
 int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr);
 void f2fs_set_data_blkaddr(struct dnode_of_data *dn);
 void f2fs_update_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr);
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
