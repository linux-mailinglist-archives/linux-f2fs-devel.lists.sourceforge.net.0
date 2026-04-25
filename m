Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wErcCbQe7GmpUgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Apr 2026 03:53:56 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4393464874
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Apr 2026 03:53:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SpzSZHhw5a3tqGj71NHtSHjT6SQSIMByDTgQIcwjiNI=; b=OWifMDGK2peeosNw6KKPpEA6U7
	c0aZ0YS2aLFHCsAr3q+86aPVQ/47mRIGxHVqzJJuwBt4lyZeQZfg9wAhJqtc52EW9c+V6wkMaJLmW
	pd5Ciq4Viuwexba1KUlUbKhUJQpgjPPipLdlcQQh0/+09qtRezLeZ9e2rTUznhPVTkj8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wGSDR-0007K6-Kc;
	Sat, 25 Apr 2026 01:53:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1wGSDQ-0007Jn-4G
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 25 Apr 2026 01:53:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ciLWG6SbVL2BRXZiZC3HqhmcQhn00hDA6N5ATitwl0w=; b=lKLVv48KOjFxf8sBOFdfexdL/0
 5BvM/muLNyR5849IdNaJltsPBtdwpUxhVZLhDtjeov8r/O4DvRiM4a/D2VlNvuOcwOxW/wXCRulBl
 Bjo21GhWb56qpbi39bwYlJY4UkOFSDC/M0KCHaXlus2mgmlL+b9XD1ebFGLKUeEIL2Ng=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ciLWG6SbVL2BRXZiZC3HqhmcQhn00hDA6N5ATitwl0w=; b=BbPQCjhtxGlmNKIbxuHawRZPec
 +vob0LUQt3jrALi5yDJlgzhBIBDe5b95i6NQGhIpDAdAptBIU3XpUMQ5eCEWYmu916tWy9C9pItxO
 fFDdbLIYNHZTYFph33r7ldgXhIvDcp1itnr05ltN8w+PhWqxyeckxSyYjH+74xc4ULRU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wGSDQ-00031B-4I for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 25 Apr 2026 01:53:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 92B61407C3;
 Sat, 25 Apr 2026 01:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 236A6C2BCB2;
 Sat, 25 Apr 2026 01:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777082026;
 bh=iqVtUvA2aKvU7uqHLJI96q1iBGdaqv4WpR0C8NAdAPI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=K3MMBa7hmnticXooMQM21l1uNgwFutLxc2Gmx64Ztrd0t7AG/xfAVMFOIe8gPnwVy
 xxE1uv1wKye7AMSlbgkzOEsdB1D9prnltSBvN9dtuRePIObwvuQLepWL8OE+HpPpY7
 Ldl0BztwODviz4UVRKR/u379rCfy5R1IR1St7/B8SK4ve+OqUrDVif1g+gWe607tqE
 r0qgXJyE6Yk/vaQYNgRQFV5EF3/uDhq92Pfg9vxDkylK3hAdcaBdEeRSmtw+0opA5f
 x+3WM58uoL26xLv15ab+2CYJIe+BBmlXurIiRU88sZ/icDo5XZepYSm5kNAdlFDCG1
 sc2LT4S/abZ+Q==
Date: Fri, 24 Apr 2026 21:53:11 -0400
MIME-Version: 1.0
Message-Id: <20260424-case-sensitivity-v11-9-de5619beddaf@oracle.com>
References: <20260424-case-sensitivity-v11-0-de5619beddaf@oracle.com>
In-Reply-To: <20260424-case-sensitivity-v11-0-de5619beddaf@oracle.com>
To: Al Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4927;
 i=chuck.lever@oracle.com; h=from:subject:message-id;
 bh=whZ8I7ut1VTIHU0vKs6CtPNqzIY9szgQN51EcCcpO08=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBp7B6QSmpPLePycgQR+X9KRG/phCkNRX1KfUFc1
 t2neUXuimiJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCaewekAAKCRAzarMzb2Z/
 l+CDD/0a6m3um2MGo56wuLNvdlF3IKwxmf0b1QEHljHVtUdH3arHVqy+JkeGc3Nxf2PBQMG8QIw
 5uXHMcRUvy9gSRP4+2zu1xi1NglLNwtWcb23R2t1g9lswqc7SyqtUxeqnu31zZIVHSehQfadUiv
 Fe9Uvn+D7ZWcdcExqGvz50opYvX5ZVR17IB/tJ4Ydrxkhl+Yuna8x21PDvZAFL2mhwCyshAjp2G
 d0ARfQxgAoGqPC9pcmEVp1wAMMYj1tqIuAESPm+Ce4OP33bXkdSApOAv5PGTKBs3+YMKbAoNf22
 QyllvOgoNwkv/etZArfw6YIUdg8rwuue6WwqYgSwdRAde0saMEZ5dfmhv8O25yXytNsVH1XKjl1
 Rk6WLsSsihQCQQvpZy9r/W26+sjV7lfXVZuF99u3mKv+Y3nrFsjDGuMux9m+sHg/lxu9oOwMJ3q
 fYobeFNxxEvWNppCrm85eOoPMgCVIQ3SAc9M5l4SFDhc+kn42V3ublxxQJqJ+1Y5PnXepT+FOtr
 h3e5FIkISL/uYL3OU0YxtI2iG9BQrEWIgmSfMzAuB4nnTioRpfGH0deQQ5Wo9FGSRd1VQK8DcSm
 MPaeRjLYha8eqSmNt9IVm9+2/+Vn1bF5DdDv3+k+OMBtpuWqRh7c3DokNj9zkxeV9A4UuCrWCYP
 1Xvn5BVT6g8cEgg==
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
 manner. Report CIFS/SMB case handling behavior via FS_XFLAG_CASEFOLD and
 FS_XFLAG_CASENONPRESER [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wGSDQ-00031B-4I
Subject: [f2fs-dev] [PATCH v11 09/15] cifs: Implement fileattr_get for case
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
 linux-ext4@vger.kernel.org, linkinjeon@kernel.org,
 Steve French <stfrench@microsoft.com>, sprasad@microsoft.com,
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
X-Rspamd-Queue-Id: B4393464874
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
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:pc@manguebit.org,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:roland.mainz@nrubsig.org,m:almaz.alexandrovich@paragon-software.com,m:adilger.kernel@dilger.ca,m:linux-cifs@vger.kernel.org,m:sfrench@samba.org,m:slava@dubeyko.com,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:stfrench@microsoft.com,m:sprasad@microsoft.com,m:frank.li@vivo.com,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:jaegeuk@kernel.org,m:hirofumi@mail.parknet.co.jp,m:linux-nfs@vger.kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:senozhatsky@chromium.org,m:chuck.lever@oracle.com,m:hansg@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[manguebit.org,sony.com,kernel.org,nrubsig.org,paragon-software.com,dilger.ca,vger.kernel.org,samba.org,dubeyko.com,microsoft.com,vivo.com,gmail.com,physik.fu-berlin.de,mail.parknet.co.jp,mit.edu,lists.sourceforge.net,chromium.org,oracle.com,samsung.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
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
	HAS_REPLYTO(0.00)[cel@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:mid,oracle.com:email,nrubsig.org:email]

From: Chuck Lever <chuck.lever@oracle.com>

Upper layers such as NFSD need a way to query whether a filesystem
handles filenames in a case-sensitive manner. Report CIFS/SMB case
handling behavior via FS_XFLAG_CASEFOLD and
FS_XFLAG_CASENONPRESERVING.

The authoritative source is the server itself: at mount time CIFS
issues QueryFSInfo(FS_ATTRIBUTE_INFORMATION) and caches the reply
on the tcon. That reply carries FILE_CASE_SENSITIVE_SEARCH and
FILE_CASE_PRESERVED_NAMES, which reflect whatever case handling
the share actually implements after SMB3.1.1 POSIX extensions
negotiation. Translating those two bits into the VFS flags lets
cifs_fileattr_get report what the server advertises rather than
what the client was asked to pretend.

QueryFSInfo is best-effort; the mount completes even if the server
does not answer. MaxPathNameComponentLength is zero in that case
and is used as the "no reply received" sentinel. When no reply is
available, fall back to the nocase mount option so that the reported
behavior agrees with the dentry comparison operations installed on
the superblock.

The callback is registered in all three inode_operations structures
(directory, file, and symlink) to ensure consistent reporting across
all inode types.

Registering fileattr_get routes FS_IOC_GETFLAGS through
vfs_fileattr_get() and short-circuits the syscall's fallback to
cifs_ioctl(). That fallback invoked CIFSGetExtAttr() under
CONFIG_CIFS_POSIX and CONFIG_CIFS_ALLOW_INSECURE_LEGACY on servers
advertising CIFS_UNIX_EXTATTR_CAP, surfacing the SMB1 Unix-extension
immutable, append, and nodump bits. cifs_fileattr_get carries over
only FS_COMPR_FL from cached cifsAttrs; the SMB1 extattr fetch is
not reproduced. SMB1 is deprecated, and acquiring a netfid from
within a dentry-only callback is not worth preserving a path tied
to an insecure legacy dialect.

Acked-by: Steve French <stfrench@microsoft.com>
Reviewed-by: Roland Mainz <roland.mainz@nrubsig.org>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/smb/client/cifsfs.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
index 2025739f070a..d71755b59b5b 100644
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
@@ -1199,6 +1200,44 @@ struct file_system_type smb3_fs_type = {
 MODULE_ALIAS_FS("smb3");
 MODULE_ALIAS("smb3");
 
+static int cifs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
+{
+	struct cifs_sb_info *cifs_sb = CIFS_SB(dentry->d_sb);
+	struct cifs_tcon *tcon = cifs_sb_master_tcon(cifs_sb);
+	u32 attrs = le32_to_cpu(tcon->fsAttrInfo.Attributes);
+
+	/* Preserve FS_COMPR_FL previously reported by cifs_ioctl(). */
+	if (CIFS_I(d_inode(dentry))->cifsAttrs & ATTR_COMPRESSED)
+		fa->flags |= FS_COMPR_FL;
+
+	/*
+	 * The server's FS_ATTRIBUTE_INFORMATION response, cached on
+	 * the tcon at mount, reflects the share's case-handling
+	 * semantics after any POSIX extensions negotiation. Prefer
+	 * it over the client-local nocase mount option, which only
+	 * governs dentry comparison on this superblock.
+	 *
+	 * QueryFSInfo is best-effort at mount; when it did not
+	 * populate fsAttrInfo, MaxPathNameComponentLength remains
+	 * zero. In that case fall back to nocase so the reporting
+	 * matches the comparison behavior installed on the sb.
+	 */
+	if (le32_to_cpu(tcon->fsAttrInfo.MaxPathNameComponentLength) == 0) {
+		if (tcon->nocase) {
+			fa->fsx_xflags |= FS_XFLAG_CASEFOLD;
+			fa->flags |= FS_CASEFOLD_FL;
+		}
+		return 0;
+	}
+	if (!(attrs & FILE_CASE_SENSITIVE_SEARCH)) {
+		fa->fsx_xflags |= FS_XFLAG_CASEFOLD;
+		fa->flags |= FS_CASEFOLD_FL;
+	}
+	if (!(attrs & FILE_CASE_PRESERVED_NAMES))
+		fa->fsx_xflags |= FS_XFLAG_CASENONPRESERVING;
+	return 0;
+}
+
 const struct inode_operations cifs_dir_inode_ops = {
 	.create = cifs_create,
 	.atomic_open = cifs_atomic_open,
@@ -1217,6 +1256,7 @@ const struct inode_operations cifs_dir_inode_ops = {
 	.listxattr = cifs_listxattr,
 	.get_acl = cifs_get_acl,
 	.set_acl = cifs_set_acl,
+	.fileattr_get = cifs_fileattr_get,
 };
 
 const struct inode_operations cifs_file_inode_ops = {
@@ -1227,6 +1267,7 @@ const struct inode_operations cifs_file_inode_ops = {
 	.fiemap = cifs_fiemap,
 	.get_acl = cifs_get_acl,
 	.set_acl = cifs_set_acl,
+	.fileattr_get = cifs_fileattr_get,
 };
 
 const char *cifs_get_link(struct dentry *dentry, struct inode *inode,
@@ -1261,6 +1302,7 @@ const struct inode_operations cifs_symlink_inode_ops = {
 	.setattr = cifs_setattr,
 	.permission = cifs_permission,
 	.listxattr = cifs_listxattr,
+	.fileattr_get = cifs_fileattr_get,
 };
 
 /*

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
