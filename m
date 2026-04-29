Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOcmJ/ZI8mnDpQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Apr 2026 20:07:50 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5934989A3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Apr 2026 20:07:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y7iFWw6vHdic0LpphFRaEUKHjQYZbWVAzljM6v6QfFk=; b=ivA+r0ZXN3JOEw5ZiL619ZdOrA
	s4V2cHoB2ra2VsXpu/Ygnuiachy1U9QpT6iv78D2pjyQkYQzE9Gv8sFb7/JCGDr3uUPcupmGV78BB
	giQtFHOFK+vOM3TxKGT1QrW3bGUq0E9/ewtwU5H9IH376spL0JvOTuJeHE57lyb5YsHI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wI9K8-0004QH-Ct;
	Wed, 29 Apr 2026 18:07:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1wI9K6-0004Q8-Ue
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Apr 2026 18:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K/+nQA2Wh0su98+N815/azVsLyy2ptcHLEd74SX0hIw=; b=NIzHbf7lKOOXlWTeJbOUXsGh9e
 ZXuC60WGzBWVqTNBtS8yutQWb5qf6nfRWe92GLzS4Dh9Y6cPZXtf3neIzh/M44FXjmfUXiRKrQNzJ
 oB/euFLnAS74PI72ob9tvR3FXpBUGDSSdioiPFg3jxWEbo4tHC15u7ZJuv8D580XOhKI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K/+nQA2Wh0su98+N815/azVsLyy2ptcHLEd74SX0hIw=; b=MWTKlTGWsdnWKiaQLknnDGlR3R
 C8HMYkvKQLpLpPNNMS8O7HOhh3Cc8m7AANVlxPQhOxJoGxsERrAoguZbbgfgHDqFBw4TVbqEKqHgq
 K2HDOL1oNXC9mJoC7Mh6ryF5f+YyBpouceEsfFxhhvs8GCyLsATIq1ELv5C2PZauT2Y0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wI9K6-000140-CZ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Apr 2026 18:07:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0FE9E44035;
 Wed, 29 Apr 2026 18:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB594C2BCC7;
 Wed, 29 Apr 2026 18:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777486055;
 bh=VR5IPc+tFJzycK0UcE5Jbwk0EDkpbGyJE15n77IJHGE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=fqvkr/DST3jD/7fw1tlcvwOZ/XxcHM6PprzyY4iezB7kORBU8yt6qrmr41qOuqx5U
 VYERiscNdbCOYMe25//zlyvqanRlr109lLOAQCk8Ay6ElGZvNNerMPwL1JSPmXsreL
 e47ByeMAJPB2o4MTAq6NL67754wu+X6XyjaytkeTYIwzXs2KLdhms7TD8+5goXt8d/
 Y7+YIGS9boZyIhh4RAN6iTwWXhu6UZcaCVD2li9rEDwUqkL0ij5kVTWkfp0C77DhWO
 EbByP9ckuu0DSx27r8C0jhPUQa0Nuq1PoySrxy1HSGrSbKg1OngeChKzxPc7v07X70
 vjl+nM2Nh1vnA==
Date: Wed, 29 Apr 2026 14:07:14 -0400
MIME-Version: 1.0
Message-Id: <20260429-case-sensitivity-v12-3-8057123bebe0@oracle.com>
References: <20260429-case-sensitivity-v12-0-8057123bebe0@oracle.com>
In-Reply-To: <20260429-case-sensitivity-v12-0-8057123bebe0@oracle.com>
To: Al Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4362;
 i=chuck.lever@oracle.com; h=from:subject:message-id;
 bh=9b+u/mWoEz9peMeExQH28HkC0yIPxzHosHi0xcms5fc=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBp8kjcTH8J2NaTirzJ3PCQEELPXpwok/uo9HTkY
 ZDI8Op6AZeJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCafJI3AAKCRAzarMzb2Z/
 l1NFD/9zJRAe2C9NP8WNU4BB6obmcVygcAwzy4rnfRT5QTtFUxPH5zrLxLfDe2d1CeCyDmFJ/v6
 NESCp6VYJTq2L7ke8sS+8YACItdyOWkrf9QZ41eDbabwXFDHW6T5/uFiR6ghEXfNtGkJ3lnkiRO
 oOB/Pukd3RDNjbBj9dcokoSjfoXdpJDw+wBaFQ4kOvMIwp7gKEzd/MvfFn7ViQlsTMUbNLwWdg5
 AJLbV7BdF+skB321MkPIBM+R70TP38lU/B7VMA5TTaYstQ1WhAEhySed9Cn5MoXNGCZnfeJuyEL
 VPI7DUfh2FGUZyZm8wu7R4/OvJ/bGmOgsqFUKL0vkftVxRC8aXzd8YTl0qBvkIfzceVaslAMmdJ
 HCmElBS8tD66LV4AZP3qNnIFsMRLaxROWQUYmN/3kGDNBu32mZWB9EmibSD5fEjmkppdcF13Ocm
 +1wPvrG0nONy+qpzbEGCG62c3b9/J6Mu5Br1/Q1PJ1+hMmvA2jqrhLD4oiQgokXZ90ToCdNYehs
 u5kZcCEk/hYln+EmgmJTzBReTnx5xCfphlV3khF7+GXxpsqhBGs+t9pMYk70GC6g3yQac2GKK/E
 Rj7aHrqTkEBr4YHpb8bfMkgrGHrmr60xWlPeoU+jf4WjGjw6NHD1Pz44JYJchCB98zZwgLkw+8o
 d9S4wY2DoLZgT5Q==
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
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wI9K6-000140-CZ
Subject: [f2fs-dev] [PATCH v12 03/15] fat: Implement fileattr_get for case
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
X-Rspamd-Queue-Id: DE5934989A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:pc@manguebit.org,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:roland.mainz@nrubsig.org,m:almaz.alexandrovich@paragon-software.com,m:adilger.kernel@dilger.ca,m:linux-cifs@vger.kernel.org,m:sfrench@samba.org,m:slava@dubeyko.com,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:sprasad@microsoft.com,m:frank.li@vivo.com,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:jaegeuk@kernel.org,m:hirofumi@mail.parknet.co.jp,m:linux-nfs@vger.kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:senozhatsky@chromium.org,m:chuck.lever@oracle.com,m:hansg@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[manguebit.org,sony.com,kernel.org,nrubsig.org,paragon-software.com,dilger.ca,vger.kernel.org,samba.org,dubeyko.com,microsoft.com,vivo.com,gmail.com,physik.fu-berlin.de,mail.parknet.co.jp,mit.edu,lists.sourceforge.net,chromium.org,oracle.com,samsung.com];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[32];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.824];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[cel@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,nrubsig.org:email,oracle.com:mid,oracle.com:email]

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
