Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5DD2B767A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Nov 2020 07:49:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0J1T7fr4q+tUqfZC7oiuOV8eoRy3TEBRKY3S232D0EE=; b=GlIJ9ZsQx5gDvh96GhPuLKWuF
	6itBLRkV33yRHZkfF0+h0ZVOCqjdRdbZt8hDoX8exhfl/Gh2D/1Tld9/Ju5M0DdJRIaI6nt/drenA
	wDxalh6YYBnGtKxImucjankyvXQexhLuj4Es8qSeIW/6QXvH0rh+v1rR0m04kPEK97gFU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kfHHs-0000XY-28; Wed, 18 Nov 2020 06:49:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3bcK0XwYKAMgr526s1u22uzs.q20@flex--drosen.bounces.google.com>)
 id 1kfHHq-0000XB-Bd
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 06:49:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tb4l37XCxNgRkiCuLXd252PTPoP0yAHbX6esqKI6HxE=; b=dvKOYDCTcUPkpqt2kur0fdxOB
 UCqX0sJImrsxo3XD86z2c5M0pPkmx5x2JkhBwbulwsOL9HZqEnHSd8OceCrvXdJU9ceH5hW/8mLYP
 xXHcEpFipA2V4EusMCl4wuKPlWvGpMwPXNd2mns+7n4nqbdp8wb/nlHxtDOJwYQdqLV40=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Tb4l37XCxNgRkiCuLXd252PTPoP0yAHbX6esqKI6HxE=; b=A64WpB6ne2N5q1Wi8797nuCHby
 UkyozrJBhVJz/hM3kPtZdLGxmHOJhEGGBQyOxOdc3bzBOyrfEaLjK2NImd0ocOnOKuAKGq14kUI7V
 cn3afMyBi2WPvl/kWUtWr0ae4HDqhStQIPPhI+4otmbga3zmCaFbvJKPXN6/JPOeGwFc=;
Received: from mail-qv1-f74.google.com ([209.85.219.74])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kfHHa-00CWVZ-Fy
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 06:49:50 +0000
Received: by mail-qv1-f74.google.com with SMTP id x9so660322qvt.16
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Nov 2020 22:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=Tb4l37XCxNgRkiCuLXd252PTPoP0yAHbX6esqKI6HxE=;
 b=pXiZqbdjpI6FS+Nf9Oz84U4XDsvhLq2We74VTam9v7kAlE0+2Xxv1TlYPBzVZZO9DD
 Jd/2kykrIKxXqiqyKKlcEHXrxkgQmQpQmQmy/e4n+k6my/OuywIvWTasP7fN3aEjMvAv
 PajpYYF2Lw3l+ZMsWfc5EJGqlzeNJZEqGbcRoHEX1z7gbxW72W+DcFvJ4r1oNEV3jPnE
 HJ/jehb0QhtLvpaW9QPr8SnfHyIUvDC0FZkgCwVrKj/JDS2MTTZZn25Cq6ZnDqWuDUiR
 2XD02y2Pz7Jn93zvoRFTsJjbcGiBjfnw+Q8isem7eovK3mUnMMR/lypa8ORR6FAqvrNU
 Qxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Tb4l37XCxNgRkiCuLXd252PTPoP0yAHbX6esqKI6HxE=;
 b=PGBSYKHzNd+eSTHv72yyA1t12NXiH9qarSalFUD8kYNHmwi4wkawRy+5Enu85UnXoG
 GKGub+2PERuffQq/DMCLa15glSddQRGJmr+D35vSzZIaA7/LdUbxJkfMS1jtai/6Njrz
 4T2FH7PbFyf4n/zkY3vK0H4mj2pXNMV/kEvuCyXsXa7/p6kZrNN0LN90xprz00JKMBuJ
 1GXhP8RlW39BAXOw6jSN4tZlCmsu1DaoFY9R7U/m/qM2t0UnRwR8c+K11hObQeMnWOsB
 CqStDoR46LE2jYtFV+HDjgpcizYF58PBF2X+7S8ZSucPz6jh1Yx/byzTbPcZ8BrsdDAx
 wVUg==
X-Gm-Message-State: AOAM531jkQfPNQ93k52TWQ50O+Y6KP+DiD5Cfnvfza4/mMAuq4gxH4Ly
 D8nClwyYGqqmux3FRexTbL3hfQ3vre4=
X-Google-Smtp-Source: ABdhPJwv3G3ea/OrqQGgB923Wo3qJWcLBr01dzKqbBgRqsKQzZGH5UojLSFhgI5S2N6gk77lAXmR2ZNhFJI=
X-Received: from drosen.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:4e6f])
 (user=drosen job=sendgmr) by 2002:ad4:4ae4:: with SMTP id
 cp4mr3102637qvb.21.1605681773366; 
 Tue, 17 Nov 2020 22:42:53 -0800 (PST)
Date: Wed, 18 Nov 2020 06:42:44 +0000
In-Reply-To: <20201118064245.265117-1-drosen@google.com>
Message-Id: <20201118064245.265117-3-drosen@google.com>
Mime-Version: 1.0
References: <20201118064245.265117-1-drosen@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Chao Yu <chao@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.74 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.74 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kfHHa-00CWVZ-Fy
Subject: [f2fs-dev] [PATCH v3 2/3] fscrypt: Have filesystems handle their
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
Cc: Daniel Rosenberg <drosen@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
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
 fs/crypto/fname.c       | 4 ----
 fs/crypto/hooks.c       | 1 -
 fs/ext4/dir.c           | 7 -------
 fs/ext4/ext4.h          | 4 ----
 fs/ext4/namei.c         | 1 +
 fs/ext4/super.c         | 5 -----
 fs/f2fs/dir.c           | 7 -------
 fs/f2fs/f2fs.h          | 3 ---
 fs/f2fs/namei.c         | 1 +
 fs/f2fs/super.c         | 1 -
 fs/ubifs/dir.c          | 1 +
 include/linux/fscrypt.h | 7 +++++--
 12 files changed, 8 insertions(+), 34 deletions(-)

diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index 1fbe6c24d705..cb3cfa6329ba 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -570,7 +570,3 @@ int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
 	return valid;
 }
 EXPORT_SYMBOL_GPL(fscrypt_d_revalidate);
-
-const struct dentry_operations fscrypt_d_ops = {
-	.d_revalidate = fscrypt_d_revalidate,
-};
diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 20b0df47fe6a..9006fa983335 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -117,7 +117,6 @@ int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry,
 		spin_lock(&dentry->d_lock);
 		dentry->d_flags |= DCACHE_NOKEY_NAME;
 		spin_unlock(&dentry->d_lock);
-		d_set_d_op(dentry, &fscrypt_d_ops);
 	}
 	return err;
 }
diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
index ca50c90adc4c..e757319a4472 100644
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
index bf9429484462..ad77f01d9e20 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -3380,10 +3380,6 @@ static inline void ext4_unlock_group(struct super_block *sb,
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
index 33509266f5a0..12a417ff5648 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1614,6 +1614,7 @@ static struct buffer_head *ext4_lookup_entry(struct inode *dir,
 	struct buffer_head *bh;
 
 	err = ext4_fname_prepare_lookup(dir, dentry, &fname);
+	generic_set_encrypted_ci_d_ops(dentry);
 	if (err == -ENOENT)
 		return NULL;
 	if (err)
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 6633b20224d5..0288bedf46e1 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -4968,11 +4968,6 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
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
index 4b9ef8bbfa4a..71fdf5076461 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -1099,10 +1099,3 @@ const struct file_operations f2fs_dir_operations = {
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
index cb700d797296..62b4f31d30e2 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3767,9 +3767,6 @@ static inline void f2fs_update_sit_info(struct f2fs_sb_info *sbi) {}
 #endif
 
 extern const struct file_operations f2fs_dir_operations;
-#ifdef CONFIG_UNICODE
-extern const struct dentry_operations f2fs_dentry_ops;
-#endif
 extern const struct file_operations f2fs_file_operations;
 extern const struct inode_operations f2fs_file_inode_operations;
 extern const struct address_space_operations f2fs_dblock_aops;
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 8fa37d1434de..6edb1ab579a1 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -497,6 +497,7 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 	}
 
 	err = f2fs_prepare_lookup(dir, dentry, &fname);
+	generic_set_encrypted_ci_d_ops(dentry);
 	if (err == -ENOENT)
 		goto out_splice;
 	if (err)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 00eff2f51807..f51d52591c99 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3427,7 +3427,6 @@ static int f2fs_setup_casefold(struct f2fs_sb_info *sbi)
 
 		sbi->sb->s_encoding = encoding;
 		sbi->sb->s_encoding_flags = encoding_flags;
-		sbi->sb->s_d_op = &f2fs_dentry_ops;
 	}
 #else
 	if (f2fs_sb_has_casefold(sbi)) {
diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 155521e51ac5..7a920434d741 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -203,6 +203,7 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 	dbg_gen("'%pd' in dir ino %lu", dentry, dir->i_ino);
 
 	err = fscrypt_prepare_lookup(dir, dentry, &nm);
+	generic_set_encrypted_ci_d_ops(dentry);
 	if (err == -ENOENT)
 		return d_splice_alias(NULL, dentry);
 	if (err)
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index a8f7a43f031b..e72f80482671 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -741,8 +741,11 @@ static inline int fscrypt_prepare_rename(struct inode *old_dir,
  * directory's encryption key is available, then the lookup is assumed to be by
  * plaintext name; otherwise, it is assumed to be by no-key name.
  *
- * This also installs a custom ->d_revalidate() method which will invalidate the
- * dentry if it was created without the key and the key is later added.
+ * This will set DCACHE_NOKEY_NAME on the dentry if the lookup is by no-key
+ * name.  In this case the filesystem must assign the dentry a dentry_operations
+ * which contains fscrypt_d_revalidate (or contains a d_revalidate method that
+ * calls fscrypt_d_revalidate), so that the dentry will be invalidated if the
+ * directory's encryption key is later added.
  *
  * Return: 0 on success; -ENOENT if the directory's key is unavailable but the
  * filename isn't a valid no-key name, so a negative dentry should be created;
-- 
2.29.2.454.gaff20da3a2-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
