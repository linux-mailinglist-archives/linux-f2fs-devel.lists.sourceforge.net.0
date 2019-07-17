Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 304CC6B8D5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jul 2019 11:06:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hnftY-0001ri-HO; Wed, 17 Jul 2019 09:06:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hnftW-0001rZ-QE
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jul 2019 09:06:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TQeQaiFE7gWYntF4dQOjFbZfrn1xLcA7Tyx/CwbBovM=; b=E0Nnz845k+Eimf5PZH2wJMIgAc
 nPcgytM/0Fc1Jv0VsCT+zaAMHM7Z3sL21d4QJh6jNsVuS9o6GbxgMC0Fp8hWZUgu31xUm0OFhdbur
 fqxorkUbIPRhR+OwJEnCi/gtcvYHrAXcC21l3dj5KZcG6QfqAZ6RlzHB+a1bg8/bLxmM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TQeQaiFE7gWYntF4dQOjFbZfrn1xLcA7Tyx/CwbBovM=; b=M
 Ibmlcuv8gOI12REZKJ6x7QGfL8jLsUhP4/lOiX/oPslMcw6yYC3IjgLEwFDNWlFkoJ9ARlAL6t9tA
 veEGVVMgWhyA7XzYo959lVl2+D+GTF6WXVY3V3xsBu2i3F6rfk2BspIV/dWye7IeUQ8BxyK6+C1Cz
 CX/9C6Opzk4QYnNI=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hnftU-004x6d-FI
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jul 2019 09:06:38 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 83541B80C45060901816;
 Wed, 17 Jul 2019 17:06:29 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Wed, 17 Jul 2019 17:06:20 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 17 Jul 2019 17:06:11 +0800
Message-ID: <20190717090611.46011-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
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
X-Headers-End: 1hnftU-004x6d-FI
Subject: [f2fs-dev] [PATCH] f2fs: support FS_IOC_{GET,SET}FSLABEL
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

Support two generic fs ioctls FS_IOC_{GET,SET}FSLABEL, letting
f2fs pass generic/492 testcase.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/f2fs.h |  3 ++
 fs/f2fs/file.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 17382da7f0bd..76d2e82f2519 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -417,6 +417,9 @@ static inline bool __has_cursum_space(struct f2fs_journal *journal,
 #define F2FS_IOC_PRECACHE_EXTENTS	_IO(F2FS_IOCTL_MAGIC, 15)
 #define F2FS_IOC_RESIZE_FS		_IOW(F2FS_IOCTL_MAGIC, 16, __u64)
 
+#define F2FS_IOC_GET_VOLUME_NAME	FS_IOC_GETFSLABEL
+#define F2FS_IOC_SET_VOLUME_NAME	FS_IOC_SETFSLABEL
+
 #define F2FS_IOC_SET_ENCRYPTION_POLICY	FS_IOC_SET_ENCRYPTION_POLICY
 #define F2FS_IOC_GET_ENCRYPTION_POLICY	FS_IOC_GET_ENCRYPTION_POLICY
 #define F2FS_IOC_GET_ENCRYPTION_PWSALT	FS_IOC_GET_ENCRYPTION_PWSALT
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 3e58a6f697dd..7ca545874060 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -20,6 +20,7 @@
 #include <linux/uio.h>
 #include <linux/uuid.h>
 #include <linux/file.h>
+#include <linux/nls.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -3060,6 +3061,77 @@ static int f2fs_ioc_resize_fs(struct file *filp, unsigned long arg)
 	return ret;
 }
 
+static int f2fs_get_volume_name(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	char *vbuf;
+	int count;
+	int err = 0;
+
+	vbuf = f2fs_kzalloc(sbi, MAX_VOLUME_NAME, GFP_KERNEL);
+	if (!vbuf)
+		return -ENOMEM;
+
+	down_read(&sbi->sb_lock);
+	count = utf16s_to_utf8s(sbi->raw_super->volume_name,
+			sizeof(sbi->raw_super->volume_name),
+			UTF16_LITTLE_ENDIAN, vbuf, MAX_VOLUME_NAME);
+	up_read(&sbi->sb_lock);
+
+	if (copy_to_user((char __user *)arg, vbuf,
+				min(FSLABEL_MAX, count)))
+		err = -EFAULT;
+
+	kvfree(vbuf);
+	return err;
+}
+
+static int f2fs_set_volume_name(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	char *vbuf;
+	int len;
+	int err = 0;
+
+	vbuf = f2fs_kzalloc(sbi, MAX_VOLUME_NAME, GFP_KERNEL);
+	if (!vbuf)
+		return -ENOMEM;
+
+	if (copy_from_user(vbuf, (char __user *)arg, FSLABEL_MAX)) {
+		err = -EFAULT;
+		goto out;
+	}
+
+	len = strnlen(vbuf, FSLABEL_MAX);
+	if (len > FSLABEL_MAX - 1) {
+		err = -EINVAL;
+		goto out;
+	}
+
+	err = mnt_want_write_file(filp);
+	if (err)
+		goto out;
+
+	down_write(&sbi->sb_lock);
+
+	memset(sbi->raw_super->volume_name, 0,
+			sizeof(sbi->raw_super->volume_name));
+	utf8s_to_utf16s(vbuf, MAX_VOLUME_NAME, UTF16_LITTLE_ENDIAN,
+			sbi->raw_super->volume_name,
+			sizeof(sbi->raw_super->volume_name));
+
+	err = f2fs_commit_super(sbi, false);
+
+	up_write(&sbi->sb_lock);
+
+	mnt_drop_write_file(filp);
+out:
+	kvfree(vbuf);
+	return err;
+}
+
 long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(file_inode(filp)))))
@@ -3118,6 +3190,10 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_ioc_precache_extents(filp, arg);
 	case F2FS_IOC_RESIZE_FS:
 		return f2fs_ioc_resize_fs(filp, arg);
+	case F2FS_IOC_GET_VOLUME_NAME:
+		return f2fs_get_volume_name(filp, arg);
+	case F2FS_IOC_SET_VOLUME_NAME:
+		return f2fs_set_volume_name(filp, arg);
 	default:
 		return -ENOTTY;
 	}
@@ -3232,6 +3308,8 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_SET_PIN_FILE:
 	case F2FS_IOC_PRECACHE_EXTENTS:
 	case F2FS_IOC_RESIZE_FS:
+	case F2FS_IOC_GET_VOLUME_NAME:
+	case F2FS_IOC_SET_VOLUME_NAME:
 		break;
 	default:
 		return -ENOIOCTLCMD;
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
