Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7036414C33E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Jan 2020 00:04:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/QftKtoePuupvIA2ITb61XZoRzWrTVt2+0XdO8/PBvU=; b=jLX81wXvPKjNmywEf1kO4X3Q6
	OvOK6JTKRqRKgDqapr0+pTYmLNK5xvUJpphBRnTOAr+znEpNadxsExr3yPTdquqx2f2CWLFxjpgnv
	UTJbDE1LUW5dUcRpz4Z46hdwhV6j/4ALjn1IP5syeyvVNyaCAVEBwTiDN3EHRhdzOvKCs=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iwZuO-0002xT-E5; Tue, 28 Jan 2020 23:04:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3-70wXgYKADIRfcgSbUccUZS.Qca@flex--drosen.bounces.google.com>)
 id 1iwZuM-0002xM-M0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jan 2020 23:04:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mElFIdvBM3FgdGB0giYU6HDPGvPw1H28aWg24e0T+3U=; b=kfhHkewnZk6pWmcCtjdI2Vskg
 XjgdKnrRbhuW/syv6L3+or01llkx0FVWMTnzLRwyqj/JHZsJLFborps9py0HO/AE62ZzAbgdZg4Wm
 lcvvtq76xph4HKz0oTU9/0pZ7yUQN3y5CPLR8QwnwUVyDWFuqb/C4DGsi8zrwHhap2aFU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mElFIdvBM3FgdGB0giYU6HDPGvPw1H28aWg24e0T+3U=; b=Xn8s/kh6FaiehDOGf0iVfjpASB
 Ado+EGIrXJ+ONggglrvA31fRbdFCVeRosJg0HBYSjWf/MxdtMkqguL462DdqrGN1zIObw67YhP2vX
 MTZfDmC32RgCPbQ6vhWmY4HyltOj1frrDvF8k6NtlS0FuBL61j0zo+KjXDN0zXtoFdU0=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iwZuL-003MOG-6c
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jan 2020 23:04:34 +0000
Received: by mail-yb1-f202.google.com with SMTP id m198so11399568ybf.16
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 28 Jan 2020 15:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=mElFIdvBM3FgdGB0giYU6HDPGvPw1H28aWg24e0T+3U=;
 b=cXNbbRcyrelz0jOl2nvYUhZR0khX1j2sYss4IC893Ev8GOU2MebqbJTfvBhbyQsJh2
 xkh1fFXfE6QPtT8hh9oEQ3DhgBSMIXqRJigLbQth/siAHkrARXTlwFCtgAl1MVhXRq77
 r9EJaH4xPCIvmzuMI4QPhWTwdJZUapVVwWWASS0hURiDh9ueheQefkmcBW7GF3KQAKCn
 5xKOXlOg4AmIt8DVUvuMbj/qZ8FuWqKeqKSwbLYcx+B2lO11AyycX+c/WSOsJDylbYLX
 Dr5/siXnPwfQJc7htzkSbkKzrWiV1Hyb6VnBCQlBIcgKyCoXBmXSzU2dbeFyOjoRXDAv
 Mmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=mElFIdvBM3FgdGB0giYU6HDPGvPw1H28aWg24e0T+3U=;
 b=HPNbK6OnmLc3zvBYq5wWttmSQZHnYjSTt01AAttd2LCklK7Vs14pIQkeDcHPv1Hq+2
 f0xqbV/IFKUUuqjfNB6xcBvHnVYl5Xc2Lx2zllTPZXSK5KFaHceZnPX8j4XZ2bdWUMx/
 uvf6iuV0FHAWrugx1xulb3PBQ2IxjDb8tyLy1Inl2vy1x4VuIcjy/kYvAPbQgklfbfhA
 +BWCTsZaH3+qeXHMQWfy1V+q4AcMcxmC9F05UWa8tCqe313zOlJpJcZ7i7jMMlW840CY
 wkSR93KK3WONTJdLdZhrJ2buqHy/JetdhdXfLS1q2DIs3Fsf2IRi4MyeWglMqSXtDtQL
 VHow==
X-Gm-Message-State: APjAAAVQzHJcWD7Ya5m/xsuJIVOtFOTa3GNGc0u1Gn6wfJStiOn+9MhL
 Tyrqsnapno0h9UYkzZhLTJwjoj9OReA=
X-Google-Smtp-Source: APXvYqzug8KWZlPUy3/Yz2b4ek47NyWDHtbXlwYF/G5a0Yo/bopE+QqltsTeIVVMCdKPONoQ0Y2jppnMi8o=
X-Received: by 2002:a81:6fd4:: with SMTP id
 k203mr17341377ywc.370.1580252667044; 
 Tue, 28 Jan 2020 15:04:27 -0800 (PST)
Date: Tue, 28 Jan 2020 15:03:25 -0800
In-Reply-To: <20200128230328.183524-1-drosen@google.com>
Message-Id: <20200128230328.183524-3-drosen@google.com>
Mime-Version: 1.0
References: <20200128230328.183524-1-drosen@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.202 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1iwZuL-003MOG-6c
Subject: [f2fs-dev] [PATCH v6 2/5] fscrypt: Have filesystems handle their
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

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---

Should the d_op setting functions go into fs/libfs.c?

 fs/crypto/fname.c           |  7 ++-----
 fs/crypto/fscrypt_private.h |  1 -
 fs/crypto/hooks.c           |  1 -
 fs/ext4/dir.c               | 38 ++++++++++++++++++++++++++++++++++++-
 fs/ext4/ext4.h              |  1 +
 fs/ext4/namei.c             |  1 +
 fs/ext4/super.c             |  5 -----
 fs/f2fs/dir.c               | 38 ++++++++++++++++++++++++++++++++++++-
 fs/f2fs/f2fs.h              |  4 +---
 fs/f2fs/namei.c             |  1 +
 fs/f2fs/super.c             |  1 -
 fs/ubifs/dir.c              | 18 ++++++++++++++++++
 include/linux/fscrypt.h     |  6 ++++--
 13 files changed, 102 insertions(+), 20 deletions(-)

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
index e9f7c32089dfc..c98c788301e9c 100644
--- a/fs/ext4/dir.c
+++ b/fs/ext4/dir.c
@@ -668,8 +668,44 @@ const struct file_operations ext4_dir_operations = {
 };
 
 #ifdef CONFIG_UNICODE
-const struct dentry_operations ext4_dentry_ops = {
+static const struct dentry_operations ext4_ci_dentry_ops = {
 	.d_hash = utf8_ci_d_hash,
 	.d_compare = utf8_ci_d_compare,
 };
 #endif
+
+#ifdef CONFIG_FS_ENCRYPTION
+static const struct dentry_operations ext4_encrypted_dentry_ops = {
+	.d_revalidate = fscrypt_d_revalidate,
+};
+#endif
+
+#if IS_ENABLED(CONFIG_UNICODE) && IS_ENABLED(CONFIG_FS_ENCRYPTION)
+static const struct dentry_operations ext4_encrypted_ci_dentry_ops = {
+	.d_hash = utf8_ci_d_hash,
+	.d_compare = utf8_ci_d_compare,
+	.d_revalidate = fscrypt_d_revalidate,
+};
+#endif
+
+void ext4_set_d_ops(struct inode *dir, struct dentry *dentry)
+{
+#ifdef CONFIG_FS_ENCRYPTION
+	if (dentry->d_flags & DCACHE_ENCRYPTED_NAME) {
+#ifdef CONFIG_UNICODE
+		if (dir->i_sb->s_encoding) {
+			d_set_d_op(dentry, &ext4_encrypted_ci_dentry_ops);
+			return;
+		}
+#endif
+		d_set_d_op(dentry, &ext4_encrypted_dentry_ops);
+		return;
+	}
+#endif
+#ifdef CONFIG_UNICODE
+	if (dir->i_sb->s_encoding) {
+		d_set_d_op(dentry, &ext4_ci_dentry_ops);
+		return;
+	}
+#endif
+}
diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 3162ef2e53d46..9dc0e2c6f7d7c 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -2494,6 +2494,7 @@ static inline  unsigned char get_dtype(struct super_block *sb, int filetype)
 }
 extern int ext4_check_all_de(struct inode *dir, struct buffer_head *bh,
 			     void *buf, int buf_size);
+void ext4_set_d_ops(struct inode *dir, struct dentry *dentry);
 
 /* fsync.c */
 extern int ext4_sync_file(struct file *, loff_t, loff_t, int);
diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 7f4e625ab2f9b..80b5cc41851f3 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1608,6 +1608,7 @@ static struct buffer_head *ext4_lookup_entry(struct inode *dir,
 	struct buffer_head *bh;
 
 	err = ext4_fname_prepare_lookup(dir, dentry, &fname);
+	ext4_set_d_ops(dir, dentry);
 	if (err == -ENOENT)
 		return NULL;
 	if (err)
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index b7e9f0310ec23..11584bdc3e237 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -4497,11 +4497,6 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
 		goto failed_mount4;
 	}
 
-#ifdef CONFIG_UNICODE
-	if (sbi->s_encoding)
-		sb->s_d_op = &ext4_dentry_ops;
-#endif
-
 	sb->s_root = d_make_root(root);
 	if (!sb->s_root) {
 		ext4_msg(sb, KERN_ERR, "get root dentry failed");
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index a1dd9939e20bf..f1e7dc4ae5256 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -1065,8 +1065,44 @@ const struct file_operations f2fs_dir_operations = {
 };
 
 #ifdef CONFIG_UNICODE
-const struct dentry_operations f2fs_dentry_ops = {
+static const struct dentry_operations f2fs_ci_dentry_ops = {
 	.d_hash = utf8_ci_d_hash,
 	.d_compare = utf8_ci_d_compare,
 };
 #endif
+
+#ifdef CONFIG_FS_ENCRYPTION
+static const struct dentry_operations f2fs_encrypted_dentry_ops = {
+	.d_revalidate = fscrypt_d_revalidate,
+};
+#endif
+
+#if IS_ENABLED(CONFIG_UNICODE) && IS_ENABLED(CONFIG_FS_ENCRYPTION)
+static const struct dentry_operations f2fs_encrypted_ci_dentry_ops = {
+	.d_hash = utf8_ci_d_hash,
+	.d_compare = utf8_ci_d_compare,
+	.d_revalidate = fscrypt_d_revalidate,
+};
+#endif
+
+void f2fs_set_d_ops(struct inode *dir, struct dentry *dentry)
+{
+#ifdef CONFIG_FS_ENCRYPTION
+	if (dentry->d_flags & DCACHE_ENCRYPTED_NAME) {
+#ifdef CONFIG_UNICODE
+		if (dir->i_sb->s_encoding) {
+			d_set_d_op(dentry, &f2fs_encrypted_ci_dentry_ops);
+			return;
+		}
+#endif
+		d_set_d_op(dentry, &f2fs_encrypted_dentry_ops);
+		return;
+	}
+#endif
+#ifdef CONFIG_UNICODE
+	if (dir->i_sb->s_encoding) {
+		d_set_d_op(dentry, &f2fs_ci_dentry_ops);
+		return;
+	}
+#endif
+}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9f302de477022..cc767dd4d5352 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3017,6 +3017,7 @@ static inline int f2fs_add_link(struct dentry *dentry, struct inode *inode)
 	return f2fs_do_add_link(d_inode(dentry->d_parent), &dentry->d_name,
 				inode, inode->i_ino, inode->i_mode);
 }
+void f2fs_set_d_ops(struct inode *dir, struct dentry *dentry);
 
 /*
  * super.c
@@ -3481,9 +3482,6 @@ static inline void f2fs_destroy_root_stats(void) { }
 #endif
 
 extern const struct file_operations f2fs_dir_operations;
-#ifdef CONFIG_UNICODE
-extern const struct dentry_operations f2fs_dentry_ops;
-#endif
 extern const struct file_operations f2fs_file_operations;
 extern const struct inode_operations f2fs_file_inode_operations;
 extern const struct address_space_operations f2fs_dblock_aops;
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index a1c507b0b4ac4..47095578aeea1 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -443,6 +443,7 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 	}
 
 	err = fscrypt_prepare_lookup(dir, dentry, &fname);
+	f2fs_set_d_ops(dir, dentry);
 	if (err == -ENOENT)
 		goto out_splice;
 	if (err)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 5de587f20ed35..0f7ef0896655a 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3169,7 +3169,6 @@ static int f2fs_setup_casefold(struct f2fs_sb_info *sbi)
 
 		sbi->sb->s_encoding = encoding;
 		sbi->sb->s_encoding_flags = encoding_flags;
-		sbi->sb->s_d_op = &f2fs_dentry_ops;
 	}
 #else
 	if (f2fs_sb_has_casefold(sbi)) {
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
