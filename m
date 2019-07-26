Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8098477440
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Jul 2019 00:46:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hr8yU-0005bW-Ti; Fri, 26 Jul 2019 22:46:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hr8yT-0005bH-Gf
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Jul 2019 22:46:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SegRiwX2NqUaktF3qNRuWxGJbOrtOqp+dPx52IkmO20=; b=M13PxSN671heK5+Fr9STKesaMr
 XLCLg/DfGDbcYfp14fS5+MNV02jLq3vvQEKosz7ZmbE3p/u4FSs7Lh9f+FN2papSWLqU4tEdSwE/K
 2lqzgq98uS5+1xvRFfCWMw3IZXRhOQgELV+E6JegKSZfBaX+ikdArvgFiDMN3Ug9QZxI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SegRiwX2NqUaktF3qNRuWxGJbOrtOqp+dPx52IkmO20=; b=SyT8uSSrtInCncG2IipqhN0tw5
 4a3u0V2tY3iVyq8ibBKOV1ZpxOxZcLaa9Bx8KD0Y9bTV3iZIIDi3OwxXX37Qv1EZpHqV2sbZroNAL
 0axZ7p6IXPpcAAOM9l1IVm/RP5S4v6K+igRWcTurfpYw1RKlYgVQIKaCiI9bJz8CEFMU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hr8yR-004z9u-Bp
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Jul 2019 22:46:05 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C63422CB9;
 Fri, 26 Jul 2019 22:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564181156;
 bh=ezWmir2rjCNGji+iNBq+3urZx0fmdyzIqxGmz6HduxY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BLKP6V9uTWJIlOQwuK8ZSL3NO5pwlMHlpwjFuEgHmRPlY1v3jbqT4y5+oVuLq0tK6
 MUXuJvvvi/fkAZDeI6K9yvYU6z5jvnNSsKU6T7Kfxnn4lk6dokVJcbnxN4HuIJl/zz
 4Ot3pZzYXXDTKRjVREDJem9Y/EmXiaWpmg7EX3Io=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 26 Jul 2019 15:41:27 -0700
Message-Id: <20190726224141.14044-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190726224141.14044-1-ebiggers@kernel.org>
References: <20190726224141.14044-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hr8yR-004z9u-Bp
Subject: [f2fs-dev] [PATCH v7 02/16] fscrypt: use FSCRYPT_ prefix for uapi
 constants
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
Cc: Satya Tangirala <satyat@google.com>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Prefix all filesystem encryption UAPI constants except the ioctl numbers
with "FSCRYPT_" rather than with "FS_".  This namespaces the constants
more appropriately and makes it clear that they are related specifically
to the filesystem encryption feature, and to the 'fscrypt_*' structures.
With some of the old names like "FS_POLICY_FLAGS_VALID", it was not
immediately clear that the constant had anything to do with encryption.

This is also useful because we'll be adding more encryption-related
constants, e.g. for the policy version, and we'd otherwise have to
choose whether to use unclear names like FS_POLICY_V1 or inconsistent
names like FS_ENCRYPTION_POLICY_V1.

For source compatibility with existing userspace programs, keep the old
names defined as aliases to the new names.

Finally, as long as new names are being defined anyway, I skipped
defining new names for the fscrypt mode numbers that aren't actually
used: INVALID (0), AES_256_GCM (2), AES_256_CBC (3), SPECK128_256_XTS
(7), and SPECK128_256_CTS (8).

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/filesystems/fscrypt.rst | 36 +++++++--------
 include/uapi/linux/fscrypt.h          | 65 +++++++++++++++++----------
 2 files changed, 60 insertions(+), 41 deletions(-)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index 82efa41b0e6c0..2c4b6e56b81c5 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -225,9 +225,10 @@ a little endian number, except that:
   is encrypted with AES-256 where the AES-256 key is the SHA-256 hash
   of the file's data encryption key.
 
-- In the "direct key" configuration (FS_POLICY_FLAG_DIRECT_KEY set in
-  the fscrypt_policy), the file's nonce is also appended to the IV.
-  Currently this is only allowed with the Adiantum encryption mode.
+- In the "direct key" configuration (FSCRYPT_POLICY_FLAG_DIRECT_KEY
+  set in the fscrypt_policy), the file's nonce is also appended to the
+  IV.  Currently this is only allowed with the Adiantum encryption
+  mode.
 
 Filenames encryption
 --------------------
@@ -274,14 +275,14 @@ empty directory or verifies that a directory or regular file already
 has the specified encryption policy.  It takes in a pointer to a
 :c:type:`struct fscrypt_policy`, defined as follows::
 
-    #define FS_KEY_DESCRIPTOR_SIZE  8
+    #define FSCRYPT_KEY_DESCRIPTOR_SIZE  8
 
     struct fscrypt_policy {
             __u8 version;
             __u8 contents_encryption_mode;
             __u8 filenames_encryption_mode;
             __u8 flags;
-            __u8 master_key_descriptor[FS_KEY_DESCRIPTOR_SIZE];
+            __u8 master_key_descriptor[FSCRYPT_KEY_DESCRIPTOR_SIZE];
     };
 
 This structure must be initialized as follows:
@@ -290,18 +291,17 @@ This structure must be initialized as follows:
 
 - ``contents_encryption_mode`` and ``filenames_encryption_mode`` must
   be set to constants from ``<linux/fs.h>`` which identify the
-  encryption modes to use.  If unsure, use
-  FS_ENCRYPTION_MODE_AES_256_XTS (1) for ``contents_encryption_mode``
-  and FS_ENCRYPTION_MODE_AES_256_CTS (4) for
-  ``filenames_encryption_mode``.
+  encryption modes to use.  If unsure, use FSCRYPT_MODE_AES_256_XTS
+  (1) for ``contents_encryption_mode`` and FSCRYPT_MODE_AES_256_CTS
+  (4) for ``filenames_encryption_mode``.
 
 - ``flags`` must contain a value from ``<linux/fs.h>`` which
   identifies the amount of NUL-padding to use when encrypting
-  filenames.  If unsure, use FS_POLICY_FLAGS_PAD_32 (0x3).
-  In addition, if the chosen encryption modes are both
-  FS_ENCRYPTION_MODE_ADIANTUM, this can contain
-  FS_POLICY_FLAG_DIRECT_KEY to specify that the master key should be
-  used directly, without key derivation.
+  filenames.  If unsure, use FSCRYPT_POLICY_FLAGS_PAD_32 (0x3).  In
+  addition, if the chosen encryption modes are both
+  FSCRYPT_MODE_ADIANTUM, this can contain
+  FSCRYPT_POLICY_FLAG_DIRECT_KEY to specify that the master key should
+  be used directly, without key derivation.
 
 - ``master_key_descriptor`` specifies how to find the master key in
   the keyring; see `Adding keys`_.  It is up to userspace to choose a
@@ -401,11 +401,11 @@ followed by the 16-character lower case hex representation of the
 ``master_key_descriptor`` that was set in the encryption policy.  The
 key payload must conform to the following structure::
 
-    #define FS_MAX_KEY_SIZE 64
+    #define FSCRYPT_MAX_KEY_SIZE 64
 
     struct fscrypt_key {
             u32 mode;
-            u8 raw[FS_MAX_KEY_SIZE];
+            u8 raw[FSCRYPT_MAX_KEY_SIZE];
             u32 size;
     };
 
@@ -574,7 +574,7 @@ much confusion if an encryption policy were to be added to or removed
 from anything other than an empty directory.)  The struct is defined
 as follows::
 
-    #define FS_KEY_DESCRIPTOR_SIZE  8
+    #define FSCRYPT_KEY_DESCRIPTOR_SIZE  8
     #define FS_KEY_DERIVATION_NONCE_SIZE 16
 
     struct fscrypt_context {
@@ -582,7 +582,7 @@ as follows::
             u8 contents_encryption_mode;
             u8 filenames_encryption_mode;
             u8 flags;
-            u8 master_key_descriptor[FS_KEY_DESCRIPTOR_SIZE];
+            u8 master_key_descriptor[FSCRYPT_KEY_DESCRIPTOR_SIZE];
             u8 nonce[FS_KEY_DERIVATION_NONCE_SIZE];
     };
 
diff --git a/include/uapi/linux/fscrypt.h b/include/uapi/linux/fscrypt.h
index 26f6d2c19afd3..674b0452ef575 100644
--- a/include/uapi/linux/fscrypt.h
+++ b/include/uapi/linux/fscrypt.h
@@ -10,35 +10,30 @@
 
 #include <linux/types.h>
 
-#define FS_KEY_DESCRIPTOR_SIZE	8
+#define FSCRYPT_KEY_DESCRIPTOR_SIZE	8
 
 /* Encryption policy flags */
-#define FS_POLICY_FLAGS_PAD_4		0x00
-#define FS_POLICY_FLAGS_PAD_8		0x01
-#define FS_POLICY_FLAGS_PAD_16		0x02
-#define FS_POLICY_FLAGS_PAD_32		0x03
-#define FS_POLICY_FLAGS_PAD_MASK	0x03
-#define FS_POLICY_FLAG_DIRECT_KEY	0x04	/* use master key directly */
-#define FS_POLICY_FLAGS_VALID		0x07
+#define FSCRYPT_POLICY_FLAGS_PAD_4		0x00
+#define FSCRYPT_POLICY_FLAGS_PAD_8		0x01
+#define FSCRYPT_POLICY_FLAGS_PAD_16		0x02
+#define FSCRYPT_POLICY_FLAGS_PAD_32		0x03
+#define FSCRYPT_POLICY_FLAGS_PAD_MASK		0x03
+#define FSCRYPT_POLICY_FLAG_DIRECT_KEY		0x04	/* use master key directly */
+#define FSCRYPT_POLICY_FLAGS_VALID		0x07
 
 /* Encryption algorithms */
-#define FS_ENCRYPTION_MODE_INVALID		0
-#define FS_ENCRYPTION_MODE_AES_256_XTS		1
-#define FS_ENCRYPTION_MODE_AES_256_GCM		2
-#define FS_ENCRYPTION_MODE_AES_256_CBC		3
-#define FS_ENCRYPTION_MODE_AES_256_CTS		4
-#define FS_ENCRYPTION_MODE_AES_128_CBC		5
-#define FS_ENCRYPTION_MODE_AES_128_CTS		6
-#define FS_ENCRYPTION_MODE_SPECK128_256_XTS	7 /* Removed, do not use. */
-#define FS_ENCRYPTION_MODE_SPECK128_256_CTS	8 /* Removed, do not use. */
-#define FS_ENCRYPTION_MODE_ADIANTUM		9
+#define FSCRYPT_MODE_AES_256_XTS		1
+#define FSCRYPT_MODE_AES_256_CTS		4
+#define FSCRYPT_MODE_AES_128_CBC		5
+#define FSCRYPT_MODE_AES_128_CTS		6
+#define FSCRYPT_MODE_ADIANTUM			9
 
 struct fscrypt_policy {
 	__u8 version;
 	__u8 contents_encryption_mode;
 	__u8 filenames_encryption_mode;
 	__u8 flags;
-	__u8 master_key_descriptor[FS_KEY_DESCRIPTOR_SIZE];
+	__u8 master_key_descriptor[FSCRYPT_KEY_DESCRIPTOR_SIZE];
 };
 
 #define FS_IOC_SET_ENCRYPTION_POLICY	_IOR('f', 19, struct fscrypt_policy)
@@ -46,16 +41,40 @@ struct fscrypt_policy {
 #define FS_IOC_GET_ENCRYPTION_POLICY	_IOW('f', 21, struct fscrypt_policy)
 
 /* Parameters for passing an encryption key into the kernel keyring */
-#define FS_KEY_DESC_PREFIX		"fscrypt:"
-#define FS_KEY_DESC_PREFIX_SIZE		8
+#define FSCRYPT_KEY_DESC_PREFIX		"fscrypt:"
+#define FSCRYPT_KEY_DESC_PREFIX_SIZE		8
 
 /* Structure that userspace passes to the kernel keyring */
-#define FS_MAX_KEY_SIZE			64
+#define FSCRYPT_MAX_KEY_SIZE			64
 
 struct fscrypt_key {
 	__u32 mode;
-	__u8 raw[FS_MAX_KEY_SIZE];
+	__u8 raw[FSCRYPT_MAX_KEY_SIZE];
 	__u32 size;
 };
+/**********************************************************************/
+
+/* old names; don't add anything new here! */
+#define FS_KEY_DESCRIPTOR_SIZE		FSCRYPT_KEY_DESCRIPTOR_SIZE
+#define FS_POLICY_FLAGS_PAD_4		FSCRYPT_POLICY_FLAGS_PAD_4
+#define FS_POLICY_FLAGS_PAD_8		FSCRYPT_POLICY_FLAGS_PAD_8
+#define FS_POLICY_FLAGS_PAD_16		FSCRYPT_POLICY_FLAGS_PAD_16
+#define FS_POLICY_FLAGS_PAD_32		FSCRYPT_POLICY_FLAGS_PAD_32
+#define FS_POLICY_FLAGS_PAD_MASK	FSCRYPT_POLICY_FLAGS_PAD_MASK
+#define FS_POLICY_FLAG_DIRECT_KEY	FSCRYPT_POLICY_FLAG_DIRECT_KEY
+#define FS_POLICY_FLAGS_VALID		FSCRYPT_POLICY_FLAGS_VALID
+#define FS_ENCRYPTION_MODE_INVALID	0	/* never used */
+#define FS_ENCRYPTION_MODE_AES_256_XTS	FSCRYPT_MODE_AES_256_XTS
+#define FS_ENCRYPTION_MODE_AES_256_GCM	2	/* never used */
+#define FS_ENCRYPTION_MODE_AES_256_CBC	3	/* never used */
+#define FS_ENCRYPTION_MODE_AES_256_CTS	FSCRYPT_MODE_AES_256_CTS
+#define FS_ENCRYPTION_MODE_AES_128_CBC	FSCRYPT_MODE_AES_128_CBC
+#define FS_ENCRYPTION_MODE_AES_128_CTS	FSCRYPT_MODE_AES_128_CTS
+#define FS_ENCRYPTION_MODE_SPECK128_256_XTS	7	/* removed */
+#define FS_ENCRYPTION_MODE_SPECK128_256_CTS	8	/* removed */
+#define FS_ENCRYPTION_MODE_ADIANTUM	FSCRYPT_MODE_ADIANTUM
+#define FS_KEY_DESC_PREFIX		FSCRYPT_KEY_DESC_PREFIX
+#define FS_KEY_DESC_PREFIX_SIZE		FSCRYPT_KEY_DESC_PREFIX_SIZE
+#define FS_MAX_KEY_SIZE			FSCRYPT_MAX_KEY_SIZE
 
 #endif /* _UAPI_LINUX_FSCRYPT_H */
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
