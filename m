Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D56412B276A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Nov 2020 22:46:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kdgtr-0000IM-KC; Fri, 13 Nov 2020 21:46:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kdgVM-0004yg-6h
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Nov 2020 21:21:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d0aGUObIOswq/DbAwWGs1W5IthNTEJbCR/jryilR2gE=; b=MgfSgNDM+5ENzQtx+7KYNaHmGT
 znFpXGRIT0U7xOtgDSQqmv5PG1OXDpGNTVEtnfm6mmvUL2jbiMVlLhQlWjtjmQJj7M0Fcyznymu5E
 a9I3RL6KmvW2mI7ZKL5pPGUBZVSieetnxk67rgu7FSMjh/F/fB3z59NxWI1+oBm2Y3oo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d0aGUObIOswq/DbAwWGs1W5IthNTEJbCR/jryilR2gE=; b=b7qv3CWLOVOgrucUvCHtihCiEK
 yvNM98F0bigFC/vAGstAh9WxLx11J24nVuLlFNzgPCXy3EYqijbdKrJnywA3MKN6EjqcOY3afwLQH
 N/rufHz2hmCKFcMOGYsY48t3XLysxDUKzYzlZchBuSlafazqMt7dItOFePcZkgWhD00s=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kdgV9-00At3r-Eh
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Nov 2020 21:21:10 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4CEEF22258;
 Fri, 13 Nov 2020 21:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605302449;
 bh=QjiQvf7g9yKcGU5m9aqGw/qrrLu6PiIemjru5rN3w4I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=108beoJREVHxUgHoAtZEL/NOxOzAcLAMUUBsn6UpyFKMRNKc0XRIkEMuCuaSWaXGU
 xlSrI1lShWwZca4wx9rocE2exuguVnpgoKYmYbwi7RmmHf4wjykNhwc3TsEIurbeBB
 a+P+H1wSGEjdfunncywOSdcfDI9WBnUGJxhqSfhE=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 13 Nov 2020 13:19:18 -0800
Message-Id: <20201113211918.71883-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201113211918.71883-1-ebiggers@kernel.org>
References: <20201113211918.71883-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kdgV9-00At3r-Eh
Subject: [f2fs-dev] [PATCH 4/4] fs-verity: move structs needed for file
 signing to UAPI header
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

Although it isn't used directly by the ioctls,
"struct fsverity_descriptor" is required by userspace programs that need
to compute fs-verity file digests in a standalone way.  Therefore
it's also needed to sign files in a standalone way.

Similarly, "struct fsverity_formatted_digest" (previously called
"struct fsverity_signed_digest" which was misleading) is also needed to
sign files if the built-in signature verification is being used.

Therefore, move these structs to the UAPI header.

While doing this, try to make it clear that the signature-related fields
in fsverity_descriptor aren't used in the file digest computation.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/filesystems/fsverity.rst |  6 +---
 fs/verity/fsverity_private.h           | 37 -------------------
 include/uapi/linux/fsverity.h          | 49 ++++++++++++++++++++++++++
 3 files changed, 50 insertions(+), 42 deletions(-)

diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
index 2eee558b7f5ff..e0204a23e997e 100644
--- a/Documentation/filesystems/fsverity.rst
+++ b/Documentation/filesystems/fsverity.rst
@@ -334,17 +334,13 @@ root hash as well as other fields such as the file size::
             __u8 hash_algorithm;    /* Merkle tree hash algorithm */
             __u8 log_blocksize;     /* log2 of size of data and tree blocks */
             __u8 salt_size;         /* size of salt in bytes; 0 if none */
-            __le32 sig_size;        /* must be 0 */
+            __le32 __reserved_0x04; /* must be 0 */
             __le64 data_size;       /* size of file the Merkle tree is built over */
             __u8 root_hash[64];     /* Merkle tree root hash */
             __u8 salt[32];          /* salt prepended to each hashed block */
             __u8 __reserved[144];   /* must be 0's */
     };
 
-Note that the ``sig_size`` field must be set to 0 for the purpose of
-computing the file measurement, even if a signature was provided (or
-will be provided) to `FS_IOC_ENABLE_VERITY`_.
-
 Built-in signature verification
 ===============================
 
diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index 21e9930d65fbd..96f7b332f54f5 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -77,49 +77,12 @@ struct fsverity_info {
 	const struct inode *inode;
 };
 
-/*
- * Merkle tree properties.  The fs-verity file digest is the hash of this
- * structure excluding the signature and with the sig_size field set to 0.
- */
-struct fsverity_descriptor {
-	__u8 version;		/* must be 1 */
-	__u8 hash_algorithm;	/* Merkle tree hash algorithm */
-	__u8 log_blocksize;	/* log2 of size of data and tree blocks */
-	__u8 salt_size;		/* size of salt in bytes; 0 if none */
-	__le32 sig_size;	/* size of signature in bytes; 0 if none */
-	__le64 data_size;	/* size of file the Merkle tree is built over */
-	__u8 root_hash[64];	/* Merkle tree root hash */
-	__u8 salt[32];		/* salt prepended to each hashed block */
-	__u8 __reserved[144];	/* must be 0's */
-	__u8 signature[];	/* optional PKCS#7 signature */
-};
-
 /* Arbitrary limit to bound the kmalloc() size.  Can be changed. */
 #define FS_VERITY_MAX_DESCRIPTOR_SIZE	16384
 
 #define FS_VERITY_MAX_SIGNATURE_SIZE	(FS_VERITY_MAX_DESCRIPTOR_SIZE - \
 					 sizeof(struct fsverity_descriptor))
 
-/*
- * Format in which fs-verity file digests are signed in built-in signatures.
- * This is the same as 'struct fsverity_digest', except here some magic bytes
- * are prepended to provide some context about what is being signed in case the
- * same key is used for non-fsverity purposes, and here the fields have fixed
- * endianness.
- *
- * This struct is specific to the built-in signature verification support, which
- * is optional.  fs-verity users may also verify signatures in userspace, in
- * which case userspace is responsible for deciding on what bytes are signed.
- * This struct may still be used, but it doesn't have to be.  For example,
- * userspace could instead use a string like "sha256:$digest_as_hex_string".
- */
-struct fsverity_formatted_digest {
-	char magic[8];			/* must be "FSVerity" */
-	__le16 digest_algorithm;
-	__le16 digest_size;
-	__u8 digest[];
-};
-
 /* hash_algs.c */
 
 extern struct fsverity_hash_alg fsverity_hash_algs[];
diff --git a/include/uapi/linux/fsverity.h b/include/uapi/linux/fsverity.h
index da0daf6c193b4..260017a4b44b3 100644
--- a/include/uapi/linux/fsverity.h
+++ b/include/uapi/linux/fsverity.h
@@ -34,6 +34,55 @@ struct fsverity_digest {
 	__u8 digest[];
 };
 
+/*
+ * Struct containing a file's Merkle tree properties.  The fs-verity file digest
+ * is the hash of this struct.  A userspace program needs this struct only if it
+ * needs to compute fs-verity file digests itself, e.g. in order to sign files.
+ * It isn't needed just to enable fs-verity on a file.
+ *
+ * Note: when computing the file digest, 'sig_size' and 'signature' must be left
+ * zero and empty, respectively.  These fields are present only because some
+ * filesystems reuse this struct as part of their on-disk format.
+ */
+struct fsverity_descriptor {
+	__u8 version;		/* must be 1 */
+	__u8 hash_algorithm;	/* Merkle tree hash algorithm */
+	__u8 log_blocksize;	/* log2 of size of data and tree blocks */
+	__u8 salt_size;		/* size of salt in bytes; 0 if none */
+#ifdef __KERNEL__
+	__le32 sig_size;
+#else
+	__le32 __reserved_0x04;
+#endif
+	__le64 data_size;	/* size of file the Merkle tree is built over */
+	__u8 root_hash[64];	/* Merkle tree root hash */
+	__u8 salt[32];		/* salt prepended to each hashed block */
+	__u8 __reserved[144];	/* must be 0's */
+#ifdef __KERNEL__
+	__u8 signature[];
+#endif
+};
+
+/*
+ * Format in which fs-verity file digests are signed in built-in signatures.
+ * This is the same as 'struct fsverity_digest', except here some magic bytes
+ * are prepended to provide some context about what is being signed in case the
+ * same key is used for non-fsverity purposes, and here the fields have fixed
+ * endianness.
+ *
+ * This struct is specific to the built-in signature verification support, which
+ * is optional.  fs-verity users may also verify signatures in userspace, in
+ * which case userspace is responsible for deciding on what bytes are signed.
+ * This struct may still be used, but it doesn't have to be.  For example,
+ * userspace could instead use a string like "sha256:$digest_as_hex_string".
+ */
+struct fsverity_formatted_digest {
+	char magic[8];			/* must be "FSVerity" */
+	__le16 digest_algorithm;
+	__le16 digest_size;
+	__u8 digest[];
+};
+
 #define FS_IOC_ENABLE_VERITY	_IOW('f', 133, struct fsverity_enable_arg)
 #define FS_IOC_MEASURE_VERITY	_IOWR('f', 134, struct fsverity_digest)
 
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
