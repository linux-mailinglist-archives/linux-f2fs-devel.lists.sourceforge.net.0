Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E28299AC47
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Aug 2019 11:59:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i16LT-000601-Uo; Fri, 23 Aug 2019 09:58:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i16LS-0005zk-HW
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Aug 2019 09:58:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eJ4AT+ZSRitL4UUAOhMRsgY+R9U8kkAVWhkePNUJUpU=; b=Mig7tQLJf3xtLHfwno97Scdm+e
 3ikw4KJ1eI4IJSQcgdFkIAEiawGuHJ79cnWQrNmiYXTCmvKw7PsskdRzTRB6t6JXCISxhsz7YBfA6
 +7FV9pT9EAap5wg6qI2p3oaTNpoi9hC8VHRqNrNyx7SdQp6IR4ZnH9V56gScSBdhFWdg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eJ4AT+ZSRitL4UUAOhMRsgY+R9U8kkAVWhkePNUJUpU=; b=fSBFBfgahQIxb3s9XTTisK6Jko
 2p7FPM9xM520a0e6tHfygLhzNMBtYkUlgfwqKp3vR46Nz7O9cfBIlaXyibr2Jgak/tlxIDqvWnZbf
 ji1JDWG5UfaiXSk0X8BzYbkTl1zRLTC78vi5iObokOn2ua6WsLvnm4Xil1Ezgl12X4Ys=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i16LO-00Cr6b-RF
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Aug 2019 09:58:58 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id ADB76A3E56D603C648FA;
 Fri, 23 Aug 2019 17:58:46 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Fri, 23 Aug 2019 17:58:39 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 23 Aug 2019 17:58:36 +0800
Message-ID: <20190823095836.28569-3-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20190823095836.28569-1-yuchao0@huawei.com>
References: <20190823095836.28569-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i16LO-00Cr6b-RF
Subject: [f2fs-dev] [PATCH 3/3] f2fs: enhance f2fs_is_checkpoint_ready()'s
 readability
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

This patch changes sematics of f2fs_is_checkpoint_ready()'s return
value as: return true when checkpoint is ready, other return false,
it can improve readability of below conditions.

f2fs_submit_page_write()
...
	if (is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN) ||
				!f2fs_is_checkpoint_ready(sbi))
		__submit_merged_bio(io);

f2fs_balance_fs()
...
	if (!f2fs_is_checkpoint_ready(sbi))
		return;

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/data.c    |  7 ++++---
 fs/f2fs/file.c    | 18 ++++++++----------
 fs/f2fs/inode.c   |  2 +-
 fs/f2fs/namei.c   | 36 ++++++++++++++----------------------
 fs/f2fs/segment.c |  2 +-
 fs/f2fs/segment.h |  8 ++++----
 fs/f2fs/xattr.c   |  5 ++---
 7 files changed, 34 insertions(+), 44 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 769c548e955a..bf648c8c50ad 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -634,7 +634,7 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
 		goto next;
 out:
 	if (is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN) ||
-				f2fs_is_checkpoint_ready(sbi))
+				!f2fs_is_checkpoint_ready(sbi))
 		__submit_merged_bio(io);
 	up_write(&io->io_rwsem);
 }
@@ -2571,9 +2571,10 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 
 	trace_f2fs_write_begin(inode, pos, len, flags);
 
-	err = f2fs_is_checkpoint_ready(sbi);
-	if (err)
+	if (!f2fs_is_checkpoint_ready(sbi)) {
+		err = -ENOSPC;
 		goto fail;
+	}
 
 	if ((f2fs_is_atomic_file(inode) &&
 			!f2fs_available_free_memory(sbi, INMEM_PAGES)) ||
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 05d60082da3a..97038a9a91e3 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -57,9 +57,11 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 		err = -EIO;
 		goto err;
 	}
-	err = f2fs_is_checkpoint_ready(sbi);
-	if (err)
+
+	if (!f2fs_is_checkpoint_ready(sbi)) {
+		err = -ENOSPC;
 		goto err;
+	}
 
 	sb_start_pagefault(inode->i_sb);
 
@@ -1575,9 +1577,8 @@ static long f2fs_fallocate(struct file *file, int mode,
 
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
 		return -EIO;
-	ret = f2fs_is_checkpoint_ready(F2FS_I_SB(inode));
-	if (ret)
-		return ret;
+	if (!f2fs_is_checkpoint_ready(F2FS_I_SB(inode)))
+		return -ENOSPC;
 
 	/* f2fs only support ->fallocate for regular file */
 	if (!S_ISREG(inode->i_mode))
@@ -3162,13 +3163,10 @@ static int f2fs_set_volume_name(struct file *filp, unsigned long arg)
 
 long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
-	int ret;
-
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(file_inode(filp)))))
 		return -EIO;
-	ret = f2fs_is_checkpoint_ready(F2FS_I_SB(file_inode(filp)));
-	if (ret)
-		return ret;
+	if (!f2fs_is_checkpoint_ready(F2FS_I_SB(file_inode(filp))))
+		return -ENOSPC;
 
 	switch (cmd) {
 	case F2FS_IOC_GETFLAGS:
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 88af85e0db62..87214414936b 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -616,7 +616,7 @@ int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc)
 	if (!is_inode_flag_set(inode, FI_DIRTY_INODE))
 		return 0;
 
-	if (f2fs_is_checkpoint_ready(sbi))
+	if (!f2fs_is_checkpoint_ready(sbi))
 		return -ENOSPC;
 
 	/*
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 7a2d43a9f1a6..8b02c69df199 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -272,9 +272,8 @@ static int f2fs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 
 	if (unlikely(f2fs_cp_error(sbi)))
 		return -EIO;
-	err = f2fs_is_checkpoint_ready(sbi);
-	if (err)
-		return err;
+	if (!f2fs_is_checkpoint_ready(sbi))
+		return -ENOSPC;
 
 	err = dquot_initialize(dir);
 	if (err)
@@ -321,9 +320,8 @@ static int f2fs_link(struct dentry *old_dentry, struct inode *dir,
 
 	if (unlikely(f2fs_cp_error(sbi)))
 		return -EIO;
-	err = f2fs_is_checkpoint_ready(sbi);
-	if (err)
-		return err;
+	if (!f2fs_is_checkpoint_ready(sbi))
+		return -ENOSPC;
 
 	err = fscrypt_prepare_link(old_dentry, dir, dentry);
 	if (err)
@@ -592,9 +590,8 @@ static int f2fs_symlink(struct inode *dir, struct dentry *dentry,
 
 	if (unlikely(f2fs_cp_error(sbi)))
 		return -EIO;
-	err = f2fs_is_checkpoint_ready(sbi);
-	if (err)
-		return err;
+	if (!f2fs_is_checkpoint_ready(sbi))
+		return -ENOSPC;
 
 	err = fscrypt_prepare_symlink(dir, symname, len, dir->i_sb->s_blocksize,
 				      &disk_link);
@@ -724,9 +721,8 @@ static int f2fs_mknod(struct inode *dir, struct dentry *dentry,
 
 	if (unlikely(f2fs_cp_error(sbi)))
 		return -EIO;
-	err = f2fs_is_checkpoint_ready(sbi);
-	if (err)
-		return err;
+	if (!f2fs_is_checkpoint_ready(sbi))
+		return -ENOSPC;
 
 	err = dquot_initialize(dir);
 	if (err)
@@ -822,13 +818,11 @@ static int __f2fs_tmpfile(struct inode *dir, struct dentry *dentry,
 static int f2fs_tmpfile(struct inode *dir, struct dentry *dentry, umode_t mode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
-	int ret;
 
 	if (unlikely(f2fs_cp_error(sbi)))
 		return -EIO;
-	ret = f2fs_is_checkpoint_ready(sbi);
-	if (ret)
-		return ret;
+	if (!f2fs_is_checkpoint_ready(sbi))
+		return -ENOSPC;
 
 	if (IS_ENCRYPTED(dir) || DUMMY_ENCRYPTION_ENABLED(sbi)) {
 		int err = fscrypt_get_encryption_info(dir);
@@ -865,9 +859,8 @@ static int f2fs_rename(struct inode *old_dir, struct dentry *old_dentry,
 
 	if (unlikely(f2fs_cp_error(sbi)))
 		return -EIO;
-	err = f2fs_is_checkpoint_ready(sbi);
-	if (err)
-		return err;
+	if (!f2fs_is_checkpoint_ready(sbi))
+		return -ENOSPC;
 
 	if (is_inode_flag_set(new_dir, FI_PROJ_INHERIT) &&
 			(!projid_eq(F2FS_I(new_dir)->i_projid,
@@ -1060,9 +1053,8 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
 
 	if (unlikely(f2fs_cp_error(sbi)))
 		return -EIO;
-	err = f2fs_is_checkpoint_ready(sbi);
-	if (err)
-		return err;
+	if (!f2fs_is_checkpoint_ready(sbi))
+		return -ENOSPC;
 
 	if ((is_inode_flag_set(new_dir, FI_PROJ_INHERIT) &&
 			!projid_eq(F2FS_I(new_dir)->i_projid,
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index b6f838c055d7..ccee5fb69479 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -501,7 +501,7 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 	if (need && excess_cached_nats(sbi))
 		f2fs_balance_fs_bg(sbi);
 
-	if (f2fs_is_checkpoint_ready(sbi))
+	if (!f2fs_is_checkpoint_ready(sbi))
 		return;
 
 	/*
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 38ae95301169..bdcce35be077 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -593,13 +593,13 @@ static inline bool has_not_enough_free_secs(struct f2fs_sb_info *sbi,
 		reserved_sections(sbi) + needed);
 }
 
-static inline int f2fs_is_checkpoint_ready(struct f2fs_sb_info *sbi)
+static inline bool f2fs_is_checkpoint_ready(struct f2fs_sb_info *sbi)
 {
 	if (likely(!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
-		return 0;
+		return true;
 	if (likely(!has_not_enough_free_secs(sbi, 0, 0)))
-		return 0;
-	return -ENOSPC;
+		return true;
+	return false;
 }
 
 static inline bool excess_prefree_segs(struct f2fs_sb_info *sbi)
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index f85c810e33ca..181900af2576 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -732,9 +732,8 @@ int f2fs_setxattr(struct inode *inode, int index, const char *name,
 
 	if (unlikely(f2fs_cp_error(sbi)))
 		return -EIO;
-	err = f2fs_is_checkpoint_ready(sbi);
-	if (err)
-		return err;
+	if (!f2fs_is_checkpoint_ready(sbi))
+		return -ENOSPC;
 
 	err = dquot_initialize(inode);
 	if (err)
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
