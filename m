Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBPLHWVT/GlnOQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 07 May 2026 10:55:01 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D04FF4E5421
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 07 May 2026 10:55:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjlE4w3DwsezgkB9GEEZMg4HboiCQ7n7JwUO+6ksqZU=; b=e2/qkglpcrkKPFiSZFh8FMPN0Q
	m8mCXIVGzn8HBH5Ur1aKeEtoDFu/r83Xhfa1+alh0o2niTpjDZZ8TL14KPoUy/uz3MOjeS/g0BhXE
	xHpiz1TX4xrL96LHMvS0+vxsSIRdxyyCcU6rdl9HcxBjOIyfYq1TczOOCpN6o/BnjL5E=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wKuVX-0005mX-H2;
	Thu, 07 May 2026 08:54:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1wKuVW-0005mP-5K
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 May 2026 08:54:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=okYb1rCy7YLX9Nhkr3j1SUVMKLgwaWS0nQ+ZigFK7g8=; b=aowEN048kjU8PghC4DvjllXtpv
 Kt4KDTLAdOKqKBrdrVf9VDMc4NTvUX70WCWAq1xqh5KpjMS+dpe/EeFW9373Yj7YuGjqM0o6buGVo
 l2Ma4UpWHgSRdyphhZOvCai63CpTPiHpzdpcivZCedhrS/NnhMpO/Lj3x44NiiN+nF70=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=okYb1rCy7YLX9Nhkr3j1SUVMKLgwaWS0nQ+ZigFK7g8=; b=OrC92oDpIr2nbqrZY0c8vr7Wwu
 9e045q1qgJKf+mZAhYJO2oDMO7N0ekOd/6m++q/b8FXyDbe7mes5qvDKD7+qx329BxUDGKVzUov2H
 JFEbxTyKPHs5FywNlzGq7uJhJEMU0sLJwwQRk13uNtp2cL+JLAe7lCIEQWq1HnEndFFg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wKuVV-0002E6-7s for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 May 2026 08:54:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id ECC2043BBA;
 Thu,  7 May 2026 08:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07B88C2BCC4;
 Thu,  7 May 2026 08:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778144091;
 bh=pwh6ZK7+DyUSteq+vdVu0HYuHs8P3NPOtCprGITxaEM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=PGxwO/WhnWaiLe5vPy1RO0Vt1mnrFCvoFPnfIMrC2vlGNM1m2Nui9Y1rUMVDpN4Ne
 LRUZJeNFc9v3jF9UMKtRjQsg35C1wHJLyuJAw+Tyt1i5qiXQi46/QcZf4s3qkkJAE9
 B1qp9IBOmD4BuHxzYclexn6jcPxaDxOxGO7fsw15LG2J5Z3XLJEAsW1hRfJc4NT3TX
 bPgJt0c7zZV9tsNYACpGH7lpeZawtkBGxh0yjmsQhzijwnzgPDplooFfvXVUWayUoZ
 v0Zv+OWfNDLzGnbXLpjAWr/a0KqeVqiQUTBgXZC52Z1X4Pf7eCcjjhrQp67f0+LoVC
 gU7dldxlLrnIQ==
Date: Thu, 07 May 2026 04:53:05 -0400
MIME-Version: 1.0
Message-Id: <20260507-case-sensitivity-v14-12-e62cc8200435@oracle.com>
References: <20260507-case-sensitivity-v14-0-e62cc8200435@oracle.com>
In-Reply-To: <20260507-case-sensitivity-v14-0-e62cc8200435@oracle.com>
To: Al Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3535;
 i=chuck.lever@oracle.com; h=from:subject:message-id;
 bh=eE/CDF09GJkNn3nT+HwwWprfQOLLBRzGLyDUxw4X/sk=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBp/FL2Q49p5hOskD3m4hITiiHyoRZeUREVxwa2c
 6t3N8etHpeJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCafxS9gAKCRAzarMzb2Z/
 lxZWEACD/ZqGaHOY/9qPDm5wUREev4kdzBhIdloxMNaess81b8RsbPCGLEpz0z0okkUB4/A14Lv
 B3oSplfs5DGGYaFQ4/3vYRjxYIqmpQEWVPJKhzNtvaAFd/xdIEY2dI9FFsacJfqjBoO65U4CCA3
 XahcgQ0p4WHU3wvmnaUy492rzND+Po0NxZz+VHF5/iCWEilVTca1RN8krmuf6IlthO102jTV/lE
 CGpZX4Vt6x6zXmfgVASelyeNh5CjtumAuD+mlA3FSevPwSVoTkgiqC41WbBxoCxvHCjAa8+aAEt
 FuDL7Dz4Zfc3UlAixWWLO39TDxJnWMq8THMe3Aal+Xz/g4oGeM7KWY0Og1SGTb4jaHHm79x1vY1
 GXLT5LNOIHxIc4DQSUcpLVv0RsCQ5AQqOQqsOaBqAZV9Eu9/BDx2ipRkKW57FC8G/ObPK/CirNK
 TZLufXPruY05n2S1GghycCnz3MCaJYZ67/mwLAqBCQsJ8sP8ccyHDu1tPL9GAbIHbKzKcNRgoT2
 8QtESiYoKGqq5FHENLGtH6hktGKCfY+MlD84tawGebujO3nvwOiffMpwWQUg/jYshOReJ95Zgxp
 7SeuG+uKUA1tnRkR7ONJYR0P7PH45VQkOZ8k7LANRFtL6cSPaBwX8fxmGuOV1js+EzRccTxVCzl
 DmHXGh1OISOMCSw==
X-Developer-Key: i=chuck.lever@oracle.com; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97
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
 manner so they can provide correct semantics to remote clients. Without this
 information, NFS e [...] 
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
X-Headers-End: 1wKuVV-0002E6-7s
Subject: [f2fs-dev] [PATCH v14 12/15] isofs: Implement fileattr_get for case
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
X-Rspamd-Queue-Id: D04FF4E5421
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
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
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

Upper layers such as NFSD need a way to query whether a
filesystem handles filenames in a case-sensitive manner so
they can provide correct semantics to remote clients. Without
this information, NFS exports of ISO 9660 filesystems cannot
advertise their filename case behavior.

Implement isofs_fileattr_get() to report ISO 9660 case handling
behavior. The 'check=r' (relaxed) mount option enables
case-insensitive lookups and is reported via FS_XFLAG_CASEFOLD.
By default, Joliet extensions operate in relaxed mode while
plain ISO 9660 uses strict (case-sensitive) mode.

Plain ISO 9660 names on the medium are uppercase. When neither
Rock Ridge nor Joliet is in effect, the default 'map=n' option
(and 'map=a') routes lookup and readdir through
isofs_name_translate(), which forces A-Z to a-z. The names
visible to userspace then differ in case from the on-disc form,
so report FS_XFLAG_CASENONPRESERVING in that configuration. Rock
Ridge and Joliet both deliver names as authored, and 'map=o'
emits the raw on-disc name unchanged, so those configurations
remain case-preserving.

Casefolding is a directory property, and the in-tree consumers
(NFSD, ksmbd) issue the query against a directory: NFSD walks
to the parent for non-directory dentries before calling
vfs_fileattr_get(), and ksmbd reports per-share attributes from
the share root. Wire .fileattr_get only on
isofs_dir_inode_operations. The CASEFOLD flag is set in both
fa->fsx_xflags and fa->flags so FS_IOC_FSGETXATTR and
FS_IOC_GETFLAGS agree.

Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Roland Mainz <roland.mainz@nrubsig.org>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/isofs/dir.c   | 16 ++++++++++++++++
 fs/isofs/isofs.h |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/fs/isofs/dir.c b/fs/isofs/dir.c
index 2fd9948d606e..55385a72a4ce 100644
--- a/fs/isofs/dir.c
+++ b/fs/isofs/dir.c
@@ -14,6 +14,7 @@
 #include <linux/gfp.h>
 #include <linux/filelock.h>
 #include "isofs.h"
+#include <linux/fileattr.h>
 
 int isofs_name_translate(struct iso_directory_record *de, char *new, struct inode *inode)
 {
@@ -267,6 +268,20 @@ static int isofs_readdir(struct file *file, struct dir_context *ctx)
 	return result;
 }
 
+int isofs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
+{
+	struct isofs_sb_info *sbi = ISOFS_SB(dentry->d_sb);
+
+	if (sbi->s_check == 'r') {
+		fa->fsx_xflags |= FS_XFLAG_CASEFOLD;
+		fa->flags |= FS_CASEFOLD_FL;
+	}
+	if (!sbi->s_joliet_level && !sbi->s_rock &&
+	    (sbi->s_mapping == 'n' || sbi->s_mapping == 'a'))
+		fa->fsx_xflags |= FS_XFLAG_CASENONPRESERVING;
+	return 0;
+}
+
 const struct file_operations isofs_dir_operations =
 {
 	.llseek = generic_file_llseek,
@@ -281,6 +296,7 @@ const struct file_operations isofs_dir_operations =
 const struct inode_operations isofs_dir_inode_operations =
 {
 	.lookup = isofs_lookup,
+	.fileattr_get = isofs_fileattr_get,
 };
 
 
diff --git a/fs/isofs/isofs.h b/fs/isofs/isofs.h
index 506555837533..0ec8b24a42ed 100644
--- a/fs/isofs/isofs.h
+++ b/fs/isofs/isofs.h
@@ -197,6 +197,9 @@ isofs_normalize_block_and_offset(struct iso_directory_record* de,
 	}
 }
 
+struct file_kattr;
+int isofs_fileattr_get(struct dentry *dentry, struct file_kattr *fa);
+
 extern const struct inode_operations isofs_dir_inode_operations;
 extern const struct file_operations isofs_dir_operations;
 extern const struct address_space_operations isofs_symlink_aops;

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
