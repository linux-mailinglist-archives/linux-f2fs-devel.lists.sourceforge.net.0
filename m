Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A08970602
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jul 2019 18:54:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hpbZi-0002cw-56; Mon, 22 Jul 2019 16:54:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hpbZd-0002bA-98
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Jul 2019 16:54:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8ByYx2di0qVnCoIa0Omq7DvZPfJhD89oApkfce9PSBQ=; b=V5fpSrUyytVWmheAoYuam1TGNB
 KKyJiWJ+uT+j44kUUZYcuFEDWG2RDRk17KRUO/afGF+ZC0fvMPxSw/hBGSKmKE/15jUR8nXyyb2oR
 Dqf95y2IfIKxZDGye3/I6UtcAg0rcdE28Lxn0T703baxb9Ww6s2YSeSnGVNP9/UlXtRs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8ByYx2di0qVnCoIa0Omq7DvZPfJhD89oApkfce9PSBQ=; b=HITKg1MxbJWlIrJOZpBZiEyTmI
 pP+gcIZtpjw4I2PEm7NZCzJvMQf9jASXjfNHL24CoC1406PjzoP9Qs5lxDhJK4R56RFCVDBz0GAjp
 RWcEqm7dB40ec8L0LETqzeXuH/Oywj8hUwCczuMYv4PxgT7euh+T2kTRe+g6ekb8t2s4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hpbZa-00Aaf8-EE
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Jul 2019 16:54:04 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 337E52239D;
 Mon, 22 Jul 2019 16:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563814435;
 bh=CJ390Zo07yZGGLo4VbefOn1GVkBC+XdJPC+p732C+GA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dL19JWt+OfaR2s4M1W3CrqTuDVUWycIEhgP+luRPEA2hi/RYEL/5UeriZnqQtbcG7
 Ms/jlgJWAz/QFii9U09oD5DHyMMcv+PdSKxTlSn+hm1IgQTPlRGCScpZA/DxSHIcmw
 ImoCyBk3iZnWtiL5iBr6XA9FKZLv6MI9lNETu1g8=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 22 Jul 2019 09:50:57 -0700
Message-Id: <20190722165101.12840-14-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190722165101.12840-1-ebiggers@kernel.org>
References: <20190722165101.12840-1-ebiggers@kernel.org>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hpbZa-00Aaf8-EE
Subject: [f2fs-dev] [PATCH v7 13/17] fs-verity: support builtin file
 signatures
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>,
 "Darrick J . Wong" <darrick.wong@oracle.com>, linux-api@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-integrity@vger.kernel.org, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

To meet some users' needs, add optional support for having fs-verity
handle a portion of the authentication policy in the kernel.  An
".fs-verity" keyring is created to which X.509 certificates can be
added; then a sysctl 'fs.verity.require_signatures' can be set to cause
the kernel to enforce that all fs-verity files contain a signature of
their file measurement by a key in this keyring.

See the "Built-in signature verification" section of
Documentation/filesystems/fsverity.rst for the full documentation.

Reviewed-by: Theodore Ts'o <tytso@mit.edu>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/Kconfig            |  17 ++++
 fs/verity/Makefile           |   2 +
 fs/verity/enable.c           |  20 ++++-
 fs/verity/fsverity_private.h |  48 ++++++++++-
 fs/verity/init.c             |   6 ++
 fs/verity/open.c             |  27 ++++--
 fs/verity/signature.c        | 157 +++++++++++++++++++++++++++++++++++
 fs/verity/verify.c           |   6 ++
 8 files changed, 269 insertions(+), 14 deletions(-)
 create mode 100644 fs/verity/signature.c

diff --git a/fs/verity/Kconfig b/fs/verity/Kconfig
index c2bca0b01ecfa..88fb25119899d 100644
--- a/fs/verity/Kconfig
+++ b/fs/verity/Kconfig
@@ -36,3 +36,20 @@ config FS_VERITY_DEBUG
 	  Enable debugging messages related to fs-verity by default.
 
 	  Say N unless you are an fs-verity developer.
+
+config FS_VERITY_BUILTIN_SIGNATURES
+	bool "FS Verity builtin signature support"
+	depends on FS_VERITY
+	select SYSTEM_DATA_VERIFICATION
+	help
+	  Support verifying signatures of verity files against the X.509
+	  certificates that have been loaded into the ".fs-verity"
+	  kernel keyring.
+
+	  This is meant as a relatively simple mechanism that can be
+	  used to provide an authenticity guarantee for verity files, as
+	  an alternative to IMA appraisal.  Userspace programs still
+	  need to check that the verity bit is set in order to get an
+	  authenticity guarantee.
+
+	  If unsure, say N.
diff --git a/fs/verity/Makefile b/fs/verity/Makefile
index 6f7675ae0a311..570e9136334d4 100644
--- a/fs/verity/Makefile
+++ b/fs/verity/Makefile
@@ -6,3 +6,5 @@ obj-$(CONFIG_FS_VERITY) += enable.o \
 			   measure.o \
 			   open.o \
 			   verify.o
+
+obj-$(CONFIG_FS_VERITY_BUILTIN_SIGNATURES) += signature.o
diff --git a/fs/verity/enable.c b/fs/verity/enable.c
index ae66e0a50f05e..3371d51563962 100644
--- a/fs/verity/enable.c
+++ b/fs/verity/enable.c
@@ -153,7 +153,7 @@ static int enable_verity(struct file *filp,
 	const struct fsverity_operations *vops = inode->i_sb->s_vop;
 	struct merkle_tree_params params = { };
 	struct fsverity_descriptor *desc;
-	size_t desc_size = sizeof(*desc);
+	size_t desc_size = sizeof(*desc) + arg->sig_size;
 	struct fsverity_info *vi;
 	int err;
 
@@ -175,6 +175,16 @@ static int enable_verity(struct file *filp,
 	}
 	desc->salt_size = arg->salt_size;
 
+	/* Get the signature if the user provided one */
+	if (arg->sig_size &&
+	    copy_from_user(desc->signature,
+			   (const u8 __user *)(uintptr_t)arg->sig_ptr,
+			   arg->sig_size)) {
+		err = -EFAULT;
+		goto out;
+	}
+	desc->sig_size = cpu_to_le32(arg->sig_size);
+
 	desc->data_size = cpu_to_le64(inode->i_size);
 
 	/* Prepare the Merkle tree parameters */
@@ -230,6 +240,10 @@ static int enable_verity(struct file *filp,
 		goto rollback;
 	}
 
+	if (arg->sig_size)
+		pr_debug("Storing a %u-byte PKCS#7 signature alongside the file\n",
+			 arg->sig_size);
+
 	/*
 	 * Tell the filesystem to finish enabling verity on the file.
 	 * Serialized with ->begin_enable_verity() by the inode lock.
@@ -296,8 +310,8 @@ int fsverity_ioctl_enable(struct file *filp, const void __user *uarg)
 	if (arg.salt_size > FIELD_SIZEOF(struct fsverity_descriptor, salt))
 		return -EMSGSIZE;
 
-	if (arg.sig_size)
-		return -EINVAL;
+	if (arg.sig_size > FS_VERITY_MAX_SIGNATURE_SIZE)
+		return -EMSGSIZE;
 
 	/*
 	 * Require a regular file with write access.  But the actual fd must
diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index 02a547f0667c1..e74c79b64d889 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -75,23 +75,41 @@ struct fsverity_info {
 };
 
 /*
- * Merkle tree properties.  The file measurement is the hash of this structure.
+ * Merkle tree properties.  The file measurement is the hash of this structure
+ * excluding the signature and with the sig_size field set to 0.
  */
 struct fsverity_descriptor {
 	__u8 version;		/* must be 1 */
 	__u8 hash_algorithm;	/* Merkle tree hash algorithm */
 	__u8 log_blocksize;	/* log2 of size of data and tree blocks */
 	__u8 salt_size;		/* size of salt in bytes; 0 if none */
-	__le32 sig_size;	/* reserved, must be 0 */
+	__le32 sig_size;	/* size of signature in bytes; 0 if none */
 	__le64 data_size;	/* size of file the Merkle tree is built over */
 	__u8 root_hash[64];	/* Merkle tree root hash */
 	__u8 salt[32];		/* salt prepended to each hashed block */
 	__u8 __reserved[144];	/* must be 0's */
+	__u8 signature[];	/* optional PKCS#7 signature */
 };
 
 /* Arbitrary limit to bound the kmalloc() size.  Can be changed. */
 #define FS_VERITY_MAX_DESCRIPTOR_SIZE	16384
 
+#define FS_VERITY_MAX_SIGNATURE_SIZE	(FS_VERITY_MAX_DESCRIPTOR_SIZE - \
+					 sizeof(struct fsverity_descriptor))
+
+/*
+ * Format in which verity file measurements are signed.  This is the same as
+ * 'struct fsverity_digest', except here some magic bytes are prepended to
+ * provide some context about what is being signed in case the same key is used
+ * for non-fsverity purposes, and here the fields have fixed endianness.
+ */
+struct fsverity_signed_digest {
+	char magic[8];			/* must be "FSVerity" */
+	__le16 digest_algorithm;
+	__le16 digest_size;
+	__u8 digest[];
+};
+
 /* hash_algs.c */
 
 extern struct fsverity_hash_alg fsverity_hash_algs[];
@@ -127,7 +145,7 @@ int fsverity_init_merkle_tree_params(struct merkle_tree_params *params,
 				     const u8 *salt, size_t salt_size);
 
 struct fsverity_info *fsverity_create_info(const struct inode *inode,
-					   const void *desc, size_t desc_size);
+					   void *desc, size_t desc_size);
 
 void fsverity_set_info(struct inode *inode, struct fsverity_info *vi);
 
@@ -136,8 +154,32 @@ void fsverity_free_info(struct fsverity_info *vi);
 int __init fsverity_init_info_cache(void);
 void __init fsverity_exit_info_cache(void);
 
+/* signature.c */
+
+#ifdef CONFIG_FS_VERITY_BUILTIN_SIGNATURES
+int fsverity_verify_signature(const struct fsverity_info *vi,
+			      const struct fsverity_descriptor *desc,
+			      size_t desc_size);
+
+int __init fsverity_init_signature(void);
+#else /* !CONFIG_FS_VERITY_BUILTIN_SIGNATURES */
+static inline int
+fsverity_verify_signature(const struct fsverity_info *vi,
+			  const struct fsverity_descriptor *desc,
+			  size_t desc_size)
+{
+	return 0;
+}
+
+static inline int fsverity_init_signature(void)
+{
+	return 0;
+}
+#endif /* !CONFIG_FS_VERITY_BUILTIN_SIGNATURES */
+
 /* verify.c */
 
 int __init fsverity_init_workqueue(void);
+void __init fsverity_exit_workqueue(void);
 
 #endif /* _FSVERITY_PRIVATE_H */
diff --git a/fs/verity/init.c b/fs/verity/init.c
index b593805aafcc8..94c104e00861d 100644
--- a/fs/verity/init.c
+++ b/fs/verity/init.c
@@ -45,9 +45,15 @@ static int __init fsverity_init(void)
 	if (err)
 		goto err_exit_info_cache;
 
+	err = fsverity_init_signature();
+	if (err)
+		goto err_exit_workqueue;
+
 	pr_debug("Initialized fs-verity\n");
 	return 0;
 
+err_exit_workqueue:
+	fsverity_exit_workqueue();
 err_exit_info_cache:
 	fsverity_exit_info_cache();
 	return err;
diff --git a/fs/verity/open.c b/fs/verity/open.c
index 3636a1ed8e2c4..63d1004b688cb 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -122,22 +122,32 @@ int fsverity_init_merkle_tree_params(struct merkle_tree_params *params,
 	return err;
 }
 
-/* Compute the file measurement by hashing the fsverity_descriptor. */
+/*
+ * Compute the file measurement by hashing the fsverity_descriptor excluding the
+ * signature and with the sig_size field set to 0.
+ */
 static int compute_file_measurement(const struct fsverity_hash_alg *hash_alg,
-				    const struct fsverity_descriptor *desc,
+				    struct fsverity_descriptor *desc,
 				    u8 *measurement)
 {
-	return fsverity_hash_buffer(hash_alg, desc, sizeof(*desc), measurement);
+	__le32 sig_size = desc->sig_size;
+	int err;
+
+	desc->sig_size = 0;
+	err = fsverity_hash_buffer(hash_alg, desc, sizeof(*desc), measurement);
+	desc->sig_size = sig_size;
+
+	return err;
 }
 
 /*
  * Validate the given fsverity_descriptor and create a new fsverity_info from
- * it.
+ * it.  The signature (if present) is also checked.
  */
 struct fsverity_info *fsverity_create_info(const struct inode *inode,
-					   const void *_desc, size_t desc_size)
+					   void *_desc, size_t desc_size)
 {
-	const struct fsverity_descriptor *desc = _desc;
+	struct fsverity_descriptor *desc = _desc;
 	struct fsverity_info *vi;
 	int err;
 
@@ -153,8 +163,7 @@ struct fsverity_info *fsverity_create_info(const struct inode *inode,
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (desc->sig_size ||
-	    memchr_inv(desc->__reserved, 0, sizeof(desc->__reserved))) {
+	if (memchr_inv(desc->__reserved, 0, sizeof(desc->__reserved))) {
 		fsverity_err(inode, "Reserved bits set in descriptor");
 		return ERR_PTR(-EINVAL);
 	}
@@ -198,6 +207,8 @@ struct fsverity_info *fsverity_create_info(const struct inode *inode,
 	pr_debug("Computed file measurement: %s:%*phN\n",
 		 vi->tree_params.hash_alg->name,
 		 vi->tree_params.digest_size, vi->measurement);
+
+	err = fsverity_verify_signature(vi, desc, desc_size);
 out:
 	if (err) {
 		fsverity_free_info(vi);
diff --git a/fs/verity/signature.c b/fs/verity/signature.c
new file mode 100644
index 0000000000000..c8b255232de54
--- /dev/null
+++ b/fs/verity/signature.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * fs/verity/signature.c: verification of builtin signatures
+ *
+ * Copyright 2019 Google LLC
+ */
+
+#include "fsverity_private.h"
+
+#include <linux/cred.h>
+#include <linux/key.h>
+#include <linux/slab.h>
+#include <linux/verification.h>
+
+/*
+ * /proc/sys/fs/verity/require_signatures
+ * If 1, all verity files must have a valid builtin signature.
+ */
+static int fsverity_require_signatures;
+
+/*
+ * Keyring that contains the trusted X.509 certificates.
+ *
+ * Only root (kuid=0) can modify this.  Also, root may use
+ * keyctl_restrict_keyring() to prevent any more additions.
+ */
+static struct key *fsverity_keyring;
+
+/**
+ * fsverity_verify_signature() - check a verity file's signature
+ *
+ * If the file's fs-verity descriptor includes a signature of the file
+ * measurement, verify it against the certificates in the fs-verity keyring.
+ *
+ * Return: 0 on success (signature valid or not required); -errno on failure
+ */
+int fsverity_verify_signature(const struct fsverity_info *vi,
+			      const struct fsverity_descriptor *desc,
+			      size_t desc_size)
+{
+	const struct inode *inode = vi->inode;
+	const struct fsverity_hash_alg *hash_alg = vi->tree_params.hash_alg;
+	const u32 sig_size = le32_to_cpu(desc->sig_size);
+	struct fsverity_signed_digest *d;
+	int err;
+
+	if (sig_size == 0) {
+		if (fsverity_require_signatures) {
+			fsverity_err(inode,
+				     "require_signatures=1, rejecting unsigned file!");
+			return -EPERM;
+		}
+		return 0;
+	}
+
+	if (sig_size > desc_size - sizeof(*desc)) {
+		fsverity_err(inode, "Signature overflows verity descriptor");
+		return -EBADMSG;
+	}
+
+	d = kzalloc(sizeof(*d) + hash_alg->digest_size, GFP_KERNEL);
+	if (!d)
+		return -ENOMEM;
+	memcpy(d->magic, "FSVerity", 8);
+	d->digest_algorithm = cpu_to_le16(hash_alg - fsverity_hash_algs);
+	d->digest_size = cpu_to_le16(hash_alg->digest_size);
+	memcpy(d->digest, vi->measurement, hash_alg->digest_size);
+
+	err = verify_pkcs7_signature(d, sizeof(*d) + hash_alg->digest_size,
+				     desc->signature, sig_size,
+				     fsverity_keyring,
+				     VERIFYING_UNSPECIFIED_SIGNATURE,
+				     NULL, NULL);
+	kfree(d);
+
+	if (err) {
+		if (err == -ENOKEY)
+			fsverity_err(inode,
+				     "File's signing cert isn't in the fs-verity keyring");
+		else if (err == -EKEYREJECTED)
+			fsverity_err(inode, "Incorrect file signature");
+		else if (err == -EBADMSG)
+			fsverity_err(inode, "Malformed file signature");
+		else
+			fsverity_err(inode, "Error %d verifying file signature",
+				     err);
+		return err;
+	}
+
+	pr_debug("Valid signature for file measurement %s:%*phN\n",
+		 hash_alg->name, hash_alg->digest_size, vi->measurement);
+	return 0;
+}
+
+#ifdef CONFIG_SYSCTL
+static struct ctl_table_header *fsverity_sysctl_header;
+
+static const struct ctl_path fsverity_sysctl_path[] = {
+	{ .procname = "fs", },
+	{ .procname = "verity", },
+	{ }
+};
+
+static struct ctl_table fsverity_sysctl_table[] = {
+	{
+		.procname       = "require_signatures",
+		.data           = &fsverity_require_signatures,
+		.maxlen         = sizeof(int),
+		.mode           = 0644,
+		.proc_handler   = proc_dointvec_minmax,
+		.extra1         = SYSCTL_ZERO,
+		.extra2         = SYSCTL_ONE,
+	},
+	{ }
+};
+
+static int __init fsverity_sysctl_init(void)
+{
+	fsverity_sysctl_header = register_sysctl_paths(fsverity_sysctl_path,
+						       fsverity_sysctl_table);
+	if (!fsverity_sysctl_header) {
+		pr_err("sysctl registration failed!\n");
+		return -ENOMEM;
+	}
+	return 0;
+}
+#else /* !CONFIG_SYSCTL */
+static inline int __init fsverity_sysctl_init(void)
+{
+	return 0;
+}
+#endif /* !CONFIG_SYSCTL */
+
+int __init fsverity_init_signature(void)
+{
+	struct key *ring;
+	int err;
+
+	ring = keyring_alloc(".fs-verity", KUIDT_INIT(0), KGIDT_INIT(0),
+			     current_cred(), KEY_POS_SEARCH |
+				KEY_USR_VIEW | KEY_USR_READ | KEY_USR_WRITE |
+				KEY_USR_SEARCH | KEY_USR_SETATTR,
+			     KEY_ALLOC_NOT_IN_QUOTA, NULL, NULL);
+	if (IS_ERR(ring))
+		return PTR_ERR(ring);
+
+	err = fsverity_sysctl_init();
+	if (err)
+		goto err_put_ring;
+
+	fsverity_keyring = ring;
+	return 0;
+
+err_put_ring:
+	key_put(ring);
+	return err;
+}
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index 62ab8f6a8ea11..3e8f2de44667f 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -273,3 +273,9 @@ int __init fsverity_init_workqueue(void)
 		return -ENOMEM;
 	return 0;
 }
+
+void __init fsverity_exit_workqueue(void)
+{
+	destroy_workqueue(fsverity_read_workqueue);
+	fsverity_read_workqueue = NULL;
+}
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
