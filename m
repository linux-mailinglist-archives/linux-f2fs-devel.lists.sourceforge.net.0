Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63522390ABC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 May 2021 22:50:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lle0L-00084k-33; Tue, 25 May 2021 20:50:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1lle09-00083y-M3
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 May 2021 20:50:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5DsfZLD9rU80ig6vaQpheYO65zDNYVqhd7mk2DaGYDE=; b=UQ1DptsRV+mdpt118BjXIrrc2t
 QAT1gR8dxVcc4kvhDj9zP4vG6VuGUr381QkuGbN3FqmLrVLSw6PWZlDeRqyh5FTAC1GOkRun+ez7z
 pKgVhJlBYxgVB8OAqUCwFnirWpvhPTj4M2sH9RzGY2zQs3ej6O1JEtTaaemR/2Yelzlw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5DsfZLD9rU80ig6vaQpheYO65zDNYVqhd7mk2DaGYDE=; b=PwejVTB8h0n+i71W2Iv+fYp/Ll
 CoVSJiiUQbsoLHuUvcabWwLtroObSnvtPRsY3bQt5OtSqIq+ZLqa8AY3V6phmRK6BGTmEpP6pr3w8
 4g7A+OImvN+8WCuRVLu8aDNELo2mIvyqatMPacS84udiDG9hP+U5+JL2hse1Zqnjshb4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lle06-005n3g-5d
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 May 2021 20:50:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AABB86140E;
 Tue, 25 May 2021 20:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621975800;
 bh=WdrvbrkL97uxF12QDG+VFdSvWGh5V0sKoD7lYsbjdHA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oirxlvASno54IUjoLBeq8eAr9cIJPE5mcSV/2WpqvG4t5+dKaSQWPcJCuK82YchlZ
 QkpMmcXsjoDir48UGaNcJyE5dwpOvVELMiNb34RfRVuVhcy6irVkV08tfN3xpce9tn
 +olchq9oClc/HHr7ZOJSBP0YK6DQaeFAag7wPhisdheK2SWEA3hRJHfgU+kQomaEbu
 jOc3eYnvee+RIh9rw/Cy2FWpH1hmZdyR35gXICsUKb/5+hQhNH5b2/Ph+Y20SeF6Ma
 nMOWYQfSETiKuDtSdxL1NnivObGL24ErQtlg3tiD1RYKDzAVcAupzFSW+i9CjUv3BQ
 fYiT8b/1YLgUw==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 25 May 2021 13:49:55 -0700
Message-Id: <20210525204955.2512409-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
In-Reply-To: <20210525204955.2512409-1-jaegeuk@kernel.org>
References: <20210525204955.2512409-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lle06-005n3g-5d
Subject: [f2fs-dev] [PATCH 2/2] f2fs: introduce FI_COMPRESS_RELEASED instead
 of using IMMUTABLE bit
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Once we release compressed blocks, we used to set IMMUTABLE bit. But it turned
out it disallows every fs operations which we don't need for compression.

Let's just prevent writing data only.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/compress.c      |  3 ++-
 fs/f2fs/f2fs.h          |  6 ++++++
 fs/f2fs/file.c          | 18 ++++++++++++------
 include/linux/f2fs_fs.h |  1 +
 4 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index bec92ff5ee7d..1c3e98085591 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -928,7 +928,8 @@ static int __f2fs_cluster_blocks(struct inode *inode,
 		}
 
 		f2fs_bug_on(F2FS_I_SB(inode),
-			!compr && ret != cluster_size && !IS_IMMUTABLE(inode));
+			!compr && ret != cluster_size &&
+			!is_inode_flag_set(inode, FI_COMPRESS_RELEASED));
 	}
 fail:
 	f2fs_put_dnode(&dn);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 2c6913261586..9ad502f92529 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -707,6 +707,7 @@ enum {
 	FI_COMPRESS_CORRUPT,	/* indicate compressed cluster is corrupted */
 	FI_MMAP_FILE,		/* indicate file was mmapped */
 	FI_ENABLE_COMPRESS,	/* enable compression in "user" compression mode */
+	FI_COMPRESS_RELEASED,	/* compressed blocks were released */
 	FI_MAX,			/* max flag, never be used */
 };
 
@@ -2748,6 +2749,7 @@ static inline void __mark_inode_dirty_flag(struct inode *inode,
 	case FI_DATA_EXIST:
 	case FI_INLINE_DOTS:
 	case FI_PIN_FILE:
+	case FI_COMPRESS_RELEASED:
 		f2fs_mark_inode_dirty_sync(inode, true);
 	}
 }
@@ -2869,6 +2871,8 @@ static inline void get_inline_info(struct inode *inode, struct f2fs_inode *ri)
 		set_bit(FI_EXTRA_ATTR, fi->flags);
 	if (ri->i_inline & F2FS_PIN_FILE)
 		set_bit(FI_PIN_FILE, fi->flags);
+	if (ri->i_inline & F2FS_COMPRESS_RELEASED)
+		set_bit(FI_COMPRESS_RELEASED, fi->flags);
 }
 
 static inline void set_raw_inline(struct inode *inode, struct f2fs_inode *ri)
@@ -2889,6 +2893,8 @@ static inline void set_raw_inline(struct inode *inode, struct f2fs_inode *ri)
 		ri->i_inline |= F2FS_EXTRA_ATTR;
 	if (is_inode_flag_set(inode, FI_PIN_FILE))
 		ri->i_inline |= F2FS_PIN_FILE;
+	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED))
+		ri->i_inline |= F2FS_COMPRESS_RELEASED;
 }
 
 static inline int f2fs_has_extra_attr(struct inode *inode)
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 4a8c3128b5a5..4714925e1974 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -63,6 +63,9 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	if (unlikely(IS_IMMUTABLE(inode)))
 		return VM_FAULT_SIGBUS;
 
+	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED))
+		return VM_FAULT_SIGBUS;
+
 	if (unlikely(f2fs_cp_error(sbi))) {
 		err = -EIO;
 		goto err;
@@ -3420,7 +3423,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 		goto out;
 	}
 
-	if (IS_IMMUTABLE(inode)) {
+	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -3429,8 +3432,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 	if (ret)
 		goto out;
 
-	F2FS_I(inode)->i_flags |= F2FS_IMMUTABLE_FL;
-	f2fs_set_inode_flags(inode);
+	set_inode_flag(inode, FI_COMPRESS_RELEASED);
 	inode->i_ctime = current_time(inode);
 	f2fs_mark_inode_dirty_sync(inode, true);
 
@@ -3585,7 +3587,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 
 	inode_lock(inode);
 
-	if (!IS_IMMUTABLE(inode)) {
+	if (!is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
 		ret = -EINVAL;
 		goto unlock_inode;
 	}
@@ -3630,8 +3632,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 	up_write(&F2FS_I(inode)->i_mmap_sem);
 
 	if (ret >= 0) {
-		F2FS_I(inode)->i_flags &= ~F2FS_IMMUTABLE_FL;
-		f2fs_set_inode_flags(inode);
+		clear_inode_flag(inode, FI_COMPRESS_RELEASED);
 		inode->i_ctime = current_time(inode);
 		f2fs_mark_inode_dirty_sync(inode, true);
 	}
@@ -4249,6 +4250,11 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		goto unlock;
 	}
 
+	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
+		ret = -EPERM;
+		goto unlock;
+	}
+
 	ret = generic_write_checks(iocb, from);
 	if (ret > 0) {
 		bool preallocated = false;
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 5487a80617a3..f93000c3a127 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -229,6 +229,7 @@ struct f2fs_extent {
 #define F2FS_INLINE_DOTS	0x10	/* file having implicit dot dentries */
 #define F2FS_EXTRA_ATTR		0x20	/* file having extra attribute */
 #define F2FS_PIN_FILE		0x40	/* file should not be gced */
+#define F2FS_COMPRESS_RELEASED	0x80	/* file released compressed blocks */
 
 struct f2fs_inode {
 	__le16 i_mode;			/* file mode */
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
