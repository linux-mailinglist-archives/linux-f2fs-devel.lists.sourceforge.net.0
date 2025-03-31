Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE02A76E1E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVV-0000sW-Ov;
	Mon, 31 Mar 2025 20:13:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVQ-0000rq-QZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lMNCSDGdR7yC0nvAA9jWv2sr7LfDSHEenHyWKowtrq0=; b=E3NGgMQ75WsKigPebQU88cDvaT
 YQJM/82NX5cCUwiOe81BxM6wwnZZddSe/h7QfXRED7XbAPtuTzYAdJN+UtM0P5UpGh0NndyXgU+1J
 QR4KgMUQu5SY6Vkrj2WyFHFpR5syl4peQ7ZL8wKOMhTjpQwvWI7rtBS5dI/1cQnFY74M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lMNCSDGdR7yC0nvAA9jWv2sr7LfDSHEenHyWKowtrq0=; b=aU49DvFN46bqLcM6kZRpXAQQr7
 9HxU3pgvDK1d/QUVLKNAKheaGqVaJtT9FPsWmYajb7DPEU1S8yJ0ATBl2Vz1TVVrtoLYH6PvgmgRY
 bTMy1N9ge+28o9HRpElib7C5SuPGMTv8PR9nTY3XShRRHGeXGktKpiPzHfSUf2iTDcP4=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVQ-0003Yh-Si for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=lMNCSDGdR7yC0nvAA9jWv2sr7LfDSHEenHyWKowtrq0=; b=qBqpSkckslp5WUCqhlFXAbjQO8
 qkv3th3JKKH6P++qx6u7EP6qMMPTt7zbz+npyueYwwYhv450bPV20FnI1rQsQogpxh9DDL43Pb7K4
 GMoW6U6If3nhAW8pu0uiHysC1m3p8qIKTym/AI1xVCqBqcSLvdj0AqsQL9Ygay0PbFz5o9LiyUnPO
 pwKpuIEM3vmBV4aOYOYJgjnVozTz8X4wiu7/d3GshMrc8tlX3/C4UtjDJ7bEltzxEC8AFKfpjVPHd
 oEYXcHBp92cxwRa+Y2cOwZ+ZbdvRmVwSgewgEd8HDIcwPOIXYyJeVCpkFc7TnQ6vAitzGD06vuhMf
 Iu6jehXA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVF-00000004RTx-21tM;
 Mon, 31 Mar 2025 20:13:01 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:23 +0100
Message-ID: <20250331201256.1057782-4-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This helper returns the inode associated with the
 f2fs_io_info.
 That's a relatively common thing to want, mildly awkward to get and provides
 one place to change if we decide to record it directly, or [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVQ-0003Yh-Si
Subject: [f2fs-dev] [PATCH 003/153] f2fs: Introduce fio_inode()
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

This helper returns the inode associated with the f2fs_io_info.  That's a
relatively common thing to want, mildly awkward to get and provides one
place to change if we decide to record it directly, or change fio->page
to fio->folio.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c    | 9 +++++----
 fs/f2fs/f2fs.h    | 5 +++++
 fs/f2fs/segment.c | 6 +++---
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 54f89f0ee69b..597d1e82cb55 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -946,6 +946,7 @@ static bool is_end_zone_blkaddr(struct f2fs_sb_info *sbi, block_t blkaddr)
 
 void f2fs_submit_page_write(struct f2fs_io_info *fio)
 {
+	struct inode *inode = fio_inode(fio);
 	struct f2fs_sb_info *sbi = fio->sbi;
 	enum page_type btype = PAGE_TYPE_OF_BIO(fio->type);
 	struct f2fs_bio_info *io = sbi->write_io[btype] + fio->temp;
@@ -995,13 +996,13 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	if (io->bio &&
 	    (!io_is_mergeable(sbi, io->bio, io, fio, io->last_block_in_bio,
 			      fio->new_blkaddr) ||
-	     !f2fs_crypt_mergeable_bio(io->bio, fio->page->mapping->host,
+	     !f2fs_crypt_mergeable_bio(io->bio, inode,
 				page_folio(bio_page)->index, fio)))
 		__submit_merged_bio(io);
 alloc_new:
 	if (io->bio == NULL) {
 		io->bio = __bio_alloc(fio, BIO_MAX_VECS);
-		f2fs_set_bio_crypt_ctx(io->bio, fio->page->mapping->host,
+		f2fs_set_bio_crypt_ctx(io->bio, inode,
 				page_folio(bio_page)->index, fio, GFP_NOIO);
 		io->fio = *fio;
 	}
@@ -2501,7 +2502,7 @@ static void f2fs_readahead(struct readahead_control *rac)
 
 int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
 {
-	struct inode *inode = fio->page->mapping->host;
+	struct inode *inode = fio_inode(fio);
 	struct page *mpage, *page;
 	gfp_t gfp_flags = GFP_NOFS;
 
@@ -2631,7 +2632,7 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
 
 static inline bool need_inplace_update(struct f2fs_io_info *fio)
 {
-	struct inode *inode = fio->page->mapping->host;
+	struct inode *inode = fio_inode(fio);
 
 	if (f2fs_should_update_outplace(inode, fio))
 		return false;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f1576dc6ec67..c37092e82354 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3858,6 +3858,11 @@ unsigned int f2fs_usable_blks_in_seg(struct f2fs_sb_info *sbi,
 unsigned long long f2fs_get_section_mtime(struct f2fs_sb_info *sbi,
 			unsigned int segno);
 
+static inline struct inode *fio_inode(struct f2fs_io_info *fio)
+{
+	return page_folio(fio->page)->mapping->host;
+}
+
 #define DEF_FRAGMENT_SIZE	4
 #define MIN_FRAGMENT_SIZE	1
 #define MAX_FRAGMENT_SIZE	512
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 396ef71f41e3..d2f2f68da098 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3584,7 +3584,7 @@ static int __get_segment_type_2(struct f2fs_io_info *fio)
 static int __get_segment_type_4(struct f2fs_io_info *fio)
 {
 	if (fio->type == DATA) {
-		struct inode *inode = fio->page->mapping->host;
+		struct inode *inode = fio_inode(fio);
 
 		if (S_ISDIR(inode->i_mode))
 			return CURSEG_HOT_DATA;
@@ -3618,7 +3618,7 @@ static int __get_age_segment_type(struct inode *inode, pgoff_t pgofs)
 static int __get_segment_type_6(struct f2fs_io_info *fio)
 {
 	if (fio->type == DATA) {
-		struct inode *inode = fio->page->mapping->host;
+		struct inode *inode = fio_inode(fio);
 		int type;
 
 		if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
@@ -4023,7 +4023,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 	if (!err) {
 		f2fs_update_device_state(fio->sbi, fio->ino,
 						fio->new_blkaddr, 1);
-		f2fs_update_iostat(fio->sbi, fio->page->mapping->host,
+		f2fs_update_iostat(fio->sbi, fio_inode(fio),
 						fio->io_type, F2FS_BLKSIZE);
 	}
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
