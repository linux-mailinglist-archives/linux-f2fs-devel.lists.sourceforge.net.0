Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C76B1F8FF
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Aug 2025 10:00:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUodJjRW5uzitVtiuijekiajvLlOKkkwWT106oV7BPI=; b=SFm55H+/CQ67b2yHlB+DWxxuaL
	HoIftTLfl7pD8e2urn0Mz0enaxGB1R9cty2MK3331tx+nuwpCXbuK7JIba9F2kw9BrlEZTlO4Xd8+
	Ktr+gpgC79msMeW9g8tIt3rsqDtR+vpOnISd1bk4MiE6u8P9Ed4qyOFMPop0UB8Ihns8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ul0ya-0008MT-Qc;
	Sun, 10 Aug 2025 08:00:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1ul0yY-0008MA-G9
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 08:00:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8HgLRvvz7lkRHE6HxhbRuzvX9PUUwWJEhEwI1Am/PlE=; b=LMueu9bERzFHA4D4TEo6ZaU9rf
 2cE9OZom9KsB1whboXjR6gDth87U9Hgc8JlEHn9+HNrUUANB0u+wrtnNlsT8zZhCynrBUGgqQBNj/
 lkxRLA1NXXsNy3a/t6SaMKog3Y7RIlfnWQ/n33nlPa61JWCAEvF0eCHV+q/TRXvyxLvI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8HgLRvvz7lkRHE6HxhbRuzvX9PUUwWJEhEwI1Am/PlE=; b=Xx3GYeZNS20mlpdV5nMzByykFU
 NsdbvaJRMUh6ixrthjFkm6OvDWMDEtLKA7NbUnfui0Yj9v1fvbkqKzGHpcHDWQJSb/FLigejZD4nA
 WwsMLb+39YQ3bcghreG9DVfB8dmIkkXahk3CSNSrPGiQdFjMZdIAqap2YSJBdeGPKZOE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ul0yW-00010b-So for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 08:00:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7EB145C5724;
 Sun, 10 Aug 2025 08:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F5AC4CEF9;
 Sun, 10 Aug 2025 08:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754812811;
 bh=aFBs0ub8KvkLQDLXzsBfxcdo9ePKy2Sxh/BmZSzdr3k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aBd4VN/NsHldvGytvia9LjI4DOFoIj/3W84QCdRXMHhR9Huhb6Lkit8XPwTqXes6t
 RENiaqoiFk6oAYVlQisQY8uebJ+jMkJhIEll4h9f4KZmHl31RxN/cxaQ6DblVE2x5l
 y4I/IY2Nvosxgr+WbWtp6ypihVEQUgYR2GDrLxSeuPj+86MYT9js76aZK7VefTFY9R
 dHbaWUdEqdGFu/xKYCyW9rU2klJM10itbwAvZct2wFqHgBlH6HY5UpbsSCTE8tCvDi
 h8tvQ6+ATCF5vCqCmF5I7Hl6ceyV8aawVngBPBSz2GHAVviHzs908Ysg4pSium3I+o
 sCW+oo04hjQEw==
To: linux-fscrypt@vger.kernel.org,
	fsverity@lists.linux.dev
Date: Sun, 10 Aug 2025 00:57:01 -0700
Message-ID: <20250810075706.172910-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810075706.172910-1-ebiggers@kernel.org>
References: <20250810075706.172910-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Add an inode_info_offs field to struct fsverity_operations, 
 and update fs/verity/ to support it. When set to a nonzero value, it specifies
 the offset to the fsverity_info pointer within the filesystem [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ul0yW-00010b-So
Subject: [f2fs-dev] [PATCH v5 08/13] fsverity: add support for info in
 fs-specific part of inode
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add an inode_info_offs field to struct fsverity_operations, and update
fs/verity/ to support it.  When set to a nonzero value, it specifies the
offset to the fsverity_info pointer within the filesystem-specific part
of the inode structure, to be used instead of inode::i_verity_info.

Since this makes inode::i_verity_info no longer necessarily used, update
comments that mentioned it.

This is a prerequisite for a later commit that removes
inode::i_verity_info, saving memory and improving cache efficiency on
filesystems that don't support fsverity.

Co-developed-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/verity/enable.c           |  6 ++---
 fs/verity/fsverity_private.h |  9 ++++----
 fs/verity/open.c             | 23 ++++++++++---------
 fs/verity/verify.c           |  2 +-
 include/linux/fsverity.h     | 44 ++++++++++++++++++++++++++++--------
 5 files changed, 55 insertions(+), 29 deletions(-)

diff --git a/fs/verity/enable.c b/fs/verity/enable.c
index 503268cf42962..89eccc4becf90 100644
--- a/fs/verity/enable.c
+++ b/fs/verity/enable.c
@@ -282,13 +282,13 @@ static int enable_verity(struct file *filp,
 		fsverity_free_info(vi);
 	} else {
 		/* Successfully enabled verity */
 
 		/*
-		 * Readers can start using ->i_verity_info immediately, so it
-		 * can't be rolled back once set.  So don't set it until just
-		 * after the filesystem has successfully enabled verity.
+		 * Readers can start using the inode's verity info immediately,
+		 * so it can't be rolled back once set.  So don't set it until
+		 * just after the filesystem has successfully enabled verity.
 		 */
 		fsverity_set_info(inode, vi);
 	}
 out:
 	kfree(params.hashstate);
diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index 5fe854a5b9ad3..bc1d887c532e7 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -61,14 +61,15 @@ struct merkle_tree_params {
 
 /*
  * fsverity_info - cached verity metadata for an inode
  *
  * When a verity file is first opened, an instance of this struct is allocated
- * and stored in ->i_verity_info; it remains until the inode is evicted.  It
- * caches information about the Merkle tree that's needed to efficiently verify
- * data read from the file.  It also caches the file digest.  The Merkle tree
- * pages themselves are not cached here, but the filesystem may cache them.
+ * and a pointer to it is stored in the file's in-memory inode.  It remains
+ * until the inode is evicted.  It caches information about the Merkle tree
+ * that's needed to efficiently verify data read from the file.  It also caches
+ * the file digest.  The Merkle tree pages themselves are not cached here, but
+ * the filesystem may cache them.
  */
 struct fsverity_info {
 	struct merkle_tree_params tree_params;
 	u8 root_hash[FS_VERITY_MAX_DIGEST_SIZE];
 	u8 file_digest[FS_VERITY_MAX_DIGEST_SIZE];
diff --git a/fs/verity/open.c b/fs/verity/open.c
index c561e130cd0c6..77b1c977af025 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -242,21 +242,21 @@ struct fsverity_info *fsverity_create_info(const struct inode *inode,
 }
 
 void fsverity_set_info(struct inode *inode, struct fsverity_info *vi)
 {
 	/*
-	 * Multiple tasks may race to set ->i_verity_info, so use
-	 * cmpxchg_release().  This pairs with the smp_load_acquire() in
-	 * fsverity_get_info().  I.e., here we publish ->i_verity_info with a
-	 * RELEASE barrier so that other tasks can ACQUIRE it.
+	 * Multiple tasks may race to set the inode's verity info pointer, so
+	 * use cmpxchg_release().  This pairs with the smp_load_acquire() in
+	 * fsverity_get_info().  I.e., publish the pointer with a RELEASE
+	 * barrier so that other tasks can ACQUIRE it.
 	 */
-	if (cmpxchg_release(&inode->i_verity_info, NULL, vi) != NULL) {
-		/* Lost the race, so free the fsverity_info we allocated. */
+	if (cmpxchg_release(fsverity_info_addr(inode), NULL, vi) != NULL) {
+		/* Lost the race, so free the verity info we allocated. */
 		fsverity_free_info(vi);
 		/*
-		 * Afterwards, the caller may access ->i_verity_info directly,
-		 * so make sure to ACQUIRE the winning fsverity_info.
+		 * Afterwards, the caller may access the inode's verity info
+		 * directly, so make sure to ACQUIRE the winning verity info.
 		 */
 		(void)fsverity_get_info(inode);
 	}
 }
 
@@ -348,11 +348,10 @@ int fsverity_get_descriptor(struct inode *inode,
 
 	*desc_ret = desc;
 	return 0;
 }
 
-/* Ensure the inode has an ->i_verity_info */
 static int ensure_verity_info(struct inode *inode)
 {
 	struct fsverity_info *vi = fsverity_get_info(inode);
 	struct fsverity_descriptor *desc;
 	int err;
@@ -393,12 +392,14 @@ int __fsverity_prepare_setattr(struct dentry *dentry, struct iattr *attr)
 }
 EXPORT_SYMBOL_GPL(__fsverity_prepare_setattr);
 
 void __fsverity_cleanup_inode(struct inode *inode)
 {
-	fsverity_free_info(inode->i_verity_info);
-	inode->i_verity_info = NULL;
+	struct fsverity_info **vi_addr = fsverity_info_addr(inode);
+
+	fsverity_free_info(*vi_addr);
+	*vi_addr = NULL;
 }
 EXPORT_SYMBOL_GPL(__fsverity_cleanup_inode);
 
 void __init fsverity_init_info_cache(void)
 {
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index a1f00c3fd3b27..affc307eb6a6b 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -243,11 +243,11 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 static bool
 verify_data_blocks(struct folio *data_folio, size_t len, size_t offset,
 		   unsigned long max_ra_pages)
 {
 	struct inode *inode = data_folio->mapping->host;
-	struct fsverity_info *vi = inode->i_verity_info;
+	struct fsverity_info *vi = *fsverity_info_addr(inode);
 	const unsigned int block_size = vi->tree_params.block_size;
 	u64 pos = (u64)data_folio->index << PAGE_SHIFT;
 
 	if (WARN_ON_ONCE(len <= 0 || !IS_ALIGNED(len | offset, block_size)))
 		return false;
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 1eb7eae580be7..e0f132cb78393 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -26,10 +26,16 @@
 /* Arbitrary limit to bound the kmalloc() size.  Can be changed. */
 #define FS_VERITY_MAX_DESCRIPTOR_SIZE	16384
 
 /* Verity operations for filesystems */
 struct fsverity_operations {
+	/**
+	 * The offset of the pointer to struct fsverity_info in the
+	 * filesystem-specific part of the inode, relative to the beginning of
+	 * the common part of the inode (the 'struct inode').
+	 */
+	ptrdiff_t inode_info_offs;
 
 	/**
 	 * Begin enabling verity on the given file.
 	 *
 	 * @filp: a readonly file descriptor for the file
@@ -122,19 +128,37 @@ struct fsverity_operations {
 				       u64 pos, unsigned int size);
 };
 
 #ifdef CONFIG_FS_VERITY
 
+static inline struct fsverity_info **
+fsverity_info_addr(const struct inode *inode)
+{
+	if (inode->i_sb->s_vop->inode_info_offs == 0)
+		return (struct fsverity_info **)&inode->i_verity_info;
+	return (void *)inode + inode->i_sb->s_vop->inode_info_offs;
+}
+
 static inline struct fsverity_info *fsverity_get_info(const struct inode *inode)
 {
 	/*
-	 * Pairs with the cmpxchg_release() in fsverity_set_info().
-	 * I.e., another task may publish ->i_verity_info concurrently,
-	 * executing a RELEASE barrier.  We need to use smp_load_acquire() here
-	 * to safely ACQUIRE the memory the other task published.
+	 * Since this function can be called on inodes belonging to filesystems
+	 * that don't support fsverity at all, and fsverity_info_addr() doesn't
+	 * work on such filesystems, we have to start with an IS_VERITY() check.
+	 * Checking IS_VERITY() here is also useful to minimize the overhead of
+	 * fsverity_active() on non-verity files.
+	 */
+	if (!IS_VERITY(inode))
+		return NULL;
+
+	/*
+	 * Pairs with the cmpxchg_release() in fsverity_set_info().  I.e.,
+	 * another task may publish the inode's verity info concurrently,
+	 * executing a RELEASE barrier.  Use smp_load_acquire() here to safely
+	 * ACQUIRE the memory the other task published.
 	 */
-	return smp_load_acquire(&inode->i_verity_info);
+	return smp_load_acquire(fsverity_info_addr(inode));
 }
 
 /* enable.c */
 
 int fsverity_ioctl_enable(struct file *filp, const void __user *arg);
@@ -154,15 +178,15 @@ void __fsverity_cleanup_inode(struct inode *inode);
 
 /**
  * fsverity_cleanup_inode() - free the inode's verity info, if present
  * @inode: an inode being evicted
  *
- * Filesystems must call this on inode eviction to free ->i_verity_info.
+ * Filesystems must call this on inode eviction to free the inode's verity info.
  */
 static inline void fsverity_cleanup_inode(struct inode *inode)
 {
-	if (inode->i_verity_info)
+	if (*fsverity_info_addr(inode))
 		__fsverity_cleanup_inode(inode);
 }
 
 /* read_metadata.c */
 
@@ -265,16 +289,16 @@ static inline bool fsverity_verify_page(struct page *page)
 
 /**
  * fsverity_active() - do reads from the inode need to go through fs-verity?
  * @inode: inode to check
  *
- * This checks whether ->i_verity_info has been set.
+ * This checks whether the inode's verity info has been set.
  *
  * Filesystems call this from ->readahead() to check whether the pages need to
  * be verified or not.  Don't use IS_VERITY() for this purpose; it's subject to
  * a race condition where the file is being read concurrently with
- * FS_IOC_ENABLE_VERITY completing.  (S_VERITY is set before ->i_verity_info.)
+ * FS_IOC_ENABLE_VERITY completing.  (S_VERITY is set before the verity info.)
  *
  * Return: true if reads need to go through fs-verity, otherwise false
  */
 static inline bool fsverity_active(const struct inode *inode)
 {
@@ -285,11 +309,11 @@ static inline bool fsverity_active(const struct inode *inode)
  * fsverity_file_open() - prepare to open a verity file
  * @inode: the inode being opened
  * @filp: the struct file being set up
  *
  * When opening a verity file, deny the open if it is for writing.  Otherwise,
- * set up the inode's ->i_verity_info if not already done.
+ * set up the inode's verity info if not already done.
  *
  * When combined with fscrypt, this must be called after fscrypt_file_open().
  * Otherwise, we won't have the key set up to decrypt the verity metadata.
  *
  * Return: 0 on success, -errno on failure
-- 
2.50.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
