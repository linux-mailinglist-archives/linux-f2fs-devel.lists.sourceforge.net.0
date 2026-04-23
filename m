Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0D31Kc8a6mkOuQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Apr 2026 15:12:47 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE524528F0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Apr 2026 15:12:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXxgFPVIUJn1NwuMkzJqcGzdVlSATcASOgQ+44aonM4=; b=SxgqbQOIBBHmsCiO+/J7f1uP8o
	KqMQ+mOQLJQGS+Zq0YSSe6TARueLDJ6oI4SZuCG9lVBJ4OIATWlo1QwXmW/kLLo48NUfQu2mXmIzc
	NItkHh515nad9uTyftF7JtUSM/jme9dQJDASyCaaZxdEwII2aWgqfDvEsEE658/nndrg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wFtrJ-0003em-En;
	Thu, 23 Apr 2026 13:12:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1wFtrH-0003ee-B1
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Apr 2026 13:12:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4v9wqjMqYdgaddeZ/JwwYGx8kxeDhvSp9zNQUxYq2fc=; b=RZubPlZ3tIix0h4I69VZNfL/57
 U6137OWuc/UES9b28VZyrSPlOjilBkHdRKo6LwadsqlT1ejjBCPqhMyGlB19VHJvr+7dwJPQUs0Zx
 Skc+Z+JEgGDlE+rBQL34ULu2osJ87WErpllO3vci2ONKcTeZ4QOmm0Piisyq+OHXaeDE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4v9wqjMqYdgaddeZ/JwwYGx8kxeDhvSp9zNQUxYq2fc=; b=RT2vrrAmC7ccjRZ23DmkKL7grH
 hbMHvmIdAv8bzPLnwWJViYPYayv//L62O9HB9m87tgRltQOlhDuiSZlMmv8CeXLnP78roqMMWfxD6
 I6GCf3jPfyIq10Tuu0X5fFvRlQLInUN5v2HeBem3Yq8fpE8R5HYaVbHmLB0lWD3CILwM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wFtrA-0006nm-JB for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Apr 2026 13:12:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BF4BC6015B;
 Thu, 23 Apr 2026 13:12:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E32C2BCB4;
 Thu, 23 Apr 2026 13:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776949950;
 bh=GBRThfl8AJdjIQY1hCpFaRdtjODXMDI8+pFJwoD6QKg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=W9vQKqa0nGOsapVu7taHMUThskjH6lMOussU0W0x1SC1O9YkQUGpUUwXja8rSN48I
 TwK0A5mX73dlUuAowslo8MnRqxeGaGPL00NKfyISw18j0+ksFDk6nILM7fhh2F8D2E
 J1cBQ09B6cpv0KxeUtbo+Jnbciotr2F6pAPcJPGbFffPtGVS0yLyoX5cCwAuNb6W9E
 oVWdWQsG+tzAENnpBpig/UY+W0wc9yWFsfQ07pPb9N5MoaZ+DCA+cwPmQnwIrPy8WP
 WjLBNmOUu/SynhlD4oo/+fxgM0X5jyhtzhSqeB1VBeXYb8Ws23DXEEW2CaMbCKDUYZ
 cW9TkGOXp1+Rw==
Date: Thu, 23 Apr 2026 09:12:06 -0400
MIME-Version: 1.0
Message-Id: <20260423-case-sensitivity-v10-3-c385d674a6cf@oracle.com>
References: <20260423-case-sensitivity-v10-0-c385d674a6cf@oracle.com>
In-Reply-To: <20260423-case-sensitivity-v10-0-c385d674a6cf@oracle.com>
To: Al Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3856;
 i=chuck.lever@oracle.com; h=from:subject:message-id;
 bh=z0G26qNOK5JhmRz9M45By4F6NKvq8eKa6ZlbA0umD2I=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBp6hqzhQ4CSX2BgNJWYYLNu38a9BCDxEokRi4Xl
 ykrZ4frVAiJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCaeoaswAKCRAzarMzb2Z/
 lxTyD/9AFx9PEDAFHBJoF2p/hUJFYsfpPsY+fQSOYOQsvZHQWT02iVJ/Ps31IZocal19lZ6Ncwz
 GAlHBA5zy3e0k4UsVKDxnGrNIydJ6xjEgzW0zbPzIQszSAnMep56jmLfIcMPP8m1taBj+Zfelj9
 nTr4v3bt44/UTLyudqklgnRfoKAIyNuPjlowtNv2DNW6F6sZD8TXOgOsw8tm1szWdS+SnUEe+jF
 Pg4QjpzGrGuIieYWxkfyPTGzrDAS1HFJHSpsG5ppT53lgLknvuEgoKlfraZ7nXGfXAQVuQ8Xnz2
 Vv+vGhxI1PQQ6DWkSdQQLV14PfoVA3weiAPVK0e1djI7VEVChPy5KMWhhcDLtG1ViT1aLD+4Zz6
 5jJGUGP76QqiKRQwNwIgRFGKIKHaMU8KcciPMrkiJQMMJ42OKI9xglRGXbU5Ruo++I6wjr5qer7
 FUz1vurjswos2vPktcWMyh+txl/XDVTK8lWFReLdeWgZB21wiQoXHkcggzgcPdkIpMPvM04xDyn
 iWwn8WHwS3/sgl7pPyE8kIHawXuoczf7i/iYXwNHpHX5QdhJKyPE1GAIEwkAJsA6edpb0TGrOKA
 1KMQnEV2XWxw4B3bQnZlO3bfIAf7tW7SPYHYj5xRfh5031POsCr2TiqgPIjkk3uczVwRgkj5jIo
 k7wp6gkaNgTtdgg==
X-Developer-Key: i=chuck.lever@oracle.com; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chuck Lever <chuck.lever@oracle.com> Report FAT's case
 sensitivity behavior via the FS_XFLAG_CASEFOLD and FS_XFLAG_CASENONPRESERVING
 flags. FAT filesystems are case-insensitive by default. MSDOS supports a
 'nocase' mount option that enables case-sensitive behavior; check this option
 when reporting case sensitivity. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wFtrA-0006nm-JB
Subject: [f2fs-dev] [PATCH v10 03/17] fat: Implement fileattr_get for case
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
 tytso@mit.edu, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, Chuck Lever <chuck.lever@oracle.com>,
 hansg@kernel.org, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 sj1557.seo@samsung.com, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-6.71 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[manguebit.org,sony.com,kernel.org,paragon-software.com,dilger.ca,vger.kernel.org,samba.org,dubeyko.com,microsoft.com,vivo.com,gmail.com,physik.fu-berlin.de,mail.parknet.co.jp,mit.edu,lists.sourceforge.net,chromium.org,oracle.com,samsung.com];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCPT_COUNT_TWELVE(0.00)[31];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:pc@manguebit.org,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:almaz.alexandrovich@paragon-software.com,m:adilger.kernel@dilger.ca,m:linux-cifs@vger.kernel.org,m:sfrench@samba.org,m:slava@dubeyko.com,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:sprasad@microsoft.com,m:frank.li@vivo.com,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:jaegeuk@kernel.org,m:hirofumi@mail.parknet.co.jp,m:linux-nfs@vger.kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:senozhatsky@chromium.org,m:chuck.lever@oracle.com,m:hansg@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MAILSPIKE_FAIL(0.00)[216.105.38.7:server fail];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[cel@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:mid,oracle.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: ECE524528F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Chuck Lever <chuck.lever@oracle.com>

Report FAT's case sensitivity behavior via the FS_XFLAG_CASEFOLD
and FS_XFLAG_CASENONPRESERVING flags. FAT filesystems are
case-insensitive by default.

MSDOS supports a 'nocase' mount option that enables case-sensitive
behavior; check this option when reporting case sensitivity.

VFAT long filename entries preserve case; without VFAT, only
uppercased 8.3 short names are stored. MSDOS with 'nocase' also
preserves case since the name-formatting code skips upcasing when
'nocase' is set. Check both options when reporting case preservation.

Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/fat/fat.h         |  3 +++
 fs/fat/file.c        | 23 +++++++++++++++++++++++
 fs/fat/namei_msdos.c |  1 +
 fs/fat/namei_vfat.c  |  1 +
 4 files changed, 28 insertions(+)

diff --git a/fs/fat/fat.h b/fs/fat/fat.h
index 5a58f0bf8ce8..99ed9228a677 100644
--- a/fs/fat/fat.h
+++ b/fs/fat/fat.h
@@ -10,6 +10,8 @@
 #include <linux/fs_context.h>
 #include <linux/fs_parser.h>
 
+struct file_kattr;
+
 /*
  * vfat shortname flags
  */
@@ -408,6 +410,7 @@ extern void fat_truncate_blocks(struct inode *inode, loff_t offset);
 extern int fat_getattr(struct mnt_idmap *idmap,
 		       const struct path *path, struct kstat *stat,
 		       u32 request_mask, unsigned int flags);
+int fat_fileattr_get(struct dentry *dentry, struct file_kattr *fa);
 extern int fat_file_fsync(struct file *file, loff_t start, loff_t end,
 			  int datasync);
 
diff --git a/fs/fat/file.c b/fs/fat/file.c
index becccdd2e501..34d8588fcd3f 100644
--- a/fs/fat/file.c
+++ b/fs/fat/file.c
@@ -17,6 +17,7 @@
 #include <linux/fsnotify.h>
 #include <linux/security.h>
 #include <linux/falloc.h>
+#include <linux/fileattr.h>
 #include "fat.h"
 
 static long fat_fallocate(struct file *file, int mode,
@@ -398,6 +399,27 @@ void fat_truncate_blocks(struct inode *inode, loff_t offset)
 	fat_flush_inodes(inode->i_sb, inode, NULL);
 }
 
+int fat_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
+{
+	struct msdos_sb_info *sbi = MSDOS_SB(dentry->d_sb);
+
+	/*
+	 * FAT filesystems are case-insensitive by default. MSDOS
+	 * supports a 'nocase' mount option for case-sensitive behavior.
+	 *
+	 * VFAT long filename entries preserve case. Without VFAT, only
+	 * uppercased 8.3 short names are stored. MSDOS with 'nocase'
+	 * also preserves case.
+	 */
+	if (!sbi->options.nocase) {
+		fa->fsx_xflags |= FS_XFLAG_CASEFOLD;
+		if (!sbi->options.isvfat)
+			fa->fsx_xflags |= FS_XFLAG_CASENONPRESERVING;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fat_fileattr_get);
+
 int fat_getattr(struct mnt_idmap *idmap, const struct path *path,
 		struct kstat *stat, u32 request_mask, unsigned int flags)
 {
@@ -575,5 +597,6 @@ EXPORT_SYMBOL_GPL(fat_setattr);
 const struct inode_operations fat_file_inode_operations = {
 	.setattr	= fat_setattr,
 	.getattr	= fat_getattr,
+	.fileattr_get	= fat_fileattr_get,
 	.update_time	= fat_update_time,
 };
diff --git a/fs/fat/namei_msdos.c b/fs/fat/namei_msdos.c
index 4cc65f330fb7..0fd2971ad4b1 100644
--- a/fs/fat/namei_msdos.c
+++ b/fs/fat/namei_msdos.c
@@ -644,6 +644,7 @@ static const struct inode_operations msdos_dir_inode_operations = {
 	.rename		= msdos_rename,
 	.setattr	= fat_setattr,
 	.getattr	= fat_getattr,
+	.fileattr_get	= fat_fileattr_get,
 	.update_time	= fat_update_time,
 };
 
diff --git a/fs/fat/namei_vfat.c b/fs/fat/namei_vfat.c
index 918b3756674c..e909447873e3 100644
--- a/fs/fat/namei_vfat.c
+++ b/fs/fat/namei_vfat.c
@@ -1185,6 +1185,7 @@ static const struct inode_operations vfat_dir_inode_operations = {
 	.rename		= vfat_rename2,
 	.setattr	= fat_setattr,
 	.getattr	= fat_getattr,
+	.fileattr_get	= fat_fileattr_get,
 	.update_time	= fat_update_time,
 };
 

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
