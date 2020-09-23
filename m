Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A463E274E72
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Sep 2020 03:34:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WiWsS9UK59fDYPuJI2g/+vCbtKf4dyFXmJc1vccDT7o=; b=SoWl0AHu5rKWXJhDDYCU5t4D+
	onCscieNV6gXQe8il0E1A54GY3i+hI1z6gNEdVWEKS/jD7X0BPfWbbD60iOEQN2CNgemepgf7mv/H
	MOW+ESyxI7Cg0HJUoGd69W4vaJDnCmfyRnsONe7YJuY6hYKM3fh+lLIcSYq6/kxJEmNs8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kKtfe-00037c-Qb; Wed, 23 Sep 2020 01:34:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3SaBqXwYKADYVjgkWfYggYdW.Uge@flex--drosen.bounces.google.com>)
 id 1kKtfc-00037V-MW
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Sep 2020 01:34:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lqgM8oadNkPm8Fe218rhEmZBJx+Ca+DUOMlSvGhuVQA=; b=AGQYMMDkH7SBjFGOlbP18Kzw2
 LYoe3E30xBo3dSXVNmEECX1WyB84KlOpwTl3CSJrCyvU40sKnrIJLro93s10GOQN1RcbMZgjVB/qi
 XCS5W4otshAm7ylNSygRhvG7BrehU7WJiRSfEnx8qQdXsgUJYQjRnksYpEE7Y6MA+a1vg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lqgM8oadNkPm8Fe218rhEmZBJx+Ca+DUOMlSvGhuVQA=; b=QMAer9s1XAE7PdedYkMv3aShW1
 Yc3KfRq2Jsrapgt8van1IHvVAKXFItwgVFZp74xvRJAT4mbbIUe7SZF0YuAbkBpDb5zMEIV8XQMDS
 TlgE4gGS1iN1DpOFsUBnJ91jYT1AnO1jJfWHcMnqZWH8TmUNmZPKpZIQm8umQGenHNpY=;
Received: from mail-pj1-f73.google.com ([209.85.216.73])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kKtfN-001v5x-6i
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Sep 2020 01:34:08 +0000
Received: by mail-pj1-f73.google.com with SMTP id j6so3610909pjy.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Sep 2020 18:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=lqgM8oadNkPm8Fe218rhEmZBJx+Ca+DUOMlSvGhuVQA=;
 b=wOkIUBGVgChISjZmRtkAY7aWbnpSNQ8a5fzHhYT0H5LeS9eNg/OaAk8Jwf0DKYXG13
 5ZtxxjSydHSJokLrLOQQc9f+Zj+NcDQTPLPv3IZmq4W/kS81InLBfNmsIaYF5GCzWdn3
 7cgrM72VexYPE/vTZ3ayKrKlnoG/WayAL28zMz+4c8D1H2Y++OlsXLfZfYoY2qcj/Yho
 PZ7Xfd0n66r6DEkRFg0O12d7WEzAfUxtkG0/GYkV5jkJ6+Tls6KdT9BitHsz1tvjKd2Q
 BdE5wJSOQ9QX5DtWdBbh0OdhJUPWPU2r5s9LNMXIRuquE2SSK7xWbBJFaSqIoyVv1lmH
 LwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=lqgM8oadNkPm8Fe218rhEmZBJx+Ca+DUOMlSvGhuVQA=;
 b=bG4WuMxQZDiYnhT8g1CTZekwf5sY6uKr/60zLRyu9v2kE2KJnY2xb5IQf70Na17XBz
 yeNpJub14nQScfYyTDKtJeMu5hyxQz1GV+o6oIpBs3qhuIWOQbCrqy3VsPHH/nF9yYb8
 7dJ3YyMlYmXjahnghytnkZ6ax2uEwbNQY3cI+yMNzFMHkjJKQ4SdH6GQR6TpmtDb0NZf
 3FeAbOuKN3m3eE2iSq5UqKDlaW49n0GxNeAgB14sNRPSRRBglv6nNnmaTXPF+m0VYHK9
 VbNa64kE8KNkqnx3UKU334tt+QFMnSV2p0XYom/XmfKquC0d15MK1XeSs19pC5K+hym+
 hX1w==
X-Gm-Message-State: AOAM532dPYfxdVzbdf66/V87btuO27AGEGayQZTasFLce7vGqhO4ISg1
 oN49k0SNj1NLxwSBi6LwepRaQIOGS6E=
X-Google-Smtp-Source: ABdhPJybJDCLesGRmXosZksow4wlCsDrrHoz1rIa/Dw9+CsDU/5/heMGncoMbOrKHxR0JEUJNlhYmu5UuZU=
X-Received: from drosen.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:4e6f])
 (user=drosen job=sendgmr) by 2002:ad4:57cc:: with SMTP id
 y12mr8997020qvx.48.1600823369094; 
 Tue, 22 Sep 2020 18:09:29 -0700 (PDT)
Date: Wed, 23 Sep 2020 01:01:50 +0000
In-Reply-To: <20200923010151.69506-1-drosen@google.com>
Message-Id: <20200923010151.69506-5-drosen@google.com>
Mime-Version: 1.0
References: <20200923010151.69506-1-drosen@google.com>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>, 
 Chao Yu <chao@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.73 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.73 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kKtfN-001v5x-6i
Subject: [f2fs-dev] [PATCH 4/5] fscrypt: Have filesystems handle their d_ops
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
 include/linux/fscrypt.h | 5 +++--
 12 files changed, 6 insertions(+), 34 deletions(-)

diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index d45db23ff6c4..efa942e3ab53 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -581,7 +581,3 @@ int fscrypt_d_revalidate(struct dentry *dentry, unsigned int flags)
 	return valid;
 }
 EXPORT_SYMBOL_GPL(fscrypt_d_revalidate);
-
-const struct dentry_operations fscrypt_d_ops = {
-	.d_revalidate = fscrypt_d_revalidate,
-};
diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 09fb8aa0f2e9..7d6898ca152a 100644
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
index b437120f0b3f..f0135042c2ad 100644
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
index 5df0fbd6add4..cbde8447eddd 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -3247,10 +3247,6 @@ static inline void ext4_unlock_group(struct super_block *sb,
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
index ea7dee80c8a4..592ea2f8ea19 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1615,6 +1615,7 @@ static struct buffer_head *ext4_lookup_entry(struct inode *dir,
 	struct buffer_head *bh;
 
 	err = ext4_fname_prepare_lookup(dir, dentry, &fname);
+	generic_set_encrypted_ci_d_ops(dentry);
 	if (err == -ENOENT)
 		return NULL;
 	if (err)
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 8a261a6bb608..ce67540bd882 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -4719,11 +4719,6 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
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
index a18f839b6fb2..0766e6250a88 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -1106,10 +1106,3 @@ const struct file_operations f2fs_dir_operations = {
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
index 61fd78b1b1bd..af1d469e8c1e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3774,9 +3774,6 @@ static inline void f2fs_update_sit_info(struct f2fs_sb_info *sbi) {}
 #endif
 
 extern const struct file_operations f2fs_dir_operations;
-#ifdef CONFIG_UNICODE
-extern const struct dentry_operations f2fs_dentry_ops;
-#endif
 extern const struct file_operations f2fs_file_operations;
 extern const struct inode_operations f2fs_file_inode_operations;
 extern const struct address_space_operations f2fs_dblock_aops;
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 90565432559c..70a8e516fd32 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -492,6 +492,7 @@ static struct dentry *f2fs_lookup(struct inode *dir, struct dentry *dentry,
 	}
 
 	err = f2fs_prepare_lookup(dir, dentry, &fname);
+	generic_set_encrypted_ci_d_ops(dentry);
 	if (err == -ENOENT)
 		goto out_splice;
 	if (err)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 5fe614011e41..63c744c6aeff 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3410,7 +3410,6 @@ static int f2fs_setup_casefold(struct f2fs_sb_info *sbi)
 
 		sbi->sb->s_encoding = encoding;
 		sbi->sb->s_encoding_flags = encoding_flags;
-		sbi->sb->s_d_op = &f2fs_dentry_ops;
 	}
 #else
 	if (f2fs_sb_has_casefold(sbi)) {
diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 9d042942d8b2..fdae78934c02 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -209,6 +209,7 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 	dbg_gen("'%pd' in dir ino %lu", dentry, dir->i_ino);
 
 	err = fscrypt_prepare_lookup(dir, dentry, &nm);
+	generic_set_encrypted_ci_d_ops(dentry);
 	if (err == -ENOENT)
 		return d_splice_alias(NULL, dentry);
 	if (err)
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 265b1e9119dc..fc04452921b4 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -740,8 +740,9 @@ static inline int fscrypt_prepare_rename(struct inode *old_dir,
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
2.28.0.681.g6f77f65b4e-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
