Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMY4HeQa6mlSuQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Apr 2026 15:13:08 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1867D45292C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Apr 2026 15:13:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcNgMwnYeCoxAEW7xmpj4NMVswFoSP4ABSFxdnwkeWI=; b=XhhlbSPwr/GHy3ztiBYPwh2wdP
	Ad9XL6ZtN78HJnjC+c6CSNS5EvBJlRJK7hzxrlls9iPFfqemrjpMa3umhMvTA6Fs6ch3ouNaSPvBm
	0kGMFesJDQw6dRpzknGGT9kPApsxM1pKsP6ASXq48ZdcFIrsKwVdEgeq9NnrwJzjS9NE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wFtrd-0005Lw-PN;
	Thu, 23 Apr 2026 13:13:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1wFtrc-0005Lo-9W
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Apr 2026 13:13:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xKJzrKzqRmkHaGrud65nfTi1qYevaKV+m8EHxQk1ay8=; b=k+nYwHzf6fyiy7GqgVEuktUE1O
 vck6ROJNOb0zFcgC6SwC4nU0QCtTVRnm2ITSVct+skcAbVLtDT3xpxRlbY1cKFS2rK03FfD3RkkUB
 GvJPSA9y0935a2RIWMQejzTXhfk80yV8isXgb65UmNxfNG1BpeljIG+6eIpjpZ16MHb8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xKJzrKzqRmkHaGrud65nfTi1qYevaKV+m8EHxQk1ay8=; b=VW8lsIO+Epv0o1G+G/L/vH5RYS
 M/k31ulJUbBjI/9NdMuvBqxTyKkRwvpSLRejy1WrN5zQp+PuxepyH0ZOM41HVwIl6/xpm0g7qxQd/
 NMuXAPJ699xn/Q0E/RsFXaDgqvzHyU/6adn34Wpo+ZTo01UJ5OlACH6MuTQtQswrAbhY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wFtrY-0006pe-0k for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Apr 2026 13:13:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A819340063;
 Thu, 23 Apr 2026 13:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687EAC2BCB5;
 Thu, 23 Apr 2026 13:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776949969;
 bh=CBw6HJjihKt4szx3STHKU8UW82Ri/ir43Jvjht8LLFE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=OS2jnHocPEm3AfaQ2tQzKl16QJBonggIjfsctDDjb/9vsPMd5h2w+NDAvAlC01hBT
 obwyWp/72dD/Hdy5Nvyx7ebmiPOZnJhSSHt3riPQ48u1bJV6D6q99L+TG6BRssEnhK
 t9IdR5ht+K5Dm+KwSiq7IkZoQAxqsnD82TGMAL/W9se3zRBkSbvIcKGka80MaQlM2b
 glENMEKmc42CbaQQoOhS0E/8T/20stIZ6zKRY4J6zcd9G4RZhIB2moPH8y25/gRoSe
 qJHpQX1eR30+vtEDzXwWSxbjBlrzhoJvZ2vNQxtPhSiE3kWb7+PCqcMqgT1uuS96Kj
 sbtN04n48VPIQ==
Date: Thu, 23 Apr 2026 09:12:14 -0400
MIME-Version: 1.0
Message-Id: <20260423-case-sensitivity-v10-11-c385d674a6cf@oracle.com>
References: <20260423-case-sensitivity-v10-0-c385d674a6cf@oracle.com>
In-Reply-To: <20260423-case-sensitivity-v10-0-c385d674a6cf@oracle.com>
To: Al Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=10268;
 i=chuck.lever@oracle.com; h=from:subject:message-id;
 bh=sZZw+YCsjF4PsIWcIBUtG3seiYJnlhRbGqwWgLDQ1vI=;
 b=owEBbQKS/ZANAwAKATNqszNvZn+XAcsmYgBp6hq0au5oZDiaeJMTBdlYTbavVckNcLhHefE5N
 MrtpZG32cOJAjMEAAEKAB0WIQQosuWwEobfJDzyPv4zarMzb2Z/lwUCaeoatAAKCRAzarMzb2Z/
 l4l1D/4ni23JDJMV2Q9NHrfN0S100LgjzfTLIDGrblIT72n4CEt6jZzohAa3W1So/L2oB+U8Sqf
 bKThWRZMR+H7LqbmsGj2vneV+r8ipLV2F4evqW/hRCCdvtdzljvhOFVCCQKigxKBhUg+AXFF8g6
 a013LH9FcP4BWf2t0DRFkDxVwPWN5K4TRwSj+SzqTHY2n+DULUVG0HUPmB1S8kvpRXFwj93whgk
 MJWYRC3uNlYRO4yNv8HVo8ja8KyMnISxLPg+K8oxZeUl2rL79Z0txxKJDuSic5xvc37wktlIZ2o
 XK+7oB1xN+AhT3ZpRqi0QkB69OxZVKXQum4QHXPPDLTTOxX5kgD2PCZGN1i0ZFQofDqdcfd9fqZ
 rcG5g+CLgdILeZJKaLzJ3Yq704Bi+xCQRg/5q9eXPM7Q0jwREq3o1TvLOfxs8Hdv23Ekp+7uxQt
 /zQ0q5HmavJnQ06xdXuEc/Q0tR1d2Dt0fWRBzVwSQmrVVZPsNbhU7BtfaniwRqoPNmPR2sa+Wf/
 CNmD4Dq2HjThS3IPRP13Q9xq8Vqcw4Zxzapj3vUKrjGxbsekRcEkmDlgsR7dNPzI/tiG6TflDvF
 LM0hOv6aOCOJ2rbcnYZIVUTz/4lhUFcoWTIAasqF5ramfQejWH87qjwGVbS/Zta2s058qpAEQwq
 O/Qnll7vf5Ijtsg==
X-Developer-Key: i=chuck.lever@oracle.com; a=openpgp;
 fpr=28B2E5B01286DF243CF23EFE336AB3336F667F97
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chuck Lever <chuck.lever@oracle.com> An NFS server
 re-exporting
 an NFS mount point needs to report the case sensitivity behavior of the
 underlying
 filesystem to its clients. Without this, re-export servers cannot accurately
 convey case h [...] 
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
X-Headers-End: 1wFtrY-0006pe-0k
Subject: [f2fs-dev] [PATCH v10 11/17] nfs: Implement fileattr_get for case
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
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
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,oracle.com:mid,oracle.com:email]
X-Rspamd-Queue-Id: 1867D45292C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Chuck Lever <chuck.lever@oracle.com>

An NFS server re-exporting an NFS mount point needs to report
the case sensitivity behavior of the underlying filesystem to its
clients. Without this, re-export servers cannot accurately convey
case handling semantics, potentially causing client applications to
make incorrect assumptions about filename collisions and lookups.

The NFS client already retrieves case sensitivity information
from servers during mount via PATHCONF (NFSv3) or the
FATTR4_CASE_INSENSITIVE/FATTR4_CASE_PRESERVING attributes
(NFSv4). Expose this information through fileattr_get by
reporting the FS_XFLAG_CASEFOLD and FS_XFLAG_CASENONPRESERVING
flags. NFSv2 lacks PATHCONF support, so mounts using that protocol
version default to standard POSIX behavior: case-sensitive and
case-preserving.

PATHCONF is now invoked unconditionally for NFSv2 and NFSv3 mounts
so the case-sensitivity capabilities are established even when
the user pins server->namelen with the namlen= mount option. That
option is orthogonal to case handling, and skipping PATHCONF
because namelen was already known would leave the caps unset.

The two capability bits carry opposite polarity
because their POSIX defaults differ. Most servers are
case-sensitive and case-preserving, matching "neither
xflag set." NFS_CAP_CASE_INSENSITIVE is set only when the
server affirms case insensitivity, so "server said no" and
"server did not answer" both collapse to the case-sensitive
default. NFS_CAP_CASE_NONPRESERVING follows the same pattern in
the opposite direction: set only when the server affirms that it
does not preserve case, so that silence or a missing attribute
lands on the case-preserving default. The NFSv4 probe checks
res.attr_bitmask[0] to distinguish "server said false" from "server
omitted the attribute" before setting the bit.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/nfs/client.c           | 15 ++++++++++-----
 fs/nfs/inode.c            | 21 +++++++++++++++++++++
 fs/nfs/internal.h         |  3 +++
 fs/nfs/nfs3proc.c         |  2 ++
 fs/nfs/nfs3xdr.c          |  7 +++++--
 fs/nfs/nfs4proc.c         |  7 +++++--
 fs/nfs/proc.c             |  3 +++
 fs/nfs/symlink.c          |  3 +++
 include/linux/nfs_fs_sb.h |  2 +-
 include/linux/nfs_xdr.h   |  2 ++
 10 files changed, 55 insertions(+), 10 deletions(-)

diff --git a/fs/nfs/client.c b/fs/nfs/client.c
index be02bb227741..5f351988e1fe 100644
--- a/fs/nfs/client.c
+++ b/fs/nfs/client.c
@@ -933,15 +933,20 @@ static int nfs_probe_fsinfo(struct nfs_server *server, struct nfs_fh *mntfh, str
 
 	nfs_server_set_fsinfo(server, &fsinfo);
 
-	/* Get some general file system info */
-	if (server->namelen == 0) {
-		struct nfs_pathconf pathinfo;
+	{
+		struct nfs_pathconf pathinfo = { };
 
 		pathinfo.fattr = fattr;
 		nfs_fattr_init(fattr);
 
-		if (clp->rpc_ops->pathconf(server, mntfh, &pathinfo) >= 0)
-			server->namelen = pathinfo.max_namelen;
+		if (clp->rpc_ops->pathconf(server, mntfh, &pathinfo) >= 0) {
+			if (server->namelen == 0)
+				server->namelen = pathinfo.max_namelen;
+			if (pathinfo.case_insensitive)
+				server->caps |= NFS_CAP_CASE_INSENSITIVE;
+			if (!pathinfo.case_preserving)
+				server->caps |= NFS_CAP_CASE_NONPRESERVING;
+		}
 	}
 
 	if (clp->rpc_ops->discover_trunking != NULL &&
diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
index 98a8f0de1199..209929e54253 100644
--- a/fs/nfs/inode.c
+++ b/fs/nfs/inode.c
@@ -41,6 +41,7 @@
 #include <linux/freezer.h>
 #include <linux/uaccess.h>
 #include <linux/iversion.h>
+#include <linux/fileattr.h>
 
 #include "nfs4_fs.h"
 #include "callback.h"
@@ -1101,6 +1102,26 @@ int nfs_getattr(struct mnt_idmap *idmap, const struct path *path,
 }
 EXPORT_SYMBOL_GPL(nfs_getattr);
 
+int nfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
+{
+	struct inode *inode = d_inode(dentry);
+
+	/*
+	 * Case handling is a property of the exported filesystem on the
+	 * NFS server, reported to the client at mount via PATHCONF
+	 * (NFSv3) or FATTR4_CASE_INSENSITIVE / FATTR4_CASE_PRESERVING
+	 * (NFSv4). Unlike filesystems that always preserve case, an NFS
+	 * mount may front a backend that does not, so both flags can
+	 * appear.
+	 */
+	if (nfs_server_capable(inode, NFS_CAP_CASE_INSENSITIVE))
+		fa->fsx_xflags |= FS_XFLAG_CASEFOLD;
+	if (nfs_server_capable(inode, NFS_CAP_CASE_NONPRESERVING))
+		fa->fsx_xflags |= FS_XFLAG_CASENONPRESERVING;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nfs_fileattr_get);
+
 static void nfs_init_lock_context(struct nfs_lock_context *l_ctx)
 {
 	refcount_set(&l_ctx->count, 1);
diff --git a/fs/nfs/internal.h b/fs/nfs/internal.h
index fc5456377160..309d3f679bb3 100644
--- a/fs/nfs/internal.h
+++ b/fs/nfs/internal.h
@@ -449,6 +449,9 @@ extern void nfs_set_cache_invalid(struct inode *inode, unsigned long flags);
 extern bool nfs_check_cache_invalid(struct inode *, unsigned long);
 extern int nfs_wait_bit_killable(struct wait_bit_key *key, int mode);
 
+struct file_kattr;
+int nfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa);
+
 #if IS_ENABLED(CONFIG_NFS_LOCALIO)
 /* localio.c */
 struct nfs_local_dio {
diff --git a/fs/nfs/nfs3proc.c b/fs/nfs/nfs3proc.c
index 95d7cd564b74..b80d0c5efc27 100644
--- a/fs/nfs/nfs3proc.c
+++ b/fs/nfs/nfs3proc.c
@@ -1053,6 +1053,7 @@ static const struct inode_operations nfs3_dir_inode_operations = {
 	.permission	= nfs_permission,
 	.getattr	= nfs_getattr,
 	.setattr	= nfs_setattr,
+	.fileattr_get	= nfs_fileattr_get,
 #ifdef CONFIG_NFS_V3_ACL
 	.listxattr	= nfs3_listxattr,
 	.get_inode_acl	= nfs3_get_acl,
@@ -1064,6 +1065,7 @@ static const struct inode_operations nfs3_file_inode_operations = {
 	.permission	= nfs_permission,
 	.getattr	= nfs_getattr,
 	.setattr	= nfs_setattr,
+	.fileattr_get	= nfs_fileattr_get,
 #ifdef CONFIG_NFS_V3_ACL
 	.listxattr	= nfs3_listxattr,
 	.get_inode_acl	= nfs3_get_acl,
diff --git a/fs/nfs/nfs3xdr.c b/fs/nfs/nfs3xdr.c
index e17d72908412..e745e78faab0 100644
--- a/fs/nfs/nfs3xdr.c
+++ b/fs/nfs/nfs3xdr.c
@@ -2276,8 +2276,11 @@ static int decode_pathconf3resok(struct xdr_stream *xdr,
 	if (unlikely(!p))
 		return -EIO;
 	result->max_link = be32_to_cpup(p++);
-	result->max_namelen = be32_to_cpup(p);
-	/* ignore remaining fields */
+	result->max_namelen = be32_to_cpup(p++);
+	p++;	/* ignore no_trunc */
+	p++;	/* ignore chown_restricted */
+	result->case_insensitive = be32_to_cpup(p++) != 0;
+	result->case_preserving = be32_to_cpup(p) != 0;
 	return 0;
 }
 
diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index d839a97df822..034e3e87e863 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -3944,8 +3944,9 @@ static int _nfs4_server_capabilities(struct nfs_server *server, struct nfs_fh *f
 			server->caps |= NFS_CAP_SYMLINKS;
 		if (res.case_insensitive)
 			server->caps |= NFS_CAP_CASE_INSENSITIVE;
-		if (res.case_preserving)
-			server->caps |= NFS_CAP_CASE_PRESERVING;
+		if ((res.attr_bitmask[0] & FATTR4_WORD0_CASE_PRESERVING) &&
+		    !res.case_preserving)
+			server->caps |= NFS_CAP_CASE_NONPRESERVING;
 #ifdef CONFIG_NFS_V4_SECURITY_LABEL
 		if (res.attr_bitmask[2] & FATTR4_WORD2_SECURITY_LABEL)
 			server->caps |= NFS_CAP_SECURITY_LABEL;
@@ -10598,6 +10599,7 @@ static const struct inode_operations nfs4_dir_inode_operations = {
 	.getattr	= nfs_getattr,
 	.setattr	= nfs_setattr,
 	.listxattr	= nfs4_listxattr,
+	.fileattr_get	= nfs_fileattr_get,
 };
 
 static const struct inode_operations nfs4_file_inode_operations = {
@@ -10605,6 +10607,7 @@ static const struct inode_operations nfs4_file_inode_operations = {
 	.getattr	= nfs_getattr,
 	.setattr	= nfs_setattr,
 	.listxattr	= nfs4_listxattr,
+	.fileattr_get	= nfs_fileattr_get,
 };
 
 static struct nfs_server *nfs4_clone_server(struct nfs_server *source,
diff --git a/fs/nfs/proc.c b/fs/nfs/proc.c
index 70795684b8e8..03c2c1f31be9 100644
--- a/fs/nfs/proc.c
+++ b/fs/nfs/proc.c
@@ -598,6 +598,7 @@ nfs_proc_pathconf(struct nfs_server *server, struct nfs_fh *fhandle,
 {
 	info->max_link = 0;
 	info->max_namelen = NFS2_MAXNAMLEN;
+	info->case_preserving = true;
 	return 0;
 }
 
@@ -718,12 +719,14 @@ static const struct inode_operations nfs_dir_inode_operations = {
 	.permission	= nfs_permission,
 	.getattr	= nfs_getattr,
 	.setattr	= nfs_setattr,
+	.fileattr_get	= nfs_fileattr_get,
 };
 
 static const struct inode_operations nfs_file_inode_operations = {
 	.permission	= nfs_permission,
 	.getattr	= nfs_getattr,
 	.setattr	= nfs_setattr,
+	.fileattr_get	= nfs_fileattr_get,
 };
 
 const struct nfs_rpc_ops nfs_v2_clientops = {
diff --git a/fs/nfs/symlink.c b/fs/nfs/symlink.c
index 58146e935402..74a072896f8d 100644
--- a/fs/nfs/symlink.c
+++ b/fs/nfs/symlink.c
@@ -22,6 +22,8 @@
 #include <linux/mm.h>
 #include <linux/string.h>
 
+#include "internal.h"
+
 /* Symlink caching in the page cache is even more simplistic
  * and straight-forward than readdir caching.
  */
@@ -74,4 +76,5 @@ const struct inode_operations nfs_symlink_inode_operations = {
 	.get_link	= nfs_get_link,
 	.getattr	= nfs_getattr,
 	.setattr	= nfs_setattr,
+	.fileattr_get	= nfs_fileattr_get,
 };
diff --git a/include/linux/nfs_fs_sb.h b/include/linux/nfs_fs_sb.h
index 4daee27fa5eb..34d294774f8c 100644
--- a/include/linux/nfs_fs_sb.h
+++ b/include/linux/nfs_fs_sb.h
@@ -306,7 +306,7 @@ struct nfs_server {
 #define NFS_CAP_ATOMIC_OPEN	(1U << 4)
 #define NFS_CAP_LGOPEN		(1U << 5)
 #define NFS_CAP_CASE_INSENSITIVE	(1U << 6)
-#define NFS_CAP_CASE_PRESERVING	(1U << 7)
+#define NFS_CAP_CASE_NONPRESERVING	(1U << 7)
 #define NFS_CAP_REBOOT_LAYOUTRETURN	(1U << 8)
 #define NFS_CAP_OFFLOAD_STATUS	(1U << 9)
 #define NFS_CAP_ZERO_RANGE	(1U << 10)
diff --git a/include/linux/nfs_xdr.h b/include/linux/nfs_xdr.h
index ff1f12aa73d2..7c2057e40f99 100644
--- a/include/linux/nfs_xdr.h
+++ b/include/linux/nfs_xdr.h
@@ -182,6 +182,8 @@ struct nfs_pathconf {
 	struct nfs_fattr	*fattr; /* Post-op attributes */
 	__u32			max_link; /* max # of hard links */
 	__u32			max_namelen; /* max name length */
+	bool			case_insensitive;
+	bool			case_preserving;
 };
 
 struct nfs4_change_info {

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
