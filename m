Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB951319EB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Jan 2020 21:55:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ioZPb-0004rD-Os; Mon, 06 Jan 2020 20:55:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1ioZPZ-0004r5-Pu
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jan 2020 20:55:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/ny53wQaDi6EghNUDk1MaSNSUEBnOGZOWs6sRd7PbC4=; b=GORZRt1+lSjMQnSgUEbeQxEkK9
 FnoUqHzoi9nIg2hrOxwCHy4p5moFZsUiOHqYpim+znzNzEAQLdHg3kjndvNvoVMGLKkQKr5hU5i7h
 ukKvUWOYwgVt42BUw5N/DaoOZO60B7BHlXdHzNusRGRALHlkpvc1u1EF28Bwg+TB2H5A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/ny53wQaDi6EghNUDk1MaSNSUEBnOGZOWs6sRd7PbC4=; b=J
 Hap7YAHtqnSXOibx2onid8qXmz2ptcb3c6jV1KaGzIwIQm166XfUabqxH7lFMpO1HmpuB3VzP+oqA
 LoTftilKlvBUm/UGB6UHABffp65miy2Isun8hEgREzSPep6xyWh+BKiaW1NeD/QkqPj91p3cWp5U+
 kQkuZ+v/3/viPj08=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ioZPX-00CfcU-7k
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 06 Jan 2020 20:55:41 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7CCB421744;
 Mon,  6 Jan 2020 20:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578344129;
 bh=kW5r3TTOvw2fhWdsBHqTPBz9cXiYc6F6OHacBGg7mmM=;
 h=From:To:Cc:Subject:Date:From;
 b=OVwrc5dWmSj7Mr17WNkl9wL+hRN8cOYwf/PnWMvL0SfeRQSbTusLIY8yoQTp12sbu
 AbHU8bKDAfxy4/x2ywx8HKgXlvg9EbblKs3iFC18hihXbYzxOGSvojHevxzbrkmMAh
 rLzzV5sagTQImuaiJ1wAGhabgsPW56Y/9xK7QiLA=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon,  6 Jan 2020 12:54:10 -0800
Message-Id: <20200106205410.136707-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ioZPX-00CfcU-7k
Subject: [f2fs-dev] [PATCH v3] fs-verity: implement readahead for
 FS_IOC_ENABLE_VERITY
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Victor Hsieh <victorhsieh@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

When it builds the first level of the Merkle tree, FS_IOC_ENABLE_VERITY
sequentially reads each page of the file using read_mapping_page().
This works fine if the file's data is already in pagecache, which should
normally be the case, since this ioctl is normally used immediately
after writing out the file.

But in any other case this implementation performs very poorly, since
only one page is read at a time.

Fix this by implementing readahead using the functions from
mm/readahead.c.

This improves performance in the uncached case by about 20x, as seen in
the following benchmarks done on a 250MB file (on x86_64 with SHA-NI):

    FS_IOC_ENABLE_VERITY uncached (before) 3.299s
    FS_IOC_ENABLE_VERITY uncached (after)  0.160s
    FS_IOC_ENABLE_VERITY cached            0.147s
    sha256sum uncached                     0.191s
    sha256sum cached                       0.145s

Note: we could instead switch to kernel_read().  But that would mean
we'd no longer be hashing the data directly from the pagecache, which is
a nice optimization of its own.  And using kernel_read() would require
allocating another temporary buffer, hashing the data and tree pages
separately, and explicitly zero-padding the last page -- so it wouldn't
really be any simpler than direct pagecache access, at least for now.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---

Changed v2 => v3:
  - Ensure that the pages continue being marked accessed when they're
    already cached and Uptodate.

Changed v1 => v2:
  - Only do sync readahead when the page wasn't found in the pagecache
    at all.
  - Use ->f_mapping so that the inode doesn't have to be passed.

 fs/verity/enable.c | 45 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 39 insertions(+), 6 deletions(-)

diff --git a/fs/verity/enable.c b/fs/verity/enable.c
index b79e3fd19d115..9c93c17f1c1cd 100644
--- a/fs/verity/enable.c
+++ b/fs/verity/enable.c
@@ -13,13 +13,42 @@
 #include <linux/sched/signal.h>
 #include <linux/uaccess.h>
 
-static int build_merkle_tree_level(struct inode *inode, unsigned int level,
+/*
+ * Read a file data page for Merkle tree construction.  Do aggressive readahead,
+ * since we're sequentially reading the entire file.
+ */
+static struct page *read_file_data_page(struct file *filp, pgoff_t index,
+					struct file_ra_state *ra,
+					unsigned long remaining_pages)
+{
+	struct page *page;
+
+	page = find_get_page_flags(filp->f_mapping, index, FGP_ACCESSED);
+	if (!page || !PageUptodate(page)) {
+		if (page)
+			put_page(page);
+		else
+			page_cache_sync_readahead(filp->f_mapping, ra, filp,
+						  index, remaining_pages);
+		page = read_mapping_page(filp->f_mapping, index, NULL);
+		if (IS_ERR(page))
+			return page;
+	}
+	if (PageReadahead(page))
+		page_cache_async_readahead(filp->f_mapping, ra, filp, page,
+					   index, remaining_pages);
+	return page;
+}
+
+static int build_merkle_tree_level(struct file *filp, unsigned int level,
 				   u64 num_blocks_to_hash,
 				   const struct merkle_tree_params *params,
 				   u8 *pending_hashes,
 				   struct ahash_request *req)
 {
+	struct inode *inode = file_inode(filp);
 	const struct fsverity_operations *vops = inode->i_sb->s_vop;
+	struct file_ra_state ra = { 0 };
 	unsigned int pending_size = 0;
 	u64 dst_block_num;
 	u64 i;
@@ -36,6 +65,8 @@ static int build_merkle_tree_level(struct inode *inode, unsigned int level,
 		dst_block_num = 0; /* unused */
 	}
 
+	file_ra_state_init(&ra, filp->f_mapping);
+
 	for (i = 0; i < num_blocks_to_hash; i++) {
 		struct page *src_page;
 
@@ -45,7 +76,8 @@ static int build_merkle_tree_level(struct inode *inode, unsigned int level,
 
 		if (level == 0) {
 			/* Leaf: hashing a data block */
-			src_page = read_mapping_page(inode->i_mapping, i, NULL);
+			src_page = read_file_data_page(filp, i, &ra,
+						       num_blocks_to_hash - i);
 			if (IS_ERR(src_page)) {
 				err = PTR_ERR(src_page);
 				fsverity_err(inode,
@@ -103,17 +135,18 @@ static int build_merkle_tree_level(struct inode *inode, unsigned int level,
 }
 
 /*
- * Build the Merkle tree for the given inode using the given parameters, and
+ * Build the Merkle tree for the given file using the given parameters, and
  * return the root hash in @root_hash.
  *
  * The tree is written to a filesystem-specific location as determined by the
  * ->write_merkle_tree_block() method.  However, the blocks that comprise the
  * tree are the same for all filesystems.
  */
-static int build_merkle_tree(struct inode *inode,
+static int build_merkle_tree(struct file *filp,
 			     const struct merkle_tree_params *params,
 			     u8 *root_hash)
 {
+	struct inode *inode = file_inode(filp);
 	u8 *pending_hashes;
 	struct ahash_request *req;
 	u64 blocks;
@@ -139,7 +172,7 @@ static int build_merkle_tree(struct inode *inode,
 	blocks = (inode->i_size + params->block_size - 1) >>
 		 params->log_blocksize;
 	for (level = 0; level <= params->num_levels; level++) {
-		err = build_merkle_tree_level(inode, level, blocks, params,
+		err = build_merkle_tree_level(filp, level, blocks, params,
 					      pending_hashes, req);
 		if (err)
 			goto out;
@@ -227,7 +260,7 @@ static int enable_verity(struct file *filp,
 	 */
 	pr_debug("Building Merkle tree...\n");
 	BUILD_BUG_ON(sizeof(desc->root_hash) < FS_VERITY_MAX_DIGEST_SIZE);
-	err = build_merkle_tree(inode, &params, desc->root_hash);
+	err = build_merkle_tree(filp, &params, desc->root_hash);
 	if (err) {
 		fsverity_err(inode, "Error %d building Merkle tree", err);
 		goto rollback;
-- 
2.24.1.735.g03f4e72817-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
