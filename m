Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAB410F75E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Dec 2019 06:36:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n1KwfA/TmNZZoXsL69ewPTlLGtG9avVN4LSxXP+vvPI=; b=NT+Y+O7/IjB9PP1jb61Yp3adU
	DPz0hnATTr4jAN+kh3bT3yqyRZ/8FsLfdZfqN9IVX+ThgO7KevS2BIFulh4ar36lik0cSbgFGQ+N9
	W0n7GeDcSP2YdCswJgJlSxxAn20loQs7sAD5VzvHCis+GPQHpfIjboUcJiBNhzuRM8TOE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ic0rc-0001dk-N7; Tue, 03 Dec 2019 05:36:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3he7lXQYKAO4TheiUdWeeWbU.Sec@flex--drosen.bounces.google.com>)
 id 1ic0rb-0001dY-F1
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 05:36:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sD8gsliXRbwllqwxSUhpHLFZAc6+I9SqEK5TG/0k03E=; b=DnNreUid6qnP7mfb4XDjVlCcN
 CqR8idBZXh4rAfoS9BqcorfU01q2o+JFZaOAKldrr9tBxDAPZRxjczuQIUldID34546wPDd4fhdNa
 pu7kdRpgL3QCM8L0UG9wUzD9dFI7e+BH7Ud1JA64g1bU0PRYVO29mIBWkEbzrdj1lQP/Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sD8gsliXRbwllqwxSUhpHLFZAc6+I9SqEK5TG/0k03E=; b=Plga/WxM0INuufV62U9Rt+RqcZ
 U0FhVaMChf7p3O0duP45zjWEpy/BsqHdumuftjFmMiGLxWO5mbJsXAjFBe0KcZYSx7Kxe3eFxmfSN
 pxq/tfYRod9iAubgdVkfTiEFyguL35aTYxtoCdTiL48jR7Qiucm/gXFJQ+8vVcSNWcxI=;
Received: from mail-pf1-f201.google.com ([209.85.210.201])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ic0rZ-005KDc-TB
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 05:36:43 +0000
Received: by mail-pf1-f201.google.com with SMTP id x6so1485977pfx.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 02 Dec 2019 21:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=sD8gsliXRbwllqwxSUhpHLFZAc6+I9SqEK5TG/0k03E=;
 b=VztDSRC0XZzUOss07je0q4bGwS4adhmsGySSn3Tvwo7gmP49qCwrTJmDElwNXitoip
 nPF7IO9qX8pjtORI2c+UKKSsw9UIxn1KlkcVqNIA0UOX/tAMd3b2ML7FcWXH7MvNHbQe
 iBabKgF+Pvw3oJtk7Q8BspAJwcaYvM8wClbeF44CnA7HSD9+ny8qYUzFguQ/bqUR6VFz
 TwEpLzrlMcBAMO/cveKu9vZxDdh6YetxQmFrXaIMoAbsfV117KbTZjORmIZMg8DTX74c
 1qCQ6NW58X+wrYGCeLO00jOyYmBbJLAOV65IOt7NAwCNeZfSAq6XxtmUBaL8Xn8+8NHs
 IYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=sD8gsliXRbwllqwxSUhpHLFZAc6+I9SqEK5TG/0k03E=;
 b=V3rtbGO7MIxCFhrHIFwQryX06jnNEMTrDpvldyy6idpMAYiH6iRLye6whJu/ovVvXm
 dQQyIXWA5/L9PRz0xJ6HTVEI/Hd8RGgHQDQI3P9a4/JswfJbjPC2PLRw9pBIQZbxd9Tp
 TbEVS0r7qq5+sLMDiBns96RKzNHC8CndWdgNmk+WqYwFpf8v7RII/myLizU3yM5FY7PS
 qZeSw+/CBCr19FVp2WKIz6u/ysCMgRsbA2re4sY5t5Onp0TVobE6P1SK6Cz7hXofqAMi
 XqRyNVs/s4hCwgmfz/vOqw7OjB79NwjrYsNzbeVebBPvpFJOpTHNzRbTWglndVj1UJMz
 IkqQ==
X-Gm-Message-State: APjAAAWSxbrLXt0rYY1Kz+ZnlnG+hotvWFyvs1/3a8IVorrBi4oVGw1T
 f97AN7faOqudmTpCIhoLEfVETY+Cez4=
X-Google-Smtp-Source: APXvYqzBboxwmxn1RgU0iKgke3CUahBw8SCAMysoFPV2B9yAP9UpffT61xuTh5stSzrC3zAoFuJHvCn06KA=
X-Received: by 2002:a63:a34b:: with SMTP id v11mr3287463pgn.229.1575349893363; 
 Mon, 02 Dec 2019 21:11:33 -0800 (PST)
Date: Mon,  2 Dec 2019 21:10:47 -0800
In-Reply-To: <20191203051049.44573-1-drosen@google.com>
Message-Id: <20191203051049.44573-7-drosen@google.com>
Mime-Version: 1.0
References: <20191203051049.44573-1-drosen@google.com>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.201 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ic0rZ-005KDc-TB
Subject: [f2fs-dev] [PATCH 6/8] ext4: Use struct super_block's casefold data
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
 linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Switch over to using the struct entries added to the VFS, and
remove the redundant dentry operations.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/ext4/dir.c   | 47 -----------------------------------------------
 fs/ext4/ext4.h  |  4 ----
 fs/ext4/hash.c  |  2 +-
 fs/ext4/namei.c | 16 ++++++++--------
 fs/ext4/super.c | 15 +++++----------
 5 files changed, 14 insertions(+), 70 deletions(-)

diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
index 9fdd2b269d61..c9c8370e5b4b 100644
--- a/fs/ext4/dir.c
+++ b/fs/ext4/dir.c
@@ -663,50 +663,3 @@ const struct file_operations ext4_dir_operations = {
 	.release	= ext4_release_dir,
 };
 
-#ifdef CONFIG_UNICODE
-static int ext4_d_compare(const struct dentry *dentry, unsigned int len,
-			  const char *str, const struct qstr *name)
-{
-	struct qstr qstr = {.name = str, .len = len };
-	struct inode *inode = dentry->d_parent->d_inode;
-
-	if (!IS_CASEFOLDED(inode) || !EXT4_SB(inode->i_sb)->s_encoding) {
-		if (len != name->len)
-			return -1;
-		return memcmp(str, name->name, len);
-	}
-
-	return ext4_ci_compare(inode, name, &qstr, false);
-}
-
-static int ext4_d_hash(const struct dentry *dentry, struct qstr *str)
-{
-	const struct ext4_sb_info *sbi = EXT4_SB(dentry->d_sb);
-	const struct unicode_map *um = sbi->s_encoding;
-	unsigned char *norm;
-	int len, ret = 0;
-
-	if (!IS_CASEFOLDED(dentry->d_inode) || !um)
-		return 0;
-
-	norm = kmalloc(PATH_MAX, GFP_ATOMIC);
-	if (!norm)
-		return -ENOMEM;
-
-	len = utf8_casefold(um, str, norm, PATH_MAX);
-	if (len < 0) {
-		if (ext4_has_strict_mode(sbi))
-			ret = -EINVAL;
-		goto out;
-	}
-	str->hash = full_name_hash(dentry, norm, len);
-out:
-	kfree(norm);
-	return ret;
-}
-
-const struct dentry_operations ext4_dentry_ops = {
-	.d_hash = ext4_d_hash,
-	.d_compare = ext4_d_compare,
-};
-#endif
diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index f8578caba40d..3162ef2e53d4 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -1430,10 +1430,6 @@ struct ext4_sb_info {
 	struct kobject s_kobj;
 	struct completion s_kobj_unregister;
 	struct super_block *s_sb;
-#ifdef CONFIG_UNICODE
-	struct unicode_map *s_encoding;
-	__u16 s_encoding_flags;
-#endif
 
 	/* Journaling */
 	struct journal_s *s_journal;
diff --git a/fs/ext4/hash.c b/fs/ext4/hash.c
index 3e133793a5a3..143b0073b3f4 100644
--- a/fs/ext4/hash.c
+++ b/fs/ext4/hash.c
@@ -275,7 +275,7 @@ int ext4fs_dirhash(const struct inode *dir, const char *name, int len,
 		   struct dx_hash_info *hinfo)
 {
 #ifdef CONFIG_UNICODE
-	const struct unicode_map *um = EXT4_SB(dir->i_sb)->s_encoding;
+	const struct unicode_map *um = dir->i_sb->s_encoding;
 	int r, dlen;
 	unsigned char *buff;
 	struct qstr qstr = {.name = name, .len = len };
diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index a856997d87b5..4ee5cf007de7 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1282,8 +1282,8 @@ static void dx_insert_block(struct dx_frame *frame, u32 hash, ext4_lblk_t block)
 int ext4_ci_compare(const struct inode *parent, const struct qstr *name,
 		    const struct qstr *entry, bool quick)
 {
-	const struct ext4_sb_info *sbi = EXT4_SB(parent->i_sb);
-	const struct unicode_map *um = sbi->s_encoding;
+	const struct super_block *sb = parent->i_sb;
+	const struct unicode_map *um = sb->s_encoding;
 	int ret;
 
 	if (quick)
@@ -1295,7 +1295,7 @@ int ext4_ci_compare(const struct inode *parent, const struct qstr *name,
 		/* Handle invalid character sequence as either an error
 		 * or as an opaque byte sequence.
 		 */
-		if (ext4_has_strict_mode(sbi))
+		if (sb_has_enc_strict_mode(sb))
 			return -EINVAL;
 
 		if (name->len != entry->len)
@@ -1312,7 +1312,7 @@ void ext4_fname_setup_ci_filename(struct inode *dir, const struct qstr *iname,
 {
 	int len;
 
-	if (!IS_CASEFOLDED(dir) || !EXT4_SB(dir->i_sb)->s_encoding) {
+	if (!IS_CASEFOLDED(dir) || !dir->i_sb->s_encoding) {
 		cf_name->name = NULL;
 		return;
 	}
@@ -1321,7 +1321,7 @@ void ext4_fname_setup_ci_filename(struct inode *dir, const struct qstr *iname,
 	if (!cf_name->name)
 		return;
 
-	len = utf8_casefold(EXT4_SB(dir->i_sb)->s_encoding,
+	len = utf8_casefold(dir->i_sb->s_encoding,
 			    iname, cf_name->name,
 			    EXT4_NAME_LEN);
 	if (len <= 0) {
@@ -1358,7 +1358,7 @@ static inline bool ext4_match(const struct inode *parent,
 #endif
 
 #ifdef CONFIG_UNICODE
-	if (EXT4_SB(parent->i_sb)->s_encoding && IS_CASEFOLDED(parent)) {
+	if (parent->i_sb->s_encoding && IS_CASEFOLDED(parent)) {
 		if (fname->cf_name.name) {
 			struct qstr cf = {.name = fname->cf_name.name,
 					  .len = fname->cf_name.len};
@@ -2182,8 +2182,8 @@ static int ext4_add_entry(handle_t *handle, struct dentry *dentry,
 		return -EINVAL;
 
 #ifdef CONFIG_UNICODE
-	if (ext4_has_strict_mode(sbi) && IS_CASEFOLDED(dir) &&
-	    sbi->s_encoding && utf8_validate(sbi->s_encoding, &dentry->d_name))
+	if (sb_has_enc_strict_mode(sb) && IS_CASEFOLDED(dir) &&
+	    sb->s_encoding && utf8_validate(sb->s_encoding, &dentry->d_name))
 		return -EINVAL;
 #endif
 
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 1d82b56d9b11..074e61b15181 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1056,7 +1056,7 @@ static void ext4_put_super(struct super_block *sb)
 	kfree(sbi->s_blockgroup_lock);
 	fs_put_dax(sbi->s_daxdev);
 #ifdef CONFIG_UNICODE
-	utf8_unload(sbi->s_encoding);
+	utf8_unload(sb->s_encoding);
 #endif
 	kfree(sbi);
 }
@@ -3815,7 +3815,7 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
 		goto failed_mount;
 
 #ifdef CONFIG_UNICODE
-	if (ext4_has_feature_casefold(sb) && !sbi->s_encoding) {
+	if (ext4_has_feature_casefold(sb) && !sb->s_encoding) {
 		const struct ext4_sb_encodings *encoding_info;
 		struct unicode_map *encoding;
 		__u16 encoding_flags;
@@ -3846,8 +3846,8 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
 			 "%s-%s with flags 0x%hx", encoding_info->name,
 			 encoding_info->version?:"\b", encoding_flags);
 
-		sbi->s_encoding = encoding;
-		sbi->s_encoding_flags = encoding_flags;
+		sb->s_encoding = encoding;
+		sb->s_encoding_flags = encoding_flags;
 	}
 #endif
 
@@ -4498,11 +4498,6 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
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
@@ -4687,7 +4682,7 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
 		crypto_free_shash(sbi->s_chksum_driver);
 
 #ifdef CONFIG_UNICODE
-	utf8_unload(sbi->s_encoding);
+	utf8_unload(sb->s_encoding);
 #endif
 
 #ifdef CONFIG_QUOTA
-- 
2.24.0.393.g34dc348eaf-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
