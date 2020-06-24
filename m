Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C46C7206C54
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2020 08:25:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wPg5nIXBbdcbiwCst3514BbtltyVe/Or/+xVq+9pml8=; b=OQRg/e5kzdtByEvstnKXwkBpk
	7+TZKbQkErRkDdaHwiaf388PQOw67eHzP6E6GxO4dZ/Br6eA9QZY7lbHa6a8n6fej1rizmlGoGXSF
	gbsF2DZLEMkRxut9fxngYPP3C9O+AWGeLtuZ6ITY3RAGRU6wOGJFweRsbWU9e6Jmcooe4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jnyr1-0003Av-S6; Wed, 24 Jun 2020 06:25:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3t9fyXgYKADAPdaeQZSaaSXQ.OaY@flex--drosen.bounces.google.com>)
 id 1jnyr0-0003Ak-5l
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Jun 2020 06:25:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QODIzVeJrdT1s8AIsgAZkNeVeFFuI7HH8hKtZUq7344=; b=WGSEDV2T6oKh2FsCPC6zewISR
 oIt4c8z66gUuqvgbATxW0XU6ldvggMsET7xPzzYQa4x0yqeUUTUzraqIS5mixVAf8ERKTbgNQaEY9
 TnoOG58SREhTTwO8Gw11Xbyda9mbSlO53lOO4EzxnvntuXGyxckCq5vm/JA8UlHj1iBeE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QODIzVeJrdT1s8AIsgAZkNeVeFFuI7HH8hKtZUq7344=; b=BVhYlSxGCWfghjJJ6fOV/Hz1fK
 NXv5xFaUgF41kdlHJqeykLCBsK135DWfJMrRX484q6VCizOPlgSeLzBI62VdhL/+avSF9XfY23TPq
 A1DdEEbIgHyFSXBL00zlJr3NH0IwVq8uFmPsRmF2Cgg/DtI4/rOHgI5i4qqDNuCRjdvo=;
Received: from mail-vs1-f73.google.com ([209.85.217.73])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jnyqy-00Gk7N-Cd
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Jun 2020 06:25:50 +0000
Received: by mail-vs1-f73.google.com with SMTP id l19so681462vsp.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 23 Jun 2020 23:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=QODIzVeJrdT1s8AIsgAZkNeVeFFuI7HH8hKtZUq7344=;
 b=hWHEcXJ9aNrUXZyw33b3LmQOzvvcHuDW/A59nhjR5XQMLw5Qc925QSXhkERNImFcTW
 hANpGu19yKJ5+ofMIYmkF6TKYrS6Nz04N8XYUx1I3Pa4GgUquwMBJKxs29u86c7WgX2K
 RRe307Q7mfy+NjviZftXsu8kT999uG5LrB4rhhXsgo5tbdmLXVI5wJc18RWcgCYEfr1k
 ek2aoIIofzYBCRkoj8bTxC0G24p8GbTIhh9lWGZ9g6Nn5ntXhMQoIPDlw//uXtbDJSXC
 eLkDvnHk0IzkMvraG+Dsoo9PjzeSb8M7sIqjzEN4gF1fxbic3Daktg/Se4hGo4hYuOdt
 NXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=QODIzVeJrdT1s8AIsgAZkNeVeFFuI7HH8hKtZUq7344=;
 b=XQydOSV0cKlJAZozo9S+SxmLUbqqkpQmjJJrdNxjcWjvm7dxAmrNmvRF9HP+kbjnTG
 +tQLyQg6PgutKoDWNanIuFavewxMQAw+go0xjEZ0ngc90BpfmThajYtrS6JlcEBHo1A2
 OGo1AK5mSTbLKqaFpB1z2t8J822Zg8YIwKYNEzG7li5C5jLQ6hYxhXRyMAbeDS8K0d5x
 BmLmmCJgEBZ8vrDHWcJuO1IZzPwuz0SYIRGRPuAIIkE6lqM+Voknx0XCn5bSsPpl7LDr
 DWxFyq84x4KvmWxXCFsa/qjUn+JUi3szaHOcxt6tGPFplpUpNg9kefY9ry+1JIivX3Yj
 F9bw==
X-Gm-Message-State: AOAM533pjJHwaRkNu+LaxOuhUMl4RYTKkXeGv1Lg2p+SLqvQhZUNLU+r
 VIlMvk35K2//W6Mo0WSiWnVwLrzf4S0=
X-Google-Smtp-Source: ABdhPJxWR2OSY2LIwmJtD7fXyPCoacDbLcf/0SnMpXGaS+dBq70pCLIvLZrm8yY4Wcv1/MkLvCZlNjW4Qew=
X-Received: by 2002:ad4:5533:: with SMTP id ba19mr5259319qvb.110.1592973239889; 
 Tue, 23 Jun 2020 21:33:59 -0700 (PDT)
Date: Tue, 23 Jun 2020 21:33:39 -0700
In-Reply-To: <20200624043341.33364-1-drosen@google.com>
Message-Id: <20200624043341.33364-3-drosen@google.com>
Mime-Version: 1.0
References: <20200624043341.33364-1-drosen@google.com>
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.73 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.73 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1jnyqy-00Gk7N-Cd
Subject: [f2fs-dev] [PATCH v9 2/4] fs: Add standard casefolding support
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

Ext4 and F2fs will switch to these common implementations.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/libfs.c         | 101 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fs.h |  22 ++++++++++
 2 files changed, 123 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index 4d08edf19c782..f7345a5ed562f 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -20,6 +20,8 @@
 #include <linux/fs_context.h>
 #include <linux/pseudo_fs.h>
 #include <linux/fsnotify.h>
+#include <linux/unicode.h>
+#include <linux/fscrypt.h>
 
 #include <linux/uaccess.h>
 
@@ -1363,3 +1365,102 @@ bool is_empty_dir_inode(struct inode *inode)
 	return (inode->i_fop == &empty_dir_operations) &&
 		(inode->i_op == &empty_dir_inode_operations);
 }
+
+#ifdef CONFIG_UNICODE
+/**
+ * needs_casefold - generic helper to determine if a filename should be casefolded
+ * @dir: Parent directory
+ *
+ * Generic helper for filesystems to use to determine if the name of a dentry
+ * should be casefolded. It does not make sense to casefold the no-key token of
+ * an encrypted filename.
+ *
+ * Return: if names will need casefolding
+ */
+bool needs_casefold(const struct inode *dir)
+{
+	return IS_CASEFOLDED(dir) && dir->i_sb->s_encoding &&
+			(!IS_ENCRYPTED(dir) || fscrypt_has_encryption_key(dir));
+}
+EXPORT_SYMBOL(needs_casefold);
+
+/**
+ * generic_ci_d_compare - generic d_compare implementation for casefolding filesystems
+ * @dentry:	dentry whose name we are checking against
+ * @len:	len of name of dentry
+ * @str:	str pointer to name of dentry
+ * @name:	Name to compare against
+ *
+ * Return: 0 if names match, 1 if mismatch, or -ERRNO
+ */
+int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
+			  const char *str, const struct qstr *name)
+{
+	const struct dentry *parent = READ_ONCE(dentry->d_parent);
+	const struct inode *inode = READ_ONCE(parent->d_inode);
+	const struct super_block *sb = dentry->d_sb;
+	const struct unicode_map *um = sb->s_encoding;
+	struct qstr qstr = QSTR_INIT(str, len);
+	char strbuf[DNAME_INLINE_LEN];
+	int ret;
+
+	if (!inode || !needs_casefold(inode))
+		goto fallback;
+	/*
+	 * If the dentry name is stored in-line, then it may be concurrently
+	 * modified by a rename.  If this happens, the VFS will eventually retry
+	 * the lookup, so it doesn't matter what ->d_compare() returns.
+	 * However, it's unsafe to call utf8_strncasecmp() with an unstable
+	 * string.  Therefore, we have to copy the name into a temporary buffer.
+	 */
+	if (len <= DNAME_INLINE_LEN - 1) {
+		memcpy(strbuf, str, len);
+		strbuf[len] = 0;
+		qstr.name = strbuf;
+		/* prevent compiler from optimizing out the temporary buffer */
+		barrier();
+	}
+	ret = utf8_strncasecmp(um, name, &qstr);
+	if (ret >= 0)
+		return ret;
+
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
+ * generic_ci_d_hash - generic d_hash implementation for casefolding filesystems
+ * @dentry:	dentry whose name we are hashing
+ * @str:	qstr of name whose hash we should fill in
+ *
+ * Return: 0 if hash was successful, or -ERRNO
+ */
+int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
+{
+	const struct inode *inode = READ_ONCE(dentry->d_inode);
+	struct super_block *sb = dentry->d_sb;
+	const struct unicode_map *um = sb->s_encoding;
+	int ret = 0;
+
+	if (!inode || !needs_casefold(inode))
+		return 0;
+
+	ret = utf8_casefold_hash(um, dentry, str);
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
index 3f881a892ea74..261904e06873b 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1392,6 +1392,12 @@ extern int send_sigurg(struct fown_struct *fown);
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
@@ -1461,6 +1467,10 @@ struct super_block {
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
@@ -3385,6 +3395,18 @@ extern int generic_file_fsync(struct file *, loff_t, loff_t, int);
 
 extern int generic_check_addressable(unsigned, u64);
 
+#ifdef CONFIG_UNICODE
+extern int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str);
+extern int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
+				const char *str, const struct qstr *name);
+extern bool needs_casefold(const struct inode *dir);
+#else
+static inline bool needs_casefold(const struct inode *dir)
+{
+	return 0;
+}
+#endif
+
 #ifdef CONFIG_MIGRATION
 extern int buffer_migrate_page(struct address_space *,
 				struct page *, struct page *,
-- 
2.27.0.111.gc72c7da667-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
