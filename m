Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 757CAD1F6F7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Jan 2026 15:29:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yB6I8tW7CBlFPZB8gkPgZQJilYyAeVdscdkf4y+hwXY=; b=f2zdBFWegYxfDkitAWgxJQsIxb
	V8gShM/uWWmGXHnkMIS91cGbONa0cb1vw66zALeZGk7J+dHqJGUGNvhnx6VfadirRNHjBT/F+9EP6
	b3iBRKxOjO6irJjOA2jlqBO5R7xlg4LR+XEC+QtmDUwvGoTxYvzJUcxfzRHTlewhk4KQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vg1sM-0008Up-5t;
	Wed, 14 Jan 2026 14:29:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1vg1sK-0008Ug-K5
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 14:29:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AEtATd0aiuK6ARzNaz5t8kF+W+lr7aYGAiRewVo2m0M=; b=JD0EoIHaOQ6Ce72cbi7VCHS1gR
 Q73tQ/aNyNP4Q22/H7+Cb18mbh6LrFo6soUZ1IpOjMriqkHxw8BhgBrMeGsx9aqy0Md04Fx4BP5uo
 38ObmVL0mfe8Z1wdUnkekcA9zbgTFR/MEDb6Ekn+ViC3ltNmbyJMOQaNKMxm/nTMHUoM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AEtATd0aiuK6ARzNaz5t8kF+W+lr7aYGAiRewVo2m0M=; b=g8kYumLlJUV0ythWrBpFQRzDsO
 u+OUrLyS0xoJCcWncc1MZ5FcqZYHF3oGcrF76FZQPx0OScZ9pStd0hGRnLbYVAvNMoDUtfD9oqkAB
 COLfmNVNQDBWeKM5nfnjPhJ6VfV0r+RRLTdLN22OisedqkIM79bQXhvuyKKS3lIjf1wM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vg1sK-0001GX-37 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Jan 2026 14:29:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CAEF743F82;
 Wed, 14 Jan 2026 14:29:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74645C4CEF7;
 Wed, 14 Jan 2026 14:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768400966;
 bh=mRV56c9MAQ3HyUVZj75eGyg0E1dkWp35HLslkaK10es=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uF7jxiqyU5peWTlEMTMCtwSHJfHkq/KhdiFhmdWGa5ZWybfrw7M++mBZEH2Pa39H/
 6HPItuDUcwpqiAmnb9XJI2AXKUt0pdbyWLLcGKYRSAv21laCz4+BacNfu4uLfRzux5
 RJdqexVMleovKm+lnT7Ji+aeegLMYzktZBIhxtgnQVoG/UjB+kFuS+qbM++TsQZ59l
 2N7BuegYeI0QllQrLAzvihNXd/UsMSVTUT+P0iurVDVrA6WHSun0U/aDcQRS2DOSKj
 V/1JFhCkOzM7EBrp5eJopZRGORMKGM3HS6dgDbvklERhhAbD4f60Yxy2zE2fnAvSq6
 vM9xLfOdBtgrA==
To: vira,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>
Date: Wed, 14 Jan 2026 09:28:52 -0500
Message-ID: <20260114142900.3945054-10-cel@kernel.org>
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
X-Headers-End: 1vg1sK-0001GX-37
Subject: [f2fs-dev] [PATCH v4 09/16] cifs: Implement fileattr_get for case
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

Upper layers such as NFSD need a way to query whether a filesystem
handles filenames in a case-sensitive manner. The file_kattr
structure now provides case_insensitive and case_preserving fields
for this purpose, but CIFS does not yet report its case sensitivity
behavior through this interface.

Implement cifs_fileattr_get() to report CIFS/SMB case handling
behavior. CIFS servers (typically Windows or Samba) are usually
case-insensitive but case-preserving, meaning they ignore case
during lookups but store filenames exactly as provided.

The implementation reports case sensitivity based on the nocase
mount option, which reflects whether the client expects the server
to perform case-insensitive comparisons. When nocase is set, the
mount is reported as case-insensitive. The case_preserving field
is always set to true since SMB servers preserve filename case at
rest.

The callback is registered in all three inode_operations
structures (directory, file, and symlink) to ensure consistent
reporting across all inode types.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/smb/client/cifsfs.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
index d9664634144d..563eece79b13 100644
--- a/fs/smb/client/cifsfs.c
+++ b/fs/smb/client/cifsfs.c
@@ -30,6 +30,7 @@
 #include <linux/xattr.h>
 #include <linux/mm.h>
 #include <linux/key-type.h>
+#include <linux/fileattr.h>
 #include <uapi/linux/magic.h>
 #include <net/ipv6.h>
 #include "cifsfs.h"
@@ -1193,6 +1194,20 @@ struct file_system_type smb3_fs_type = {
 MODULE_ALIAS_FS("smb3");
 MODULE_ALIAS("smb3");
 
+static int cifs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
+{
+	struct cifs_sb_info *cifs_sb = CIFS_SB(dentry->d_sb);
+	struct cifs_tcon *tcon = cifs_sb_master_tcon(cifs_sb);
+
+	/*
+	 * CIFS/SMB servers are typically case-insensitive and
+	 * case-preserving (the default). The nocase mount option
+	 * reflects what the client expects from the server.
+	 */
+	fa->case_insensitive = tcon->nocase;
+	return 0;
+}
+
 const struct inode_operations cifs_dir_inode_ops = {
 	.create = cifs_create,
 	.atomic_open = cifs_atomic_open,
@@ -1210,6 +1225,7 @@ const struct inode_operations cifs_dir_inode_ops = {
 	.listxattr = cifs_listxattr,
 	.get_acl = cifs_get_acl,
 	.set_acl = cifs_set_acl,
+	.fileattr_get = cifs_fileattr_get,
 };
 
 const struct inode_operations cifs_file_inode_ops = {
@@ -1220,6 +1236,7 @@ const struct inode_operations cifs_file_inode_ops = {
 	.fiemap = cifs_fiemap,
 	.get_acl = cifs_get_acl,
 	.set_acl = cifs_set_acl,
+	.fileattr_get = cifs_fileattr_get,
 };
 
 const char *cifs_get_link(struct dentry *dentry, struct inode *inode,
@@ -1254,6 +1271,7 @@ const struct inode_operations cifs_symlink_inode_ops = {
 	.setattr = cifs_setattr,
 	.permission = cifs_permission,
 	.listxattr = cifs_listxattr,
+	.fileattr_get = cifs_fileattr_get,
 };
 
 /*
-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
