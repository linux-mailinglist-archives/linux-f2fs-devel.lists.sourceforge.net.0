Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC58821FD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Aug 2019 18:28:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hufqy-0001yv-EI; Mon, 05 Aug 2019 16:28:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hufqw-0001yT-C6
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 16:28:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lLQR17sQEPckwEOpuKE/jFrMgaJojZ1XuQe3BSbssWk=; b=FDVIBNrt//lTvRGTqz0oNiytMc
 xyRNMm60jbNBk4vzIme+Gzq+BNqT3z5pmxgYtJ/BOtWgMBbKMr/tCcNchCfcuUOplN/v435vrKKmy
 o5lKfVT7s9pzM1Xyr2FYKtX2pO16NxwztrFC0aiiuDjaTq8VH3J9/ep6FUu0tshYLkQc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lLQR17sQEPckwEOpuKE/jFrMgaJojZ1XuQe3BSbssWk=; b=inVbKM7uvVMymPi0iNGsuMyOZq
 mSFfSf06GHeo2aQqXt/TRTxfFpcwYi1ulDdJQP6BEF9fQ6OVwRiNuRVXL9YP+0WQAOlYjpSBq0ZhH
 3X9kzkYpf+B8X/4oIgoI5Yb46anznzsWBoejNU0AUYpMCbvVwI/kq7Upnu6foY4ZDVyw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hufqt-00BLzV-2r
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 16:28:53 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E13D218A3;
 Mon,  5 Aug 2019 16:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565022520;
 bh=2AloJBinTjzwNsMrY1X/G3is5mRIOXWue9Asbg1sEgo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bmfhRM33eSKXfrJQIJEMq5Qdmu0/7rCbBw++DlR9/CKjsM7M6rn09tnqcca3sSX/g
 zAGqZBxl2zYNjQnpa1WghdYlIkxQUPddcKI3n0CpNZhvt0TXlhgpQAOD1cxIkYaXpy
 ZfIAnbYngIRdrt6KWN2weSM6IIL/TqDQFJjom6d8=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon,  5 Aug 2019 09:25:21 -0700
Message-Id: <20190805162521.90882-21-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
In-Reply-To: <20190805162521.90882-1-ebiggers@kernel.org>
References: <20190805162521.90882-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
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
 0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hufqt-00BLzV-2r
Subject: [f2fs-dev] [PATCH v8 20/20] fscrypt: document the new ioctls and
 policy version
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
Cc: Satya Tangirala <satyat@google.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-api@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Update the fscrypt documentation file to catch up to all the latest
changes, including the new ioctls to manage master encryption keys in
the filesystem-level keyring and the support for v2 encryption policies.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 Documentation/filesystems/fscrypt.rst | 729 ++++++++++++++++++++++----
 1 file changed, 613 insertions(+), 116 deletions(-)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index d60b885c402401..4289c29d7c5a2c 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -72,6 +72,9 @@ Online attacks
 fscrypt (and storage encryption in general) can only provide limited
 protection, if any at all, against online attacks.  In detail:
 
+Side-channel attacks
+~~~~~~~~~~~~~~~~~~~~
+
 fscrypt is only resistant to side-channel attacks, such as timing or
 electromagnetic attacks, to the extent that the underlying Linux
 Cryptographic API algorithms are.  If a vulnerable algorithm is used,
@@ -80,29 +83,90 @@ attacker to mount a side channel attack against the online system.
 Side channel attacks may also be mounted against applications
 consuming decrypted data.
 
-After an encryption key has been provided, fscrypt is not designed to
-hide the plaintext file contents or filenames from other users on the
-same system, regardless of the visibility of the keyring key.
-Instead, existing access control mechanisms such as file mode bits,
-POSIX ACLs, LSMs, or mount namespaces should be used for this purpose.
-Also note that as long as the encryption keys are *anywhere* in
-memory, an online attacker can necessarily compromise them by mounting
-a physical attack or by exploiting any kernel security vulnerability
-which provides an arbitrary memory read primitive.
-
-While it is ostensibly possible to "evict" keys from the system,
-recently accessed encrypted files will remain accessible at least
-until the filesystem is unmounted or the VFS caches are dropped, e.g.
-using ``echo 2 > /proc/sys/vm/drop_caches``.  Even after that, if the
-RAM is compromised before being powered off, it will likely still be
-possible to recover portions of the plaintext file contents, if not
-some of the encryption keys as well.  (Since Linux v4.12, all
-in-kernel keys related to fscrypt are sanitized before being freed.
-However, userspace would need to do its part as well.)
-
-Currently, fscrypt does not prevent a user from maliciously providing
-an incorrect key for another user's existing encrypted files.  A
-protection against this is planned.
+Unauthorized file access
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+After an encryption key has been added, fscrypt does not hide the
+plaintext file contents or filenames from other users on the same
+system.  Instead, existing access control mechanisms such as file mode
+bits, POSIX ACLs, LSMs, or namespaces should be used for this purpose.
+
+(For the reasoning behind this, understand that while the key is
+added, the confidentiality of the data, from the perspective of the
+system itself, is *not* protected by the mathematical properties of
+encryption but rather only by the correctness of the kernel.
+Therefore, any encryption-specific access control checks would merely
+be enforced by kernel *code* and therefore would be largely redundant
+with the wide variety of access control mechanisms already available.)
+
+Kernel memory compromise
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+An attacker who compromises the system enough to read from arbitrary
+memory, e.g. by mounting a physical attack or by exploiting a kernel
+security vulnerability, can compromise all encryption keys that are
+currently in use.
+
+However, fscrypt allows encryption keys to be removed from the kernel,
+which may protect them from later compromise.
+
+In more detail, the FS_IOC_REMOVE_ENCRYPTION_KEY ioctl (or the
+FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS ioctl) can wipe a master
+encryption key from kernel memory.  If it does so, it will also try to
+evict all cached inodes which had been "unlocked" using the key,
+thereby wiping their per-file keys and making them once again appear
+"locked", i.e. in ciphertext or encrypted form.
+
+However, these ioctls have some limitations:
+
+- Per-file keys for in-use files will *not* be removed or wiped.
+  Therefore, for maximum effect, userspace should close the relevant
+  encrypted files and directories before removing a master key, as
+  well as kill any processes whose working directory is in an affected
+  encrypted directory.
+
+- The kernel cannot magically wipe copies of the master key(s) that
+  userspace might have as well.  Therefore, userspace must wipe all
+  copies of the master key(s) it makes as well; normally this should
+  be done immediately after FS_IOC_ADD_ENCRYPTION_KEY, without waiting
+  for FS_IOC_REMOVE_ENCRYPTION_KEY.  Naturally, the same also applies
+  to all higher levels in the key hierarchy.  Userspace should also
+  follow other security precautions such as mlock()ing memory
+  containing keys to prevent it from being swapped out.
+
+- In general, decrypted contents and filenames in the kernel VFS
+  caches are freed but not wiped.  Therefore, portions thereof may be
+  recoverable from freed memory, even after the corresponding key(s)
+  were wiped.  To partially solve this, you can set
+  CONFIG_PAGE_POISONING=y in your kernel config and add page_poison=1
+  to your kernel command line.  However, this has a performance cost.
+
+- Secret keys might still exist in CPU registers, in crypto
+  accelerator hardware (if used by the crypto API to implement any of
+  the algorithms), or in other places not explicitly considered here.
+
+Limitations of v1 policies
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+v1 encryption policies have some weaknesses with respect to online
+attacks:
+
+- There is no verification that the provided master key is correct.
+  Therefore, a malicious user can temporarily associate the wrong key
+  with another user's encrypted files to which they have read-only
+  access.  Because of filesystem caching, the wrong key will then be
+  used by the other user's accesses to those files, even if the other
+  user has the correct key in their own keyring.  This violates the
+  meaning of "read-only access".
+
+- A compromise of a per-file key also compromises the master key from
+  which it was derived.
+
+- Non-root users cannot securely remove encryption keys.
+
+All the above problems are fixed with v2 encryption policies.  For
+this reason among others, it is recommended to use v2 encryption
+policies on all new encrypted directories.
 
 Key hierarchy
 =============
@@ -123,11 +187,52 @@ appropriate master key.  There can be any number of master keys, each
 of which protects any number of directory trees on any number of
 filesystems.
 
-Userspace should generate master keys either using a cryptographically
-secure random number generator, or by using a KDF (Key Derivation
-Function).  Note that whenever a KDF is used to "stretch" a
-lower-entropy secret such as a passphrase, it is critical that a KDF
-designed for this purpose be used, such as scrypt, PBKDF2, or Argon2.
+Master keys must be real cryptographic keys, i.e. indistinguishable
+from random bytestrings of the same length.  This implies that users
+**must not** directly use a password as a master key, zero-pad a
+shorter key, or repeat a shorter key.  Security cannot be guaranteed
+if userspace makes any such error, as the cryptographic proofs and
+analysis would no longer apply.
+
+Instead, users should generate master keys either using a
+cryptographically secure random number generator, or by using a KDF
+(Key Derivation Function).  The kernel does not do any key stretching;
+therefore, if userspace derives the key from a low-entropy secret such
+as a passphrase, it is critical that a KDF designed for this purpose
+be used, such as scrypt, PBKDF2, or Argon2.
+
+Key derivation function
+-----------------------
+
+With one exception, fscrypt never uses the master key(s) for
+encryption directly.  Instead, they are only used as input to a KDF
+(Key Derivation Function) to derive the actual keys.
+
+The KDF used for a particular master key differs depending on whether
+the key is used for v1 encryption policies or for v2 encryption
+policies.  Users **must not** use the same key for both v1 and v2
+encryption policies.  (No real-world attack is currently known on this
+specific case of key reuse, but its security cannot be guaranteed
+since the cryptographic proofs and analysis would no longer apply.)
+
+For v1 encryption policies, the KDF only supports deriving per-file
+encryption keys.  It works by encrypting the master key with
+AES-128-ECB, using the file's 16-byte nonce as the AES key.  The
+resulting ciphertext is used as the derived key.  If the ciphertext is
+longer than needed, then it is truncated to the needed length.
+
+For v2 encryption policies, the KDF is HKDF-SHA512.  The master key is
+passed as the "input keying material", no salt is used, and a distinct
+"application-specific information string" is used for each distinct
+key to be derived.  For example, when a per-file encryption key is
+derived, the application-specific information string is the file's
+nonce prefixed with "fscrypt\\0" and a context byte.  Different
+context bytes are used for other types of derived keys.
+
+HKDF-SHA512 is preferred to the original AES-128-ECB based KDF because
+HKDF is more flexible, is nonreversible, and evenly distributes
+entropy from the master key.  HKDF is also standardized and widely
+used by other software, whereas the AES-128-ECB based KDF is ad-hoc.
 
 Per-file keys
 -------------
@@ -138,29 +243,9 @@ files doesn't map to the same ciphertext, or vice versa.  In most
 cases, fscrypt does this by deriving per-file keys.  When a new
 encrypted inode (regular file, directory, or symlink) is created,
 fscrypt randomly generates a 16-byte nonce and stores it in the
-inode's encryption xattr.  Then, it uses a KDF (Key Derivation
-Function) to derive the file's key from the master key and nonce.
-
-The Adiantum encryption mode (see `Encryption modes and usage`_) is
-special, since it accepts longer IVs and is suitable for both contents
-and filenames encryption.  For it, a "direct key" option is offered
-where the file's nonce is included in the IVs and the master key is
-used for encryption directly.  This improves performance; however,
-users must not use the same master key for any other encryption mode.
-
-Below, the KDF and design considerations are described in more detail.
-
-The current KDF works by encrypting the master key with AES-128-ECB,
-using the file's nonce as the AES key.  The output is used as the
-derived key.  If the output is longer than needed, then it is
-truncated to the needed length.
-
-Note: this KDF meets the primary security requirement, which is to
-produce unique derived keys that preserve the entropy of the master
-key, assuming that the master key is already a good pseudorandom key.
-However, it is nonstandard and has some problems such as being
-reversible, so it is generally considered to be a mistake!  It may be
-replaced with HKDF or another more standard KDF in the future.
+inode's encryption xattr.  Then, it uses a KDF (as described in `Key
+derivation function`_) to derive the file's key from the master key
+and nonce.
 
 Key derivation was chosen over key wrapping because wrapped keys would
 require larger xattrs which would be less likely to fit in-line in the
@@ -176,6 +261,37 @@ rejected as it would have prevented ext4 filesystems from being
 resized, and by itself still wouldn't have been sufficient to prevent
 the same key from being directly reused for both XTS and CTS-CBC.
 
+DIRECT_KEY and per-mode keys
+----------------------------
+
+The Adiantum encryption mode (see `Encryption modes and usage`_) is
+suitable for both contents and filenames encryption, and it accepts
+long IVs --- long enough to hold both an 8-byte logical block number
+and a 16-byte per-file nonce.  Also, the overhead of each Adiantum key
+is greater than that of an AES-256-XTS key.
+
+Therefore, to improve performance and save memory, for Adiantum a
+"direct key" configuration is supported.  When the user has enabled
+this by setting FSCRYPT_POLICY_FLAG_DIRECT_KEY in the fscrypt policy,
+per-file keys are not used.  Instead, whenever any data (contents or
+filenames) is encrypted, the file's 16-byte nonce is included in the
+IV.  Moreover:
+
+- For v1 encryption policies, the encryption is done directly with the
+  master key.  Because of this, users **must not** use the same master
+  key for any other purpose, even for other v1 policies.
+
+- For v2 encryption policies, the encryption is done with a per-mode
+  key derived using the KDF.  Users may use the same master key for
+  other v2 encryption policies.
+
+Key identifiers
+---------------
+
+For master keys used for v2 encryption policies, a unique 16-byte "key
+identifier" is also derived using the KDF.  This value is stored in
+the clear, since it is needed to reliably identify the key itself.
+
 Encryption modes and usage
 ==========================
 
@@ -270,24 +386,44 @@ User API
 Setting an encryption policy
 ----------------------------
 
+FS_IOC_SET_ENCRYPTION_POLICY
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
 The FS_IOC_SET_ENCRYPTION_POLICY ioctl sets an encryption policy on an
 empty directory or verifies that a directory or regular file already
 has the specified encryption policy.  It takes in a pointer to a
-:c:type:`struct fscrypt_policy`, defined as follows::
+:c:type:`struct fscrypt_policy_v1` or a :c:type:`struct
+fscrypt_policy_v2`, defined as follows::
 
-    #define FSCRYPT_KEY_DESCRIPTOR_SIZE  8
-
-    struct fscrypt_policy {
+    #define FSCRYPT_POLICY_V1               0
+    #define FSCRYPT_KEY_DESCRIPTOR_SIZE     8
+    struct fscrypt_policy_v1 {
             __u8 version;
             __u8 contents_encryption_mode;
             __u8 filenames_encryption_mode;
             __u8 flags;
             __u8 master_key_descriptor[FSCRYPT_KEY_DESCRIPTOR_SIZE];
     };
+    #define fscrypt_policy  fscrypt_policy_v1
+
+    #define FSCRYPT_POLICY_V2               2
+    #define FSCRYPT_KEY_IDENTIFIER_SIZE     16
+    struct fscrypt_policy_v2 {
+            __u8 version;
+            __u8 contents_encryption_mode;
+            __u8 filenames_encryption_mode;
+            __u8 flags;
+            __u8 __reserved[4];
+            __u8 master_key_identifier[FSCRYPT_KEY_IDENTIFIER_SIZE];
+    };
 
 This structure must be initialized as follows:
 
-- ``version`` must be 0.
+- ``version`` must be FSCRYPT_POLICY_V1 (0) if the struct is
+  :c:type:`fscrypt_policy_v1` or FSCRYPT_POLICY_V2 (2) if the struct
+  is :c:type:`fscrypt_policy_v2`.  (Note: we refer to the original
+  policy version as "v1", though its version code is really 0.)  For
+  new encrypted directories, use v2 policies.
 
 - ``contents_encryption_mode`` and ``filenames_encryption_mode`` must
   be set to constants from ``<linux/fscrypt.h>`` which identify the
@@ -297,21 +433,30 @@ This structure must be initialized as follows:
 
 - ``flags`` must contain a value from ``<linux/fscrypt.h>`` which
   identifies the amount of NUL-padding to use when encrypting
-  filenames.  If unsure, use FSCRYPT_POLICY_FLAGS_PAD_32 (0x3).  In
-  addition, if the chosen encryption modes are both
+  filenames.  If unsure, use FSCRYPT_POLICY_FLAGS_PAD_32 (0x3).
+  Additionally, if the encryption modes are both
   FSCRYPT_MODE_ADIANTUM, this can contain
-  FSCRYPT_POLICY_FLAG_DIRECT_KEY to specify that the master key should
-  be used directly, without key derivation.
+  FSCRYPT_POLICY_FLAG_DIRECT_KEY; see `DIRECT_KEY and per-mode keys`_.
+
+- For v2 encryption policies, ``__reserved`` must be zeroed.
 
-- ``master_key_descriptor`` specifies how to find the master key in
-  the keyring; see `Adding keys`_.  It is up to userspace to choose a
-  unique ``master_key_descriptor`` for each master key.  The e4crypt
-  and fscrypt tools use the first 8 bytes of
+- For v1 encryption policies, ``master_key_descriptor`` specifies how
+  to find the master key in a keyring; see `Adding keys`_.  It is up
+  to userspace to choose a unique ``master_key_descriptor`` for each
+  master key.  The e4crypt and fscrypt tools use the first 8 bytes of
   ``SHA-512(SHA-512(master_key))``, but this particular scheme is not
   required.  Also, the master key need not be in the keyring yet when
   FS_IOC_SET_ENCRYPTION_POLICY is executed.  However, it must be added
   before any files can be created in the encrypted directory.
 
+  For v2 encryption policies, ``master_key_descriptor`` has been
+  replaced with ``master_key_identifier``, which is longer and cannot
+  be arbitrarily chosen.  Instead, the key must first be added using
+  `FS_IOC_ADD_ENCRYPTION_KEY`_.  Then, the ``key_spec.u.identifier``
+  the kernel returned in the :c:type:`struct fscrypt_add_key_arg` must
+  be used as the ``master_key_identifier`` in the :c:type:`struct
+  fscrypt_policy_v2`.
+
 If the file is not yet encrypted, then FS_IOC_SET_ENCRYPTION_POLICY
 verifies that the file is an empty directory.  If so, the specified
 encryption policy is assigned to the directory, turning it into an
@@ -327,6 +472,15 @@ policy exactly matches the actual one.  If they match, then the ioctl
 returns 0.  Otherwise, it fails with EEXIST.  This works on both
 regular files and directories, including nonempty directories.
 
+When a v2 encryption policy is assigned to a directory, it is also
+required that either the specified key has been added by the current
+user or that the caller has CAP_FOWNER in the initial user namespace.
+(This is needed to prevent a user from encrypting their data with
+another user's key.)  The key must remain added while
+FS_IOC_SET_ENCRYPTION_POLICY is executing.  However, if the new
+encrypted directory does not need to be accessed immediately, then the
+key can be removed right away afterwards.
+
 Note that the ext4 filesystem does not allow the root directory to be
 encrypted, even if it is empty.  Users who want to encrypt an entire
 filesystem with one key should consider using dm-crypt instead.
@@ -339,7 +493,11 @@ FS_IOC_SET_ENCRYPTION_POLICY can fail with the following errors:
 - ``EEXIST``: the file is already encrypted with an encryption policy
   different from the one specified
 - ``EINVAL``: an invalid encryption policy was specified (invalid
-  version, mode(s), or flags)
+  version, mode(s), or flags; or reserved bits were set)
+- ``ENOKEY``: a v2 encryption policy was specified, but the key with
+  the specified ``master_key_identifier`` has not been added, nor does
+  the process have the CAP_FOWNER capability in the initial user
+  namespace
 - ``ENOTDIR``: the file is unencrypted and is a regular file, not a
   directory
 - ``ENOTEMPTY``: the file is unencrypted and is a nonempty directory
@@ -358,25 +516,78 @@ FS_IOC_SET_ENCRYPTION_POLICY can fail with the following errors:
 Getting an encryption policy
 ----------------------------
 
-The FS_IOC_GET_ENCRYPTION_POLICY ioctl retrieves the :c:type:`struct
-fscrypt_policy`, if any, for a directory or regular file.  See above
-for the struct definition.  No additional permissions are required
-beyond the ability to open the file.
+Two ioctls are available to get a file's encryption policy:
+
+- `FS_IOC_GET_ENCRYPTION_POLICY_EX`_
+- `FS_IOC_GET_ENCRYPTION_POLICY`_
+
+The extended (_EX) version of the ioctl is more general and is
+recommended to use when possible.  However, on older kernels only the
+original ioctl is available.  Applications should try the extended
+version, and if it fails with ENOTTY fall back to the original
+version.
+
+FS_IOC_GET_ENCRYPTION_POLICY_EX
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The FS_IOC_GET_ENCRYPTION_POLICY_EX ioctl retrieves the encryption
+policy, if any, for a directory or regular file.  No additional
+permissions are required beyond the ability to open the file.  It
+takes in a pointer to a :c:type:`struct fscrypt_get_policy_ex_arg`,
+defined as follows::
+
+    struct fscrypt_get_policy_ex_arg {
+            __u64 policy_size; /* input/output */
+            union {
+                    __u8 version;
+                    struct fscrypt_policy_v1 v1;
+                    struct fscrypt_policy_v2 v2;
+            } policy; /* output */
+    };
+
+The caller must initialize ``policy_size`` to the size available for
+the policy struct, i.e. ``sizeof(arg.policy)``.
+
+On success, the policy struct is returned in ``policy``, and its
+actual size is returned in ``policy_size``.  ``policy.version`` should
+be checked to determine the version of policy returned.  Note that the
+version code for the "v1" policy is actually 0 (FSCRYPT_POLICY_V1).
 
-FS_IOC_GET_ENCRYPTION_POLICY can fail with the following errors:
+FS_IOC_GET_ENCRYPTION_POLICY_EX can fail with the following errors:
 
 - ``EINVAL``: the file is encrypted, but it uses an unrecognized
-  encryption context format
+  encryption policy version
 - ``ENODATA``: the file is not encrypted
-- ``ENOTTY``: this type of filesystem does not implement encryption
+- ``ENOTTY``: this type of filesystem does not implement encryption,
+  or this kernel is too old to support FS_IOC_GET_ENCRYPTION_POLICY_EX
+  (try FS_IOC_GET_ENCRYPTION_POLICY instead)
 - ``EOPNOTSUPP``: the kernel was not configured with encryption
   support for this filesystem
+- ``EOVERFLOW``: the file is encrypted and uses a recognized
+  encryption policy version, but the policy struct does not fit into
+  the provided buffer
 
 Note: if you only need to know whether a file is encrypted or not, on
 most filesystems it is also possible to use the FS_IOC_GETFLAGS ioctl
 and check for FS_ENCRYPT_FL, or to use the statx() system call and
 check for STATX_ATTR_ENCRYPTED in stx_attributes.
 
+FS_IOC_GET_ENCRYPTION_POLICY
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The FS_IOC_GET_ENCRYPTION_POLICY ioctl can also retrieve the
+encryption policy, if any, for a directory or regular file.  However,
+unlike `FS_IOC_GET_ENCRYPTION_POLICY_EX`_,
+FS_IOC_GET_ENCRYPTION_POLICY only supports the original policy
+version.  It takes in a pointer directly to a :c:type:`struct
+fscrypt_policy_v1` rather than a :c:type:`struct
+fscrypt_get_policy_ex_arg`.
+
+The error codes for FS_IOC_GET_ENCRYPTION_POLICY are the same as those
+for FS_IOC_GET_ENCRYPTION_POLICY_EX, except that
+FS_IOC_GET_ENCRYPTION_POLICY also returns ``EINVAL`` if the file is
+encrypted using a newer encryption policy version.
+
 Getting the per-filesystem salt
 -------------------------------
 
@@ -392,8 +603,115 @@ generate and manage any needed salt(s) in userspace.
 Adding keys
 -----------
 
-To provide a master key, userspace must add it to an appropriate
-keyring using the add_key() system call (see:
+FS_IOC_ADD_ENCRYPTION_KEY
+~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The FS_IOC_ADD_ENCRYPTION_KEY ioctl adds a master encryption key to
+the filesystem, making all files on the filesystem which were
+encrypted using that key appear "unlocked", i.e. in plaintext form.
+It can be executed on any file or directory on the target filesystem,
+but using the filesystem's root directory is recommended.  It takes in
+a pointer to a :c:type:`struct fscrypt_add_key_arg`, defined as
+follows::
+
+    struct fscrypt_add_key_arg {
+            struct fscrypt_key_specifier key_spec;
+            __u32 raw_size;
+            __u32 __reserved[9];
+            __u8 raw[];
+    };
+
+    #define FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR        1
+    #define FSCRYPT_KEY_SPEC_TYPE_IDENTIFIER        2
+
+    struct fscrypt_key_specifier {
+            __u32 type;     /* one of FSCRYPT_KEY_SPEC_TYPE_* */
+            __u32 __reserved;
+            union {
+                    __u8 __reserved[32]; /* reserve some extra space */
+                    __u8 descriptor[FSCRYPT_KEY_DESCRIPTOR_SIZE];
+                    __u8 identifier[FSCRYPT_KEY_IDENTIFIER_SIZE];
+            } u;
+    };
+
+:c:type:`struct fscrypt_add_key_arg` must be zeroed, then initialized
+as follows:
+
+- If the key is being added for use by v1 encryption policies, then
+  ``key_spec.type`` must contain FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR, and
+  ``key_spec.u.descriptor`` must contain the descriptor of the key
+  being added, corresponding to the value in the
+  ``master_key_descriptor`` field of :c:type:`struct
+  fscrypt_policy_v1`.  To add this type of key, the calling process
+  must have the CAP_SYS_ADMIN capability in the initial user
+  namespace.
+
+  Alternatively, if the key is being added for use by v2 encryption
+  policies, then ``key_spec.type`` must contain
+  FSCRYPT_KEY_SPEC_TYPE_IDENTIFIER, and ``key_spec.u.identifier`` is
+  an *output* field which the kernel fills in with a cryptographic
+  hash of the key.  To add this type of key, the calling process does
+  not need any privileges.  However, the number of keys that can be
+  added is limited by the user's quota for the keyrings service (see
+  ``Documentation/security/keys/core.rst``).
+
+- ``raw_size`` must be the size of the ``raw`` key provided, in bytes.
+
+- ``raw`` is a variable-length field which must contain the actual
+  key, ``raw_size`` bytes long.
+
+For v2 policy keys, the kernel keeps track of which user (identified
+by effective user ID) added the key, and only allows the key to be
+removed by that user --- or by "root", if they use
+`FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS`_.
+
+However, if another user has added the key, it may be desirable to
+prevent that other user from unexpectedly removing it.  Therefore,
+FS_IOC_ADD_ENCRYPTION_KEY may also be used to add a v2 policy key
+*again*, even if it's already added by other user(s).  In this case,
+FS_IOC_ADD_ENCRYPTION_KEY will just install a claim to the key for the
+current user, rather than actually add the key again (but the raw key
+must still be provided, as a proof of knowledge).
+
+FS_IOC_ADD_ENCRYPTION_KEY returns 0 if either the key or a claim to
+the key was either added or already exists.
+
+FS_IOC_ADD_ENCRYPTION_KEY can fail with the following errors:
+
+- ``EACCES``: FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR was specified, but the
+  caller does not have the CAP_SYS_ADMIN capability in the initial
+  user namespace
+- ``EDQUOT``: the key quota for this user would be exceeded by adding
+  the key
+- ``EINVAL``: invalid key size or key specifier type, or reserved bits
+  were set
+- ``ENOTTY``: this type of filesystem does not implement encryption
+- ``EOPNOTSUPP``: the kernel was not configured with encryption
+  support for this filesystem, or the filesystem superblock has not
+  had encryption enabled on it
+
+Legacy method
+~~~~~~~~~~~~~
+
+For v1 encryption policies, a master encryption key can also be
+provided by adding it to a process-subscribed keyring, e.g. to a
+session keyring, or to a user keyring if the user keyring is linked
+into the session keyring.
+
+This method is deprecated (and not supported for v2 encryption
+policies) for several reasons.  First, it cannot be used in
+combination with FS_IOC_REMOVE_ENCRYPTION_KEY (see `Removing keys`_),
+so for removing a key a workaround such as keyctl_unlink() in
+combination with ``sync; echo 2 > /proc/sys/vm/drop_caches`` would
+have to be used.  Second, it doesn't match the fact that the
+locked/unlocked status of encrypted files (i.e. whether they appear to
+be in plaintext form or in ciphertext form) is global.  This mismatch
+has caused much confusion as well as real problems when processes
+running under different UIDs, such as a ``sudo`` command, need to
+access encrypted files.
+
+Nevertheless, to add a key to one of the process-subscribed keyrings,
+the add_key() system call can be used (see:
 ``Documentation/security/keys/core.rst``).  The key type must be
 "logon"; keys of this type are kept in kernel memory and cannot be
 read back by userspace.  The key description must be "fscrypt:"
@@ -401,12 +719,12 @@ followed by the 16-character lower case hex representation of the
 ``master_key_descriptor`` that was set in the encryption policy.  The
 key payload must conform to the following structure::
 
-    #define FSCRYPT_MAX_KEY_SIZE 64
+    #define FSCRYPT_MAX_KEY_SIZE            64
 
     struct fscrypt_key {
-            u32 mode;
-            u8 raw[FSCRYPT_MAX_KEY_SIZE];
-            u32 size;
+            __u32 mode;
+            __u8 raw[FSCRYPT_MAX_KEY_SIZE];
+            __u32 size;
     };
 
 ``mode`` is ignored; just set it to 0.  The actual key is provided in
@@ -418,26 +736,194 @@ with a filesystem-specific prefix such as "ext4:".  However, the
 filesystem-specific prefixes are deprecated and should not be used in
 new programs.
 
-There are several different types of keyrings in which encryption keys
-may be placed, such as a session keyring, a user session keyring, or a
-user keyring.  Each key must be placed in a keyring that is "attached"
-to all processes that might need to access files encrypted with it, in
-the sense that request_key() will find the key.  Generally, if only
-processes belonging to a specific user need to access a given
-encrypted directory and no session keyring has been installed, then
-that directory's key should be placed in that user's user session
-keyring or user keyring.  Otherwise, a session keyring should be
-installed if needed, and the key should be linked into that session
-keyring, or in a keyring linked into that session keyring.
-
-Note: introducing the complex visibility semantics of keyrings here
-was arguably a mistake --- especially given that by design, after any
-process successfully opens an encrypted file (thereby setting up the
-per-file key), possessing the keyring key is not actually required for
-any process to read/write the file until its in-memory inode is
-evicted.  In the future there probably should be a way to provide keys
-directly to the filesystem instead, which would make the intended
-semantics clearer.
+Removing keys
+-------------
+
+Two ioctls are available for removing a key that was added by
+`FS_IOC_ADD_ENCRYPTION_KEY`_:
+
+- `FS_IOC_REMOVE_ENCRYPTION_KEY`_
+- `FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS`_
+
+These two ioctls differ only in cases where v2 policy keys are added
+or removed by non-root users.
+
+These ioctls don't work on keys that were added via the legacy
+process-subscribed keyrings mechanism.
+
+Before using these ioctls, read the `Kernel memory compromise`_
+section for a discussion of the security goals and limitations of
+these ioctls.
+
+FS_IOC_REMOVE_ENCRYPTION_KEY
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The FS_IOC_REMOVE_ENCRYPTION_KEY ioctl removes a claim to a master
+encryption key from the filesystem, and possibly removes the key
+itself.  It can be executed on any file or directory on the target
+filesystem, but using the filesystem's root directory is recommended.
+It takes in a pointer to a :c:type:`struct fscrypt_remove_key_arg`,
+defined as follows::
+
+    struct fscrypt_remove_key_arg {
+            struct fscrypt_key_specifier key_spec;
+    #define FSCRYPT_KEY_REMOVAL_STATUS_FLAG_FILES_BUSY      0x00000001
+    #define FSCRYPT_KEY_REMOVAL_STATUS_FLAG_OTHER_USERS     0x00000002
+            __u32 removal_status_flags;     /* output */
+            __u32 __reserved[5];
+    };
+
+This structure must be zeroed, then initialized as follows:
+
+- The key to remove is specified by ``key_spec``:
+
+    - To remove a key used by v1 encryption policies, set
+      ``key_spec.type`` to FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR and fill
+      in ``key_spec.u.descriptor``.  To remove this type of key, the
+      calling process must have the CAP_SYS_ADMIN capability in the
+      initial user namespace.
+
+    - To remove a key used by v2 encryption policies, set
+      ``key_spec.type`` to FSCRYPT_KEY_SPEC_TYPE_IDENTIFIER and fill
+      in ``key_spec.u.identifier``.
+
+For v2 policy keys, this ioctl is usable by non-root users.  However,
+to make this possible, it actually just removes the current user's
+claim to the key, undoing a single call to FS_IOC_ADD_ENCRYPTION_KEY.
+Only after all claims are removed is the key really removed.
+
+For example, if FS_IOC_ADD_ENCRYPTION_KEY was called with uid 1000,
+then the key will be "claimed" by uid 1000, and
+FS_IOC_REMOVE_ENCRYPTION_KEY will only succeed as uid 1000.  Or, if
+both uids 1000 and 2000 added the key, then for each uid
+FS_IOC_REMOVE_ENCRYPTION_KEY will only remove their own claim.  Only
+once *both* are removed is the key really removed.  (Think of it like
+unlinking a file that may have hard links.)
+
+If FS_IOC_REMOVE_ENCRYPTION_KEY really removes the key, it will also
+try to "lock" all files that had been unlocked with the key.  It won't
+lock files that are still in-use, so this ioctl is expected to be used
+in cooperation with userspace ensuring that none of the files are
+still open.  However, if necessary, this ioctl can be executed again
+later to retry locking any remaining files.
+
+FS_IOC_REMOVE_ENCRYPTION_KEY returns 0 if either the key was removed
+(but may still have files remaining to be locked), the user's claim to
+the key was removed, or the key was already removed but had files
+remaining to be the locked so the ioctl retried locking them.  In any
+of these cases, ``removal_status_flags`` is filled in with the
+following informational status flags:
+
+- ``FSCRYPT_KEY_REMOVAL_STATUS_FLAG_FILES_BUSY``: set if some file(s)
+  are still in-use.  Not guaranteed to be set in the case where only
+  the user's claim to the key was removed.
+- ``FSCRYPT_KEY_REMOVAL_STATUS_FLAG_OTHER_USERS``: set if only the
+  user's claim to the key was removed, not the key itself
+
+FS_IOC_REMOVE_ENCRYPTION_KEY can fail with the following errors:
+
+- ``EACCES``: The FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR key specifier type
+  was specified, but the caller does not have the CAP_SYS_ADMIN
+  capability in the initial user namespace
+- ``EINVAL``: invalid key specifier type, or reserved bits were set
+- ``ENOKEY``: the key object was not found at all, i.e. it was never
+  added in the first place or was already fully removed including all
+  files locked; or, the user does not have a claim to the key (but
+  someone else does).
+- ``ENOTTY``: this type of filesystem does not implement encryption
+- ``EOPNOTSUPP``: the kernel was not configured with encryption
+  support for this filesystem, or the filesystem superblock has not
+  had encryption enabled on it
+
+FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS is exactly the same as
+`FS_IOC_REMOVE_ENCRYPTION_KEY`_, except that for v2 policy keys, the
+ALL_USERS version of the ioctl will remove all users' claims to the
+key, not just the current user's.  I.e., the key itself will always be
+removed, no matter how many users have added it.  This difference is
+only meaningful if non-root users are adding and removing keys.
+
+Because of this, FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS also requires
+"root", namely the CAP_SYS_ADMIN capability in the initial user
+namespace.  Otherwise it will fail with EACCES.
+
+Getting key status
+------------------
+
+FS_IOC_GET_ENCRYPTION_KEY_STATUS
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The FS_IOC_GET_ENCRYPTION_KEY_STATUS ioctl retrieves the status of a
+master encryption key.  It can be executed on any file or directory on
+the target filesystem, but using the filesystem's root directory is
+recommended.  It takes in a pointer to a :c:type:`struct
+fscrypt_get_key_status_arg`, defined as follows::
+
+    struct fscrypt_get_key_status_arg {
+            /* input */
+            struct fscrypt_key_specifier key_spec;
+            __u32 __reserved[6];
+
+            /* output */
+    #define FSCRYPT_KEY_STATUS_ABSENT               1
+    #define FSCRYPT_KEY_STATUS_PRESENT              2
+    #define FSCRYPT_KEY_STATUS_INCOMPLETELY_REMOVED 3
+            __u32 status;
+    #define FSCRYPT_KEY_STATUS_FLAG_ADDED_BY_SELF   0x00000001
+            __u32 status_flags;
+            __u32 user_count;
+            __u32 __out_reserved[13];
+    };
+
+The caller must zero all input fields, then fill in ``key_spec``:
+
+    - To get the status of a key for v1 encryption policies, set
+      ``key_spec.type`` to FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR and fill
+      in ``key_spec.u.descriptor``.
+
+    - To get the status of a key for v2 encryption policies, set
+      ``key_spec.type`` to FSCRYPT_KEY_SPEC_TYPE_IDENTIFIER and fill
+      in ``key_spec.u.identifier``.
+
+On success, 0 is returned and the kernel fills in the output fields:
+
+- ``status`` indicates whether the key is absent, present, or
+  incompletely removed.  Incompletely removed means that the master
+  secret has been removed, but some files are still in use; i.e.,
+  `FS_IOC_REMOVE_ENCRYPTION_KEY`_ returned 0 but set the informational
+  status flag FSCRYPT_KEY_REMOVAL_STATUS_FLAG_FILES_BUSY.
+
+- ``status_flags`` can contain the following flags:
+
+    - ``FSCRYPT_KEY_STATUS_FLAG_ADDED_BY_SELF`` indicates that the key
+      has added by the current user.  This is only set for keys
+      identified by ``identifier`` rather than by ``descriptor``.
+
+- ``user_count`` specifies the number of users who have added the key.
+  This is only set for keys identified by ``identifier`` rather than
+  by ``descriptor``.
+
+FS_IOC_GET_ENCRYPTION_KEY_STATUS can fail with the following errors:
+
+- ``EINVAL``: invalid key specifier type, or reserved bits were set
+- ``ENOTTY``: this type of filesystem does not implement encryption
+- ``EOPNOTSUPP``: the kernel was not configured with encryption
+  support for this filesystem, or the filesystem superblock has not
+  had encryption enabled on it
+
+Among other use cases, FS_IOC_GET_ENCRYPTION_KEY_STATUS can be useful
+for determining whether the key for a given encrypted directory needs
+to be added before prompting the user for the passphrase needed to
+derive the key.
+
+FS_IOC_GET_ENCRYPTION_KEY_STATUS can only get the status of keys in
+the filesystem-level keyring, i.e. the keyring managed by
+`FS_IOC_ADD_ENCRYPTION_KEY`_ and `FS_IOC_REMOVE_ENCRYPTION_KEY`_.  It
+cannot get the status of a key that has only been added for use by v1
+encryption policies using the legacy mechanism involving
+process-subscribed keyrings.
 
 Access semantics
 ================
@@ -500,7 +986,7 @@ Without the key
 
 Some filesystem operations may be performed on encrypted regular
 files, directories, and symlinks even before their encryption key has
-been provided:
+been added, or after their encryption key has been removed:
 
 - File metadata may be read, e.g. using stat().
 
@@ -565,20 +1051,20 @@ Encryption context
 ------------------
 
 An encryption policy is represented on-disk by a :c:type:`struct
-fscrypt_context`.  It is up to individual filesystems to decide where
-to store it, but normally it would be stored in a hidden extended
-attribute.  It should *not* be exposed by the xattr-related system
-calls such as getxattr() and setxattr() because of the special
-semantics of the encryption xattr.  (In particular, there would be
-much confusion if an encryption policy were to be added to or removed
-from anything other than an empty directory.)  The struct is defined
-as follows::
+fscrypt_context_v1` or a :c:type:`struct fscrypt_context_v2`.  It is
+up to individual filesystems to decide where to store it, but normally
+it would be stored in a hidden extended attribute.  It should *not* be
+exposed by the xattr-related system calls such as getxattr() and
+setxattr() because of the special semantics of the encryption xattr.
+(In particular, there would be much confusion if an encryption policy
+were to be added to or removed from anything other than an empty
+directory.)  These structs are defined as follows::
 
-    #define FSCRYPT_KEY_DESCRIPTOR_SIZE  8
     #define FS_KEY_DERIVATION_NONCE_SIZE 16
 
-    struct fscrypt_context {
-            u8 format;
+    #define FSCRYPT_KEY_DESCRIPTOR_SIZE  8
+    struct fscrypt_context_v1 {
+            u8 version;
             u8 contents_encryption_mode;
             u8 filenames_encryption_mode;
             u8 flags;
@@ -586,12 +1072,23 @@ as follows::
             u8 nonce[FS_KEY_DERIVATION_NONCE_SIZE];
     };
 
-Note that :c:type:`struct fscrypt_context` contains the same
-information as :c:type:`struct fscrypt_policy` (see `Setting an
-encryption policy`_), except that :c:type:`struct fscrypt_context`
-also contains a nonce.  The nonce is randomly generated by the kernel
-and is used to derive the inode's encryption key as described in
-`Per-file keys`_.
+    #define FSCRYPT_KEY_IDENTIFIER_SIZE  16
+    struct fscrypt_context_v2 {
+            u8 version;
+            u8 contents_encryption_mode;
+            u8 filenames_encryption_mode;
+            u8 flags;
+            u8 __reserved[4];
+            u8 master_key_identifier[FSCRYPT_KEY_IDENTIFIER_SIZE];
+            u8 nonce[FS_KEY_DERIVATION_NONCE_SIZE];
+    };
+
+The context structs contain the same information as the corresponding
+policy structs (see `Setting an encryption policy`_), except that the
+context structs also contain a nonce.  The nonce is randomly generated
+by the kernel and is used as KDF input or as a tweak to cause
+different files to be encrypted differently; see `Per-file keys`_ and
+`DIRECT_KEY and per-mode keys`_.
 
 Data path changes
 -----------------
-- 
2.22.0.770.g0f2c4a37fd-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
