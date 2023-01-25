Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF97767B131
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Jan 2023 12:29:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pKdyU-00066m-BR;
	Wed, 25 Jan 2023 11:29:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1pKdyT-00066b-2h
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jan 2023 11:29:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SI8EUcn0Y65z7s/FmHblOF3xtnj72QMN8WQV5Hmmt7A=; b=awFFahT1K7HDmEaOGc+7lIWTwh
 IUNEGmDgmyBZOmXJl2VzZkTLckl6E2yFpl3UCge6FXjU+FbAKQjsFQ8RruV01rsmdUkhHfYY5oRdJ
 ohwxx4p2JkkvLpjN3JJiRrA1Y8yQtdeiL8Y3TpC4YtmwfPaejAaVHqBvv+8zcNhed/ck=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SI8EUcn0Y65z7s/FmHblOF3xtnj72QMN8WQV5Hmmt7A=; b=i3xQjWyeSTCvVKT0LqrNv65meN
 6ZvgmwmUFLxPumu8/ohS74OTLHxIeZSfCNCT7sqvrAr6R9ygQFF3d6Wvdo9XbEEUrZSX0BbSKal7G
 Z0NAzBTBArN+7vqPSneA9yTsJPVDss2neOyHbvVpIugvc0+e4sr7dlbiOmM8xxlj2/FM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pKdyQ-00FGuu-ER for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Jan 2023 11:29:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 17896B81991;
 Wed, 25 Jan 2023 11:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C13AC4339E;
 Wed, 25 Jan 2023 11:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674646182;
 bh=xUJebQ0e9KwSrY/Cal4CAWhcfhSdz9RiiwAWxi4+KHc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=cozUATMauQjoFoE5hvkPr3B8PLlGiW9MIxmWen0gF5YS0pgPqXF4Pn9S0uVbr+uYc
 p491Vbspem4g0PCceifALOTy6+qpfE5kh/4jStAxD+ZuKyYh0DxthtjJI4hQ7AWHFk
 b/fuJK+2etQRxLoSUz5B53F8exR1AtrjGyeIe12JxcWlBMZ3V+mnl/TttpVH5tUL0q
 gTwehhNG5kDIv5l9NTUrGlkxx3X4kbOtust3QDGfEIg7G3Rs+XCpIss1ACzBvsuqWS
 x1sg9/dCn9u129Cr/KNRlE3sLRhKJRlmxglFod74Z71pw0JW+wAJNfUMcilK9LdLyQ
 y2Rw4Ww0qzb/w==
From: Christian Brauner <brauner@kernel.org>
Date: Wed, 25 Jan 2023 12:28:53 +0100
MIME-Version: 1.0
Message-Id: <20230125-fs-acl-remove-generic-xattr-handlers-v1-8-6cf155b492b6@kernel.org>
References: <20230125-fs-acl-remove-generic-xattr-handlers-v1-0-6cf155b492b6@kernel.org>
In-Reply-To: <20230125-fs-acl-remove-generic-xattr-handlers-v1-0-6cf155b492b6@kernel.org>
To: linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4258; i=brauner@kernel.org;
 h=from:subject:message-id; bh=xUJebQ0e9KwSrY/Cal4CAWhcfhSdz9RiiwAWxi4+KHc=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMSRfFJo4R/Ewy9Nf8XlH1lk8Wza9MPAK53VNoYdMX0ydX15S
 m3EqtqOUhUGMi0FWTJHFod0kXG45T8Vmo0wNmDmsTCBDGLg4BWAi93sYGbaf/ODb2vt+zuIgaS/j00
 sL73qtV3355daEa3pPt8VtbvFlZLgVWjcxz8ixvPOexxans++qrF/uSFf4VCiod6a0MOLIOS4A
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Last cycle we introduced a new posix acl api. Filesystems
 now only need to implement the inode operations for posix acls. The generic
 xattr handlers aren't used anymore by the vfs and will be complete [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pKdyQ-00FGuu-ER
Subject: [f2fs-dev] [PATCH 08/12] f2fs: drop posix acl handlers
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
 linux-f2fs-devel@lists.sourceforge.net, Al Viro <viro@zeniv.linux.org.uk>,
 Seth Forshee <sforshee@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Last cycle we introduced a new posix acl api. Filesystems now only need
to implement the inode operations for posix acls. The generic xattr
handlers aren't used anymore by the vfs and will be completely removed.
Keeping the handler around is confusing and gives the false impression
that the xattr infrastructure of the vfs is used to interact with posix
acls when it really isn't anymore.

For this to work we simply rework the ->listxattr() inode operation to
not rely on the generix posix acl handlers anymore.

Cc: <linux-f2fs-devel@lists.sourceforge.net>
Signed-off-by: Christian Brauner (Microsoft) <brauner@kernel.org>
---
 fs/f2fs/xattr.c | 63 ++++++++++++++++++++++++++++++++++-----------------------
 1 file changed, 38 insertions(+), 25 deletions(-)

diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index dc2e8637189e..e5bd071fac8c 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -189,25 +189,8 @@ const struct xattr_handler f2fs_xattr_security_handler = {
 	.set	= f2fs_xattr_generic_set,
 };
 
-static const struct xattr_handler *f2fs_xattr_handler_map[] = {
-	[F2FS_XATTR_INDEX_USER] = &f2fs_xattr_user_handler,
-#ifdef CONFIG_F2FS_FS_POSIX_ACL
-	[F2FS_XATTR_INDEX_POSIX_ACL_ACCESS] = &posix_acl_access_xattr_handler,
-	[F2FS_XATTR_INDEX_POSIX_ACL_DEFAULT] = &posix_acl_default_xattr_handler,
-#endif
-	[F2FS_XATTR_INDEX_TRUSTED] = &f2fs_xattr_trusted_handler,
-#ifdef CONFIG_F2FS_FS_SECURITY
-	[F2FS_XATTR_INDEX_SECURITY] = &f2fs_xattr_security_handler,
-#endif
-	[F2FS_XATTR_INDEX_ADVISE] = &f2fs_xattr_advise_handler,
-};
-
 const struct xattr_handler *f2fs_xattr_handlers[] = {
 	&f2fs_xattr_user_handler,
-#ifdef CONFIG_F2FS_FS_POSIX_ACL
-	&posix_acl_access_xattr_handler,
-	&posix_acl_default_xattr_handler,
-#endif
 	&f2fs_xattr_trusted_handler,
 #ifdef CONFIG_F2FS_FS_SECURITY
 	&f2fs_xattr_security_handler,
@@ -216,13 +199,44 @@ const struct xattr_handler *f2fs_xattr_handlers[] = {
 	NULL,
 };
 
-static inline const struct xattr_handler *f2fs_xattr_handler(int index)
+static const char *f2fs_xattr_prefix(int xattr_index, struct dentry *dentry)
 {
+	const char *name = NULL;
 	const struct xattr_handler *handler = NULL;
 
-	if (index > 0 && index < ARRAY_SIZE(f2fs_xattr_handler_map))
-		handler = f2fs_xattr_handler_map[index];
-	return handler;
+	switch (xattr_index) {
+	case F2FS_XATTR_INDEX_USER:
+		handler = &f2fs_xattr_user_handler;
+		break;
+	case F2FS_XATTR_INDEX_TRUSTED:
+		handler = &f2fs_xattr_trusted_handler;
+		break;
+	case F2FS_XATTR_INDEX_ADVISE:
+		handler = &f2fs_xattr_advise_handler;
+		break;
+#ifdef CONFIG_F2FS_FS_SECURITY
+	case F2FS_XATTR_INDEX_SECURITY:
+		handler = &f2fs_xattr_security_handler;
+		break;
+#endif
+#ifdef CONFIG_F2FS_FS_POSIX_ACL
+	case F2FS_XATTR_INDEX_POSIX_ACL_ACCESS:
+		if (posix_acl_dentry_list(dentry))
+			name = XATTR_NAME_POSIX_ACL_ACCESS;
+		break;
+	case F2FS_XATTR_INDEX_POSIX_ACL_DEFAULT:
+		if (posix_acl_dentry_list(dentry))
+			name = XATTR_NAME_POSIX_ACL_DEFAULT;
+		break;
+#endif
+	default:
+		return NULL;
+	}
+
+	if (xattr_dentry_list(handler, dentry))
+		name = xattr_prefix(handler);
+
+	return name;
 }
 
 static struct f2fs_xattr_entry *__find_xattr(void *base_addr,
@@ -573,12 +587,12 @@ ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
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
@@ -590,10 +604,9 @@ ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
 			goto cleanup;
 		}
 
-		if (!handler || (handler->list && !handler->list(dentry)))
+		if (!prefix)
 			continue;
 
-		prefix = xattr_prefix(handler);
 		prefix_len = strlen(prefix);
 		size = prefix_len + entry->e_name_len + 1;
 		if (buffer) {

-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
