Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC87D39E5E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 07:23:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xOYkysd8Up0kc7Kawg6kRvvunyZqAorfD6oh11i768g=; b=TvFegfxkAFNooyBt0uMjWJvjpr
	JYuuIV13542jSRkYhahHKv8PEpM28n6uM6DI76y/FPRStiQjUlXhx0N3QaOBouy28a4y6Iksob1FV
	p5CuMG0v0fmLj2bS8IzC2x4aED2qQVH6QffCedjbuHBc1gpD6SoQjjIC+cHBt437vZ8M=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhifj-0000dP-4x;
	Mon, 19 Jan 2026 06:23:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+f4f5ba1b7319529cbc9c+8184+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vhifh-0000dH-KS for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 06:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m7GlT00SLu2Nm7/9Y9dcJI7Ezxq/U09mHeb0mFUU1Nk=; b=Dr61huP89QSP7gzils8Wwn/wnf
 LNAKTCMAOX8DrfyK1qCRUEKahAXNnAmSMp5+/VwHe1c5zWIxrXLPsJAo3zgar0NWhpDe3OfhAuGS2
 izmVHgxNX6Sux1qmseTUmau8jeo/U7ur6bxoaFBjU9zKXjloj1OKJfHUMSPmCJedqoRs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m7GlT00SLu2Nm7/9Y9dcJI7Ezxq/U09mHeb0mFUU1Nk=; b=TPHQK9beTW1jjVK6TMzTPW/sec
 UrAvNFTL03aqlHRWKeWH5tBGbL1dGDDg2S6xl8+ocd9wUL4pOpU+iG7Ry+AbXzV8wYRUzoHahDL+I
 QkCCaxgqGkCkO8eP/inF7RFHX9qp954j2HMSRftm/EcbTJhdgfu447Xzut+Y7a8rVIM8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhifg-0006gE-Dc for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 06:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=m7GlT00SLu2Nm7/9Y9dcJI7Ezxq/U09mHeb0mFUU1Nk=; b=zUknqBWIS9Rpc40DAMxqJ6Go0w
 q23jH0m6JroMnfB1Ycgm3HvXINgUnflNJHvr7lP0GH0ABx+mI8ueI9buq/YRQTW6FbnFt7SSADibv
 AhNDhUgWwpgOtOgIXh1PegJ5hIWUAU10bX0ZKL20L2FukchpIf0GjzTLLznilSg9PtLNtHpo/M8qH
 eRRYz+mB/J/SY079opfS4ahe6CQ0bhYMgQaRu6wNJQpQnMh8eHjuWV11G927xyy2HkNjzwQ8Uz7DJ
 wp5C3pLFyWLHxujHlyJwFRaMaJBCPvbqYwxCwbRbpj7+e/Uq++nBD+ZXpJz5pLJZ/tekta0ESn9et
 djokk29g==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vhifS-00000001OoB-2fOA; Mon, 19 Jan 2026 06:23:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon, 19 Jan 2026 07:22:44 +0100
Message-ID: <20260119062250.3998674-4-hch@lst.de>
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
 Content preview: Call into fsverity_file_open from generic_file_open instead
 of requiring the file system to handle it explicitly. Signed-off-by: Christoph
 Hellwig <hch@lst.de> --- fs/btrfs/file.c | 6 ------ fs/ext4/file.c | 4 ----
 fs/f2fs/file.c | 4 ---- fs/open.c | 8 +++++++- fs/verity/open.c | 10
 ++++++++-- include/linux/fsver [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vhifg-0006gE-Dc
Subject: [f2fs-dev] [PATCH 3/6] fs,
 fsverity: handle fsverity in generic_file_open
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

Call into fsverity_file_open from generic_file_open instead of requiring
the file system to handle it explicitly.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/btrfs/file.c          |  6 ------
 fs/ext4/file.c           |  4 ----
 fs/f2fs/file.c           |  4 ----
 fs/open.c                |  8 +++++++-
 fs/verity/open.c         | 10 ++++++++--
 include/linux/fsverity.h | 32 +-------------------------------
 6 files changed, 16 insertions(+), 48 deletions(-)

diff --git a/fs/btrfs/file.c b/fs/btrfs/file.c
index 1abc7ed2990e..4b3a31b2b52e 100644
--- a/fs/btrfs/file.c
+++ b/fs/btrfs/file.c
@@ -3808,16 +3808,10 @@ static loff_t btrfs_file_llseek(struct file *file, loff_t offset, int whence)
 
 static int btrfs_file_open(struct inode *inode, struct file *filp)
 {
-	int ret;
-
 	if (unlikely(btrfs_is_shutdown(inode_to_fs_info(inode))))
 		return -EIO;
 
 	filp->f_mode |= FMODE_NOWAIT | FMODE_CAN_ODIRECT;
-
-	ret = fsverity_file_open(inode, filp);
-	if (ret)
-		return ret;
 	return generic_file_open(inode, filp);
 }
 
diff --git a/fs/ext4/file.c b/fs/ext4/file.c
index 7a8b30932189..a7dc8c10273e 100644
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@ -906,10 +906,6 @@ static int ext4_file_open(struct inode *inode, struct file *filp)
 	if (ret)
 		return ret;
 
-	ret = fsverity_file_open(inode, filp);
-	if (ret)
-		return ret;
-
 	/*
 	 * Set up the jbd2_inode if we are opening the inode for
 	 * writing and the journal is present
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index da029fed4e5a..f1510ab657b6 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -624,10 +624,6 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
 	if (!f2fs_is_compress_backend_ready(inode))
 		return -EOPNOTSUPP;
 
-	err = fsverity_file_open(inode, filp);
-	if (err)
-		return err;
-
 	filp->f_mode |= FMODE_NOWAIT;
 	filp->f_mode |= FMODE_CAN_ODIRECT;
 
diff --git a/fs/open.c b/fs/open.c
index f328622061c5..dea93bab8795 100644
--- a/fs/open.c
+++ b/fs/open.c
@@ -10,6 +10,7 @@
 #include <linux/file.h>
 #include <linux/fdtable.h>
 #include <linux/fsnotify.h>
+#include <linux/fsverity.h>
 #include <linux/module.h>
 #include <linux/tty.h>
 #include <linux/namei.h>
@@ -1604,10 +1605,15 @@ SYSCALL_DEFINE0(vhangup)
  * the caller didn't specify O_LARGEFILE.  On 64bit systems we force
  * on this flag in sys_open.
  */
-int generic_file_open(struct inode * inode, struct file * filp)
+int generic_file_open(struct inode *inode, struct file *filp)
 {
 	if (!(filp->f_flags & O_LARGEFILE) && i_size_read(inode) > MAX_NON_LFS)
 		return -EOVERFLOW;
+	if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode)) {
+		if (filp->f_mode & FMODE_WRITE)
+			return -EPERM;
+		return fsverity_file_open(inode, filp);
+	}
 	return 0;
 }
 
diff --git a/fs/verity/open.c b/fs/verity/open.c
index 090cb77326ee..8ed915be9c91 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -376,13 +376,19 @@ static int ensure_verity_info(struct inode *inode)
 	return err;
 }
 
-int __fsverity_file_open(struct inode *inode, struct file *filp)
+/*
+ * When opening a verity file, deny the open if it is for writing.  Otherwise,
+ * set up the inode's verity info if not already done.
+ *
+ * When combined with fscrypt, this must be called after fscrypt_file_open().
+ * Otherwise, we won't have the key set up to decrypt the verity metadata.
+ */
+int fsverity_file_open(struct inode *inode, struct file *filp)
 {
 	if (filp->f_mode & FMODE_WRITE)
 		return -EPERM;
 	return ensure_verity_info(inode);
 }
-EXPORT_SYMBOL_GPL(__fsverity_file_open);
 
 void fsverity_cleanup_inode(struct inode *inode)
 {
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index b7bf2401c574..4980ea55cdaa 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -130,6 +130,7 @@ struct fsverity_operations {
 				       u64 pos, unsigned int size);
 };
 
+int fsverity_file_open(struct inode *inode, struct file *filp);
 void fsverity_cleanup_inode(struct inode *inode);
 
 #ifdef CONFIG_FS_VERITY
@@ -178,10 +179,6 @@ int fsverity_get_digest(struct inode *inode,
 			u8 raw_digest[FS_VERITY_MAX_DIGEST_SIZE],
 			u8 *alg, enum hash_algo *halg);
 
-/* open.c */
-
-int __fsverity_file_open(struct inode *inode, struct file *filp);
-
 /* read_metadata.c */
 
 int fsverity_ioctl_read_metadata(struct file *filp, const void __user *uarg);
@@ -225,13 +222,6 @@ static inline int fsverity_get_digest(struct inode *inode,
 	return 0;
 }
 
-/* open.c */
-
-static inline int __fsverity_file_open(struct inode *inode, struct file *filp)
-{
-	return -EOPNOTSUPP;
-}
-
 /* read_metadata.c */
 
 static inline int fsverity_ioctl_read_metadata(struct file *filp,
@@ -289,24 +279,4 @@ static inline bool fsverity_active(const struct inode *inode)
 	return fsverity_get_info(inode) != NULL;
 }
 
-/**
- * fsverity_file_open() - prepare to open a verity file
- * @inode: the inode being opened
- * @filp: the struct file being set up
- *
- * When opening a verity file, deny the open if it is for writing.  Otherwise,
- * set up the inode's verity info if not already done.
- *
- * When combined with fscrypt, this must be called after fscrypt_file_open().
- * Otherwise, we won't have the key set up to decrypt the verity metadata.
- *
- * Return: 0 on success, -errno on failure
- */
-static inline int fsverity_file_open(struct inode *inode, struct file *filp)
-{
-	if (IS_VERITY(inode))
-		return __fsverity_file_open(inode, filp);
-	return 0;
-}
-
 #endif	/* _LINUX_FSVERITY_H */
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
