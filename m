Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA73267EB2
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 13 Sep 2020 10:38:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kHNWt-0005US-Dv; Sun, 13 Sep 2020 08:38:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kHNWo-0005T9-9I
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 13 Sep 2020 08:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vwuwyW3Mkc/+44AJ6/Q4zGoyv2mP8DqJB3+QEP609hQ=; b=YfsclzXba0GefmV5jF6Jwoxml/
 hlwfL/fZGAlobiV9Y5HoVzHkkk/+/sgXJCq5MoFxfZ4MuwovGhK+EnxfY+4Qf7IM0YbIEUTTrmQcu
 aE4yL69s3MZ05tiwqW/poQIorLrf4bD7EEMqkdCNZSFEFRVzVsALNbfd38zJrlsBOlxc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vwuwyW3Mkc/+44AJ6/Q4zGoyv2mP8DqJB3+QEP609hQ=; b=UQuWscP3uLvvlYWUcAcHvWzzXT
 OBbFbmoJXALTGLBWTIC4spd6Y6a0mYdeMPXsIIpRTzZonmb+X/xEW0SGpK8fa6YUVtPsGd2M2hOv3
 UGOr5vYXPOdFEyY31UcasQ0NqCZuKPK525FRYMLfdVwEdQstZmn6K0A9WozV4aAHQuPU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kHNWh-006qBu-K1
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 13 Sep 2020 08:38:26 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8F613221E8;
 Sun, 13 Sep 2020 08:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599986280;
 bh=SHrYUdtm1g7ntgYtdzixMrvNEz6L5/D07nXI8RMvuM4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=veKboLnYaZiOTtz2C8eTq+4ZzLtMFia4/2LmiMxvTMRGrBr7KkSQff6AbozrpZCjI
 r7KZJPqL7OLkVIJp0K7kUKARQmFdsbBKV25xdjuZcfTY+pIznei/mrRSnKdbJUGBoU
 ODgwD4kGxAx2Jksu0dMPri89adQ4x8OCkHTNGDEE=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Sun, 13 Sep 2020 01:36:19 -0700
Message-Id: <20200913083620.170627-11-ebiggers@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200913083620.170627-1-ebiggers@kernel.org>
References: <20200913083620.170627-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -1.8 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.7 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kHNWh-006qBu-K1
Subject: [f2fs-dev] [PATCH v2 10/11] fscrypt: move fscrypt_prepare_symlink()
 out-of-line
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
Cc: Daniel Rosenberg <drosen@google.com>, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

In preparation for moving the logic for "get the encryption policy
inherited by new files in this directory" to a single place, make
fscrypt_prepare_symlink() a regular function rather than an inline
function that wraps __fscrypt_prepare_symlink().

This way, the new function fscrypt_policy_to_inherit() won't need to be
exported to filesystems.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/hooks.c       | 39 ++++++++++++++++++++++---
 include/linux/fscrypt.h | 63 ++++++++++-------------------------------
 2 files changed, 50 insertions(+), 52 deletions(-)

diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 7748db5092409..a399c54947f28 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -166,12 +166,43 @@ int fscrypt_prepare_setflags(struct inode *inode,
 	return 0;
 }
 
-int __fscrypt_prepare_symlink(struct inode *dir, unsigned int len,
-			      unsigned int max_len,
-			      struct fscrypt_str *disk_link)
+/**
+ * fscrypt_prepare_symlink() - prepare to create a possibly-encrypted symlink
+ * @dir: directory in which the symlink is being created
+ * @target: plaintext symlink target
+ * @len: length of @target excluding null terminator
+ * @max_len: space the filesystem has available to store the symlink target
+ * @disk_link: (out) the on-disk symlink target being prepared
+ *
+ * This function computes the size the symlink target will require on-disk,
+ * stores it in @disk_link->len, and validates it against @max_len.  An
+ * encrypted symlink may be longer than the original.
+ *
+ * Additionally, @disk_link->name is set to @target if the symlink will be
+ * unencrypted, but left NULL if the symlink will be encrypted.  For encrypted
+ * symlinks, the filesystem must call fscrypt_encrypt_symlink() to create the
+ * on-disk target later.  (The reason for the two-step process is that some
+ * filesystems need to know the size of the symlink target before creating the
+ * inode, e.g. to determine whether it will be a "fast" or "slow" symlink.)
+ *
+ * Return: 0 on success, -ENAMETOOLONG if the symlink target is too long,
+ * -ENOKEY if the encryption key is missing, or another -errno code if a problem
+ * occurred while setting up the encryption key.
+ */
+int fscrypt_prepare_symlink(struct inode *dir, const char *target,
+			    unsigned int len, unsigned int max_len,
+			    struct fscrypt_str *disk_link)
 {
 	int err;
 
+	if (!IS_ENCRYPTED(dir) && !fscrypt_get_dummy_context(dir->i_sb)) {
+		disk_link->name = (unsigned char *)target;
+		disk_link->len = len + 1;
+		if (disk_link->len > max_len)
+			return -ENAMETOOLONG;
+		return 0;
+	}
+
 	/*
 	 * To calculate the size of the encrypted symlink target we need to know
 	 * the amount of NUL padding, which is determined by the flags set in
@@ -207,7 +238,7 @@ int __fscrypt_prepare_symlink(struct inode *dir, unsigned int len,
 	disk_link->name = NULL;
 	return 0;
 }
-EXPORT_SYMBOL_GPL(__fscrypt_prepare_symlink);
+EXPORT_SYMBOL_GPL(fscrypt_prepare_symlink);
 
 int __fscrypt_encrypt_symlink(struct inode *inode, const char *target,
 			      unsigned int len, struct fscrypt_str *disk_link)
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 81d6ded243288..39e7397a3f103 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -225,9 +225,9 @@ int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry,
 			     struct fscrypt_name *fname);
 int fscrypt_prepare_setflags(struct inode *inode,
 			     unsigned int oldflags, unsigned int flags);
-int __fscrypt_prepare_symlink(struct inode *dir, unsigned int len,
-			      unsigned int max_len,
-			      struct fscrypt_str *disk_link);
+int fscrypt_prepare_symlink(struct inode *dir, const char *target,
+			    unsigned int len, unsigned int max_len,
+			    struct fscrypt_str *disk_link);
 int __fscrypt_encrypt_symlink(struct inode *inode, const char *target,
 			      unsigned int len, struct fscrypt_str *disk_link);
 const char *fscrypt_get_symlink(struct inode *inode, const void *caddr,
@@ -520,15 +520,21 @@ static inline int fscrypt_prepare_setflags(struct inode *inode,
 	return 0;
 }
 
-static inline int __fscrypt_prepare_symlink(struct inode *dir,
-					    unsigned int len,
-					    unsigned int max_len,
-					    struct fscrypt_str *disk_link)
+static inline int fscrypt_prepare_symlink(struct inode *dir,
+					  const char *target,
+					  unsigned int len,
+					  unsigned int max_len,
+					  struct fscrypt_str *disk_link)
 {
-	return -EOPNOTSUPP;
+	if (IS_ENCRYPTED(dir))
+		return -EOPNOTSUPP;
+	disk_link->name = (unsigned char *)target;
+	disk_link->len = len + 1;
+	if (disk_link->len > max_len)
+		return -ENAMETOOLONG;
+	return 0;
 }
 
-
 static inline int __fscrypt_encrypt_symlink(struct inode *inode,
 					    const char *target,
 					    unsigned int len,
@@ -793,45 +799,6 @@ static inline int fscrypt_prepare_setattr(struct dentry *dentry,
 	return 0;
 }
 
-/**
- * fscrypt_prepare_symlink() - prepare to create a possibly-encrypted symlink
- * @dir: directory in which the symlink is being created
- * @target: plaintext symlink target
- * @len: length of @target excluding null terminator
- * @max_len: space the filesystem has available to store the symlink target
- * @disk_link: (out) the on-disk symlink target being prepared
- *
- * This function computes the size the symlink target will require on-disk,
- * stores it in @disk_link->len, and validates it against @max_len.  An
- * encrypted symlink may be longer than the original.
- *
- * Additionally, @disk_link->name is set to @target if the symlink will be
- * unencrypted, but left NULL if the symlink will be encrypted.  For encrypted
- * symlinks, the filesystem must call fscrypt_encrypt_symlink() to create the
- * on-disk target later.  (The reason for the two-step process is that some
- * filesystems need to know the size of the symlink target before creating the
- * inode, e.g. to determine whether it will be a "fast" or "slow" symlink.)
- *
- * Return: 0 on success, -ENAMETOOLONG if the symlink target is too long,
- * -ENOKEY if the encryption key is missing, or another -errno code if a problem
- * occurred while setting up the encryption key.
- */
-static inline int fscrypt_prepare_symlink(struct inode *dir,
-					  const char *target,
-					  unsigned int len,
-					  unsigned int max_len,
-					  struct fscrypt_str *disk_link)
-{
-	if (IS_ENCRYPTED(dir) || fscrypt_get_dummy_context(dir->i_sb) != NULL)
-		return __fscrypt_prepare_symlink(dir, len, max_len, disk_link);
-
-	disk_link->name = (unsigned char *)target;
-	disk_link->len = len + 1;
-	if (disk_link->len > max_len)
-		return -ENAMETOOLONG;
-	return 0;
-}
-
 /**
  * fscrypt_encrypt_symlink() - encrypt the symlink target if needed
  * @inode: symlink inode
-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
