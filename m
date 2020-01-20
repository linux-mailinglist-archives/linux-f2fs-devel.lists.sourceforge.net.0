Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9324814227B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jan 2020 05:49:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1itOzy-0003c2-DH; Mon, 20 Jan 2020 04:49:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1itOzv-0003bN-OH
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jan 2020 04:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U2qup7If+VLv2fCTxrLrPwgr9qLKR4toRxPtWTtmNYU=; b=kcxEn1E182yd8/3ITghuWncuxP
 URciehRTO4rUcAbH7G3A9rcrUq3l4idX2h3We3qaZZCjhYwe3mrdD+0JACi63NrAg+BEVw81Xk2No
 GEFJGhvs4QrtexV2twC6wFgcZM39tGD8j2pEV+KnYB3zQBKaMKJF/5/RlOeIsNk7Gx5s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U2qup7If+VLv2fCTxrLrPwgr9qLKR4toRxPtWTtmNYU=; b=UHF2sn7EzyB9wDsMgauFlo4ZVV
 a7rxkT0TerRIizieeWdSZRx14lGhZWdwGGXkU6jf9w+JFmAy9cl/X0ZFltMa+qXsIfTm5g4nhfzKf
 +oIpjz/r1JI+nb/4DmRaCARvXNDKtYbnQoDAlOA7dXaTKBeQTEPM/MmmbatIEAPAAMDs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1itOzm-00EZzq-RA
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jan 2020 04:49:11 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 17AD12073D;
 Mon, 20 Jan 2020 04:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579495737;
 bh=v2IOamtEHR2AceXQ2i+GCO37/2hpui4sIXfA+tBcEXg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=caYznpiyRE09Z5jprf6wPliiMJ/puPGcB+9+PbpHbhHD+J2nFGO0qqnCs1IGKpVZm
 9BPh3qWiUhuJoSpy2Joua7BsPcaNPW7/qt+s+/f5yjG6f3dMXJV4VhbTcVvIsH3sRn
 IxqVlMVSdl1hBcnUD5IWDg9c6vt0gqA2md00kepg=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Sun, 19 Jan 2020 20:43:58 -0800
Message-Id: <20200120044401.325453-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200120044401.325453-1-ebiggers@kernel.org>
References: <20200120044401.325453-1-ebiggers@kernel.org>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1itOzm-00EZzq-RA
Subject: [f2fs-dev] [PATCH v4 1/4] fscrypt: don't allow v1 policies with
 casefolding
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
Cc: Daniel Rosenberg <drosen@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daniel Rosenberg <drosen@google.com>

Casefolded encrypted directories will use a new dirhash method that
requires a secret key.  If the directory uses a v2 encryption policy,
it's easy to derive this key from the master key using HKDF.  However,
v1 encryption policies don't provide a way to derive additional keys.

Therefore, don't allow casefolding on directories that use a v1 policy.
Specifically, make it so that trying to enable casefolding on a
directory that has a v1 policy fails, trying to set a v1 policy on a
casefolded directory fails, and trying to open a casefolded directory
that has a v1 policy (if one somehow exists on-disk) fails.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
[EB: improved commit message, updated fscrypt.rst, and other cleanups]
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/filesystems/fscrypt.rst |  4 +++-
 fs/crypto/hooks.c                     | 28 +++++++++++++++++++++++++++
 fs/crypto/policy.c                    |  7 +++++++
 fs/inode.c                            |  3 ++-
 include/linux/fscrypt.h               |  9 +++++++++
 5 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index 9c53336d06a43..380a1be9550e1 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -513,7 +513,9 @@ FS_IOC_SET_ENCRYPTION_POLICY can fail with the following errors:
 - ``EEXIST``: the file is already encrypted with an encryption policy
   different from the one specified
 - ``EINVAL``: an invalid encryption policy was specified (invalid
-  version, mode(s), or flags; or reserved bits were set)
+  version, mode(s), or flags; or reserved bits were set); or a v1
+  encryption policy was specified but the directory has the casefold
+  flag enabled (casefolding is incompatible with v1 policies).
 - ``ENOKEY``: a v2 encryption policy was specified, but the key with
   the specified ``master_key_identifier`` has not been added, nor does
   the process have the CAP_FOWNER capability in the initial user
diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index bb3b7fcfdd48a..d96a58f11d2b0 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -122,6 +122,34 @@ int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry,
 }
 EXPORT_SYMBOL_GPL(__fscrypt_prepare_lookup);
 
+/**
+ * fscrypt_prepare_setflags() - prepare to change flags with FS_IOC_SETFLAGS
+ * @inode: the inode on which flags are being changed
+ * @oldflags: the old flags
+ * @flags: the new flags
+ *
+ * The caller should be holding i_rwsem for write.
+ *
+ * Return: 0 on success; -errno if the flags change isn't allowed or if
+ *	   another error occurs.
+ */
+int fscrypt_prepare_setflags(struct inode *inode,
+			     unsigned int oldflags, unsigned int flags)
+{
+	struct fscrypt_info *ci;
+	int err;
+
+	if (IS_ENCRYPTED(inode) && (flags & ~oldflags & FS_CASEFOLD_FL)) {
+		err = fscrypt_require_key(inode);
+		if (err)
+			return err;
+		ci = inode->i_crypt_info;
+		if (ci->ci_policy.version != FSCRYPT_POLICY_V2)
+			return -EINVAL;
+	}
+	return 0;
+}
+
 int __fscrypt_prepare_symlink(struct inode *dir, unsigned int len,
 			      unsigned int max_len,
 			      struct fscrypt_str *disk_link)
diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index f1cff83c151ac..cf2a9d26ef7da 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -124,6 +124,13 @@ static bool fscrypt_supported_v1_policy(const struct fscrypt_policy_v1 *policy,
 					policy->filenames_encryption_mode))
 		return false;
 
+	if (IS_CASEFOLDED(inode)) {
+		/* With v1, there's no way to derive dirhash keys. */
+		fscrypt_warn(inode,
+			     "v1 policies can't be used on casefolded directories");
+		return false;
+	}
+
 	return true;
 }
 
diff --git a/fs/inode.c b/fs/inode.c
index 96d62d97694ef..ea15c6d9f2742 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -12,6 +12,7 @@
 #include <linux/security.h>
 #include <linux/cdev.h>
 #include <linux/memblock.h>
+#include <linux/fscrypt.h>
 #include <linux/fsnotify.h>
 #include <linux/mount.h>
 #include <linux/posix_acl.h>
@@ -2252,7 +2253,7 @@ int vfs_ioc_setflags_prepare(struct inode *inode, unsigned int oldflags,
 	    !capable(CAP_LINUX_IMMUTABLE))
 		return -EPERM;
 
-	return 0;
+	return fscrypt_prepare_setflags(inode, oldflags, flags);
 }
 EXPORT_SYMBOL(vfs_ioc_setflags_prepare);
 
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 6fe8d0f96a4ac..3984eadd7023f 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -263,6 +263,8 @@ extern int __fscrypt_prepare_rename(struct inode *old_dir,
 				    unsigned int flags);
 extern int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry,
 				    struct fscrypt_name *fname);
+extern int fscrypt_prepare_setflags(struct inode *inode,
+				    unsigned int oldflags, unsigned int flags);
 extern int __fscrypt_prepare_symlink(struct inode *dir, unsigned int len,
 				     unsigned int max_len,
 				     struct fscrypt_str *disk_link);
@@ -519,6 +521,13 @@ static inline int __fscrypt_prepare_lookup(struct inode *dir,
 	return -EOPNOTSUPP;
 }
 
+static inline int fscrypt_prepare_setflags(struct inode *inode,
+					   unsigned int oldflags,
+					   unsigned int flags)
+{
+	return 0;
+}
+
 static inline int __fscrypt_prepare_symlink(struct inode *dir,
 					    unsigned int len,
 					    unsigned int max_len,
-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
