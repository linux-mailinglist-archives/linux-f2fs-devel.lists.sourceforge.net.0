Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A7CD1F6D4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jan 2026 15:29:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gBtUE0jD3kd6YUdPV903IgJoVCQejp8KWI9fiZ1q418=; b=VNR7BdM9ZKd/ZlPaLp8XpgS+fM
	NZx2btxKItjpUkAgu1Zn/ZEGN2JvG3iRuy2Vr1Or3HzNTWLjPYypzLHm1SSGJSrOIdB9Ln6Uy2VC0
	v+jHFrx3NoMf47EEh6S9ewIyrKhpSXHRHVkrRT2M51PLLzI7FCH8MY14AaUDcattL1aY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vg1sD-00080Q-KI;
	Wed, 14 Jan 2026 14:29:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1vg1sB-00080F-WE
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 14:29:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TiU148V4xpKz7r9LZkE17rWhBLQTw0yZ0UmeGk/ZJn4=; b=HOK3wxzzrWPjQIH0WWCKKzsrIc
 EjHP5UD4Xsvu0cPRzD12/oeFEJ1aDLOTLfF19+CqepCHCwp9we4psXP+rQyzyn6bFRtLTVh3blOpr
 sO0zhmoOlML/B3olOIPvTW2f2E4M7C2938QlkQ/je6C4MAjMokJj8HQ5IQ4YoXQ0AN0k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TiU148V4xpKz7r9LZkE17rWhBLQTw0yZ0UmeGk/ZJn4=; b=URa9u92oGkb6QKJRgrhsoP44XK
 axhaEPqK/w5YvclfIdPhJ/qq4hRT/rZmkAAZuSjRgvPVLfuEGF4oLjHsOWYHKW5irVPWlk6Q6NG84
 kkUtqvhzT6+X3ab0vDCDDzzGG6vtv+ru0Q7GCEH2ChPHXImY5+NK1dlMBPiblbtwtuBg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vg1s5-0001FU-M3 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 14:29:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4E9F0440E9;
 Wed, 14 Jan 2026 14:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1129C19422;
 Wed, 14 Jan 2026 14:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768400947;
 bh=JM+3cMG6B8NA0iuUXm4oGZhY/McI+7luuVb2gvnc7FU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WEor/8DU2qfPmoPVltEIdCnBhluYfw+cSbQL7sCPTr16T4ETQWQ7Fx3CYq1X6EYVd
 P8O+h2p0rSGsu9vxPge/0c6iX2PqlCaeORxOfpnIhlIxHytFbPNcixdDatzopJAYOs
 olQYhTFbtJg4etm+0+UYcflUqdrI4y9mMLqN8pfRoS5LVzFDC0lsxb6DgcoV8ZtyCE
 bueAXkc4YTpinlDAysDL1daUqJVYl7jkUq4ZG80k4w7p7SUS6sdgqkpehKkgZ2GPGy
 OHHaQFI+fA8g+H5NdW+lUoj3GzqqI4ShrJbYLRoJUzpIi70kVrw7Bobe8xCm+caqZs
 GXXyDo3wJ1A/A==
To: vira,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>
Date: Wed, 14 Jan 2026 09:28:44 -0500
Message-ID: <20260114142900.3945054-2-cel@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114142900.3945054-1-cel@kernel.org>
References: <20260114142900.3945054-1-cel@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chuck Lever <chuck.lever@oracle.com> Enable upper
 layers
 such as NFSD to retrieve case sensitivity information from file systems by
 adding case_insensitive and case_nonpreserving boolean fields to struct
 file_kattr.
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vg1s5-0001FU-M3
Subject: [f2fs-dev] [PATCH v4 01/16] fs: Add case sensitivity info to
 file_kattr
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
From: Chuck Lever via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chuck Lever <cel@kernel.org>
Cc: pc@manguebit.org, yuezhang.mo@sony.com, cem@kernel.org,
 almaz.alexandrovich@paragon-software.com, adilger.kernel@dilger.ca,
 linux-cifs@vger.kernel.org, sfrench@samba.org, slava@dubeyko.com,
 linux-ext4@vger.kernel.org, linkinjeon@kernel.org, sprasad@microsoft.com,
 frank.li@vivo.com, ronniesahlberg@gmail.com, glaubitz@physik.fu-berlin.de,
 jaegeuk@kernel.org, hirofumi@mail.parknet.co.jp, linux-nfs@vger.kernel.org,
 tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, senozhatsky@chromium.org,
 Chuck Lever <chuck.lever@oracle.com>, hansg@kernel.org, anna@kernel.org,
 linux-fsdevel@vger.kernel.org, sj1557.seo@samsung.com, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chuck Lever <chuck.lever@oracle.com>

Enable upper layers such as NFSD to retrieve case sensitivity
information from file systems by adding case_insensitive and
case_nonpreserving boolean fields to struct file_kattr.

These fields default to false (POSIX semantics: case-sensitive and
case-preserving), allowing filesystems to set them only when
behavior differs from the default.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/file_attr.c           | 14 ++++++++++++++
 include/linux/fileattr.h |  3 +++
 include/uapi/linux/fs.h  | 12 +++++++++++-
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/fs/file_attr.c b/fs/file_attr.c
index 13cdb31a3e94..df4b2fc68532 100644
--- a/fs/file_attr.c
+++ b/fs/file_attr.c
@@ -84,6 +84,8 @@ int vfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
 	struct inode *inode = d_inode(dentry);
 	int error;
 
+	memset(fa, 0, sizeof(*fa));
+
 	if (!inode->i_op->fileattr_get)
 		return -ENOIOCTLCMD;
 
@@ -106,6 +108,10 @@ static void fileattr_to_file_attr(const struct file_kattr *fa,
 	fattr->fa_nextents = fa->fsx_nextents;
 	fattr->fa_projid = fa->fsx_projid;
 	fattr->fa_cowextsize = fa->fsx_cowextsize;
+	if (fa->case_insensitive)
+		fattr->fa_case_behavior |= FS_CASE_INSENSITIVE;
+	if (fa->case_nonpreserving)
+		fattr->fa_case_behavior |= FS_CASE_NONPRESERVING;
 }
 
 /**
@@ -382,6 +388,10 @@ SYSCALL_DEFINE5(file_getattr, int, dfd, const char __user *, filename,
 
 	BUILD_BUG_ON(sizeof(struct file_attr) < FILE_ATTR_SIZE_VER0);
 	BUILD_BUG_ON(sizeof(struct file_attr) != FILE_ATTR_SIZE_LATEST);
+	BUILD_BUG_ON(offsetofend(struct file_attr, fa_cowextsize) !=
+		     FILE_ATTR_SIZE_VER0);
+	BUILD_BUG_ON(offsetofend(struct file_attr, fa_reserved) !=
+		     FILE_ATTR_SIZE_VER1);
 
 	if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) != 0)
 		return -EINVAL;
@@ -439,6 +449,10 @@ SYSCALL_DEFINE5(file_setattr, int, dfd, const char __user *, filename,
 
 	BUILD_BUG_ON(sizeof(struct file_attr) < FILE_ATTR_SIZE_VER0);
 	BUILD_BUG_ON(sizeof(struct file_attr) != FILE_ATTR_SIZE_LATEST);
+	BUILD_BUG_ON(offsetofend(struct file_attr, fa_cowextsize) !=
+		     FILE_ATTR_SIZE_VER0);
+	BUILD_BUG_ON(offsetofend(struct file_attr, fa_reserved) !=
+		     FILE_ATTR_SIZE_VER1);
 
 	if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) != 0)
 		return -EINVAL;
diff --git a/include/linux/fileattr.h b/include/linux/fileattr.h
index f89dcfad3f8f..086f28b90734 100644
--- a/include/linux/fileattr.h
+++ b/include/linux/fileattr.h
@@ -51,6 +51,9 @@ struct file_kattr {
 	/* selectors: */
 	bool	flags_valid:1;
 	bool	fsx_valid:1;
+	/* case sensitivity behavior: */
+	bool	case_insensitive:1;
+	bool	case_nonpreserving:1;
 };
 
 int copy_fsxattr_to_user(const struct file_kattr *fa, struct fsxattr __user *ufa);
diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
index 66ca526cf786..07286d34b48b 100644
--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -229,10 +229,20 @@ struct file_attr {
 	__u32 fa_nextents;	/* nextents field value (get)   */
 	__u32 fa_projid;	/* project identifier (get/set) */
 	__u32 fa_cowextsize;	/* CoW extsize field value (get/set) */
+	/* VER1 additions: */
+	__u32 fa_case_behavior;	/* case sensitivity (get) */
+	__u32 fa_reserved;
 };
 
 #define FILE_ATTR_SIZE_VER0 24
-#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER0
+#define FILE_ATTR_SIZE_VER1 32
+#define FILE_ATTR_SIZE_LATEST FILE_ATTR_SIZE_VER1
+
+/*
+ * Case sensitivity flags for fa_case_behavior
+ */
+#define FS_CASE_INSENSITIVE	0x00000001	/* case-insensitive lookups */
+#define FS_CASE_NONPRESERVING	0x00000002	/* case not preserved */
 
 /*
  * Flags for the fsx_xflags field
-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
