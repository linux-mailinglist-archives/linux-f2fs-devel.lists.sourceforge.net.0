Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAA8958A47
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Aug 2024 16:55:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sgQGt-000830-IL;
	Tue, 20 Aug 2024 14:55:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sgQGr-00082f-Qx
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Aug 2024 14:55:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h+943LVu/+8yhC2SFSEVrRdRoqjPDtyjWdl+009oEDo=; b=HYBNdO+JLzKd9SelM7GGqiJQ4c
 hoL0Sp8XilSfhGFBSpuJOAK35oN6R2UdlrrVaMmZyH+MctOyplXGYBxJG/y65Wg106kBfF08SQlpO
 9dcpHQn2Cqb/3nxMU1QmmrFLTxdXb3Lk75i6k5s3GpctsxTBBKtuIzd3ExYzvgQhx/ic=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h+943LVu/+8yhC2SFSEVrRdRoqjPDtyjWdl+009oEDo=; b=UDd3tI9nN1tSD/+NeglOokhMvF
 h9IVCDIFC/Q3MwY1blnH9yIV8Jwiij/8cMt+prtvNad4VcwG6iMM4rxS3D2BZAGsMu/UCFU7tM4Qb
 WDVEPvWqzewYWKrH/USVxlJIeG3JbCLS0JjVWxK0vhWiLTVTwLeS0VNaS6r0hsARtTqg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sgQGr-0003Jb-N2 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Aug 2024 14:55:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5939E60C5C;
 Tue, 20 Aug 2024 14:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDAD9C4AF10;
 Tue, 20 Aug 2024 14:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724165731;
 bh=8r7Ek2cBap+An9MVHAkEPVDijkmUphd6VWrszUU4RwQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YblJ49JXdWtBgNfQzuHRbk01AICOtNqo7vwGAIbemBa+ZNY4/To8eX+2gmWi9X1Ic
 9TPbig+UDeMQFg7r4BkwfGITb200seu+riycoGcZdoB2dyfVIJY79h29F07eKz3+i5
 KymuMWTHAWX592a6KTccgYtbmbUzrDaoCl60PRQfX8eEOVsWFSd8MsWPfzsgwxxhYe
 4lVBAUQQrTzORONaVz3x0X8K9glpIxykNK5wneYoikqYf/xTQZB8EJvHmjW6l1bfGi
 qnee833yN/LoNW0xMJCwFEY97+Q6mw59TeOFSAH33soob10W8/60z5zP6gtYCMn2C2
 W8M8LrbfpJ2+A==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 20 Aug 2024 22:55:07 +0800
Message-Id: <20240820145507.1372905-9-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240820145507.1372905-1-chao@kernel.org>
References: <20240820145507.1372905-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert to use folio, so that we can get rid of 'page->index'
 to prepare for removal of 'index' field in structure page [1]. [1]
 https://lore.kernel.org/all/Zp8fgUSIBGQ1TN0D@casper.infradead.org/
 Cc: Matthew Wilcox <willy@infradead.org> Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/compress.c | 2 +- fs/f2fs/data.c | 12 ++++++------ fs/f2fs/dir.c
 | 3 ++- fs/f2fs/inode.c | 3 ++- fs/f2fs/n [...] 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sgQGr-0003Jb-N2
Subject: [f2fs-dev] [PATCH v3 9/9] f2fs: get rid of page->index
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
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert to use folio, so that we can get rid of 'page->index' to
prepare for removal of 'index' field in structure page [1].

[1] https://lore.kernel.org/all/Zp8fgUSIBGQ1TN0D@casper.infradead.org/

Cc: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c |  2 +-
 fs/f2fs/data.c     | 12 ++++++------
 fs/f2fs/dir.c      |  3 ++-
 fs/f2fs/inode.c    |  3 ++-
 fs/f2fs/node.c     |  4 ++--
 fs/f2fs/segment.c  |  3 ++-
 6 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 67bb1e2e07a4..163ad0d7d495 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -881,7 +881,7 @@ static bool cluster_has_invalid_data(struct compress_ctx *cc)
 		f2fs_bug_on(F2FS_I_SB(cc->inode), !page);
 
 		/* beyond EOF */
-		if (page->index >= nr_pages)
+		if (page_folio(page)->index >= nr_pages)
 			return true;
 	}
 	return false;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index e69097267b99..c6d688208f8b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -354,7 +354,7 @@ static void f2fs_write_end_io(struct bio *bio)
 		}
 
 		f2fs_bug_on(sbi, page->mapping == NODE_MAPPING(sbi) &&
-					page->index != nid_of_node(page));
+				page_folio(page)->index != nid_of_node(page));
 
 		dec_page_count(sbi, type);
 		if (f2fs_in_warm_node_list(sbi, page))
@@ -703,7 +703,7 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 	bio = __bio_alloc(fio, 1);
 
 	f2fs_set_bio_crypt_ctx(bio, fio->page->mapping->host,
-			       fio->page->index, fio, GFP_NOIO);
+			page_folio(fio->page)->index, fio, GFP_NOIO);
 
 	if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE) {
 		bio_put(bio);
@@ -802,7 +802,7 @@ static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
 							    fio->new_blkaddr));
 			if (f2fs_crypt_mergeable_bio(*bio,
 					fio->page->mapping->host,
-					fio->page->index, fio) &&
+					page_folio(fio->page)->index, fio) &&
 			    bio_add_page(*bio, page, PAGE_SIZE, 0) ==
 					PAGE_SIZE) {
 				ret = 0;
@@ -902,7 +902,7 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 	if (!bio) {
 		bio = __bio_alloc(fio, BIO_MAX_VECS);
 		f2fs_set_bio_crypt_ctx(bio, fio->page->mapping->host,
-				       fio->page->index, fio, GFP_NOIO);
+				page_folio(fio->page)->index, fio, GFP_NOIO);
 
 		add_bio_entry(fio->sbi, bio, page, fio->temp);
 	} else {
@@ -995,13 +995,13 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	    (!io_is_mergeable(sbi, io->bio, io, fio, io->last_block_in_bio,
 			      fio->new_blkaddr) ||
 	     !f2fs_crypt_mergeable_bio(io->bio, fio->page->mapping->host,
-				       bio_page->index, fio)))
+				page_folio(bio_page)->index, fio)))
 		__submit_merged_bio(io);
 alloc_new:
 	if (io->bio == NULL) {
 		io->bio = __bio_alloc(fio, BIO_MAX_VECS);
 		f2fs_set_bio_crypt_ctx(io->bio, fio->page->mapping->host,
-				       bio_page->index, fio, GFP_NOIO);
+				page_folio(bio_page)->index, fio, GFP_NOIO);
 		io->fio = *fio;
 	}
 
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 5fcc952107e9..1136539a57a8 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -842,6 +842,7 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry, struct page *page,
 	struct	f2fs_dentry_block *dentry_blk;
 	unsigned int bit_pos;
 	int slots = GET_DENTRY_SLOTS(le16_to_cpu(dentry->name_len));
+	pgoff_t index = page_folio(page)->index;
 	int i;
 
 	f2fs_update_time(F2FS_I_SB(dir), REQ_TIME);
@@ -867,7 +868,7 @@ void f2fs_delete_entry(struct f2fs_dir_entry *dentry, struct page *page,
 	set_page_dirty(page);
 
 	if (bit_pos == NR_DENTRY_IN_BLOCK &&
-		!f2fs_truncate_hole(dir, page->index, page->index + 1)) {
+		!f2fs_truncate_hole(dir, index, index + 1)) {
 		f2fs_clear_page_cache_dirty_tag(page_folio(page));
 		clear_page_dirty_for_io(page);
 		ClearPageUptodate(page);
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 5d7e4c7f5969..b2d5c3ef8e24 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -174,7 +174,8 @@ bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct page *page)
 
 	if (provided != calculated)
 		f2fs_warn(sbi, "checksum invalid, nid = %lu, ino_of_node = %x, %x vs. %x",
-			  page->index, ino_of_node(page), provided, calculated);
+			  page_folio(page)->index, ino_of_node(page),
+			  provided, calculated);
 
 	return provided == calculated;
 }
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index f5e5abce695b..59b13ff243fa 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -919,7 +919,7 @@ static int truncate_node(struct dnode_of_data *dn)
 	clear_node_page_dirty(dn->node_page);
 	set_sbi_flag(sbi, SBI_IS_DIRTY);
 
-	index = dn->node_page->index;
+	index = page_folio(dn->node_page)->index;
 	f2fs_put_page(dn->node_page, 1);
 
 	invalidate_mapping_pages(NODE_MAPPING(sbi),
@@ -1869,7 +1869,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 	}
 	if (!ret && atomic && !marked) {
 		f2fs_debug(sbi, "Retry to write fsync mark: ino=%u, idx=%lx",
-			   ino, last_page->index);
+			   ino, page_folio(last_page)->index);
 		lock_page(last_page);
 		f2fs_wait_on_page_writeback(last_page, NODE, true, true);
 		set_page_dirty(last_page);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 3bda3f707007..fafbb1cbcb57 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3564,7 +3564,8 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
 		if (file_is_cold(inode) || f2fs_need_compress_data(inode))
 			return CURSEG_COLD_DATA;
 
-		type = __get_age_segment_type(inode, fio->page->index);
+		type = __get_age_segment_type(inode,
+				page_folio(fio->page)->index);
 		if (type != NO_CHECK_TYPE)
 			return type;
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
