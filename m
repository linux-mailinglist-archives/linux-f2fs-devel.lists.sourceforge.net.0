Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHLwHCDzdmkzZgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 05:52:48 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 085BA83F62
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 05:52:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgaeN+IL4E3ja9hFQ1Qrm81bcWxUh8odvgz84n2XeYU=; b=i5jLUQa1f3fMVpnyLfWLa85ea6
	oM/ObXiesiXy0miE17IYweBiaNpdBTt3T3pbC7hhLFanO7OKtjgKBJuiVgT+XsZ7nT9wmpaH3hzxN
	DmsMAsFlgmztyZIpAWBPrNV8aJoZsoasr6jSTbRvcEhv0+czO6ZQdqdWiIxoj+9nAq0w=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkEae-0001vV-Nm;
	Mon, 26 Jan 2026 04:52:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+12afb9bb7a5ef89fcdd0+8191+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vkEad-0001vP-MF for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 04:52:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tiEhYLJfu/bJWzWAGoEqv1JQK/ldnE8nfYaqsxqRmME=; b=NtbxxIDGKykQmsUv87n5bKAHxg
 EMConrK7NfjEAWDBqH4xS5rzP1qo87VmFerpLi1UdJE7dSn+MhTWGaMvLfNj0T2Dk71sJvlkaKAk1
 zOHKDCL6/94JkLJqCUL9ceysZPIkmZzYzU+8E6Ds5Avaiodi8HSr0160UCEB8NhlGWmc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tiEhYLJfu/bJWzWAGoEqv1JQK/ldnE8nfYaqsxqRmME=; b=am9SGXtYKF2V6umQRhqSFH5Ffr
 sVBLC9I8K3rRsIb/kFAeCQeD4EM0OuBgJwkNQpF5ruZc+9hbdrB2QkWW5+y7RgJF3zajMHRmhOXYU
 Y2qRRG0Jo7ogAFMY3avnNnOVuxRJCppJOUXuOCYW4gP45Bfs6jB9ZB6poVilqhjSsYA4=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vkEad-0001oX-59 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 04:52:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=tiEhYLJfu/bJWzWAGoEqv1JQK/ldnE8nfYaqsxqRmME=; b=l7wcRBQOnBfMUGbnRz2+KltkAb
 sC04sbi+4QtkLTWZAUJqoqu83mp+4g4J0GZBez22+XlAW20mL8myxaPBismls5fmZaPhjBQhOr/yy
 N3vwgJAPXXSoqvJE7MQk1OxA2ZqAe6mHpSpIz5V0AedfZ5qZ8lJPgooSUZrvaa+5MZht+11UDwnBt
 VzBYsTt2G0ZKRHhC/tjVhJjN4o9+HKMgf6Stm6y4ZZlSTGUU/J0/bXqiqwSui5f0smvBivkdOcdMZ
 OQw6lphgwgrQhDh2Qvj9a5CvTquLmy/fxXUjtnZioXr/DlawVShZSBrgccpTjE4CWI84ycBQ0XmYT
 NLwfkKsQ==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vkEaV-0000000BuPN-0g7V; Mon, 26 Jan 2026 04:52:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon, 26 Jan 2026 05:50:48 +0100
Message-ID: <20260126045212.1381843-3-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260126045212.1381843-1-hch@lst.de>
References: <20260126045212.1381843-1-hch@lst.de>
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
 Content preview: Directly remove the fsverity_info from the hash and free it
 from clear_inode instead of requiring file systems to handle it.
 Signed-off-by:
 Christoph Hellwig <hch@lst.de> Reviewed-by: Jan Kara <jack@suse.cz>
 Reviewed-by:
 "Darrick J. Wong" <djwong@kernel.org> Acked-by: David Sterba
 <dsterba@suse.com> [btrfs] --- fs/btrfs/ino [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vkEad-0001oX-59
Subject: [f2fs-dev] [PATCH 02/16] fs,
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
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:djwong@kernel.org,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.com:email,lst.de:mid,lst.de:email]
X-Rspamd-Queue-Id: 085BA83F62
X-Rspamd-Action: no action

Directly remove the fsverity_info from the hash and free it from
clear_inode instead of requiring file systems to handle it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
Acked-by: David Sterba <dsterba@suse.com> [btrfs]
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
index 86fb1708676b..ea1ed2e6c2f9 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -179,26 +179,6 @@ int fsverity_get_digest(struct inode *inode,
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
 
@@ -250,10 +230,6 @@ static inline int __fsverity_file_open(struct inode *inode, struct file *filp)
 	return -EOPNOTSUPP;
 }
 
-static inline void fsverity_cleanup_inode(struct inode *inode)
-{
-}
-
 /* read_metadata.c */
 
 static inline int fsverity_ioctl_read_metadata(struct file *filp,
@@ -331,4 +307,6 @@ static inline int fsverity_file_open(struct inode *inode, struct file *filp)
 	return 0;
 }
 
+void fsverity_cleanup_inode(struct inode *inode);
+
 #endif	/* _LINUX_FSVERITY_H */
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
