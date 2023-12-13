Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B2C8123A7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Dec 2023 01:01:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rDZ9s-0003bm-Lp;
	Thu, 14 Dec 2023 00:00:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rDZ9q-0003bf-8W
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Dec 2023 00:00:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BOfMKrOOMFnBkCeJn1aLffJitBfqzQE3Eu8XXea9Lpo=; b=hQ3D3RjA3t4crmnXnKvsI+6lqp
 QRYyLJEWNk88ZcV4jBuosAuJiheDZpFauJ2W7ONpHipFBbJGS9mTFeLckl7+JAlgv8NwNr2GTe7D0
 zH6LH1Ijw0P2pbKKQZQS3MemkzutJVTLhkx7YinBVTX31sEf5aa67rnlOHBSzW1jhPXQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BOfMKrOOMFnBkCeJn1aLffJitBfqzQE3Eu8XXea9Lpo=; b=gYaCsC+cyXYu8KEbb9WtxEJTnv
 9LmxqoiBjZb1w2p2wSt0NKLczAiR9gikZry6wKeG6IbGZr6k0VtRS0CI3zSyahM3Ef8Mtauu3yNH7
 W1s29Tj97sWBop/zs/DR78uQVPJ1F2kiJA02LoBs0eQFKVpm4QnRHyF4AWXoWRhKzybI=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rDZ9o-0007pr-JT for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Dec 2023 00:00:54 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9C2B21FD80;
 Wed, 13 Dec 2023 23:41:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 62F5D1377F;
 Wed, 13 Dec 2023 23:41:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id tZokEgxBemV9PgAAD6G6ig
 (envelope-from <krisman@suse.de>); Wed, 13 Dec 2023 23:41:00 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk, ebiggers@kernel.org, jaegeuk@kernel.org,
 tytso@mit.edu
Date: Wed, 13 Dec 2023 18:40:31 -0500
Message-ID: <20231213234031.1081-9-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213234031.1081-1-krisman@suse.de>
References: <20231213234031.1081-1-krisman@suse.de>
MIME-Version: 1.0
X-Spam-Level: 
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 9C2B21FD80
X-Spam-Flag: NO
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This partially reverts commit bb9cd9106b22 ("fscrypt: Have
 filesystems handle their d_ops"), which moved this handler out of fscrypt
 and into the filesystems, in preparation to support casefold and fs [...]
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rDZ9o-0007pr-JT
Subject: [f2fs-dev] [PATCH 8/8] fscrypt: Move d_revalidate configuration
 back into fscrypt
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

This partially reverts commit bb9cd9106b22 ("fscrypt: Have filesystems
handle their d_ops"), which moved this handler out of fscrypt and into
the filesystems, in preparation to support casefold and fscrypt
combinations.  Now that we set casefolding operations through
->s_d_op, move this back into fscrypt, where it belongs, but take care
to handle filesystems that set their own sb->s_d_op.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 fs/crypto/hooks.c       |  8 ++++++++
 fs/ext4/namei.c         |  5 -----
 fs/f2fs/namei.c         |  5 -----
 fs/libfs.c              | 19 -------------------
 fs/ubifs/dir.c          |  1 -
 include/linux/fs.h      |  1 -
 include/linux/fscrypt.h | 10 +++++-----
 7 files changed, 13 insertions(+), 36 deletions(-)

diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 52504dd478d3..166837d5af29 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -94,6 +94,10 @@ int __fscrypt_prepare_rename(struct inode *old_dir, struct dentry *old_dentry,
 }
 EXPORT_SYMBOL_GPL(__fscrypt_prepare_rename);
 
+static const struct dentry_operations fscrypt_dentry_ops = {
+	.d_revalidate = fscrypt_d_revalidate,
+};
+
 int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry,
 			     struct fscrypt_name *fname)
 {
@@ -106,6 +110,10 @@ int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry,
 		spin_lock(&dentry->d_lock);
 		dentry->d_flags |= DCACHE_NOKEY_NAME;
 		spin_unlock(&dentry->d_lock);
+
+		/* Give preference to the filesystem hooks, if any. */
+		if (!dentry->d_op)
+			d_set_d_op(dentry, &fscrypt_dentry_ops);
 	}
 	return err;
 }
diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 3c1208d5d85b..3f0b853a371e 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1762,11 +1762,6 @@ static struct buffer_head *ext4_lookup_entry(struct inode *dir,
 	struct buffer_head *bh;
 
 	err = ext4_fname_prepare_lookup(dir, dentry, &fname);
-
-	/* Case-insensitive volumes set dentry ops through sb->s_d_op. */
-	if (!dir->i_sb->s_encoding)
-		generic_set_encrypted_ci_d_ops(dentry);
-
 	if (err == -ENOENT)
 		return NULL;
 	if (err)
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 4053846e2cd3..b40c6c393bd6 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -532,11 +532,6 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 	}
 
 	err = f2fs_prepare_lookup(dir, dentry, &fname);
-
-	/* Case-insensitive volumes set dentry ops through sb->s_d_op. */
-	if (!dir->i_sb->s_encoding)
-		generic_set_encrypted_ci_d_ops(dentry);
-
 	if (err == -ENOENT)
 		goto out_splice;
 	if (err)
diff --git a/fs/libfs.c b/fs/libfs.c
index 41c02c003265..4fed170dfe49 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1780,25 +1780,6 @@ static const struct dentry_operations generic_encrypted_dentry_ops = {
 };
 #endif
 
-/**
- * generic_set_encrypted_ci_d_ops - helper for setting d_ops for given dentry
- * @dentry:	dentry to set ops on
- *
- * Encryption works differently in that the only dentry operation it needs is
- * d_revalidate, which it only needs on dentries that have the no-key name flag.
- * The no-key flag can't be set "later", so we don't have to worry about that.
- */
-void generic_set_encrypted_ci_d_ops(struct dentry *dentry)
-{
-#ifdef CONFIG_FS_ENCRYPTION
-	if (dentry->d_flags & DCACHE_NOKEY_NAME) {
-		d_set_d_op(dentry, &generic_encrypted_dentry_ops);
-		return;
-	}
-#endif
-}
-EXPORT_SYMBOL(generic_set_encrypted_ci_d_ops);
-
 /**
  * inode_maybe_inc_iversion - increments i_version
  * @inode: inode with the i_version that should be updated
diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 3b13c648d490..51b9a10a9851 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -205,7 +205,6 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 	dbg_gen("'%pd' in dir ino %lu", dentry, dir->i_ino);
 
 	err = fscrypt_prepare_lookup(dir, dentry, &nm);
-	generic_set_encrypted_ci_d_ops(dentry);
 	if (err == -ENOENT)
 		return d_splice_alias(NULL, dentry);
 	if (err)
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 887a27d07f96..e5ae21f9f637 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3201,7 +3201,6 @@ extern int generic_file_fsync(struct file *, loff_t, loff_t, int);
 
 extern int generic_check_addressable(unsigned, u64);
 
-extern void generic_set_encrypted_ci_d_ops(struct dentry *dentry);
 extern const struct dentry_operations generic_ci_dentry_ops;
 
 int may_setattr(struct mnt_idmap *idmap, struct inode *inode,
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 12f9e455d569..97a11280c2bd 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -961,11 +961,11 @@ static inline int fscrypt_prepare_rename(struct inode *old_dir,
  * key is available, then the lookup is assumed to be by plaintext name;
  * otherwise, it is assumed to be by no-key name.
  *
- * This will set DCACHE_NOKEY_NAME on the dentry if the lookup is by no-key
- * name.  In this case the filesystem must assign the dentry a dentry_operations
- * which contains fscrypt_d_revalidate (or contains a d_revalidate method that
- * calls fscrypt_d_revalidate), so that the dentry will be invalidated if the
- * directory's encryption key is later added.
+ * This also optionally installs a custom ->d_revalidate() method which will
+ * invalidate the dentry if it was created without the key and the key is later
+ * added.  If the filesystem provides its own ->d_op hooks, they will be used
+ * instead, but then the filesystem must make sure to call fscrypt_d_revalidate
+ * in its d_revalidate hook, to check if fscrypt considers the dentry stale.
  *
  * Return: 0 on success; -ENOENT if the directory's key is unavailable but the
  * filename isn't a valid no-key name, so a negative dentry should be created;
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
