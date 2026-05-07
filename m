Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCaQFydT/GlnOQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 07 May 2026 10:53:59 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EDECE4E5347
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 07 May 2026 10:53:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y7iFWw6vHdic0LpphFRaEUKHjQYZbWVAzljM6v6QfFk=; b=bame54dFZFwY2vUGqF1Y7Wg17p
	X0cc57zaDsgD6Xsp2UBuvRNYvvV6as+0yIiK9pdLoHBzUrrCPqO9tUW+UMHqsH8MhJkWDjD9RlIyY
	NTrIR5C5D1ju7vkXCfPFjuXoyuqCPyyoLrJymZQG+6lOOeugc7XgVZ/DUu2JiVJvPCN8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wKuUW-0004LN-SB;
	Thu, 07 May 2026 08:53:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1wKuUV-0004LA-GW
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 May 2026 08:53:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K/+nQA2Wh0su98+N815/azVsLyy2ptcHLEd74SX0hIw=; b=SWM2LJlSTzKdj2XwxvVFXpssud
 kFZwznbflD9JKFCed2jxiJUSyQMzFzl6eDDdj+LLL/3e2cZ5cREr96Q1sEnmE/Eyz/CY/TGoZGPzT
 rfHIfBnFC8N5ZbQXrERtyxpVW5UF8vhSZD0svfmdtHiLhkxyAY1B6w3mUzthu17HC6vM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K/+nQA2Wh0su98+N815/azVsLyy2ptcHLEd74SX0hIw=; b=UqNSRVqGyOh4kQd7g8s9UAZ8CS
 zg3uQakdiuD5XPxwZHcemwvbodhbY7gbrZpk8E4Qsx5h6kA7iHzEgFfmAH90eBckD5jfozsBO2SAs
 0NPUKcwT8GCmhMVR0PpS1m64kMAFokcHiZ4ggLzpafg98E+XUi4cAsbi2pP+7WceWzzo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wKuUV-00029e-Mj for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 May 2026 08:53:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 69ECE4036C;
 Thu,  7 May 2026 08:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B29C2BCB2;
 Thu,  7 May 2026 08:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778144025;
 bh=VR5IPc+tFJzycK0UcE5Jbwk0EDkpbGyJE15n77IJHGE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=FLtLybemuNm208K4Z+hWYxbHG96mvth2fjkpP8nXfRZVVDnqPWYpbEw+6zMGagZDN
 qUpFFOhQF6cW8Or5CQMIan6AG9hn447PpTM/718rixqZdmF3Pj2Yz2OuEGo0Ha6TFk
 O12zYvpt7HF6fiR67rg9xKJ5Q7csvRBT9Il1mhbDJlCmYBnTsPmgcFo4D7G7gUF4Bg
 IAWpEzKUi6NaVzPlohnWN9T2k5tr3/GaLq511iF0vBY5jP3AHXp4UUiSOfAJoiFR/0
 jdfHvgGV7p10ZIaJ6z2ICUVhQhm8CMu0mJuad/U2GXS1wzNvvk0GqY75u3lZPadAuO
 RVqVgTyvyhBcg==
Date: Thu, 07 May 2026 04:52:56 -0400
MIME-Version: 1.0
Message-Id: <20260507-case-sensitivity-v14-3-e62cc8200435@oracle.com>
References: <20260507-case-sensitivity-v14-0-e62cc8200435@oracle.com>
In-Reply-To: <20260507-case-sensitivity-v14-0-e62cc8200435@oracle.com>
To: Al Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4362;
 i=chuck.lever@oracle.com; h=from:subject:message-id;
 bh=9b+u/mWoEz9peMeExQH28HkC0yIPxzHosHi0xcms5fc=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBp/FL13ap/p4dVIsp+5QfdsEFrkqNQsJ/m07/1M
 xeh8VDcF1uJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCafxS9QAKCRAzarMzb2Z/
 l5ZnD/9aWBipo8tKAewFwUsZjLow2wYgQYmqehy7hiNaM03rdF6wPfMGIjCz1RqHfUtJKaAxaIS
 rfQtm5PbcPy5f+mK+4oPJS3PvbPKbbqi+pCXgFSXSQeRwuPJ4rmgDvUg26MsKRe92rjNfr6qm6h
 4JvyGPPJrHBsOXtNW1MvH4BjXipdzpA/S2D0D48IiakWV1GgON36nZ4tpvFWy13VgGIK6DU6tAg
 MYtHPuV0fIwdJi9C13ktLQmIrbeXnRTqAl0VTxMwwPGfRgurBdPfe1Vio3Ysc9ghDm9BJ60ytLu
 wtpKgj1F6WfcFtodjZd8qwceI80V3zf+/ZOCXW0XS8YUiehPcvvJw813gbEd7BUFzo3K1PjYuQY
 0Kjde2CkCDcGSI3k8zzsTs+5G86GCzP02/6xkc9hUqJDMR4zS1WM4mfcHSGcSxCPALA80+oTROq
 zA2XI/qIqxrtnbkT2hVflKlrz+cGktRtkjlTndpYk4x7xXRYCfmIIabfb49n3CDKkPUTvUJFooT
 gB5SgsyOIUs08k1DdoV8vbBXjbai7Sc/jH1WClla0Ix6uECSyPpS8Ir/GiO8klmIk/ufIO5rbeW
 ilJ3+i3mEqiZtKL1sb32gzTPzdc6k/O3sL7hBTe2q9+JXugVSzvnlgWc7ZdwJhWz45M+XZEGZgb
 N1QCCSSgZ5nhH1w==
X-Developer-Key: i=chuck.lever@oracle.com; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
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
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wKuUV-00029e-Mj
Subject: [f2fs-dev] [PATCH v14 03/15] fat: Implement fileattr_get for case
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
 Roland Mainz <roland.mainz@nrubsig.org>,
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
X-Rspamd-Queue-Id: EDECE4E5347
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:pc@manguebit.org,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:roland.mainz@nrubsig.org,m:almaz.alexandrovich@paragon-software.com,m:adilger.kernel@dilger.ca,m:linux-cifs@vger.kernel.org,m:sfrench@samba.org,m:slava@dubeyko.com,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:sprasad@microsoft.com,m:frank.li@vivo.com,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:jaegeuk@kernel.org,m:hirofumi@mail.parknet.co.jp,m:linux-nfs@vger.kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:senozhatsky@chromium.org,m:chuck.lever@oracle.com,m:hansg@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[manguebit.org,sony.com,kernel.org,nrubsig.org,paragon-software.com,dilger.ca,vger.kernel.org,samba.org,dubeyko.com,microsoft.com,vivo.com,gmail.com,physik.fu-berlin.de,mail.parknet.co.jp,mit.edu,lists.sourceforge.net,chromium.org,oracle.com,samsung.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[32];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[cel@kernel.org]
X-Rspamd-Action: no action

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
Reviewed-by: Roland Mainz <roland.mainz@nrubsig.org>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/fat/fat.h         |  3 +++
 fs/fat/file.c        | 36 ++++++++++++++++++++++++++++++++++++
 fs/fat/namei_msdos.c |  1 +
 fs/fat/namei_vfat.c  |  1 +
 4 files changed, 41 insertions(+)

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
index becccdd2e501..37e7049b4c8c 100644
--- a/fs/fat/file.c
+++ b/fs/fat/file.c
@@ -17,6 +17,7 @@
 #include <linux/fsnotify.h>
 #include <linux/security.h>
 #include <linux/falloc.h>
+#include <linux/fileattr.h>
 #include "fat.h"
 
 static long fat_fallocate(struct file *file, int mode,
@@ -398,6 +399,40 @@ void fat_truncate_blocks(struct inode *inode, loff_t offset)
 	fat_flush_inodes(inode->i_sb, inode, NULL);
 }
 
+int fat_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
+{
+	struct msdos_sb_info *sbi = MSDOS_SB(dentry->d_sb);
+	bool case_sensitive;
+
+	/*
+	 * FAT filesystems are case-insensitive by default. VFAT
+	 * becomes case-sensitive when mounted with 'check=strict',
+	 * which installs vfat_dentry_ops. MSDOS has no such option;
+	 * its 'nocase' mount option selects case-sensitive matching.
+	 *
+	 * VFAT long filename entries preserve case. Without VFAT, only
+	 * uppercased 8.3 short names are stored. MSDOS with 'nocase'
+	 * also preserves case.
+	 */
+	if (sbi->options.isvfat)
+		case_sensitive = sbi->options.name_check == 's';
+	else
+		case_sensitive = sbi->options.nocase;
+
+	if (!case_sensitive) {
+		fa->fsx_xflags |= FS_XFLAG_CASEFOLD;
+		fa->flags |= FS_CASEFOLD_FL;
+		if (!sbi->options.isvfat)
+			fa->fsx_xflags |= FS_XFLAG_CASENONPRESERVING;
+	}
+	if (d_inode(dentry)->i_flags & S_IMMUTABLE) {
+		fa->fsx_xflags |= FS_XFLAG_IMMUTABLE;
+		fa->flags |= FS_IMMUTABLE_FL;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fat_fileattr_get);
+
 int fat_getattr(struct mnt_idmap *idmap, const struct path *path,
 		struct kstat *stat, u32 request_mask, unsigned int flags)
 {
@@ -575,5 +610,6 @@ EXPORT_SYMBOL_GPL(fat_setattr);
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
