Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BE615625D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  8 Feb 2020 02:36:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=grxXT/Tjx9I4xC2Y3/yw+nH7ijmGGtoDvC27De8fOyk=; b=W4MGd92oQN/fPUmbdvd3AKSmt
	fr6RFvI0U4T3ImkrgiHJY6iX/6/jTR+48u0txDPv5BgeyBzezAITRJse69E0RdHsPRwRxMGDVwHTz
	NP7m0+Xp9pJHUnruC6tXdfRLf0hGNCkuWXvITGqzCOq47N/YYfM2C3SKDCP5NQ7Mo01YY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j0F2f-0006Wz-PO; Sat, 08 Feb 2020 01:36:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3iBA-XgYKAJk6KHL7G9HH9E7.5HF@flex--drosen.bounces.google.com>)
 id 1j0F2e-0006WX-6d
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 08 Feb 2020 01:36:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u/JnfqfNGIyu0nd68o7YqAhgzmEDUAvpvLabn2MnzDQ=; b=BKFhAU3gtrmT72RX5O/QR0nPq
 XOME56Pi89mx7VSUAFAhruqFlIIqBvRJ6eviPAn014CvdxHvGAqzjZZtxoG2KWbDeu5pKmNOONLR+
 kw3dLEZaBl8da3Ae0/i8PCNBJpIW6dABHd7tjq82GoXhwPn8kPlaQB8A4QkWCqSM0H5X0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u/JnfqfNGIyu0nd68o7YqAhgzmEDUAvpvLabn2MnzDQ=; b=fOiv4v3g4HZ9K6qZo9HgiVddwj
 jSindjorIMZSpwCf+FU1+E+/VrtZqvppgTeEGjd2g+AuiOiy0Cjn1gSvhtaT5BJHGeygRy2Z/RnGM
 cde2cGg/f0upco954/41kV95XDzLuj84m/IZjamjcfMId7FqX27q/9WyDxTRtknLFydg=;
Received: from mail-pl1-f201.google.com ([209.85.214.201])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1j0F2c-00DrQI-64
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 08 Feb 2020 01:36:15 +0000
Received: by mail-pl1-f201.google.com with SMTP id 36so623125plc.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 07 Feb 2020 17:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=u/JnfqfNGIyu0nd68o7YqAhgzmEDUAvpvLabn2MnzDQ=;
 b=qi6hH+g8A2tOnXrv6e/2ktRs8azAQwUa4eik1PW9fFC/on1QVYRt6mx1zRTTCg6ZL4
 4PLPJms/15mBGz7V1e3uNWcWf14g2q0GYIef3WkcY1ePchMw0ZvPpFN9Gf8MppPPm8Py
 J96WnaEK+ciSC0RRWk9RRXOwAvFqM2wg466NZpVWhjE4BkHO28IOlrhdx2uxKKceG/68
 66ibuWm+nhw+GWAN21uIGMbfGYEdKUCr/XY6YSeNsisvJ6Ri4LadbSUqlO57k5jSw+ir
 6RSVPhXPfB0duEc69ska1SVBlqHqaj10t3s3FcOAHlFOU09CBakLDdQJXJAwTfdF4u1q
 6BNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=u/JnfqfNGIyu0nd68o7YqAhgzmEDUAvpvLabn2MnzDQ=;
 b=eeBoIvoAnAJrRcJXKVN5WKv2a3QdxYU1UTrLcTGiQWFs+ajm/Q5mx/BZmVeNYAEb7e
 YzTjPRRtMvXxPTomEYfq2+5AivVUdB7AqrrRPxPcTMcT6yinEYZ1MAXc7WqZhhOMKf3k
 vf9qQSv/EgcEEkJRLcOJPyizkXOMDxFYGU6M4WawgEnvZvhocSpSYIqZS/acHp/Xj0Mc
 4zrLGyB4QiEm01TQZJIKs0zsY5HETdmJdDREK9P2KbcB6x1MGir4gT5ncMustqm5SKag
 gK8yEud+ud74KN86VWV/pARRtfvW5M44H3EhkYuRufaC1vZh+E8IeByJDMhc1Lxi6qYf
 qOhg==
X-Gm-Message-State: APjAAAVYUVN8Ar94di0js1l8yeWyywiWyBIasbrfPOvAJQsmhwhMIxy5
 4M/YJtpFE9R2LJnEemCy2vZk15GvSkI=
X-Google-Smtp-Source: APXvYqwX0BKSDJt6E69l+sKNQlU9x6vSpU7uhONO1FyDU+vIPvCd/6tEQzcHyLHyrAfNZ29zRmP2LbAccH4=
X-Received: by 2002:a63:551a:: with SMTP id j26mr2072946pgb.370.1581125768440; 
 Fri, 07 Feb 2020 17:36:08 -0800 (PST)
Date: Fri,  7 Feb 2020 17:35:49 -0800
In-Reply-To: <20200208013552.241832-1-drosen@google.com>
Message-Id: <20200208013552.241832-6-drosen@google.com>
Mime-Version: 1.0
References: <20200208013552.241832-1-drosen@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.201 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.201 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j0F2c-00DrQI-64
Subject: [f2fs-dev] [PATCH v7 5/8] fscrypt: Have filesystems handle their
 d_ops
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Daniel Rosenberg <drosen@google.com>, linux-doc@vger.kernel.org,
 kernel-team@android.com, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This shifts the responsibility of setting up dentry operations from
fscrypt to the individual filesystems, allowing them to have their own
operations while still setting fscrypt's d_revalidate as appropriate.

Also added helper function to libfs to unify ext4 and f2fs
implementations.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/crypto/fname.c           |  7 ++----
 fs/crypto/fscrypt_private.h |  1 -
 fs/crypto/hooks.c           |  1 -
 fs/ext4/dir.c               |  7 ------
 fs/ext4/namei.c             |  1 +
 fs/ext4/super.c             |  5 ----
 fs/f2fs/dir.c               |  7 ------
 fs/f2fs/f2fs.h              |  3 ---
 fs/f2fs/namei.c             |  1 +
 fs/f2fs/super.c             |  1 -
 fs/libfs.c                  | 50 +++++++++++++++++++++++++++++++++++++
 fs/ubifs/dir.c              | 18 +++++++++++++
 include/linux/fs.h          |  2 ++
 include/linux/fscrypt.h     |  6 +++--
 14 files changed, 78 insertions(+), 32 deletions(-)

diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index 4c212442a8f7f..14c585f66f8da 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -543,7 +543,7 @@ EXPORT_SYMBOL_GPL(fscrypt_fname_siphash);
  * Validate dentries in encrypted directories to make sure we aren't potentially
  * caching stale dentries after a key has been added.
  */
-static int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
+int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
 {
 	struct dentry *dir;
 	int err;
@@ -582,7 +582,4 @@ static int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
 
 	return valid;
 }
-
-const struct dentry_operations fscrypt_d_ops = {
-	.d_revalidate = fscrypt_d_revalidate,
-};
+EXPORT_SYMBOL(fscrypt_d_revalidate);
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 9aae851409e55..238075fcabb3e 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -250,7 +250,6 @@ extern int fscrypt_fname_encrypt(const struct inode *inode,
 extern bool fscrypt_fname_encrypted_size(const struct inode *inode,
 					 u32 orig_len, u32 max_len,
 					 u32 *encrypted_len_ret);
-extern const struct dentry_operations fscrypt_d_ops;
 
 /* hkdf.c */
 
diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 5ef861742921c..604a028dee25a 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -118,7 +118,6 @@ int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry,
 		spin_lock(&dentry->d_lock);
 		dentry->d_flags |= DCACHE_ENCRYPTED_NAME;
 		spin_unlock(&dentry->d_lock);
-		d_set_d_op(dentry, &fscrypt_d_ops);
 	}
 	return err;
 }
diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
index 128198ed1a96f..18b8da7ba92f6 100644
--- a/fs/ext4/dir.c
+++ b/fs/ext4/dir.c
@@ -665,10 +665,3 @@ const struct file_operations ext4_dir_operations = {
 	.open		= ext4_dir_open,
 	.release	= ext4_release_dir,
 };
-
-#ifdef CONFIG_UNICODE
-const struct dentry_operations ext4_dentry_ops = {
-	.d_hash = generic_ci_d_hash,
-	.d_compare = generic_ci_d_compare,
-};
-#endif
diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 53ce3c331528e..e4715c154b60f 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1614,6 +1614,7 @@ static struct buffer_head *ext4_lookup_entry(struct inode *dir,
 	struct buffer_head *bh;
 
 	err = ext4_fname_prepare_lookup(dir, dentry, &fname);
+	generic_set_encrypted_ci_d_ops(dir, dentry);
 	if (err == -ENOENT)
 		return NULL;
 	if (err)
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 9717c802d889d..4d866c3b8bdbf 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -4542,11 +4542,6 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
 		goto failed_mount4;
 	}
 
-#ifdef CONFIG_UNICODE
-	if (sb->s_encoding)
-		sb->s_d_op = &ext4_dentry_ops;
-#endif
-
 	sb->s_root = d_make_root(root);
 	if (!sb->s_root) {
 		ext4_msg(sb, KERN_ERR, "get root dentry failed");
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index d822c0d5eb182..38c0e6d589be4 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -1077,10 +1077,3 @@ const struct file_operations f2fs_dir_operations = {
 	.compat_ioctl   = f2fs_compat_ioctl,
 #endif
 };
-
-#ifdef CONFIG_UNICODE
-const struct dentry_operations f2fs_dentry_ops = {
-	.d_hash = generic_ci_d_hash,
-	.d_compare = generic_ci_d_compare,
-};
-#endif
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e73b8752f9c8d..0fc153b5a5c09 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3626,9 +3626,6 @@ static inline void update_sit_info(struct f2fs_sb_info *sbi) {}
 #endif
 
 extern const struct file_operations f2fs_dir_operations;
-#ifdef CONFIG_UNICODE
-extern const struct dentry_operations f2fs_dentry_ops;
-#endif
 extern const struct file_operations f2fs_file_operations;
 extern const struct inode_operations f2fs_file_inode_operations;
 extern const struct address_space_operations f2fs_dblock_aops;
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 2aa035422c0fa..24d68eafffa40 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -494,6 +494,7 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 	}
 
 	err = fscrypt_prepare_lookup(dir, dentry, &fname);
+	generic_set_encrypted_ci_d_ops(dir, dentry);
 	if (err == -ENOENT)
 		goto out_splice;
 	if (err)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 89b52629bd437..7520a9c04c75e 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3256,7 +3256,6 @@ static int f2fs_setup_casefold(struct f2fs_sb_info *sbi)
 
 		sbi->sb->s_encoding = encoding;
 		sbi->sb->s_encoding_flags = encoding_flags;
-		sbi->sb->s_d_op = &f2fs_dentry_ops;
 	}
 #else
 	if (f2fs_sb_has_casefold(sbi)) {
diff --git a/fs/libfs.c b/fs/libfs.c
index 433c283df3099..75dcf1e1a0488 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1437,4 +1437,54 @@ int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
 	return ret;
 }
 EXPORT_SYMBOL(generic_ci_d_hash);
+
+static const struct dentry_operations generic_ci_dentry_ops = {
+	.d_hash = generic_ci_d_hash,
+	.d_compare = generic_ci_d_compare,
+};
+#endif
+
+#ifdef CONFIG_FS_ENCRYPTION
+static const struct dentry_operations generic_encrypted_dentry_ops = {
+	.d_revalidate = fscrypt_d_revalidate,
+};
+#endif
+
+#if IS_ENABLED(CONFIG_UNICODE) && IS_ENABLED(CONFIG_FS_ENCRYPTION)
+static const struct dentry_operations generic_encrypted_ci_dentry_ops = {
+	.d_hash = generic_ci_d_hash,
+	.d_compare = generic_ci_d_compare,
+	.d_revalidate = fscrypt_d_revalidate,
+};
+#endif
+
+/**
+ * generic_set_encrypted_ci_d_ops - helper for setting d_ops for given dentry
+ * @dir:	parent of dentry whose ops to set
+ * @dentry:	detnry to set ops on
+ *
+ * This function sets the dentry ops for the given dentry to handle both
+ * casefolding and encryption of the dentry name.
+ */
+void generic_set_encrypted_ci_d_ops(struct inode *dir, struct dentry *dentry)
+{
+#ifdef CONFIG_FS_ENCRYPTION
+	if (dentry->d_flags & DCACHE_ENCRYPTED_NAME) {
+#ifdef CONFIG_UNICODE
+		if (dir->i_sb->s_encoding) {
+			d_set_d_op(dentry, &generic_encrypted_ci_dentry_ops);
+			return;
+		}
 #endif
+		d_set_d_op(dentry, &generic_encrypted_dentry_ops);
+		return;
+	}
+#endif
+#ifdef CONFIG_UNICODE
+	if (dir->i_sb->s_encoding) {
+		d_set_d_op(dentry, &generic_ci_dentry_ops);
+		return;
+	}
+#endif
+}
+EXPORT_SYMBOL(generic_set_encrypted_ci_d_ops);
diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index ef85ec167a843..f3c96d99c0514 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -196,6 +196,7 @@ static int dbg_check_name(const struct ubifs_info *c,
 	return 0;
 }
 
+static void ubifs_set_d_ops(struct inode *dir, struct dentry *dentry);
 static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 				   unsigned int flags)
 {
@@ -209,6 +210,7 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 	dbg_gen("'%pd' in dir ino %lu", dentry, dir->i_ino);
 
 	err = fscrypt_prepare_lookup(dir, dentry, &nm);
+	ubifs_set_d_ops(dir, dentry);
 	if (err == -ENOENT)
 		return d_splice_alias(NULL, dentry);
 	if (err)
@@ -1655,3 +1657,19 @@ const struct file_operations ubifs_dir_operations = {
 	.compat_ioctl   = ubifs_compat_ioctl,
 #endif
 };
+
+#ifdef CONFIG_FS_ENCRYPTION
+static const struct dentry_operations ubifs_encrypted_dentry_ops = {
+	.d_revalidate = fscrypt_d_revalidate,
+};
+#endif
+
+static void ubifs_set_d_ops(struct inode *dir, struct dentry *dentry)
+{
+#ifdef CONFIG_FS_ENCRYPTION
+	if (dentry->d_flags & DCACHE_ENCRYPTED_NAME) {
+		d_set_d_op(dentry, &ubifs_encrypted_dentry_ops);
+		return;
+	}
+#endif
+}
diff --git a/include/linux/fs.h b/include/linux/fs.h
index a260afbc06d22..a72ae9f14d016 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3382,6 +3382,8 @@ static inline bool needs_casefold(const struct inode *dir)
 	return 0;
 }
 #endif
+extern void generic_set_encrypted_ci_d_ops(struct inode *dir,
+					   struct dentry *dentry);
 
 #ifdef CONFIG_MIGRATION
 extern int buffer_migrate_page(struct address_space *,
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 556f4adf5dc58..340ef5b88772f 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -134,6 +134,7 @@ static inline struct page *fscrypt_pagecache_page(struct page *bounce_page)
 }
 
 extern void fscrypt_free_bounce_page(struct page *bounce_page);
+extern int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags);
 
 /* policy.c */
 extern int fscrypt_ioctl_set_policy(struct file *, const void __user *);
@@ -595,8 +596,9 @@ static inline int fscrypt_prepare_rename(struct inode *old_dir,
  * filenames are presented in encrypted form.  Therefore, we'll try to set up
  * the directory's encryption key, but even without it the lookup can continue.
  *
- * This also installs a custom ->d_revalidate() method which will invalidate the
- * dentry if it was created without the key and the key is later added.
+ * After calling this function, a filesystem should ensure that it's dentry
+ * operations contain fscrypt_d_revalidate if DCACHE_ENCRYPTED_NAME was set,
+ * so that the dentry can be invalidated if the key is later added.
  *
  * Return: 0 on success; -ENOENT if key is unavailable but the filename isn't a
  * correctly formed encoded ciphertext name, so a negative dentry should be
-- 
2.25.0.341.g760bfbb309-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
