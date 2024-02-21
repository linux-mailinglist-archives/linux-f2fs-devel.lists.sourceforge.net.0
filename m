Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B5285E42F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Feb 2024 18:14:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcqBD-0002cb-RI;
	Wed, 21 Feb 2024 17:14:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rcqBC-0002cB-Gl
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Feb 2024 17:14:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Eeil49rn2XqOi+q7V3YSLoNIn7QQdtBhnV8eo0pvhAc=; b=IbBiZfciH+Is8CxEdq0YH6KxSl
 JbgDILWCJV5kIW9uORWTMLCx+0GKReaYjV/OwIpdv9MuioIQK2m0wyVuI0n+evEJnWfTgAPoJgzo+
 FpFPgpvrp+ABQOYWpF/LFGPLPrnqhrdbrDx9hDhEQj85ai4O/c6xbdH+DEOuall42/A4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Eeil49rn2XqOi+q7V3YSLoNIn7QQdtBhnV8eo0pvhAc=; b=Og3wYqsYIFObVl6B5ydr0w4vD/
 jrcPlbRW74oSpsIMAVQX6R8ItQxfVQaHik9pLebFb+pRRZv7PSrZz5bVt7W0H0Gd/oTCwlSXNK2f6
 gZnnE4fVtC3bPuw2kubjCGfKuLaJWsoCaO1P9+VM9kEK0sdkkA35Z/iBNZBPzvy4wTQw=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rcqB9-00029L-EN for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Feb 2024 17:14:45 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 688EC1FB6A;
 Wed, 21 Feb 2024 17:14:33 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2DBD3139D0;
 Wed, 21 Feb 2024 17:14:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id tsbUBHkv1mVfKgAAD6G6ig
 (envelope-from <krisman@suse.de>); Wed, 21 Feb 2024 17:14:33 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: ebiggers@kernel.org,
	viro@zeniv.linux.org.uk,
	jaegeuk@kernel.org
Date: Wed, 21 Feb 2024 12:14:06 -0500
Message-ID: <20240221171412.10710-5-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240221171412.10710-1-krisman@suse.de>
References: <20240221171412.10710-1-krisman@suse.de>
MIME-Version: 1.0
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 688EC1FB6A
X-Spam-Level: 
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When a key is added,
 existing directory dentries in the DCACHE_NOKEY_NAME
 form are moved by the VFS to the plaintext version. But, since they have
 the DCACHE_OP_REVALIDATE flag set, revalidation will [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rcqB9-00029L-EN
Subject: [f2fs-dev] [PATCH v7 04/10] fscrypt: Drop d_revalidate once the key
 is added
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
Cc: Gabriel Krisman Bertazi <krisman@suse.de>, brauner@kernel.org,
 tytso@mit.edu, amir73il@gmail.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When a key is added, existing directory dentries in the
DCACHE_NOKEY_NAME form are moved by the VFS to the plaintext version.
But, since they have the DCACHE_OP_REVALIDATE flag set, revalidation
will be done at each lookup only to return immediately, since plaintext
dentries can't go stale until eviction.  This patch optimizes this case,
by dropping the flag once the nokey_name dentry becomes plain-text.
Note that non-directory dentries are not moved this way, so they won't
be affected.

Of course, this can only be done if fscrypt is the only thing requiring
revalidation for a dentry.  For this reason, we only disable
d_revalidate if the .d_revalidate hook is fscrypt_d_revalidate itself.

It is safe to do it here because when moving the dentry to the
plain-text version, we are holding the d_lock.  We might race with a
concurrent RCU lookup but this is harmless because, at worst, we will
get an extra d_revalidate on the keyed dentry, which will still find the
dentry to be valid.

Finally, now that we do more than just clear the DCACHE_NOKEY_NAME in
fscrypt_handle_d_move, skip it entirely for plaintext dentries, to avoid
extra costs.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>

---
Changes since v6:
  - mention this is only for directory dentries in the commit msg(eric)
Changes since v5:
  - Merge with another patch(eric)
  - revert conditional check (eric)
  - drop comment (eric)
Changes since v3:
  - Fix null-ptr-deref for filesystems that don't support fscrypt (ktr)
Changes since v2:
  - Do it when moving instead of when revalidating the dentry. (me)
Changes since v1:
  - Improve commit message (Eric)
  - Drop & in function comparison (Eric)
---
 include/linux/fscrypt.h | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 78af02b35bd9..772f822dc6b8 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -192,6 +192,8 @@ struct fscrypt_operations {
 					     unsigned int *num_devs);
 };
 
+int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags);
+
 static inline struct fscrypt_inode_info *
 fscrypt_get_inode_info(const struct inode *inode)
 {
@@ -221,15 +223,29 @@ static inline bool fscrypt_needs_contents_encryption(const struct inode *inode)
 }
 
 /*
- * When d_splice_alias() moves a directory's no-key alias to its plaintext alias
- * as a result of the encryption key being added, DCACHE_NOKEY_NAME must be
- * cleared.  Note that we don't have to support arbitrary moves of this flag
- * because fscrypt doesn't allow no-key names to be the source or target of a
- * rename().
+ * When d_splice_alias() moves a directory's no-key alias to its
+ * plaintext alias as a result of the encryption key being added,
+ * DCACHE_NOKEY_NAME must be cleared and there might be an opportunity
+ * to disable d_revalidate.  Note that we don't have to support the
+ * inverse operation because fscrypt doesn't allow no-key names to be
+ * the source or target of a rename().
  */
 static inline void fscrypt_handle_d_move(struct dentry *dentry)
 {
-	dentry->d_flags &= ~DCACHE_NOKEY_NAME;
+	/*
+	 * VFS calls fscrypt_handle_d_move even for non-fscrypt
+	 * filesystems.
+	 */
+	if (dentry->d_flags & DCACHE_NOKEY_NAME) {
+		dentry->d_flags &= ~DCACHE_NOKEY_NAME;
+
+		/*
+		 * Other filesystem features might be handling dentry
+		 * revalidation, in which case it cannot be disabled.
+		 */
+		if (dentry->d_op->d_revalidate == fscrypt_d_revalidate)
+			dentry->d_flags &= ~DCACHE_OP_REVALIDATE;
+	}
 }
 
 /**
@@ -397,7 +413,6 @@ int fscrypt_fname_disk_to_usr(const struct inode *inode,
 bool fscrypt_match_name(const struct fscrypt_name *fname,
 			const u8 *de_name, u32 de_name_len);
 u64 fscrypt_fname_siphash(const struct inode *dir, const struct qstr *name);
-int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags);
 
 /* bio.c */
 bool fscrypt_decrypt_bio(struct bio *bio);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
