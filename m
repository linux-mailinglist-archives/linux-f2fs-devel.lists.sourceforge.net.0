Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5718514135B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jan 2020 22:43:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P7v6KjIBzAa5U9UWk+P+aVk5YvzGbShJuQWaVkiP+p8=; b=MGiTNkic5F4LcN5AHEpVlF01T
	Z+Dk21z6CuTnYARP4PRKz65+DRKB7zKlEnT3spNNIH0gtQqGz2Cu/GCdGs9S56hhrZe+Xd9qTJX+K
	a7dcJR6TF3t5fv2LM3bpKg1+v6llljpiuUli8Wqv3Ef4tLyqN4cc/2d8Rd4uAbj/zPSe4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1isZOg-0007qs-7O; Fri, 17 Jan 2020 21:43:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3ayoiXgYKAEAftqugpiqqing.eqo@flex--drosen.bounces.google.com>)
 id 1isZOd-0007qS-5k
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 21:43:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kB+NQKJiUAIRFl4aTji9u2bg8hO9+Q8WB3NnVD/VOa0=; b=d68N428khQLJnvCc180NXZuvi
 49P+P6GbJ7rlXqQ323aEDrbxN0aPr40Bxfi2Rf9wHzA1n1QnUXma2u2XGFiQbyLHR/mt5fPnVlwuK
 oNMblUCEyA7Rh73WMDR+mWpSIKU7hvzFQ3iBMirZtrquWP6NnlubGttHnDAdEO0Yl5kWs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kB+NQKJiUAIRFl4aTji9u2bg8hO9+Q8WB3NnVD/VOa0=; b=G/z1vN30yDuftWQhmjvPKSYcEw
 WOy5jshQdepy0OV6swuEAo7x9kgv6FQUJwq3aSu7REX0frkGD+3ST3QfO9mVv4qP31NSWICydhv2u
 4RWRPYFORXFpBUnR02nYHVxQ08iaaeiMVOIUa9njvxIoa+KFqIabH6mvTTc8m3CQGXcQ=;
Received: from mail-pg1-f202.google.com ([209.85.215.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1isZOb-00BhGm-LF
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 21:43:15 +0000
Received: by mail-pg1-f202.google.com with SMTP id r30so15169845pgm.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 17 Jan 2020 13:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=kB+NQKJiUAIRFl4aTji9u2bg8hO9+Q8WB3NnVD/VOa0=;
 b=re88JEJxDhwb7zLLnErnvZM02G0Gj4vQuRSRgAHJ0gPpq11nzY7dKVshwiMI8iTL7T
 3hafAtjrYmHUaz5W2zGiRx84jD5Ff8W/hqL22aIB2sf5WjtIavPyHTZYDuGbhFal1VWr
 W2GR9e4ggOxjGg6Rdd6Ljz2n00RFUUNLwkGxlDSy5A9n8Itru3wF8riUuhmcbmhEwjSJ
 Ov7T0tQyORgBVk/nOhN75kRaxfBqppX/4cDjvHcSsHBnp2AyrFW5xMrWMzGKwHsRtu2X
 v9RZ5r6aQF9u7NS41DNZsV/IW1wwkGCvWcAtObe3V0kRAVe9Dk3HqdhGNGXjmYqPtfR9
 BthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=kB+NQKJiUAIRFl4aTji9u2bg8hO9+Q8WB3NnVD/VOa0=;
 b=quQ6EIkPrmpE6t7yqlc4clBOPVizi1gNp3d7YLeJtaOLlUKg9jUTCrWolWE87DMrDh
 gjwoTNM6Ayc5Chre2v1EWl/Il9Kofc6yAs36wvFNjxP7c749gQZ2rm63P2WcDjX9dIb+
 fIF0CAHUd7xjJrFP2fiUw7nRxo42/azGMtOt4SYC10m+FpgnX4Dqf326Td2xiKDY57Xz
 BqIGurwkC/DbA0+3f/kM0It7M0yu+heswLDE6tX4DUVk6Ls+krM6/JRwZp9AmILETCK2
 ZPXFqLPdL8so2stbWrFcesuTEu1ToR/h9S0u/Z9qwreinfCW7gds21VkWRhpJXWnKfqS
 x8HA==
X-Gm-Message-State: APjAAAVqL6XuPsHi+69FudzfGX/zfME054iGMcZQvBuzmqbFJSUmQrQI
 0C+V/NZe7gppbpQslLxQBeupLXhHsd0=
X-Google-Smtp-Source: APXvYqw6Ct56QGUI/qT+gtMlJeOAmF7SuNqwoG6m8v2zpcXR33XO9wzdYHdjMiRNIInMZ2yefbbvYg8zvuM=
X-Received: by 2002:a65:46c6:: with SMTP id n6mr47933917pgr.15.1579297387762; 
 Fri, 17 Jan 2020 13:43:07 -0800 (PST)
Date: Fri, 17 Jan 2020 13:42:42 -0800
In-Reply-To: <20200117214246.235591-1-drosen@google.com>
Message-Id: <20200117214246.235591-6-drosen@google.com>
Mime-Version: 1.0
References: <20200117214246.235591-1-drosen@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.202 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.202 listed in wl.mailspike.net]
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1isZOb-00BhGm-LF
Subject: [f2fs-dev] [PATCH v3 5/9] vfs: Fold casefolding into vfs
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

Ext4 and F2fs are both using casefolding, and they, along with any other
filesystem that adds the feature, will be using identical dentry_ops.
Additionally, those dentry ops interfere with the dentry_ops required
for fscrypt once we add support for casefolding and encryption.
Moving this into the vfs removes code duplication as well as the
complication with encryption.

Currently this is pretty close to just moving the existing f2fs/ext4
code up a level into the vfs, although there is a lot of room for
improvement now.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/dcache.c             | 28 ++++++++++++++++++++++++++++
 fs/namei.c              | 41 ++++++++++++++++++++++++++++++++++++++---
 include/linux/fs.h      | 10 ++++++++++
 include/linux/unicode.h | 14 ++++++++++++++
 4 files changed, 90 insertions(+), 3 deletions(-)

diff --git a/fs/dcache.c b/fs/dcache.c
index b280e07e162b1..a8bbb7f4fad30 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -32,6 +32,7 @@
 #include <linux/bit_spinlock.h>
 #include <linux/rculist_bl.h>
 #include <linux/list_lru.h>
+#include <linux/unicode.h>
 #include "internal.h"
 #include "mount.h"
 
@@ -247,7 +248,19 @@ static inline int dentry_cmp(const struct dentry *dentry, const unsigned char *c
 	 * be no NUL in the ct/tcount data)
 	 */
 	const unsigned char *cs = READ_ONCE(dentry->d_name.name);
+#ifdef CONFIG_UNICODE
+	struct inode *parent = dentry->d_parent->d_inode;
 
+	if (unlikely(needs_casefold(parent))) {
+		const struct qstr n1 = QSTR_INIT(cs, tcount);
+		const struct qstr n2 = QSTR_INIT(ct, tcount);
+		int result = utf8_strncasecmp(dentry->d_sb->s_encoding,
+						&n1, &n2);
+
+		if (result >= 0 || sb_has_enc_strict_mode(dentry->d_sb))
+			return result;
+	}
+#endif
 	return dentry_string_cmp(cs, ct, tcount);
 }
 
@@ -2406,7 +2419,22 @@ struct dentry *d_hash_and_lookup(struct dentry *dir, struct qstr *name)
 	 * calculate the standard hash first, as the d_op->d_hash()
 	 * routine may choose to leave the hash value unchanged.
 	 */
+#ifdef CONFIG_UNICODE
+	unsigned char *hname = NULL;
+	int hlen = name->len;
+
+	if (IS_CASEFOLDED(dir->d_inode)) {
+		hname = kmalloc(PATH_MAX, GFP_ATOMIC);
+		if (!hname)
+			return ERR_PTR(-ENOMEM);
+		hlen = utf8_casefold(dir->d_sb->s_encoding,
+					name, hname, PATH_MAX);
+	}
+	name->hash = full_name_hash(dir, hname ?: name->name, hlen);
+	kfree(hname);
+#else
 	name->hash = full_name_hash(dir, name->name, name->len);
+#endif
 	if (dir->d_flags & DCACHE_OP_HASH) {
 		int err = dir->d_op->d_hash(dir, name);
 		if (unlikely(err < 0))
diff --git a/fs/namei.c b/fs/namei.c
index d6c91d1e88cb3..f8e65c9f31444 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -39,6 +39,7 @@
 #include <linux/bitops.h>
 #include <linux/init_task.h>
 #include <linux/uaccess.h>
+#include <linux/unicode.h>
 
 #include "internal.h"
 #include "mount.h"
@@ -2055,6 +2056,10 @@ static inline u64 hash_name(const void *salt, const char *name)
 static int link_path_walk(const char *name, struct nameidata *nd)
 {
 	int err;
+#ifdef CONFIG_UNICODE
+	char *hname = NULL;
+	int hlen = 0;
+#endif
 
 	if (IS_ERR(name))
 		return PTR_ERR(name);
@@ -2071,9 +2076,22 @@ static int link_path_walk(const char *name, struct nameidata *nd)
 		err = may_lookup(nd);
 		if (err)
 			return err;
-
+#ifdef CONFIG_UNICODE
+		if (needs_casefold(nd->path.dentry->d_inode)) {
+			struct qstr str = QSTR_INIT(name, PATH_MAX);
+
+			hname = kmalloc(PATH_MAX, GFP_ATOMIC);
+			if (!hname)
+				return -ENOMEM;
+			hlen = utf8_casefold(nd->path.dentry->d_sb->s_encoding,
+						&str, hname, PATH_MAX);
+		}
+		hash_len = hash_name(nd->path.dentry, hname ?: name);
+		kfree(hname);
+		hname = NULL;
+#else
 		hash_len = hash_name(nd->path.dentry, name);
-
+#endif
 		type = LAST_NORM;
 		if (name[0] == '.') switch (hashlen_len(hash_len)) {
 			case 2:
@@ -2445,9 +2463,26 @@ EXPORT_SYMBOL(vfs_path_lookup);
 static int lookup_one_len_common(const char *name, struct dentry *base,
 				 int len, struct qstr *this)
 {
+#ifdef CONFIG_UNICODE
+	char *hname = NULL;
+	int hlen = len;
+
+	if (needs_casefold(base->d_inode)) {
+		struct qstr str = QSTR_INIT(name, len);
+
+		hname = kmalloc(PATH_MAX, GFP_ATOMIC);
+		if (!hname)
+			return -ENOMEM;
+		hlen = utf8_casefold(base->d_sb->s_encoding,
+					&str, hname, PATH_MAX);
+	}
+	this->hash = full_name_hash(base, hname ?: name, hlen);
+	kfree(hname);
+#else
+	this->hash = full_name_hash(base, name, len);
+#endif
 	this->name = name;
 	this->len = len;
-	this->hash = full_name_hash(base, name, len);
 	if (!len)
 		return -EACCES;
 
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 98e0349adb526..9a7092449e94f 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1382,6 +1382,12 @@ extern int send_sigurg(struct fown_struct *fown);
 #define SB_ACTIVE	(1<<30)
 #define SB_NOUSER	(1<<31)
 
+/* These flags relate to encoding and casefolding */
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
+	__u16 s_encoding_flags;
 #endif
 	struct hlist_bl_head	s_roots;	/* alternate root dentries for NFS */
 	struct list_head	s_mounts;	/* list of mounts; _not_ for fs use */
diff --git a/include/linux/unicode.h b/include/linux/unicode.h
index 990aa97d80496..182352f3cc30f 100644
--- a/include/linux/unicode.h
+++ b/include/linux/unicode.h
@@ -4,6 +4,8 @@
 
 #include <linux/init.h>
 #include <linux/dcache.h>
+#include <linux/fscrypt.h>
+#include <linux/fs.h>
 
 struct unicode_map {
 	const char *charset;
@@ -30,4 +32,16 @@ int utf8_casefold(const struct unicode_map *um, const struct qstr *str,
 struct unicode_map *utf8_load(const char *version);
 void utf8_unload(struct unicode_map *um);
 
+#ifdef CONFIG_UNICODE
+static inline bool needs_casefold(const struct inode *dir)
+{
+	return IS_CASEFOLDED(dir) && dir->i_sb->s_encoding &&
+			(!IS_ENCRYPTED(dir) || fscrypt_has_encryption_key(dir));
+}
+#else
+static inline bool needs_casefold(const struct inode *dir)
+{
+	return 0;
+}
+#endif
 #endif /* _LINUX_UNICODE_H */
-- 
2.25.0.341.g760bfbb309-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
