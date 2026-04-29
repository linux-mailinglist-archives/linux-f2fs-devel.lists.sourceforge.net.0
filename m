Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFb0BQ9J8mnNpQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Apr 2026 20:08:15 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A91F4498A62
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Apr 2026 20:08:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=akFMrpexHcTqF8OsTWX6BFYSGo8AJ082RsJlIOq8T+0=; b=SZ10QlcIao04EEZqDyUK5B9Azi
	urV1JmEnU0IrniV0lVglUcWsbsOCRmtrpLCkwOSH1PV7Wye0iUwYfXROGXvdBtgoCk5Cz5iuDwaZv
	f3C1OkUCb5YyX/Sds06uzJuE5hfYUZ4WYS97ufdMoXFAdroZUd9lbd9Zo9y1axGxDgpw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wI9KX-00085s-7r;
	Wed, 29 Apr 2026 18:08:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1wI9KW-00085j-Ei
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Apr 2026 18:08:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2AEP9O5C+wGD/VzCN2MxMtSMJFoCS+lNtDu8JCkn63I=; b=JuzM6j9F4oK75zrdiU6167Mugu
 QM2TyUp6LHJR9HsJj4upElDobJbNVIXl2ppJ113d8vCkUS4ZdgpeIghrl8/uYDStAxoFZ8v6H8lv8
 9ftHgMV1zi/LoRTIPJGh4iQ4Cu/Z1fCMnEOn8UqD3yRET1/R6mIsxXHzSunhB+P40LMc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2AEP9O5C+wGD/VzCN2MxMtSMJFoCS+lNtDu8JCkn63I=; b=PTZ0UH/4Ug+jm4MoIEveIDawQD
 ZyB0JbB0/hXoaKZLUwfrzxLcclNJZ6zQaNndg16mbQjKnEauXGwu3oZ0lqXQBtcI5+NEgou7EcYVJ
 weowct5UVzJfu2mlsgZehtF07qvfI2BXpOTzytFMRmn/J1Dke79cYoI+234HTIXZqvJQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wI9KV-000178-IL for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Apr 2026 18:08:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D45296015B;
 Wed, 29 Apr 2026 18:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5290BC19425;
 Wed, 29 Apr 2026 18:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777486080;
 bh=3ibEXRs6ZqvvbnwWfb9g39rNFPAvDiuuC7ysYxFiMFU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=avPaysqoEqIPCzZCnl6ij89BiLHf1e+VaFwQMtv3iz7PwPXJ2F7caCqxbNmIItpZC
 NyUkMf0z0v/JKnu3IgN8M0X4bSaMoZmJHHd4RgVROqOKVWOXXUgqT44nGGU9MymVyR
 MzU7hfeha6I8cvsS8F4wx1n2QwEJeJ8+Xi1EP0q6KY1v2Fl5IVqge69y9c+gFCn8uz
 bkg/AhDwaHsCeNwZo0xzVFwcMkHqMrXuqzv81td6fPM0ZeQwiuwZpr+N0bmWmTYlfJ
 4JOSZap4WyeGApeDeTWUBn+AytkjWPPqiVTlmPCMu8w9lQ4UYsjB9tmTGkYhXCCo1v
 JECjOCsojZl3w==
Date: Wed, 29 Apr 2026 14:07:24 -0400
MIME-Version: 1.0
Message-Id: <20260429-case-sensitivity-v12-13-8057123bebe0@oracle.com>
References: <20260429-case-sensitivity-v12-0-8057123bebe0@oracle.com>
In-Reply-To: <20260429-case-sensitivity-v12-0-8057123bebe0@oracle.com>
To: Al Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6586;
 i=chuck.lever@oracle.com; h=from:subject:message-id;
 bh=IpXstYLd1S+g4AYnnCs2sKNY6pmlFdt467tqNXA8Pt4=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBp8kjdByccVEcEEBgQ8M2KviDpwfaOt8WgIOkww
 rIDrOpjY0aJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCafJI3QAKCRAzarMzb2Z/
 l7ddD/98CaYLuxipMbpe2ovAbP1yoj4kQpytu6hqH+62Yz7nNilpadWnIi4+mfXdyzFaEdt5p2S
 Itv/hOQLIgiX6VegXIUonQ3NlXL4JyNnnGKgAuixXFDE+cW76qHTXQQKeQnu+LpFSvGYr1IWxhS
 hnyaIW/lhxhmXoU5df/F/tR8dTFV1JLUqDBxMriUTBuNhXu+bx7Xi7b6QUeCaKL/4WPlFiujTEq
 plNyVFIk2dMEmBNf0H07QLO6XTzVvspi2wcwf5iXpvaH7pie0QuRH3BFTQ4MlqEEBJuuuIdg9hP
 X9TaWGkmIh2mNY1OQ9qCZX9rexnANVFCO469cm7fYVu3DRNONsrcsgqD1rzo0OhUzz55WT9ldIT
 nT0b/ConxQGMhscbm1pCJgv/IiNnZgE57Ygns3ajQwre1UUW1X0tfbMz34VkoxqZMN7CnWp2f+o
 UM0XOmHJm8Qs8Va99zevK/KYTwvG5x0ngTGAfsLdV5W4xEL4UQ0E3/JSyg0bK4rkqRqK40WtZO5
 D7O9jiAcKSnJ0AOmwZzM4U6BUGdEfO2hNTbli9ZU+sSWpOzS9A6I+ysEFiPN6pNWNCFbSr58F3k
 ZyeM5hx9Scq7EkJa/HLs8JXOugEVrbNPNjeYfkupNtXGjz3HwHkKVIl3ZzPv0VcNRpbHGYKUwzg
 JTEtS+s5vy2AR4A==
X-Developer-Key: i=chuck.lever@oracle.com; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Chuck Lever <chuck.lever@oracle.com> The hard-coded
 MSDOS_SUPER_MAGIC check in nfsd3_proc_pathconf() only recognizes FAT
 filesystems
 as case-insensitive. Modern filesystems like F2FS, exFAT, and CIFS support
 case-insensitive directories, [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wI9KV-000178-IL
Subject: [f2fs-dev] [PATCH v12 13/15] nfsd: Report export case-folding via
 NFSv3 PATHCONF
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
X-Rspamd-Queue-Id: A91F4498A62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:pc@manguebit.org,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:roland.mainz@nrubsig.org,m:almaz.alexandrovich@paragon-software.com,m:adilger.kernel@dilger.ca,m:linux-cifs@vger.kernel.org,m:sfrench@samba.org,m:slava@dubeyko.com,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:sprasad@microsoft.com,m:frank.li@vivo.com,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:jaegeuk@kernel.org,m:hirofumi@mail.parknet.co.jp,m:linux-nfs@vger.kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:senozhatsky@chromium.org,m:chuck.lever@oracle.com,m:hansg@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[manguebit.org,sony.com,kernel.org,nrubsig.org,paragon-software.com,dilger.ca,vger.kernel.org,samba.org,dubeyko.com,microsoft.com,vivo.com,gmail.com,physik.fu-berlin.de,mail.parknet.co.jp,mit.edu,lists.sourceforge.net,chromium.org,oracle.com,samsung.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.816];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nrubsig.org:email,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,oracle.com:mid,oracle.com:email]

From: Chuck Lever <chuck.lever@oracle.com>

The hard-coded MSDOS_SUPER_MAGIC check in nfsd3_proc_pathconf()
only recognizes FAT filesystems as case-insensitive. Modern
filesystems like F2FS, exFAT, and CIFS support case-insensitive
directories, but NFSv3 clients cannot discover this capability.

Query the export's actual case behavior through ->fileattr_get
instead. This allows NFSv3 clients to correctly handle case
sensitivity for any filesystem that implements the fileattr
interface. Filesystems without ->fileattr_get continue to report
the default POSIX behavior (case-sensitive, case-preserving).

This change depends on the earlier "fat: Implement fileattr_get
for case sensitivity" patch in this series, which ensures FAT
filesystems report their case behavior correctly via the
fileattr interface.

Reviewed-by: Roland Mainz <roland.mainz@nrubsig.org>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/nfsd/nfs3proc.c | 36 +++++++++++++++++++++------
 fs/nfsd/vfs.c      | 72 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 fs/nfsd/vfs.h      |  3 +++
 fs/nfsd/xdr3.h     |  4 +--
 4 files changed, 105 insertions(+), 10 deletions(-)

diff --git a/fs/nfsd/nfs3proc.c b/fs/nfsd/nfs3proc.c
index 42adc5461db0..62ebc65b8af2 100644
--- a/fs/nfsd/nfs3proc.c
+++ b/fs/nfsd/nfs3proc.c
@@ -710,23 +710,43 @@ nfsd3_proc_pathconf(struct svc_rqst *rqstp)
 	resp->p_name_max = 255;		/* at least */
 	resp->p_no_trunc = 0;
 	resp->p_chown_restricted = 1;
-	resp->p_case_insensitive = 0;
-	resp->p_case_preserving = 1;
+	resp->p_case_insensitive = false;
+	resp->p_case_preserving = true;
 
 	resp->status = fh_verify(rqstp, &argp->fh, 0, NFSD_MAY_NOP);
 
 	if (resp->status == nfs_ok) {
 		struct super_block *sb = argp->fh.fh_dentry->d_sb;
+		int err;
 
-		/* Note that we don't care for remote fs's here */
-		switch (sb->s_magic) {
-		case EXT2_SUPER_MAGIC:
+		if (sb->s_magic == EXT2_SUPER_MAGIC) {
 			resp->p_link_max = EXT2_LINK_MAX;
 			resp->p_name_max = EXT2_NAME_LEN;
+		}
+
+		err = nfsd_get_case_info(argp->fh.fh_dentry,
+					 &resp->p_case_insensitive,
+					 &resp->p_case_preserving);
+		/*  
+		 * RFC 1813 lists NFS3ERR_STALE, NFS3ERR_BADHANDLE, and
+		 * NFS3ERR_SERVERFAULT as the only PATHCONF errors.
+		 */
+		switch (err) {
+		case 0:
+		case -EOPNOTSUPP:
+			/* Both arms leave the output booleans valid. */
 			break;
-		case MSDOS_SUPER_MAGIC:
-			resp->p_case_insensitive = 1;
-			resp->p_case_preserving  = 0;
+		case -EACCES:
+		case -EPERM:
+			/*
+			 * Policy denied the query. Report STALE so the
+			 * handle is unusable without implying a server
+			 * malfunction.
+			 */
+			resp->status = nfserr_stale;
+			break;
+		default:
+			resp->status = nfserr_serverfault;
 			break;
 		}
 	}
diff --git a/fs/nfsd/vfs.c b/fs/nfsd/vfs.c
index eafdf7b7890f..4bd63d8efbf7 100644
--- a/fs/nfsd/vfs.c
+++ b/fs/nfsd/vfs.c
@@ -32,6 +32,7 @@
 #include <linux/writeback.h>
 #include <linux/security.h>
 #include <linux/sunrpc/xdr.h>
+#include <linux/fileattr.h>
 
 #include "xdr3.h"
 
@@ -2891,3 +2892,74 @@ nfsd_permission(struct svc_cred *cred, struct svc_export *exp,
 
 	return err? nfserrno(err) : 0;
 }
+
+/**
+ * nfsd_get_case_info - get case sensitivity info for a dentry
+ * @dentry: dentry to query
+ * @case_insensitive: set to true if the filesystem is case-insensitive
+ * @case_preserving: set to true if the filesystem preserves case
+ *
+ * On casefold-capable filesystems the flag lives on the directory,
+ * not on its entries, so for a non-directory @dentry the parent is
+ * queried instead. A directory (including an export root, whose
+ * parent lies outside the export) is queried as-is so its own
+ * contents' lookup behavior is reported.
+ *
+ * When the filesystem does not expose case-folding state (no
+ * ->fileattr_get, or the callback returns -EOPNOTSUPP /
+ * -ENOIOCTLCMD / -ENOTTY / -EINVAL), the outputs are filled with
+ * POSIX defaults (case-sensitive, case-preserving) on the premise
+ * that a filesystem with case-folding support wires up
+ * fileattr_get.
+ *
+ * Other errors propagate unmodified (-EACCES, -EPERM from LSM
+ * hooks; -EIO, -ESTALE, ... from the filesystem). Case-folding
+ * behavior is a property of the exported filesystem, not of the
+ * caller's credentials, so silently substituting defaults would
+ * let the same dentry report POSIX while LSM denies and report
+ * casefolding once LSM allows -- a client could race against
+ * silent name collisions on a case-insensitive export.
+ *
+ * Return: 0 with outputs filled, -EOPNOTSUPP with outputs filled
+ *         to POSIX defaults, or a negative errno with outputs
+ *         unmodified.
+ */
+int
+nfsd_get_case_info(struct dentry *dentry, bool *case_insensitive,
+		   bool *case_preserving)
+{
+	struct file_kattr fa = {};
+	struct dentry *cd;
+	bool put = false;
+	int err;
+
+	if (d_is_dir(dentry)) {
+		cd = dentry;
+	} else {
+		cd = dget_parent(dentry);
+		put = true;
+	}
+	err = vfs_fileattr_get(cd, &fa);
+	if (put)
+		dput(cd);
+	switch (err) {
+	case 0:
+		*case_insensitive = fa.fsx_xflags & FS_XFLAG_CASEFOLD;
+		*case_preserving =
+			!(fa.fsx_xflags & FS_XFLAG_CASENONPRESERVING);
+		return 0;
+	case -EINVAL:
+	case -ENOTTY:
+	case -ENOIOCTLCMD:
+	case -EOPNOTSUPP:
+		/*
+		 * Filesystem does not expose case state.
+		 * Report POSIX defaults.
+		 */
+		*case_insensitive = false;
+		*case_preserving = true;
+		return -EOPNOTSUPP;
+	default:
+		return err;
+	}
+}
diff --git a/fs/nfsd/vfs.h b/fs/nfsd/vfs.h
index 702a844f2106..e09ea04a51b9 100644
--- a/fs/nfsd/vfs.h
+++ b/fs/nfsd/vfs.h
@@ -156,6 +156,9 @@ __be32		nfsd_readdir(struct svc_rqst *, struct svc_fh *,
 			     loff_t *, struct readdir_cd *, nfsd_filldir_t);
 __be32		nfsd_statfs(struct svc_rqst *, struct svc_fh *,
 				struct kstatfs *, int access);
+int		nfsd_get_case_info(struct dentry *dentry,
+				   bool *case_insensitive,
+				   bool *case_preserving);
 
 __be32		nfsd_permission(struct svc_cred *cred, struct svc_export *exp,
 				struct dentry *dentry, int acc);
diff --git a/fs/nfsd/xdr3.h b/fs/nfsd/xdr3.h
index 522067b7fd75..a7c9714b0b0e 100644
--- a/fs/nfsd/xdr3.h
+++ b/fs/nfsd/xdr3.h
@@ -209,8 +209,8 @@ struct nfsd3_pathconfres {
 	__u32			p_name_max;
 	__u32			p_no_trunc;
 	__u32			p_chown_restricted;
-	__u32			p_case_insensitive;
-	__u32			p_case_preserving;
+	bool			p_case_insensitive;
+	bool			p_case_preserving;
 };
 
 struct nfsd3_commitres {

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
