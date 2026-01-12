Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 359D7D14792
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jan 2026 18:46:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UwZKzxln4y05LVNP1R3ILL7k9qgJ3PZGOZMgTGX/aRo=; b=RKZxl+krbE9KTFeVFuXlKYZpWa
	kMcajuEyciOqQNx6UUpTUrplD7ksLk6SOnfhZ2O20F7kXF7TtVX6qP/I33EK7UaVprGHmO8Netgj8
	4apa1OCqjFERsqAKUyya79sRibYxo0qllvxBn0USB9c/QZPjfDtLXiIEMZiszgtBvktI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfM09-0003ln-E3;
	Mon, 12 Jan 2026 17:46:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1vfM08-0003lh-E2
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 17:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zay97RBKnsWqlCjddCBJboDV8siNidzwGFqPTbo1gzE=; b=hIQpfg1oyEM7MxaiFqkmHp0HfI
 cmvow9MjS5Azh+BrbVmreBxIFDc6Of0YeRjg2M0g93PVOw+tKwK/bYImKuchWotIZkxVmVCZuyY2n
 p0gOGEVrBNleLGhHz7Mzr7wkyhXW56nOU3hDtNZ9cwm6yBYJ3YWxmAUWVwIQHdHQRZc0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Zay97RBKnsWqlCjddCBJboDV8siNidzwGFqPTbo1gzE=; b=HXkjb+xMfegyUD5KGLWwRtyHBP
 ryQKeE0/2saKIyQIMwoHCuPKJirTwimEAdP/ORrfOlwSdxLo4nxCeA2wv/was8tfQuncUQTFn30ob
 kPoQHQ7Tdue8HvhAEsaxkgSGdTJE4kq+skg5GZIJna8UsnBfzrUd7Cc8LRAg9m3mpixs=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfM07-0008SY-PV for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 17:46:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 233BA435E8;
 Mon, 12 Jan 2026 17:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0AE2C2BCC9;
 Mon, 12 Jan 2026 17:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768240002;
 bh=VGLtz3ng7N2hDrsXpu5xqwabJ5hM20loNzopsi5kxR8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H4ozSu6P9lbOLpeQoBMMJpU5kTHiLq3wlZy6zItCzG0UHGCHRMFCD0E3BBUsX7dbu
 TY3PPGWxN0mHVzlvR6SinmbODUN3x2+HBUxnixzZni1Qfmk6joDiAH+27iaQo88bNn
 8ITeAuJ7yt6mgXvUMM8nmUeSkDB3ujAh98rgAcQyopKXHcfEO65tZ8PYQ7t4G54S5w
 tz9/Qk1IaN8xwvJlyDz0hGeJzm3a46KZfjI3q3QtytBmip3p4mMFhHIZaDs3MrWXiC
 Y/5Mbp6Mj5eG8bLawHoN7K6vBbIKcbDbQUb4xhfM8BzihRKkxTcsgPN50aU/hFo3kc
 x8qFglImcZa1g==
To: vira,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>
Date: Mon, 12 Jan 2026 12:46:15 -0500
Message-ID: <20260112174629.3729358-3-cel@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112174629.3729358-1-cel@kernel.org>
References: <20260112174629.3729358-1-cel@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chuck Lever <chuck.lever@oracle.com> Report FAT's case
 sensitivity behavior via the file_kattr boolean fields. FAT filesystems are
 case-insensitive by default and do not preserve case at rest (stored names
 are uppercased). 
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
X-Headers-End: 1vfM07-0008SY-PV
Subject: [f2fs-dev] [PATCH v3 02/16] fat: Implement fileattr_get for case
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

Report FAT's case sensitivity behavior via the file_kattr boolean
fields. FAT filesystems are case-insensitive by default and do not
preserve case at rest (stored names are uppercased).

MSDOS supports a 'nocase' mount option that enables case-sensitive
behavior; check this option when reporting case sensitivity.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/fat/fat.h         |  3 +++
 fs/fat/file.c        | 18 ++++++++++++++++++
 fs/fat/namei_msdos.c |  1 +
 fs/fat/namei_vfat.c  |  1 +
 4 files changed, 23 insertions(+)

diff --git a/fs/fat/fat.h b/fs/fat/fat.h
index d3e426de5f01..38da08d8fec4 100644
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
@@ -407,6 +409,7 @@ extern void fat_truncate_blocks(struct inode *inode, loff_t offset);
 extern int fat_getattr(struct mnt_idmap *idmap,
 		       const struct path *path, struct kstat *stat,
 		       u32 request_mask, unsigned int flags);
+extern int fat_fileattr_get(struct dentry *dentry, struct file_kattr *fa);
 extern int fat_file_fsync(struct file *file, loff_t start, loff_t end,
 			  int datasync);
 
diff --git a/fs/fat/file.c b/fs/fat/file.c
index 4fc49a614fb8..d26dc792611a 100644
--- a/fs/fat/file.c
+++ b/fs/fat/file.c
@@ -16,6 +16,7 @@
 #include <linux/fsnotify.h>
 #include <linux/security.h>
 #include <linux/falloc.h>
+#include <linux/fileattr.h>
 #include "fat.h"
 
 static long fat_fallocate(struct file *file, int mode,
@@ -395,6 +396,22 @@ void fat_truncate_blocks(struct inode *inode, loff_t offset)
 	fat_flush_inodes(inode->i_sb, inode, NULL);
 }
 
+int fat_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
+{
+	struct msdos_sb_info *sbi = MSDOS_SB(dentry->d_sb);
+
+	/*
+	 * FAT filesystems do not preserve case: stored names are
+	 * uppercased. They are case-insensitive by default, but
+	 * MSDOS supports a 'nocase' mount option for case-sensitive
+	 * behavior.
+	 */
+	fa->case_insensitive = !sbi->options.nocase;
+	fa->case_preserving = false;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fat_fileattr_get);
+
 int fat_getattr(struct mnt_idmap *idmap, const struct path *path,
 		struct kstat *stat, u32 request_mask, unsigned int flags)
 {
@@ -574,5 +591,6 @@ EXPORT_SYMBOL_GPL(fat_setattr);
 const struct inode_operations fat_file_inode_operations = {
 	.setattr	= fat_setattr,
 	.getattr	= fat_getattr,
+	.fileattr_get	= fat_fileattr_get,
 	.update_time	= fat_update_time,
 };
diff --git a/fs/fat/namei_msdos.c b/fs/fat/namei_msdos.c
index 0b920ee40a7f..380add5c6c66 100644
--- a/fs/fat/namei_msdos.c
+++ b/fs/fat/namei_msdos.c
@@ -640,6 +640,7 @@ static const struct inode_operations msdos_dir_inode_operations = {
 	.rename		= msdos_rename,
 	.setattr	= fat_setattr,
 	.getattr	= fat_getattr,
+	.fileattr_get	= fat_fileattr_get,
 	.update_time	= fat_update_time,
 };
 
diff --git a/fs/fat/namei_vfat.c b/fs/fat/namei_vfat.c
index 5dbc4cbb8fce..6cf513f97afa 100644
--- a/fs/fat/namei_vfat.c
+++ b/fs/fat/namei_vfat.c
@@ -1180,6 +1180,7 @@ static const struct inode_operations vfat_dir_inode_operations = {
 	.rename		= vfat_rename2,
 	.setattr	= fat_setattr,
 	.getattr	= fat_getattr,
+	.fileattr_get	= fat_fileattr_get,
 	.update_time	= fat_update_time,
 };
 
-- 
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
