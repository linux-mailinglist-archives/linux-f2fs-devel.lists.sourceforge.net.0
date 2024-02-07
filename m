Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F395E84C187
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Feb 2024 01:52:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rXWAN-0007YI-6d;
	Wed, 07 Feb 2024 00:51:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rXWAL-0007YC-KJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Feb 2024 00:51:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ukcX9z9idAocbhQwpC71LJmdn0iC5/UKnl1k3tHx/MU=; b=PvEDpOUlYh8IYAeiJXtDLjTEM7
 pNgt2A+jCxLxqmq2ZJtjY4qoqZYrZ3Ssd5OHYAP+vNqnQd9KHXK1mYXKeOZ0d8X8drTwatZ5j/9uj
 rLYfOGTsQ2swole+aXtfzPE0Rj1FAKjWcOJ6xMW9YHJAi3XaZs8erWA/hf75NWjVEEt4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ukcX9z9idAocbhQwpC71LJmdn0iC5/UKnl1k3tHx/MU=; b=f
 IbgB5rJMZYk1QRmvteHETAvrQihGoI0rFLgiFU9+/3ZhFig55+nj+v6HjZBnmNFWBTFNYnVeCjScQ
 IfgT31Ob0HlahTDtkVDmizQGiU7PIEkkCF6KRKCAKtJdn2tHvlgVPPPmgCjymCRf3yQZlddJeJXv7
 PsHFNNkew1nvNTso=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rXWAJ-0003hG-RS for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Feb 2024 00:51:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 86E62CE17C8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  7 Feb 2024 00:51:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A72ACC43394;
 Wed,  7 Feb 2024 00:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707267069;
 bh=6zAvvsapZMigyNSVrrfa/AlEgMz7BXwgOHd87orYc1c=;
 h=From:To:Cc:Subject:Date:From;
 b=WspTbakkbms21iRaNvsoQTnvkALJ3sKgyfc2giNa34t9aytmJVMYunkW1P3QYUc+p
 qperfEJKSg1mqKe4C45cfu1AiuCuCHdwD6wgisOZMggZtQxHNjQfR8WkQr6qr4l6jS
 g9oHdEM8J8kTynHqznLiuHgSBwzNxYqX5OlX1xqLEb1N3xrGT25bZkUhTjW1nNVi7s
 bZBERxsHkjU/pB77OEGr6Bz/usF+EWM3o36PcYgXE/Dwkf/NUVN/Nv2W+5fnGY9CiS
 4S4mAtmBNLHknhbqWBFBBtUdqXKdRA0GQWtmF6Zpo/jgBPDP+Ceuw6P62ios0CdiLg
 3rM8Eq1vHrngw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  6 Feb 2024 16:51:03 -0800
Message-ID: <20240207005105.3744811-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.43.0.594.gd9cf4e227d-goog
MIME-Version: 1.0
X-Spam-Score: -2.8 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's deprecate an unused io_bits feature to save CPU cycles
 and memory. Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 Documentation/filesystems/f2fs.rst
 | 2 - fs/f2fs/data.c | 73 + fs/f2fs/f2fs.h | 25 ++------- fs/f2fs/file.c
 | 2 - fs/f2fs/gc [...] 
 Content analysis details:   (-2.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rXWAJ-0003hG-RS
Subject: [f2fs-dev] [PATCH 1/3] f2fs: deprecate io_bits
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let's deprecate an unused io_bits feature to save CPU cycles and memory.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Documentation/filesystems/f2fs.rst |  2 -
 fs/f2fs/data.c                     | 73 +------------------------
 fs/f2fs/f2fs.h                     | 25 ++-------
 fs/f2fs/file.c                     |  2 -
 fs/f2fs/gc.c                       | 10 +---
 fs/f2fs/segment.c                  |  9 +--
 fs/f2fs/super.c                    | 88 +-----------------------------
 include/linux/f2fs_fs.h            |  6 --
 8 files changed, 10 insertions(+), 205 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 32cbfa864f38..9ac5083dae8e 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -229,8 +229,6 @@ mode=%s			 Control block allocation mode which supports "adaptive"
 			 option for more randomness.
 			 Please, use these options for your experiments and we strongly
 			 recommend to re-format the filesystem after using these options.
-io_bits=%u		 Set the bit size of write IO requests. It should be set
-			 with "mode=lfs".
 usrquota		 Enable plain user disk quota accounting.
 grpquota		 Enable plain group disk quota accounting.
 prjquota		 Enable plain project quota accounting.
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 05158f89ef32..828c797cd47c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -338,17 +338,6 @@ static void f2fs_write_end_io(struct bio *bio)
 		struct page *page = bvec->bv_page;
 		enum count_type type = WB_DATA_TYPE(page, false);
 
-		if (page_private_dummy(page)) {
-			clear_page_private_dummy(page);
-			unlock_page(page);
-			mempool_free(page, sbi->write_io_dummy);
-
-			if (unlikely(bio->bi_status))
-				f2fs_stop_checkpoint(sbi, true,
-						STOP_CP_REASON_WRITE_FAIL);
-			continue;
-		}
-
 		fscrypt_finalize_bounce_page(&page);
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
@@ -522,50 +511,13 @@ void f2fs_submit_read_bio(struct f2fs_sb_info *sbi, struct bio *bio,
 	submit_bio(bio);
 }
 
-static void f2fs_align_write_bio(struct f2fs_sb_info *sbi, struct bio *bio)
-{
-	unsigned int start =
-		(bio->bi_iter.bi_size >> F2FS_BLKSIZE_BITS) % F2FS_IO_SIZE(sbi);
-
-	if (start == 0)
-		return;
-
-	/* fill dummy pages */
-	for (; start < F2FS_IO_SIZE(sbi); start++) {
-		struct page *page =
-			mempool_alloc(sbi->write_io_dummy,
-				      GFP_NOIO | __GFP_NOFAIL);
-		f2fs_bug_on(sbi, !page);
-
-		lock_page(page);
-
-		zero_user_segment(page, 0, PAGE_SIZE);
-		set_page_private_dummy(page);
-
-		if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE)
-			f2fs_bug_on(sbi, 1);
-	}
-}
-
 static void f2fs_submit_write_bio(struct f2fs_sb_info *sbi, struct bio *bio,
 				  enum page_type type)
 {
 	WARN_ON_ONCE(is_read_io(bio_op(bio)));
 
-	if (type == DATA || type == NODE) {
-		if (f2fs_lfs_mode(sbi) && current->plug)
-			blk_finish_plug(current->plug);
-
-		if (F2FS_IO_ALIGNED(sbi)) {
-			f2fs_align_write_bio(sbi, bio);
-			/*
-			 * In the NODE case, we lose next block address chain.
-			 * So, we need to do checkpoint in f2fs_sync_file.
-			 */
-			if (type == NODE)
-				set_sbi_flag(sbi, SBI_NEED_CP);
-		}
-	}
+	if (f2fs_lfs_mode(sbi) && current->plug && PAGE_TYPE_ON_MAIN(type))
+		blk_finish_plug(current->plug);
 
 	trace_f2fs_submit_write_bio(sbi->sb, type, bio);
 	iostat_update_submit_ctx(bio, type);
@@ -794,16 +746,6 @@ static bool io_is_mergeable(struct f2fs_sb_info *sbi, struct bio *bio,
 					block_t last_blkaddr,
 					block_t cur_blkaddr)
 {
-	if (F2FS_IO_ALIGNED(sbi) && (fio->type == DATA || fio->type == NODE)) {
-		unsigned int filled_blocks =
-				F2FS_BYTES_TO_BLK(bio->bi_iter.bi_size);
-		unsigned int io_size = F2FS_IO_SIZE(sbi);
-		unsigned int left_vecs = bio->bi_max_vecs - bio->bi_vcnt;
-
-		/* IOs in bio is aligned and left space of vectors is not enough */
-		if (!(filled_blocks % io_size) && left_vecs < io_size)
-			return false;
-	}
 	if (!page_is_mergeable(sbi, bio, last_blkaddr, cur_blkaddr))
 		return false;
 	return io_type_is_mergeable(io, fio);
@@ -1055,14 +997,6 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 		__submit_merged_bio(io);
 alloc_new:
 	if (io->bio == NULL) {
-		if (F2FS_IO_ALIGNED(sbi) &&
-				(fio->type == DATA || fio->type == NODE) &&
-				fio->new_blkaddr & F2FS_IO_SIZE_MASK(sbi)) {
-			dec_page_count(sbi, WB_DATA_TYPE(bio_page,
-						fio->compressed_page));
-			fio->retry = 1;
-			goto skip;
-		}
 		io->bio = __bio_alloc(fio, BIO_MAX_VECS);
 		f2fs_set_bio_crypt_ctx(io->bio, fio->page->mapping->host,
 				       bio_page->index, fio, GFP_NOIO);
@@ -1092,7 +1026,6 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 		__submit_merged_bio(io);
 	}
 #endif
-skip:
 	if (fio->in_list)
 		goto next;
 out:
@@ -2669,8 +2602,6 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
 	if (fio) {
 		if (page_private_gcing(fio->page))
 			return true;
-		if (page_private_dummy(fio->page))
-			return true;
 		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
 			f2fs_is_checkpointed_data(sbi, fio->old_blkaddr)))
 			return true;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 543898482f8b..4c52136cbc10 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -148,7 +148,6 @@ struct f2fs_rwsem {
 
 struct f2fs_mount_info {
 	unsigned int opt;
-	int write_io_size_bits;		/* Write IO size bits */
 	block_t root_reserved_blocks;	/* root reserved blocks */
 	kuid_t s_resuid;		/* reserved blocks for uid */
 	kgid_t s_resgid;		/* reserved blocks for gid */
@@ -1117,6 +1116,7 @@ enum count_type {
  * ...			Only can be used with META.
  */
 #define PAGE_TYPE_OF_BIO(type)	((type) > META ? META : (type))
+#define PAGE_TYPE_ON_MAIN(type)	((type) == DATA || (type) == NODE)
 enum page_type {
 	DATA = 0,
 	NODE = 1,	/* should not change this */
@@ -1211,7 +1211,6 @@ struct f2fs_io_info {
 	unsigned int submitted:1;	/* indicate IO submission */
 	unsigned int in_list:1;		/* indicate fio is in io_list */
 	unsigned int is_por:1;		/* indicate IO is from recovery or not */
-	unsigned int retry:1;		/* need to reallocate block address */
 	unsigned int encrypted:1;	/* indicate file is encrypted */
 	unsigned int post_read:1;	/* require post read */
 	enum iostat_type io_type;	/* io type */
@@ -1413,18 +1412,16 @@ static inline void f2fs_clear_bit(unsigned int nr, char *addr);
  * Layout A: lowest bit should be 1
  * | bit0 = 1 | bit1 | bit2 | ... | bit MAX | private data .... |
  * bit 0	PAGE_PRIVATE_NOT_POINTER
- * bit 1	PAGE_PRIVATE_DUMMY_WRITE
- * bit 2	PAGE_PRIVATE_ONGOING_MIGRATION
- * bit 3	PAGE_PRIVATE_INLINE_INODE
- * bit 4	PAGE_PRIVATE_REF_RESOURCE
- * bit 5-	f2fs private data
+ * bit 1	PAGE_PRIVATE_ONGOING_MIGRATION
+ * bit 2	PAGE_PRIVATE_INLINE_INODE
+ * bit 3	PAGE_PRIVATE_REF_RESOURCE
+ * bit 4-	f2fs private data
  *
  * Layout B: lowest bit should be 0
  * page.private is a wrapped pointer.
  */
 enum {
 	PAGE_PRIVATE_NOT_POINTER,		/* private contains non-pointer data */
-	PAGE_PRIVATE_DUMMY_WRITE,		/* data page for padding aligned IO */
 	PAGE_PRIVATE_ONGOING_MIGRATION,		/* data page which is on-going migrating */
 	PAGE_PRIVATE_INLINE_INODE,		/* inode page contains inline data */
 	PAGE_PRIVATE_REF_RESOURCE,		/* dirty page has referenced resources */
@@ -1571,7 +1568,6 @@ struct f2fs_sb_info {
 	struct f2fs_bio_info *write_io[NR_PAGE_TYPE];	/* for write bios */
 	/* keep migration IO order for LFS mode */
 	struct f2fs_rwsem io_order_lock;
-	mempool_t *write_io_dummy;		/* Dummy pages */
 	pgoff_t page_eio_ofs[NR_PAGE_TYPE];	/* EIO page offset */
 	int page_eio_cnt[NR_PAGE_TYPE];		/* EIO count */
 
@@ -2307,10 +2303,6 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
 	if (!__allow_reserved_blocks(sbi, inode, true))
 		avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
 
-	if (F2FS_IO_ALIGNED(sbi))
-		avail_user_block_count -= sbi->blocks_per_seg *
-				SM_I(sbi)->additional_reserved_segments;
-
 	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
 		if (avail_user_block_count > sbi->unusable_block_count)
 			avail_user_block_count -= sbi->unusable_block_count;
@@ -2378,17 +2370,14 @@ static inline void clear_page_private_##name(struct page *page) \
 PAGE_PRIVATE_GET_FUNC(nonpointer, NOT_POINTER);
 PAGE_PRIVATE_GET_FUNC(inline, INLINE_INODE);
 PAGE_PRIVATE_GET_FUNC(gcing, ONGOING_MIGRATION);
-PAGE_PRIVATE_GET_FUNC(dummy, DUMMY_WRITE);
 
 PAGE_PRIVATE_SET_FUNC(reference, REF_RESOURCE);
 PAGE_PRIVATE_SET_FUNC(inline, INLINE_INODE);
 PAGE_PRIVATE_SET_FUNC(gcing, ONGOING_MIGRATION);
-PAGE_PRIVATE_SET_FUNC(dummy, DUMMY_WRITE);
 
 PAGE_PRIVATE_CLEAR_FUNC(reference, REF_RESOURCE);
 PAGE_PRIVATE_CLEAR_FUNC(inline, INLINE_INODE);
 PAGE_PRIVATE_CLEAR_FUNC(gcing, ONGOING_MIGRATION);
-PAGE_PRIVATE_CLEAR_FUNC(dummy, DUMMY_WRITE);
 
 static inline unsigned long get_page_private_data(struct page *page)
 {
@@ -2644,10 +2633,6 @@ static inline int inc_valid_node_count(struct f2fs_sb_info *sbi,
 	if (!__allow_reserved_blocks(sbi, inode, false))
 		valid_block_count += F2FS_OPTION(sbi).root_reserved_blocks;
 
-	if (F2FS_IO_ALIGNED(sbi))
-		valid_block_count += sbi->blocks_per_seg *
-				SM_I(sbi)->additional_reserved_segments;
-
 	user_block_count = sbi->user_block_count;
 	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
 		user_block_count -= sbi->unusable_block_count;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 25b119cf3499..c6cd9474ba2d 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -822,8 +822,6 @@ static bool f2fs_force_buffered_io(struct inode *inode, int rw)
 	 */
 	if (f2fs_sb_has_blkzoned(sbi) && (rw == WRITE))
 		return true;
-	if (f2fs_lfs_mode(sbi) && rw == WRITE && F2FS_IO_ALIGNED(sbi))
-		return true;
 	if (is_sbi_flag_set(sbi, SBI_CP_DISABLED))
 		return true;
 
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index a079eebfb080..6899f434ad68 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1184,7 +1184,6 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 		.op_flags = 0,
 		.encrypted_page = NULL,
 		.in_list = 0,
-		.retry = 0,
 	};
 	int err;
 
@@ -1273,7 +1272,6 @@ static int move_data_block(struct inode *inode, block_t bidx,
 		.op_flags = 0,
 		.encrypted_page = NULL,
 		.in_list = 0,
-		.retry = 0,
 	};
 	struct dnode_of_data dn;
 	struct f2fs_summary sum;
@@ -1393,18 +1391,12 @@ static int move_data_block(struct inode *inode, block_t bidx,
 	fio.op_flags = REQ_SYNC;
 	fio.new_blkaddr = newaddr;
 	f2fs_submit_page_write(&fio);
-	if (fio.retry) {
-		err = -EAGAIN;
-		if (PageWriteback(fio.encrypted_page))
-			end_page_writeback(fio.encrypted_page);
-		goto put_page_out;
-	}
 
 	f2fs_update_iostat(fio.sbi, NULL, FS_GC_DATA_IO, F2FS_BLKSIZE);
 
 	f2fs_update_data_blkaddr(&dn, newaddr);
 	set_inode_flag(inode, FI_APPEND_WRITE);
-put_page_out:
+
 	f2fs_put_page(fio.encrypted_page, 1);
 recover_block:
 	if (err)
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 7901ede58113..e5759813276a 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3507,9 +3507,6 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 	if (fio) {
 		struct f2fs_bio_info *io;
 
-		if (F2FS_IO_ALIGNED(sbi))
-			fio->retry = 0;
-
 		INIT_LIST_HEAD(&fio->list);
 		fio->in_list = 1;
 		io = sbi->write_io[fio->type] + fio->temp;
@@ -3557,7 +3554,7 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 
 	if (keep_order)
 		f2fs_down_read(&fio->sbi->io_order_lock);
-reallocate:
+
 	f2fs_allocate_data_block(fio->sbi, fio->page, fio->old_blkaddr,
 			&fio->new_blkaddr, sum, type, fio);
 	if (GET_SEGNO(fio->sbi, fio->old_blkaddr) != NULL_SEGNO)
@@ -3565,10 +3562,6 @@ static void do_write_page(struct f2fs_summary *sum, struct f2fs_io_info *fio)
 
 	/* writeout dirty page into bdev */
 	f2fs_submit_page_write(fio);
-	if (fio->retry) {
-		fio->old_blkaddr = fio->new_blkaddr;
-		goto reallocate;
-	}
 
 	f2fs_update_device_state(fio->sbi, fio->ino, fio->new_blkaddr, 1);
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1b718bebfaa1..f1516fd5088a 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -138,7 +138,6 @@ enum {
 	Opt_resgid,
 	Opt_resuid,
 	Opt_mode,
-	Opt_io_size_bits,
 	Opt_fault_injection,
 	Opt_fault_type,
 	Opt_lazytime,
@@ -217,7 +216,6 @@ static match_table_t f2fs_tokens = {
 	{Opt_resgid, "resgid=%u"},
 	{Opt_resuid, "resuid=%u"},
 	{Opt_mode, "mode=%s"},
-	{Opt_io_size_bits, "io_bits=%u"},
 	{Opt_fault_injection, "fault_injection=%u"},
 	{Opt_fault_type, "fault_type=%u"},
 	{Opt_lazytime, "lazytime"},
@@ -349,46 +347,6 @@ static inline void limit_reserve_root(struct f2fs_sb_info *sbi)
 					   F2FS_OPTION(sbi).s_resgid));
 }
 
-static inline int adjust_reserved_segment(struct f2fs_sb_info *sbi)
-{
-	unsigned int sec_blks = sbi->blocks_per_seg * sbi->segs_per_sec;
-	unsigned int avg_vblocks;
-	unsigned int wanted_reserved_segments;
-	block_t avail_user_block_count;
-
-	if (!F2FS_IO_ALIGNED(sbi))
-		return 0;
-
-	/* average valid block count in section in worst case */
-	avg_vblocks = sec_blks / F2FS_IO_SIZE(sbi);
-
-	/*
-	 * we need enough free space when migrating one section in worst case
-	 */
-	wanted_reserved_segments = (F2FS_IO_SIZE(sbi) / avg_vblocks) *
-						reserved_segments(sbi);
-	wanted_reserved_segments -= reserved_segments(sbi);
-
-	avail_user_block_count = sbi->user_block_count -
-				sbi->current_reserved_blocks -
-				F2FS_OPTION(sbi).root_reserved_blocks;
-
-	if (wanted_reserved_segments * sbi->blocks_per_seg >
-					avail_user_block_count) {
-		f2fs_err(sbi, "IO align feature can't grab additional reserved segment: %u, available segments: %u",
-			wanted_reserved_segments,
-			avail_user_block_count >> sbi->log_blocks_per_seg);
-		return -ENOSPC;
-	}
-
-	SM_I(sbi)->additional_reserved_segments = wanted_reserved_segments;
-
-	f2fs_info(sbi, "IO align feature needs additional reserved segment: %u",
-			 wanted_reserved_segments);
-
-	return 0;
-}
-
 static inline void adjust_unusable_cap_perc(struct f2fs_sb_info *sbi)
 {
 	if (!F2FS_OPTION(sbi).unusable_cap_perc)
@@ -919,16 +877,6 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			}
 			kfree(name);
 			break;
-		case Opt_io_size_bits:
-			if (args->from && match_int(args, &arg))
-				return -EINVAL;
-			if (arg <= 0 || arg > __ilog2_u32(BIO_MAX_VECS)) {
-				f2fs_warn(sbi, "Not support %ld, larger than %d",
-					BIT(arg), BIO_MAX_VECS);
-				return -EINVAL;
-			}
-			F2FS_OPTION(sbi).write_io_size_bits = arg;
-			break;
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 		case Opt_fault_injection:
 			if (args->from && match_int(args, &arg))
@@ -1398,12 +1346,6 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 	}
 #endif
 
-	if (F2FS_IO_SIZE_BITS(sbi) && !f2fs_lfs_mode(sbi)) {
-		f2fs_err(sbi, "Should set mode=lfs with %luKB-sized IO",
-			 F2FS_IO_SIZE_KB(sbi));
-		return -EINVAL;
-	}
-
 	if (test_opt(sbi, INLINE_XATTR_SIZE)) {
 		int min_size, max_size;
 
@@ -1724,7 +1666,6 @@ static void f2fs_put_super(struct super_block *sb)
 
 	f2fs_destroy_page_array_cache(sbi);
 	f2fs_destroy_xattr_caches(sbi);
-	mempool_destroy(sbi->write_io_dummy);
 #ifdef CONFIG_QUOTA
 	for (i = 0; i < MAXQUOTAS; i++)
 		kfree(F2FS_OPTION(sbi).s_qf_names[i]);
@@ -2084,9 +2025,6 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 					F2FS_OPTION(sbi).s_resuid),
 				from_kgid_munged(&init_user_ns,
 					F2FS_OPTION(sbi).s_resgid));
-	if (F2FS_IO_SIZE_BITS(sbi))
-		seq_printf(seq, ",io_bits=%u",
-				F2FS_OPTION(sbi).write_io_size_bits);
 #ifdef CONFIG_F2FS_FAULT_INJECTION
 	if (test_opt(sbi, FAULT_INJECTION)) {
 		seq_printf(seq, ",fault_injection=%u",
@@ -2338,7 +2276,6 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	bool no_read_extent_cache = !test_opt(sbi, READ_EXTENT_CACHE);
 	bool no_age_extent_cache = !test_opt(sbi, AGE_EXTENT_CACHE);
 	bool enable_checkpoint = !test_opt(sbi, DISABLE_CHECKPOINT);
-	bool no_io_align = !F2FS_IO_ALIGNED(sbi);
 	bool no_atgc = !test_opt(sbi, ATGC);
 	bool no_discard = !test_opt(sbi, DISCARD);
 	bool no_compress_cache = !test_opt(sbi, COMPRESS_CACHE);
@@ -2446,12 +2383,6 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 		goto restore_opts;
 	}
 
-	if (no_io_align == !!F2FS_IO_ALIGNED(sbi)) {
-		err = -EINVAL;
-		f2fs_warn(sbi, "switch io_bits option is not allowed");
-		goto restore_opts;
-	}
-
 	if (no_compress_cache == !!test_opt(sbi, COMPRESS_CACHE)) {
 		err = -EINVAL;
 		f2fs_warn(sbi, "switch compress_cache option is not allowed");
@@ -4314,8 +4245,6 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 			  FDEV(i).total_segments,
 			  FDEV(i).start_blk, FDEV(i).end_blk);
 	}
-	f2fs_info(sbi,
-		  "IO Block Size: %8ld KB", F2FS_IO_SIZE_KB(sbi));
 	return 0;
 }
 
@@ -4528,19 +4457,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	if (err)
 		goto free_iostat;
 
-	if (F2FS_IO_ALIGNED(sbi)) {
-		sbi->write_io_dummy =
-			mempool_create_page_pool(2 * (F2FS_IO_SIZE(sbi) - 1), 0);
-		if (!sbi->write_io_dummy) {
-			err = -ENOMEM;
-			goto free_percpu;
-		}
-	}
-
 	/* init per sbi slab cache */
 	err = f2fs_init_xattr_caches(sbi);
 	if (err)
-		goto free_io_dummy;
+		goto free_percpu;
 	err = f2fs_init_page_array_cache(sbi);
 	if (err)
 		goto free_xattr_cache;
@@ -4628,10 +4548,6 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		goto free_nm;
 	}
 
-	err = adjust_reserved_segment(sbi);
-	if (err)
-		goto free_nm;
-
 	/* For write statistics */
 	sbi->sectors_written_start = f2fs_get_sectors_written(sbi);
 
@@ -4862,8 +4778,6 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	f2fs_destroy_page_array_cache(sbi);
 free_xattr_cache:
 	f2fs_destroy_xattr_caches(sbi);
-free_io_dummy:
-	mempool_destroy(sbi->write_io_dummy);
 free_percpu:
 	destroy_percpu_info(sbi);
 free_iostat:
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 053137a0fe45..9b69c50255b2 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -40,12 +40,6 @@
 
 #define F2FS_ENC_UTF8_12_1	1
 
-#define F2FS_IO_SIZE(sbi)	BIT(F2FS_OPTION(sbi).write_io_size_bits) /* Blocks */
-#define F2FS_IO_SIZE_KB(sbi)	BIT(F2FS_OPTION(sbi).write_io_size_bits + 2) /* KB */
-#define F2FS_IO_SIZE_BITS(sbi)	(F2FS_OPTION(sbi).write_io_size_bits) /* power of 2 */
-#define F2FS_IO_SIZE_MASK(sbi)	(F2FS_IO_SIZE(sbi) - 1)
-#define F2FS_IO_ALIGNED(sbi)	(F2FS_IO_SIZE(sbi) > 1)
-
 /* This flag is used by node and meta inodes, and by recovery */
 #define GFP_F2FS_ZERO		(GFP_NOFS | __GFP_ZERO)
 
-- 
2.43.0.594.gd9cf4e227d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
