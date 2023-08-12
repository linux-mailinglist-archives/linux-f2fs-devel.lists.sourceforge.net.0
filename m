Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0673779C08
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 12 Aug 2023 02:42:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qUchr-0003n9-NC;
	Sat, 12 Aug 2023 00:42:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1qUchq-0003my-RZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Aug 2023 00:42:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sTxhaqF5sRXfD/Sz/tp3d/xhC2rVXOn+t3d6w8E4rAo=; b=K+74wlUjpNoCG4KC1Ob8WJFRG3
 WrN82hgRoVk62SoijYmphBFfIQo+oY/40vUFGOdMVUpB1HFjZV296JVfHiM/Sp14OF7/NiEB884HH
 grU1DPNR2st2awkEPjq4Bw4U+LvU3gs8oHcwvFFwXro/HX/FrcXCZcmhSmoOhCw8Vty8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sTxhaqF5sRXfD/Sz/tp3d/xhC2rVXOn+t3d6w8E4rAo=; b=Y0Lz9hEKO3nLTAG7MM/NPihSgr
 7GDD85Yn/y7XlBDDLZo92j2y+cVGoqkJUBlrfkwtkYLKEeUeKHYaIIZNX9kyjX2mwA4P6Y1WfRHwh
 xOQ3NUVhQDcZSkT8gIZT5gQzNoYH/dHM+bhrgYVrwQSUupf5WZfTbqF1eSW9eyvQf+7Y=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qUchp-002xtx-T1 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Aug 2023 00:42:14 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A7AE91F38A;
 Sat, 12 Aug 2023 00:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1691800927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sTxhaqF5sRXfD/Sz/tp3d/xhC2rVXOn+t3d6w8E4rAo=;
 b=X8tB+eKLTTO897QOvQSA84RZHzPqH9/rqG0UZPdDtiaDP7unm/zP2xCocNDYKUbwpbfsTe
 Cp5Kzt3MQnBuvdPcAgwy8jaRWuaBG/EXL9V4LJbLhUJit6Ojr4p2qnJAGzSFRBMkpK1SIG
 mAq5HMRJiKBD4Vwo4DgbJ8+5ww6m08I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1691800927;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sTxhaqF5sRXfD/Sz/tp3d/xhC2rVXOn+t3d6w8E4rAo=;
 b=WgVIEOryp4HKOjylausdq6/ZDFC+LngfMkSsLq62KITN3Vx3He6okdRjHVstf/tRXvDrZy
 ZzklrOajizMRl0Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7232013592;
 Sat, 12 Aug 2023 00:42:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6vxRFl/V1mQsEAAAMHmgww
 (envelope-from <krisman@suse.de>); Sat, 12 Aug 2023 00:42:07 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk, brauner@kernel.org, tytso@mit.edu,
 ebiggers@kernel.org, jaegeuk@kernel.org
Date: Fri, 11 Aug 2023 20:41:44 -0400
Message-ID: <20230812004146.30980-9-krisman@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230812004146.30980-1-krisman@suse.de>
References: <20230812004146.30980-1-krisman@suse.de>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Gabriel Krisman Bertazi <krisman@collabora.com> Now
 that casefold needs d_revalidate and calls fscrypt_d_revalidate itself,
 generic_encrypt_ci_dentry_ops
 and generic_ci_dentry_ops are now equivalent. Merge them together and simplify
 the setup code. 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qUchp-002xtx-T1
Subject: [f2fs-dev] [PATCH v5 08/10] libfs: Merge encrypted_ci_dentry_ops
 and ci_dentry_ops
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
Cc: linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@suse.de>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Gabriel Krisman Bertazi <krisman@collabora.com>

Now that casefold needs d_revalidate and calls fscrypt_d_revalidate
itself, generic_encrypt_ci_dentry_ops and generic_ci_dentry_ops are now
equivalent.  Merge them together and simplify the setup code.

Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

---
changes since v2:
  - reword comment for clarity (Eric)
---
 fs/libfs.c | 45 +++++++++++++--------------------------------
 1 file changed, 13 insertions(+), 32 deletions(-)

diff --git a/fs/libfs.c b/fs/libfs.c
index efb245118d10..6b15a4f0312f 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1516,7 +1516,7 @@ static int generic_ci_d_revalidate(struct dentry *dentry,
 	return fscrypt_d_revalidate(dentry, name, flags);
 }
 
-static const struct dentry_operations generic_ci_dentry_ops = {
+static const struct dentry_operations generic_encrypted_ci_dentry_ops = {
 	.d_hash = generic_ci_d_hash,
 	.d_compare = generic_ci_d_compare,
 	.d_revalidate = generic_ci_d_revalidate,
@@ -1529,26 +1529,19 @@ static const struct dentry_operations generic_encrypted_dentry_ops = {
 };
 #endif
 
-#if defined(CONFIG_FS_ENCRYPTION) && IS_ENABLED(CONFIG_UNICODE)
-static const struct dentry_operations generic_encrypted_ci_dentry_ops = {
-	.d_hash = generic_ci_d_hash,
-	.d_compare = generic_ci_d_compare,
-	.d_revalidate = generic_ci_d_revalidate,
-};
-#endif
-
 /**
  * generic_set_encrypted_ci_d_ops - helper for setting d_ops for given dentry
  * @dentry:	dentry to set ops on
  *
- * Casefolded directories need d_hash and d_compare set, so that the dentries
- * contained in them are handled case-insensitively.  Note that these operations
- * are needed on the parent directory rather than on the dentries in it, and
- * while the casefolding flag can be toggled on and off on an empty directory,
- * dentry_operations can't be changed later.  As a result, if the filesystem has
- * casefolding support enabled at all, we have to give all dentries the
- * casefolding operations even if their inode doesn't have the casefolding flag
- * currently (and thus the casefolding ops would be no-ops for now).
+ * Casefolded directories need some dentry_operations set, so that the dentries
+ * contained in them are handled case-insensitively.  Note that d_hash and
+ * d_compare are needed on the parent directory rather than on the dentries in
+ * it, and while the casefolding flag can be toggled on and off on an empty
+ * directory, dentry_operations can't be changed later.  As a result, if the
+ * filesystem has casefolding support enabled at all, we have to give all
+ * dentries the casefolding operations even if their inode doesn't have the
+ * casefolding flag currently (and thus the casefolding ops would be no-ops for
+ * now).
  *
  * Encryption works differently in that the only dentry operation it needs is
  * d_revalidate, which it only needs on dentries that have the no-key name flag.
@@ -1557,34 +1550,22 @@ static const struct dentry_operations generic_encrypted_ci_dentry_ops = {
  * Finally, to maximize compatibility with overlayfs (which isn't compatible
  * with certain dentry operations) and to avoid taking an unnecessary
  * performance hit, we use custom dentry_operations for each possible
- * combination rather than always installing all operations.
+ * combination of operations rather than always installing them.
  */
 void generic_set_encrypted_ci_d_ops(struct dentry *dentry)
 {
-#ifdef CONFIG_FS_ENCRYPTION
-	bool needs_encrypt_ops = dentry->d_flags & DCACHE_NOKEY_NAME;
-#endif
 #if IS_ENABLED(CONFIG_UNICODE)
-	bool needs_ci_ops = dentry->d_sb->s_encoding;
-#endif
-#if defined(CONFIG_FS_ENCRYPTION) && IS_ENABLED(CONFIG_UNICODE)
-	if (needs_encrypt_ops && needs_ci_ops) {
+	if (dentry->d_sb->s_encoding) {
 		d_set_d_op(dentry, &generic_encrypted_ci_dentry_ops);
 		return;
 	}
 #endif
 #ifdef CONFIG_FS_ENCRYPTION
-	if (needs_encrypt_ops) {
+	if (dentry->d_flags & DCACHE_NOKEY_NAME) {
 		d_set_d_op(dentry, &generic_encrypted_dentry_ops);
 		return;
 	}
 #endif
-#if IS_ENABLED(CONFIG_UNICODE)
-	if (needs_ci_ops) {
-		d_set_d_op(dentry, &generic_ci_dentry_ops);
-		return;
-	}
-#endif
 }
 EXPORT_SYMBOL(generic_set_encrypted_ci_d_ops);
 
-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
