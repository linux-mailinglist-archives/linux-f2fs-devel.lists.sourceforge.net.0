Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BF985E428
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Feb 2024 18:14:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcqB5-0002bJ-9A;
	Wed, 21 Feb 2024 17:14:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rcqB3-0002b1-8G
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Feb 2024 17:14:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S8vjynZmCfC4VgEMK+D8ZIyQZFZ5KL7Ph1GMINT2bR4=; b=GRuuts0DYcZo9Kr+/Mp0hU2iUG
 85Iw3WzAzUbtYL+bUouRjayrWo5L0gfPk4MkGfj1C18Cf2HffOFRadScNFlHOrLigoL6P6XL+CfXp
 4IlrA775bYRxmuZmuVVAzXZF8li7N+Aj59ucEW0VHa8ai2F4H062bdxUldv8w6K1Ye+U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S8vjynZmCfC4VgEMK+D8ZIyQZFZ5KL7Ph1GMINT2bR4=; b=QEtWlczqAEI0H5El+Im8PJsCAQ
 rdHvQOaUNSmuK8yaWZOyAVQeEpAxg1o6b1Cbwnsix+qa/IOcDc5jQjcIuYtSYB2Ac8jrrej8cvCgs
 NpdopwBsHW+XuwgDjakPn2e7ANaLULt5EsvNbr4VGvZvz5b81RKq4NVunDJsuEglrVMA=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rcqAy-00028k-6A for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Feb 2024 17:14:37 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2FEB21FB6B;
 Wed, 21 Feb 2024 17:14:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EA557139D0;
 Wed, 21 Feb 2024 17:14:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SZ0oM20v1mVTKgAAD6G6ig
 (envelope-from <krisman@suse.de>); Wed, 21 Feb 2024 17:14:21 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: ebiggers@kernel.org,
	viro@zeniv.linux.org.uk,
	jaegeuk@kernel.org
Date: Wed, 21 Feb 2024 12:14:04 -0500
Message-ID: <20240221171412.10710-3-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240221171412.10710-1-krisman@suse.de>
References: <20240221171412.10710-1-krisman@suse.de>
MIME-Version: 1.0
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 2FEB21FB6B
X-Spam-Level: 
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Both fscrypt_prepare_lookup_partial and
 fscrypt_prepare_lookup
 will set DCACHE_NOKEY_NAME for dentries when the key is not available. Extract
 out a helper to set this flag in a single place, in prepar [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rcqAy-00028k-6A
Subject: [f2fs-dev] [PATCH v7 02/10] fscrypt: Factor out a helper to
 configure the lookup dentry
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

Both fscrypt_prepare_lookup_partial and fscrypt_prepare_lookup will set
DCACHE_NOKEY_NAME for dentries when the key is not available. Extract
out a helper to set this flag in a single place, in preparation to also
add the optimization that will disable ->d_revalidate if possible.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>

---
changes since v7
  - Fix function names in commit message (Eric)
  - Have a stub for the CONFIG_FS_ENCRYPTION=n case (Eric)
changes since v6
  - Use inline comparison for is_nokey_name (eric)
  - rename fscrypt_prepare_lookup_dentry->fscrypt_prepare_dentry (eric)
---
 fs/crypto/hooks.c       | 15 +++++----------
 include/linux/fscrypt.h | 15 +++++++++++++++
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 52504dd478d3..104771c3d3f6 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -102,11 +102,8 @@ int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry,
 	if (err && err != -ENOENT)
 		return err;
 
-	if (fname->is_nokey_name) {
-		spin_lock(&dentry->d_lock);
-		dentry->d_flags |= DCACHE_NOKEY_NAME;
-		spin_unlock(&dentry->d_lock);
-	}
+	fscrypt_prepare_dentry(dentry, fname->is_nokey_name);
+
 	return err;
 }
 EXPORT_SYMBOL_GPL(__fscrypt_prepare_lookup);
@@ -131,12 +128,10 @@ EXPORT_SYMBOL_GPL(__fscrypt_prepare_lookup);
 int fscrypt_prepare_lookup_partial(struct inode *dir, struct dentry *dentry)
 {
 	int err = fscrypt_get_encryption_info(dir, true);
+	bool is_nokey_name = (!err && !fscrypt_has_encryption_key(dir));
+
+	fscrypt_prepare_dentry(dentry, is_nokey_name);
 
-	if (!err && !fscrypt_has_encryption_key(dir)) {
-		spin_lock(&dentry->d_lock);
-		dentry->d_flags |= DCACHE_NOKEY_NAME;
-		spin_unlock(&dentry->d_lock);
-	}
 	return err;
 }
 EXPORT_SYMBOL_GPL(fscrypt_prepare_lookup_partial);
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 12f9e455d569..c76f859cf019 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -261,6 +261,16 @@ static inline bool fscrypt_is_nokey_name(const struct dentry *dentry)
 	return dentry->d_flags & DCACHE_NOKEY_NAME;
 }
 
+static inline void fscrypt_prepare_dentry(struct dentry *dentry,
+					  bool is_nokey_name)
+{
+	if (is_nokey_name) {
+		spin_lock(&dentry->d_lock);
+		dentry->d_flags |= DCACHE_NOKEY_NAME;
+		spin_unlock(&dentry->d_lock);
+	}
+}
+
 /* crypto.c */
 void fscrypt_enqueue_decrypt_work(struct work_struct *);
 
@@ -425,6 +435,11 @@ static inline bool fscrypt_is_nokey_name(const struct dentry *dentry)
 	return false;
 }
 
+static inline void fscrypt_prepare_dentry(struct dentry *dentry,
+					  bool is_nokey_name)
+{
+}
+
 /* crypto.c */
 static inline void fscrypt_enqueue_decrypt_work(struct work_struct *work)
 {
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
