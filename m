Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C9CD1F70F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jan 2026 15:29:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a8qGHqYm6itsl2fgApAPGSYzbQU/WF7GoJ5r1FCGukc=; b=YCIjSqyZiukES+1F94xGv2Uhka
	WSS5RmJoVGIyBumy7pP7OqtDTsV28EOzxVembC6HUD96iqqg+PTkCOFDIDQFlwpppsssaac+hT5J2
	f4dDQJP1oi/Ic46ph/V+x0tjvGt2sw9gcEQs34IfGhZOrKULNiZH4Uory57ZFfBz9gXc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vg1sY-00083m-3S;
	Wed, 14 Jan 2026 14:29:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1vg1sX-00083Y-1t
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 14:29:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2bsirOFEU9FQlRD8MEscTeWIofQmX1laZE5YkJD5NyU=; b=jHIJF3dFKTJcMpxqotJAVBt4z9
 GR/y+cY3MahwViseQ+ZVLkzEqIKuI5R7gypTZ0pSNAXCN0cvMBM1fjB35p19vYMpT7bQ09mfgpbgi
 jrw5iMlFQ5hlMlFfByeRTDJ7dArx2zTmMAW5uBz8zoAoyDRVjGm8uGgd6i3dmUxtgv80=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2bsirOFEU9FQlRD8MEscTeWIofQmX1laZE5YkJD5NyU=; b=S9OBXWcmd5KDTSNMaqTvqLfODR
 VXDNm89Lrdi1ey1Q956QBhjF0zUREyA3q9PrXRz1JYav/Y+8PsZ2da9fXhMFgoK6VslEvvvpyzH7R
 8V0ItqFGGG/XoDYKwc8I7Yaelg37HgYB0QTOfAWeZPqm8MkottWA3H53Nb6kM7VFE6mo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vg1sW-0001HS-F6 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 14:29:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2B88844304;
 Wed, 14 Jan 2026 14:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2DAAC19422;
 Wed, 14 Jan 2026 14:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768400974;
 bh=/x/oTYv9V9phhRwUSdhPKXxxrYVpfvyHp0vY02WSmZE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UtSpWxAiANHnTcRa3nyITC+Bmn6RsCGmYy1BEgxW5MPdvF4QQaP8bfWc8x+03Fa0L
 1t6/d7/UFmbuxjLD6OVImnQJw/vgHj1RQaIHUq7oT7OSshyCOEhwcbCVXjuOnqBNav
 U4vN1DJ9mmSvYEZ26Sw871zGxmPrQ/E6eQHjnRZYqEaII2jsQ6yHBlMt+jZovJbhjf
 A1OHUiuWIjVcJbLfwuYuqxQbVEvi+Z4qR4lqhZL4BEFAT9+B1Rp6lAmkYE6n0cqeL1
 ifbK+vSpXqfYXei9tUZG4E/rNL/FYHSbysYiZ6Jttvfbb/W/9aaAeTu+hAcuNurltS
 LmZxYV758ip5g==
To: vira,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>
Date: Wed, 14 Jan 2026 09:28:55 -0500
Message-ID: <20260114142900.3945054-13-cel@kernel.org>
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
 Content preview: From: Chuck Lever <chuck.lever@oracle.com> Upper layers such
 as NFSD need a way to query whether a filesystem handles filenames in a
 case-sensitive
 manner. The file_kattr structure now provides case_insensitive and
 case_preserving fields for t [...] 
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
X-Headers-End: 1vg1sW-0001HS-F6
Subject: [f2fs-dev] [PATCH v4 12/16] vboxsf: Implement fileattr_get for case
 sensitivity
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

Upper layers such as NFSD need a way to query whether a
filesystem handles filenames in a case-sensitive manner. The
file_kattr structure now provides case_insensitive and
case_preserving fields for this purpose, but vboxsf does not
yet report its case sensitivity behavior through this interface.

Implement vboxsf_fileattr_get() to report the case handling
behavior of VirtualBox shared folders. The case sensitivity
property is queried from the VirtualBox host service at mount
time and cached in struct vboxsf_sbi. The host determines case
sensitivity based on the underlying host filesystem (for
example, Windows NTFS is case-insensitive while Linux ext4 is
case-sensitive).

VirtualBox shared folders always preserve filename case exactly
as provided by the guest. The host interface does not expose a
case_preserving property, so this is hardcoded to true.

The callback is registered in all three inode_operations
structures (directory, file, and symlink) to ensure consistent
reporting across all inode types.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/vboxsf/dir.c    |  1 +
 fs/vboxsf/file.c   |  6 ++++--
 fs/vboxsf/super.c  |  4 ++++
 fs/vboxsf/utils.c  | 30 ++++++++++++++++++++++++++++++
 fs/vboxsf/vfsmod.h |  6 ++++++
 5 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/fs/vboxsf/dir.c b/fs/vboxsf/dir.c
index 42bedc4ec7af..c5bd3271aa96 100644
--- a/fs/vboxsf/dir.c
+++ b/fs/vboxsf/dir.c
@@ -477,4 +477,5 @@ const struct inode_operations vboxsf_dir_iops = {
 	.symlink = vboxsf_dir_symlink,
 	.getattr = vboxsf_getattr,
 	.setattr = vboxsf_setattr,
+	.fileattr_get = vboxsf_fileattr_get,
 };
diff --git a/fs/vboxsf/file.c b/fs/vboxsf/file.c
index 4bebd947314a..06308e38a70d 100644
--- a/fs/vboxsf/file.c
+++ b/fs/vboxsf/file.c
@@ -223,7 +223,8 @@ const struct file_operations vboxsf_reg_fops = {
 
 const struct inode_operations vboxsf_reg_iops = {
 	.getattr = vboxsf_getattr,
-	.setattr = vboxsf_setattr
+	.setattr = vboxsf_setattr,
+	.fileattr_get = vboxsf_fileattr_get,
 };
 
 static int vboxsf_read_folio(struct file *file, struct folio *folio)
@@ -390,5 +391,6 @@ static const char *vboxsf_get_link(struct dentry *dentry, struct inode *inode,
 }
 
 const struct inode_operations vboxsf_lnk_iops = {
-	.get_link = vboxsf_get_link
+	.get_link = vboxsf_get_link,
+	.fileattr_get = vboxsf_fileattr_get,
 };
diff --git a/fs/vboxsf/super.c b/fs/vboxsf/super.c
index 241647b060ee..fcabeca2a339 100644
--- a/fs/vboxsf/super.c
+++ b/fs/vboxsf/super.c
@@ -185,6 +185,10 @@ static int vboxsf_fill_super(struct super_block *sb, struct fs_context *fc)
 	if (err)
 		goto fail_unmap;
 
+	err = vboxsf_query_case_sensitive(sbi);
+	if (err)
+		goto fail_unmap;
+
 	sb->s_magic = VBOXSF_SUPER_MAGIC;
 	sb->s_blocksize = 1024;
 	sb->s_maxbytes = MAX_LFS_FILESIZE;
diff --git a/fs/vboxsf/utils.c b/fs/vboxsf/utils.c
index 9515bbf0b54c..6205fad21381 100644
--- a/fs/vboxsf/utils.c
+++ b/fs/vboxsf/utils.c
@@ -11,6 +11,7 @@
 #include <linux/sizes.h>
 #include <linux/pagemap.h>
 #include <linux/vfs.h>
+#include <linux/fileattr.h>
 #include "vfsmod.h"
 
 struct inode *vboxsf_new_inode(struct super_block *sb)
@@ -567,3 +568,32 @@ int vboxsf_dir_read_all(struct vboxsf_sbi *sbi, struct vboxsf_dir_info *sf_d,
 
 	return err;
 }
+
+int vboxsf_query_case_sensitive(struct vboxsf_sbi *sbi)
+{
+	struct shfl_volinfo volinfo;
+	u32 buf_len;
+	int err;
+
+	buf_len = sizeof(volinfo);
+	err = vboxsf_fsinfo(sbi->root, 0, SHFL_INFO_GET | SHFL_INFO_VOLUME,
+			    &buf_len, &volinfo);
+	if (err)
+		return err;
+
+	sbi->case_insensitive = !volinfo.properties.case_sensitive;
+	return 0;
+}
+
+int vboxsf_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
+{
+	struct vboxsf_sbi *sbi = VBOXSF_SBI(dentry->d_sb);
+
+	/*
+	 * VirtualBox shared folders preserve filename case exactly as
+	 * provided by the guest (the default). The host interface does
+	 * not expose a case-preservation property.
+	 */
+	fa->case_insensitive = sbi->case_insensitive;
+	return 0;
+}
diff --git a/fs/vboxsf/vfsmod.h b/fs/vboxsf/vfsmod.h
index 05973eb89d52..b61afd0ce842 100644
--- a/fs/vboxsf/vfsmod.h
+++ b/fs/vboxsf/vfsmod.h
@@ -47,6 +47,7 @@ struct vboxsf_sbi {
 	u32 next_generation;
 	u32 root;
 	int bdi_id;
+	bool case_insensitive;
 };
 
 /* per-inode information */
@@ -111,6 +112,11 @@ void vboxsf_dir_info_free(struct vboxsf_dir_info *p);
 int vboxsf_dir_read_all(struct vboxsf_sbi *sbi, struct vboxsf_dir_info *sf_d,
 			u64 handle);
 
+int vboxsf_query_case_sensitive(struct vboxsf_sbi *sbi);
+
+struct file_kattr;
+int vboxsf_fileattr_get(struct dentry *dentry, struct file_kattr *fa);
+
 /* from vboxsf_wrappers.c */
 int vboxsf_connect(void);
 void vboxsf_disconnect(void);
-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
