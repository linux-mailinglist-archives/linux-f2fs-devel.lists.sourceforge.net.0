Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 871B86FD46
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jul 2019 11:58:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hpV52-00057L-BH; Mon, 22 Jul 2019 09:58:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hpV50-00057D-4p
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Jul 2019 09:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WlL4wWjAIP4ygV+b8Az62jsv6aA7ixY8EQ0NYItRpeQ=; b=Vf6FKvMlvxHZex6I5Sy9Rwzq+w
 +AFoPgvN49vtSaeywk03xadXT1gNB+wHlRjb64SEfQYnJz122twsuUJustCfFVJgoEbUlD0DzTDV1
 c05MTJxLjW/FJlysM0mri4sM21QEXJfgS1IDNbdRarDpIQwXHdPT4JNBBYv0c9sZ9Zp4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WlL4wWjAIP4ygV+b8Az62jsv6aA7ixY8EQ0NYItRpeQ=; b=C
 SZMxAVRT90RCCiMUs5KwzIZhmgPmrbNXkNTZ+LO7l7gerOzBJpzCy4j+N5swvNkSIzLAC5ELqcMgM
 DdR69ntQIEVSL7WziReCrHAHZBdJW9wzac4+TW3M7AEiqbZg1i0kmSrzNMi89vrJqo815I1tO3dFD
 U8zphTCNRcYBKJDc=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hpV4y-00AaCp-6Z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Jul 2019 09:58:02 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 2301ABC8BDB3F9827B7E;
 Mon, 22 Jul 2019 17:57:53 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Mon, 22 Jul 2019 17:57:45 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 22 Jul 2019 17:57:05 +0800
Message-ID: <20190722095706.116545-1-yuchao0@huawei.com>
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
X-Headers-End: 1hpV4y-00AaCp-6Z
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix to spread
 f2fs_is_checkpoint_ready()
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
Cc: linux-kernel@vger.kernel.org, drosen@google.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We missed to call f2fs_is_checkpoint_ready() in several places, it may
allow space allocation even when free space was exhausted during
checkpoint is disabled, fix to add them.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/file.c  | 11 +++++++++++
 fs/f2fs/namei.c |  4 ++++
 fs/f2fs/xattr.c |  5 +++++
 3 files changed, 20 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ae0fec54cac6..43d878f3db0f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -57,6 +57,9 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 		err = -EIO;
 		goto err;
 	}
+	err = f2fs_is_checkpoint_ready(sbi);
+	if (err)
+		goto err;
 
 	sb_start_pagefault(inode->i_sb);
 
@@ -1568,6 +1571,9 @@ static long f2fs_fallocate(struct file *file, int mode,
 
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
 		return -EIO;
+	ret = f2fs_is_checkpoint_ready(F2FS_I_SB(inode));
+	if (ret)
+		return ret;
 
 	/* f2fs only support ->fallocate for regular file */
 	if (!S_ISREG(inode->i_mode))
@@ -3150,8 +3156,13 @@ static int f2fs_set_volume_name(struct file *filp, unsigned long arg)
 
 long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
+	int ret;
+
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(file_inode(filp)))))
 		return -EIO;
+	ret = f2fs_is_checkpoint_ready(F2FS_I_SB(file_inode(filp)));
+	if (ret)
+		return ret;
 
 	switch (cmd) {
 	case F2FS_IOC_GETFLAGS:
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index c5b99042e6f2..09fb4f31576e 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -801,9 +801,13 @@ static int __f2fs_tmpfile(struct inode *dir, struct dentry *dentry,
 static int f2fs_tmpfile(struct inode *dir, struct dentry *dentry, umode_t mode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
+	int ret;
 
 	if (unlikely(f2fs_cp_error(sbi)))
 		return -EIO;
+	ret = f2fs_is_checkpoint_ready(sbi);
+	if (ret)
+		return ret;
 
 	if (IS_ENCRYPTED(dir) || DUMMY_ENCRYPTION_ENABLED(sbi)) {
 		int err = fscrypt_get_encryption_info(dir);
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index b32c45621679..3c92f4122044 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -21,6 +21,7 @@
 #include <linux/posix_acl_xattr.h>
 #include "f2fs.h"
 #include "xattr.h"
+#include "segment.h"
 
 static int f2fs_xattr_generic_get(const struct xattr_handler *handler,
 		struct dentry *unused, struct inode *inode,
@@ -729,6 +730,10 @@ int f2fs_setxattr(struct inode *inode, int index, const char *name,
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	int err;
 
+	err = f2fs_is_checkpoint_ready(sbi);
+	if (err)
+		return err;
+
 	err = dquot_initialize(inode);
 	if (err)
 		return err;
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
