Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAE78FAC1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Aug 2019 08:17:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hyVYK-0003GR-AW; Fri, 16 Aug 2019 06:17:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chandan@linux.ibm.com>) id 1hyVYJ-0003GB-2P
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 06:17:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZVKgNBFi3HlK0G28E5BuLZ2cw5QU43/AeEjtMxcFbN8=; b=H2E47u5BN2bN1yoHP27nb1zsms
 7BNAOmT8OExtuiaMeC+E5YqUoENwM6xdVf3VWQe7A9dfAoXzQ8lZ3OjZDF/NcNd/Yn96uWUTVUbEg
 KbihQzYPC7OrUDLxLbhfldQuryY2oRZ9K57RyWOF7riH9OHW2o31NQxnMW8pmkrE1Cck=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZVKgNBFi3HlK0G28E5BuLZ2cw5QU43/AeEjtMxcFbN8=; b=Bc90lh0jjZwzIFPzjdJIxfhGlc
 F7isXxisSVcDJ6/vACmDp1E/kjCsetYzzznArDLFzJA8OaPGlRnYHwoLOJmr7Zq7bNmohThvJVV1L
 3PGD+VOortAhJk7mCpi78mujUplFzkE52wmAHcTuOBZuvfxLjkxCkSmpCm+n1Ws/uvzE=;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hyVY2-007yFB-2R
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 06:17:29 +0000
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7G63XTI053250; Fri, 16 Aug 2019 02:17:01 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2udnsjafdd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Aug 2019 02:17:01 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x7G63hVo053929;
 Fri, 16 Aug 2019 02:17:00 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2udnsjafcu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Aug 2019 02:17:00 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7G6GxAo026970;
 Fri, 16 Aug 2019 06:16:59 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03wdc.us.ibm.com with ESMTP id 2u9nj662gb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Aug 2019 06:16:59 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7G6GxoW49152372
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Aug 2019 06:16:59 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E06711206B;
 Fri, 16 Aug 2019 06:16:59 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A4DF112061;
 Fri, 16 Aug 2019 06:16:56 +0000 (GMT)
Received: from localhost.in.ibm.com (unknown [9.124.35.23])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 16 Aug 2019 06:16:56 +0000 (GMT)
From: Chandan Rajendra <chandan@linux.ibm.com>
To: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org
Date: Fri, 16 Aug 2019 11:48:02 +0530
Message-Id: <20190816061804.14840-7-chandan@linux.ibm.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190816061804.14840-1-chandan@linux.ibm.com>
References: <20190816061804.14840-1-chandan@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-16_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908160066
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1hyVY2-007yFB-2R
Subject: [f2fs-dev] [PATCH V4 6/8] ext4: Wire up ext4_readpage[s] to use
 mpage_readpage[s]
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
Cc: hch@infradead.org, tytso@mit.edu, ebiggers@kernel.org,
 Chandan Rajendra <chandan@linux.ibm.com>, adilger.kernel@dilger.ca,
 chandanrmail@gmail.com, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Now that do_mpage_readpage() is "post read process" aware, this commit
gets ext4_readpage[s] to use mpage_readpage[s] and deletes ext4's
readpage.c since the associated functionality is not required anymore.
---
 fs/ext4/Makefile   |   2 +-
 fs/ext4/inode.c    |   5 +-
 fs/ext4/readpage.c | 295 ---------------------------------------------
 3 files changed, 3 insertions(+), 299 deletions(-)
 delete mode 100644 fs/ext4/readpage.c

diff --git a/fs/ext4/Makefile b/fs/ext4/Makefile
index 8fdfcd3c3e04..7c38803a808d 100644
--- a/fs/ext4/Makefile
+++ b/fs/ext4/Makefile
@@ -8,7 +8,7 @@ obj-$(CONFIG_EXT4_FS) += ext4.o
 ext4-y	:= balloc.o bitmap.o block_validity.o dir.o ext4_jbd2.o extents.o \
 		extents_status.o file.o fsmap.o fsync.o hash.o ialloc.o \
 		indirect.o inline.o inode.o ioctl.o mballoc.o migrate.o \
-		mmp.o move_extent.o namei.o page-io.o readpage.o resize.o \
+		mmp.o move_extent.o namei.o page-io.o resize.o \
 		super.o symlink.o sysfs.o xattr.o xattr_trusted.o xattr_user.o
 
 ext4-$(CONFIG_EXT4_FS_POSIX_ACL)	+= acl.o
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 58597db621e1..a1136faed9d3 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -3361,8 +3361,7 @@ static int ext4_readpage(struct file *file, struct page *page)
 		ret = ext4_readpage_inline(inode, page);
 
 	if (ret == -EAGAIN)
-		return ext4_mpage_readpages(page->mapping, NULL, page, 1,
-						false);
+		return mpage_readpage(page, ext4_get_block);
 
 	return ret;
 }
@@ -3377,7 +3376,7 @@ ext4_readpages(struct file *file, struct address_space *mapping,
 	if (ext4_has_inline_data(inode))
 		return 0;
 
-	return ext4_mpage_readpages(mapping, pages, NULL, nr_pages, true);
+	return mpage_readpages(mapping, pages, nr_pages, ext4_get_block);
 }
 
 static void ext4_invalidatepage(struct page *page, unsigned int offset,
diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
deleted file mode 100644
index 75cef6af6080..000000000000
--- a/fs/ext4/readpage.c
+++ /dev/null
@@ -1,295 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * linux/fs/ext4/readpage.c
- *
- * Copyright (C) 2002, Linus Torvalds.
- * Copyright (C) 2015, Google, Inc.
- *
- * This was originally taken from fs/mpage.c
- *
- * The intent is the ext4_mpage_readpages() function here is intended
- * to replace mpage_readpages() in the general case, not just for
- * encrypted files.  It has some limitations (see below), where it
- * will fall back to read_block_full_page(), but these limitations
- * should only be hit when page_size != block_size.
- *
- * This will allow us to attach a callback function to support ext4
- * encryption.
- *
- * If anything unusual happens, such as:
- *
- * - encountering a page which has buffers
- * - encountering a page which has a non-hole after a hole
- * - encountering a page with non-contiguous blocks
- *
- * then this code just gives up and calls the buffer_head-based read function.
- * It does handle a page which has holes at the end - that is a common case:
- * the end-of-file on blocksize < PAGE_SIZE setups.
- *
- */
-
-#include <linux/kernel.h>
-#include <linux/export.h>
-#include <linux/mm.h>
-#include <linux/kdev_t.h>
-#include <linux/gfp.h>
-#include <linux/bio.h>
-#include <linux/fs.h>
-#include <linux/buffer_head.h>
-#include <linux/blkdev.h>
-#include <linux/highmem.h>
-#include <linux/prefetch.h>
-#include <linux/mpage.h>
-#include <linux/writeback.h>
-#include <linux/backing-dev.h>
-#include <linux/pagevec.h>
-#include <linux/cleancache.h>
-
-#include "ext4.h"
-
-static inline bool ext4_bio_encrypted(struct bio *bio)
-{
-#ifdef CONFIG_FS_ENCRYPTION
-	return unlikely(bio->bi_private != NULL);
-#else
-	return false;
-#endif
-}
-
-/*
- * I/O completion handler for multipage BIOs.
- *
- * The mpage code never puts partial pages into a BIO (except for end-of-file).
- * If a page does not map to a contiguous run of blocks then it simply falls
- * back to block_read_full_page().
- *
- * Why is this?  If a page's completion depends on a number of different BIOs
- * which can complete in any order (or at the same time) then determining the
- * status of that page is hard.  See end_buffer_async_read() for the details.
- * There is no point in duplicating all that complexity.
- */
-static void mpage_end_io(struct bio *bio)
-{
-	struct bio_vec *bv;
-	int i;
-	struct bvec_iter_all iter_all;
-
-	if (ext4_bio_encrypted(bio)) {
-		if (bio->bi_status) {
-			fscrypt_release_ctx(bio->bi_private);
-		} else {
-			fscrypt_enqueue_decrypt_bio(bio->bi_private, bio);
-			return;
-		}
-	}
-	bio_for_each_segment_all(bv, bio, i, iter_all) {
-		struct page *page = bv->bv_page;
-
-		if (!bio->bi_status) {
-			SetPageUptodate(page);
-		} else {
-			ClearPageUptodate(page);
-			SetPageError(page);
-		}
-		unlock_page(page);
-	}
-
-	bio_put(bio);
-}
-
-int ext4_mpage_readpages(struct address_space *mapping,
-			 struct list_head *pages, struct page *page,
-			 unsigned nr_pages, bool is_readahead)
-{
-	struct bio *bio = NULL;
-	sector_t last_block_in_bio = 0;
-
-	struct inode *inode = mapping->host;
-	const unsigned blkbits = inode->i_blkbits;
-	const unsigned blocks_per_page = PAGE_SIZE >> blkbits;
-	const unsigned blocksize = 1 << blkbits;
-	sector_t block_in_file;
-	sector_t last_block;
-	sector_t last_block_in_file;
-	sector_t blocks[MAX_BUF_PER_PAGE];
-	unsigned page_block;
-	struct block_device *bdev = inode->i_sb->s_bdev;
-	int length;
-	unsigned relative_block = 0;
-	struct ext4_map_blocks map;
-
-	map.m_pblk = 0;
-	map.m_lblk = 0;
-	map.m_len = 0;
-	map.m_flags = 0;
-
-	for (; nr_pages; nr_pages--) {
-		int fully_mapped = 1;
-		unsigned first_hole = blocks_per_page;
-
-		prefetchw(&page->flags);
-		if (pages) {
-			page = lru_to_page(pages);
-			list_del(&page->lru);
-			if (add_to_page_cache_lru(page, mapping, page->index,
-				  readahead_gfp_mask(mapping)))
-				goto next_page;
-		}
-
-		if (page_has_buffers(page))
-			goto confused;
-
-		block_in_file = (sector_t)page->index << (PAGE_SHIFT - blkbits);
-		last_block = block_in_file + nr_pages * blocks_per_page;
-		last_block_in_file = (i_size_read(inode) + blocksize - 1) >> blkbits;
-		if (last_block > last_block_in_file)
-			last_block = last_block_in_file;
-		page_block = 0;
-
-		/*
-		 * Map blocks using the previous result first.
-		 */
-		if ((map.m_flags & EXT4_MAP_MAPPED) &&
-		    block_in_file > map.m_lblk &&
-		    block_in_file < (map.m_lblk + map.m_len)) {
-			unsigned map_offset = block_in_file - map.m_lblk;
-			unsigned last = map.m_len - map_offset;
-
-			for (relative_block = 0; ; relative_block++) {
-				if (relative_block == last) {
-					/* needed? */
-					map.m_flags &= ~EXT4_MAP_MAPPED;
-					break;
-				}
-				if (page_block == blocks_per_page)
-					break;
-				blocks[page_block] = map.m_pblk + map_offset +
-					relative_block;
-				page_block++;
-				block_in_file++;
-			}
-		}
-
-		/*
-		 * Then do more ext4_map_blocks() calls until we are
-		 * done with this page.
-		 */
-		while (page_block < blocks_per_page) {
-			if (block_in_file < last_block) {
-				map.m_lblk = block_in_file;
-				map.m_len = last_block - block_in_file;
-
-				if (ext4_map_blocks(NULL, inode, &map, 0) < 0) {
-				set_error_page:
-					SetPageError(page);
-					zero_user_segment(page, 0,
-							  PAGE_SIZE);
-					unlock_page(page);
-					goto next_page;
-				}
-			}
-			if ((map.m_flags & EXT4_MAP_MAPPED) == 0) {
-				fully_mapped = 0;
-				if (first_hole == blocks_per_page)
-					first_hole = page_block;
-				page_block++;
-				block_in_file++;
-				continue;
-			}
-			if (first_hole != blocks_per_page)
-				goto confused;		/* hole -> non-hole */
-
-			/* Contiguous blocks? */
-			if (page_block && blocks[page_block-1] != map.m_pblk-1)
-				goto confused;
-			for (relative_block = 0; ; relative_block++) {
-				if (relative_block == map.m_len) {
-					/* needed? */
-					map.m_flags &= ~EXT4_MAP_MAPPED;
-					break;
-				} else if (page_block == blocks_per_page)
-					break;
-				blocks[page_block] = map.m_pblk+relative_block;
-				page_block++;
-				block_in_file++;
-			}
-		}
-		if (first_hole != blocks_per_page) {
-			zero_user_segment(page, first_hole << blkbits,
-					  PAGE_SIZE);
-			if (first_hole == 0) {
-				SetPageUptodate(page);
-				unlock_page(page);
-				goto next_page;
-			}
-		} else if (fully_mapped) {
-			SetPageMappedToDisk(page);
-		}
-		if (fully_mapped && blocks_per_page == 1 &&
-		    !PageUptodate(page) && cleancache_get_page(page) == 0) {
-			SetPageUptodate(page);
-			goto confused;
-		}
-
-		/*
-		 * This page will go to BIO.  Do we need to send this
-		 * BIO off first?
-		 */
-		if (bio && (last_block_in_bio != blocks[0] - 1)) {
-		submit_and_realloc:
-			submit_bio(bio);
-			bio = NULL;
-		}
-		if (bio == NULL) {
-			struct fscrypt_ctx *ctx = NULL;
-
-			if (IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode)) {
-				ctx = fscrypt_get_ctx(GFP_NOFS);
-				if (IS_ERR(ctx))
-					goto set_error_page;
-			}
-			bio = bio_alloc(GFP_KERNEL,
-				min_t(int, nr_pages, BIO_MAX_PAGES));
-			if (!bio) {
-				if (ctx)
-					fscrypt_release_ctx(ctx);
-				goto set_error_page;
-			}
-			bio_set_dev(bio, bdev);
-			bio->bi_iter.bi_sector = blocks[0] << (blkbits - 9);
-			bio->bi_end_io = mpage_end_io;
-			bio->bi_private = ctx;
-			bio_set_op_attrs(bio, REQ_OP_READ,
-						is_readahead ? REQ_RAHEAD : 0);
-		}
-
-		length = first_hole << blkbits;
-		if (bio_add_page(bio, page, length, 0) < length)
-			goto submit_and_realloc;
-
-		if (((map.m_flags & EXT4_MAP_BOUNDARY) &&
-		     (relative_block == map.m_len)) ||
-		    (first_hole != blocks_per_page)) {
-			submit_bio(bio);
-			bio = NULL;
-		} else
-			last_block_in_bio = blocks[blocks_per_page - 1];
-		goto next_page;
-	confused:
-		if (bio) {
-			submit_bio(bio);
-			bio = NULL;
-		}
-		if (!PageUptodate(page))
-			block_read_full_page(page, ext4_get_block);
-		else
-			unlock_page(page);
-	next_page:
-		if (pages)
-			put_page(page);
-	}
-	BUG_ON(pages && !list_empty(pages));
-	if (bio)
-		submit_bio(bio);
-	return 0;
-}
-- 
2.19.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
