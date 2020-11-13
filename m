Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C302B28B3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Nov 2020 23:42:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kdhmI-0007Fy-On; Fri, 13 Nov 2020 22:42:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kdgVR-0006WN-Fk
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Nov 2020 21:21:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P7pDIkH+3eu79wy6Otr2o6ManYweaLPN5RIZJ7Wcv34=; b=OgTi0W6rphmGVPV4fU8QhVomGZ
 SknR08q8KJO2/MVneiZKdSxWPW34yV5CozAo8EtMzWaLZ8lZGuozenFLghzKl8r/B4L/jNu04IEOP
 ygU7aE45kGpTcHby7Qk/4MJo/gCYnAqPk0LDA1P4eKT5h6hbOlIkXjWeAVo99R3U3TV8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P7pDIkH+3eu79wy6Otr2o6ManYweaLPN5RIZJ7Wcv34=; b=YxrH1M8U0zsEHRGKp4phxw7Cgs
 nDL/nePBvkYmtKo0GVuijBpHpJZTv7be01IwRdTF9YW03DLFwh1n+YQU+WGXLSDJgdZr8ueCy9Fcn
 45OOikjtgs2tGikkDPO9Ru7UL3MDG8E20ih7LvCPQaYr/rVce9NjCgVucIRxb+YsKbIs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kdgV9-00At3q-Eg
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Nov 2020 21:21:17 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D0F9422256;
 Fri, 13 Nov 2020 21:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605302449;
 bh=txwVL4fD1+QKFnZ4sYW7y8fWS37gonSkfL+NfB+AhqA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R5OzqsHbjsklJJZfuGuAWz4hTfxyNCobZaca5FuvXpBaVhBl3AibfUuF7O+pQ3BJN
 s8zEUqpxZ+Z3fRw4wrJpYHdNBKP1OlQSheaqYNzR9uSWX+PCX5ZDtdKi0sbOq1Ow3q
 nVgVFMU06rr/fagjVBEUaaswEPH09DDPrE1WwAXo=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 13 Nov 2020 13:19:17 -0800
Message-Id: <20201113211918.71883-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201113211918.71883-1-ebiggers@kernel.org>
References: <20201113211918.71883-1-ebiggers@kernel.org>
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
X-Headers-End: 1kdgV9-00At3q-Eg
Subject: [f2fs-dev] [PATCH 3/4] fs-verity: rename "file measurement" to
 "file digest"
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
Cc: Jes Sorensen <Jes.Sorensen@gmail.com>,
 Luca Boccassi <luca.boccassi@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 Paul Lawrence <paullawrence@google.com>, linux-ext4@vger.kernel.org,
 Martijn Coenen <maco@android.com>, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

I originally chose the name "file measurement" to refer to the fs-verity
file digest to avoid confusion with traditional full-file digests or
with the bare root hash of the Merkle tree.

But the name "file measurement" hasn't caught on, and usually people are
calling it something else, usually the "file digest".  E.g. see
"struct fsverity_digest" and "struct fsverity_formatted_digest", the
libfsverity_compute_digest() and libfsverity_sign_digest() functions in
libfsverity, and the "fsverity digest" command.

Having multiple names for the same thing is always confusing.

So to hopefully avoid confusion in the future, rename
"fs-verity file measurement" to "fs-verity file digest".

This leaves FS_IOC_MEASURE_VERITY as the only reference to "measure" in
the kernel, which makes some amount of sense since the ioctl is actively
"measuring" the file.

I'll be renaming this in fsverity-utils too (though similarly the
'fsverity measure' command, which is a wrapper for
FS_IOC_MEASURE_VERITY, will stay).

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/filesystems/fsverity.rst | 60 +++++++++++++-------------
 fs/verity/enable.c                     |  6 +--
 fs/verity/fsverity_private.h           | 12 +++---
 fs/verity/measure.c                    | 12 +++---
 fs/verity/open.c                       | 22 +++++-----
 fs/verity/signature.c                  | 10 ++---
 6 files changed, 61 insertions(+), 61 deletions(-)

diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
index 421b75498d49b..2eee558b7f5ff 100644
--- a/Documentation/filesystems/fsverity.rst
+++ b/Documentation/filesystems/fsverity.rst
@@ -27,9 +27,9 @@ automatically verified against the file's Merkle tree.  Reads of any
 corrupted data, including mmap reads, will fail.
 
 Userspace can use another ioctl to retrieve the root hash (actually
-the "file measurement", which is a hash that includes the root hash)
-that fs-verity is enforcing for the file.  This ioctl executes in
-constant time, regardless of the file size.
+the "fs-verity file digest", which is a hash that includes the Merkle
+tree root hash) that fs-verity is enforcing for the file.  This ioctl
+executes in constant time, regardless of the file size.
 
 fs-verity is essentially a way to hash a file in constant time,
 subject to the caveat that reads which would violate the hash will
@@ -177,9 +177,10 @@ FS_IOC_ENABLE_VERITY can fail with the following errors:
 FS_IOC_MEASURE_VERITY
 ---------------------
 
-The FS_IOC_MEASURE_VERITY ioctl retrieves the measurement of a verity
-file.  The file measurement is a digest that cryptographically
-identifies the file contents that are being enforced on reads.
+The FS_IOC_MEASURE_VERITY ioctl retrieves the digest of a verity file.
+The fs-verity file digest is a cryptographic digest that identifies
+the file contents that are being enforced on reads; it is computed via
+a Merkle tree and is different from a traditional full-file digest.
 
 This ioctl takes in a pointer to a variable-length structure::
 
@@ -197,7 +198,7 @@ On success, 0 is returned and the kernel fills in the structure as
 follows:
 
 - ``digest_algorithm`` will be the hash algorithm used for the file
-  measurement.  It will match ``fsverity_enable_arg::hash_algorithm``.
+  digest.  It will match ``fsverity_enable_arg::hash_algorithm``.
 - ``digest_size`` will be the size of the digest in bytes, e.g. 32
   for SHA-256.  (This can be redundant with ``digest_algorithm``.)
 - ``digest`` will be the actual bytes of the digest.
@@ -257,25 +258,24 @@ non-verity one, with the following exceptions:
   with EIO (for read()) or SIGBUS (for mmap() reads).
 
 - If the sysctl "fs.verity.require_signatures" is set to 1 and the
-  file's verity measurement is not signed by a key in the fs-verity
-  keyring, then opening the file will fail.  See `Built-in signature
-  verification`_.
+  file is not signed by a key in the fs-verity keyring, then opening
+  the file will fail.  See `Built-in signature verification`_.
 
 Direct access to the Merkle tree is not supported.  Therefore, if a
 verity file is copied, or is backed up and restored, then it will lose
 its "verity"-ness.  fs-verity is primarily meant for files like
 executables that are managed by a package manager.
 
-File measurement computation
-============================
+File digest computation
+=======================
 
 This section describes how fs-verity hashes the file contents using a
-Merkle tree to produce the "file measurement" which cryptographically
-identifies the file contents.  This algorithm is the same for all
-filesystems that support fs-verity.
+Merkle tree to produce the digest which cryptographically identifies
+the file contents.  This algorithm is the same for all filesystems
+that support fs-verity.
 
 Userspace only needs to be aware of this algorithm if it needs to
-compute the file measurement itself, e.g. in order to sign the file.
+compute fs-verity file digests itself, e.g. in order to sign files.
 
 .. _fsverity_merkle_tree:
 
@@ -325,9 +325,9 @@ can't a distinguish a large file from a small second file whose data
 is exactly the top-level hash block of the first file.  Ambiguities
 also arise from the convention of padding to the next block boundary.
 
-To solve this problem, the verity file measurement is actually
-computed as a hash of the following structure, which contains the
-Merkle tree root hash as well as other fields such as the file size::
+To solve this problem, the fs-verity file digest is actually computed
+as a hash of the following structure, which contains the Merkle tree
+root hash as well as other fields such as the file size::
 
     struct fsverity_descriptor {
             __u8 version;           /* must be 1 */
@@ -359,18 +359,18 @@ kernel.  Specifically, it adds support for:
    certificates from being added.
 
 2. `FS_IOC_ENABLE_VERITY`_ accepts a pointer to a PKCS#7 formatted
-   detached signature in DER format of the file measurement.  On
-   success, this signature is persisted alongside the Merkle tree.
+   detached signature in DER format of the file's fs-verity digest.
+   On success, this signature is persisted alongside the Merkle tree.
    Then, any time the file is opened, the kernel will verify the
-   file's actual measurement against this signature, using the
-   certificates in the ".fs-verity" keyring.
+   file's actual digest against this signature, using the certificates
+   in the ".fs-verity" keyring.
 
 3. A new sysctl "fs.verity.require_signatures" is made available.
    When set to 1, the kernel requires that all verity files have a
-   correctly signed file measurement as described in (2).
+   correctly signed digest as described in (2).
 
-File measurements must be signed in the following format, which is
-similar to the structure used by `FS_IOC_MEASURE_VERITY`_::
+fs-verity file digests must be signed in the following format, which
+is similar to the structure used by `FS_IOC_MEASURE_VERITY`_::
 
     struct fsverity_formatted_digest {
             char magic[8];                  /* must be "FSVerity" */
@@ -421,8 +421,8 @@ can only be set by `FS_IOC_ENABLE_VERITY`_, and it cannot be cleared.
 
 ext4 also supports encryption, which can be used simultaneously with
 fs-verity.  In this case, the plaintext data is verified rather than
-the ciphertext.  This is necessary in order to make the file
-measurement meaningful, since every file is encrypted differently.
+the ciphertext.  This is necessary in order to make the fs-verity file
+digest meaningful, since every file is encrypted differently.
 
 ext4 stores the verity metadata (Merkle tree and fsverity_descriptor)
 past the end of the file, starting at the first 64K boundary beyond
@@ -592,8 +592,8 @@ weren't already directly answered in other parts of this document.
 :Q: Isn't fs-verity useless because the attacker can just modify the
     hashes in the Merkle tree, which is stored on-disk?
 :A: To verify the authenticity of an fs-verity file you must verify
-    the authenticity of the "file measurement", which is basically the
-    root hash of the Merkle tree.  See `Use cases`_.
+    the authenticity of the "fs-verity file digest", which
+    incorporates the root hash of the Merkle tree.  See `Use cases`_.
 
 :Q: Isn't fs-verity useless because the attacker can just replace a
     verity file with a non-verity one?
diff --git a/fs/verity/enable.c b/fs/verity/enable.c
index 9c5b28c865226..f7e997a01ad07 100644
--- a/fs/verity/enable.c
+++ b/fs/verity/enable.c
@@ -398,9 +398,9 @@ int fsverity_ioctl_enable(struct file *filp, const void __user *uarg)
 	 * Some pages of the file may have been evicted from pagecache after
 	 * being used in the Merkle tree construction, then read into pagecache
 	 * again by another process reading from the file concurrently.  Since
-	 * these pages didn't undergo verification against the file measurement
-	 * which fs-verity now claims to be enforcing, we have to wipe the
-	 * pagecache to ensure that all future reads are verified.
+	 * these pages didn't undergo verification against the file digest which
+	 * fs-verity now claims to be enforcing, we have to wipe the pagecache
+	 * to ensure that all future reads are verified.
 	 */
 	filemap_write_and_wait(inode->i_mapping);
 	invalidate_inode_pages2(inode->i_mapping);
diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index 75f8e18b44a5b..21e9930d65fbd 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -67,19 +67,19 @@ struct merkle_tree_params {
  * When a verity file is first opened, an instance of this struct is allocated
  * and stored in ->i_verity_info; it remains until the inode is evicted.  It
  * caches information about the Merkle tree that's needed to efficiently verify
- * data read from the file.  It also caches the file measurement.  The Merkle
- * tree pages themselves are not cached here, but the filesystem may cache them.
+ * data read from the file.  It also caches the file digest.  The Merkle tree
+ * pages themselves are not cached here, but the filesystem may cache them.
  */
 struct fsverity_info {
 	struct merkle_tree_params tree_params;
 	u8 root_hash[FS_VERITY_MAX_DIGEST_SIZE];
-	u8 measurement[FS_VERITY_MAX_DIGEST_SIZE];
+	u8 file_digest[FS_VERITY_MAX_DIGEST_SIZE];
 	const struct inode *inode;
 };
 
 /*
- * Merkle tree properties.  The file measurement is the hash of this structure
- * excluding the signature and with the sig_size field set to 0.
+ * Merkle tree properties.  The fs-verity file digest is the hash of this
+ * structure excluding the signature and with the sig_size field set to 0.
  */
 struct fsverity_descriptor {
 	__u8 version;		/* must be 1 */
@@ -101,7 +101,7 @@ struct fsverity_descriptor {
 					 sizeof(struct fsverity_descriptor))
 
 /*
- * Format in which verity file measurements are signed in built-in signatures.
+ * Format in which fs-verity file digests are signed in built-in signatures.
  * This is the same as 'struct fsverity_digest', except here some magic bytes
  * are prepended to provide some context about what is being signed in case the
  * same key is used for non-fsverity purposes, and here the fields have fixed
diff --git a/fs/verity/measure.c b/fs/verity/measure.c
index 5300b8d385376..f0d7b30c62db2 100644
--- a/fs/verity/measure.c
+++ b/fs/verity/measure.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Ioctl to get a verity file's measurement
+ * Ioctl to get a verity file's digest
  *
  * Copyright 2019 Google LLC
  */
@@ -10,12 +10,12 @@
 #include <linux/uaccess.h>
 
 /**
- * fsverity_ioctl_measure() - get a verity file's measurement
- * @filp: file to get measurement of
+ * fsverity_ioctl_measure() - get a verity file's digest
+ * @filp: file to get digest of
  * @_uarg: user pointer to fsverity_digest
  *
- * Retrieve the file measurement that the kernel is enforcing for reads from a
- * verity file.  See the "FS_IOC_MEASURE_VERITY" section of
+ * Retrieve the file digest that the kernel is enforcing for reads from a verity
+ * file.  See the "FS_IOC_MEASURE_VERITY" section of
  * Documentation/filesystems/fsverity.rst for the documentation.
  *
  * Return: 0 on success, -errno on failure
@@ -51,7 +51,7 @@ int fsverity_ioctl_measure(struct file *filp, void __user *_uarg)
 	if (copy_to_user(uarg, &arg, sizeof(arg)))
 		return -EFAULT;
 
-	if (copy_to_user(uarg->digest, vi->measurement, hash_alg->digest_size))
+	if (copy_to_user(uarg->digest, vi->file_digest, hash_alg->digest_size))
 		return -EFAULT;
 
 	return 0;
diff --git a/fs/verity/open.c b/fs/verity/open.c
index a28d5be78a09c..228d0eca3e2e5 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -124,18 +124,18 @@ int fsverity_init_merkle_tree_params(struct merkle_tree_params *params,
 }
 
 /*
- * Compute the file measurement by hashing the fsverity_descriptor excluding the
+ * Compute the file digest by hashing the fsverity_descriptor excluding the
  * signature and with the sig_size field set to 0.
  */
-static int compute_file_measurement(struct fsverity_hash_alg *hash_alg,
-				    struct fsverity_descriptor *desc,
-				    u8 *measurement)
+static int compute_file_digest(struct fsverity_hash_alg *hash_alg,
+			       struct fsverity_descriptor *desc,
+			       u8 *file_digest)
 {
 	__le32 sig_size = desc->sig_size;
 	int err;
 
 	desc->sig_size = 0;
-	err = fsverity_hash_buffer(hash_alg, desc, sizeof(*desc), measurement);
+	err = fsverity_hash_buffer(hash_alg, desc, sizeof(*desc), file_digest);
 	desc->sig_size = sig_size;
 
 	return err;
@@ -199,15 +199,15 @@ struct fsverity_info *fsverity_create_info(const struct inode *inode,
 
 	memcpy(vi->root_hash, desc->root_hash, vi->tree_params.digest_size);
 
-	err = compute_file_measurement(vi->tree_params.hash_alg, desc,
-				       vi->measurement);
+	err = compute_file_digest(vi->tree_params.hash_alg, desc,
+				  vi->file_digest);
 	if (err) {
-		fsverity_err(inode, "Error %d computing file measurement", err);
+		fsverity_err(inode, "Error %d computing file digest", err);
 		goto out;
 	}
-	pr_debug("Computed file measurement: %s:%*phN\n",
+	pr_debug("Computed file digest: %s:%*phN\n",
 		 vi->tree_params.hash_alg->name,
-		 vi->tree_params.digest_size, vi->measurement);
+		 vi->tree_params.digest_size, vi->file_digest);
 
 	err = fsverity_verify_signature(vi, desc, desc_size);
 out:
@@ -354,7 +354,7 @@ int __init fsverity_init_info_cache(void)
 {
 	fsverity_info_cachep = KMEM_CACHE_USERCOPY(fsverity_info,
 						   SLAB_RECLAIM_ACCOUNT,
-						   measurement);
+						   file_digest);
 	if (!fsverity_info_cachep)
 		return -ENOMEM;
 	return 0;
diff --git a/fs/verity/signature.c b/fs/verity/signature.c
index 74ae10f04d215..012468eda2a78 100644
--- a/fs/verity/signature.c
+++ b/fs/verity/signature.c
@@ -32,8 +32,8 @@ static struct key *fsverity_keyring;
  * @desc: the file's fsverity_descriptor
  * @desc_size: size of @desc
  *
- * If the file's fs-verity descriptor includes a signature of the file
- * measurement, verify it against the certificates in the fs-verity keyring.
+ * If the file's fs-verity descriptor includes a signature of the file digest,
+ * verify it against the certificates in the fs-verity keyring.
  *
  * Return: 0 on success (signature valid or not required); -errno on failure
  */
@@ -67,7 +67,7 @@ int fsverity_verify_signature(const struct fsverity_info *vi,
 	memcpy(d->magic, "FSVerity", 8);
 	d->digest_algorithm = cpu_to_le16(hash_alg - fsverity_hash_algs);
 	d->digest_size = cpu_to_le16(hash_alg->digest_size);
-	memcpy(d->digest, vi->measurement, hash_alg->digest_size);
+	memcpy(d->digest, vi->file_digest, hash_alg->digest_size);
 
 	err = verify_pkcs7_signature(d, sizeof(*d) + hash_alg->digest_size,
 				     desc->signature, sig_size,
@@ -90,8 +90,8 @@ int fsverity_verify_signature(const struct fsverity_info *vi,
 		return err;
 	}
 
-	pr_debug("Valid signature for file measurement %s:%*phN\n",
-		 hash_alg->name, hash_alg->digest_size, vi->measurement);
+	pr_debug("Valid signature for file digest %s:%*phN\n",
+		 hash_alg->name, hash_alg->digest_size, vi->file_digest);
 	return 0;
 }
 
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
