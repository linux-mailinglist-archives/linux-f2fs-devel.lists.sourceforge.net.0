Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB4343E1BC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Oct 2021 15:12:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mg5Cb-0001H3-G0; Thu, 28 Oct 2021 13:12:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mg5Ca-0001Gr-Kj
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Oct 2021 13:12:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2fP6rUNNO3NlC6oNQlxw79vVfhHjolOxvjULp2DKlNg=; b=T/nPrub6fwGX2EZFFmQvZTuhEj
 rDI+a/WQFDWsLi/81DjAVtqIiAQWr8dqjk/PZ7AIuBXIpBHKk3dwc4K6294l19ukkFQcgp//NjYLc
 AtQElgb7tMAMrNW2MYoPcAYn5uvPMvwI9atGMLFTdfsC5asGWBzGGCdMjuYfVloNfrn8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2fP6rUNNO3NlC6oNQlxw79vVfhHjolOxvjULp2DKlNg=; b=D
 FLirMtFNeWrEqTqG8bBWQwKRBXlJk2otoS5W7NXdU07uUrapj2oBt183ErM1ZYDqzncrSYm3jL7jF
 ekMCrls9W5uZxvc+bKvlkFYqNwsw5sCWJA+wIcYNTbM1uOBoUnMT2+e7PPng8JzhnrPrO7XyCRai8
 RX4lIyoQa++DIbjI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mg5CT-003cMI-LY
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Oct 2021 13:12:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9978160F0F;
 Thu, 28 Oct 2021 13:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635426192;
 bh=G3llENj5zaWeQ3Ev+d/6q267AlCv0UdQYTb35WjjKwA=;
 h=From:To:Cc:Subject:Date:From;
 b=rQn+eRLR4hMkkO0ZA/eIevaJk1/2IZPe6TPxZiwCsayddfnRnQsFGoSAEN0LmJRF2
 it0LSPyTwqPNvzXlyrJHx9uHqDU6FLT9g0EhuIg0YYyw/WIZTZYjaCTZ8rfpOk4WM3
 FPdxJDGEwmBygicRse393rdSLb+ofX70lexrpnBos8FqpuuSDjZePfvPBdkVxMBRR3
 DV84DxgKkHcScHQbJVLhrJB5WVpY42xTA7eyu3F4E9vqw2WnaMti0CaV5nFwg9o7vP
 Lbtmw/C/qTDqSBdsRjUmf1Nx4Pt0wKuVhu31XLkJN6IywgOppeK3TnzRzzDpRmsdT7
 +C9EZ882MFZcw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 28 Oct 2021 21:03:05 +0800
Message-Id: <20211028130305.5333-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch adds a new function f2fs_dquot_initialize() to
 wrap dquot_initialize(),
 and it supports to inject fault into f2fs_dquot_initialize()
 to simulate inner failure occurs in dquot_initialize(). 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mg5CT-003cMI-LY
Subject: [f2fs-dev] [PATCH] f2fs: support fault injection for
 dquot_initialize()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch adds a new function f2fs_dquot_initialize() to wrap
dquot_initialize(), and it supports to inject fault into
f2fs_dquot_initialize() to simulate inner failure occurs in
dquot_initialize().

Usage:
a) echo 65536 > /sys/fs/f2fs/<dev>/inject_type or
b) mount -o fault_type=65536 <dev> <mountpoint>

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/filesystems/f2fs.rst |  1 +
 fs/f2fs/checkpoint.c               |  2 +-
 fs/f2fs/f2fs.h                     |  2 ++
 fs/f2fs/file.c                     |  6 +++---
 fs/f2fs/inline.c                   |  2 +-
 fs/f2fs/inode.c                    |  2 +-
 fs/f2fs/namei.c                    | 30 +++++++++++++++---------------
 fs/f2fs/recovery.c                 |  6 +++---
 fs/f2fs/super.c                    | 16 ++++++++++++++++
 fs/f2fs/verity.c                   |  2 +-
 fs/f2fs/xattr.c                    |  2 +-
 11 files changed, 45 insertions(+), 26 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 4294db649fa8..6954c04753ad 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -197,6 +197,7 @@ fault_type=%d		 Support configuring fault injection type, should be
 			 FAULT_DISCARD		  0x000002000
 			 FAULT_WRITE_IO		  0x000004000
 			 FAULT_SLAB_ALLOC	  0x000008000
+			 FAULT_DQUOT_INIT	  0x000010000
 			 ===================	  ===========
 mode=%s			 Control block allocation mode which supports "adaptive"
 			 and "lfs". In "lfs" mode, there should be no random
diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 6f6a7d812d60..f1693d45bb78 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -653,7 +653,7 @@ static int recover_orphan_inode(struct f2fs_sb_info *sbi, nid_t ino)
 		return PTR_ERR(inode);
 	}
 
-	err = dquot_initialize(inode);
+	err = f2fs_dquot_initialize(inode);
 	if (err) {
 		iput(inode);
 		goto err_out;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c8c7d9e7dd7a..ce9fc9f13000 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -55,6 +55,7 @@ enum {
 	FAULT_DISCARD,
 	FAULT_WRITE_IO,
 	FAULT_SLAB_ALLOC,
+	FAULT_DQUOT_INIT,
 	FAULT_MAX,
 };
 
@@ -3376,6 +3377,7 @@ static inline int f2fs_add_link(struct dentry *dentry, struct inode *inode)
  */
 int f2fs_inode_dirtied(struct inode *inode, bool sync);
 void f2fs_inode_synced(struct inode *inode);
+int f2fs_dquot_initialize(struct inode *inode);
 int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly);
 int f2fs_quota_sync(struct super_block *sb, int type);
 loff_t max_file_blocks(struct inode *inode);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 9c8ef33bd8d3..abe7edc82582 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -786,7 +786,7 @@ int f2fs_truncate(struct inode *inode)
 		return -EIO;
 	}
 
-	err = dquot_initialize(inode);
+	err = f2fs_dquot_initialize(inode);
 	if (err)
 		return err;
 
@@ -916,7 +916,7 @@ int f2fs_setattr(struct user_namespace *mnt_userns, struct dentry *dentry,
 		return err;
 
 	if (is_quota_modification(inode, attr)) {
-		err = dquot_initialize(inode);
+		err = f2fs_dquot_initialize(inode);
 		if (err)
 			return err;
 	}
@@ -3020,7 +3020,7 @@ static int f2fs_ioc_setproject(struct inode *inode, __u32 projid)
 	}
 	f2fs_put_page(ipage, 1);
 
-	err = dquot_initialize(inode);
+	err = f2fs_dquot_initialize(inode);
 	if (err)
 		return err;
 
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 56a20d5c15da..ea08f0dfa1bd 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -192,7 +192,7 @@ int f2fs_convert_inline_inode(struct inode *inode)
 			f2fs_hw_is_readonly(sbi) || f2fs_readonly(sbi->sb))
 		return 0;
 
-	err = dquot_initialize(inode);
+	err = f2fs_dquot_initialize(inode);
 	if (err)
 		return err;
 
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 1213f15ffd68..0f8b2df3e1e0 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -754,7 +754,7 @@ void f2fs_evict_inode(struct inode *inode)
 	if (inode->i_nlink || is_bad_inode(inode))
 		goto no_delete;
 
-	err = dquot_initialize(inode);
+	err = f2fs_dquot_initialize(inode);
 	if (err) {
 		err = 0;
 		set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index ae0838001480..a728a0af9ce0 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -74,7 +74,7 @@ static struct inode *f2fs_new_inode(struct inode *dir, umode_t mode)
 	if (err)
 		goto fail_drop;
 
-	err = dquot_initialize(inode);
+	err = f2fs_dquot_initialize(inode);
 	if (err)
 		goto fail_drop;
 
@@ -345,7 +345,7 @@ static int f2fs_create(struct user_namespace *mnt_userns, struct inode *dir,
 	if (!f2fs_is_checkpoint_ready(sbi))
 		return -ENOSPC;
 
-	err = dquot_initialize(dir);
+	err = f2fs_dquot_initialize(dir);
 	if (err)
 		return err;
 
@@ -404,7 +404,7 @@ static int f2fs_link(struct dentry *old_dentry, struct inode *dir,
 			F2FS_I(old_dentry->d_inode)->i_projid)))
 		return -EXDEV;
 
-	err = dquot_initialize(dir);
+	err = f2fs_dquot_initialize(dir);
 	if (err)
 		return err;
 
@@ -460,7 +460,7 @@ static int __recover_dot_dentries(struct inode *dir, nid_t pino)
 		return 0;
 	}
 
-	err = dquot_initialize(dir);
+	err = f2fs_dquot_initialize(dir);
 	if (err)
 		return err;
 
@@ -598,10 +598,10 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 		goto fail;
 	}
 
-	err = dquot_initialize(dir);
+	err = f2fs_dquot_initialize(dir);
 	if (err)
 		goto fail;
-	err = dquot_initialize(inode);
+	err = f2fs_dquot_initialize(inode);
 	if (err)
 		goto fail;
 
@@ -675,7 +675,7 @@ static int f2fs_symlink(struct user_namespace *mnt_userns, struct inode *dir,
 	if (err)
 		return err;
 
-	err = dquot_initialize(dir);
+	err = f2fs_dquot_initialize(dir);
 	if (err)
 		return err;
 
@@ -746,7 +746,7 @@ static int f2fs_mkdir(struct user_namespace *mnt_userns, struct inode *dir,
 	if (unlikely(f2fs_cp_error(sbi)))
 		return -EIO;
 
-	err = dquot_initialize(dir);
+	err = f2fs_dquot_initialize(dir);
 	if (err)
 		return err;
 
@@ -803,7 +803,7 @@ static int f2fs_mknod(struct user_namespace *mnt_userns, struct inode *dir,
 	if (!f2fs_is_checkpoint_ready(sbi))
 		return -ENOSPC;
 
-	err = dquot_initialize(dir);
+	err = f2fs_dquot_initialize(dir);
 	if (err)
 		return err;
 
@@ -841,7 +841,7 @@ static int __f2fs_tmpfile(struct inode *dir, struct dentry *dentry,
 	struct inode *inode;
 	int err;
 
-	err = dquot_initialize(dir);
+	err = f2fs_dquot_initialize(dir);
 	if (err)
 		return err;
 
@@ -965,16 +965,16 @@ static int f2fs_rename(struct inode *old_dir, struct dentry *old_dentry,
 			return err;
 	}
 
-	err = dquot_initialize(old_dir);
+	err = f2fs_dquot_initialize(old_dir);
 	if (err)
 		goto out;
 
-	err = dquot_initialize(new_dir);
+	err = f2fs_dquot_initialize(new_dir);
 	if (err)
 		goto out;
 
 	if (new_inode) {
-		err = dquot_initialize(new_inode);
+		err = f2fs_dquot_initialize(new_inode);
 		if (err)
 			goto out;
 	}
@@ -1138,11 +1138,11 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
 			F2FS_I(new_dentry->d_inode)->i_projid)))
 		return -EXDEV;
 
-	err = dquot_initialize(old_dir);
+	err = f2fs_dquot_initialize(old_dir);
 	if (err)
 		goto out;
 
-	err = dquot_initialize(new_dir);
+	err = f2fs_dquot_initialize(new_dir);
 	if (err)
 		goto out;
 
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 706ddb3c95c0..6a1b4668d933 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -81,7 +81,7 @@ static struct fsync_inode_entry *add_fsync_inode(struct f2fs_sb_info *sbi,
 	if (IS_ERR(inode))
 		return ERR_CAST(inode);
 
-	err = dquot_initialize(inode);
+	err = f2fs_dquot_initialize(inode);
 	if (err)
 		goto err_out;
 
@@ -203,7 +203,7 @@ static int recover_dentry(struct inode *inode, struct page *ipage,
 			goto out_put;
 		}
 
-		err = dquot_initialize(einode);
+		err = f2fs_dquot_initialize(einode);
 		if (err) {
 			iput(einode);
 			goto out_put;
@@ -508,7 +508,7 @@ static int check_index_in_prev_nodes(struct f2fs_sb_info *sbi,
 		if (IS_ERR(inode))
 			return PTR_ERR(inode);
 
-		ret = dquot_initialize(inode);
+		ret = f2fs_dquot_initialize(inode);
 		if (ret) {
 			iput(inode);
 			return ret;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 989e76ec7fb2..75f706b91ebf 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -58,6 +58,7 @@ const char *f2fs_fault_name[FAULT_MAX] = {
 	[FAULT_DISCARD]		= "discard error",
 	[FAULT_WRITE_IO]	= "write IO error",
 	[FAULT_SLAB_ALLOC]	= "slab alloc",
+	[FAULT_DQUOT_INIT]	= "dquot initialize",
 };
 
 void f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned int rate,
@@ -2499,6 +2500,16 @@ static ssize_t f2fs_quota_write(struct super_block *sb, int type,
 	return len - towrite;
 }
 
+int f2fs_dquot_initialize(struct inode *inode)
+{
+	if (time_to_inject(F2FS_I_SB(inode), FAULT_DQUOT_INIT)) {
+		f2fs_show_injection_info(F2FS_I_SB(inode), FAULT_DQUOT_INIT);
+		return -ESRCH;
+	}
+
+	return dquot_initialize(inode);
+}
+
 static struct dquot **f2fs_get_dquots(struct inode *inode)
 {
 	return F2FS_I(inode)->i_dquot;
@@ -2883,6 +2894,11 @@ static const struct quotactl_ops f2fs_quotactl_ops = {
 	.get_nextdqblk	= dquot_get_next_dqblk,
 };
 #else
+int f2fs_dquot_initialize(struct inode *inode)
+{
+	return 0;
+}
+
 int f2fs_quota_sync(struct super_block *sb, int type)
 {
 	return 0;
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index 03549b5ba204..fe5acdccaae1 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -136,7 +136,7 @@ static int f2fs_begin_enable_verity(struct file *filp)
 	 * here and not rely on ->open() doing it.  This must be done before
 	 * evicting the inline data.
 	 */
-	err = dquot_initialize(inode);
+	err = f2fs_dquot_initialize(inode);
 	if (err)
 		return err;
 
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 1d2d29dcd41c..e348f33bcb2b 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -773,7 +773,7 @@ int f2fs_setxattr(struct inode *inode, int index, const char *name,
 	if (!f2fs_is_checkpoint_ready(sbi))
 		return -ENOSPC;
 
-	err = dquot_initialize(inode);
+	err = f2fs_dquot_initialize(inode);
 	if (err)
 		return err;
 
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
