Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNw+HWtKcmnQiQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 17:03:55 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D22E36972A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 17:03:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UAK/Zur7CHTkyjNphJJWUtf2kkxF3ezM/M/S6gRozV8=; b=CEk40Wqofp2gFirlqBcMnGe2Mh
	lXG01Mb8F1Kbook/6hMjMjOBz+Y2AUO1NahRY+TDVryH0hJoRT5gQLUlVju6pdE8p+u31Khyija4k
	W5FxVBAIqFqQFkEYbCkzt2z4NxuxF84JDTCycQ4mUdHE2W1VdMV0DCDRtuiJuidU0Ov0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vixA0-0004Y4-PL;
	Thu, 22 Jan 2026 16:03:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1vix9z-0004Xn-Ab
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 16:03:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pNyyDxVl0CQPZfpkWS62q/QEQSVwIdM0eK7RcDzbudY=; b=klfcaXROAlSng8Pewx263fBEKh
 CDMLYKQZH2ejo4zsIzoO0iqTYaOx7BGeMBnadzdxWlvInWWsygqPyVzxrjn4TqC0uOwS8HtG5MK9c
 +fhzogQA/A9VtGIgqVmrfknG2rBaWACGMRl4nQR7qrXSPUaIAElwxSu2bwn0kcXIKwKU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pNyyDxVl0CQPZfpkWS62q/QEQSVwIdM0eK7RcDzbudY=; b=f1uE6EfTw+NwL/rAy4ni0hGNAc
 tRJuC3RRQKl7G3zmjBgGqKB55PPwsTeIxUjWtwjeJiHyGX3cy2StdNXOkRQwWgwXt2XaIRdAklUUA
 ePafMg21LtQ6VBnkzpO80GpjJ9n+4pZ8P9Qy7GhG50IXSdWIZWNZUR1oLekGXO0VkjW8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vix9z-0000WO-Do for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 16:03:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 26B8244388;
 Thu, 22 Jan 2026 16:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA1CFC19422;
 Thu, 22 Jan 2026 16:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769097821;
 bh=qLtSl/hzug0iezWDJ52LTln03Jl9ZBIsucwCCdyP8wA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XrCkvb+70GVLgMaGG2OPpiPrCEtB1ljxpVnh45IsgcYOMESU5mfooF0aufdqzLrRV
 4v/2O/Wy+cWos+307a7w3moHtllQFNGA3TH5ysy39JHww3H7zhD2TyI1K9utoyv0iL
 oxxg4gRF2XjMN3GNv3YJryjKPFx8bv3NY4Cic5LrcmunBFw6mLbJc+TRVLvu4RzBq2
 xuc3T5MZvB2CisAJrgCaXqFjPG+hg9dmSeZ4TrRua2jW+bIFayY9ZMBPX53eGWKJHt
 cfXCBWiuzS7llsmQrwoTfEpnC9ZhevLncFUxhQ/CdKzEQmFPZcvW3W0i3KQ+qmUFIA
 z9XgPP1kgifMA==
To: Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>
Date: Thu, 22 Jan 2026 11:03:05 -0500
Message-ID: <20260122160311.1117669-11-cel@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122160311.1117669-1-cel@kernel.org>
References: <20260122160311.1117669-1-cel@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
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
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vix9z-0000WO-Do
Subject: [f2fs-dev] [PATCH v7 10/16] nfs: Implement fileattr_get for case
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[manguebit.org,sony.com,kernel.org,paragon-software.com,dilger.ca,vger.kernel.org,samba.org,dubeyko.com,microsoft.com,vivo.com,gmail.com,physik.fu-berlin.de,mail.parknet.co.jp,mit.edu,lists.sourceforge.net,chromium.org,oracle.com,samsung.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:pc@manguebit.org,m:yuezhang.mo@sony.com,m:cem@kernel.org,m:almaz.alexandrovich@paragon-software.com,m:adilger.kernel@dilger.ca,m:linux-cifs@vger.kernel.org,m:sfrench@samba.org,m:slava@dubeyko.com,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:sprasad@microsoft.com,m:frank.li@vivo.com,m:ronniesahlberg@gmail.com,m:glaubitz@physik.fu-berlin.de,m:jaegeuk@kernel.org,m:hirofumi@mail.parknet.co.jp,m:linux-nfs@vger.kernel.org,m:tytso@mit.edu,m:linux-api@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:senozhatsky@chromium.org,m:chuck.lever@oracle.com,m:hansg@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:sj1557.seo@samsung.com,m:trondmy@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[cel@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: D22E36972A
X-Rspamd-Action: no action

From: Chuck Lever <chuck.lever@oracle.com>

An NFS server re-exporting an NFS mount point needs to report the
case sensitivity behavior of the underlying filesystem to its
clients. Without this, re-export servers cannot accurately convey
case handling semantics, potentially causing client applications to
make incorrect assumptions about filename collisions and lookups.

The NFS client already retrieves case sensitivity information from
servers during mount via PATHCONF (NFSv3) or the
FATTR4_CASE_INSENSITIVE/FATTR4_CASE_PRESERVING attributes (NFSv4).
Expose this information through fileattr_get by reporting the
FS_XFLAG_CASEFOLD and FS_XFLAG_CASENONPRESERVING flags. NFSv2 lacks
PATHCONF support, so mounts using that protocol version default to
standard POSIX behavior: case-sensitive and case-preserving.

Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
---
 fs/nfs/client.c         |  9 +++++++--
 fs/nfs/inode.c          | 20 ++++++++++++++++++++
 fs/nfs/internal.h       |  3 +++
 fs/nfs/nfs3proc.c       |  2 ++
 fs/nfs/nfs3xdr.c        |  7 +++++--
 fs/nfs/nfs4proc.c       |  2 ++
 fs/nfs/proc.c           |  3 +++
 fs/nfs/symlink.c        |  3 +++
 include/linux/nfs_xdr.h |  2 ++
 9 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/fs/nfs/client.c b/fs/nfs/client.c
index 2aaea9c98c2c..da437d89e14a 100644
--- a/fs/nfs/client.c
+++ b/fs/nfs/client.c
@@ -935,13 +935,18 @@ static int nfs_probe_fsinfo(struct nfs_server *server, struct nfs_fh *mntfh, str
 
 	/* Get some general file system info */
 	if (server->namelen == 0) {
-		struct nfs_pathconf pathinfo;
+		struct nfs_pathconf pathinfo = { };
 
 		pathinfo.fattr = fattr;
 		nfs_fattr_init(fattr);
 
-		if (clp->rpc_ops->pathconf(server, mntfh, &pathinfo) >= 0)
+		if (clp->rpc_ops->pathconf(server, mntfh, &pathinfo) >= 0) {
 			server->namelen = pathinfo.max_namelen;
+			if (pathinfo.case_insensitive)
+				server->caps |= NFS_CAP_CASE_INSENSITIVE;
+			if (pathinfo.case_preserving)
+				server->caps |= NFS_CAP_CASE_PRESERVING;
+		}
 	}
 
 	if (clp->rpc_ops->discover_trunking != NULL &&
diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
index de2cce1d08f4..77b4de8a1050 100644
--- a/fs/nfs/inode.c
+++ b/fs/nfs/inode.c
@@ -41,6 +41,7 @@
 #include <linux/freezer.h>
 #include <linux/uaccess.h>
 #include <linux/iversion.h>
+#include <linux/fileattr.h>
 
 #include "nfs4_fs.h"
 #include "callback.h"
@@ -1102,6 +1103,25 @@ int nfs_getattr(struct mnt_idmap *idmap, const struct path *path,
 }
 EXPORT_SYMBOL_GPL(nfs_getattr);
 
+/**
+ * nfs_fileattr_get - Retrieve file attributes
+ * @dentry: object to query
+ * @fa: file attributes to fill in
+ *
+ * Return: 0 on success
+ */
+int nfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
+{
+	struct inode *inode = d_inode(dentry);
+
+	if (nfs_server_capable(inode, NFS_CAP_CASE_INSENSITIVE))
+		fa->fsx_xflags |= FS_XFLAG_CASEFOLD;
+	if (!nfs_server_capable(inode, NFS_CAP_CASE_PRESERVING))
+		fa->fsx_xflags |= FS_XFLAG_CASENONPRESERVING;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nfs_fileattr_get);
+
 static void nfs_init_lock_context(struct nfs_lock_context *l_ctx)
 {
 	refcount_set(&l_ctx->count, 1);
diff --git a/fs/nfs/internal.h b/fs/nfs/internal.h
index 2e596244799f..a843e076aad7 100644
--- a/fs/nfs/internal.h
+++ b/fs/nfs/internal.h
@@ -453,6 +453,9 @@ extern void nfs_set_cache_invalid(struct inode *inode, unsigned long flags);
 extern bool nfs_check_cache_invalid(struct inode *, unsigned long);
 extern int nfs_wait_bit_killable(struct wait_bit_key *key, int mode);
 
+struct file_kattr;
+int nfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa);
+
 #if IS_ENABLED(CONFIG_NFS_LOCALIO)
 /* localio.c */
 struct nfs_local_dio {
diff --git a/fs/nfs/nfs3proc.c b/fs/nfs/nfs3proc.c
index 1181f9cc6dbd..60344a83f400 100644
--- a/fs/nfs/nfs3proc.c
+++ b/fs/nfs/nfs3proc.c
@@ -1048,6 +1048,7 @@ static const struct inode_operations nfs3_dir_inode_operations = {
 	.permission	= nfs_permission,
 	.getattr	= nfs_getattr,
 	.setattr	= nfs_setattr,
+	.fileattr_get	= nfs_fileattr_get,
 #ifdef CONFIG_NFS_V3_ACL
 	.listxattr	= nfs3_listxattr,
 	.get_inode_acl	= nfs3_get_acl,
@@ -1059,6 +1060,7 @@ static const struct inode_operations nfs3_file_inode_operations = {
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
index a0885ae55abc..7bb1ea77d20e 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -11072,6 +11072,7 @@ static const struct inode_operations nfs4_dir_inode_operations = {
 	.getattr	= nfs_getattr,
 	.setattr	= nfs_setattr,
 	.listxattr	= nfs4_listxattr,
+	.fileattr_get	= nfs_fileattr_get,
 };
 
 static const struct inode_operations nfs4_file_inode_operations = {
@@ -11079,6 +11080,7 @@ static const struct inode_operations nfs4_file_inode_operations = {
 	.getattr	= nfs_getattr,
 	.setattr	= nfs_setattr,
 	.listxattr	= nfs4_listxattr,
+	.fileattr_get	= nfs_fileattr_get,
 };
 
 static struct nfs_server *nfs4_clone_server(struct nfs_server *source,
diff --git a/fs/nfs/proc.c b/fs/nfs/proc.c
index 39df80e4ae6f..48f02a80b800 100644
--- a/fs/nfs/proc.c
+++ b/fs/nfs/proc.c
@@ -597,6 +597,7 @@ nfs_proc_pathconf(struct nfs_server *server, struct nfs_fh *fhandle,
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
diff --git a/include/linux/nfs_xdr.h b/include/linux/nfs_xdr.h
index 79fe2dfb470f..5f061a9db2c2 100644
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
2.52.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
