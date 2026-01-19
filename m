Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7961FD39E5C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 07:23:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b27ww1zaBl3s6sHtKcefgsEunt60hCqtpTY0L4X8fck=; b=a3AvZzRRpMBJgnJs+H0dXcAQc1
	A0ZVywZloFRf9j2vFh7vSlCNpxPF/GuPTMLMkLMABTrG/b46c+j+ooE3XKZmhzAILHx85jJioJueH
	k7N9Me0peurPGrRFHULN98b2Sxbl5/6G3DmTaZ3WN12IUWrULFvrflwkQVFId8aZwBOs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhifc-0004wa-Ct;
	Mon, 19 Jan 2026 06:23:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+f4f5ba1b7319529cbc9c+8184+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vhifb-0004wM-76 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 06:23:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+NhUhc/6MSrksg3M3flw3qmdXbKem6ep9lIeuPBs1Q0=; b=KVdOo3qXKJVIvH7JRSO6XFNh/M
 lHsHH8reo3sms3qFy1Q7LCoNCfLFxelMOJ7k3qR3NmVY9nrqFHUi19YOPlqCBGwPF/fm21iu/k5pl
 0QwiHmnwzniwLUGvAYRPcNAaP4uPlwN3yVekPVhkpuf4nggr8LjzJ6lHKgTtqBkwbxe0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+NhUhc/6MSrksg3M3flw3qmdXbKem6ep9lIeuPBs1Q0=; b=UbxU5+ujaLR2ohb9et/tuva+51
 VrzfhCNC5BmnfrMvcwUmuTsNPIIShnpMTb4ziBEh0sMj+U5ZaybQkstKzrc03SLS9ZhhHgHsgmaY9
 W0rG77EA+UAzwAe4TyyA2S8qeH9zVg91t9pnwnKxzEwo8/OjaVZM3i+9ykGN/z+kqcBw=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhifb-0006g7-Er for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 06:23:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=+NhUhc/6MSrksg3M3flw3qmdXbKem6ep9lIeuPBs1Q0=; b=0qQ8U6bpyFtQqkSdz+AVZ4MBVQ
 prcZrFGv3QdgAMb9T+YXVO0CDSNo16avEPbA67Zg0vDp5VejCryylfwMG/oGYpST+3q4qduy3XtaE
 YibohIfhbTq8fMPLqY55Zuc75id9I2zrEQoEgVbpa9jn8nTBtKlnNtaJwQzqJaV0seIubyii58xdq
 67NDYf1nXFsx61Jv2OUIFOsKebt48s/lruOW2i9mYhn7ufTbkdkTkRFtHF5Euq9i7GtHzLFSG+VVE
 OJYOzondEqPCfAO6HTyoYpElcrEfg3NPM7uLJjeN4RyE3HNe4gUHFQYaAHyG8G5jHD7BV2GJ+GXq6
 I2gbkj8A==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vhifN-00000001Ony-0nFO; Mon, 19 Jan 2026 06:23:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon, 19 Jan 2026 07:22:43 +0100
Message-ID: <20260119062250.3998674-3-hch@lst.de>
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
 Content preview: Directly remove the fsverity_info from the hash and free it
 from clear_inode instead of requiring file systems to handle it.
 Signed-off-by:
 Christoph Hellwig <hch@lst.de> --- fs/btrfs/inode.c | 10 +++-------
 fs/ext4/super.c
 | 1 - fs/f2fs/inode.c | 1 - fs/inode.c | 9 +++++++++ fs/verity/open.c | 3
 +-- include/linux/fsverity. [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vhifb-0006g7-Er
Subject: [f2fs-dev] [PATCH 2/6] fs,
 fsverity: clear out fsverity_info from common code
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

Directly remove the fsverity_info from the hash and free it from
clear_inode instead of requiring file systems to handle it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/btrfs/inode.c         | 10 +++-------
 fs/ext4/super.c          |  1 -
 fs/f2fs/inode.c          |  1 -
 fs/inode.c               |  9 +++++++++
 fs/verity/open.c         |  3 +--
 include/linux/fsverity.h | 26 ++------------------------
 6 files changed, 15 insertions(+), 35 deletions(-)

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index a2b5b440637e..67c64efc5099 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -34,7 +34,6 @@
 #include <linux/sched/mm.h>
 #include <linux/iomap.h>
 #include <linux/unaligned.h>
-#include <linux/fsverity.h>
 #include "misc.h"
 #include "ctree.h"
 #include "disk-io.h"
@@ -5571,11 +5570,8 @@ void btrfs_evict_inode(struct inode *inode)
 
 	trace_btrfs_inode_evict(inode);
 
-	if (!root) {
-		fsverity_cleanup_inode(inode);
-		clear_inode(inode);
-		return;
-	}
+	if (!root)
+		goto clear_inode;
 
 	fs_info = inode_to_fs_info(inode);
 	evict_inode_truncate_pages(inode);
@@ -5675,7 +5671,7 @@ void btrfs_evict_inode(struct inode *inode)
 	 * to retry these periodically in the future.
 	 */
 	btrfs_remove_delayed_node(BTRFS_I(inode));
-	fsverity_cleanup_inode(inode);
+clear_inode:
 	clear_inode(inode);
 }
 
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 87205660c5d0..86131f4d8718 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1527,7 +1527,6 @@ void ext4_clear_inode(struct inode *inode)
 		EXT4_I(inode)->jinode = NULL;
 	}
 	fscrypt_put_encryption_info(inode);
-	fsverity_cleanup_inode(inode);
 }
 
 static struct inode *ext4_nfs_get_inode(struct super_block *sb,
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 38b8994bc1b2..ee332b994348 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -1000,7 +1000,6 @@ void f2fs_evict_inode(struct inode *inode)
 	}
 out_clear:
 	fscrypt_put_encryption_info(inode);
-	fsverity_cleanup_inode(inode);
 	clear_inode(inode);
 }
 
diff --git a/fs/inode.c b/fs/inode.c
index 379f4c19845c..38dbdfbb09ba 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -14,6 +14,7 @@
 #include <linux/cdev.h>
 #include <linux/memblock.h>
 #include <linux/fsnotify.h>
+#include <linux/fsverity.h>
 #include <linux/mount.h>
 #include <linux/posix_acl.h>
 #include <linux/buffer_head.h> /* for inode_has_buffers */
@@ -773,6 +774,14 @@ void dump_mapping(const struct address_space *mapping)
 
 void clear_inode(struct inode *inode)
 {
+	/*
+	 * Only IS_VERITY() inodes can have verity info, so start by checking
+	 * for IS_VERITY() (which is faster than retrieving the pointer to the
+	 * verity info).  This minimizes overhead for non-verity inodes.
+	 */
+	if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode))
+		fsverity_cleanup_inode(inode);
+
 	/*
 	 * We have to cycle the i_pages lock here because reclaim can be in the
 	 * process of removing the last page (in __filemap_remove_folio())
diff --git a/fs/verity/open.c b/fs/verity/open.c
index 2aa5eae5a540..090cb77326ee 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -384,14 +384,13 @@ int __fsverity_file_open(struct inode *inode, struct file *filp)
 }
 EXPORT_SYMBOL_GPL(__fsverity_file_open);
 
-void __fsverity_cleanup_inode(struct inode *inode)
+void fsverity_cleanup_inode(struct inode *inode)
 {
 	struct fsverity_info **vi_addr = fsverity_info_addr(inode);
 
 	fsverity_free_info(*vi_addr);
 	*vi_addr = NULL;
 }
-EXPORT_SYMBOL_GPL(__fsverity_cleanup_inode);
 
 void __init fsverity_init_info_cache(void)
 {
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 86fb1708676b..b7bf2401c574 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -130,6 +130,8 @@ struct fsverity_operations {
 				       u64 pos, unsigned int size);
 };
 
+void fsverity_cleanup_inode(struct inode *inode);
+
 #ifdef CONFIG_FS_VERITY
 
 /*
@@ -179,26 +181,6 @@ int fsverity_get_digest(struct inode *inode,
 /* open.c */
 
 int __fsverity_file_open(struct inode *inode, struct file *filp);
-void __fsverity_cleanup_inode(struct inode *inode);
-
-/**
- * fsverity_cleanup_inode() - free the inode's verity info, if present
- * @inode: an inode being evicted
- *
- * Filesystems must call this on inode eviction to free the inode's verity info.
- */
-static inline void fsverity_cleanup_inode(struct inode *inode)
-{
-	/*
-	 * Only IS_VERITY() inodes can have verity info, so start by checking
-	 * for IS_VERITY() (which is faster than retrieving the pointer to the
-	 * verity info).  This minimizes overhead for non-verity inodes.
-	 */
-	if (IS_VERITY(inode))
-		__fsverity_cleanup_inode(inode);
-	else
-		VFS_WARN_ON_ONCE(*fsverity_info_addr(inode) != NULL);
-}
 
 /* read_metadata.c */
 
@@ -250,10 +232,6 @@ static inline int __fsverity_file_open(struct inode *inode, struct file *filp)
 	return -EOPNOTSUPP;
 }
 
-static inline void fsverity_cleanup_inode(struct inode *inode)
-{
-}
-
 /* read_metadata.c */
 
 static inline int fsverity_ioctl_read_metadata(struct file *filp,
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
