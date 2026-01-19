Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF909D39E5D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 07:23:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIMumKobGmIsTCARoR3JkTTeG5Id3gtw9t7WfKa3mSE=; b=V4MOMu5WaPcMWZEpzIlDVn530b
	HNv5oBIJfv3GIkICfsXWJsPYa0NMFScE4rv+GBdfjru/Vixl13Pxy3FYfYAYH1cWhBm6JmMgHaO1v
	P0KGJZAyvvLsjGJdwsfDb2jP+F/36w/LtJYLdfEUoNRRZOX/zgAwZLSJ0aaQsUf8R05s=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhifi-0001aU-Ji;
	Mon, 19 Jan 2026 06:23:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+f4f5ba1b7319529cbc9c+8184+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vhifh-0001aK-9N for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 06:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z4dyB+Yemqd8PwKaKDfPwOFaEVqT+jen91Ydgg/p/+w=; b=CAXdAEU7sa+g1SvOGukT+aX2eR
 JBf1Yej66xc7X2j8Y2uVmnsYx4a0gyNqgbVu6DqAdjIkLQ/bLlbEn83Wh8wr75eC5NRynMh97qlfy
 0aOG5nRyrzITn4nhGbkG9xSJ45petiyF5BFT85MnwIPcJkLV4S+fpIBoaZbk08u37PME=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z4dyB+Yemqd8PwKaKDfPwOFaEVqT+jen91Ydgg/p/+w=; b=AG9tbhJoCbvwuS3TzvRqu91HSx
 vfrC4FueAxBan3J/bblZWymVmVKOEaaJLCuGXwygJK1RiA54+UmLPvPLPZ19hIxmRhZCJnBrolov2
 hxEEZGFDTkYgZeqk7qog8kiO8TRELzBAPnoEUSlqEuaekOoZfXv65yENM9V0cw5pQ+1M=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhiff-0006gC-PP for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 06:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Z4dyB+Yemqd8PwKaKDfPwOFaEVqT+jen91Ydgg/p/+w=; b=e9CgCIB8+W5vANTP1f4/veaJZx
 FiMOhgw5J6NVEineO0CV4eVQBpKrHs1fOBhGpwdizJDtiJQTA/ZHbYiw7VLr790544sJnywwyn/4x
 BfMsiF4yV4+V8JCFR58qhaWWvuPUuQmuivY8nMiaBPyXUEvaCL7B+sIR0AN8GTViapHErhAl6Fonq
 zvQaE9BfXQi6oEaHofTxxbHixSOaeupPPEwxNVF052BiWREvUMGhgflthxsStljcchNplHJp5FfUr
 sqVBH51pP8Yancsivdz6gBxRulxU+SbYx3vCMmp85C+4WQHd54WrO2+hXlbNBTRRPPlwTjKkNytyO
 YG19YyVw==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vhifX-00000001OoX-1RFq; Mon, 19 Jan 2026 06:23:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon, 19 Jan 2026 07:22:45 +0100
Message-ID: <20260119062250.3998674-5-hch@lst.de>
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
 Content preview: Use the kernel's resizable hash table to find the
 fsverity_info.
 This way file systems that want to support fsverity don't have to bloat every
 inode in the system with an extra pointer. The tradeoff i [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vhiff-0006gC-PP
Subject: [f2fs-dev] [PATCH 4/6] fsverity: use a hashtable to find the
 fsverity_info
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

Use the kernel's resizable hash table to find the fsverity_info.  This
way file systems that want to support fsverity don't have to bloat
every inode in the system with an extra pointer.  The tradeoff is that
looking up the fsverity_info is a bit more expensive now, but the main
operations are still dominated by I/O and hashing overhead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/btrfs/btrfs_inode.h       |  4 --
 fs/btrfs/inode.c             |  3 --
 fs/btrfs/verity.c            |  2 -
 fs/ext4/ext4.h               |  4 --
 fs/ext4/super.c              |  3 --
 fs/ext4/verity.c             |  2 -
 fs/f2fs/f2fs.h               |  3 --
 fs/f2fs/super.c              |  3 --
 fs/f2fs/verity.c             |  2 -
 fs/verity/enable.c           | 30 +++++++++------
 fs/verity/fsverity_private.h | 17 ++++----
 fs/verity/open.c             | 75 ++++++++++++++++++++++--------------
 fs/verity/verify.c           |  6 +--
 include/linux/fsverity.h     | 47 ++++------------------
 14 files changed, 83 insertions(+), 118 deletions(-)

diff --git a/fs/btrfs/btrfs_inode.h b/fs/btrfs/btrfs_inode.h
index 73602ee8de3f..55c272fe5d92 100644
--- a/fs/btrfs/btrfs_inode.h
+++ b/fs/btrfs/btrfs_inode.h
@@ -339,10 +339,6 @@ struct btrfs_inode {
 
 	struct rw_semaphore i_mmap_lock;
 
-#ifdef CONFIG_FS_VERITY
-	struct fsverity_info *i_verity_info;
-#endif
-
 	struct inode vfs_inode;
 };
 
diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 67c64efc5099..93b2ce75fb06 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -8097,9 +8097,6 @@ static void init_once(void *foo)
 	struct btrfs_inode *ei = foo;
 
 	inode_init_once(&ei->vfs_inode);
-#ifdef CONFIG_FS_VERITY
-	ei->i_verity_info = NULL;
-#endif
 }
 
 void __cold btrfs_destroy_cachep(void)
diff --git a/fs/btrfs/verity.c b/fs/btrfs/verity.c
index a2ac3fb68bc8..e79e67280a4b 100644
--- a/fs/btrfs/verity.c
+++ b/fs/btrfs/verity.c
@@ -796,8 +796,6 @@ static int btrfs_write_merkle_tree_block(struct inode *inode, const void *buf,
 }
 
 const struct fsverity_operations btrfs_verityops = {
-	.inode_info_offs         = (int)offsetof(struct btrfs_inode, i_verity_info) -
-				   (int)offsetof(struct btrfs_inode, vfs_inode),
 	.begin_enable_verity     = btrfs_begin_enable_verity,
 	.end_enable_verity       = btrfs_end_enable_verity,
 	.get_verity_descriptor   = btrfs_get_verity_descriptor,
diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 56112f201cac..60c549bc894e 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -1205,10 +1205,6 @@ struct ext4_inode_info {
 #ifdef CONFIG_FS_ENCRYPTION
 	struct fscrypt_inode_info *i_crypt_info;
 #endif
-
-#ifdef CONFIG_FS_VERITY
-	struct fsverity_info *i_verity_info;
-#endif
 };
 
 /*
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 86131f4d8718..1fb0c90c7a4b 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1484,9 +1484,6 @@ static void init_once(void *foo)
 #ifdef CONFIG_FS_ENCRYPTION
 	ei->i_crypt_info = NULL;
 #endif
-#ifdef CONFIG_FS_VERITY
-	ei->i_verity_info = NULL;
-#endif
 }
 
 static int __init init_inodecache(void)
diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
index 415d9c4d8a32..7a980a8059bd 100644
--- a/fs/ext4/verity.c
+++ b/fs/ext4/verity.c
@@ -389,8 +389,6 @@ static int ext4_write_merkle_tree_block(struct inode *inode, const void *buf,
 }
 
 const struct fsverity_operations ext4_verityops = {
-	.inode_info_offs	= (int)offsetof(struct ext4_inode_info, i_verity_info) -
-				  (int)offsetof(struct ext4_inode_info, vfs_inode),
 	.begin_enable_verity	= ext4_begin_enable_verity,
 	.end_enable_verity	= ext4_end_enable_verity,
 	.get_verity_descriptor	= ext4_get_verity_descriptor,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 20edbb99b814..6b0933de0e2e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -974,9 +974,6 @@ struct f2fs_inode_info {
 #ifdef CONFIG_FS_ENCRYPTION
 	struct fscrypt_inode_info *i_crypt_info; /* filesystem encryption info */
 #endif
-#ifdef CONFIG_FS_VERITY
-	struct fsverity_info *i_verity_info; /* filesystem verity info */
-#endif
 };
 
 static inline void get_read_extent_info(struct extent_info *ext,
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index c4c225e09dc4..cd00d030edda 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -504,9 +504,6 @@ static void init_once(void *foo)
 #ifdef CONFIG_FS_ENCRYPTION
 	fi->i_crypt_info = NULL;
 #endif
-#ifdef CONFIG_FS_VERITY
-	fi->i_verity_info = NULL;
-#endif
 }
 
 #ifdef CONFIG_QUOTA
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index 05b935b55216..c30b70fbcc0d 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -287,8 +287,6 @@ static int f2fs_write_merkle_tree_block(struct inode *inode, const void *buf,
 }
 
 const struct fsverity_operations f2fs_verityops = {
-	.inode_info_offs	= (int)offsetof(struct f2fs_inode_info, i_verity_info) -
-				  (int)offsetof(struct f2fs_inode_info, vfs_inode),
 	.begin_enable_verity	= f2fs_begin_enable_verity,
 	.end_enable_verity	= f2fs_end_enable_verity,
 	.get_verity_descriptor	= f2fs_get_verity_descriptor,
diff --git a/fs/verity/enable.c b/fs/verity/enable.c
index 95ec42b84797..91cada0d455c 100644
--- a/fs/verity/enable.c
+++ b/fs/verity/enable.c
@@ -264,9 +264,24 @@ static int enable_verity(struct file *filp,
 		goto rollback;
 	}
 
+	/*
+	 * Add the fsverity_info into the hash table before finishing the
+	 * initialization.  This ensures we don't have to undo the enabling when
+	 * memory allocation for the hash table fails.  This is safe because
+	 * looking up the fsverity_info always first checks the S_VERITY flag on
+	 * the inode, which will only be set at the very end of the
+	 * ->end_enable_verity method.
+	 */
+	err = fsverity_set_info(vi);
+	if (err)
+		goto rollback;
+
 	/*
 	 * Tell the filesystem to finish enabling verity on the file.
-	 * Serialized with ->begin_enable_verity() by the inode lock.
+	 * Serialized with ->begin_enable_verity() by the inode lock.  The file
+	 * system needs to set the S_VERITY flag on the inode at the very end of
+	 * the method, at which point the fsverity information can be accessed
+	 * by other threads.
 	 */
 	inode_lock(inode);
 	err = vops->end_enable_verity(filp, desc, desc_size, params.tree_size);
@@ -274,19 +289,10 @@ static int enable_verity(struct file *filp,
 	if (err) {
 		fsverity_err(inode, "%ps() failed with err %d",
 			     vops->end_enable_verity, err);
-		fsverity_free_info(vi);
+		fsverity_remove_info(vi);
 	} else if (WARN_ON_ONCE(!IS_VERITY(inode))) {
+		fsverity_remove_info(vi);
 		err = -EINVAL;
-		fsverity_free_info(vi);
-	} else {
-		/* Successfully enabled verity */
-
-		/*
-		 * Readers can start using the inode's verity info immediately,
-		 * so it can't be rolled back once set.  So don't set it until
-		 * just after the filesystem has successfully enabled verity.
-		 */
-		fsverity_set_info(inode, vi);
 	}
 out:
 	kfree(params.hashstate);
diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index dd20b138d452..68a85b6202b5 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -11,6 +11,7 @@
 #define pr_fmt(fmt) "fs-verity: " fmt
 
 #include <linux/fsverity.h>
+#include <linux/rhashtable.h>
 
 /*
  * Implementation limit: maximum depth of the Merkle tree.  For now 8 is plenty;
@@ -63,13 +64,14 @@ struct merkle_tree_params {
  * fsverity_info - cached verity metadata for an inode
  *
  * When a verity file is first opened, an instance of this struct is allocated
- * and a pointer to it is stored in the file's in-memory inode.  It remains
- * until the inode is evicted.  It caches information about the Merkle tree
- * that's needed to efficiently verify data read from the file.  It also caches
- * the file digest.  The Merkle tree pages themselves are not cached here, but
- * the filesystem may cache them.
+ * and a pointer to it is stored in the global hash table, indexed by the inode
+ * pointer value.  It remains alive until the inode is evicted.  It caches
+ * information about the Merkle tree that's needed to efficiently verify data
+ * read from the file.  It also caches the file digest.  The Merkle tree pages
+ * themselves are not cached here, but the filesystem may cache them.
  */
 struct fsverity_info {
+	struct rhash_head rhash_head;
 	struct merkle_tree_params tree_params;
 	u8 root_hash[FS_VERITY_MAX_DIGEST_SIZE];
 	u8 file_digest[FS_VERITY_MAX_DIGEST_SIZE];
@@ -127,9 +129,8 @@ int fsverity_init_merkle_tree_params(struct merkle_tree_params *params,
 struct fsverity_info *fsverity_create_info(const struct inode *inode,
 					   struct fsverity_descriptor *desc);
 
-void fsverity_set_info(struct inode *inode, struct fsverity_info *vi);
-
-void fsverity_free_info(struct fsverity_info *vi);
+int fsverity_set_info(struct fsverity_info *vi);
+void fsverity_remove_info(struct fsverity_info *vi);
 
 int fsverity_get_descriptor(struct inode *inode,
 			    struct fsverity_descriptor **desc_ret);
diff --git a/fs/verity/open.c b/fs/verity/open.c
index 8ed915be9c91..17da6c0b2015 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -12,6 +12,14 @@
 #include <linux/slab.h>
 
 static struct kmem_cache *fsverity_info_cachep;
+static struct rhashtable fsverity_info_hash;
+
+static const struct rhashtable_params fsverity_info_hash_params = {
+	.key_len		= sizeof(struct inode *),
+	.key_offset		= offsetof(struct fsverity_info, inode),
+	.head_offset		= offsetof(struct fsverity_info, rhash_head),
+	.automatic_shrinking	= true,
+};
 
 /**
  * fsverity_init_merkle_tree_params() - initialize Merkle tree parameters
@@ -170,6 +178,13 @@ static void compute_file_digest(const struct fsverity_hash_alg *hash_alg,
 	desc->sig_size = sig_size;
 }
 
+static void fsverity_free_info(struct fsverity_info *vi)
+{
+	kfree(vi->tree_params.hashstate);
+	kvfree(vi->hash_block_verified);
+	kmem_cache_free(fsverity_info_cachep, vi);
+}
+
 /*
  * Create a new fsverity_info from the given fsverity_descriptor (with optional
  * appended builtin signature), and check the signature if present.  The
@@ -241,33 +256,18 @@ struct fsverity_info *fsverity_create_info(const struct inode *inode,
 	return ERR_PTR(err);
 }
 
-void fsverity_set_info(struct inode *inode, struct fsverity_info *vi)
+int fsverity_set_info(struct fsverity_info *vi)
 {
-	/*
-	 * Multiple tasks may race to set the inode's verity info pointer, so
-	 * use cmpxchg_release().  This pairs with the smp_load_acquire() in
-	 * fsverity_get_info().  I.e., publish the pointer with a RELEASE
-	 * barrier so that other tasks can ACQUIRE it.
-	 */
-	if (cmpxchg_release(fsverity_info_addr(inode), NULL, vi) != NULL) {
-		/* Lost the race, so free the verity info we allocated. */
-		fsverity_free_info(vi);
-		/*
-		 * Afterwards, the caller may access the inode's verity info
-		 * directly, so make sure to ACQUIRE the winning verity info.
-		 */
-		(void)fsverity_get_info(inode);
-	}
+	return rhashtable_lookup_insert_fast(&fsverity_info_hash,
+			&vi->rhash_head, fsverity_info_hash_params);
 }
 
-void fsverity_free_info(struct fsverity_info *vi)
+struct fsverity_info *__fsverity_get_info(const struct inode *inode)
 {
-	if (!vi)
-		return;
-	kfree(vi->tree_params.hashstate);
-	kvfree(vi->hash_block_verified);
-	kmem_cache_free(fsverity_info_cachep, vi);
+	return rhashtable_lookup_fast(&fsverity_info_hash, &inode,
+			fsverity_info_hash_params);
 }
+EXPORT_SYMBOL_GPL(__fsverity_get_info);
 
 static bool validate_fsverity_descriptor(struct inode *inode,
 					 const struct fsverity_descriptor *desc,
@@ -352,7 +352,7 @@ int fsverity_get_descriptor(struct inode *inode,
 
 static int ensure_verity_info(struct inode *inode)
 {
-	struct fsverity_info *vi = fsverity_get_info(inode);
+	struct fsverity_info *vi = fsverity_get_info(inode), *found;
 	struct fsverity_descriptor *desc;
 	int err;
 
@@ -369,8 +369,18 @@ static int ensure_verity_info(struct inode *inode)
 		goto out_free_desc;
 	}
 
-	fsverity_set_info(inode, vi);
-	err = 0;
+	/*
+	 * Multiple tasks may race to set the inode's verity info, in which case
+	 * we might find an existing fsverity_info in the hash table.
+	 */
+	found = rhashtable_lookup_get_insert_fast(&fsverity_info_hash,
+			&vi->rhash_head, fsverity_info_hash_params);
+	if (found) {
+		fsverity_free_info(vi);
+		if (IS_ERR(found))
+			err = PTR_ERR(found);
+	}
+
 out_free_desc:
 	kfree(desc);
 	return err;
@@ -390,16 +400,25 @@ int fsverity_file_open(struct inode *inode, struct file *filp)
 	return ensure_verity_info(inode);
 }
 
+void fsverity_remove_info(struct fsverity_info *vi)
+{
+	rhashtable_remove_fast(&fsverity_info_hash, &vi->rhash_head,
+			fsverity_info_hash_params);
+	fsverity_free_info(vi);
+}
+
 void fsverity_cleanup_inode(struct inode *inode)
 {
-	struct fsverity_info **vi_addr = fsverity_info_addr(inode);
+	struct fsverity_info *vi = fsverity_get_info(inode);
 
-	fsverity_free_info(*vi_addr);
-	*vi_addr = NULL;
+	if (vi)
+		fsverity_remove_info(vi);
 }
 
 void __init fsverity_init_info_cache(void)
 {
+	if (rhashtable_init(&fsverity_info_hash, &fsverity_info_hash_params))
+		panic("failed to initialize fsverity hash\n");
 	fsverity_info_cachep = KMEM_CACHE_USERCOPY(
 					fsverity_info,
 					SLAB_RECLAIM_ACCOUNT | SLAB_PANIC,
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index 86067c8b40cf..3cc81658e4f3 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -275,13 +275,11 @@ fsverity_init_verification_context(struct fsverity_verification_context *ctx,
 				   struct inode *inode,
 				   unsigned long max_ra_pages)
 {
-	struct fsverity_info *vi = *fsverity_info_addr(inode);
-
 	ctx->inode = inode;
-	ctx->vi = vi;
+	ctx->vi = fsverity_get_info(inode);
 	ctx->max_ra_pages = max_ra_pages;
 	ctx->num_pending = 0;
-	if (vi->tree_params.hash_alg->algo_id == HASH_ALGO_SHA256 &&
+	if (ctx->vi->tree_params.hash_alg->algo_id == HASH_ALGO_SHA256 &&
 	    sha256_finup_2x_is_optimized())
 		ctx->max_pending = 2;
 	else
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 4980ea55cdaa..27abf5b867bb 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -30,13 +30,6 @@ struct fsverity_info;
 
 /* Verity operations for filesystems */
 struct fsverity_operations {
-	/**
-	 * The offset of the pointer to struct fsverity_info in the
-	 * filesystem-specific part of the inode, relative to the beginning of
-	 * the common part of the inode (the 'struct inode').
-	 */
-	ptrdiff_t inode_info_offs;
-
 	/**
 	 * Begin enabling verity on the given file.
 	 *
@@ -132,42 +125,21 @@ struct fsverity_operations {
 
 int fsverity_file_open(struct inode *inode, struct file *filp);
 void fsverity_cleanup_inode(struct inode *inode);
-
-#ifdef CONFIG_FS_VERITY
-
-/*
- * Returns the address of the verity info pointer within the filesystem-specific
- * part of the inode.  (To save memory on filesystems that don't support
- * fsverity, a field in 'struct inode' itself is no longer used.)
- */
-static inline struct fsverity_info **
-fsverity_info_addr(const struct inode *inode)
-{
-	VFS_WARN_ON_ONCE(inode->i_sb->s_vop->inode_info_offs == 0);
-	return (void *)inode + inode->i_sb->s_vop->inode_info_offs;
-}
+struct fsverity_info *__fsverity_get_info(const struct inode *inode);
 
 static inline struct fsverity_info *fsverity_get_info(const struct inode *inode)
 {
 	/*
-	 * Since this function can be called on inodes belonging to filesystems
-	 * that don't support fsverity at all, and fsverity_info_addr() doesn't
-	 * work on such filesystems, we have to start with an IS_VERITY() check.
-	 * Checking IS_VERITY() here is also useful to minimize the overhead of
-	 * fsverity_active() on non-verity files.
+	 * Check IS_VERITY() to minimize the overhead of fsverity_active() on
+	 * non-verity files, including file systems that don't support fsverity
+	 * at all.
 	 */
-	if (!IS_VERITY(inode))
+	if (!IS_ENABLED(CONFIG_FS_VERITY) || !IS_VERITY(inode))
 		return NULL;
-
-	/*
-	 * Pairs with the cmpxchg_release() in fsverity_set_info().  I.e.,
-	 * another task may publish the inode's verity info concurrently,
-	 * executing a RELEASE barrier.  Use smp_load_acquire() here to safely
-	 * ACQUIRE the memory the other task published.
-	 */
-	return smp_load_acquire(fsverity_info_addr(inode));
+	return __fsverity_get_info(inode);
 }
 
+#ifdef CONFIG_FS_VERITY
 /* enable.c */
 
 int fsverity_ioctl_enable(struct file *filp, const void __user *arg);
@@ -191,11 +163,6 @@ void fsverity_enqueue_verify_work(struct work_struct *work);
 
 #else /* !CONFIG_FS_VERITY */
 
-static inline struct fsverity_info *fsverity_get_info(const struct inode *inode)
-{
-	return NULL;
-}
-
 /* enable.c */
 
 static inline int fsverity_ioctl_enable(struct file *filp,
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
