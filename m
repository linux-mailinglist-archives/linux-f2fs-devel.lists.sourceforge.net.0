Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBG/OP4qemmi3gEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jan 2026 16:27:58 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB86A3CA6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jan 2026 16:27:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=byaCZ5WGrgwgD8se6aVNthrDfKkk7dIxlGZZs9NZNdA=; b=BW1kX0qexkT75FrLvFg22v9EfK
	Tm8x5tJjAxiTZPUJllqxJVKtwBhG7Lr9lwitgNL8xbGyUjoVlYCEI4hMbH/yIq5NCZsOBgoeH062+
	zrf4XHvVLKIa26wv0IzTZtDnXVVy6xa8M1yY5l+LQLB4rsqhTOTrCbl6C8sRoCS8yKNY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vl7SR-0005Ay-2W;
	Wed, 28 Jan 2026 15:27:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+97ec6e74097c8d3e794e+8193+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vl7SP-0005AA-AH for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 15:27:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EiKXLd9XsLBppTPWc9UYhSRwxVFJDRBS+GCO7L+kMck=; b=KjzAhBKSS6+EAiSpNDVg7S/QCx
 6q9sJVdUFwkwPVJdZ6z8mmCS77xJ0If5RO/mL2ltLVy1YFB+fIN0DkjUJ8DElY3v2KLcAYHbOvoDY
 yKDLMFTTBxMjLiN7uCte1TfO04QF4u60bniRVo3DR6hfiELcc0mSDjRF1fhOjSQaH218=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EiKXLd9XsLBppTPWc9UYhSRwxVFJDRBS+GCO7L+kMck=; b=mgbYgu1JCYSW8+2dtWa+mKBEcI
 QgM04gfMLObuAFTeG+xkcLUDaPDefkA2KWNxeR0P22RlfLEkiPZyCevBuzghQhJsuP+we6JW43yuH
 cxkfzdSzA+ummvzUqJPQqwU14cI1YSQwmZij/LSJ9bGTnKUcxA3qFLi7C840ftkuG2ck=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vl7S3-0002TZ-Ks for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 15:27:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=EiKXLd9XsLBppTPWc9UYhSRwxVFJDRBS+GCO7L+kMck=; b=pTxuyJX/Dsz1aM7SylZtiU31XQ
 p0wnVieDKB6TYAzfqc+X6VVQHfNf6wzjrERdpbLR9YSmIFdz0b6bAsD6yovV3Vc1IM45OG14+cTAM
 dFqpXQHnQhaVswO+6NzD8sN5rTfUGmqGY34GCRnP+4Y5eC3na38IfVUL6mMPejzaFp04AW9/HXNdU
 94LQuYauvymdoyGAvftOc1bQ6kylFhUOEy69i0LKm8JZCjzGM/HM9psauezbhRvpx9v6aHBIq3I+2
 Z46B1dBPCBg6dOQAcx2/LZI0i/j4N4jsR21HnTMnItdxtFOJa55UMQScdIpd0DUO/SekM6dbLbLS+
 efRKpGnQ==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vl7Rt-0000000GHP4-44Vf; Wed, 28 Jan 2026 15:27:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Wed, 28 Jan 2026 16:26:17 +0100
Message-ID: <20260128152630.627409-6-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260128152630.627409-1-hch@lst.de>
References: <20260128152630.627409-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This will make an iomap implementation of the method easier.
 Signed-off-by: Christoph Hellwig <hch@lst.de> Reviewed-by: Andrey Albershteyn
 <aalbersh@redhat.com> Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
 Acked-by: David Sterba <dsterba@suse.com> [btrfs] [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vl7S3-0002TZ-Ks
Subject: [f2fs-dev] [PATCH 05/15] fsverity: pass struct file to
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
 Theodore Ts'o <tytso@mit.edu>, "Darrick J. Wong" <djwong@kernel.org>,
 Andrey Albershteyn <aalbersh@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:djwong@kernel.org,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[15];
	ARC_NA(0.00)[];
	ASN_FAIL(0.00)[7.38.105.216.asn.rspamd.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lst.de:mid,lst.de:email,suse.com:email]
X-Rspamd-Queue-Id: DAB86A3CA6
X-Rspamd-Action: no action

This will make an iomap implementation of the method easier.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Andrey Albershteyn <aalbersh@redhat.com>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
Acked-by: David Sterba <dsterba@suse.com> [btrfs]
---
 fs/btrfs/verity.c        | 5 +++--
 fs/ext4/verity.c         | 6 +++---
 fs/f2fs/verity.c         | 6 +++---
 fs/verity/enable.c       | 9 +++++----
 include/linux/fsverity.h | 4 ++--
 5 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/fs/btrfs/verity.c b/fs/btrfs/verity.c
index a2ac3fb68bc8..e7643c22a6bf 100644
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
index 415d9c4d8a32..2ce4cf8a1e31 100644
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
index 05b935b55216..c1c4d8044681 100644
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
index 95ec42b84797..c56c18e2605b 100644
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
index ea1ed2e6c2f9..e22cf84fe83a 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -116,7 +116,7 @@ struct fsverity_operations {
 	/**
 	 * Write a Merkle tree block to the given inode.
 	 *
-	 * @inode: the inode for which the Merkle tree is being built
+	 * @file: the file for which the Merkle tree is being built
 	 * @buf: the Merkle tree block to write
 	 * @pos: the position of the block in the Merkle tree (in bytes)
 	 * @size: the Merkle tree block size (in bytes)
@@ -126,7 +126,7 @@ struct fsverity_operations {
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
