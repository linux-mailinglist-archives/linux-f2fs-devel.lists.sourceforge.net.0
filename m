Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B8D63A48D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 10:16:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozaFJ-00015c-MM;
	Mon, 28 Nov 2022 09:16:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+7f5f7765a4bd65a1d96c+7036+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1ozaEs-00014R-CD for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:15:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fz4XUm8Gpet76IEyx5pGA/n6wyglHi00VLmfS69IaCQ=; b=dUuQJ68ggKVfyycPKiImaRn4kK
 V4PLiqt1xE+B0353ONfVFtiacl5Uez3UuBQBr8VK7qqZRZGcw9NzWpFt98fa5M4146ds5ejaCPq2/
 hYJ4pQYUxOxNY0lHYKiayXyOMSK8zR7ZBe8s8t4sEgpy0tH4ARQIHfDuAdg4cPSJkUFQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Fz4XUm8Gpet76IEyx5pGA/n6wyglHi00VLmfS69IaCQ=; b=YRe4LflCcNjYyYP6LO6nOMUkKn
 6sFqW4LolzHlGI65R10kThm5GPea6J30urPZR9Rlj3gzyMRJxG8rl9z9tZdARaZdGhb6ZEq6QyE4Y
 HjZsEvIp0QZ7qUTlbh7O6fdmr71tzqna9OtvFPT73qJd/WghzB6Hx9LW3UKzet7zcq9g=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ozaEq-00GRQp-Cw for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:15:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Fz4XUm8Gpet76IEyx5pGA/n6wyglHi00VLmfS69IaCQ=; b=EJijb+oJgUt0FhWUoQ5SNmXrpE
 4FA6FvqXqakg/yY+4Askr52/Xas+kYWKaPPWjMLtJwtC4q8SStyew2v4qWtRtZ6YMbT2LDs1hV0Tt
 DysYJmIpGTEUlGAE9dwlm3n0Uz50wPzvscMcXfV4j3Z8D/aVXDh2tLuFfzshqdPqqsstthHkIV1EO
 uu8Ozq8z+oVJI/bCamMzGcBklh1PBqL5D13+mAR8Q9B0zByAS6szJMQMnHyEci7eeCgNjMwlp7M+7
 qW/4XY3aSQQuvxyiWIGAsbCJXukgP1a9tpKz53f4/9Wfb255218VcAYJnrVzekaHhZiChXWgRSHQH
 aGMHNVaw==;
Received: from [2001:4bb8:192:26e7:4739:fc09:43a5:2665] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ozaEk-000Yp0-7N; Mon, 28 Nov 2022 09:15:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 28 Nov 2022 10:15:12 +0100
Message-Id: <20221128091523.1242584-5-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221128091523.1242584-1-hch@lst.de>
References: <20221128091523.1242584-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Split __submit_bio into one function each for reads and
 writes, 
 and a helper for aligning writes. Signed-off-by: Christoph Hellwig
 <hch@lst.de>
 --- fs/f2fs/compress.c | 2 +- fs/f2fs/data.c | 111 +++++++++++++++++++++++
 fs/f2fs/f2fs.h | 4 +- 3 files changed, 61 insertions(+), [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1ozaEq-00GRQp-Cw
Subject: [f2fs-dev] [PATCH 04/15] f2fs: split __submit_bio
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Split __submit_bio into one function each for reads and writes, and a
helper for aligning writes.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/compress.c |   2 +-
 fs/f2fs/data.c     | 111 +++++++++++++++++++++++----------------------
 fs/f2fs/f2fs.h     |   4 +-
 3 files changed, 61 insertions(+), 56 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index d315c2de136f26..355200b6dad774 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1073,7 +1073,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 		if (ret)
 			goto out;
 		if (bio)
-			f2fs_submit_bio(sbi, bio, DATA);
+			f2fs_submit_read_bio(sbi, bio, DATA);
 
 		ret = f2fs_init_compress_ctx(cc);
 		if (ret)
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 444865e0cb6397..404e1637e31072 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -492,65 +492,66 @@ static bool f2fs_crypt_mergeable_bio(struct bio *bio, const struct inode *inode,
 	return fscrypt_mergeable_bio(bio, inode, next_idx);
 }
 
-static inline void __submit_bio(struct f2fs_sb_info *sbi,
-				struct bio *bio, enum page_type type)
+void f2fs_submit_read_bio(struct f2fs_sb_info *sbi, struct bio *bio,
+				 enum page_type type)
 {
-	if (!is_read_io(bio_op(bio))) {
-		unsigned int start;
+	WARN_ON_ONCE(!is_read_io(bio_op(bio)));
+	trace_f2fs_submit_read_bio(sbi->sb, type, bio);
 
-		if (type != DATA && type != NODE)
-			goto submit_io;
+	iostat_update_submit_ctx(bio, type);
+	submit_bio(bio);
+}
 
-		if (f2fs_lfs_mode(sbi) && current->plug)
-			blk_finish_plug(current->plug);
+static void f2fs_align_write_bio(struct f2fs_sb_info *sbi, struct bio *bio)
+{
+	unsigned int start =
+		(bio->bi_iter.bi_size >> F2FS_BLKSIZE_BITS) % F2FS_IO_SIZE(sbi);
 
-		if (!F2FS_IO_ALIGNED(sbi))
-			goto submit_io;
+	if (start == 0)
+		return;
 
-		start = bio->bi_iter.bi_size >> F2FS_BLKSIZE_BITS;
-		start %= F2FS_IO_SIZE(sbi);
+	/* fill dummy pages */
+	for (; start < F2FS_IO_SIZE(sbi); start++) {
+		struct page *page =
+			mempool_alloc(sbi->write_io_dummy,
+				      GFP_NOIO | __GFP_NOFAIL);
+		f2fs_bug_on(sbi, !page);
 
-		if (start == 0)
-			goto submit_io;
+		lock_page(page);
 
-		/* fill dummy pages */
-		for (; start < F2FS_IO_SIZE(sbi); start++) {
-			struct page *page =
-				mempool_alloc(sbi->write_io_dummy,
-					      GFP_NOIO | __GFP_NOFAIL);
-			f2fs_bug_on(sbi, !page);
+		zero_user_segment(page, 0, PAGE_SIZE);
+		set_page_private_dummy(page);
 
-			lock_page(page);
+		if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE)
+			f2fs_bug_on(sbi, 1);
+	}
+}
 
-			zero_user_segment(page, 0, PAGE_SIZE);
-			set_page_private_dummy(page);
+static void f2fs_submit_write_bio(struct f2fs_sb_info *sbi, struct bio *bio,
+				  enum page_type type)
+{
+	WARN_ON_ONCE(is_read_io(bio_op(bio)));
+
+	if (type == DATA || type == NODE) {
+		if (f2fs_lfs_mode(sbi) && current->plug)
+			blk_finish_plug(current->plug);
 
-			if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE)
-				f2fs_bug_on(sbi, 1);
+		if (F2FS_IO_ALIGNED(sbi)) {
+			f2fs_align_write_bio(sbi, bio);
+			/*
+			 * In the NODE case, we lose next block address chain.
+			 * So, we need to do checkpoint in f2fs_sync_file.
+			 */
+			if (type == NODE)
+				set_sbi_flag(sbi, SBI_NEED_CP);
 		}
-		/*
-		 * In the NODE case, we lose next block address chain. So, we
-		 * need to do checkpoint in f2fs_sync_file.
-		 */
-		if (type == NODE)
-			set_sbi_flag(sbi, SBI_NEED_CP);
 	}
-submit_io:
-	if (is_read_io(bio_op(bio)))
-		trace_f2fs_submit_read_bio(sbi->sb, type, bio);
-	else
-		trace_f2fs_submit_write_bio(sbi->sb, type, bio);
 
+	trace_f2fs_submit_write_bio(sbi->sb, type, bio);
 	iostat_update_submit_ctx(bio, type);
 	submit_bio(bio);
 }
 
-void f2fs_submit_bio(struct f2fs_sb_info *sbi,
-				struct bio *bio, enum page_type type)
-{
-	__submit_bio(sbi, bio, type);
-}
-
 static void __submit_merged_bio(struct f2fs_bio_info *io)
 {
 	struct f2fs_io_info *fio = &io->fio;
@@ -558,12 +559,13 @@ static void __submit_merged_bio(struct f2fs_bio_info *io)
 	if (!io->bio)
 		return;
 
-	if (is_read_io(fio->op))
+	if (is_read_io(fio->op)) {
 		trace_f2fs_prepare_read_bio(io->sbi->sb, fio->type, io->bio);
-	else
+		f2fs_submit_read_bio(io->sbi, io->bio, fio->type);
+	} else {
 		trace_f2fs_prepare_write_bio(io->sbi->sb, fio->type, io->bio);
-
-	__submit_bio(io->sbi, io->bio, fio->type);
+		f2fs_submit_write_bio(io->sbi, io->bio, fio->type);
+	}
 	io->bio = NULL;
 }
 
@@ -731,7 +733,10 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 	inc_page_count(fio->sbi, is_read_io(fio->op) ?
 			__read_io_type(page) : WB_DATA_TYPE(fio->page));
 
-	__submit_bio(fio->sbi, bio, fio->type);
+	if (is_read_io(bio_op(bio)))
+		f2fs_submit_read_bio(fio->sbi, bio, fio->type);
+	else
+		f2fs_submit_write_bio(fio->sbi, bio, fio->type);
 	return 0;
 }
 
@@ -833,7 +838,7 @@ static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
 
 			/* page can't be merged into bio; submit the bio */
 			del_bio_entry(be);
-			__submit_bio(sbi, *bio, DATA);
+			f2fs_submit_write_bio(sbi, *bio, DATA);
 			break;
 		}
 		f2fs_up_write(&io->bio_list_lock);
@@ -896,7 +901,7 @@ void f2fs_submit_merged_ipu_write(struct f2fs_sb_info *sbi,
 	}
 
 	if (found)
-		__submit_bio(sbi, target, DATA);
+		f2fs_submit_write_bio(sbi, target, DATA);
 	if (bio && *bio) {
 		bio_put(*bio);
 		*bio = NULL;
@@ -1092,7 +1097,7 @@ static int f2fs_submit_page_read(struct inode *inode, struct page *page,
 	ClearPageError(page);
 	inc_page_count(sbi, F2FS_RD_DATA);
 	f2fs_update_iostat(sbi, NULL, FS_DATA_READ_IO, F2FS_BLKSIZE);
-	__submit_bio(sbi, bio, DATA);
+	f2fs_submit_read_bio(sbi, bio, DATA);
 	return 0;
 }
 
@@ -2115,7 +2120,7 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 				       *last_block_in_bio, block_nr) ||
 		    !f2fs_crypt_mergeable_bio(bio, inode, page->index, NULL))) {
 submit_and_realloc:
-		__submit_bio(F2FS_I_SB(inode), bio, DATA);
+		f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
 		bio = NULL;
 	}
 	if (bio == NULL) {
@@ -2263,7 +2268,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 					*last_block_in_bio, blkaddr) ||
 		    !f2fs_crypt_mergeable_bio(bio, inode, page->index, NULL))) {
 submit_and_realloc:
-			__submit_bio(sbi, bio, DATA);
+			f2fs_submit_read_bio(sbi, bio, DATA);
 			bio = NULL;
 		}
 
@@ -2427,7 +2432,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
 #endif
 	}
 	if (bio)
-		__submit_bio(F2FS_I_SB(inode), bio, DATA);
+		f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
 	return ret;
 }
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 709bfd1c7c409e..9825b4fb2aa27d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3771,8 +3771,8 @@ int __init f2fs_init_bioset(void);
 void f2fs_destroy_bioset(void);
 int f2fs_init_bio_entry_cache(void);
 void f2fs_destroy_bio_entry_cache(void);
-void f2fs_submit_bio(struct f2fs_sb_info *sbi,
-				struct bio *bio, enum page_type type);
+void f2fs_submit_read_bio(struct f2fs_sb_info *sbi, struct bio *bio,
+			  enum page_type type);
 int f2fs_init_write_merge_io(struct f2fs_sb_info *sbi);
 void f2fs_submit_merged_write(struct f2fs_sb_info *sbi, enum page_type type);
 void f2fs_submit_merged_write_cond(struct f2fs_sb_info *sbi,
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
