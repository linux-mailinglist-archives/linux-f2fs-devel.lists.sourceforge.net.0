Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CA03CB8F1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jul 2021 16:41:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m4P1k-0002hd-IH; Fri, 16 Jul 2021 14:41:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ebiggers@kernel.org>) id 1m4P1i-0002hN-Nv
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Jul 2021 14:41:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nizh0qcbVYuKU74LayLdEIT4KKpfxc+kUKYktruDOlw=; b=kmxMK2I1uB93vanyL72WoeAF8x
 eBa+osivIjCcKApWX21VPclcBZSG9O8l1fDefjDJ6OVH9IqOGbGZgktkWEXyTDr9kp4ic7IctClDL
 tARBBGkQp71fOEaHIuexFk7F8XyCWlCIU3mb8kotb0fQPvdroHZrNBgAqx+VUnCaGi9c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nizh0qcbVYuKU74LayLdEIT4KKpfxc+kUKYktruDOlw=; b=ME9raL3XcCP+loSOWhnirIjTVc
 FOj2go3pcQXgyrSu39feKuvxbICmsaZ0nO43qSvs/zKJKs5aKVKbBlUej82PFre2uP/ouNEXofBPc
 Hoedd0/+/XcHTBEHkVtnpzrGjHE8tXIdLbnhxV3ovgkM4ySrCJrbvAu8XpvaJdsQjJhk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m4P1X-00AaVE-JZ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Jul 2021 14:41:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A00261403;
 Fri, 16 Jul 2021 14:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626446448;
 bh=E74sQjOJWruRn0pUi261fATfXf2GkUDzPn3rQ0imE1U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zetc/iq4+0+gu+FNOUAKv/YTzgsJ7q1QJOi9aNiTPsg6uY2YpdGMRqu/jU9TKrqlK
 PP4iwh1B1a0Sw3FYCcmNuqC5XEmY5PWb092oj2QsOZ3UZ7s/oKiqspWB82+eaAprvY
 eH9M3BUuiv052j30ALhX7D57tEq//MeTC/Nr4Bp0yLe+AQlmQ4rOYRWrOAwE0q6dRm
 skLCxlJPN4H/4JASALfneCSGnvHp9OijOGX+2FbGQk+R9esq2nlPMOGZrg89PP3IhH
 l8SPlOAj8GP3wcTmJX1bAABDxbpbT9aPztC5EEQep+IMZeP7CWPjECFgAwZ2Qm4hjm
 qO6GdhKhD+Bcw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>
Date: Fri, 16 Jul 2021 09:39:16 -0500
Message-Id: <20210716143919.44373-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210716143919.44373-1-ebiggers@kernel.org>
References: <20210716143919.44373-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m4P1X-00AaVE-JZ
Subject: [f2fs-dev] [PATCH 6/9] f2fs: implement iomap operations
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
Cc: linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
 Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 Satya Tangirala <satyaprateek2357@gmail.com>,
 Changheun Lee <nanich.lee@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Implement 'struct iomap_ops' and 'struct iomap_dio_ops' for f2fs, in
preparation for making f2fs use iomap for direct I/O.

Note that f2fs_iomap_ops may be used for other things besides direct I/O
in the future; however, for now I've only tested it for direct I/O.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/Kconfig |  1 +
 fs/f2fs/data.c  | 95 +++++++++++++++++++++++++++++++++++++++++++++++--
 fs/f2fs/f2fs.h  |  2 ++
 3 files changed, 96 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index 7669de7b49ce..031fbb596450 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -7,6 +7,7 @@ config F2FS_FS
 	select CRYPTO_CRC32
 	select F2FS_FS_XATTR if FS_ENCRYPTION
 	select FS_ENCRYPTION_ALGS if FS_ENCRYPTION
+	select FS_IOMAP
 	select LZ4_COMPRESS if F2FS_FS_LZ4
 	select LZ4_DECOMPRESS if F2FS_FS_LZ4
 	select LZ4HC_COMPRESS if F2FS_FS_LZ4HC
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index cdadaa9daf55..9243159ee753 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -21,6 +21,7 @@
 #include <linux/cleancache.h>
 #include <linux/sched/signal.h>
 #include <linux/fiemap.h>
+#include <linux/iomap.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -3452,7 +3453,7 @@ static void f2fs_dio_end_io(struct bio *bio)
 	bio_endio(bio);
 }
 
-static void f2fs_dio_submit_bio(struct bio *bio, struct inode *inode,
+static void f2fs_dio_submit_bio_old(struct bio *bio, struct inode *inode,
 							loff_t file_offset)
 {
 	struct f2fs_private_dio *dio;
@@ -3481,6 +3482,35 @@ static void f2fs_dio_submit_bio(struct bio *bio, struct inode *inode,
 	bio_endio(bio);
 }
 
+static blk_qc_t f2fs_dio_submit_bio(struct inode *inode, struct iomap *iomap,
+				    struct bio *bio, loff_t file_offset)
+{
+	struct f2fs_private_dio *dio;
+	bool write = (bio_op(bio) == REQ_OP_WRITE);
+
+	dio = f2fs_kzalloc(F2FS_I_SB(inode),
+			sizeof(struct f2fs_private_dio), GFP_NOFS);
+	if (!dio)
+		goto out;
+
+	dio->inode = inode;
+	dio->orig_end_io = bio->bi_end_io;
+	dio->orig_private = bio->bi_private;
+	dio->write = write;
+
+	bio->bi_end_io = f2fs_dio_end_io;
+	bio->bi_private = dio;
+
+	inc_page_count(F2FS_I_SB(inode),
+			write ? F2FS_DIO_WRITE : F2FS_DIO_READ);
+
+	return submit_bio(bio);
+out:
+	bio->bi_status = BLK_STS_IOERR;
+	bio_endio(bio);
+	return BLK_QC_T_NONE;
+}
+
 static ssize_t f2fs_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
 {
 	struct address_space *mapping = iocb->ki_filp->f_mapping;
@@ -3529,7 +3559,7 @@ static ssize_t f2fs_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
 
 	err = __blockdev_direct_IO(iocb, inode, inode->i_sb->s_bdev,
 			iter, rw == WRITE ? get_data_block_dio_write :
-			get_data_block_dio, NULL, f2fs_dio_submit_bio,
+			get_data_block_dio, NULL, f2fs_dio_submit_bio_old,
 			rw == WRITE ? DIO_LOCKING | DIO_SKIP_HOLES :
 			DIO_SKIP_HOLES);
 
@@ -4101,3 +4131,64 @@ void f2fs_destroy_bio_entry_cache(void)
 {
 	kmem_cache_destroy(bio_entry_slab);
 }
+
+static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
+			    unsigned int flags, struct iomap *iomap,
+			    struct iomap *srcmap)
+{
+	struct f2fs_map_blocks map = {};
+	pgoff_t next_pgofs = 0;
+	int err;
+
+	map.m_lblk = bytes_to_blks(inode, offset);
+	map.m_len = bytes_to_blks(inode, offset + length - 1) - map.m_lblk + 1;
+	map.m_next_pgofs = &next_pgofs;
+	map.m_seg_type = f2fs_rw_hint_to_seg_type(inode->i_write_hint);
+	if (flags & IOMAP_WRITE)
+		map.m_may_create = true;
+
+	err = f2fs_map_blocks(inode, &map, flags & IOMAP_WRITE,
+			      F2FS_GET_BLOCK_DIO);
+	if (err)
+		return err;
+
+	iomap->offset = blks_to_bytes(inode, map.m_lblk);
+
+	if (map.m_flags & (F2FS_MAP_MAPPED | F2FS_MAP_UNWRITTEN)) {
+		iomap->length = blks_to_bytes(inode, map.m_len);
+		if (map.m_flags & F2FS_MAP_MAPPED) {
+			iomap->type = IOMAP_MAPPED;
+			iomap->flags |= IOMAP_F_MERGED;
+		} else {
+			iomap->type = IOMAP_UNWRITTEN;
+		}
+		if (WARN_ON_ONCE(!__is_valid_data_blkaddr(map.m_pblk)))
+			return -EINVAL;
+		iomap->addr = blks_to_bytes(inode, map.m_pblk);
+
+		if (WARN_ON_ONCE(f2fs_is_multi_device(F2FS_I_SB(inode))))
+			return -EINVAL;
+		iomap->bdev = inode->i_sb->s_bdev;
+	} else {
+		iomap->length = blks_to_bytes(inode, next_pgofs) -
+				iomap->offset;
+		iomap->type = IOMAP_HOLE;
+		iomap->addr = IOMAP_NULL_ADDR;
+	}
+
+	if (map.m_flags & F2FS_MAP_NEW)
+		iomap->flags |= IOMAP_F_NEW;
+	if ((inode->i_state & I_DIRTY_DATASYNC) ||
+	    offset + length > i_size_read(inode))
+		iomap->flags |= IOMAP_F_DIRTY;
+
+	return 0;
+}
+
+const struct iomap_ops f2fs_iomap_ops = {
+	.iomap_begin	= f2fs_iomap_begin,
+};
+
+const struct iomap_dio_ops f2fs_iomap_dio_ops = {
+	.submit_io	= f2fs_dio_submit_bio,
+};
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index da1da3111f18..d2b1ef6976c4 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3639,6 +3639,8 @@ int f2fs_init_post_read_processing(void);
 void f2fs_destroy_post_read_processing(void);
 int f2fs_init_post_read_wq(struct f2fs_sb_info *sbi);
 void f2fs_destroy_post_read_wq(struct f2fs_sb_info *sbi);
+extern const struct iomap_ops f2fs_iomap_ops;
+extern const struct iomap_dio_ops f2fs_iomap_dio_ops;
 
 /*
  * gc.c
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
