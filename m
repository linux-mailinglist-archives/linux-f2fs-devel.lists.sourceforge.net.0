Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA11102F42
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Nov 2019 23:26:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iXBxE-00021F-GL; Tue, 19 Nov 2019 22:26:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iXBxC-000216-Mm
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Nov 2019 22:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=41VYY71N6wXPDIPxiRmw6J9blsGeRHl1XGNm8epkzr4=; b=i7tOq6R/7GX5wJ1BCIyvsMLfQH
 Jc3xfaI2uGKnBrn6tJHcmoiKgK/oKlEtzeC9dXCHYk1Sq9Ic4rqoo8QAcEGloxPsqiiKBnSJB8L0y
 E9YCJ63l1oyHjJyV5c2Vp+3MdOEaOFDYRshT21UzOT2pseosGBvwWtnGFurK2egukKNE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=41VYY71N6wXPDIPxiRmw6J9blsGeRHl1XGNm8epkzr4=; b=I
 7zfuixIVC5dymMdqjNLz/pktHIsptesGS21uW/uOx5tdmw/OzUjHVuU0lAo0UTVpzqbkWqLoE3EKf
 nUW1O++j4bHMHgnRQQq4Si9TzuHxIi0cqhO+P+5AmX+0B2okDAqAxowkzES9vD9yb+HRJ/5gfvt2y
 kiaTnJs8p/O4DVTo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iXBxB-006VmX-4Z
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Nov 2019 22:26:34 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9A6D122449;
 Tue, 19 Nov 2019 22:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574202385;
 bh=gRhDTw9jnqMiR17fT2dfbIHxRXud32TXY+LIQolMGEo=;
 h=From:To:Cc:Subject:Date:From;
 b=hMSZfMJ25vAatHuSDEeNFR6S3ijDNO+ZWax7r60EzV1Z1y39czH+LVb6a+XOgt2gL
 QyMZ77SY77rcBoDq2G7/a1Yqnfpwuevgzz1wO46ByhTNU8CuNMEsApAAe84AAfpD/d
 hJfu+ewKgDdzEzkWWt5KbSXR0CTXkewQSwoDEm/k=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Tue, 19 Nov 2019 14:24:47 -0800
Message-Id: <20191119222447.226853-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
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
X-Headers-End: 1iXBxB-006VmX-4Z
Subject: [f2fs-dev] [PATCH v2] fscrypt: support passing a keyring key to
 FS_IOC_ADD_ENCRYPTION_KEY
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
Cc: Paul Lawrence <paullawrence@google.com>,
 "Theodore Y . Ts'o" <tytso@mit.edu>, Ondrej Mosnacek <omosnace@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 Ondrej Kozina <okozina@redhat.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Extend the FS_IOC_ADD_ENCRYPTION_KEY ioctl to allow the raw key to be
specified by a Linux keyring key, rather than specified directly.

This is useful because fscrypt keys belong to a particular filesystem
instance, so they are destroyed when that filesystem is unmounted.
Usually this is desired.  But in some cases, userspace may need to
unmount and re-mount the filesystem while keeping the keys, e.g. during
a system update.  This requires keeping the keys somewhere else too.

The keys could be kept in memory in a userspace daemon.  But depending
on the security architecture and assumptions, it can be preferable to
keep them only in kernel memory, where they are unreadable by userspace.

We also can't solve this by going back to the original fscrypt API
(where for each file, the master key was looked up in the process's
keyring hierarchy) because that caused lots of problems of its own.

Therefore, add the ability for FS_IOC_ADD_ENCRYPTION_KEY to accept a
Linux keyring key.  This solves the problem by allowing userspace to (if
needed) save the keys securely in a Linux keyring for re-provisioning,
while still using the new fscrypt key management ioctls.

This is analogous to how dm-crypt accepts a Linux keyring key, but the
key is then stored internally in the dm-crypt data structures rather
than being looked up again each time the dm-crypt device is accessed.

Use a custom key type "fscrypt-provisioning" rather than one of the
existing key types such as "logon".  This is strongly desired because it
enforces that these keys are only usable for a particular purpose: for
fscrypt as input to a particular KDF.  Otherwise, the keys could also be
passed to any kernel API that accepts a "logon" key with any service
prefix, e.g. dm-crypt, UBIFS, or (recently proposed) AF_ALG.  This would
risk leaking information about the raw key despite it ostensibly being
unreadable.  Of course, this mistake has already been made for multiple
kernel APIs; but since this is a new API, let's do it right.

This patch has been tested using an xfstest which I wrote to test it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---

This patch applies to fscrypt.git#master.

Changed v1 => v2:

- Renamed struct fscrypt_key_provisioning_payload to
  struct fscrypt_provisioning_key_payload.

- Added some blank lines for readability.

- Added note to commit message about xfstest.

 Documentation/filesystems/fscrypt.rst |  35 ++++++-
 fs/crypto/keyring.c                   | 132 ++++++++++++++++++++++++--
 include/uapi/linux/fscrypt.h          |  13 ++-
 3 files changed, 168 insertions(+), 12 deletions(-)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index 471a511c75088d..4ed9d58ea0ab5b 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -638,7 +638,8 @@ follows::
     struct fscrypt_add_key_arg {
             struct fscrypt_key_specifier key_spec;
             __u32 raw_size;
-            __u32 __reserved[9];
+            __u32 key_id;
+            __u32 __reserved[8];
             __u8 raw[];
     };
 
@@ -655,6 +656,12 @@ follows::
             } u;
     };
 
+    struct fscrypt_provisioning_key_payload {
+            __u32 type;
+            __u32 __reserved;
+            __u8 raw[];
+    };
+
 :c:type:`struct fscrypt_add_key_arg` must be zeroed, then initialized
 as follows:
 
@@ -677,9 +684,26 @@ as follows:
   ``Documentation/security/keys/core.rst``).
 
 - ``raw_size`` must be the size of the ``raw`` key provided, in bytes.
+  Alternatively, if ``key_id`` is nonzero, this field must be 0, since
+  in that case the size is implied by the specified Linux keyring key.
+
+- ``key_id`` is 0 if the raw key is given directly in the ``raw``
+  field.  Otherwise ``key_id`` is the ID of a Linux keyring key of
+  type "fscrypt-provisioning" whose payload is a :c:type:`struct
+  fscrypt_provisioning_key_payload` whose ``raw`` field contains the
+  raw key and whose ``type`` field matches ``key_spec.type``.  Since
+  ``raw`` is variable-length, the total size of this key's payload
+  must be ``sizeof(struct fscrypt_provisioning_key_payload)`` plus the
+  raw key size.  The process must have Search permission on this key.
+
+  Most users should leave this 0 and specify the raw key directly.
+  The support for specifying a Linux keyring key is intended mainly to
+  allow re-adding keys after a filesystem is unmounted and re-mounted,
+  without having to store the raw keys in userspace memory.
 
 - ``raw`` is a variable-length field which must contain the actual
-  key, ``raw_size`` bytes long.
+  key, ``raw_size`` bytes long.  Alternatively, if ``key_id`` is
+  nonzero, then this field is unused.
 
 For v2 policy keys, the kernel keeps track of which user (identified
 by effective user ID) added the key, and only allows the key to be
@@ -701,11 +725,16 @@ FS_IOC_ADD_ENCRYPTION_KEY can fail with the following errors:
 
 - ``EACCES``: FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR was specified, but the
   caller does not have the CAP_SYS_ADMIN capability in the initial
-  user namespace
+  user namespace; or the raw key was specified by Linux key ID but the
+  process lacks Search permission on the key.
 - ``EDQUOT``: the key quota for this user would be exceeded by adding
   the key
 - ``EINVAL``: invalid key size or key specifier type, or reserved bits
   were set
+- ``EKEYREJECTED``: the raw key was specified by Linux key ID, but the
+  key has the wrong type
+- ``ENOKEY``: the raw key was specified by Linux key ID, but no key
+  exists with that ID
 - ``ENOTTY``: this type of filesystem does not implement encryption
 - ``EOPNOTSUPP``: the kernel was not configured with encryption
   support for this filesystem, or the filesystem superblock has not
diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index 040df1f5e1c8b1..7d67c8e862c66e 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -465,6 +465,109 @@ static int add_master_key(struct super_block *sb,
 	return err;
 }
 
+static int fscrypt_provisioning_key_preparse(struct key_preparsed_payload *prep)
+{
+	const struct fscrypt_provisioning_key_payload *payload = prep->data;
+
+	if (prep->datalen < sizeof(*payload) + FSCRYPT_MIN_KEY_SIZE ||
+	    prep->datalen > sizeof(*payload) + FSCRYPT_MAX_KEY_SIZE)
+		return -EINVAL;
+
+	if (payload->type != FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR &&
+	    payload->type != FSCRYPT_KEY_SPEC_TYPE_IDENTIFIER)
+		return -EINVAL;
+
+	if (payload->__reserved)
+		return -EINVAL;
+
+	prep->payload.data[0] = kmemdup(payload, prep->datalen, GFP_KERNEL);
+	if (!prep->payload.data[0])
+		return -ENOMEM;
+
+	prep->quotalen = prep->datalen;
+	return 0;
+}
+
+static void fscrypt_provisioning_key_free_preparse(
+					struct key_preparsed_payload *prep)
+{
+	kzfree(prep->payload.data[0]);
+}
+
+static void fscrypt_provisioning_key_describe(const struct key *key,
+					      struct seq_file *m)
+{
+	seq_puts(m, key->description);
+	if (key_is_positive(key)) {
+		const struct fscrypt_provisioning_key_payload *payload =
+			key->payload.data[0];
+
+		seq_printf(m, ": %u [%u]", key->datalen, payload->type);
+	}
+}
+
+static void fscrypt_provisioning_key_destroy(struct key *key)
+{
+	kzfree(key->payload.data[0]);
+}
+
+static struct key_type key_type_fscrypt_provisioning = {
+	.name			= "fscrypt-provisioning",
+	.preparse		= fscrypt_provisioning_key_preparse,
+	.free_preparse		= fscrypt_provisioning_key_free_preparse,
+	.instantiate		= generic_key_instantiate,
+	.describe		= fscrypt_provisioning_key_describe,
+	.destroy		= fscrypt_provisioning_key_destroy,
+};
+
+/*
+ * Retrieve the raw key from the Linux keyring key specified by 'key_id', and
+ * store it into 'secret'.
+ *
+ * The key must be of type "fscrypt-provisioning" and must have the field
+ * fscrypt_provisioning_key_payload::type set to 'type', indicating that it's
+ * only usable with fscrypt with the particular KDF version identified by
+ * 'type'.  We don't use the "logon" key type because there's no way to
+ * completely restrict the use of such keys; they can be used by any kernel API
+ * that accepts "logon" keys and doesn't require a specific service prefix.
+ *
+ * The ability to specify the key via Linux keyring key is intended for cases
+ * where userspace needs to re-add keys after the filesystem is unmounted and
+ * re-mounted.  Most users should just provide the raw key directly instead.
+ */
+static int get_keyring_key(u32 key_id, u32 type,
+			   struct fscrypt_master_key_secret *secret)
+{
+	key_ref_t ref;
+	struct key *key;
+	const struct fscrypt_provisioning_key_payload *payload;
+	int err;
+
+	ref = lookup_user_key(key_id, 0, KEY_NEED_SEARCH);
+	if (IS_ERR(ref))
+		return PTR_ERR(ref);
+	key = key_ref_to_ptr(ref);
+
+	if (key->type != &key_type_fscrypt_provisioning)
+		goto bad_key;
+	payload = key->payload.data[0];
+
+	/* Don't allow fscrypt v1 keys to be used as v2 keys and vice versa. */
+	if (payload->type != type)
+		goto bad_key;
+
+	secret->size = key->datalen - sizeof(*payload);
+	memcpy(secret->raw, payload->raw, secret->size);
+	err = 0;
+	goto out_put;
+
+bad_key:
+	err = -EKEYREJECTED;
+out_put:
+	key_ref_put(ref);
+	return err;
+}
+
 /*
  * Add a master encryption key to the filesystem, causing all files which were
  * encrypted with it to appear "unlocked" (decrypted) when accessed.
@@ -503,18 +606,25 @@ int fscrypt_ioctl_add_key(struct file *filp, void __user *_uarg)
 	if (!valid_key_spec(&arg.key_spec))
 		return -EINVAL;
 
-	if (arg.raw_size < FSCRYPT_MIN_KEY_SIZE ||
-	    arg.raw_size > FSCRYPT_MAX_KEY_SIZE)
-		return -EINVAL;
-
 	if (memchr_inv(arg.__reserved, 0, sizeof(arg.__reserved)))
 		return -EINVAL;
 
 	memset(&secret, 0, sizeof(secret));
-	secret.size = arg.raw_size;
-	err = -EFAULT;
-	if (copy_from_user(secret.raw, uarg->raw, secret.size))
-		goto out_wipe_secret;
+	if (arg.key_id) {
+		if (arg.raw_size != 0)
+			return -EINVAL;
+		err = get_keyring_key(arg.key_id, arg.key_spec.type, &secret);
+		if (err)
+			goto out_wipe_secret;
+	} else {
+		if (arg.raw_size < FSCRYPT_MIN_KEY_SIZE ||
+		    arg.raw_size > FSCRYPT_MAX_KEY_SIZE)
+			return -EINVAL;
+		secret.size = arg.raw_size;
+		err = -EFAULT;
+		if (copy_from_user(secret.raw, uarg->raw, secret.size))
+			goto out_wipe_secret;
+	}
 
 	switch (arg.key_spec.type) {
 	case FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR:
@@ -978,8 +1088,14 @@ int __init fscrypt_init_keyring(void)
 	if (err)
 		goto err_unregister_fscrypt;
 
+	err = register_key_type(&key_type_fscrypt_provisioning);
+	if (err)
+		goto err_unregister_fscrypt_user;
+
 	return 0;
 
+err_unregister_fscrypt_user:
+	unregister_key_type(&key_type_fscrypt_user);
 err_unregister_fscrypt:
 	unregister_key_type(&key_type_fscrypt);
 	return err;
diff --git a/include/uapi/linux/fscrypt.h b/include/uapi/linux/fscrypt.h
index 1beb174ad95056..d5112a24e8b9f5 100644
--- a/include/uapi/linux/fscrypt.h
+++ b/include/uapi/linux/fscrypt.h
@@ -109,11 +109,22 @@ struct fscrypt_key_specifier {
 	} u;
 };
 
+/*
+ * Payload of Linux keyring key of type "fscrypt-provisioning", referenced by
+ * fscrypt_add_key_arg::key_id as an alternative to fscrypt_add_key_arg::raw.
+ */
+struct fscrypt_provisioning_key_payload {
+	__u32 type;
+	__u32 __reserved;
+	__u8 raw[];
+};
+
 /* Struct passed to FS_IOC_ADD_ENCRYPTION_KEY */
 struct fscrypt_add_key_arg {
 	struct fscrypt_key_specifier key_spec;
 	__u32 raw_size;
-	__u32 __reserved[9];
+	__u32 key_id;
+	__u32 __reserved[8];
 	__u8 raw[];
 };
 

base-commit: 0eee17e3322625b87ce5fa631bda16562a8dc494
-- 
2.24.0.432.g9d3f5f5b63-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
