Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F05C821E7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Aug 2019 18:28:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hufqr-0002J8-0a; Mon, 05 Aug 2019 16:28:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hufqo-0002IB-4f
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 16:28:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WMZjFvWN4M3w55Q2c1EQhc9x22hLbleNulD66Dppl7k=; b=giccM6bSBbjiara09IWwGIJNZU
 eVJq37sQJ/XHUrliVvu2blHCeWsHm4lof53aD2m9H8TFs5W0rpoiYKKRMIt5qnFPQfByIR2bOWMeC
 Al1KwxhLTCDB/CZq+dPahL7x5LDRnfyzqsKif7jQSSHx9rTOsgrIUJmlC2Ba0AxITX8Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WMZjFvWN4M3w55Q2c1EQhc9x22hLbleNulD66Dppl7k=; b=GprpUcQVO4+cR8Zc1RR48YWU0y
 +thvo1P8E4o6rGdBDj2frShef4X3CIIHGuxP5fd/Asb/0FicCb/3b5NOxvDbE2CUuV+ffjEaQq/Yn
 S9Ic+V3MMeg7Qj4WLoFVjJPlcAC0+EVFuCS3RX04it/gwogmHEOyI70XmJBM9vMzW75o=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hufql-00BqG6-Sb
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 16:28:46 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 71BEC21871;
 Mon,  5 Aug 2019 16:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565022514;
 bh=5tq212H09/beu3ZmJb2d6tVxNKTCnLAppoBl2mPFLyY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bg347hDrp02Qrk9rcLoFSvSkdqpPjCK8POkjWFkwYrYfJsxda4SOnUYlQMslHN2Er
 epAzDyuM50uqSeSRYc0W8VeuE2PvEv1l98lWndFmKzQHYxyNhm4eak/JAC2SW3fB6L
 y2oMaBFs6L0I/Ci4DKPr8or4i2vfOhIcgeWGqASE=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon,  5 Aug 2019 09:25:10 -0700
Message-Id: <20190805162521.90882-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
In-Reply-To: <20190805162521.90882-1-ebiggers@kernel.org>
References: <20190805162521.90882-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
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
 0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hufql-00BqG6-Sb
Subject: [f2fs-dev] [PATCH v8 09/20] fscrypt: add FS_IOC_ADD_ENCRYPTION_KEY
 ioctl
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

Add a new fscrypt ioctl, FS_IOC_ADD_ENCRYPTION_KEY.  This ioctl adds an
encryption key to the filesystem's fscrypt keyring ->s_master_keys,
making any files encrypted with that key appear "unlocked".

Why we need this
~~~~~~~~~~~~~~~~

The main problem is that the "locked/unlocked" (ciphertext/plaintext)
status of encrypted files is global, but the fscrypt keys are not.
fscrypt only looks for keys in the keyring(s) the process accessing the
filesystem is subscribed to: the thread keyring, process keyring, and
session keyring, where the session keyring may contain the user keyring.

Therefore, userspace has to put fscrypt keys in the keyrings for
individual users or sessions.  But this means that when a process with a
different keyring tries to access encrypted files, whether they appear
"unlocked" or not is nondeterministic.  This is because it depends on
whether the files are currently present in the inode cache.

Fixing this by consistently providing each process its own view of the
filesystem depending on whether it has the key or not isn't feasible due
to how the VFS caches work.  Furthermore, while sometimes users expect
this behavior, it is misguided for two reasons.  First, it would be an
OS-level access control mechanism largely redundant with existing access
control mechanisms such as UNIX file permissions, ACLs, LSMs, etc.
Encryption is actually for protecting the data at rest.

Second, almost all users of fscrypt actually do need the keys to be
global.  The largest users of fscrypt, Android and Chromium OS, achieve
this by having PID 1 create a "session keyring" that is inherited by
every process.  This works, but it isn't scalable because it prevents
session keyrings from being used for any other purpose.

On general-purpose Linux distros, the 'fscrypt' userspace tool [1] can't
similarly abuse the session keyring, so to make 'sudo' work on all
systems it has to link all the user keyrings into root's user keyring
[2].  This is ugly and raises security concerns.  Moreover it can't make
the keys available to system services, such as sshd trying to access the
user's '~/.ssh' directory (see [3], [4]) or NetworkManager trying to
read certificates from the user's home directory (see [5]); or to Docker
containers (see [6], [7]).

By having an API to add a key to the *filesystem* we'll be able to fix
the above bugs, remove userspace workarounds, and clearly express the
intended semantics: the locked/unlocked status of an encrypted directory
is global, and encryption is orthogonal to OS-level access control.

Why not use the add_key() syscall
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We use an ioctl for this API rather than the existing add_key() system
call because the ioctl gives us the flexibility needed to implement
fscrypt-specific semantics that will be introduced in later patches:

- Supporting key removal with the semantics such that the secret is
  removed immediately and any unused inodes using the key are evicted;
  also, the eviction of any in-use inodes can be retried.

- Calculating a key-dependent cryptographic identifier and returning it
  to userspace.

- Allowing keys to be added and removed by non-root users, but only keys
  for v2 encryption policies; and to prevent denial-of-service attacks,
  users can only remove keys they themselves have added, and a key is
  only really removed after all users who added it have removed it.

Trying to shoehorn these semantics into the keyrings syscalls would be
very difficult, whereas the ioctls make things much easier.

However, to reuse code the implementation still uses the keyrings
service internally.  Thus we get lockless RCU-mode key lookups without
having to re-implement it, and the keys automatically show up in
/proc/keys for debugging purposes.

References:

    [1] https://github.com/google/fscrypt
    [2] https://goo.gl/55cCrI#heading=h.vf09isp98isb
    [3] https://github.com/google/fscrypt/issues/111#issuecomment-444347939
    [4] https://github.com/google/fscrypt/issues/116
    [5] https://bugs.launchpad.net/ubuntu/+source/fscrypt/+bug/1770715
    [6] https://github.com/google/fscrypt/issues/128
    [7] https://askubuntu.com/questions/1130306/cannot-run-docker-on-an-encrypted-filesystem

Reviewed-by: Theodore Ts'o <tytso@mit.edu>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/Makefile           |   1 +
 fs/crypto/crypto.c           |  10 +-
 fs/crypto/fscrypt_private.h  |  62 +++++++-
 fs/crypto/keyring.c          | 286 +++++++++++++++++++++++++++++++++++
 fs/crypto/keysetup.c         |  35 ++++-
 fs/super.c                   |   2 +
 include/linux/fs.h           |   1 +
 include/linux/fscrypt.h      |  14 ++
 include/uapi/linux/fscrypt.h |  49 ++++--
 9 files changed, 447 insertions(+), 13 deletions(-)
 create mode 100644 fs/crypto/keyring.c

diff --git a/fs/crypto/Makefile b/fs/crypto/Makefile
index ad14d4c29784a6..6b2485b4139335 100644
--- a/fs/crypto/Makefile
+++ b/fs/crypto/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_FS_ENCRYPTION)	+= fscrypto.o
 fscrypto-y := crypto.o \
 	      fname.o \
 	      hooks.o \
+	      keyring.o \
 	      keysetup.o \
 	      keysetup_v1.o \
 	      policy.o
diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 7502c1f0ede9e9..65ca077e8d585f 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -478,6 +478,8 @@ void fscrypt_msg(const struct inode *inode, const char *level,
  */
 static int __init fscrypt_init(void)
 {
+	int err = -ENOMEM;
+
 	/*
 	 * Use an unbound workqueue to allow bios to be decrypted in parallel
 	 * even when they happen to complete on the same CPU.  This sacrifices
@@ -500,13 +502,19 @@ static int __init fscrypt_init(void)
 	if (!fscrypt_info_cachep)
 		goto fail_free_ctx;
 
+	err = fscrypt_init_keyring();
+	if (err)
+		goto fail_free_info;
+
 	return 0;
 
+fail_free_info:
+	kmem_cache_destroy(fscrypt_info_cachep);
 fail_free_ctx:
 	kmem_cache_destroy(fscrypt_ctx_cachep);
 fail_free_queue:
 	destroy_workqueue(fscrypt_read_workqueue);
 fail:
-	return -ENOMEM;
+	return err;
 }
 late_initcall(fscrypt_init)
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 794dcba25ca826..0d9ebfd3bf3a54 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -14,9 +14,12 @@
 #include <linux/fscrypt.h>
 #include <crypto/hash.h>
 
-/* Encryption parameters */
+#define CONST_STRLEN(str)	(sizeof(str) - 1)
+
 #define FS_KEY_DERIVATION_NONCE_SIZE	16
 
+#define FSCRYPT_MIN_KEY_SIZE		16
+
 /**
  * Encryption context for inode
  *
@@ -156,6 +159,63 @@ extern bool fscrypt_fname_encrypted_size(const struct inode *inode,
 					 u32 orig_len, u32 max_len,
 					 u32 *encrypted_len_ret);
 
+/* keyring.c */
+
+/*
+ * fscrypt_master_key_secret - secret key material of an in-use master key
+ */
+struct fscrypt_master_key_secret {
+
+	/* Size of the raw key in bytes */
+	u32			size;
+
+	/* The raw key */
+	u8			raw[FSCRYPT_MAX_KEY_SIZE];
+
+} __randomize_layout;
+
+/*
+ * fscrypt_master_key - an in-use master key
+ *
+ * This represents a master encryption key which has been added to the
+ * filesystem and can be used to "unlock" the encrypted files which were
+ * encrypted with it.
+ */
+struct fscrypt_master_key {
+
+	/* The secret key material */
+	struct fscrypt_master_key_secret	mk_secret;
+
+	/* Arbitrary key descriptor which was assigned by userspace */
+	struct fscrypt_key_specifier		mk_spec;
+
+} __randomize_layout;
+
+static inline const char *master_key_spec_type(
+				const struct fscrypt_key_specifier *spec)
+{
+	switch (spec->type) {
+	case FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR:
+		return "descriptor";
+	}
+	return "[unknown]";
+}
+
+static inline int master_key_spec_len(const struct fscrypt_key_specifier *spec)
+{
+	switch (spec->type) {
+	case FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR:
+		return FSCRYPT_KEY_DESCRIPTOR_SIZE;
+	}
+	return 0;
+}
+
+extern struct key *
+fscrypt_find_master_key(struct super_block *sb,
+			const struct fscrypt_key_specifier *mk_spec);
+
+extern int __init fscrypt_init_keyring(void);
+
 /* keysetup.c */
 
 struct fscrypt_mode {
diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
new file mode 100644
index 00000000000000..bcd7d2836e1e4c
--- /dev/null
+++ b/fs/crypto/keyring.c
@@ -0,0 +1,286 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Filesystem-level keyring for fscrypt
+ *
+ * Copyright 2019 Google LLC
+ */
+
+/*
+ * This file implements management of fscrypt master keys in the
+ * filesystem-level keyring, including the ioctls:
+ *
+ * - FS_IOC_ADD_ENCRYPTION_KEY
+ *
+ * See the "User API" section of Documentation/filesystems/fscrypt.rst for more
+ * information about these ioctls.
+ */
+
+#include <linux/key-type.h>
+#include <linux/seq_file.h>
+
+#include "fscrypt_private.h"
+
+static void wipe_master_key_secret(struct fscrypt_master_key_secret *secret)
+{
+	memzero_explicit(secret, sizeof(*secret));
+}
+
+static void move_master_key_secret(struct fscrypt_master_key_secret *dst,
+				   struct fscrypt_master_key_secret *src)
+{
+	memcpy(dst, src, sizeof(*dst));
+	memzero_explicit(src, sizeof(*src));
+}
+
+static void free_master_key(struct fscrypt_master_key *mk)
+{
+	wipe_master_key_secret(&mk->mk_secret);
+	kzfree(mk);
+}
+
+static inline bool valid_key_spec(const struct fscrypt_key_specifier *spec)
+{
+	if (spec->__reserved)
+		return false;
+	return master_key_spec_len(spec) != 0;
+}
+
+static int fscrypt_key_instantiate(struct key *key,
+				   struct key_preparsed_payload *prep)
+{
+	key->payload.data[0] = (struct fscrypt_master_key *)prep->data;
+	return 0;
+}
+
+static void fscrypt_key_destroy(struct key *key)
+{
+	free_master_key(key->payload.data[0]);
+}
+
+static void fscrypt_key_describe(const struct key *key, struct seq_file *m)
+{
+	seq_puts(m, key->description);
+}
+
+/*
+ * Type of key in ->s_master_keys.  Each key of this type represents a master
+ * key which has been added to the filesystem.  Its payload is a
+ * 'struct fscrypt_master_key'.  The "." prefix in the key type name prevents
+ * users from adding keys of this type via the keyrings syscalls rather than via
+ * the intended method of FS_IOC_ADD_ENCRYPTION_KEY.
+ */
+static struct key_type key_type_fscrypt = {
+	.name			= "._fscrypt",
+	.instantiate		= fscrypt_key_instantiate,
+	.destroy		= fscrypt_key_destroy,
+	.describe		= fscrypt_key_describe,
+};
+
+/* Search ->s_master_keys */
+static struct key *search_fscrypt_keyring(struct key *keyring,
+					  struct key_type *type,
+					  const char *description)
+{
+	/*
+	 * We need to mark the keyring reference as "possessed" so that we
+	 * acquire permission to search it, via the KEY_POS_SEARCH permission.
+	 */
+	key_ref_t keyref = make_key_ref(keyring, true /* possessed */);
+
+	keyref = keyring_search(keyref, type, description, false);
+	if (IS_ERR(keyref)) {
+		if (PTR_ERR(keyref) == -EAGAIN || /* not found */
+		    PTR_ERR(keyref) == -EKEYREVOKED) /* recently invalidated */
+			keyref = ERR_PTR(-ENOKEY);
+		return ERR_CAST(keyref);
+	}
+	return key_ref_to_ptr(keyref);
+}
+
+#define FSCRYPT_FS_KEYRING_DESCRIPTION_SIZE	\
+	(CONST_STRLEN("fscrypt-") + FIELD_SIZEOF(struct super_block, s_id))
+
+#define FSCRYPT_MK_DESCRIPTION_SIZE	(2 * FSCRYPT_KEY_DESCRIPTOR_SIZE + 1)
+
+static void format_fs_keyring_description(
+			char description[FSCRYPT_FS_KEYRING_DESCRIPTION_SIZE],
+			const struct super_block *sb)
+{
+	sprintf(description, "fscrypt-%s", sb->s_id);
+}
+
+static void format_mk_description(
+			char description[FSCRYPT_MK_DESCRIPTION_SIZE],
+			const struct fscrypt_key_specifier *mk_spec)
+{
+	sprintf(description, "%*phN",
+		master_key_spec_len(mk_spec), (u8 *)&mk_spec->u);
+}
+
+/* Create ->s_master_keys if needed.  Synchronized by fscrypt_add_key_mutex. */
+static int allocate_filesystem_keyring(struct super_block *sb)
+{
+	char description[FSCRYPT_FS_KEYRING_DESCRIPTION_SIZE];
+	struct key *keyring;
+
+	if (sb->s_master_keys)
+		return 0;
+
+	format_fs_keyring_description(description, sb);
+	keyring = keyring_alloc(description, GLOBAL_ROOT_UID, GLOBAL_ROOT_GID,
+				current_cred(), KEY_POS_SEARCH |
+				  KEY_USR_SEARCH | KEY_USR_READ | KEY_USR_VIEW,
+				KEY_ALLOC_NOT_IN_QUOTA, NULL, NULL);
+	if (IS_ERR(keyring))
+		return PTR_ERR(keyring);
+
+	/* Pairs with READ_ONCE() in fscrypt_find_master_key() */
+	smp_store_release(&sb->s_master_keys, keyring);
+	return 0;
+}
+
+void fscrypt_sb_free(struct super_block *sb)
+{
+	key_put(sb->s_master_keys);
+	sb->s_master_keys = NULL;
+}
+
+/*
+ * Find the specified master key in ->s_master_keys.
+ * Returns ERR_PTR(-ENOKEY) if not found.
+ */
+struct key *fscrypt_find_master_key(struct super_block *sb,
+				    const struct fscrypt_key_specifier *mk_spec)
+{
+	struct key *keyring;
+	char description[FSCRYPT_MK_DESCRIPTION_SIZE];
+
+	/* pairs with smp_store_release() in allocate_filesystem_keyring() */
+	keyring = READ_ONCE(sb->s_master_keys);
+	if (keyring == NULL)
+		return ERR_PTR(-ENOKEY); /* No keyring yet, so no keys yet. */
+
+	format_mk_description(description, mk_spec);
+	return search_fscrypt_keyring(keyring, &key_type_fscrypt, description);
+}
+
+/*
+ * Allocate a new fscrypt_master_key which contains the given secret, set it as
+ * the payload of a new 'struct key' of type fscrypt, and link the 'struct key'
+ * into the given keyring.  Synchronized by fscrypt_add_key_mutex.
+ */
+static int add_new_master_key(struct fscrypt_master_key_secret *secret,
+			      const struct fscrypt_key_specifier *mk_spec,
+			      struct key *keyring)
+{
+	struct fscrypt_master_key *mk;
+	char description[FSCRYPT_MK_DESCRIPTION_SIZE];
+	struct key *key;
+	int err;
+
+	mk = kzalloc(sizeof(*mk), GFP_KERNEL);
+	if (!mk)
+		return -ENOMEM;
+
+	mk->mk_spec = *mk_spec;
+
+	move_master_key_secret(&mk->mk_secret, secret);
+
+	format_mk_description(description, mk_spec);
+	key = key_alloc(&key_type_fscrypt, description,
+			GLOBAL_ROOT_UID, GLOBAL_ROOT_GID, current_cred(),
+			KEY_POS_SEARCH | KEY_USR_SEARCH | KEY_USR_VIEW,
+			KEY_ALLOC_NOT_IN_QUOTA, NULL);
+	if (IS_ERR(key)) {
+		err = PTR_ERR(key);
+		goto out_free_mk;
+	}
+	err = key_instantiate_and_link(key, mk, sizeof(*mk), keyring, NULL);
+	key_put(key);
+	if (err)
+		goto out_free_mk;
+
+	return 0;
+
+out_free_mk:
+	free_master_key(mk);
+	return err;
+}
+
+static int add_master_key(struct super_block *sb,
+			  struct fscrypt_master_key_secret *secret,
+			  const struct fscrypt_key_specifier *mk_spec)
+{
+	static DEFINE_MUTEX(fscrypt_add_key_mutex);
+	struct key *key;
+	int err;
+
+	mutex_lock(&fscrypt_add_key_mutex); /* serialize find + link */
+	key = fscrypt_find_master_key(sb, mk_spec);
+	if (IS_ERR(key)) {
+		err = PTR_ERR(key);
+		if (err != -ENOKEY)
+			goto out_unlock;
+		/* Didn't find the key in ->s_master_keys.  Add it. */
+		err = allocate_filesystem_keyring(sb);
+		if (err)
+			goto out_unlock;
+		err = add_new_master_key(secret, mk_spec, sb->s_master_keys);
+	} else {
+		key_put(key);
+		err = 0;
+	}
+out_unlock:
+	mutex_unlock(&fscrypt_add_key_mutex);
+	return err;
+}
+
+/*
+ * Add a master encryption key to the filesystem, causing all files which were
+ * encrypted with it to appear "unlocked" (decrypted) when accessed.
+ *
+ * For more details, see the "FS_IOC_ADD_ENCRYPTION_KEY" section of
+ * Documentation/filesystems/fscrypt.rst.
+ */
+int fscrypt_ioctl_add_key(struct file *filp, void __user *_uarg)
+{
+	struct super_block *sb = file_inode(filp)->i_sb;
+	struct fscrypt_add_key_arg __user *uarg = _uarg;
+	struct fscrypt_add_key_arg arg;
+	struct fscrypt_master_key_secret secret;
+	int err;
+
+	if (copy_from_user(&arg, uarg, sizeof(arg)))
+		return -EFAULT;
+
+	if (!valid_key_spec(&arg.key_spec))
+		return -EINVAL;
+
+	if (arg.raw_size < FSCRYPT_MIN_KEY_SIZE ||
+	    arg.raw_size > FSCRYPT_MAX_KEY_SIZE)
+		return -EINVAL;
+
+	if (memchr_inv(arg.__reserved, 0, sizeof(arg.__reserved)))
+		return -EINVAL;
+
+	memset(&secret, 0, sizeof(secret));
+	secret.size = arg.raw_size;
+	err = -EFAULT;
+	if (copy_from_user(secret.raw, uarg->raw, secret.size))
+		goto out_wipe_secret;
+
+	err = -EACCES;
+	if (!capable(CAP_SYS_ADMIN))
+		goto out_wipe_secret;
+
+	err = add_master_key(sb, &secret, &arg.key_spec);
+out_wipe_secret:
+	wipe_master_key_secret(&secret);
+	return err;
+}
+EXPORT_SYMBOL_GPL(fscrypt_ioctl_add_key);
+
+int __init fscrypt_init_keyring(void)
+{
+	return register_key_type(&key_type_fscrypt);
+}
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index f4a47448e9efa1..1c6d18bcdc7b64 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -216,7 +216,40 @@ int fscrypt_set_derived_key(struct fscrypt_info *ci, const u8 *derived_key)
  */
 static int setup_file_encryption_key(struct fscrypt_info *ci)
 {
-	return fscrypt_setup_v1_file_key_via_subscribed_keyrings(ci);
+	struct key *key;
+	struct fscrypt_master_key *mk = NULL;
+	struct fscrypt_key_specifier mk_spec;
+	int err;
+
+	mk_spec.type = FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR;
+	memcpy(mk_spec.u.descriptor, ci->ci_master_key_descriptor,
+	       FSCRYPT_KEY_DESCRIPTOR_SIZE);
+
+	key = fscrypt_find_master_key(ci->ci_inode->i_sb, &mk_spec);
+	if (IS_ERR(key)) {
+		if (key != ERR_PTR(-ENOKEY))
+			return PTR_ERR(key);
+
+		return fscrypt_setup_v1_file_key_via_subscribed_keyrings(ci);
+	}
+
+	mk = key->payload.data[0];
+
+	if (mk->mk_secret.size < ci->ci_mode->keysize) {
+		fscrypt_warn(NULL,
+			     "key with %s %*phN is too short (got %u bytes, need %u+ bytes)",
+			     master_key_spec_type(&mk_spec),
+			     master_key_spec_len(&mk_spec), (u8 *)&mk_spec.u,
+			     mk->mk_secret.size, ci->ci_mode->keysize);
+		err = -ENOKEY;
+		goto out_release_key;
+	}
+
+	err = fscrypt_setup_v1_file_key(ci, mk->mk_secret.raw);
+
+out_release_key:
+	key_put(key);
+	return err;
 }
 
 static void put_crypt_info(struct fscrypt_info *ci)
diff --git a/fs/super.c b/fs/super.c
index 5960578a40760a..e486a442a61fb2 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -32,6 +32,7 @@
 #include <linux/backing-dev.h>
 #include <linux/rculist_bl.h>
 #include <linux/cleancache.h>
+#include <linux/fscrypt.h>
 #include <linux/fsnotify.h>
 #include <linux/lockdep.h>
 #include <linux/user_namespace.h>
@@ -290,6 +291,7 @@ static void __put_super(struct super_block *s)
 		WARN_ON(s->s_inode_lru.node);
 		WARN_ON(!list_empty(&s->s_mounts));
 		security_sb_free(s);
+		fscrypt_sb_free(s);
 		put_user_ns(s->s_user_ns);
 		kfree(s->s_subtype);
 		call_rcu(&s->rcu, destroy_super_rcu);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 997a530ff4e9d0..5dff77326cec60 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1427,6 +1427,7 @@ struct super_block {
 	const struct xattr_handler **s_xattr;
 #ifdef CONFIG_FS_ENCRYPTION
 	const struct fscrypt_operations	*s_cop;
+	struct key		*s_master_keys; /* master crypto keys in use */
 #endif
 	struct hlist_bl_head	s_roots;	/* alternate root dentries for NFS */
 	struct list_head	s_mounts;	/* list of mounts; _not_ for fs use */
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 583802cb2e35d0..46bf66cf76ef88 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -138,6 +138,10 @@ extern int fscrypt_ioctl_get_policy(struct file *, void __user *);
 extern int fscrypt_has_permitted_context(struct inode *, struct inode *);
 extern int fscrypt_inherit_context(struct inode *, struct inode *,
 					void *, bool);
+/* keyring.c */
+extern void fscrypt_sb_free(struct super_block *sb);
+extern int fscrypt_ioctl_add_key(struct file *filp, void __user *arg);
+
 /* keysetup.c */
 extern int fscrypt_get_encryption_info(struct inode *);
 extern void fscrypt_put_encryption_info(struct inode *);
@@ -367,6 +371,16 @@ static inline int fscrypt_inherit_context(struct inode *parent,
 	return -EOPNOTSUPP;
 }
 
+/* keyring.c */
+static inline void fscrypt_sb_free(struct super_block *sb)
+{
+}
+
+static inline int fscrypt_ioctl_add_key(struct file *filp, void __user *arg)
+{
+	return -EOPNOTSUPP;
+}
+
 /* keysetup.c */
 static inline int fscrypt_get_encryption_info(struct inode *inode)
 {
diff --git a/include/uapi/linux/fscrypt.h b/include/uapi/linux/fscrypt.h
index 29a945d165def3..6aeca3cb0a2dec 100644
--- a/include/uapi/linux/fscrypt.h
+++ b/include/uapi/linux/fscrypt.h
@@ -36,22 +36,51 @@ struct fscrypt_policy {
 	__u8 master_key_descriptor[FSCRYPT_KEY_DESCRIPTOR_SIZE];
 };
 
-#define FS_IOC_SET_ENCRYPTION_POLICY	_IOR('f', 19, struct fscrypt_policy)
-#define FS_IOC_GET_ENCRYPTION_PWSALT	_IOW('f', 20, __u8[16])
-#define FS_IOC_GET_ENCRYPTION_POLICY	_IOW('f', 21, struct fscrypt_policy)
-
-/* Parameters for passing an encryption key into the kernel keyring */
+/*
+ * Process-subscribed "logon" key description prefix and payload format.
+ * Deprecated; prefer FS_IOC_ADD_ENCRYPTION_KEY instead.
+ */
 #define FSCRYPT_KEY_DESC_PREFIX		"fscrypt:"
-#define FSCRYPT_KEY_DESC_PREFIX_SIZE		8
-
-/* Structure that userspace passes to the kernel keyring */
-#define FSCRYPT_MAX_KEY_SIZE			64
-
+#define FSCRYPT_KEY_DESC_PREFIX_SIZE	8
+#define FSCRYPT_MAX_KEY_SIZE		64
 struct fscrypt_key {
 	__u32 mode;
 	__u8 raw[FSCRYPT_MAX_KEY_SIZE];
 	__u32 size;
 };
+
+/*
+ * Keys are specified by an arbitrary 8-byte key "descriptor",
+ * matching fscrypt_policy::master_key_descriptor.
+ */
+#define FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR	1
+
+/*
+ * Specifies a key.  This doesn't contain the actual key itself; this is just
+ * the "name" of the key.
+ */
+struct fscrypt_key_specifier {
+	__u32 type;	/* one of FSCRYPT_KEY_SPEC_TYPE_* */
+	__u32 __reserved;
+	union {
+		__u8 __reserved[32]; /* reserve some extra space */
+		__u8 descriptor[FSCRYPT_KEY_DESCRIPTOR_SIZE];
+	} u;
+};
+
+/* Struct passed to FS_IOC_ADD_ENCRYPTION_KEY */
+struct fscrypt_add_key_arg {
+	struct fscrypt_key_specifier key_spec;
+	__u32 raw_size;
+	__u32 __reserved[9];
+	__u8 raw[];
+};
+
+#define FS_IOC_SET_ENCRYPTION_POLICY		_IOR('f', 19, struct fscrypt_policy)
+#define FS_IOC_GET_ENCRYPTION_PWSALT		_IOW('f', 20, __u8[16])
+#define FS_IOC_GET_ENCRYPTION_POLICY		_IOW('f', 21, struct fscrypt_policy)
+#define FS_IOC_ADD_ENCRYPTION_KEY		_IOWR('f', 23, struct fscrypt_add_key_arg)
+
 /**********************************************************************/
 
 /* old names; don't add anything new here! */
-- 
2.22.0.770.g0f2c4a37fd-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
