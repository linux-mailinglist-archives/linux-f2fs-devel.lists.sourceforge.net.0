Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BA0D39E60
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 07:23:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qQC8W1YNySfJodHhgGtpDPQ16xcgNZxYm3t4wtmKJs=; b=VjWiWGGH0qoq4q/Nxi7M0eT7hf
	84ww5JpZOj26wymdeiwAiqLVL3OqdrIOI7yOuv3zKt0BAeAu+zf7bk6dxf7PZYwHM+Jt2N1akTZJr
	aZ1ILhee/iE0ykbbAfkTPKl4cwHpPZONKsnGgv+5Ywh+4pXyih2NsSXClDhKkmpfiBVg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhifr-0005Uu-Fw;
	Mon, 19 Jan 2026 06:23:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+f4f5ba1b7319529cbc9c+8184+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vhifp-0005Un-4o for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 06:23:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IlyUwc1mP9pL1SgxcpD6ik9XMxsk9b3WWjDEnoXnp6I=; b=Cbb079RFqSq/ZGOrrmKUxrdUpp
 vMGBW7DSL017DwAOVK2ByPt4na/LXr1xCnWINM/JZ2c9GHnRLwAyd1jsfFw5erhyJ/wBr93SetaeX
 QzNtDaYrxbCkDSky1xU2cFHNAcKqX23gvhi9ml3OYm+Ags1YkG4x2fbtB12GkFXs2D4Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IlyUwc1mP9pL1SgxcpD6ik9XMxsk9b3WWjDEnoXnp6I=; b=AwoZ81n1UO7ButKYDDzScigRDw
 pyqlrD6QVfbUWnUSun7rX43+e2a0wrOTc/Uw7Co+OCeTY25mcyv6ZLgAH4tNZkQmB//HfhTcdO5qq
 gFYolPO9J1jDQNtWhIo/gFbSODkNWe5OnrMUL8ozCpMZGTzB874tSe/z2fvZZv2eI7F8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhifo-0006gi-IT for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 06:23:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=IlyUwc1mP9pL1SgxcpD6ik9XMxsk9b3WWjDEnoXnp6I=; b=p5VkIJc13jggEAYsVa5jj2wAk2
 +n43xiI1J0oFZfHw3KMz5R1mZX52YA3ootKBI04jRX//zy8JrqFsryzyto6ywspxsUUfh+iHAecRe
 EKoy+t7v/88RqDKlEJUmcT2jhnlxjSoIRxl/QSCam8a+RvUlYtsWUY1IFg86op2puHDHRGq5398w4
 mfohWbLNHh/zkLomiNCd03/pyWXYsnUdG36LeETmaf/QxYlgaJXOlfIomsiNNczCTlvfuSz5Opsxz
 oSHtGpzgdr4p8/p8Bgb62GKskZyZEvH9gqTbfPQzG62WODLrohYsTc4vvNKKSTiWqPQOTE40kSdI5
 LqWMGsDA==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vhifb-00000001Ool-44WS; Mon, 19 Jan 2026 06:23:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon, 19 Jan 2026 07:22:46 +0100
Message-ID: <20260119062250.3998674-6-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119062250.3998674-1-hch@lst.de>
References: <20260119062250.3998674-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This will make an iomap implementation of the method easier.
 Signed-off-by: Christoph Hellwig <hch@lst.de> --- fs/btrfs/verity.c | 5 +++--
 fs/ext4/verity.c | 6 +++--- fs/f2fs/verity.c | 6 +++--- fs/verity/enable.c
 | 9 +++++---- include/linux/fsverity.h | 4 ++-- [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vhifo-0006gi-IT
Subject: [f2fs-dev] [PATCH 5/6] fsverity: pass struct file to
 ->write_merkle_tree_block
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This will make an iomap implementation of the method easier.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/btrfs/verity.c        | 5 +++--
 fs/ext4/verity.c         | 6 +++---
 fs/f2fs/verity.c         | 6 +++---
 fs/verity/enable.c       | 9 +++++----
 include/linux/fsverity.h | 4 ++--
 5 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/fs/btrfs/verity.c b/fs/btrfs/verity.c
index e79e67280a4b..8a4426f8b5fb 100644
--- a/fs/btrfs/verity.c
+++ b/fs/btrfs/verity.c
@@ -774,16 +774,17 @@ static struct page *btrfs_read_merkle_tree_page(struct inode *inode,
 /*
  * fsverity op that writes a Merkle tree block into the btree.
  *
- * @inode:	inode to write a Merkle tree block for
+ * @file:	file to write a Merkle tree block for
  * @buf:	Merkle tree block to write
  * @pos:	the position of the block in the Merkle tree (in bytes)
  * @size:	the Merkle tree block size (in bytes)
  *
  * Returns 0 on success or negative error code on failure
  */
-static int btrfs_write_merkle_tree_block(struct inode *inode, const void *buf,
+static int btrfs_write_merkle_tree_block(struct file *file, const void *buf,
 					 u64 pos, unsigned int size)
 {
+	struct inode *inode = file_inode(file);
 	loff_t merkle_pos = merkle_file_pos(inode);
 
 	if (merkle_pos < 0)
diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
index 7a980a8059bd..2cd6fe2fbf64 100644
--- a/fs/ext4/verity.c
+++ b/fs/ext4/verity.c
@@ -380,12 +380,12 @@ static struct page *ext4_read_merkle_tree_page(struct inode *inode,
 	return folio_file_page(folio, index);
 }
 
-static int ext4_write_merkle_tree_block(struct inode *inode, const void *buf,
+static int ext4_write_merkle_tree_block(struct file *file, const void *buf,
 					u64 pos, unsigned int size)
 {
-	pos += ext4_verity_metadata_pos(inode);
+	pos += ext4_verity_metadata_pos(file_inode(file));
 
-	return pagecache_write(inode, buf, size, pos);
+	return pagecache_write(file_inode(file), buf, size, pos);
 }
 
 const struct fsverity_operations ext4_verityops = {
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index c30b70fbcc0d..4326fd72cc72 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -278,12 +278,12 @@ static struct page *f2fs_read_merkle_tree_page(struct inode *inode,
 	return folio_file_page(folio, index);
 }
 
-static int f2fs_write_merkle_tree_block(struct inode *inode, const void *buf,
+static int f2fs_write_merkle_tree_block(struct file *file, const void *buf,
 					u64 pos, unsigned int size)
 {
-	pos += f2fs_verity_metadata_pos(inode);
+	pos += f2fs_verity_metadata_pos(file_inode(file));
 
-	return pagecache_write(inode, buf, size, pos);
+	return pagecache_write(file_inode(file), buf, size, pos);
 }
 
 const struct fsverity_operations f2fs_verityops = {
diff --git a/fs/verity/enable.c b/fs/verity/enable.c
index 91cada0d455c..2a285b04e8d4 100644
--- a/fs/verity/enable.c
+++ b/fs/verity/enable.c
@@ -41,14 +41,15 @@ static int hash_one_block(const struct merkle_tree_params *params,
 	return 0;
 }
 
-static int write_merkle_tree_block(struct inode *inode, const u8 *buf,
+static int write_merkle_tree_block(struct file *file, const u8 *buf,
 				   unsigned long index,
 				   const struct merkle_tree_params *params)
 {
+	struct inode *inode = file_inode(file);
 	u64 pos = (u64)index << params->log_blocksize;
 	int err;
 
-	err = inode->i_sb->s_vop->write_merkle_tree_block(inode, buf, pos,
+	err = inode->i_sb->s_vop->write_merkle_tree_block(file, buf, pos,
 							  params->block_size);
 	if (err)
 		fsverity_err(inode, "Error %d writing Merkle tree block %lu",
@@ -135,7 +136,7 @@ static int build_merkle_tree(struct file *filp,
 			err = hash_one_block(params, &buffers[level]);
 			if (err)
 				goto out;
-			err = write_merkle_tree_block(inode,
+			err = write_merkle_tree_block(filp,
 						      buffers[level].data,
 						      level_offset[level],
 						      params);
@@ -155,7 +156,7 @@ static int build_merkle_tree(struct file *filp,
 			err = hash_one_block(params, &buffers[level]);
 			if (err)
 				goto out;
-			err = write_merkle_tree_block(inode,
+			err = write_merkle_tree_block(filp,
 						      buffers[level].data,
 						      level_offset[level],
 						      params);
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 27abf5b867bb..deb6b2303d64 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -109,7 +109,7 @@ struct fsverity_operations {
 	/**
 	 * Write a Merkle tree block to the given inode.
 	 *
-	 * @inode: the inode for which the Merkle tree is being built
+	 * @file: the file for which the Merkle tree is being built
 	 * @buf: the Merkle tree block to write
 	 * @pos: the position of the block in the Merkle tree (in bytes)
 	 * @size: the Merkle tree block size (in bytes)
@@ -119,7 +119,7 @@ struct fsverity_operations {
 	 *
 	 * Return: 0 on success, -errno on failure
 	 */
-	int (*write_merkle_tree_block)(struct inode *inode, const void *buf,
+	int (*write_merkle_tree_block)(struct file *file, const void *buf,
 				       u64 pos, unsigned int size);
 };
 
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
