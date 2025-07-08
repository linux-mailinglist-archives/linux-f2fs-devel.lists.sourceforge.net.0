Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A6CAFD440
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9oqaXANFcJFasjTvo6qqDVaakU9JUsRhE4Miz1enx7I=; b=Xwi1/LyZg/bq3gf/IOXZZNPx0P
	z88WXI/rQ+foAzeQItajFQGsmagaqrgcPsGZVbhVBrEzB8Xr844hfXGGAcqx7iz29/D2aHDWk/6t1
	koQyQtd/F6yGnBE716mLga4vZy7CfB/zM9WM5sBpsgE01hIsrhuIo9yWEBQTnMKIogRI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjy-0007P3-M0;
	Tue, 08 Jul 2025 17:04:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBju-0007LY-Vd
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=20d46BDlCYOrJVgiCQJHskGCjlaY7l/gORGNCNKgMsg=; b=bSqsl8Vh4JuQiL/RCIiVtMb8JA
 rb6CYfSMucWzAoNPynoW6ulLxcdVkfACq4zyg7r5oMw0kZKq5ia4ti6s5+9fuDp82rhbIMAWtDB7j
 gYUJ+TUhYmcaYKQwCaOr4uUm1ek7dhDxguJbpwYI4n5KJUhDqL18AULfu7dWwPtvlPIE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=20d46BDlCYOrJVgiCQJHskGCjlaY7l/gORGNCNKgMsg=; b=SQ7Y1OoxDeOCR6Lf55dBtgshnG
 AHKBW6OkpXIKjaKyKcG19fx8vSQRrgtXbpyoMPsLAj+Mrui9Tpdk/VLfG/+FB9I3TnABVR2jB2cLG
 xjLu34G/5V1f5T+TRj3LJtB9WHaooMUI0OeKdq/Vq/puqdazPCGv6Cv1fEpyWD+2L2Uk=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjq-0006Ek-Vi for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=20d46BDlCYOrJVgiCQJHskGCjlaY7l/gORGNCNKgMsg=; b=GW/cwW3FygHvKdRbstQtpb1DnD
 eRLufBEvdVEXnKQZ5Fg8by0w/mm+BrNqUkftkJoowQN/KQTAAMJdisVa3NJ/evqQhOv/CuVbbnqRh
 /T2CfLx/KtNOKmj085MRXuC++WR3xgPcAtoSZu02iQdJ6RG6cRb8e9CMplXUR2HKtW4hbndH+KWWQ
 shjjFoxJh2svRrFDR1dAZ7iRoeYjYEse11j5zvN9D+E41QGek1AD0L3vbn/HwMPXP2NyPgQNkTWC8
 vjhP64VkDomGVrOkoLZAuL4jYmxPGxVkqTVHygnb+NbSkBY9a0KDnYX6TbQVlAWaQTt4Xnm5YNmTW
 bRZqdSnA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjk-00000000T8J-29lc;
 Tue, 08 Jul 2025 17:04:08 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:46 +0100
Message-ID: <20250708170359.111653-50-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: All callers now have a folio so pass it in. Also remove the
 test for the private flag; it is redundant with checking folio->private for
 being NULL. Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
 --- fs/f2fs/compress.c | 14 ++++++-------- fs/f2fs/data.c | 10 +++++-----
 fs/f2fs/f2fs.h | 4 ++-- 3 files changed, 13 insertions(+), 15 del [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uZBjq-0006Ek-Vi
Subject: [f2fs-dev] [PATCH 49/60] f2fs: Pass a folio to
 f2fs_is_compressed_page()
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
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

All callers now have a folio so pass it in.  Also remove the test for
the private flag; it is redundant with checking folio->private for being
NULL.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/compress.c | 14 ++++++--------
 fs/f2fs/data.c     | 10 +++++-----
 fs/f2fs/f2fs.h     |  4 ++--
 3 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 5847d22a5833..24c7489b7427 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -71,17 +71,15 @@ static pgoff_t start_idx_of_cluster(struct compress_ctx *cc)
 	return cc->cluster_idx << cc->log_cluster_size;
 }
 
-bool f2fs_is_compressed_page(struct page *page)
+bool f2fs_is_compressed_page(struct folio *folio)
 {
-	if (!PagePrivate(page))
+	if (!folio->private)
 		return false;
-	if (!page_private(page))
-		return false;
-	if (page_private_nonpointer(page))
+	if (folio_test_f2fs_nonpointer(folio))
 		return false;
 
-	f2fs_bug_on(F2FS_P_SB(page),
-		*((u32 *)page_private(page)) != F2FS_COMPRESSED_PAGE_MAGIC);
+	f2fs_bug_on(F2FS_F_SB(folio),
+		*((u32 *)folio->private) != F2FS_COMPRESSED_PAGE_MAGIC);
 	return true;
 }
 
@@ -1478,7 +1476,7 @@ void f2fs_compress_write_end_io(struct bio *bio, struct folio *folio)
 	struct f2fs_sb_info *sbi = bio->bi_private;
 	struct compress_io_ctx *cic = folio->private;
 	enum count_type type = WB_DATA_TYPE(folio,
-				f2fs_is_compressed_page(page));
+				f2fs_is_compressed_page(folio));
 	int i;
 
 	if (unlikely(bio->bi_status != BLK_STS_OK))
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index cf2c146944bf..116482adf591 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -142,7 +142,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 	bio_for_each_folio_all(fi, bio) {
 		struct folio *folio = fi.folio;
 
-		if (f2fs_is_compressed_page(&folio->page)) {
+		if (f2fs_is_compressed_page(folio)) {
 			if (ctx && !ctx->decompression_attempted)
 				f2fs_end_read_compressed_page(folio, true, 0,
 							in_task);
@@ -186,7 +186,7 @@ static void f2fs_verify_bio(struct work_struct *work)
 		bio_for_each_folio_all(fi, bio) {
 			struct folio *folio = fi.folio;
 
-			if (!f2fs_is_compressed_page(&folio->page) &&
+			if (!f2fs_is_compressed_page(folio) &&
 			    !fsverity_verify_page(&folio->page)) {
 				bio->bi_status = BLK_STS_IOERR;
 				break;
@@ -239,7 +239,7 @@ static void f2fs_handle_step_decompress(struct bio_post_read_ctx *ctx,
 	bio_for_each_folio_all(fi, ctx->bio) {
 		struct folio *folio = fi.folio;
 
-		if (f2fs_is_compressed_page(&folio->page))
+		if (f2fs_is_compressed_page(folio))
 			f2fs_end_read_compressed_page(folio, false, blkaddr,
 						      in_task);
 		else
@@ -337,7 +337,7 @@ static void f2fs_write_end_io(struct bio *bio)
 		}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-		if (f2fs_is_compressed_page(&folio->page)) {
+		if (f2fs_is_compressed_page(folio)) {
 			f2fs_compress_write_end_io(bio, folio);
 			continue;
 		}
@@ -561,7 +561,7 @@ static bool __has_merged_page(struct bio *bio, struct inode *inode,
 			if (IS_ERR(target))
 				continue;
 		}
-		if (f2fs_is_compressed_page(&target->page)) {
+		if (f2fs_is_compressed_page(target)) {
 			target = f2fs_compress_control_folio(target);
 			if (IS_ERR(target))
 				continue;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 68535b917a3a..48b15e44a41c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4474,7 +4474,7 @@ enum cluster_check_type {
 	CLUSTER_COMPR_BLKS, /* return # of compressed blocks in a cluster */
 	CLUSTER_RAW_BLKS    /* return # of raw blocks in a cluster */
 };
-bool f2fs_is_compressed_page(struct page *page);
+bool f2fs_is_compressed_page(struct folio *folio);
 struct folio *f2fs_compress_control_folio(struct folio *folio);
 int f2fs_prepare_compress_overwrite(struct inode *inode,
 			struct page **pagep, pgoff_t index, void **fsdata);
@@ -4543,7 +4543,7 @@ void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t ino);
 		sbi->compr_saved_block += diff;				\
 	} while (0)
 #else
-static inline bool f2fs_is_compressed_page(struct page *page) { return false; }
+static inline bool f2fs_is_compressed_page(struct folio *folio) { return false; }
 static inline bool f2fs_is_compress_backend_ready(struct inode *inode)
 {
 	if (!f2fs_compressed_file(inode))
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
