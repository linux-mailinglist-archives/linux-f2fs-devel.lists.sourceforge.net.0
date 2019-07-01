Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B85A5C451
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jul 2019 22:26:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hi2t1-0006VB-Cy; Mon, 01 Jul 2019 20:26:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hi2t0-0006Ux-2v
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 20:26:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k124AyjwPr9iccZ8VDoQ891IoYsYSSxlTymA1RW9zJc=; b=JEuLsigr3jZwva8yAbhm9JFrsD
 49dMNB91MGRUQ9t4bWTWSDaKBQARAYk1F1LHksg7FMHogAJvI3QoorL5Z/GdbO36W5Bo8yfaEpZiy
 XrnRvw7IvMHrrN9Unj+EiMCzgMP9IJXiOu+VsuYus/yl7MtOcnPqYY85SnMpDSWfZHU4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k124AyjwPr9iccZ8VDoQ891IoYsYSSxlTymA1RW9zJc=; b=D7daMtgdC6xaiPKUQfD+0byWYi
 4bnjO7mqaU/f7T9pWUTKf0NFyuIwL5JxMzWXCPNR4RkMVFoLPChvX9MKkAaOe8EKLkHZG7XLF19T2
 Nv48j1o4ucWgPOwXoxrSdqVA0phWCjIGw5EkBMEwT/b8LQ2GT+RpcsZUEa8WKTCQuMBc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hi2t4-000yxL-9a
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 20:26:55 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8C3E22183F;
 Mon,  1 Jul 2019 20:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562012808;
 bh=0cbNlz5thpQTzDjL2iC3/D1sFOhgoRjTU/G57B/uHos=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VE207eP4YrlwzadxlffCTs4jWNIAksZmTAt45yaOZAlvxnO/hBxjkES5ybiT+MO/R
 ETlW6hOZiBGcJ5lGy1mBBTJPQ9y/Vo7hjvC/Rb/XqWHL94eoxc7Yz2tLcUhBJUqDoV
 niPetrQc6a+dYK36yVKUoA5bMlvk1ASuWiyurKh4=
From: Eric Biggers <ebiggers@kernel.org>
To: "Darrick J . Wong" <darrick.wong@oracle.com>
Date: Mon,  1 Jul 2019 13:26:29 -0700
Message-Id: <20190701202630.43776-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190701202630.43776-1-ebiggers@kernel.org>
References: <20190701202630.43776-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hi2t4-000yxL-9a
Subject: [f2fs-dev] [PATCH 2/3] f2fs: use generic checking function for
 FS_IOC_FSSETXATTR
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
Cc: linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Make the f2fs implementation of FS_IOC_FSSETXATTR use the new VFS helper
function vfs_ioc_fssetxattr_check(), and remove the project quota check
since it's now done by the helper function.

This is based on a patch from Darrick Wong, but reworked to apply after
commit 360985573b55 ("f2fs: separate f2fs i_flags from fs_flags and ext4
i_flags").

Originally-from: Darrick J. Wong <darrick.wong@oracle.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/file.c | 45 ++++++++++++++-------------------------------
 1 file changed, 14 insertions(+), 31 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index b5b941e6448657..ae1a54ecc9fccc 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2857,52 +2857,32 @@ static inline u32 f2fs_xflags_to_iflags(u32 xflags)
 	return iflags;
 }
 
-static int f2fs_ioc_fsgetxattr(struct file *filp, unsigned long arg)
+static void f2fs_fill_fsxattr(struct inode *inode, struct fsxattr *fa)
 {
-	struct inode *inode = file_inode(filp);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
-	struct fsxattr fa;
 
-	memset(&fa, 0, sizeof(struct fsxattr));
-	fa.fsx_xflags = f2fs_iflags_to_xflags(fi->i_flags);
+	simple_fill_fsxattr(fa, f2fs_iflags_to_xflags(fi->i_flags));
 
 	if (f2fs_sb_has_project_quota(F2FS_I_SB(inode)))
-		fa.fsx_projid = (__u32)from_kprojid(&init_user_ns,
-							fi->i_projid);
-
-	if (copy_to_user((struct fsxattr __user *)arg, &fa, sizeof(fa)))
-		return -EFAULT;
-	return 0;
+		fa->fsx_projid = from_kprojid(&init_user_ns, fi->i_projid);
 }
 
-static int f2fs_ioctl_check_project(struct inode *inode, struct fsxattr *fa)
+static int f2fs_ioc_fsgetxattr(struct file *filp, unsigned long arg)
 {
-	/*
-	 * Project Quota ID state is only allowed to change from within the init
-	 * namespace. Enforce that restriction only if we are trying to change
-	 * the quota ID state. Everything else is allowed in user namespaces.
-	 */
-	if (current_user_ns() == &init_user_ns)
-		return 0;
-
-	if (__kprojid_val(F2FS_I(inode)->i_projid) != fa->fsx_projid)
-		return -EINVAL;
+	struct inode *inode = file_inode(filp);
+	struct fsxattr fa;
 
-	if (F2FS_I(inode)->i_flags & F2FS_PROJINHERIT_FL) {
-		if (!(fa->fsx_xflags & FS_XFLAG_PROJINHERIT))
-			return -EINVAL;
-	} else {
-		if (fa->fsx_xflags & FS_XFLAG_PROJINHERIT)
-			return -EINVAL;
-	}
+	f2fs_fill_fsxattr(inode, &fa);
 
+	if (copy_to_user((struct fsxattr __user *)arg, &fa, sizeof(fa)))
+		return -EFAULT;
 	return 0;
 }
 
 static int f2fs_ioc_fssetxattr(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
-	struct fsxattr fa;
+	struct fsxattr fa, old_fa;
 	u32 iflags;
 	int err;
 
@@ -2925,9 +2905,12 @@ static int f2fs_ioc_fssetxattr(struct file *filp, unsigned long arg)
 		return err;
 
 	inode_lock(inode);
-	err = f2fs_ioctl_check_project(inode, &fa);
+
+	f2fs_fill_fsxattr(inode, &old_fa);
+	err = vfs_ioc_fssetxattr_check(inode, &old_fa, &fa);
 	if (err)
 		goto out;
+
 	err = f2fs_setflags_common(inode, iflags,
 			f2fs_xflags_to_iflags(F2FS_SUPPORTED_XFLAGS));
 	if (err)
-- 
2.22.0.410.gd8fdbe21b5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
