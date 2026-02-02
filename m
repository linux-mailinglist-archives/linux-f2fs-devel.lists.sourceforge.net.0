Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPeAHGU/gGlH5QIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Feb 2026 07:08:37 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA60C87D9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Feb 2026 07:08:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awr7o7mutLMl5Zxoum/LxF9oM1MDvqv/w0KW1ya7JMg=; b=lcLpCgpSpjV0yKCNGSx+6J0RT4
	YJ7Nd8J89RFb1ErNBP3pILQjegVZxIsRGs79A0KyAvivYU5t7amTrafdrMOlF3AH4HC00fMZYbkiz
	SKV7SrAG5PF2de7SUgne2hGZJD5YhEKeMOBSitWiogMjSU7q1qeblLvGklCVCU81SRt0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vmn6x-00010G-HD;
	Mon, 02 Feb 2026 06:08:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+1250474bd6e1e3d30609+8198+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vmn6w-000109-Gd for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Feb 2026 06:08:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XzLUOvjbAWz5VYrGbg2Mbqr4d5UtERwIu3MDXr1TrE0=; b=Sstpsqh3SbY60pgHIzfx1rII8w
 knWA8VS13PFSyZ+tC4zFCqiZKVhfEbaCHBRM3b7AhwCOgKztNfiggF2R1cak5wMDcaetVIQynBcSb
 kJl8i08wDEN+KI78DyRwfTaOgdhYYExgpCtyYKDVJRWb8Ko4CB6RD/7CkblN3T0N8o6s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XzLUOvjbAWz5VYrGbg2Mbqr4d5UtERwIu3MDXr1TrE0=; b=i0oDBspq70rWUsVRxi9IoQdc2R
 FiK38v+eSKPo7qr6FsL5dBmhelq/iwMfCuZPRf33yuUkzZ0sqRO6aTVJSCB83GAs0mwBCh1DLaGMi
 gOp687D/XyV0+lJO8kNtl7e7pUOL9BZUZq5PJWXSKi2GSugEqQp1CT95JcU1Bcr1oUxM=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vmn6v-0007qF-5Y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Feb 2026 06:08:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=XzLUOvjbAWz5VYrGbg2Mbqr4d5UtERwIu3MDXr1TrE0=; b=d/8JcyKtojya1ZmoTzVfP2HVed
 TaYdeVo93siTABzQNbwfzpG/XLGy5XzNqr8LSxWpNPnK+fx0e3vtkr8PrCoLaYgEmhjEn6dqM/8uG
 K5L+zKhLkDXjHuSu88eIF8L2G1TqJYLI5W3q741rLTN8CWQwQb1DYvfM5FPtDhH08xioguy9cwkyJ
 Y6JdMrR1QjbBvlxfh7nMrHmMKO+bpajWiBTvpviDpiYeDXbzf2MPuZyrLQnjyx/qzo0JkK7nFpi1K
 2xpaug78wPbbduOZ7GKrtHMY0lFcQJDOQ9gwrCycxSqsyF2KpvIIXaZMpKV+aWwLqiM9+huLf+h0x
 UYaBgnsg==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vmn6h-00000004Uk6-1uj1; Mon, 02 Feb 2026 06:08:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon,  2 Feb 2026 07:06:33 +0100
Message-ID: <20260202060754.270269-5-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260202060754.270269-1-hch@lst.de>
References: <20260202060754.270269-1-hch@lst.de>
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
 Content preview: Currently all reads of the fsverity hashes is kicked off from
 the data I/O completion handler, leading to needlessly dependent I/O. This
 is worked around a bit by performing readahead on the level 0 n [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vmn6v-0007qF-5Y
Subject: [f2fs-dev] [PATCH 04/11] fsverity: kick off hash readahead at data
 I/O submission time
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
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email]
X-Rspamd-Queue-Id: CFA60C87D9
X-Rspamd-Action: no action

Currently all reads of the fsverity hashes is kicked off from the data
I/O completion handler, leading to needlessly dependent I/O.  This is
worked around a bit by performing readahead on the level 0 nodes, but
still fairly ineffective.

Switch to a model where the ->read_folio and ->readahead methods instead
kick off explicit readahead of the fsverity hashed so they are usually
available at I/O completion time.

For 64k sequential reads on my test VM this improves read performance
from 2.4GB/s - 2.6GB/s to 3.5GB/s - 3.9GB/s.  The improvements for
random reads are likely to be even bigger.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: David Sterba <dsterba@suse.com> [btrfs]
---
 fs/btrfs/verity.c         |  4 +-
 fs/ext4/readpage.c        | 17 ++++++---
 fs/ext4/verity.c          | 13 +++++--
 fs/f2fs/data.c            | 17 ++++++---
 fs/f2fs/verity.c          | 13 +++++--
 fs/verity/pagecache.c     | 44 +++++++++++++++-------
 fs/verity/read_metadata.c | 19 +++++++---
 fs/verity/verify.c        | 77 ++++++++++++++++++++++++++-------------
 include/linux/fsverity.h  | 30 +++++++++++----
 9 files changed, 161 insertions(+), 73 deletions(-)

diff --git a/fs/btrfs/verity.c b/fs/btrfs/verity.c
index e7643c22a6bf..c152bef71e8b 100644
--- a/fs/btrfs/verity.c
+++ b/fs/btrfs/verity.c
@@ -697,7 +697,6 @@ int btrfs_get_verity_descriptor(struct inode *inode, void *buf, size_t buf_size)
  *
  * @inode:         inode to read a merkle tree page for
  * @index:         page index relative to the start of the merkle tree
- * @num_ra_pages:  number of pages to readahead. Optional, we ignore it
  *
  * The Merkle tree is stored in the filesystem btree, but its pages are cached
  * with a logical position past EOF in the inode's mapping.
@@ -705,8 +704,7 @@ int btrfs_get_verity_descriptor(struct inode *inode, void *buf, size_t buf_size)
  * Returns the page we read, or an ERR_PTR on error.
  */
 static struct page *btrfs_read_merkle_tree_page(struct inode *inode,
-						pgoff_t index,
-						unsigned long num_ra_pages)
+						pgoff_t index)
 {
 	struct folio *folio;
 	u64 off = (u64)index << PAGE_SHIFT;
diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index bf84952ebf94..8438b14da37a 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -397,18 +397,20 @@ static int ext4_mpage_readpages(struct inode *inode,
 
 int ext4_read_folio(struct file *file, struct folio *folio)
 {
-	int ret = -EAGAIN;
 	struct inode *inode = folio->mapping->host;
+	int ret;
 
 	trace_ext4_read_folio(inode, folio);
 
-	if (ext4_has_inline_data(inode))
+	if (ext4_has_inline_data(inode)) {
 		ret = ext4_readpage_inline(inode, folio);
+		if (ret != -EAGAIN)
+			return ret;
+	}
 
-	if (ret == -EAGAIN)
-		return ext4_mpage_readpages(inode, NULL, folio);
-
-	return ret;
+	if (ext4_need_verity(inode, folio->index))
+		fsverity_readahead(inode, folio->index, folio_nr_pages(folio));
+	return ext4_mpage_readpages(inode, NULL, folio);
 }
 
 void ext4_readahead(struct readahead_control *rac)
@@ -419,6 +421,9 @@ void ext4_readahead(struct readahead_control *rac)
 	if (ext4_has_inline_data(inode))
 		return;
 
+	if (ext4_need_verity(inode, readahead_index(rac)))
+		fsverity_readahead(inode, readahead_index(rac),
+				   readahead_count(rac));
 	ext4_mpage_readpages(inode, rac, NULL);
 }
 
diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
index a071860ad36a..54ae4d4a176c 100644
--- a/fs/ext4/verity.c
+++ b/fs/ext4/verity.c
@@ -358,11 +358,17 @@ static int ext4_get_verity_descriptor(struct inode *inode, void *buf,
 }
 
 static struct page *ext4_read_merkle_tree_page(struct inode *inode,
-					       pgoff_t index,
-					       unsigned long num_ra_pages)
+					       pgoff_t index)
 {
 	index += ext4_verity_metadata_pos(inode) >> PAGE_SHIFT;
-	return generic_read_merkle_tree_page(inode, index, num_ra_pages);
+	return generic_read_merkle_tree_page(inode, index);
+}
+
+static void ext4_readahead_merkle_tree(struct inode *inode, pgoff_t index,
+		unsigned long nr_pages)
+{
+	index += ext4_verity_metadata_pos(inode) >> PAGE_SHIFT;
+	generic_readahead_merkle_tree(inode, index, nr_pages);
 }
 
 static int ext4_write_merkle_tree_block(struct file *file, const void *buf,
@@ -380,5 +386,6 @@ const struct fsverity_operations ext4_verityops = {
 	.end_enable_verity	= ext4_end_enable_verity,
 	.get_verity_descriptor	= ext4_get_verity_descriptor,
 	.read_merkle_tree_page	= ext4_read_merkle_tree_page,
+	.readahead_merkle_tree	= ext4_readahead_merkle_tree,
 	.write_merkle_tree_block = ext4_write_merkle_tree_block,
 };
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c30e69392a62..58d8a311ef2c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2458,7 +2458,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
 static int f2fs_read_data_folio(struct file *file, struct folio *folio)
 {
 	struct inode *inode = folio->mapping->host;
-	int ret = -EAGAIN;
+	int ret;
 
 	trace_f2fs_readpage(folio, DATA);
 
@@ -2468,11 +2468,15 @@ static int f2fs_read_data_folio(struct file *file, struct folio *folio)
 	}
 
 	/* If the file has inline data, try to read it directly */
-	if (f2fs_has_inline_data(inode))
+	if (f2fs_has_inline_data(inode)) {
 		ret = f2fs_read_inline_data(inode, folio);
-	if (ret == -EAGAIN)
-		ret = f2fs_mpage_readpages(inode, NULL, folio);
-	return ret;
+		if (ret != -EAGAIN)
+			return ret;
+	}
+
+	if (f2fs_need_verity(inode, folio->index))
+		fsverity_readahead(inode, folio->index, folio_nr_pages(folio));
+	return f2fs_mpage_readpages(inode, NULL, folio);
 }
 
 static void f2fs_readahead(struct readahead_control *rac)
@@ -2488,6 +2492,9 @@ static void f2fs_readahead(struct readahead_control *rac)
 	if (f2fs_has_inline_data(inode))
 		return;
 
+	if (f2fs_need_verity(inode, readahead_index(rac)))
+		fsverity_readahead(inode, readahead_index(rac),
+				   readahead_count(rac));
 	f2fs_mpage_readpages(inode, rac, NULL);
 }
 
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index d37e584423af..628e8eafa96a 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -256,11 +256,17 @@ static int f2fs_get_verity_descriptor(struct inode *inode, void *buf,
 }
 
 static struct page *f2fs_read_merkle_tree_page(struct inode *inode,
-					       pgoff_t index,
-					       unsigned long num_ra_pages)
+					       pgoff_t index)
 {
 	index += f2fs_verity_metadata_pos(inode) >> PAGE_SHIFT;
-	return generic_read_merkle_tree_page(inode, index, num_ra_pages);
+	return generic_read_merkle_tree_page(inode, index);
+}
+
+static void f2fs_readahead_merkle_tree(struct inode *inode, pgoff_t index,
+		unsigned long nr_pages)
+{
+	index += f2fs_verity_metadata_pos(inode) >> PAGE_SHIFT;
+	generic_readahead_merkle_tree(inode, index, nr_pages);
 }
 
 static int f2fs_write_merkle_tree_block(struct file *file, const void *buf,
@@ -278,5 +284,6 @@ const struct fsverity_operations f2fs_verityops = {
 	.end_enable_verity	= f2fs_end_enable_verity,
 	.get_verity_descriptor	= f2fs_get_verity_descriptor,
 	.read_merkle_tree_page	= f2fs_read_merkle_tree_page,
+	.readahead_merkle_tree	= f2fs_readahead_merkle_tree,
 	.write_merkle_tree_block = f2fs_write_merkle_tree_block,
 };
diff --git a/fs/verity/pagecache.c b/fs/verity/pagecache.c
index 8e0d6fde802f..50b517ed6be0 100644
--- a/fs/verity/pagecache.c
+++ b/fs/verity/pagecache.c
@@ -16,27 +16,43 @@
  * to ->read_merkle_tree_page to the actual index where the Merkle tree is
  * stored in the page cache for @inode.
  */
-struct page *generic_read_merkle_tree_page(struct inode *inode, pgoff_t index,
-					   unsigned long num_ra_pages)
+struct page *generic_read_merkle_tree_page(struct inode *inode, pgoff_t index)
 {
 	struct folio *folio;
 
+	folio = read_mapping_folio(inode->i_mapping, index, NULL);
+	if (IS_ERR(folio))
+		return ERR_CAST(folio);
+	return folio_file_page(folio, index);
+}
+EXPORT_SYMBOL_GPL(generic_read_merkle_tree_page);
+
+/**
+ * generic_readahead_merkle_tree() - generic ->readahead_merkle_tree helper
+ * @inode:	inode containing the Merkle tree
+ * @index:	0-based index of the first Merkle tree page to read ahead in the
+ *		inode
+ * @nr_pages:	the number of Merkle tree pages that should be read ahead
+ *
+ * The caller needs to adjust @index from the Merkle-tree relative index passed
+ * to ->read_merkle_tree_page to the actual index where the Merkle tree is
+ * stored in the page cache for @inode.
+ */
+void generic_readahead_merkle_tree(struct inode *inode, pgoff_t index,
+				   unsigned long nr_pages)
+{
+	struct folio *folio;
+
+	lockdep_assert_held_read(&inode->i_mapping->invalidate_lock);
+
 	folio = __filemap_get_folio(inode->i_mapping, index, FGP_ACCESSED, 0);
 	if (folio == ERR_PTR(-ENOENT) ||
 	    (!IS_ERR(folio) && !folio_test_uptodate(folio))) {
 		DEFINE_READAHEAD(ractl, NULL, NULL, inode->i_mapping, index);
 
-		if (!IS_ERR(folio)) {
-			folio_put(folio);
-		} else if (num_ra_pages > 1) {
-			filemap_invalidate_lock_shared(inode->i_mapping);
-			page_cache_ra_unbounded(&ractl, num_ra_pages, 0);
-			filemap_invalidate_unlock_shared(inode->i_mapping);
-		}
-		folio = read_mapping_folio(inode->i_mapping, index, NULL);
+		page_cache_ra_unbounded(&ractl, nr_pages, 0);
 	}
-	if (IS_ERR(folio))
-		return ERR_CAST(folio);
-	return folio_file_page(folio, index);
+	if (!IS_ERR(folio))
+		folio_put(folio);
 }
-EXPORT_SYMBOL_GPL(generic_read_merkle_tree_page);
+EXPORT_SYMBOL_GPL(generic_readahead_merkle_tree);
diff --git a/fs/verity/read_metadata.c b/fs/verity/read_metadata.c
index cba5d6af4e04..2807d44dc6bb 100644
--- a/fs/verity/read_metadata.c
+++ b/fs/verity/read_metadata.c
@@ -28,24 +28,33 @@ static int fsverity_read_merkle_tree(struct inode *inode,
 	if (offset >= end_offset)
 		return 0;
 	offs_in_page = offset_in_page(offset);
+	index = offset >> PAGE_SHIFT;
 	last_index = (end_offset - 1) >> PAGE_SHIFT;
 
+	/*
+	 * Kick off readahead for the range we are going to read to ensure a
+	 * single large sequential read instead of lots of small ones.
+	 */
+	if (inode->i_sb->s_vop->readahead_merkle_tree) {
+		filemap_invalidate_lock_shared(inode->i_mapping);
+		inode->i_sb->s_vop->readahead_merkle_tree(inode, index,
+				last_index - index + 1);
+		filemap_invalidate_unlock_shared(inode->i_mapping);
+	}
+
 	/*
 	 * Iterate through each Merkle tree page in the requested range and copy
 	 * the requested portion to userspace.  Note that the Merkle tree block
 	 * size isn't important here, as we are returning a byte stream; i.e.,
 	 * we can just work with pages even if the tree block size != PAGE_SIZE.
 	 */
-	for (index = offset >> PAGE_SHIFT; index <= last_index; index++) {
-		unsigned long num_ra_pages =
-			min_t(unsigned long, last_index - index + 1,
-			      inode->i_sb->s_bdi->io_pages);
+	for (; index <= last_index; index++) {
 		unsigned int bytes_to_copy = min_t(u64, end_offset - offset,
 						   PAGE_SIZE - offs_in_page);
 		struct page *page;
 		const void *virt;
 
-		page = vops->read_merkle_tree_page(inode, index, num_ra_pages);
+		page = vops->read_merkle_tree_page(inode, index);
 		if (IS_ERR(page)) {
 			err = PTR_ERR(page);
 			fsverity_err(inode,
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index 86067c8b40cf..dac004f2a1a0 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -9,6 +9,7 @@
 
 #include <linux/bio.h>
 #include <linux/export.h>
+#include <linux/pagemap.h>
 
 #define FS_VERITY_MAX_PENDING_BLOCKS 2
 
@@ -21,7 +22,6 @@ struct fsverity_pending_block {
 struct fsverity_verification_context {
 	struct inode *inode;
 	struct fsverity_info *vi;
-	unsigned long max_ra_pages;
 
 	/*
 	 * This is the queue of data blocks that are pending verification.  When
@@ -37,6 +37,50 @@ struct fsverity_verification_context {
 
 static struct workqueue_struct *fsverity_read_workqueue;
 
+/**
+ * fsverity_readahead() - kick off readahead on fsverity hashes
+ * @inode:		inode that is being read
+ * @index:		first file data page index that is being read
+ * @nr_pages:		number of file data pages to be read
+ *
+ * Start readahead on the fsverity hashes that are needed to verity the file
+ * data in the range from @index to @inode + @nr_pages.
+ *
+ * To be called from the file systems' ->read_folio and ->readahead methods to
+ * ensure that the hashes are already cached on completion of the file data
+ * read if possible.
+ */
+void fsverity_readahead(struct inode *inode, pgoff_t index,
+			unsigned long nr_pages)
+{
+	const struct fsverity_info *vi = *fsverity_info_addr(inode);
+	const struct merkle_tree_params *params = &vi->tree_params;
+	u64 start_hidx = (u64)index << params->log_blocks_per_page;
+	u64 end_hidx =
+		(((u64)index + nr_pages) << params->log_blocks_per_page) - 1;
+	int level;
+
+	if (!inode->i_sb->s_vop->readahead_merkle_tree)
+		return;
+
+	for (level = 0; level < params->num_levels; level++) {
+		unsigned long level_start = params->level_start[level];
+		unsigned long next_start_hidx = start_hidx >> params->log_arity;
+		unsigned long next_end_hidx = end_hidx >> params->log_arity;
+		pgoff_t start_idx = (level_start + next_start_hidx) >>
+				params->log_blocks_per_page;
+		pgoff_t end_idx = (level_start + next_end_hidx) >>
+				params->log_blocks_per_page;
+
+		inode->i_sb->s_vop->readahead_merkle_tree(inode, start_idx,
+				end_idx - start_idx + 1);
+
+		start_hidx = next_start_hidx;
+		end_hidx = next_end_hidx;
+	}
+}
+EXPORT_SYMBOL_GPL(fsverity_readahead);
+
 /*
  * Returns true if the hash block with index @hblock_idx in the tree, located in
  * @hpage, has already been verified.
@@ -114,8 +158,7 @@ static bool is_hash_block_verified(struct fsverity_info *vi, struct page *hpage,
  * Return: %true if the data block is valid, else %false.
  */
 static bool verify_data_block(struct inode *inode, struct fsverity_info *vi,
-			      const struct fsverity_pending_block *dblock,
-			      unsigned long max_ra_pages)
+			      const struct fsverity_pending_block *dblock)
 {
 	const u64 data_pos = dblock->pos;
 	const struct merkle_tree_params *params = &vi->tree_params;
@@ -200,8 +243,7 @@ static bool verify_data_block(struct inode *inode, struct fsverity_info *vi,
 			  (params->block_size - 1);
 
 		hpage = inode->i_sb->s_vop->read_merkle_tree_page(inode,
-				hpage_idx, level == 0 ? min(max_ra_pages,
-					params->tree_pages - hpage_idx) : 0);
+				hpage_idx);
 		if (IS_ERR(hpage)) {
 			fsverity_err(inode,
 				     "Error %ld reading Merkle tree page %lu",
@@ -272,14 +314,12 @@ static bool verify_data_block(struct inode *inode, struct fsverity_info *vi,
 
 static void
 fsverity_init_verification_context(struct fsverity_verification_context *ctx,
-				   struct inode *inode,
-				   unsigned long max_ra_pages)
+				   struct inode *inode)
 {
 	struct fsverity_info *vi = *fsverity_info_addr(inode);
 
 	ctx->inode = inode;
 	ctx->vi = vi;
-	ctx->max_ra_pages = max_ra_pages;
 	ctx->num_pending = 0;
 	if (vi->tree_params.hash_alg->algo_id == HASH_ALGO_SHA256 &&
 	    sha256_finup_2x_is_optimized())
@@ -322,8 +362,7 @@ fsverity_verify_pending_blocks(struct fsverity_verification_context *ctx)
 	}
 
 	for (i = 0; i < ctx->num_pending; i++) {
-		if (!verify_data_block(ctx->inode, vi, &ctx->pending_blocks[i],
-				       ctx->max_ra_pages))
+		if (!verify_data_block(ctx->inode, vi, &ctx->pending_blocks[i]))
 			return false;
 	}
 	fsverity_clear_pending_blocks(ctx);
@@ -373,7 +412,7 @@ bool fsverity_verify_blocks(struct folio *folio, size_t len, size_t offset)
 {
 	struct fsverity_verification_context ctx;
 
-	fsverity_init_verification_context(&ctx, folio->mapping->host, 0);
+	fsverity_init_verification_context(&ctx, folio->mapping->host);
 
 	if (fsverity_add_data_blocks(&ctx, folio, len, offset) &&
 	    fsverity_verify_pending_blocks(&ctx))
@@ -403,22 +442,8 @@ void fsverity_verify_bio(struct bio *bio)
 	struct inode *inode = bio_first_folio_all(bio)->mapping->host;
 	struct fsverity_verification_context ctx;
 	struct folio_iter fi;
-	unsigned long max_ra_pages = 0;
-
-	if (bio->bi_opf & REQ_RAHEAD) {
-		/*
-		 * If this bio is for data readahead, then we also do readahead
-		 * of the first (largest) level of the Merkle tree.  Namely,
-		 * when a Merkle tree page is read, we also try to piggy-back on
-		 * some additional pages -- up to 1/4 the number of data pages.
-		 *
-		 * This improves sequential read performance, as it greatly
-		 * reduces the number of I/O requests made to the Merkle tree.
-		 */
-		max_ra_pages = bio->bi_iter.bi_size >> (PAGE_SHIFT + 2);
-	}
 
-	fsverity_init_verification_context(&ctx, inode, max_ra_pages);
+	fsverity_init_verification_context(&ctx, inode);
 
 	bio_for_each_folio_all(fi, bio) {
 		if (!fsverity_add_data_blocks(&ctx, fi.folio, fi.length,
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 8ddaa87fece3..580234d8ed2f 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -97,10 +97,6 @@ struct fsverity_operations {
 	 *
 	 * @inode: the inode
 	 * @index: 0-based index of the page within the Merkle tree
-	 * @num_ra_pages: The number of Merkle tree pages that should be
-	 *		  prefetched starting at @index if the page at @index
-	 *		  isn't already cached.  Implementations may ignore this
-	 *		  argument; it's only a performance optimization.
 	 *
 	 * This can be called at any time on an open verity file.  It may be
 	 * called by multiple processes concurrently, even with the same page.
@@ -110,8 +106,23 @@ struct fsverity_operations {
 	 * Return: the page on success, ERR_PTR() on failure
 	 */
 	struct page *(*read_merkle_tree_page)(struct inode *inode,
-					      pgoff_t index,
-					      unsigned long num_ra_pages);
+					      pgoff_t index);
+
+	/**
+	 * Perform readahead of a Merkle tree for the given inode.
+	 *
+	 * @inode: the inode
+	 * @index: 0-based index of the first page within the Merkle tree
+	 * @nr_pages: number of pages to be read ahead.
+	 *
+	 * This can be called at any time on an open verity file.  It may be
+	 * called by multiple processes concurrently, even with the same range.
+	 *
+	 * Optional method so that ->read_merkle_tree_page preferably finds
+	 * cached data instead of issuing dependent I/O.
+	 */
+	void (*readahead_merkle_tree)(struct inode *inode, pgoff_t index,
+			unsigned long nr_pages);
 
 	/**
 	 * Write a Merkle tree block to the given file.
@@ -308,8 +319,11 @@ static inline int fsverity_file_open(struct inode *inode, struct file *filp)
 }
 
 void fsverity_cleanup_inode(struct inode *inode);
+void fsverity_readahead(struct inode *inode, pgoff_t index,
+			unsigned long nr_pages);
 
-struct page *generic_read_merkle_tree_page(struct inode *inode, pgoff_t index,
-					   unsigned long num_ra_pages);
+struct page *generic_read_merkle_tree_page(struct inode *inode, pgoff_t index);
+void generic_readahead_merkle_tree(struct inode *inode, pgoff_t index,
+				   unsigned long nr_pages);
 
 #endif	/* _LINUX_FSVERITY_H */
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
