Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CC8220089
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jul 2020 00:21:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jvTIi-0001v3-A8; Tue, 14 Jul 2020 22:21:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jvTIg-0001uw-T1
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jul 2020 22:21:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Scu0p4nww+vkQ90+Sl26rkXaPHjFdt4R/mAAG3ygNxQ=; b=Bn2itXvaaSFOdeYtph1AdQGCWa
 LjVpkryIRi4IAAMkiNVfstWh+f/kWzjZZtPZ0VIQcnJLQ2fe2hcQ7qtjeiszjSBjXoa9diVJ+daXN
 /f+GbX1VP5l/AxWtn3vRgmxIr5NZnt/cixXaQk80GurjPmr5mag0AFDq6GI05kIi9gAk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Scu0p4nww+vkQ90+Sl26rkXaPHjFdt4R/mAAG3ygNxQ=; b=G
 8j5+bjBn2MPKpr1xJZwfxbHy4JMCSWRphVYu4Bd5iFnQNToNYdWzZuCVxv8xP1l5HLweGjYB/HrRP
 QGiawGEejr7WxMiXm+u7VcMZEWrLPqXyyKj4YWeOFWLgHLECF1Q058BnL8v7Zlg7qS1W9Qvkgvh5+
 bwYm5t0iX/gpIG24=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jvTIc-007eqa-CC
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 14 Jul 2020 22:21:22 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BF0C52068F;
 Tue, 14 Jul 2020 22:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594765267;
 bh=XSYV5t63ahAqNVsdV9wjtMpsltnfyNhCUqzhnLM4KIA=;
 h=From:To:Cc:Subject:Date:From;
 b=yhERn8sionte/ORt2KvZMowXX2OPwmfSfqh5q3/hHhu4lVbMrsM/0ZD6x7RYmssvV
 nEMtv0sxnJf4YpqznFlpfV3Bn2ASMo2U/e0d9Fkoaca3wemudiltCN+IrjkJsgiqJl
 UMqeEuEJp6D/XeCb9XcqF+hgrFOiz91FMcLO27NY=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>
Date: Tue, 14 Jul 2020 15:18:12 -0700
Message-Id: <20200714221812.43464-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Spam-Score: -0.6 (/)
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
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jvTIc-007eqa-CC
Subject: [f2fs-dev] [PATCH] f2fs: use generic names for generic ioctls
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
Cc: linux-fscrypt@vger.kernel.org, Jiaheng Hu <jiahengh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Don't define F2FS_IOC_* aliases to ioctls that already have a generic
FS_IOC_* name.  These aliases are unnecessary, and they make it unclear
which ioctls are f2fs-specific and which are generic.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/f2fs.h | 25 +----------------------
 fs/f2fs/file.c | 54 +++++++++++++++++++++++++-------------------------
 2 files changed, 28 insertions(+), 51 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 64835c872842..3d9dd32a176a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -402,12 +402,8 @@ static inline bool __has_cursum_space(struct f2fs_journal *journal,
 }
 
 /*
- * ioctl commands
+ * f2fs-specific ioctl commands
  */
-#define F2FS_IOC_GETFLAGS		FS_IOC_GETFLAGS
-#define F2FS_IOC_SETFLAGS		FS_IOC_SETFLAGS
-#define F2FS_IOC_GETVERSION		FS_IOC_GETVERSION
-
 #define F2FS_IOCTL_MAGIC		0xf5
 #define F2FS_IOC_START_ATOMIC_WRITE	_IO(F2FS_IOCTL_MAGIC, 1)
 #define F2FS_IOC_COMMIT_ATOMIC_WRITE	_IO(F2FS_IOCTL_MAGIC, 2)
@@ -437,13 +433,6 @@ static inline bool __has_cursum_space(struct f2fs_journal *journal,
 #define F2FS_IOC_SEC_TRIM_FILE		_IOW(F2FS_IOCTL_MAGIC, 20,	\
 						struct f2fs_sectrim_range)
 
-#define F2FS_IOC_GET_VOLUME_NAME	FS_IOC_GETFSLABEL
-#define F2FS_IOC_SET_VOLUME_NAME	FS_IOC_SETFSLABEL
-
-#define F2FS_IOC_SET_ENCRYPTION_POLICY	FS_IOC_SET_ENCRYPTION_POLICY
-#define F2FS_IOC_GET_ENCRYPTION_POLICY	FS_IOC_GET_ENCRYPTION_POLICY
-#define F2FS_IOC_GET_ENCRYPTION_PWSALT	FS_IOC_GET_ENCRYPTION_PWSALT
-
 /*
  * should be same as XFS_IOC_GOINGDOWN.
  * Flags for going down operation used by FS_IOC_GOINGDOWN
@@ -462,18 +451,6 @@ static inline bool __has_cursum_space(struct f2fs_journal *journal,
 #define F2FS_TRIM_FILE_ZEROOUT		0x2	/* zero out */
 #define F2FS_TRIM_FILE_MASK		0x3
 
-#if defined(__KERNEL__) && defined(CONFIG_COMPAT)
-/*
- * ioctl commands in 32 bit emulation
- */
-#define F2FS_IOC32_GETFLAGS		FS_IOC32_GETFLAGS
-#define F2FS_IOC32_SETFLAGS		FS_IOC32_SETFLAGS
-#define F2FS_IOC32_GETVERSION		FS_IOC32_GETVERSION
-#endif
-
-#define F2FS_IOC_FSGETXATTR		FS_IOC_FSGETXATTR
-#define F2FS_IOC_FSSETXATTR		FS_IOC_FSSETXATTR
-
 struct f2fs_gc_range {
 	u32 sync;
 	u64 start;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 2485841e3b2d..fbf959a4755c 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3363,7 +3363,7 @@ static int f2fs_ioc_measure_verity(struct file *filp, unsigned long arg)
 	return fsverity_ioctl_measure(filp, (void __user *)arg);
 }
 
-static int f2fs_get_volume_name(struct file *filp, unsigned long arg)
+static int f2fs_ioc_getfslabel(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
@@ -3389,7 +3389,7 @@ static int f2fs_get_volume_name(struct file *filp, unsigned long arg)
 	return err;
 }
 
-static int f2fs_set_volume_name(struct file *filp, unsigned long arg)
+static int f2fs_ioc_setfslabel(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
@@ -3946,11 +3946,11 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return -ENOSPC;
 
 	switch (cmd) {
-	case F2FS_IOC_GETFLAGS:
+	case FS_IOC_GETFLAGS:
 		return f2fs_ioc_getflags(filp, arg);
-	case F2FS_IOC_SETFLAGS:
+	case FS_IOC_SETFLAGS:
 		return f2fs_ioc_setflags(filp, arg);
-	case F2FS_IOC_GETVERSION:
+	case FS_IOC_GETVERSION:
 		return f2fs_ioc_getversion(filp, arg);
 	case F2FS_IOC_START_ATOMIC_WRITE:
 		return f2fs_ioc_start_atomic_write(filp);
@@ -3966,11 +3966,11 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_ioc_shutdown(filp, arg);
 	case FITRIM:
 		return f2fs_ioc_fitrim(filp, arg);
-	case F2FS_IOC_SET_ENCRYPTION_POLICY:
+	case FS_IOC_SET_ENCRYPTION_POLICY:
 		return f2fs_ioc_set_encryption_policy(filp, arg);
-	case F2FS_IOC_GET_ENCRYPTION_POLICY:
+	case FS_IOC_GET_ENCRYPTION_POLICY:
 		return f2fs_ioc_get_encryption_policy(filp, arg);
-	case F2FS_IOC_GET_ENCRYPTION_PWSALT:
+	case FS_IOC_GET_ENCRYPTION_PWSALT:
 		return f2fs_ioc_get_encryption_pwsalt(filp, arg);
 	case FS_IOC_GET_ENCRYPTION_POLICY_EX:
 		return f2fs_ioc_get_encryption_policy_ex(filp, arg);
@@ -3998,9 +3998,9 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_ioc_flush_device(filp, arg);
 	case F2FS_IOC_GET_FEATURES:
 		return f2fs_ioc_get_features(filp, arg);
-	case F2FS_IOC_FSGETXATTR:
+	case FS_IOC_FSGETXATTR:
 		return f2fs_ioc_fsgetxattr(filp, arg);
-	case F2FS_IOC_FSSETXATTR:
+	case FS_IOC_FSSETXATTR:
 		return f2fs_ioc_fssetxattr(filp, arg);
 	case F2FS_IOC_GET_PIN_FILE:
 		return f2fs_ioc_get_pin_file(filp, arg);
@@ -4014,10 +4014,10 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_ioc_enable_verity(filp, arg);
 	case FS_IOC_MEASURE_VERITY:
 		return f2fs_ioc_measure_verity(filp, arg);
-	case F2FS_IOC_GET_VOLUME_NAME:
-		return f2fs_get_volume_name(filp, arg);
-	case F2FS_IOC_SET_VOLUME_NAME:
-		return f2fs_set_volume_name(filp, arg);
+	case FS_IOC_GETFSLABEL:
+		return f2fs_ioc_getfslabel(filp, arg);
+	case FS_IOC_SETFSLABEL:
+		return f2fs_ioc_setfslabel(filp, arg);
 	case F2FS_IOC_GET_COMPRESS_BLOCKS:
 		return f2fs_get_compress_blocks(filp, arg);
 	case F2FS_IOC_RELEASE_COMPRESS_BLOCKS:
@@ -4150,14 +4150,14 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
 	switch (cmd) {
-	case F2FS_IOC32_GETFLAGS:
-		cmd = F2FS_IOC_GETFLAGS;
+	case FS_IOC32_GETFLAGS:
+		cmd = FS_IOC_GETFLAGS;
 		break;
-	case F2FS_IOC32_SETFLAGS:
-		cmd = F2FS_IOC_SETFLAGS;
+	case FS_IOC32_SETFLAGS:
+		cmd = FS_IOC_SETFLAGS;
 		break;
-	case F2FS_IOC32_GETVERSION:
-		cmd = F2FS_IOC_GETVERSION;
+	case FS_IOC32_GETVERSION:
+		cmd = FS_IOC_GETVERSION;
 		break;
 	case F2FS_IOC_START_ATOMIC_WRITE:
 	case F2FS_IOC_COMMIT_ATOMIC_WRITE:
@@ -4166,9 +4166,9 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_ABORT_VOLATILE_WRITE:
 	case F2FS_IOC_SHUTDOWN:
 	case FITRIM:
-	case F2FS_IOC_SET_ENCRYPTION_POLICY:
-	case F2FS_IOC_GET_ENCRYPTION_PWSALT:
-	case F2FS_IOC_GET_ENCRYPTION_POLICY:
+	case FS_IOC_SET_ENCRYPTION_POLICY:
+	case FS_IOC_GET_ENCRYPTION_PWSALT:
+	case FS_IOC_GET_ENCRYPTION_POLICY:
 	case FS_IOC_GET_ENCRYPTION_POLICY_EX:
 	case FS_IOC_ADD_ENCRYPTION_KEY:
 	case FS_IOC_REMOVE_ENCRYPTION_KEY:
@@ -4182,16 +4182,16 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_MOVE_RANGE:
 	case F2FS_IOC_FLUSH_DEVICE:
 	case F2FS_IOC_GET_FEATURES:
-	case F2FS_IOC_FSGETXATTR:
-	case F2FS_IOC_FSSETXATTR:
+	case FS_IOC_FSGETXATTR:
+	case FS_IOC_FSSETXATTR:
 	case F2FS_IOC_GET_PIN_FILE:
 	case F2FS_IOC_SET_PIN_FILE:
 	case F2FS_IOC_PRECACHE_EXTENTS:
 	case F2FS_IOC_RESIZE_FS:
 	case FS_IOC_ENABLE_VERITY:
 	case FS_IOC_MEASURE_VERITY:
-	case F2FS_IOC_GET_VOLUME_NAME:
-	case F2FS_IOC_SET_VOLUME_NAME:
+	case FS_IOC_GETFSLABEL:
+	case FS_IOC_SETFSLABEL:
 	case F2FS_IOC_GET_COMPRESS_BLOCKS:
 	case F2FS_IOC_RELEASE_COMPRESS_BLOCKS:
 	case F2FS_IOC_RESERVE_COMPRESS_BLOCKS:
-- 
2.27.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
