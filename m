Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AF782A7B6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jan 2024 07:42:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rNolv-0004mm-6S;
	Thu, 11 Jan 2024 06:42:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rNols-0004mN-Cr
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 06:42:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mYVkXF1DWcidr/AabRCInisRL43WQBNA/bKEEAIuf+8=; b=JjoMOWngnz9bzsdGbqDS5nqCIm
 yNMOFEMODQNgwsF3KIfyzLEUBbXzG7bGSA+SBxoU6CFoGzkkdutWBNLEfDqaq0YK/1wFxESEUdF8w
 z2OCuqlhuxor0xn80i7RNgrQaf77fLsbxxn7iMqUowuAmokzb/DxE7KBRNrhRW1xX06c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mYVkXF1DWcidr/AabRCInisRL43WQBNA/bKEEAIuf+8=; b=R
 GOhcbITnX0BR+SjFPDdcminGTupUcQ9a7d6w8gc4auERPc1nAvdsR1yJ7erth2SwoFyd80Hk56uV2
 W/nzouqL+BMYKd00I+OlOj4GjiAPVEe1CYoodfnPENGTz5R2K6izYYcSgc/UuxD5TGwkGUs+xP0I+
 SkIFMV6nLRbp/mdw=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rNolm-00078W-GH for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 06:42:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C6940B81ECA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Jan 2024 06:42:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0096C433F1;
 Thu, 11 Jan 2024 06:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704955335;
 bh=oZuzDV9vCkL88UX/UxwReq5BdTIrwPqe8fsiqxAln1Y=;
 h=From:To:Cc:Subject:Date:From;
 b=EZELZ3sxNIieKHBWyJdtLZ/BIU6aMrUpYgMP+CpO7N5Km6FY11u5f80NaGW0sstXJ
 gclLpVP6ZLrV52w0JOWgmQMLaFuG4U2A+x988e64MvwpBp2rd+zCbLt8rERR9zrGSx
 W317DTFzUylw16jMFWnqHa6eKoCHTqP9Nco6pbjEn2jxenelz05K7sBEr7i+9SYhOk
 u1aJCeH8nA3kZ5wO1+u4vCByPbWwLfIgPrkzNpzfofAUqF47iwYOd6CMEjt1rmHdpP
 p0GqLm+IqdKGPivRuFOgkZvCKni/+EZE5myxTniB1sAFWFlBZuLdfpXdzoaSQs/2Rp
 NCWsSLE6hG7kQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 11 Jan 2024 14:42:03 +0800
Message-Id: <20240111064208.2969599-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -4.3 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If data block in compressed cluster is not persisted with
 metadata during checkpoint, after SPOR, the data may be corrupted,
 let's guarantee
 to write compressed page by checkpoint. Fixes: 4c8ff7095bef ("f2fs: support
 data compression") Signed-off-by: Chao Yu <chao@kernel.org> ---
 fs/f2fs/compress.c
 | 4 +++- fs/f2fs/data.c | 17 +++++++++-------- fs/f2fs/f2fs.h | 4 +++- 3
 files ch [...] 
 Content analysis details:   (-4.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rNolm-00078W-GH
Subject: [f2fs-dev] [PATCH v4 1/6] f2fs: compress: fix to guarantee
 persisting compressed blocks by CP
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If data block in compressed cluster is not persisted with metadata
during checkpoint, after SPOR, the data may be corrupted, let's
guarantee to write compressed page by checkpoint.

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c |  4 +++-
 fs/f2fs/data.c     | 17 +++++++++--------
 fs/f2fs/f2fs.h     |  4 +++-
 3 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index c5a4364c4482..9940b7886e5d 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1418,6 +1418,8 @@ void f2fs_compress_write_end_io(struct bio *bio, struct page *page)
 	struct f2fs_sb_info *sbi = bio->bi_private;
 	struct compress_io_ctx *cic =
 			(struct compress_io_ctx *)page_private(page);
+	enum count_type type = WB_DATA_TYPE(page,
+				f2fs_is_compressed_page(page));
 	int i;
 
 	if (unlikely(bio->bi_status))
@@ -1425,7 +1427,7 @@ void f2fs_compress_write_end_io(struct bio *bio, struct page *page)
 
 	f2fs_compress_free_page(page);
 
-	dec_page_count(sbi, F2FS_WB_DATA);
+	dec_page_count(sbi, type);
 
 	if (atomic_dec_return(&cic->pending_pages))
 		return;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index dce8defdf4c7..81f9e2cc49e2 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -48,7 +48,7 @@ void f2fs_destroy_bioset(void)
 	bioset_exit(&f2fs_bioset);
 }
 
-static bool __is_cp_guaranteed(struct page *page)
+bool f2fs_is_cp_guaranteed(struct page *page)
 {
 	struct address_space *mapping = page->mapping;
 	struct inode *inode;
@@ -65,8 +65,6 @@ static bool __is_cp_guaranteed(struct page *page)
 			S_ISDIR(inode->i_mode))
 		return true;
 
-	if (f2fs_is_compressed_page(page))
-		return false;
 	if ((S_ISREG(inode->i_mode) && IS_NOQUOTA(inode)) ||
 			page_private_gcing(page))
 		return true;
@@ -338,7 +336,7 @@ static void f2fs_write_end_io(struct bio *bio)
 
 	bio_for_each_segment_all(bvec, bio, iter_all) {
 		struct page *page = bvec->bv_page;
-		enum count_type type = WB_DATA_TYPE(page);
+		enum count_type type = WB_DATA_TYPE(page, false);
 
 		if (page_private_dummy(page)) {
 			clear_page_private_dummy(page);
@@ -762,7 +760,7 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 		wbc_account_cgroup_owner(fio->io_wbc, fio->page, PAGE_SIZE);
 
 	inc_page_count(fio->sbi, is_read_io(fio->op) ?
-			__read_io_type(page) : WB_DATA_TYPE(fio->page));
+			__read_io_type(page) : WB_DATA_TYPE(fio->page, false));
 
 	if (is_read_io(bio_op(bio)))
 		f2fs_submit_read_bio(fio->sbi, bio, fio->type);
@@ -973,7 +971,7 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 	if (fio->io_wbc)
 		wbc_account_cgroup_owner(fio->io_wbc, fio->page, PAGE_SIZE);
 
-	inc_page_count(fio->sbi, WB_DATA_TYPE(page));
+	inc_page_count(fio->sbi, WB_DATA_TYPE(page, false));
 
 	*fio->last_block = fio->new_blkaddr;
 	*fio->bio = bio;
@@ -1007,6 +1005,7 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	enum page_type btype = PAGE_TYPE_OF_BIO(fio->type);
 	struct f2fs_bio_info *io = sbi->write_io[btype] + fio->temp;
 	struct page *bio_page;
+	enum count_type type;
 
 	f2fs_bug_on(sbi, is_read_io(fio->op));
 
@@ -1046,7 +1045,8 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	/* set submitted = true as a return value */
 	fio->submitted = 1;
 
-	inc_page_count(sbi, WB_DATA_TYPE(bio_page));
+	type = WB_DATA_TYPE(bio_page, fio->compressed_page);
+	inc_page_count(sbi, type);
 
 	if (io->bio &&
 	    (!io_is_mergeable(sbi, io->bio, io, fio, io->last_block_in_bio,
@@ -1059,7 +1059,8 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 		if (F2FS_IO_ALIGNED(sbi) &&
 				(fio->type == DATA || fio->type == NODE) &&
 				fio->new_blkaddr & F2FS_IO_SIZE_MASK(sbi)) {
-			dec_page_count(sbi, WB_DATA_TYPE(bio_page));
+			dec_page_count(sbi, WB_DATA_TYPE(bio_page,
+						fio->compressed_page));
 			fio->retry = 1;
 			goto skip;
 		}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 65294e3b0bef..50f3d546ded8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1080,7 +1080,8 @@ struct f2fs_sm_info {
  * f2fs monitors the number of several block types such as on-writeback,
  * dirty dentry blocks, dirty node blocks, and dirty meta blocks.
  */
-#define WB_DATA_TYPE(p)	(__is_cp_guaranteed(p) ? F2FS_WB_CP_DATA : F2FS_WB_DATA)
+#define WB_DATA_TYPE(p, f)			\
+	(f || f2fs_is_cp_guaranteed(p) ? F2FS_WB_CP_DATA : F2FS_WB_DATA)
 enum count_type {
 	F2FS_DIRTY_DENTS,
 	F2FS_DIRTY_DATA,
@@ -3804,6 +3805,7 @@ void f2fs_init_ckpt_req_control(struct f2fs_sb_info *sbi);
  */
 int __init f2fs_init_bioset(void);
 void f2fs_destroy_bioset(void);
+bool f2fs_is_cp_guaranteed(struct page *page);
 int f2fs_init_bio_entry_cache(void);
 void f2fs_destroy_bio_entry_cache(void);
 void f2fs_submit_read_bio(struct f2fs_sb_info *sbi, struct bio *bio,
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
