Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4AD131F11
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jan 2020 06:24:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hJkPPTWB/8QjBitjMOfiCWOw2aS1Dtx9lxoxCoTtDhM=; b=arh1Bt25kblrMeXsdWEEBW4MM
	m/gQoSTDng+H/dCx6yh5c199La6B+BAlAM6/mKb7wTMgJyll+f33SziLQ/egQGvgOJvDAownB/7qx
	zokZiNiqe3c0Nq2DikjW8Hl52uAu7QkQ2TXtIDirhS3pi7aWqPfVTUjK1vSm+etqps5pg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iohM2-0000wk-MO; Tue, 07 Jan 2020 05:24:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3QxQUXgYKALIVjgkWfYggYdW.Uge@flex--drosen.bounces.google.com>)
 id 1iohM0-0000wc-U6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jan 2020 05:24:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1KoqFRm8toFHbQb4HraW6ZzquFQ8seovULWIbpVglyc=; b=N3rSB4Lo1vpwQ829UH7zpLz6e
 wMwxGNtt+AEu4cFIDd3/Cz+UcB7tGaLu8irPFeUw2txOC87q/du66BDQKQgJpq1Nr60x4V9B2pvrf
 xztFu0yP+GK15X5eEdRgsptbs7R8vC3AEd6cug554gPrSYUQ5aR1z+fZhZSfBPs6uLZbc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1KoqFRm8toFHbQb4HraW6ZzquFQ8seovULWIbpVglyc=; b=lvWrX354amxmhn8pHQ7x13tKmg
 aMtXzmQASiq+MKdagSKV71t/fgByhLF5t46jtseRQUfUB1kGCPAkYoaBxS9CjKC1vddh1KQckbYsQ
 9ONV1FLG1PS3Y2SziyMj4zek32zwplg1mtrph5ufWjssYKJjlK5ACy0cj9f1KAWWkw+c=;
Received: from mail-pl1-f201.google.com ([209.85.214.201])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iohLt-00CApi-U7
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jan 2020 05:24:32 +0000
Received: by mail-pl1-f201.google.com with SMTP id d24so20182098plr.18
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 06 Jan 2020 21:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=1KoqFRm8toFHbQb4HraW6ZzquFQ8seovULWIbpVglyc=;
 b=lLvfedis7T6R8lmSAP9Wh1Pxg+sftcc4vMdmmS0yfRe55tOgHHBMLZ+QfQdgVLoPE0
 INN8jInKrA9Z4XgoefL3qaCBYZpeKfAyDIHM7UdbdszU1wbKPj19jrZ6ufZBPDCEuZ68
 so0LVgwpC6MtNFPkVo5QD7RtXlvDZ5qFa7fcg1WmiETaA4HDsferh0X4dC2DWi43CFK3
 vjXAjA/2eDhLHcGBQr3wxPA4GsXJe8fXf2FkuEHayJvz7a5anXjjzHgoUkgVHcFVV51J
 1qJrf3LXIFJHqvI8QyIsdV+VTl0UBPaWG45ovj5xmje9JdwB0C8gRp2aouFep/yN8zGs
 0Saw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=1KoqFRm8toFHbQb4HraW6ZzquFQ8seovULWIbpVglyc=;
 b=ZCJJUomsSIXJ223pkP8KzlJnqWhwyrDn2Zwsk3Cql4h7J8J1BgPW09Cq9lz0jZvnQB
 zm1v4FsUqlKjXsvNJQXXRFZAb6FkZ9JQJhA6FzqD62l6Prde1aVfC5eEIDYVN7whurjU
 q8XIE/Vh3QZuLAIBJbat2J+Y++GU9MzLFnGzawLJMoTyYnSYY0tBYP5ZGweNXQUy+K1d
 ItpHEdVPNzE40mfSFifYq7lWxvRn8Sh/whXaKyoRRDHCl/UmURaY9ALPf88/1J8Y9u4o
 RrNcXD3WWKtFj4UUf2vojAMt9ahjn8zeNDzFCwEq8xoQjw2ARtC2A3c9s3jRWmdmMNnF
 jv3g==
X-Gm-Message-State: APjAAAXzCpf/S3J+g7Xb85BYjV8KqUDPab5Gp/XvfpqQpl6zH+C/Ban5
 WjfjOK07mXnmeTPOgEJga2yCauBrkKo=
X-Google-Smtp-Source: APXvYqz+aatsncKrBHi+meyY4vniJo1B8gKmB0ZHihWhsOLgzH6GowRM3C6j1PgdpzSWCkLxxBBxdnEIL4Y=
X-Received: by 2002:ad4:50d2:: with SMTP id e18mr82904873qvq.9.1578374211583; 
 Mon, 06 Jan 2020 21:16:51 -0800 (PST)
Date: Mon,  6 Jan 2020 21:16:34 -0800
In-Reply-To: <20200107051638.40893-1-drosen@google.com>
Message-Id: <20200107051638.40893-3-drosen@google.com>
Mime-Version: 1.0
References: <20200107051638.40893-1-drosen@google.com>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.201 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.201 listed in list.dnswl.org]
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
X-Headers-End: 1iohLt-00CApi-U7
Subject: [f2fs-dev] [PATCH v2 2/6] vfs: Fold casefolding into vfs
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
2.24.1.735.g03f4e72817-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
