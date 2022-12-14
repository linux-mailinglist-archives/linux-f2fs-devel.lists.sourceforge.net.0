Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5F364D28E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Dec 2022 23:46:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p5aVt-00083U-Ku;
	Wed, 14 Dec 2022 22:46:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1p5aVb-00082t-4m
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Dec 2022 22:45:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jAC3Run/FyZ0KN4TslN13LqfMhLUjOxtWBS/Y5iAy5U=; b=cSnjHlpb4w2sA34CyjM8x5KZez
 xTBbd/DbVHSU6AaB4HiKA3ngAftIqK8l0c96MkvfwvVWMhESNmFFDY5kzdxrKEDb4ccYZ8u1HTzIW
 xgWTu9dgJJ1VcTywQ5yp9aNUVi7+c4fNF+PlYIy44jDcwUYOuoS8EMP7zgb2rNxbt3/E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jAC3Run/FyZ0KN4TslN13LqfMhLUjOxtWBS/Y5iAy5U=; b=Er6oIE9+EJsnP6r6kTqDKqe/9O
 DBwKXwdeRvaJp9S4/SjEK29ryx3JIgOcKByr8ZfZ8OzMhJHXXIzrmNS4NzT99Kz3G0IYJzEMKxU2b
 PamWxswwKxB3Pr5pBuhVEcqLyinHFYoHK19NC1FnaUjNr4XDBhSJGe4XuBMvDVotsrm8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p5aVa-0007Nf-1J for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Dec 2022 22:45:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B9E8EB81A43;
 Wed, 14 Dec 2022 22:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39162C433F2;
 Wed, 14 Dec 2022 22:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671057942;
 bh=wLd4hn46pl37ZdIHOsePkBTX5A4fW4nKrCWTow70H1c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RLzKHO/8H4DFa5Jdzylc7uSkoLeqo1P+7IkcEYelSvjKXJBSZCSw/dsiP2P4J6bru
 HJP+7eqBV3gjGjbKzQLbmH62xf3fKBic7MZ7SVt6gTwguX8OJLR42U13/8iZGiGmLT
 ftD8P/TNUJiYbOtFwwDmCGyELujl1rqHsakigMHzwm150wwK3p1atVuK7md8QKM+mU
 twO1HnAEk16YmYYAEn2Z0RR68mla+mCi7grgmc+UkLJZt7SoEaUJoJwd+LNQQj6bQQ
 00pECfnYN4UIHopU8jR4EAuCO0Y0SCBYU6lyJL7+ulx7qrpW/Syjh0uueGRx85E3PJ
 HrPI2wTur2dcw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Wed, 14 Dec 2022 14:43:04 -0800
Message-Id: <20221214224304.145712-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221214224304.145712-1-ebiggers@kernel.org>
References: <20221214224304.145712-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com>
 fsverity_operations::write_merkle_tree_block
 is passed the index of the block to write and the log base 2 of the block
 size. However, all implementations of it use these parameters only to calculate
 t [...] Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p5aVa-0007Nf-1J
Subject: [f2fs-dev] [PATCH 4/4] fsverity: pass pos and size to
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
Cc: linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>, linux-btrfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

fsverity_operations::write_merkle_tree_block is passed the index of the
block to write and the log base 2 of the block size.  However, all
implementations of it use these parameters only to calculate the
position and the size of the block, in bytes.

Therefore, make ->write_merkle_tree_block take 'pos' and 'size'
parameters instead of 'index' and 'log_blocksize'.

Suggested-by: Dave Chinner <david@fromorbit.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/btrfs/verity.c        | 19 +++++++------------
 fs/ext4/verity.c         |  6 +++---
 fs/f2fs/verity.c         |  6 +++---
 fs/verity/enable.c       |  4 ++--
 include/linux/fsverity.h |  8 ++++----
 5 files changed, 19 insertions(+), 24 deletions(-)

diff --git a/fs/btrfs/verity.c b/fs/btrfs/verity.c
index bf9eb693a6a7..c5ff16f9e9fa 100644
--- a/fs/btrfs/verity.c
+++ b/fs/btrfs/verity.c
@@ -783,30 +783,25 @@ static struct page *btrfs_read_merkle_tree_page(struct inode *inode,
 /*
  * fsverity op that writes a Merkle tree block into the btree.
  *
- * @inode:          inode to write a Merkle tree block for
- * @buf:            Merkle tree data block to write
- * @index:          index of the block in the Merkle tree
- * @log_blocksize:  log base 2 of the Merkle tree block size
- *
- * Note that the block size could be different from the page size, so it is not
- * safe to assume that index is a page index.
+ * @inode:	inode to write a Merkle tree block for
+ * @buf:	Merkle tree block to write
+ * @pos:	the position of the block in the Merkle tree (in bytes)
+ * @size:	the Merkle tree block size (in bytes)
  *
  * Returns 0 on success or negative error code on failure
  */
 static int btrfs_write_merkle_tree_block(struct inode *inode, const void *buf,
-					u64 index, int log_blocksize)
+					 u64 pos, unsigned int size)
 {
-	u64 off = index << log_blocksize;
-	u64 len = 1ULL << log_blocksize;
 	loff_t merkle_pos = merkle_file_pos(inode);
 
 	if (merkle_pos < 0)
 		return merkle_pos;
-	if (merkle_pos > inode->i_sb->s_maxbytes - off - len)
+	if (merkle_pos > inode->i_sb->s_maxbytes - pos - size)
 		return -EFBIG;
 
 	return write_key_bytes(BTRFS_I(inode), BTRFS_VERITY_MERKLE_ITEM_KEY,
-			       off, buf, len);
+			       pos, buf, size);
 }
 
 const struct fsverity_operations btrfs_verityops = {
diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
index 30e3b65798b5..e4da1704438e 100644
--- a/fs/ext4/verity.c
+++ b/fs/ext4/verity.c
@@ -381,11 +381,11 @@ static struct page *ext4_read_merkle_tree_page(struct inode *inode,
 }
 
 static int ext4_write_merkle_tree_block(struct inode *inode, const void *buf,
-					u64 index, int log_blocksize)
+					u64 pos, unsigned int size)
 {
-	loff_t pos = ext4_verity_metadata_pos(inode) + (index << log_blocksize);
+	pos += ext4_verity_metadata_pos(inode);
 
-	return pagecache_write(inode, buf, 1 << log_blocksize, pos);
+	return pagecache_write(inode, buf, size, pos);
 }
 
 const struct fsverity_operations ext4_verityops = {
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index c352fff88a5e..f320ed8172ec 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -276,11 +276,11 @@ static struct page *f2fs_read_merkle_tree_page(struct inode *inode,
 }
 
 static int f2fs_write_merkle_tree_block(struct inode *inode, const void *buf,
-					u64 index, int log_blocksize)
+					u64 pos, unsigned int size)
 {
-	loff_t pos = f2fs_verity_metadata_pos(inode) + (index << log_blocksize);
+	pos += f2fs_verity_metadata_pos(inode);
 
-	return pagecache_write(inode, buf, 1 << log_blocksize, pos);
+	return pagecache_write(inode, buf, size, pos);
 }
 
 const struct fsverity_operations f2fs_verityops = {
diff --git a/fs/verity/enable.c b/fs/verity/enable.c
index df6b499bf6a1..a949ce817202 100644
--- a/fs/verity/enable.c
+++ b/fs/verity/enable.c
@@ -120,8 +120,8 @@ static int build_merkle_tree_level(struct file *filp, unsigned int level,
 			       params->block_size - pending_size);
 			err = vops->write_merkle_tree_block(inode,
 					pending_hashes,
-					dst_block_num,
-					params->log_blocksize);
+					dst_block_num << params->log_blocksize,
+					params->block_size);
 			if (err) {
 				fsverity_err(inode,
 					     "Error %d writing Merkle tree block %llu",
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 203f4962c54a..f5ed7ecfd9ab 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -109,9 +109,9 @@ struct fsverity_operations {
 	 * Write a Merkle tree block to the given inode.
 	 *
 	 * @inode: the inode for which the Merkle tree is being built
-	 * @buf: block to write
-	 * @index: 0-based index of the block within the Merkle tree
-	 * @log_blocksize: log base 2 of the Merkle tree block size
+	 * @buf: the Merkle tree block to write
+	 * @pos: the position of the block in the Merkle tree (in bytes)
+	 * @size: the Merkle tree block size (in bytes)
 	 *
 	 * This is only called between ->begin_enable_verity() and
 	 * ->end_enable_verity().
@@ -119,7 +119,7 @@ struct fsverity_operations {
 	 * Return: 0 on success, -errno on failure
 	 */
 	int (*write_merkle_tree_block)(struct inode *inode, const void *buf,
-				       u64 index, int log_blocksize);
+				       u64 pos, unsigned int size);
 };
 
 #ifdef CONFIG_FS_VERITY
-- 
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
