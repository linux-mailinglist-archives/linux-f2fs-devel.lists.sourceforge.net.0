Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOZ9CX1T/GlnOQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 07 May 2026 10:55:25 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B07CB4E5478
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 07 May 2026 10:55:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hA8efJ+eOjRMla29m2dXQ9bv4Pk4FASyQ9n8PF/GMpM=; b=U0BzMHK+WUg47535Nx9jr7Z4yH
	HW1Gn+O9Ekmo8ORMx6HpDCJHti7T19EgK8c7iKrIVi2FExleYpHjxsTAUY2NhqqQITeYvpNLeUZuG
	0GrMUaug33e3U4Z1jC/+o9BOoMEprhNGLUHv/p8kwVuz5z6JBxrXjtfm5bHAf4QXiBzY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wKuVv-0005gh-1h;
	Thu, 07 May 2026 08:55:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1wKuVt-0005gY-Q5
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 May 2026 08:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TRxThEE0rG0zIff4S1AEBrksd0ChfZDwcTBwyktROYQ=; b=IdMCUzDK/UAoS6OdLjvOq3x2VV
 e38VYmss/WdsxVHeeraUMvlHNmCylbQhTls4vH0invoU8F6i1VVz9x6AYZelbz+/XzhYGVHx+cmtx
 hkyuVc9L+gqhxi1MVxdYuvZf/kutm/gLtLc52urRLg30/lNpbIBLvoCuYgGa+F/oVGqY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TRxThEE0rG0zIff4S1AEBrksd0ChfZDwcTBwyktROYQ=; b=Fv5Sv1S/9GUUmQv8rocxDgT3E5
 zrmir2hDTkluv8ELf+iyBcfjZIb52ctyAQroc5329nE9FZgXIFWm7geV4Fk3draksuV6pyt6sxSSt
 Fen5Q76GJhbTmfpJrYqCp1Sl3jbn+sAIfHXlW4IOIbeLtroTezBgkxq3uqKZ7UmrB7Ks=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wKuVs-0002Gc-6C for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 May 2026 08:55:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DE24D43A4F;
 Thu,  7 May 2026 08:55:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A08C2BCC4;
 Thu,  7 May 2026 08:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778144114;
 bh=qee/kCsMg8C4eRFPxmiZaknm+clMPDWXLjgwoKgpYx8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=vHelsEcj24pQruLyPkpHtNvcTqrgcxdW5XrAWAHws6zFy8dlmD3lhphWbo6rNoHKL
 pxyKS1lhXpPJY63Pd8/e3qqMQ0aJSwahOYJ5VgRlEX5x9Co+/NVq47XMe389xvO4To
 ef2DV1LLfLHw+byjCIfpNwL7N6t8NwMfqmlrEbLB94MK8/QVfBUlOsnE2pmfqZqs6C
 AgaxUYFWWzGLZHC20yFP04gqVXcotfKbRyjiSlnWoYWl524oYM7+a7jPCdrnHSPMmN
 RuMcRAMn9+ju2vxK9JkVEjzjq+73rGNPmKsZkgkus6BIYXF58eDMi19sSaGrOG8HsF
 snrkCWaSAvDxw==
Date: Thu, 07 May 2026 04:53:08 -0400
MIME-Version: 1.0
Message-Id: <20260507-case-sensitivity-v14-15-e62cc8200435@oracle.com>
References: <20260507-case-sensitivity-v14-0-e62cc8200435@oracle.com>
In-Reply-To: <20260507-case-sensitivity-v14-0-e62cc8200435@oracle.com>
To: Al Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2812;
 i=chuck.lever@oracle.com; h=from:subject:message-id;
 bh=3j19l6mVyr/XReBrhpdSBMPAL80WouHe9sT+TihiyQM=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBp/FL2hcwnjdqaNi/5q9kxt3YlM3d3QqSqstzKs
 8W45Omd9QCJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCafxS9gAKCRAzarMzb2Z/
 l52vD/9oAzBTyM4xiFJ5QM41gLgiHj7PUdc2Q3lbIQ/lVfup4pis2Im+cGTpEumnlnsanTB+zf2
 FvmRrt8XkGFC32KiHFduHpw9zBL3jUOmcNiQtT+Bqs7MlCQ6DYk3z9T6CNo+QCfCxhtQIrXwJpH
 b8i/mvekEn8IjtcWAXENLEFsjSiZx9E3HCsGhQgNfoRAyD3dE8+4XkNwDzee2Dc5eKM3v5QFSqU
 RnV+cDOufTwJcVeblHkNhsgNCOB0ROntWVU9H8zQFUM2hyZlG+QT0ymaZT5Q7NQkJ6cLbhIbS+S
 l5FdnBjx3AUYQvQ2KPUSBC4kHru8d4OYlvjNi1D+jJhl27RB628LDCQLJrFTeFkAyoRnbmEIG9S
 6AfCHIJ8Sdjp2kd4eCPbjbBj8l1X5wf8oAOXwLv72MaN0Y3H1eMi4jkgnhpEvzGsXKSDVEJbjXu
 HRICff28yGMX1lc9goVmC4Cs2pdp2KV6Sfjoy4kSYmJzTsSfUG1S5DTdu72bHl637v4GP5RgJfO
 f2NplDdE1Y8eNR0Qgm6WRdJsYAKksiNbK9dw0cmpJm/P5cowWFNYpLvd8yDIRKSvO+dyuQidfSp
 xuQul1Sgfz6933XPhNxs5EtyeDs8YsRhH4UzKDUFSOIIXnktBJpP78JrP5mKqcHv+7YEuDmr0p4
 ehpAkeTd/qm4/gw==
X-Developer-Key: i=chuck.lever@oracle.com; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chuck Lever <chuck.lever@oracle.com>
 FS_ATTRIBUTE_INFORMATION
 responses have always reported FILE_CASE_SENSITIVE_SEARCH and
 FILE_CASE_PRESERVED_NAMES
 unconditionally. Case-insensitive filesystems like exFAT, and casefolded
 directories on [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wKuVs-0002Gc-6C
Subject: [f2fs-dev] [PATCH v14 15/15] ksmbd: Report filesystem case
 sensitivity via FS_ATTRIBUTE_INFORMATION
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
X-Rspamd-Queue-Id: B07CB4E5478
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

FS_ATTRIBUTE_INFORMATION responses have always reported
FILE_CASE_SENSITIVE_SEARCH and FILE_CASE_PRESERVED_NAMES
unconditionally. Case-insensitive filesystems like exFAT, and
casefolded directories on ext4 or f2fs, have no way to signal
their actual semantics to SMB clients.

Now that filesystems expose case behavior through ->fileattr_get,
query it via vfs_fileattr_get() and translate the FS_XFLAG_CASEFOLD
and FS_XFLAG_CASENONPRESERVING flags into the corresponding SMB
attributes. Filesystems without ->fileattr_get continue reporting
default POSIX behavior (case-sensitive, case-preserving).

SMB's FS_ATTRIBUTE_INFORMATION reports per-share attributes from
the share root, not per-file. Shares mixing casefold and
non-casefold directories report the root directory's behavior.

Acked-by: Namjae Jeon <linkinjeon@kernel.org>
Reviewed-by: Roland Mainz <roland.mainz@nrubsig.org>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/smb/server/smb2pdu.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index ee32e61b6d3c..cf0bc453a036 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -14,6 +14,7 @@
 #include <linux/falloc.h>
 #include <linux/mount.h>
 #include <linux/filelock.h>
+#include <linux/fileattr.h>
 
 #include "glob.h"
 #include "smbfsctl.h"
@@ -5541,16 +5542,33 @@ static int smb2_get_info_filesystem(struct ksmbd_work *work,
 	case FS_ATTRIBUTE_INFORMATION:
 	{
 		FILE_SYSTEM_ATTRIBUTE_INFO *info;
+		struct file_kattr fa = {};
 		size_t sz;
+		u32 attrs;
+		int err;
 
 		info = (FILE_SYSTEM_ATTRIBUTE_INFO *)rsp->Buffer;
-		info->Attributes = cpu_to_le32(FILE_SUPPORTS_OBJECT_IDS |
-					       FILE_PERSISTENT_ACLS |
-					       FILE_UNICODE_ON_DISK |
-					       FILE_CASE_PRESERVED_NAMES |
-					       FILE_CASE_SENSITIVE_SEARCH |
-					       FILE_SUPPORTS_BLOCK_REFCOUNTING);
+		attrs = FILE_SUPPORTS_OBJECT_IDS |
+			FILE_PERSISTENT_ACLS |
+			FILE_UNICODE_ON_DISK |
+			FILE_SUPPORTS_BLOCK_REFCOUNTING;
 
+		err = vfs_fileattr_get(path.dentry, &fa);
+		/*
+		 * -EINVAL, -EOPNOTSUPP: ntfs-3g and other FUSE
+		 * filesystems that lack FS_IOC_FSGETXATTR support.
+		 */
+		if (err && err != -ENOIOCTLCMD && err != -ENOTTY &&
+		    err != -EINVAL && err != -EOPNOTSUPP) {
+			path_put(&path);
+			return err;
+		}
+		if (!(fa.fsx_xflags & FS_XFLAG_CASEFOLD))
+			attrs |= FILE_CASE_SENSITIVE_SEARCH;
+		if (!(fa.fsx_xflags & FS_XFLAG_CASENONPRESERVING))
+			attrs |= FILE_CASE_PRESERVED_NAMES;
+
+		info->Attributes = cpu_to_le32(attrs);
 		info->Attributes |= cpu_to_le32(server_conf.share_fake_fscaps);
 
 		if (test_share_config_flag(work->tcon->share_conf,

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
