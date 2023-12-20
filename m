Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DE581A079
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Dec 2023 15:00:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rFx7B-0008VJ-AN;
	Wed, 20 Dec 2023 14:00:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rFx78-0008VC-Eo
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Dec 2023 13:59:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xscjI8hRCqb0TVF/ZPOmL17Fu99hTNWTrn2y8jLUfpo=; b=KBVl7CSN/EE+Wi5GmKOCePYZR0
 zUBRKxiNoius2Inumq/35ElhR3lEXqKMJRVOaOUmvv/SMvQu7fOVyqSkt6FswNfqLJ/PAX3Kbfm6U
 YG97NjzYnYPDb63+pGpXjR1gNMlDKkHmo2UUj7lafqYg7co/uFqpkxjniseHfft+jX30=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xscjI8hRCqb0TVF/ZPOmL17Fu99hTNWTrn2y8jLUfpo=; b=f
 wAxpMUO4mr/+mfGirDpmYtykoLAHZuYm+H7pLilqoyiCJB3U/HtSQFlEzCqtegwlaTeio+Htkt3Mf
 GBjMUB8fPP+50szzBQCJjMXvhcwUWCwjcn+Iq7FzrwgLNhSovzZ+7V0NtFm+/73GVwA0pXpz7jY0O
 etErDV2LQtTuupx0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rFx73-0001Jm-QT for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Dec 2023 13:59:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 88FF9B81D6F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Dec 2023 13:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C1FAC433C9;
 Wed, 20 Dec 2023 13:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703080781;
 bh=1NoN4vHX+F5B0WJZK8QqQakY9pc1N432/Yr899L6umA=;
 h=From:To:Cc:Subject:Date:From;
 b=LsflaQn/Rpi1r63bTcKQzLAw6EfRwK9cBsHYh2in+KK6g6cuNWDLwdAppjiihuRPE
 DUh1q6tb8kH/p+aNjHZGtKNGSH47k8IPkYzKP1KYu9+0v6RJW9cTl6gIw36PkVv7lw
 VcsmWYBHfZG++2ANDm7PwM6g65zOvG4hJTdrQnghgTb9b4WYEfLk3Qu0OhvwA43clV
 Av9IjNnnAYkKuVB9Mrhv/RPZ1MisWBUU3Mqe2X18y/hrGur6vgPHhJLLSAqG4yf/fk
 mAlr/bWMlcn5tyW61vmyqOfPqRrpT4HS2QuDhkI1ZzpaIhtg/qFQ/3qogGw6ItMCVg
 QFUKONcK8dPLA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 20 Dec 2023 21:59:29 +0800
Message-Id: <20231220135934.3471407-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -2.6 (--)
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
 | 3 ++- fs/f2fs/data.c | 12 +++++++++--- fs/f2fs/f2fs.h | 3 ++- 3 files
 changed, [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rFx73-0001Jm-QT
Subject: [f2fs-dev] [PATCH 1/6] f2fs: compress: fix to guarantee persisting
 compressed blocks by CP
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
 fs/f2fs/compress.c |  3 ++-
 fs/f2fs/data.c     | 12 +++++++++---
 fs/f2fs/f2fs.h     |  3 ++-
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 5b076329e9bf..1122db8cc0b0 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1442,6 +1442,7 @@ void f2fs_compress_write_end_io(struct bio *bio, struct page *page)
 	struct f2fs_sb_info *sbi = bio->bi_private;
 	struct compress_io_ctx *cic =
 			(struct compress_io_ctx *)page_private(page);
+	enum count_type type = WB_DATA_TYPE(page);
 	int i;
 
 	if (unlikely(bio->bi_status))
@@ -1449,7 +1450,7 @@ void f2fs_compress_write_end_io(struct bio *bio, struct page *page)
 
 	f2fs_compress_free_page(page);
 
-	dec_page_count(sbi, F2FS_WB_DATA);
+	dec_page_count(sbi, type);
 
 	if (atomic_dec_return(&cic->pending_pages))
 		return;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d28c97282e68..6c72a6e86ba8 100644
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
@@ -66,7 +66,7 @@ static bool __is_cp_guaranteed(struct page *page)
 		return true;
 
 	if (f2fs_is_compressed_page(page))
-		return false;
+		return true;
 	if ((S_ISREG(inode->i_mode) && IS_NOQUOTA(inode)) ||
 			page_private_gcing(page))
 		return true;
@@ -1007,6 +1007,7 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	enum page_type btype = PAGE_TYPE_OF_BIO(fio->type);
 	struct f2fs_bio_info *io = sbi->write_io[btype] + fio->temp;
 	struct page *bio_page;
+	enum count_type type;
 
 	f2fs_bug_on(sbi, is_read_io(fio->op));
 
@@ -1046,7 +1047,12 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	/* set submitted = true as a return value */
 	fio->submitted = 1;
 
-	inc_page_count(sbi, WB_DATA_TYPE(bio_page));
+	type = WB_DATA_TYPE(bio_page);
+	/* override count type if page is compressed one */
+	if (fio->compressed_page)
+		type = WB_DATA_TYPE(fio->compressed_page);
+
+	inc_page_count(sbi, type);
 
 	if (io->bio &&
 	    (!io_is_mergeable(sbi, io->bio, io, fio, io->last_block_in_bio,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 76e9a8682e38..bcb3940ab5ba 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1092,7 +1092,7 @@ struct f2fs_sm_info {
  * f2fs monitors the number of several block types such as on-writeback,
  * dirty dentry blocks, dirty node blocks, and dirty meta blocks.
  */
-#define WB_DATA_TYPE(p)	(__is_cp_guaranteed(p) ? F2FS_WB_CP_DATA : F2FS_WB_DATA)
+#define WB_DATA_TYPE(p)	(f2fs_is_cp_guaranteed(p) ? F2FS_WB_CP_DATA : F2FS_WB_DATA)
 enum count_type {
 	F2FS_DIRTY_DENTS,
 	F2FS_DIRTY_DATA,
@@ -3824,6 +3824,7 @@ void f2fs_init_ckpt_req_control(struct f2fs_sb_info *sbi);
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
