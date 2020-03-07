Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3586217CB22
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 Mar 2020 03:37:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MHEnL7dsWpEh6YId1niMGvzNBJikoQ8au9+rMMJKz/M=; b=afnFhhGSBjZlic47k8Cjr7Gef
	Wq1Q1HoaynrDf4NLqP6MOWuGsCrRFWSmGrk3BN8kcUmr07tHbqJqWIT3lq6lXYtrm+71e/xD/uSeB
	UPMyIyC75NIvJMSdYG2mPz015PqV0juqWFJh1kVx++F1fDp2lao9Lk1otItY5aYl4850M=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jAPKo-00030I-Ig; Sat, 07 Mar 2020 02:37:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3wghjXgYKAFk4IFJ5E7FF7C5.3FD@flex--drosen.bounces.google.com>)
 id 1jAPKn-000301-FH
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 Mar 2020 02:37:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XT08hOejbbga3cs0gkN59AERTnxd/bHRXMd8cI0IuPo=; b=TsXZfTTMaIG+wol3fsUdIeSQO
 Wy+DkgjNYGz2iMnTA0+pD+YHNrqa3fvE9IDntaU8s0c0CDG+B/qFh5TB5tHQQhV70BxSPWms11ImZ
 oMdWynSRrB+OyMlp+xbOUN9Kv1557Nl0XtXcWBYkD1Kra2hhjNaQrMZRpjEVpAinqbhiI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XT08hOejbbga3cs0gkN59AERTnxd/bHRXMd8cI0IuPo=; b=BG5rdl5Uwb8ZtDK64BezuXHZpK
 pRP8wUFNOWobMfMP/KgxhM1YEkTIHQrfFsX15d0cWCDdXLHDN5StQq938f1murD7+1TwLE4D4KlSX
 k6VggmWp4yf6U5l9T8DQ4/Dsf0jC8a4IAuB97PSvWxLEJIxuDnA3usAmEV8+1avgZsx0=;
Received: from mail-pj1-f73.google.com ([209.85.216.73])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jAPKl-00AvYy-JH
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 Mar 2020 02:37:01 +0000
Received: by mail-pj1-f73.google.com with SMTP id z20so2344907pjn.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 06 Mar 2020 18:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=XT08hOejbbga3cs0gkN59AERTnxd/bHRXMd8cI0IuPo=;
 b=X9NA3RR8wEBA5qw3Z5n1vBh1erNR8U2uvYLrlG2Pz4W19nCSzrOmNxjUUsD9cjN7l8
 WVDRp8V5+W/y6BfyKPxpDOBYKMrwy57Z6x/kfQ3/7OzaGJO7o86cUr7mnsj+aBUE+zqR
 XnLXdb9mf8IgEMgWYNfXpFZDoQ273FVQsWRmiYAqSVLT6fMgg3k+3M/VYHcV222zXKKL
 zDnCw2pnIPZkhIq+ALc95xvx6jtcQGuO2uurK8wTXNceWzGYEuvNZ8xjd5FtSHNl9f1M
 QuA+j8TIf1yzySx/jJZ4PwLRMs6mmpVXIcEEMHgNF+CV543Hj19siwpH4wXy62/3XclN
 ON7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=XT08hOejbbga3cs0gkN59AERTnxd/bHRXMd8cI0IuPo=;
 b=pf6Hjch3v1F5t+dXz+qoQ3qY8TdCzwxRVHEIJFOxLMeqit86/vQFCGb8LL7/Jdnra4
 HbxupYkKX17sUgMOuohPMY14YFCjRTINb3Vt0zrladkwoVZ0/636vfAIO2uvTTYBEMjK
 bGQIalCLp62DWRhHBUNwsAIDyKW0SnQ4g9yZQG5Qe7uWvPUVyoMbhVMcbx46Y4oH5GZ7
 PKfL4pU6m6eQZcFScsgZVgicKPuBmplm+hyQ3UZiphX1XwW0jY4aSpyd4tqbnZeCOa0e
 1trHMUm32+recGijl+hlefpORVgZCxfTVoNM7u8/2fI9J0YXKvggNYA0bK7FVLJJkORP
 mlSQ==
X-Gm-Message-State: ANhLgQ3FtshlZsVS4xhLJuaBwxARWGDjKe7SEr1v8aTkgDhl0462wbdT
 6j20dnWHpWUJkcVDl4Uj9/XjjL7JjR4=
X-Google-Smtp-Source: ADFU+vvFHEuePYm3BfnwmUcH0p75fWTfx4vDetIDszFNYcIBXq3YN4hujAFnXJHbSX9RXfIfUgFsbgd7Q7k=
X-Received: by 2002:a17:90a:33b0:: with SMTP id
 n45mr968921pjb.186.1583548610546; 
 Fri, 06 Mar 2020 18:36:50 -0800 (PST)
Date: Fri,  6 Mar 2020 18:36:10 -0800
In-Reply-To: <20200307023611.204708-1-drosen@google.com>
Message-Id: <20200307023611.204708-8-drosen@google.com>
Mime-Version: 1.0
References: <20200307023611.204708-1-drosen@google.com>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.73 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.73 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jAPKl-00AvYy-JH
Subject: [f2fs-dev] [PATCH v8 7/8] fscrypt: Have filesystems handle their
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

Most filesystems can just use generic_set_encrypted_ci_d_ops, unless
they have their own specific dentry operations as well. That operation
will set the minimal d_ops required under the circumstances.

Since the fscrypt d_ops are set later on, we must set all d_ops there,
since we cannot adjust those later on. This should not result in any
change in behavior.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/crypto/fname.c           | 4 ----
 fs/crypto/fscrypt_private.h | 1 -
 fs/crypto/hooks.c           | 1 -
 fs/ext4/dir.c               | 7 -------
 fs/ext4/ext4.h              | 4 ----
 fs/ext4/namei.c             | 1 +
 fs/ext4/super.c             | 5 -----
 fs/f2fs/dir.c               | 7 -------
 fs/f2fs/f2fs.h              | 3 ---
 fs/f2fs/namei.c             | 1 +
 fs/f2fs/super.c             | 1 -
 fs/ubifs/dir.c              | 1 +
 include/linux/fscrypt.h     | 5 +++--
 13 files changed, 6 insertions(+), 35 deletions(-)

diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index 73adbbb9d78c7..14c585f66f8da 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -582,8 +582,4 @@ int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
 
 	return valid;
 }
-
-const struct dentry_operations fscrypt_d_ops = {
-	.d_revalidate = fscrypt_d_revalidate,
-};
 EXPORT_SYMBOL(fscrypt_d_revalidate);
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
index 04fd68c4adc5f..b31780cae9c1f 100644
--- a/fs/ext4/dir.c
+++ b/fs/ext4/dir.c
@@ -667,10 +667,3 @@ const struct file_operations ext4_dir_operations = {
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
diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index b912c5611ddad..a01a507731d41 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -3169,10 +3169,6 @@ static inline void ext4_unlock_group(struct super_block *sb,
 /* dir.c */
 extern const struct file_operations ext4_dir_operations;
 
-#ifdef CONFIG_UNICODE
-extern const struct dentry_operations ext4_dentry_ops;
-#endif
-
 /* file.c */
 extern const struct inode_operations ext4_file_inode_operations;
 extern const struct file_operations ext4_file_operations;
diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 1a1c4fdcfd3ee..001fdb0da477e 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1615,6 +1615,7 @@ static struct buffer_head *ext4_lookup_entry(struct inode *dir,
 	struct buffer_head *bh;
 
 	err = ext4_fname_prepare_lookup(dir, dentry, &fname);
+	generic_set_encrypted_ci_d_ops(dir, dentry);
 	if (err == -ENOENT)
 		return NULL;
 	if (err)
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 11a7af11d8aee..c732122b25739 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -4570,11 +4570,6 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
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
diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index ef85ec167a843..dc3af703db30d 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -209,6 +209,7 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 	dbg_gen("'%pd' in dir ino %lu", dentry, dir->i_ino);
 
 	err = fscrypt_prepare_lookup(dir, dentry, &nm);
+	generic_set_encrypted_ci_d_ops(dir, dentry);
 	if (err == -ENOENT)
 		return d_splice_alias(NULL, dentry);
 	if (err)
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index b199b6e976ce3..f99e402abb540 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -596,8 +596,9 @@ static inline int fscrypt_prepare_rename(struct inode *old_dir,
  * filenames are presented in encrypted form.  Therefore, we'll try to set up
  * the directory's encryption key, but even without it the lookup can continue.
  *
- * This also installs a custom ->d_revalidate() method which will invalidate the
- * dentry if it was created without the key and the key is later added.
+ * After calling this function, a filesystem should ensure that its dentry
+ * operations contain fscrypt_d_revalidate if DCACHE_ENCRYPTED_NAME was set,
+ * so that the dentry can be invalidated if the key is later added.
  *
  * Return: 0 on success; -ENOENT if key is unavailable but the filename isn't a
  * correctly formed encoded ciphertext name, so a negative dentry should be
-- 
2.25.1.481.gfbce0eb801-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
