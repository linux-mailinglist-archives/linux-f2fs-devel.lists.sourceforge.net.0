Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2761A29BF4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Feb 2025 22:40:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tfn8M-00020E-Ju;
	Wed, 05 Feb 2025 21:40:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tfn8K-000204-EO
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Feb 2025 21:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5m9c8v/U1diypBPu8aelRDX3DYKWYhiy1shUinzcfxk=; b=mxs2qE48N30aJX2q+3Wx3BHADw
 oWYAoWqxoAmBnI/+kFNGW/iMvOXsWNHjwOd88bMGv/XnditopzJAXIv1pOWL+pka6EzHwafedKySG
 uq/tQ8UjDZu+QeVw9RXS/5C+X0dyy29LaRrS/Ghwby2HWKYIq999q+02iD6Qrlq1P3Oc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5m9c8v/U1diypBPu8aelRDX3DYKWYhiy1shUinzcfxk=; b=l
 beDgstNGiID7j+gYHZFCpmXL8z6sujbg76UBfhZ0l8Gz+eM5RKyb9shDCbZRlnBVVHgkRiQJ+Xndo
 rioS52FY+r/yxc+lM/4ek4POIjbmlVkfI2pm0MbqG5RqUWetKdzhz9/JY/rX7o2ydGEIyA1zrjd9f
 eC9zzyeQhsmAiHho=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tfn8J-0001FV-1j for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Feb 2025 21:40:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 42A1AA43AF2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  5 Feb 2025 21:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0497C4CED1;
 Wed,  5 Feb 2025 21:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738791620;
 bh=hCmtyZG5wKHm5C3H2TnU//Dp8nTojDg4JmoDtBSEWWE=;
 h=From:To:Cc:Subject:Date:From;
 b=a5U5xFlykrMhzv6xknoC+kWmdsa8Olj2Z3cPDjI1yXSjrA1zwtBy4VjILKTfQPwz7
 7Na2qCWADG7CyVdx8wZPxF8W9St3Yqg9Jw35Fp0vVnR5iicg5+sGjXUKFtI83CpCpm
 YIUU4TWGDfYdGFdcKzteChi9aVFJ9/BkmjAH741ZoMDz230GVWwqoaQUEfhkJnC9R9
 NfV/luLVONB3yUjvNaTMCwaX5QlN9fQWt6njevjxB034klzaY0k8eBVFwxCM3sontM
 VJoujdV6E76luIWcW9QEpfmwzx91o+zDngcm2NlzsvmqpU2IzOUAAc2fJTITzrbUx1
 8hHJonrp0vnvA==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Wed,  5 Feb 2025 21:40:14 +0000
Message-ID: <20250205214014.3270585-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch adds an ioctl to give a per-file priority hint
 to attach REQ_PRIO. Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 fs/f2fs/data.c
 | 6 ++++++ fs/f2fs/f2fs.h | 7 +++++++ fs/f2fs/file.c | 20 ++++++++++++++++++++
 include/uapi/linux/f2fs.h | 1 + 4 files changed, 34 in [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tfn8J-0001FV-1j
Subject: [f2fs-dev] [PATCH] f2fs: add ioctl to get IO priority hint
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch adds an ioctl to give a per-file priority hint to attach
REQ_PRIO.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/data.c            |  6 ++++++
 fs/f2fs/f2fs.h            |  7 +++++++
 fs/f2fs/file.c            | 20 ++++++++++++++++++++
 include/uapi/linux/f2fs.h |  1 +
 4 files changed, 34 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 07b46b444d31..24c5cb1f5ada 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -413,6 +413,7 @@ int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr)
 static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
 {
 	unsigned int temp_mask = GENMASK(NR_TEMP_TYPE - 1, 0);
+	struct folio *fio_folio = page_folio(fio->page);
 	unsigned int fua_flag, meta_flag, io_flag;
 	blk_opf_t op_flags = 0;
 
@@ -438,6 +439,11 @@ static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
 		op_flags |= REQ_META;
 	if (BIT(fio->temp) & fua_flag)
 		op_flags |= REQ_FUA;
+
+	if (fio->type == DATA &&
+	    F2FS_I(fio_folio->mapping->host)->ioprio_hint == F2FS_IOPRIO_WRITE)
+		op_flags |= REQ_PRIO;
+
 	return op_flags;
 }
 
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index bd0d8138b71d..c0a5f0df8781 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -816,6 +816,12 @@ enum {
 	FI_MAX,			/* max flag, never be used */
 };
 
+/* used for f2fs_inode_info->ioprio_hint. */
+enum {
+	F2FS_IOPRIO_WRITE = 1,	/* high write priority */
+	F2FS_IOPRIO_MAX,
+};
+
 struct f2fs_inode_info {
 	struct inode vfs_inode;		/* serve a vfs inode */
 	unsigned long i_flags;		/* keep an inode flags for ioctl */
@@ -830,6 +836,7 @@ struct f2fs_inode_info {
 
 	/* Use below internally in f2fs*/
 	unsigned long flags[BITS_TO_LONGS(FI_MAX)];	/* use to pass per-file flags */
+	unsigned int ioprio_hint;	/* hint for IO priority */
 	struct f2fs_rwsem i_sem;	/* protect fi info */
 	atomic_t dirty_pages;		/* # of dirty pages */
 	f2fs_hash_t chash;		/* hash value of given file name */
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 642b8d85a035..2f93a27d2f45 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3503,6 +3503,23 @@ static int f2fs_ioc_get_dev_alias_file(struct file *filp, unsigned long arg)
 			(u32 __user *)arg);
 }
 
+static int f2fs_ioc_io_prio(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+	__u32 level;
+
+	if (get_user(level, (__u32 __user *)arg))
+		return -EFAULT;
+
+	if (!S_ISREG(inode->i_mode) || level >= F2FS_IOPRIO_MAX)
+		return -EINVAL;
+
+	inode_lock(inode);
+	F2FS_I(inode)->ioprio_hint = level;
+	inode_unlock(inode);
+	return 0;
+}
+
 int f2fs_precache_extents(struct inode *inode)
 {
 	struct f2fs_inode_info *fi = F2FS_I(inode);
@@ -4606,6 +4623,8 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_ioc_compress_file(filp);
 	case F2FS_IOC_GET_DEV_ALIAS_FILE:
 		return f2fs_ioc_get_dev_alias_file(filp, arg);
+	case F2FS_IOC_IO_PRIO:
+		return f2fs_ioc_io_prio(filp, arg);
 	default:
 		return -ENOTTY;
 	}
@@ -5321,6 +5340,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_DECOMPRESS_FILE:
 	case F2FS_IOC_COMPRESS_FILE:
 	case F2FS_IOC_GET_DEV_ALIAS_FILE:
+	case F2FS_IOC_IO_PRIO:
 		break;
 	default:
 		return -ENOIOCTLCMD;
diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
index cd38a7c166e6..fb2f85b3c540 100644
--- a/include/uapi/linux/f2fs.h
+++ b/include/uapi/linux/f2fs.h
@@ -46,6 +46,7 @@
 #define F2FS_IOC_GET_DEV_ALIAS_FILE	_IOR(F2FS_IOCTL_MAGIC, 26, __u32)
 #define F2FS_IOC_DONATE_RANGE		_IOW(F2FS_IOCTL_MAGIC, 27,	\
 						struct f2fs_donate_range)
+#define F2FS_IOC_IO_PRIO		_IOW(F2FS_IOCTL_MAGIC, 28, __u32)
 
 /*
  * should be same as XFS_IOC_GOINGDOWN.
-- 
2.48.1.362.g079036d154-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
