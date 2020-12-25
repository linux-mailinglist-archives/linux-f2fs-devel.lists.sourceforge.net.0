Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA562E2A7E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Dec 2020 09:53:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ksiqe-00011v-1X; Fri, 25 Dec 2020 08:53:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ksiqc-00011L-Es
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Dec 2020 08:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JGlB7sbbJPDVaTMM7PxuEJiHXHwUWXk3IXiV5HS6nbc=; b=CnZ5ixu/7lwmiO74OPnF7+2tZA
 dR0+vIkq8Dr4BnOKER4WR0WToujHLEPNsRXLxif8BnCu3dr5qJkN4gnkxRPyg/gA2WPzrsTkhqdqN
 TON2Rt0MTQdwDlk1lAyWjjbcmrkfUd6xGP+mlJyF571DMqi2QxcXiX7Ip3Vn1MOjmOmM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JGlB7sbbJPDVaTMM7PxuEJiHXHwUWXk3IXiV5HS6nbc=; b=k
 qkTSEjf8WIz/eeOptjR3/WMgsPlHLfalp2EAN9pfV71zSqKtinNwwNopMptIBx9fBwJ1GKpVW7+wj
 e9npJKkwRqHNulf3YGZl9FBfIF0v2GfeqHTcksC4ZrUlOc/ye2dAxXfNQnwQgMzAavMzfNrgqW1NU
 IYHccfCC2SFO0Ey8=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ksiqV-00Bdo4-Ai
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Dec 2020 08:53:18 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D2LKP6wDJzkwCq;
 Fri, 25 Dec 2020 16:51:53 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Fri, 25 Dec 2020 16:52:40 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 25 Dec 2020 16:52:27 +0800
Message-ID: <20201225085227.114230-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ksiqV-00Bdo4-Ai
Subject: [f2fs-dev] [PATCH] f2fs: enhance to update i_mode and acl
 atomically in f2fs_setattr()
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

Previously, in f2fs_setattr(), we don't update S_ISUID|S_ISGID|S_ISVTX
bits with S_IRWXUGO bits and acl entries atomically, so in error path,
chmod() may partially success, this patch enhances to make chmod() flow
being atomical.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/acl.c   | 23 ++++++++++++++++++++++-
 fs/f2fs/file.c  |  7 ++++---
 fs/f2fs/xattr.c | 15 +++++++++------
 3 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/acl.c b/fs/f2fs/acl.c
index 1e5e9b1136ee..732ec10e7890 100644
--- a/fs/f2fs/acl.c
+++ b/fs/f2fs/acl.c
@@ -200,6 +200,27 @@ struct posix_acl *f2fs_get_acl(struct inode *inode, int type)
 	return __f2fs_get_acl(inode, type, NULL);
 }
 
+static int f2fs_acl_update_mode(struct inode *inode, umode_t *mode_p,
+			  struct posix_acl **acl)
+{
+	umode_t mode = inode->i_mode;
+	int error;
+
+	if (is_inode_flag_set(inode, FI_ACL_MODE))
+		mode = F2FS_I(inode)->i_acl_mode;
+
+	error = posix_acl_equiv_mode(*acl, &mode);
+	if (error < 0)
+		return error;
+	if (error == 0)
+		*acl = NULL;
+	if (!in_group_p(inode->i_gid) &&
+	    !capable_wrt_inode_uidgid(inode, CAP_FSETID))
+		mode &= ~S_ISGID;
+	*mode_p = mode;
+	return 0;
+}
+
 static int __f2fs_set_acl(struct inode *inode, int type,
 			struct posix_acl *acl, struct page *ipage)
 {
@@ -213,7 +234,7 @@ static int __f2fs_set_acl(struct inode *inode, int type,
 	case ACL_TYPE_ACCESS:
 		name_index = F2FS_XATTR_INDEX_POSIX_ACL_ACCESS;
 		if (acl && !ipage) {
-			error = posix_acl_update_mode(inode, &mode, &acl);
+			error = f2fs_acl_update_mode(inode, &mode, &acl);
 			if (error)
 				return error;
 			set_acl_inode(inode, mode);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 596778f662fd..22a0101538c0 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -851,7 +851,6 @@ static void __setattr_copy(struct inode *inode, const struct iattr *attr)
 		if (!in_group_p(inode->i_gid) &&
 			!capable_wrt_inode_uidgid(inode, CAP_FSETID))
 			mode &= ~S_ISGID;
-		inode->i_mode = (inode->i_mode & S_IRWXUGO) | (mode & ~S_IRWXUGO);
 		set_acl_inode(inode, mode);
 	}
 }
@@ -951,8 +950,10 @@ int f2fs_setattr(struct dentry *dentry, struct iattr *attr)
 
 	if (attr->ia_valid & ATTR_MODE) {
 		err = posix_acl_chmod(inode, f2fs_get_inode_mode(inode));
-		if (err || is_inode_flag_set(inode, FI_ACL_MODE)) {
-			inode->i_mode = F2FS_I(inode)->i_acl_mode;
+
+		if (is_inode_flag_set(inode, FI_ACL_MODE)) {
+			if (!err)
+				inode->i_mode = F2FS_I(inode)->i_acl_mode;
 			clear_inode_flag(inode, FI_ACL_MODE);
 		}
 	}
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 65afcc3cc68a..2086bef6c154 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -673,7 +673,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
 		}
 
 		if (value && f2fs_xattr_value_same(here, value, size))
-			goto exit;
+			goto same;
 	} else if ((flags & XATTR_REPLACE)) {
 		error = -ENODATA;
 		goto exit;
@@ -738,17 +738,20 @@ static int __f2fs_setxattr(struct inode *inode, int index,
 	if (error)
 		goto exit;
 
-	if (is_inode_flag_set(inode, FI_ACL_MODE)) {
-		inode->i_mode = F2FS_I(inode)->i_acl_mode;
-		inode->i_ctime = current_time(inode);
-		clear_inode_flag(inode, FI_ACL_MODE);
-	}
 	if (index == F2FS_XATTR_INDEX_ENCRYPTION &&
 			!strcmp(name, F2FS_XATTR_NAME_ENCRYPTION_CONTEXT))
 		f2fs_set_encrypted_inode(inode);
 	f2fs_mark_inode_dirty_sync(inode, true);
 	if (!error && S_ISDIR(inode->i_mode))
 		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_CP);
+
+same:
+	if (is_inode_flag_set(inode, FI_ACL_MODE)) {
+		inode->i_mode = F2FS_I(inode)->i_acl_mode;
+		inode->i_ctime = current_time(inode);
+		clear_inode_flag(inode, FI_ACL_MODE);
+	}
+
 exit:
 	kfree(base_addr);
 	return error;
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
