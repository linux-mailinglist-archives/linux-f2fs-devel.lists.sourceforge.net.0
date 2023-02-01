Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6DD686691
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Feb 2023 14:16:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNCy0-00086g-Uf;
	Wed, 01 Feb 2023 13:16:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1pNCxy-00086Z-9o
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Feb 2023 13:15:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3EgVwBU8IZKz6rxcuD7L1S3gbDZ9rAEYsChkCF4uE70=; b=TU8QxAjhnc1Th01N4NVkun3jfs
 8Z/KOUJSoOOLAzOvLWtapVX8c9GR3JDvFBQEP7yAK/lc51Cq9BREXGGpgEfrT5zStT9l4uDQZEVip
 02FPy36k0XcvLfi5MZrfwlwNl+3N4U3+aaLCumiCalC1nazU8Dz1Vhv3CkmWorlepKno=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3EgVwBU8IZKz6rxcuD7L1S3gbDZ9rAEYsChkCF4uE70=; b=ikq42LCzJIfbX6fgOEPCWBtzLl
 H3FyVMEmg1FgLLJr0DMLYCbEODJCvq3RvjiA+2Q2/MxF7qAU8td7EbgWFnQLNWdyilaOpzOax3QTd
 bzOqS+MfPadfE0z89AFUGsoyD5nmp7F2cqWthfX71ryFOvMW2Rd8u0fSG6ALcavvcpI8=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pNCxs-0005KR-Pe for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Feb 2023 13:15:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id B06BECE2425;
 Wed,  1 Feb 2023 13:15:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1C8C4339B;
 Wed,  1 Feb 2023 13:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675257342;
 bh=nlCBbW921u3ZlBEIlzZacM70LidgUYVH83a32e+s9J8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=pPVpN5q/DxEh0Ezu+Y/TEV/ieJGBoZX9ThTI2EijmnNH4CqHsx0bBT3EP3icjb8ym
 n1FPPl9P8uyzWxSzue/519j92HmAIQI9CvePN+TldDdVW3s4SiN8zRVBKLplGbD+04
 m2ryHsP3Jq03PdvX+ocyX930jp6is9JBMOzzt1WXgqcUmaE7szPo06V0CPxW4/k4iz
 2st9fdrr8MYk1xafzgoCjncyaZDEHy8qETVKf5RwQ9uziXmVD1G9wELRb10gxolaX3
 FONSurXdQQY2FW+4CXbBeNgbMend3P9uTK2p/PVYjboZmA6geUFg8QoI6Bvgrhfnav
 yE52anfcF089A==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 01 Feb 2023 14:14:56 +0100
MIME-Version: 1.0
Message-Id: <20230125-fs-acl-remove-generic-xattr-handlers-v3-5-f760cc58967d@kernel.org>
References: <20230125-fs-acl-remove-generic-xattr-handlers-v3-0-f760cc58967d@kernel.org>
In-Reply-To: <20230125-fs-acl-remove-generic-xattr-handlers-v3-0-f760cc58967d@kernel.org>
To: linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9103; i=brauner@kernel.org;
 h=from:subject:message-id; bh=nlCBbW921u3ZlBEIlzZacM70LidgUYVH83a32e+s9J8=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMSTfSv2kuDcw5KqSnWWjadtG829SgR1rm5+z/bQ0/2f1W9Tg
 SXFaRykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwEQuRDEynD/1WOh163EZX36B2ujek7
 3a5qs2q6QmHbbQisoQ/z5HkeG/m7vB3G4XPfaLm79F3eE1//NB9vqrjIO6V+y52T+9e6nDDQA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The ext{2, 4}, erofs, f2fs,
 and jffs2 filesystems use the same
 logic to check whether a given xattr can be listed. Simplify them and avoid
 open-coding the same check by calling the helper we introduced [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pNCxs-0005KR-Pe
Subject: [f2fs-dev] [PATCH v3 05/10] fs: simplify ->listxattr()
 implementation
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
Cc: "Christian Brauner \(Microsoft\)" <brauner@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 Al Viro <viro@zeniv.linux.org.uk>, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, Seth Forshee <sforshee@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The ext{2,4}, erofs, f2fs, and jffs2 filesystems use the same logic to
check whether a given xattr can be listed. Simplify them and avoid
open-coding the same check by calling the helper we introduced earlier.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Cc: linux-f2fs-devel@lists.sourceforge.net
Cc: linux-erofs@lists.ozlabs.org
Cc: linux-ext4@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Christian Brauner (Microsoft) <brauner@kernel.org>
---
Changes in v3:
  - Patch unchanged.

Changes in v2:
- Christoph Hellwig <hch@lst.de>:
  - Rework this patch completey by keeping the legacy generic POSIX ACL
    handlers around so that array-based handler indexing still works.
    This means way less churn for filesystems.
---
 fs/erofs/xattr.c |  8 ++------
 fs/erofs/xattr.h | 14 +++++++++++---
 fs/ext2/xattr.c  | 17 ++++++++++-------
 fs/ext4/xattr.c  | 17 ++++++++++-------
 fs/f2fs/xattr.c  | 16 ++++++++++------
 fs/jffs2/xattr.c | 21 ++++++++++++---------
 6 files changed, 55 insertions(+), 38 deletions(-)

diff --git a/fs/erofs/xattr.c b/fs/erofs/xattr.c
index 2c98a15a92ed..4b73be57c9f4 100644
--- a/fs/erofs/xattr.c
+++ b/fs/erofs/xattr.c
@@ -492,13 +492,9 @@ static int xattr_entrylist(struct xattr_iter *_it,
 	unsigned int prefix_len;
 	const char *prefix;
 
-	const struct xattr_handler *h =
-		erofs_xattr_handler(entry->e_name_index);
-
-	if (!h || (h->list && !h->list(it->dentry)))
+	prefix = erofs_xattr_prefix(entry->e_name_index, it->dentry);
+	if (!prefix)
 		return 1;
-
-	prefix = xattr_prefix(h);
 	prefix_len = strlen(prefix);
 
 	if (!it->buffer) {
diff --git a/fs/erofs/xattr.h b/fs/erofs/xattr.h
index 0a43c9ee9f8f..08658e414c33 100644
--- a/fs/erofs/xattr.h
+++ b/fs/erofs/xattr.h
@@ -41,8 +41,11 @@ extern const struct xattr_handler erofs_xattr_user_handler;
 extern const struct xattr_handler erofs_xattr_trusted_handler;
 extern const struct xattr_handler erofs_xattr_security_handler;
 
-static inline const struct xattr_handler *erofs_xattr_handler(unsigned int idx)
+static inline const char *erofs_xattr_prefix(unsigned int idx,
+					     struct dentry *dentry)
 {
+	const struct xattr_handler *handler = NULL;
+
 	static const struct xattr_handler *xattr_handler_map[] = {
 		[EROFS_XATTR_INDEX_USER] = &erofs_xattr_user_handler,
 #ifdef CONFIG_EROFS_FS_POSIX_ACL
@@ -57,8 +60,13 @@ static inline const struct xattr_handler *erofs_xattr_handler(unsigned int idx)
 #endif
 	};
 
-	return idx && idx < ARRAY_SIZE(xattr_handler_map) ?
-		xattr_handler_map[idx] : NULL;
+	if (idx && idx < ARRAY_SIZE(xattr_handler_map))
+		handler = xattr_handler_map[idx];
+
+	if (!xattr_handler_can_list(handler, dentry))
+		return NULL;
+
+	return xattr_prefix(handler);
 }
 
 extern const struct xattr_handler *erofs_xattr_handlers[];
diff --git a/fs/ext2/xattr.c b/fs/ext2/xattr.c
index 262951ffe8d0..958976f809f5 100644
--- a/fs/ext2/xattr.c
+++ b/fs/ext2/xattr.c
@@ -121,14 +121,18 @@ const struct xattr_handler *ext2_xattr_handlers[] = {
 
 #define EA_BLOCK_CACHE(inode)	(EXT2_SB(inode->i_sb)->s_ea_block_cache)
 
-static inline const struct xattr_handler *
-ext2_xattr_handler(int name_index)
+static inline const char *ext2_xattr_prefix(int name_index,
+					    struct dentry *dentry)
 {
 	const struct xattr_handler *handler = NULL;
 
 	if (name_index > 0 && name_index < ARRAY_SIZE(ext2_xattr_handler_map))
 		handler = ext2_xattr_handler_map[name_index];
-	return handler;
+
+	if (!xattr_handler_can_list(handler, dentry))
+		return NULL;
+
+	return xattr_prefix(handler);
 }
 
 static bool
@@ -329,11 +333,10 @@ ext2_xattr_list(struct dentry *dentry, char *buffer, size_t buffer_size)
 	/* list the attribute names */
 	for (entry = FIRST_ENTRY(bh); !IS_LAST_ENTRY(entry);
 	     entry = EXT2_XATTR_NEXT(entry)) {
-		const struct xattr_handler *handler =
-			ext2_xattr_handler(entry->e_name_index);
+		const char *prefix;
 
-		if (handler && (!handler->list || handler->list(dentry))) {
-			const char *prefix = handler->prefix ?: handler->name;
+		prefix = ext2_xattr_prefix(entry->e_name_index, dentry);
+		if (prefix) {
 			size_t prefix_len = strlen(prefix);
 			size_t size = prefix_len + entry->e_name_len + 1;
 
diff --git a/fs/ext4/xattr.c b/fs/ext4/xattr.c
index ba7f2557adb8..3fbeeb00fd78 100644
--- a/fs/ext4/xattr.c
+++ b/fs/ext4/xattr.c
@@ -169,14 +169,18 @@ static void ext4_xattr_block_csum_set(struct inode *inode,
 						bh->b_blocknr, BHDR(bh));
 }
 
-static inline const struct xattr_handler *
-ext4_xattr_handler(int name_index)
+static inline const char *ext4_xattr_prefix(int name_index,
+					    struct dentry *dentry)
 {
 	const struct xattr_handler *handler = NULL;
 
 	if (name_index > 0 && name_index < ARRAY_SIZE(ext4_xattr_handler_map))
 		handler = ext4_xattr_handler_map[name_index];
-	return handler;
+
+	if (!xattr_handler_can_list(handler, dentry))
+		return NULL;
+
+	return xattr_prefix(handler);
 }
 
 static int
@@ -691,11 +695,10 @@ ext4_xattr_list_entries(struct dentry *dentry, struct ext4_xattr_entry *entry,
 	size_t rest = buffer_size;
 
 	for (; !IS_LAST_ENTRY(entry); entry = EXT4_XATTR_NEXT(entry)) {
-		const struct xattr_handler *handler =
-			ext4_xattr_handler(entry->e_name_index);
+		const char *prefix;
 
-		if (handler && (!handler->list || handler->list(dentry))) {
-			const char *prefix = handler->prefix ?: handler->name;
+		prefix = ext4_xattr_prefix(entry->e_name_index, dentry);
+		if (prefix) {
 			size_t prefix_len = strlen(prefix);
 			size_t size = prefix_len + entry->e_name_len + 1;
 
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index ccb564e328af..9de984645253 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -212,13 +212,18 @@ const struct xattr_handler *f2fs_xattr_handlers[] = {
 	NULL,
 };
 
-static inline const struct xattr_handler *f2fs_xattr_handler(int index)
+static inline const char *f2fs_xattr_prefix(int index,
+					    struct dentry *dentry)
 {
 	const struct xattr_handler *handler = NULL;
 
 	if (index > 0 && index < ARRAY_SIZE(f2fs_xattr_handler_map))
 		handler = f2fs_xattr_handler_map[index];
-	return handler;
+
+	if (!xattr_handler_can_list(handler, dentry))
+		return NULL;
+
+	return xattr_prefix(handler);
 }
 
 static struct f2fs_xattr_entry *__find_xattr(void *base_addr,
@@ -569,12 +574,12 @@ ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
 	last_base_addr = (void *)base_addr + XATTR_SIZE(inode);
 
 	list_for_each_xattr(entry, base_addr) {
-		const struct xattr_handler *handler =
-			f2fs_xattr_handler(entry->e_name_index);
 		const char *prefix;
 		size_t prefix_len;
 		size_t size;
 
+		prefix = f2fs_xattr_prefix(entry->e_name_index, dentry);
+
 		if ((void *)(entry) + sizeof(__u32) > last_base_addr ||
 			(void *)XATTR_NEXT_ENTRY(entry) > last_base_addr) {
 			f2fs_err(F2FS_I_SB(inode), "inode (%lu) has corrupted xattr",
@@ -586,10 +591,9 @@ ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
 			goto cleanup;
 		}
 
-		if (!handler || (handler->list && !handler->list(dentry)))
+		if (!prefix)
 			continue;
 
-		prefix = xattr_prefix(handler);
 		prefix_len = strlen(prefix);
 		size = prefix_len + entry->e_name_len + 1;
 		if (buffer) {
diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index 0eaec4a0f3b1..1189a70d2007 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -924,8 +924,9 @@ const struct xattr_handler *jffs2_xattr_handlers[] = {
 	NULL
 };
 
-static const struct xattr_handler *xprefix_to_handler(int xprefix) {
-	const struct xattr_handler *ret;
+static const char *jffs2_xattr_prefix(int xprefix, struct dentry *dentry)
+{
+	const struct xattr_handler *ret = NULL;
 
 	switch (xprefix) {
 	case JFFS2_XPREFIX_USER:
@@ -948,10 +949,13 @@ static const struct xattr_handler *xprefix_to_handler(int xprefix) {
 		ret = &jffs2_trusted_xattr_handler;
 		break;
 	default:
-		ret = NULL;
-		break;
+		return NULL;
 	}
-	return ret;
+
+	if (!xattr_handler_can_list(ret, dentry))
+		return NULL;
+
+	return xattr_prefix(ret);
 }
 
 ssize_t jffs2_listxattr(struct dentry *dentry, char *buffer, size_t size)
@@ -962,7 +966,6 @@ ssize_t jffs2_listxattr(struct dentry *dentry, char *buffer, size_t size)
 	struct jffs2_inode_cache *ic = f->inocache;
 	struct jffs2_xattr_ref *ref, **pref;
 	struct jffs2_xattr_datum *xd;
-	const struct xattr_handler *xhandle;
 	const char *prefix;
 	ssize_t prefix_len, len, rc;
 	int retry = 0;
@@ -994,10 +997,10 @@ ssize_t jffs2_listxattr(struct dentry *dentry, char *buffer, size_t size)
 					goto out;
 			}
 		}
-		xhandle = xprefix_to_handler(xd->xprefix);
-		if (!xhandle || (xhandle->list && !xhandle->list(dentry)))
+
+		prefix = jffs2_xattr_prefix(xd->xprefix, dentry);
+		if (!prefix)
 			continue;
-		prefix = xhandle->prefix ?: xhandle->name;
 		prefix_len = strlen(prefix);
 		rc = prefix_len + xd->name_len + 1;
 

-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
