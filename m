Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DADAFD425
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVNAwMU+YrVkdpRa7QI7xqwt63Gj8oAbwHdKlUb3FTw=; b=M6z1E1mWR3f+0F1GcfRt9tDIGM
	MHdVINJYltnAgRBB4Jut4PiBj9cpYYEpKCO06XJAHbyPbgOCx+ClkYmTafP8Lkp4WbUVK0DeawDDe
	Q9kV9vFPlR88U85POnvHgIdMGY/fwMbKcEeOloLjcfy0bettZDydj4W2bCZgg6vGbKsE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjq-0007Jg-2C;
	Tue, 08 Jul 2025 17:04:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjp-0007JF-14
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A0kYCac+tfJHUJiJempOI9rUBKf4lzWXdYtyYLksotI=; b=S7Gz/E//J9mTxXmDkevH3LxGwn
 p3xVghVhYH3nOZsv/2swLmrfDMhzeyfU96u+LjzRmkArT4leXWmEiVsSkKRQqnl/PZie6xk7HbiMH
 5mfSKrylDYJYiV5m2iBIDKySPKrA1BTZ7q07PwHOMxQ5WHLZSD/8ag0b0sB94zDoq828=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A0kYCac+tfJHUJiJempOI9rUBKf4lzWXdYtyYLksotI=; b=e+4oqYsyRwtYfrA0vLdH1c+wI/
 ewTrceT/6yIl458mR+dms2sST1rtGyD+7Vg2gzIeCSlgFNXeQaatSMJ78yjrRJIRpn69WVjIikmPr
 zb0BQc7VGv/lm51bj9NFW4qYNQRmePFkWsglvaYYacg9oemM+KYgD4EDthLGobyzIks8=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjo-0006EF-2f for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=A0kYCac+tfJHUJiJempOI9rUBKf4lzWXdYtyYLksotI=; b=oytYJzYWhi4N46+3H5P8pL69qf
 pyL6vDW8uHTt5UET4J4TlClxrw5KWdjXfkVwdOlpWIw1nsRP4g0oT/B1d74Y4GlUfv5rLBYVcqPvG
 4T/vsXcQOGwpXSLOv1BneJj9h0pXcZlRgTGM4SW5M9s0n1Wwi/BFv6DYySO9WPkhN8kdE/3r5bs8C
 zdjYvo6FOK9m4IUm1KuCDroJK6U+G9WQKVzipUEMMnvCnuIfUDkGSRY0do7PsGzyMtY3dekmLHjhr
 JNhjkL+ZZfqJst0AZLW7gfHfpVZjiVuqopf5XYC8Nb0ISx/9ME+Vmhio0PsFlEIIkpu42OQ+WKUwl
 4GgxtIEg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjh-00000000T66-2cSy;
 Tue, 08 Jul 2025 17:04:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:26 +0100
Message-ID: <20250708170359.111653-30-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Put fio->page insto a union with fio->folio. This lets us
 remove a lot of folio->page and page->folio conversions. Signed-off-by:
 Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/checkpoint.c | 4 ++--
 fs/f2fs/data.c
 | 17 ++++++++--------- fs/f2fs/f2fs.h | 7 +++++-- fs/f2fs/gc.c | 6 +++---
 fs/f2fs/inline.c [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uZBjo-0006EF-2f
Subject: [f2fs-dev] [PATCH 29/60] f2fs: Add fio->folio
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

Put fio->page insto a union with fio->folio.  This lets us remove a
lot of folio->page and page->folio conversions.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/checkpoint.c |  4 ++--
 fs/f2fs/data.c       | 17 ++++++++---------
 fs/f2fs/f2fs.h       |  7 +++++--
 fs/f2fs/gc.c         |  6 +++---
 fs/f2fs/inline.c     |  2 +-
 fs/f2fs/node.c       |  4 ++--
 fs/f2fs/segment.c    |  7 +++----
 7 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index f149ec28aefd..07ca10c66649 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -82,7 +82,7 @@ static struct folio *__get_meta_folio(struct f2fs_sb_info *sbi, pgoff_t index,
 	if (folio_test_uptodate(folio))
 		goto out;
 
-	fio.page = &folio->page;
+	fio.folio = folio;
 
 	err = f2fs_submit_page_bio(&fio);
 	if (err) {
@@ -309,7 +309,7 @@ int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, block_t start, int nrpages,
 			continue;
 		}
 
-		fio.page = &folio->page;
+		fio.folio = folio;
 		err = f2fs_submit_page_bio(&fio);
 		f2fs_folio_put(folio, err ? true : false);
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5fc3d985c4e3..198a7093d98b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -419,7 +419,6 @@ int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr)
 static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
 {
 	unsigned int temp_mask = GENMASK(NR_TEMP_TYPE - 1, 0);
-	struct folio *fio_folio = page_folio(fio->page);
 	unsigned int fua_flag, meta_flag, io_flag;
 	blk_opf_t op_flags = 0;
 
@@ -447,7 +446,7 @@ static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
 		op_flags |= REQ_FUA;
 
 	if (fio->type == DATA &&
-	    F2FS_I(fio_folio->mapping->host)->ioprio_hint == F2FS_IOPRIO_WRITE)
+	    F2FS_I(fio->folio->mapping->host)->ioprio_hint == F2FS_IOPRIO_WRITE)
 		op_flags |= REQ_PRIO;
 
 	return op_flags;
@@ -691,7 +690,7 @@ void f2fs_flush_merged_writes(struct f2fs_sb_info *sbi)
 int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 {
 	struct bio *bio;
-	struct folio *fio_folio = page_folio(fio->page);
+	struct folio *fio_folio = fio->folio;
 	struct folio *data_folio = fio->encrypted_page ?
 			page_folio(fio->encrypted_page) : fio_folio;
 
@@ -779,7 +778,7 @@ static void del_bio_entry(struct bio_entry *be)
 static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
 							struct page *page)
 {
-	struct folio *fio_folio = page_folio(fio->page);
+	struct folio *fio_folio = fio->folio;
 	struct f2fs_sb_info *sbi = fio->sbi;
 	enum temp_type temp;
 	bool found = false;
@@ -888,7 +887,7 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 	struct bio *bio = *fio->bio;
 	struct page *page = fio->encrypted_page ?
 			fio->encrypted_page : fio->page;
-	struct folio *folio = page_folio(fio->page);
+	struct folio *folio = fio->folio;
 
 	if (!f2fs_is_valid_blkaddr(fio->sbi, fio->new_blkaddr,
 			__is_meta_io(fio) ? META_GENERIC : DATA_GENERIC))
@@ -1012,12 +1011,12 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 	}
 
 	if (fio->io_wbc)
-		wbc_account_cgroup_owner(fio->io_wbc, page_folio(fio->page),
-					 PAGE_SIZE);
+		wbc_account_cgroup_owner(fio->io_wbc, fio->folio,
+				folio_size(fio->folio));
 
 	io->last_block_in_bio = fio->new_blkaddr;
 
-	trace_f2fs_submit_folio_write(page_folio(fio->page), fio);
+	trace_f2fs_submit_folio_write(fio->folio, fio);
 #ifdef CONFIG_BLK_DEV_ZONED
 	if (f2fs_sb_has_blkzoned(sbi) && btype < META &&
 			is_end_zone_blkaddr(sbi, fio->new_blkaddr)) {
@@ -2642,7 +2641,7 @@ static inline bool need_inplace_update(struct f2fs_io_info *fio)
 
 int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 {
-	struct folio *folio = page_folio(fio->page);
+	struct folio *folio = fio->folio;
 	struct inode *inode = folio->mapping->host;
 	struct dnode_of_data dn;
 	struct node_info ni;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 12b14fc406c5..f98d83ccd1e2 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1240,7 +1240,10 @@ struct f2fs_io_info {
 	blk_opf_t op_flags;	/* req_flag_bits */
 	block_t new_blkaddr;	/* new block address to be written */
 	block_t old_blkaddr;	/* old block address before Cow */
-	struct page *page;	/* page to be written */
+	union {
+		struct page *page;	/* page to be written */
+		struct folio *folio;
+	};
 	struct page *encrypted_page;	/* encrypted page */
 	struct page *compressed_page;	/* compressed page */
 	struct list_head list;		/* serialize IOs */
@@ -3892,7 +3895,7 @@ unsigned long long f2fs_get_section_mtime(struct f2fs_sb_info *sbi,
 
 static inline struct inode *fio_inode(struct f2fs_io_info *fio)
 {
-	return page_folio(fio->page)->mapping->host;
+	return fio->folio->mapping->host;
 }
 
 #define DEF_FRAGMENT_SIZE	4
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index fc262d6dff3d..b2645a18a596 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1249,7 +1249,7 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 	}
 got_it:
 	/* read folio */
-	fio.page = &folio->page;
+	fio.folio = folio;
 	fio.new_blkaddr = fio.old_blkaddr = dn.data_blkaddr;
 
 	/*
@@ -1353,7 +1353,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
 		goto put_out;
 
 	/* read page */
-	fio.page = &folio->page;
+	fio.folio = folio;
 	fio.new_blkaddr = fio.old_blkaddr = dn.data_blkaddr;
 
 	if (lfs_mode)
@@ -1483,7 +1483,7 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 			.op = REQ_OP_WRITE,
 			.op_flags = REQ_SYNC,
 			.old_blkaddr = NULL_ADDR,
-			.page = &folio->page,
+			.folio = folio,
 			.encrypted_page = NULL,
 			.need_lock = LOCK_REQ,
 			.io_type = FS_GC_DATA_IO,
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 4c636a8043f8..9851310cdb87 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -150,7 +150,7 @@ int f2fs_convert_inline_folio(struct dnode_of_data *dn, struct folio *folio)
 		.type = DATA,
 		.op = REQ_OP_WRITE,
 		.op_flags = REQ_SYNC | REQ_PRIO,
-		.page = &folio->page,
+		.folio = folio,
 		.encrypted_page = NULL,
 		.io_type = FS_DATA_IO,
 	};
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 7ea5a98399a7..b55827d687e2 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1413,7 +1413,7 @@ static int read_node_folio(struct folio *folio, blk_opf_t op_flags)
 		.type = NODE,
 		.op = REQ_OP_READ,
 		.op_flags = op_flags,
-		.page = &folio->page,
+		.folio = folio,
 		.encrypted_page = NULL,
 	};
 	int err;
@@ -1677,7 +1677,7 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted
 		.type = NODE,
 		.op = REQ_OP_WRITE,
 		.op_flags = wbc_to_write_flags(wbc),
-		.page = &folio->page,
+		.folio = folio,
 		.encrypted_page = NULL,
 		.submitted = 0,
 		.io_type = io_type,
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index d0ce8b298d3b..533b4295e4d6 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3666,8 +3666,7 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
 		if (file_is_cold(inode) || f2fs_need_compress_data(inode))
 			return CURSEG_COLD_DATA;
 
-		type = __get_age_segment_type(inode,
-				page_folio(fio->page)->index);
+		type = __get_age_segment_type(inode, fio->folio->index);
 		if (type != NO_CHECK_TYPE)
 			return type;
 
@@ -3932,7 +3931,7 @@ static int log_type_to_seg_type(enum log_type type)
 
 static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 {
-	struct folio *folio = page_folio(fio->page);
+	struct folio *folio = fio->folio;
 	enum log_type type = __get_segment_type(fio);
 	int seg_type = log_type_to_seg_type(type);
 	bool keep_order = (f2fs_lfs_mode(fio->sbi) &&
@@ -3979,7 +3978,7 @@ void f2fs_do_write_meta_page(struct f2fs_sb_info *sbi, struct folio *folio,
 		.op_flags = REQ_SYNC | REQ_META | REQ_PRIO,
 		.old_blkaddr = folio->index,
 		.new_blkaddr = folio->index,
-		.page = folio_page(folio, 0),
+		.folio = folio,
 		.encrypted_page = NULL,
 		.in_list = 0,
 	};
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
