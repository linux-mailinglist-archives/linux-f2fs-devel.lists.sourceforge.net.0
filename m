Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1CB2A1B2B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  1 Nov 2020 00:13:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZ03l-0005He-Sw; Sat, 31 Oct 2020 23:13:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kZ03k-0005HX-Bx
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Oct 2020 23:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jLYyqXAAcFjur1AeTAzRiQMnZNRfF5u2V8dg1NKSWQE=; b=ElOPYiVHgMASxF4ZYGLDgY6aEn
 5ZgexyCVC70XDZu8jwJ+lq7iu5O8jUMa0o6n6WFU6RjEe5GgWyQwcEhkFlbw0EHRjUt8PNbimglA/
 vvbViSjwo5WfT0mimjNH0TNbxob6LKedo99W2ynkVGYKT3/gaeBCc9b7oow0vYY5LKcw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jLYyqXAAcFjur1AeTAzRiQMnZNRfF5u2V8dg1NKSWQE=; b=izHnfSka/RVSbRRR/h+y1k2IZb
 WwqpbwFj6jf34dXO9wShoPcMfXUPOwzXhWeImxm4Cq5A9u+fujraU2fuOjdbLhFZKYQkrHqUf6Kdi
 6TM4hHbVvRC4Rf7kzyePAuqC+Ln5GegCWNxLdtCcLdacPjCwsbMR8I/QZ4E2doWRRJOA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZ03g-004TyO-C6
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 31 Oct 2020 23:13:20 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7ABE820885;
 Sat, 31 Oct 2020 23:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604185983;
 bh=tUczJQWP28yK2try47FWDEAXS1RXB2a9k8gq9h8g4ak=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j/fNwqHSQadcbYVoMyGnPqh6/dwa61ky59FiKH8Zb/frzAiwIq5irIG4W41paykfU
 Y611ixtTEIL5xO0/Dycm+/TT/4P5cjgdjgYN1vrTtAk28+oemJ55SVXv5CqaR8CERc
 E1Jp/LbI0YX2j1lwA0PZme605wNWSCBEX/KwOoKM=
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Date: Sat, 31 Oct 2020 16:11:23 -0700
Message-Id: <20201031231124.1199710-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201031231124.1199710-1-ebiggers@kernel.org>
References: <20201031231124.1199710-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kZ03g-004TyO-C6
Subject: [f2fs-dev] [PATCH 4.9 1/2] fscrypto: move ioctl processing more
 fully into common code
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

commit db717d8e26c2d1b0dba3e08668a1e6a7f665adde upstream.

Multiple bugs were recently fixed in the "set encryption policy" ioctl.
To make it clear that fscrypt_process_policy() and fscrypt_get_policy()
implement ioctls and therefore their implementations must take standard
security and correctness precautions, rename them to
fscrypt_ioctl_set_policy() and fscrypt_ioctl_get_policy().  Make the
latter take in a struct file * to make it consistent with the former.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Theodore Ts'o <tytso@mit.edu>
---
 fs/crypto/policy.c       | 34 +++++++++++++++++++++-------------
 fs/ext4/ext4.h           |  4 ++--
 fs/ext4/ioctl.c          | 34 +++++-----------------------------
 fs/f2fs/f2fs.h           |  4 ++--
 fs/f2fs/file.c           | 19 ++-----------------
 include/linux/fscrypto.h | 12 ++++++------
 6 files changed, 38 insertions(+), 69 deletions(-)

diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index 51f4463718e84..a89e50331deb6 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -93,16 +93,19 @@ static int create_encryption_context_from_policy(struct inode *inode,
 	return inode->i_sb->s_cop->set_context(inode, &ctx, sizeof(ctx), NULL);
 }
 
-int fscrypt_process_policy(struct file *filp,
-				const struct fscrypt_policy *policy)
+int fscrypt_ioctl_set_policy(struct file *filp, const void __user *arg)
 {
+	struct fscrypt_policy policy;
 	struct inode *inode = file_inode(filp);
 	int ret;
 
+	if (copy_from_user(&policy, arg, sizeof(policy)))
+		return -EFAULT;
+
 	if (!inode_owner_or_capable(inode))
 		return -EACCES;
 
-	if (policy->version != 0)
+	if (policy.version != 0)
 		return -EINVAL;
 
 	ret = mnt_want_write_file(filp);
@@ -122,9 +125,9 @@ int fscrypt_process_policy(struct file *filp,
 			ret = -ENOTEMPTY;
 		else
 			ret = create_encryption_context_from_policy(inode,
-								    policy);
+								    &policy);
 	} else if (!is_encryption_context_consistent_with_policy(inode,
-								 policy)) {
+								 &policy)) {
 		printk(KERN_WARNING
 		       "%s: Policy inconsistent with encryption context\n",
 		       __func__);
@@ -136,11 +139,13 @@ int fscrypt_process_policy(struct file *filp,
 	mnt_drop_write_file(filp);
 	return ret;
 }
-EXPORT_SYMBOL(fscrypt_process_policy);
+EXPORT_SYMBOL(fscrypt_ioctl_set_policy);
 
-int fscrypt_get_policy(struct inode *inode, struct fscrypt_policy *policy)
+int fscrypt_ioctl_get_policy(struct file *filp, void __user *arg)
 {
+	struct inode *inode = file_inode(filp);
 	struct fscrypt_context ctx;
+	struct fscrypt_policy policy;
 	int res;
 
 	if (!inode->i_sb->s_cop->get_context ||
@@ -153,15 +158,18 @@ int fscrypt_get_policy(struct inode *inode, struct fscrypt_policy *policy)
 	if (ctx.format != FS_ENCRYPTION_CONTEXT_FORMAT_V1)
 		return -EINVAL;
 
-	policy->version = 0;
-	policy->contents_encryption_mode = ctx.contents_encryption_mode;
-	policy->filenames_encryption_mode = ctx.filenames_encryption_mode;
-	policy->flags = ctx.flags;
-	memcpy(&policy->master_key_descriptor, ctx.master_key_descriptor,
+	policy.version = 0;
+	policy.contents_encryption_mode = ctx.contents_encryption_mode;
+	policy.filenames_encryption_mode = ctx.filenames_encryption_mode;
+	policy.flags = ctx.flags;
+	memcpy(policy.master_key_descriptor, ctx.master_key_descriptor,
 				FS_KEY_DESCRIPTOR_SIZE);
+
+	if (copy_to_user(arg, &policy, sizeof(policy)))
+		return -EFAULT;
 	return 0;
 }
-EXPORT_SYMBOL(fscrypt_get_policy);
+EXPORT_SYMBOL(fscrypt_ioctl_get_policy);
 
 /**
  * fscrypt_has_permitted_context() - is a file's encryption policy permitted
diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index b41ac328c3964..360954196e2f3 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -2354,8 +2354,8 @@ static inline void ext4_fname_free_filename(struct ext4_filename *fname) { }
 #define fscrypt_pullback_bio_page	fscrypt_notsupp_pullback_bio_page
 #define fscrypt_restore_control_page	fscrypt_notsupp_restore_control_page
 #define fscrypt_zeroout_range		fscrypt_notsupp_zeroout_range
-#define fscrypt_process_policy		fscrypt_notsupp_process_policy
-#define fscrypt_get_policy		fscrypt_notsupp_get_policy
+#define fscrypt_ioctl_set_policy	fscrypt_notsupp_ioctl_set_policy
+#define fscrypt_ioctl_get_policy	fscrypt_notsupp_ioctl_get_policy
 #define fscrypt_has_permitted_context	fscrypt_notsupp_has_permitted_context
 #define fscrypt_inherit_context		fscrypt_notsupp_inherit_context
 #define fscrypt_get_encryption_info	fscrypt_notsupp_get_encryption_info
diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
index eada4172c4ef1..2016f5a5d3cf1 100644
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@ -774,22 +774,12 @@ long ext4_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	}
 	case EXT4_IOC_PRECACHE_EXTENTS:
 		return ext4_ext_precache(inode);
-	case EXT4_IOC_SET_ENCRYPTION_POLICY: {
-#ifdef CONFIG_EXT4_FS_ENCRYPTION
-		struct fscrypt_policy policy;
 
+	case EXT4_IOC_SET_ENCRYPTION_POLICY:
 		if (!ext4_has_feature_encrypt(sb))
 			return -EOPNOTSUPP;
+		return fscrypt_ioctl_set_policy(filp, (const void __user *)arg);
 
-		if (copy_from_user(&policy,
-				   (struct fscrypt_policy __user *)arg,
-				   sizeof(policy)))
-			return -EFAULT;
-		return fscrypt_process_policy(filp, &policy);
-#else
-		return -EOPNOTSUPP;
-#endif
-	}
 	case EXT4_IOC_GET_ENCRYPTION_PWSALT: {
 		int err, err2;
 		struct ext4_sb_info *sbi = EXT4_SB(sb);
@@ -826,23 +816,9 @@ long ext4_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 			return -EFAULT;
 		return 0;
 	}
-	case EXT4_IOC_GET_ENCRYPTION_POLICY: {
-#ifdef CONFIG_EXT4_FS_ENCRYPTION
-		struct fscrypt_policy policy;
-		int err = 0;
-
-		if (!ext4_encrypted_inode(inode))
-			return -ENOENT;
-		err = fscrypt_get_policy(inode, &policy);
-		if (err)
-			return err;
-		if (copy_to_user((void __user *)arg, &policy, sizeof(policy)))
-			return -EFAULT;
-		return 0;
-#else
-		return -EOPNOTSUPP;
-#endif
-	}
+	case EXT4_IOC_GET_ENCRYPTION_POLICY:
+		return fscrypt_ioctl_get_policy(filp, (void __user *)arg);
+
 	case EXT4_IOC_FSGETXATTR:
 	{
 		struct fsxattr fa;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b16ab4187234d..7016a59142e3e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2513,8 +2513,8 @@ static inline bool f2fs_may_encrypt(struct inode *inode)
 #define fscrypt_pullback_bio_page	fscrypt_notsupp_pullback_bio_page
 #define fscrypt_restore_control_page	fscrypt_notsupp_restore_control_page
 #define fscrypt_zeroout_range		fscrypt_notsupp_zeroout_range
-#define fscrypt_process_policy		fscrypt_notsupp_process_policy
-#define fscrypt_get_policy		fscrypt_notsupp_get_policy
+#define fscrypt_ioctl_set_policy	fscrypt_notsupp_ioctl_set_policy
+#define fscrypt_ioctl_get_policy	fscrypt_notsupp_ioctl_get_policy
 #define fscrypt_has_permitted_context	fscrypt_notsupp_has_permitted_context
 #define fscrypt_inherit_context		fscrypt_notsupp_inherit_context
 #define fscrypt_get_encryption_info	fscrypt_notsupp_get_encryption_info
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e3c438c8b8ce0..0bedcd70b51f4 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1774,31 +1774,16 @@ static bool uuid_is_nonzero(__u8 u[16])
 
 static int f2fs_ioc_set_encryption_policy(struct file *filp, unsigned long arg)
 {
-	struct fscrypt_policy policy;
 	struct inode *inode = file_inode(filp);
 
-	if (copy_from_user(&policy, (struct fscrypt_policy __user *)arg,
-							sizeof(policy)))
-		return -EFAULT;
-
 	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
 
-	return fscrypt_process_policy(filp, &policy);
+	return fscrypt_ioctl_set_policy(filp, (const void __user *)arg);
 }
 
 static int f2fs_ioc_get_encryption_policy(struct file *filp, unsigned long arg)
 {
-	struct fscrypt_policy policy;
-	struct inode *inode = file_inode(filp);
-	int err;
-
-	err = fscrypt_get_policy(inode, &policy);
-	if (err)
-		return err;
-
-	if (copy_to_user((struct fscrypt_policy __user *)arg, &policy, sizeof(policy)))
-		return -EFAULT;
-	return 0;
+	return fscrypt_ioctl_get_policy(filp, (void __user *)arg);
 }
 
 static int f2fs_ioc_get_encryption_pwsalt(struct file *filp, unsigned long arg)
diff --git a/include/linux/fscrypto.h b/include/linux/fscrypto.h
index f6dfc2950f764..3b1f17dbf92d9 100644
--- a/include/linux/fscrypto.h
+++ b/include/linux/fscrypto.h
@@ -249,8 +249,8 @@ extern void fscrypt_restore_control_page(struct page *);
 extern int fscrypt_zeroout_range(struct inode *, pgoff_t, sector_t,
 						unsigned int);
 /* policy.c */
-extern int fscrypt_process_policy(struct file *, const struct fscrypt_policy *);
-extern int fscrypt_get_policy(struct inode *, struct fscrypt_policy *);
+extern int fscrypt_ioctl_set_policy(struct file *, const void __user *);
+extern int fscrypt_ioctl_get_policy(struct file *, void __user *);
 extern int fscrypt_has_permitted_context(struct inode *, struct inode *);
 extern int fscrypt_inherit_context(struct inode *, struct inode *,
 					void *, bool);
@@ -318,14 +318,14 @@ static inline int fscrypt_notsupp_zeroout_range(struct inode *i, pgoff_t p,
 }
 
 /* policy.c */
-static inline int fscrypt_notsupp_process_policy(struct file *f,
-				const struct fscrypt_policy *p)
+static inline int fscrypt_notsupp_ioctl_set_policy(struct file *f,
+				const void __user *arg)
 {
 	return -EOPNOTSUPP;
 }
 
-static inline int fscrypt_notsupp_get_policy(struct inode *i,
-				struct fscrypt_policy *p)
+static inline int fscrypt_notsupp_ioctl_get_policy(struct file *f,
+				void __user *arg)
 {
 	return -EOPNOTSUPP;
 }
-- 
2.29.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
