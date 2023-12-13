Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 795B28123A1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Dec 2023 00:59:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rDZ8M-0003Y2-6d;
	Wed, 13 Dec 2023 23:59:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rDZ8K-0003Xt-KI
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Dec 2023 23:59:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sp7vIsMdgWL9TiTqEXZpY2g0TTohq+YTCZxjglEPwgw=; b=faKyF2SVbiW79z4faJpxoFqDQ9
 mhPTkLqqn6hHhoBndKXVF6qi7PymvP9aSDxnOrFXkBqoO+kteHya2SjYa/+nrH2cTiPXbZMg5cjOF
 s2eQlIBy7qWhnlAtDN+SxV9CFm5xXEBmjiG6sR19RdFOt7L5re+Z7SCScRHPCpKmMAe8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sp7vIsMdgWL9TiTqEXZpY2g0TTohq+YTCZxjglEPwgw=; b=j940QLsshdlmHRYK0EwQJb0VBT
 Zn/JvKohq12EGTRiCY2BkAXicqQc8p/F/DYiLv/VRp8/SMVV7TWY6DWrxgDf/AlOJNaHJioMV+Sav
 bYa0v6EEC21CINAatE3nmOIZcGuIBfdhJfdLcZJeKVqpuXMpKVU2DsYUFwFaSGRGqu98=;
Received: from smtp-out1.suse.de ([195.135.223.130])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rDZ8J-0007hn-PJ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Dec 2023 23:59:20 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6615D22311;
 Wed, 13 Dec 2023 23:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1702510844; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sp7vIsMdgWL9TiTqEXZpY2g0TTohq+YTCZxjglEPwgw=;
 b=HuZn8w5OOUZo4mUeGyGKLHtyXrPLxXSjWKJxLu+c6ka69Qg2LA8Dgyngez0fjLbzXvGzJ0
 nZ8BpdceSmf/cOhdOymHO2IF73WocYTgFHsgKPREuVRleaovHKQ6LxVyG06k3/MJ2tMxg+
 LDOjukPdpHbXzPl5z+Xs42yqcz+eIo4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1702510844;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sp7vIsMdgWL9TiTqEXZpY2g0TTohq+YTCZxjglEPwgw=;
 b=exaASb07Q048vHK7bOAGm7Qzy3s8zM6Z2ELt0jL2mNpuwjK6MOWxJr2lmhPoBPJiW/oE7s
 bwgaoOCgFHjNShCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1702510844; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sp7vIsMdgWL9TiTqEXZpY2g0TTohq+YTCZxjglEPwgw=;
 b=HuZn8w5OOUZo4mUeGyGKLHtyXrPLxXSjWKJxLu+c6ka69Qg2LA8Dgyngez0fjLbzXvGzJ0
 nZ8BpdceSmf/cOhdOymHO2IF73WocYTgFHsgKPREuVRleaovHKQ6LxVyG06k3/MJ2tMxg+
 LDOjukPdpHbXzPl5z+Xs42yqcz+eIo4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1702510844;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sp7vIsMdgWL9TiTqEXZpY2g0TTohq+YTCZxjglEPwgw=;
 b=exaASb07Q048vHK7bOAGm7Qzy3s8zM6Z2ELt0jL2mNpuwjK6MOWxJr2lmhPoBPJiW/oE7s
 bwgaoOCgFHjNShCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D8481377F;
 Wed, 13 Dec 2023 23:40:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aKANBfxAemVnPgAAD6G6ig
 (envelope-from <krisman@suse.de>); Wed, 13 Dec 2023 23:40:44 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk, ebiggers@kernel.org, jaegeuk@kernel.org,
 tytso@mit.edu
Date: Wed, 13 Dec 2023 18:40:26 -0500
Message-ID: <20231213234031.1081-4-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213234031.1081-1-krisman@suse.de>
References: <20231213234031.1081-1-krisman@suse.de>
MIME-Version: 1.0
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -0.30
X-Spam-Flag: NO
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.30
X-Spamd-Result: default: False [-0.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 REPLY(-4.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; RCPT_COUNT_SEVEN(0.00)[8];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-0.00)[20.86%]
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: In preparation to get case-insensitive dentry operations from
 sb->s_d_op again, use the same structure for case-insensitive filesystems
 with and without fscrypt. This means that on a casefolded filesystem without
 fscrypt, we end up having to call fscrypt_d_revalidate once per dentry, which
 does the function call extra cost. We could avoid it by calling d_set_a [...]
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.130 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rDZ8J-0007hn-PJ
Subject: [f2fs-dev] [PATCH 3/8] libfs: Merge encrypted_ci_dentry_ops and
 ci_dentry_ops
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
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In preparation to get case-insensitive dentry operations from
sb->s_d_op again, use the same structure for case-insensitive
filesystems with and without fscrypt.

This means that on a casefolded filesystem without fscrypt, we end up
having to call fscrypt_d_revalidate once per dentry, which does the
function call extra cost.  We could avoid it by calling
d_set_always_valid in generic_set_encrypted_ci_d_ops, but this entire
function will go away in the following patches, and it is not worth the
extra complexity. Also, since the first fscrypt_d_revalidate will call
d_set_always_valid for us, we'll only have only pay the cost once, and
not per-lookup.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 fs/libfs.c | 34 ++++++----------------------------
 1 file changed, 6 insertions(+), 28 deletions(-)

diff --git a/fs/libfs.c b/fs/libfs.c
index e9440d55073c..52c944173e57 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1768,6 +1768,9 @@ static int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
 static const struct dentry_operations generic_ci_dentry_ops = {
 	.d_hash = generic_ci_d_hash,
 	.d_compare = generic_ci_d_compare,
+#if defined(CONFIG_FS_ENCRYPTION)
+	.d_revalidate = fscrypt_d_revalidate,
+#endif
 };
 #endif
 
@@ -1777,14 +1780,6 @@ static const struct dentry_operations generic_encrypted_dentry_ops = {
 };
 #endif
 
-#if defined(CONFIG_FS_ENCRYPTION) && IS_ENABLED(CONFIG_UNICODE)
-static const struct dentry_operations generic_encrypted_ci_dentry_ops = {
-	.d_hash = generic_ci_d_hash,
-	.d_compare = generic_ci_d_compare,
-	.d_revalidate = fscrypt_d_revalidate,
-};
-#endif
-
 /**
  * generic_set_encrypted_ci_d_ops - helper for setting d_ops for given dentry
  * @dentry:	dentry to set ops on
@@ -1801,38 +1796,21 @@ static const struct dentry_operations generic_encrypted_ci_dentry_ops = {
  * Encryption works differently in that the only dentry operation it needs is
  * d_revalidate, which it only needs on dentries that have the no-key name flag.
  * The no-key flag can't be set "later", so we don't have to worry about that.
- *
- * Finally, to maximize compatibility with overlayfs (which isn't compatible
- * with certain dentry operations) and to avoid taking an unnecessary
- * performance hit, we use custom dentry_operations for each possible
- * combination rather than always installing all operations.
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
-		d_set_d_op(dentry, &generic_encrypted_ci_dentry_ops);
+	if (dentry->d_sb->s_encoding) {
+		d_set_d_op(dentry, &generic_ci_dentry_ops);
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
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
