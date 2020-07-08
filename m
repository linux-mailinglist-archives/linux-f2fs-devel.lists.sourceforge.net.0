Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A7D21833D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jul 2020 11:13:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S4r83GGIMIrMs+kSoPlW8wngdtiS9LJ174415JmDTMA=; b=aa+J2ByXQGNCoRkSwkYnRI9nj
	DDNW+sZGKeZQLX8XzYBvYgce+/yY+Dcbr6kz32Oc3+Gwh58hWp38FQ5F3XXOEiIV+Z7l1Hq11h31w
	lo7vmjGBxLfGFlE6Pf2bGbI3iZoqVdk7JqnyheZo3nk8EKUxIHuHCMPM/1uK6g7zIdnCM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jt68T-0006bt-RE; Wed, 08 Jul 2020 09:13:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3DI4FXwYKAD0cqnrdmfnnfkd.bnl@flex--drosen.bounces.google.com>)
 id 1jt68R-0006bb-QV
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 09:12:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8+TC1+grcd9+1L+bfv/X5qx9D+VjZ57HqDGHlmrwyxg=; b=N3TSBicLmL7AVMA4i2Sftd2YC
 3/QqJemmjACchTiebM+3NJMjSfUUfBRpBoYwnTXxlouiMq6BHPOXTivHHBzTnNgIumhdE0E8CSxJ/
 rtrm4fWlg9qKleQQv8qUz7MtjlKSRETNeOGAx1S8BCLab0R8tvy0Tmnn3BdkpRtFiDDTs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8+TC1+grcd9+1L+bfv/X5qx9D+VjZ57HqDGHlmrwyxg=; b=MQgxr5CIXrqBB1ukxZdZgyEnCV
 ogBEW4iihnitlP+pX0ohajXRcNCDe5n5UL8TglMFkaZVOe5NxY668Lhi3ZhmPpg2b8eeNYBoWdae4
 VDAGXilzkqURCO9c/MqfVahznsk6fMYyvCky0qkjW6Gq4h3kE55wYoIYcVAG56JKjw6U=;
Received: from mail-pg1-f201.google.com ([209.85.215.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jt68P-00H7Xv-LV
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jul 2020 09:12:59 +0000
Received: by mail-pg1-f201.google.com with SMTP id h5so30881179pgq.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 08 Jul 2020 02:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=8+TC1+grcd9+1L+bfv/X5qx9D+VjZ57HqDGHlmrwyxg=;
 b=q96aTbimluUtEdhrrGai6ITGwzBJEtjxuyK5R4Ohgo8jMj9xT3CE2pEQIPnI7YgKU0
 iZ+R+ujBZAkfm3i2yakoOqzAq77sDJ/DKwpxAwoYSJS5CsOoGES9CaumlTPPXerTo9rC
 svZP+qq435cqH5JMxhzd9HO0liyx1FRkgh+/JRijSnPZOCQoUUtu6NWMnDdYja6WCMQl
 WiOQFv8qa0NeOoqy7UgLEytqpfiFUb9Urs87YvVE9ZEk4azikkjjTTgMNa/LP41wArMS
 hovD05z9U+Vg3zkwPRG7uM3rnKL7GPzr6qaRxTaPbnB06HagWo8ViUYYrUf2i+6dDvHW
 p/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=8+TC1+grcd9+1L+bfv/X5qx9D+VjZ57HqDGHlmrwyxg=;
 b=LImd2AwXp/xdvUKDIw36zPoUMqeKevMMBOUE6AenbHplPqRYNckgvADWZP3uDM/+LV
 p0Bnw1zsy7TS/rNjo0u7fh2YZPv7wvuMhK3fzZjQt4pjMRniM/XI+rUG1kBIW/02fyJc
 rlvDcswm80w061cKu903WnCwXreQbWmZ6CV3pNPkldtwvlPJBF/B465SiAikN3mdGVhs
 ffeNz2N3swNWt2AoaGGLpW5WhPBnJDUH0qVYuaONJe43jtwUuSuuNfCKK3492Dihl7+9
 mRXpOKahEbYxfkLyTlCcIYlhLOdDWmZvWe1OgGHhzBLFEleSZu6wg2NH9//IywT3+UKI
 UoFg==
X-Gm-Message-State: AOAM532xkLHlBuPaGAZJNKQm5dP3ZYv7v4eJ4gIcgjKEuOKEBOYi8IQ4
 abwcTgE3UgM2Zu0QOwcRoSq8s2wiJjE=
X-Google-Smtp-Source: ABdhPJymFIDabeVHG9reQJ9gahP1lHCXjNoctA7rMpb+c+pa+O+mAAY16K2hflrIoUySyNa//P1EBBAuC2Y=
X-Received: by 2002:a17:90b:1993:: with SMTP id
 mv19mr8603393pjb.39.1594199564949; 
 Wed, 08 Jul 2020 02:12:44 -0700 (PDT)
Date: Wed,  8 Jul 2020 02:12:35 -0700
In-Reply-To: <20200708091237.3922153-1-drosen@google.com>
Message-Id: <20200708091237.3922153-3-drosen@google.com>
Mime-Version: 1.0
References: <20200708091237.3922153-1-drosen@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: qstr.name]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.201 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.201 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jt68P-00H7Xv-LV
Subject: [f2fs-dev] [PATCH v12 2/4] fs: Add standard casefolding support
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
 linux-kernel@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This adds general supporting functions for filesystems that use
utf8 casefolding. It provides standard dentry_operations and adds the
necessary structures in struct super_block to allow this standardization.

The new dentry operations are functionally equivalent to the existing
operations in ext4 and f2fs, apart from the use of utf8_casefold_hash to
avoid an allocation.

By providing a common implementation, all users can benefit from any
optimizations without needing to port over improvements.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/libfs.c         | 87 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fs.h | 16 +++++++++
 2 files changed, 103 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index 4d08edf19c78..72407cf151d4 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -20,6 +20,8 @@
 #include <linux/fs_context.h>
 #include <linux/pseudo_fs.h>
 #include <linux/fsnotify.h>
+#include <linux/unicode.h>
+#include <linux/fscrypt.h>
 
 #include <linux/uaccess.h>
 
@@ -1363,3 +1365,88 @@ bool is_empty_dir_inode(struct inode *inode)
 	return (inode->i_fop == &empty_dir_operations) &&
 		(inode->i_op == &empty_dir_inode_operations);
 }
+
+#ifdef CONFIG_UNICODE
+/*
+ * Determine if the name of a dentry should be casefolded.
+ *
+ * Return: if names will need casefolding
+ */
+static bool needs_casefold(const struct inode *dir)
+{
+	return IS_CASEFOLDED(dir) && dir->i_sb->s_encoding;
+}
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
+	const struct inode *dir = READ_ONCE(parent->d_inode);
+	const struct super_block *sb = dentry->d_sb;
+	const struct unicode_map *um = sb->s_encoding;
+	struct qstr qstr = QSTR_INIT(str, len);
+	char strbuf[DNAME_INLINE_LEN];
+	int ret;
+
+	if (!dir || !needs_casefold(dir))
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
+	if (sb_has_strict_encoding(sb))
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
+ * @dentry:	dentry of the parent directory
+ * @str:	qstr of name whose hash we should fill in
+ *
+ * Return: 0 if hash was successful or unchanged, and -EINVAL on error
+ */
+int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
+{
+	const struct inode *dir = READ_ONCE(dentry->d_inode);
+	struct super_block *sb = dentry->d_sb;
+	const struct unicode_map *um = sb->s_encoding;
+	int ret = 0;
+
+	if (!dir || !needs_casefold(dir))
+		return 0;
+
+	ret = utf8_casefold_hash(um, dentry, str);
+	if (ret < 0 && sb_has_strict_encoding(sb))
+		return -EINVAL;
+	return 0;
+}
+EXPORT_SYMBOL(generic_ci_d_hash);
+#endif
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 3f881a892ea7..af8f2ecec8ff 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1392,6 +1392,12 @@ extern int send_sigurg(struct fown_struct *fown);
 #define SB_ACTIVE	(1<<30)
 #define SB_NOUSER	(1<<31)
 
+/* These flags relate to encoding and casefolding */
+#define SB_ENC_STRICT_MODE_FL	(1 << 0)
+
+#define sb_has_strict_encoding(sb) \
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
@@ -3385,6 +3395,12 @@ extern int generic_file_fsync(struct file *, loff_t, loff_t, int);
 
 extern int generic_check_addressable(unsigned, u64);
 
+#ifdef CONFIG_UNICODE
+extern int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str);
+extern int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
+				const char *str, const struct qstr *name);
+#endif
+
 #ifdef CONFIG_MIGRATION
 extern int buffer_migrate_page(struct address_space *,
 				struct page *, struct page *,
-- 
2.27.0.383.g050319c2ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
