Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AD417CB6B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 Mar 2020 04:06:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LQvYFwC7kwZ9rSjqqicvz6u/gnkfSyI+4oMpY25W/hA=; b=O4wRiDKZYb/JSzglXn8ANY0BQ
	yIqLlbiOaKh8/f6RZXT6eZ9xD1toniSnZbUXPGsvsY7PhXdNkemILBn1RWLSaHcxpy3Id95xJJU3t
	hcW0jKbA+xv6zUXifbHzCNqVjM7OsxyQ2c2GWz9JWMhHiZ0jJgf6q4aT/2xs4pp9kyLIs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jAPng-00022i-E9; Sat, 07 Mar 2020 03:06:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3tghjXgYKAE0s637t2v33v0t.r31@flex--drosen.bounces.google.com>)
 id 1jAPnf-00022X-Nr
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 Mar 2020 03:06:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eY0o7zJ9ID5RkUnCQ8ZBfY0aWmEieO+fgK45vUzTAmI=; b=CZvzeVkO+9ZxvYvOzDlvG6NbD
 k6zOTEpACZGmEv5kNJtd+gGW1FK2GVIIXJikzdwdc2P4jf1jmumH6t6qaHeQA2iBHpOdAx7Z1M8qr
 aeRgO9oU0BHimP1FSKz2f4+/NIc1QrZR00EblkGipeO6P3vsanP0Tib7rBVRVKCbFbVok=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eY0o7zJ9ID5RkUnCQ8ZBfY0aWmEieO+fgK45vUzTAmI=; b=OkwPBNDD5PYa+8UNBV6ay1tRX0
 iEjJ98XPLg7f7uiDL8rxb+0mGtq88NZbA4y0NEmUesODSebQrmZvbZ0BX8hbZgw781lrzraSlun0R
 UA0smTUi6Pa6jSlEjhkucCp2iGesbyzjyx5xL4TAa2lbk+WyQkcSSHDn+HWIIq5T85Rw=;
Received: from mail-ot1-f74.google.com ([209.85.210.74])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jAPnc-00AwGX-DW
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 Mar 2020 03:06:51 +0000
Received: by mail-ot1-f74.google.com with SMTP id s22so2755958otr.20
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 06 Mar 2020 19:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=eY0o7zJ9ID5RkUnCQ8ZBfY0aWmEieO+fgK45vUzTAmI=;
 b=maDP+sv7S5sg7dJ+wIj5K1mw8zKYw8OcIiPukgjB9zxHUGo+On7L3GC+ARA2qoCFrt
 vIBGoqJloHTM/uAbxgHebuEJeJ19PSqBv2MSP1dpjQIjklO815/0Gc247hDyju9YBpEr
 ICpkbEMJkPCMECSkW1EC4lwQYrxUSD65UPtAsURE+TGRjcHtmTS9w4izqCAdZkWq+KXs
 2b9n/hik8XxhEwZBd35FbCld2A53Ae5EfQrqHQA0hgDr4cgkYeOoh3qWyeQQIpdgM2qz
 vRJgeDpbg2t71sHRRvbdbYRKLd9mFgXgnKPCPz82+oicZ9gBSIzzICZQvRvDb88n2sRS
 dGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=eY0o7zJ9ID5RkUnCQ8ZBfY0aWmEieO+fgK45vUzTAmI=;
 b=Xg8PktR0LvhbDfVoVLfLpUUEMUSqAiiLGt0SFGCrDIauSImLSOihoS/2wMl7iFtSb5
 tUcUL4P27gX6ro+W6fuUs/aJt6iUF8OKsm09sVFbC1K7Z5Nrgkhea7OBm0u9E0E6xbkB
 oayC/nE/GMIhNGMp0ze74vDC9S+dB/7sHu7+Ee7OM+TbyH70HxpXOhVj2UXwucKeZxBJ
 61JEnCHKc7j1YU/rAyPAdoMTRfXttVUW6ShsgumQZattRBK8VrQgtgEc8eEbFNfM34KQ
 y/0YgD8fvC2Z2rZRGUET71D8xhQjmParVn1u8qKebjd+TYzPi0R70gh99CZ54xv7bOOI
 2PKA==
X-Gm-Message-State: ANhLgQ3JVD+gWLgyqJfJUEBCPKSoZzhFVH8Y1oNhzS8MHDJ4b9X9b20C
 fKjJsMhS5ETMc7GqTv32Tv/dXdmocS4=
X-Google-Smtp-Source: ADFU+vvzA+1kQfLrYOGb8BKXwXlqs4orE2r9h0PUkhfDALGzmbnT0SpAK8/epSd/0whSxfO37yVzAKXtsmE=
X-Received: by 2002:a17:90a:2466:: with SMTP id
 h93mr6538944pje.177.1583548598158; 
 Fri, 06 Mar 2020 18:36:38 -0800 (PST)
Date: Fri,  6 Mar 2020 18:36:05 -0800
In-Reply-To: <20200307023611.204708-1-drosen@google.com>
Message-Id: <20200307023611.204708-3-drosen@google.com>
Mime-Version: 1.0
References: <20200307023611.204708-1-drosen@google.com>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>
X-Spam-Score: -7.8 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.74 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.74 listed in wl.mailspike.net]
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jAPnc-00AwGX-DW
Subject: [f2fs-dev] [PATCH v8 2/8] fs: Add standard casefolding support
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

This adds general supporting functions for filesystems that use
utf8 casefolding. It provides standard dentry_operations and adds the
necessary structures in struct super_block to allow this standardization.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/libfs.c         | 114 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fs.h |  22 +++++++++
 2 files changed, 136 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index c686bd9caac67..0eaa63a9ae037 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -20,6 +20,8 @@
 #include <linux/fs_context.h>
 #include <linux/pseudo_fs.h>
 #include <linux/fsnotify.h>
+#include <linux/unicode.h>
+#include <linux/fscrypt.h>
 
 #include <linux/uaccess.h>
 
@@ -1361,3 +1363,115 @@ bool is_empty_dir_inode(struct inode *inode)
 	return (inode->i_fop == &empty_dir_operations) &&
 		(inode->i_op == &empty_dir_inode_operations);
 }
+
+#ifdef CONFIG_UNICODE
+/**
+ * needs_casefold - determine if casefolding applies for a given directory
+ * @dir:	Folder to check
+ *
+ * This function returns true if dentries within this folder should be
+ * casefolded. If a folder is encrypted, but we don't have the key, it is not
+ * meaningful to casefold the no-key token name.
+ */
+bool needs_casefold(const struct inode *dir)
+{
+	return IS_CASEFOLDED(dir) && dir->i_sb->s_encoding &&
+			(!IS_ENCRYPTED(dir) || fscrypt_has_encryption_key(dir));
+}
+EXPORT_SYMBOL(needs_casefold);
+
+/*
+ * Under RCU, small names may change, but utf8 expects a stable name
+ * This operates similarly to take_dentry_name_snapshot, except that there
+ * is no guarantee that it grabs a coherent string.
+ */
+static int make_name_stable(const struct unicode_map *um,
+			   const struct dentry *dentry, struct qstr *entry,
+			   char *buff)
+{
+	if (dentry->d_iname != (const unsigned char *)entry->name)
+		return 0;
+
+	memcpy(buff, entry->name, entry->len + 1);
+	entry->name = buff;
+	return utf8_validate(um, entry);
+}
+
+/**
+ * generic_ci_d_compare - generic implementation of d_compare for casefolding
+ * @dentry: Entry we are comparing against
+ * @len: length of str
+ * @str: name of the dentry, safely paired with len
+ * @name: qstr to test against
+ *
+ * This performs a case insensitive comparison between the given name and str.
+ * It can be used as d_compare for dentry_operations.
+ */
+int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
+			  const char *str, const struct qstr *name)
+{
+	const struct dentry *parent = READ_ONCE(dentry->d_parent);
+	const struct inode *inode = READ_ONCE(parent->d_inode);
+	const struct super_block *sb = dentry->d_sb;
+	const struct unicode_map *um = sb->s_encoding;
+	char small_name[DNAME_INLINE_LEN];
+	struct qstr entry = QSTR_INIT(str, len);
+	int ret;
+
+	if (!inode || !needs_casefold(inode))
+		goto fallback;
+
+	/* Under RCU, small names may change, but utf8 expects a stable name */
+	if (make_name_stable(um, dentry, &entry, small_name))
+		goto err;
+	ret = utf8_strncasecmp(um, name, &entry);
+	if (ret >= 0)
+		return ret;
+err:
+	if (sb_has_enc_strict_mode(sb))
+		return -EINVAL;
+fallback:
+	if (len != name->len)
+		return 1;
+	return !!memcmp(str, name->name, len);
+}
+EXPORT_SYMBOL(generic_ci_d_compare);
+
+/**
+ * generic_ci_d_hash - generic implementation of d_hash for casefolding
+ * @dentry: Entry whose name we are hashing
+ * @len: length of str
+ * @qstr: name of the dentry, safely paired with len
+ * @str: qstr to set hash of
+ *
+ * This performs a case insensitive hash of the given str.
+ * If casefolding is not required, it leaves the hash unchanged.
+ */
+int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
+{
+	const struct inode *inode = READ_ONCE(dentry->d_inode);
+	struct super_block *sb = dentry->d_sb;
+	const struct unicode_map *um = sb->s_encoding;
+	char small_name[DNAME_INLINE_LEN];
+	struct qstr entry = QSTR_INIT(str->name, str->len);
+	int ret = 0;
+
+	if (!inode || !needs_casefold(inode))
+		return 0;
+
+	if (make_name_stable(um, dentry, &entry, small_name))
+		goto err;
+	ret = utf8_casefold_hash(um, dentry, &entry);
+	if (ret < 0)
+		goto err;
+
+	return 0;
+err:
+	if (sb_has_enc_strict_mode(sb))
+		ret = -EINVAL;
+	else
+		ret = 0;
+	return ret;
+}
+EXPORT_SYMBOL(generic_ci_d_hash);
+#endif
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 3cd4fe6b845e7..8d20a3daa49a0 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1382,6 +1382,12 @@ extern int send_sigurg(struct fown_struct *fown);
 #define SB_ACTIVE	(1<<30)
 #define SB_NOUSER	(1<<31)
 
+/* These flags relate to encoding and casefolding, and are stored on disk */
+#define SB_ENC_STRICT_MODE_FL	(1 << 0)
+
+#define sb_has_enc_strict_mode(sb) \
+	(sb->s_encoding_flags & SB_ENC_STRICT_MODE_FL)
+
 /*
  *	Umount options
  */
@@ -1449,6 +1455,10 @@ struct super_block {
 #endif
 #ifdef CONFIG_FS_VERITY
 	const struct fsverity_operations *s_vop;
+#endif
+#ifdef CONFIG_UNICODE
+	struct unicode_map *s_encoding;
+	u16 s_encoding_flags;
 #endif
 	struct hlist_bl_head	s_roots;	/* alternate root dentries for NFS */
 	struct list_head	s_mounts;	/* list of mounts; _not_ for fs use */
@@ -3368,6 +3378,18 @@ extern int generic_file_fsync(struct file *, loff_t, loff_t, int);
 
 extern int generic_check_addressable(unsigned, u64);
 
+#ifdef CONFIG_UNICODE
+extern int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str);
+extern int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
+				const char *str, const struct qstr *name);
+extern bool needs_casefold(const struct inode *dir);
+#else
+static inline bool needs_casefold(const struct inode *dir)
+{
+	return false;
+}
+#endif
+
 #ifdef CONFIG_MIGRATION
 extern int buffer_migrate_page(struct address_space *,
 				struct page *, struct page *,
-- 
2.25.1.481.gfbce0eb801-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
