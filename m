Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9F67744B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Jul 2019 00:46:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hr8yc-0005dB-G6; Fri, 26 Jul 2019 22:46:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hr8ya-0005ca-R0
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Jul 2019 22:46:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0pdRiYp1lJEw1rHlVBByzXrv2vJzP9G3sJKHMJ+GksM=; b=fdeEonHbLWgDS9EWFd8oH6Y3+H
 8FE+kMr16ArAOcf8O6MGVDQ46W33xmD6GiQEd1YE/65yQn/2rCAg5SXr06KT5oqujmGcGlggGNiz9
 YV25lMlO4yS166oP0ShoUv//AbqmpPU8q2tJ8AcdglBIkzUIsg8aU29BVvtExarZTMFY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0pdRiYp1lJEw1rHlVBByzXrv2vJzP9G3sJKHMJ+GksM=; b=bP4BVChVq1U/HDIHCfL6Qf6Iwz
 z/S+yRTlbVooFSpmh3LnJG/KXzyrKV0Mpkq52icROLLJZL3gI0tUPcb0qp0m8F5qyAfmKA5+hZMJv
 hcLEPUssrBE7rdL2L6bnwG1Ht1yXdRNSbQiP0XWGh30Ubts9XDgMJml2R5UiSrm2E97U=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hr8yY-000WsH-SW
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Jul 2019 22:46:12 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CB32122CD5;
 Fri, 26 Jul 2019 22:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564181161;
 bh=uDA7l/4TxkW9Ii/HKERU+J5CYHQMBPyOWacoi8LIwtA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ltYKokI2SAyls4s6VLyg89JDdeLgtWFs/DBGAIed7KU8SJzdmwRjtmHegawviCbOA
 EtrAj/tk6qxp41U8+NW0MFQWH/kvGRYzPAl06paBzW/ACOGMtSWsj0QH7cgG9QfmCw
 C3xHPWSDDMh9qZ+K4RieVJ8nm8R8Jcf69dKUqPvM=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 26 Jul 2019 15:41:36 -0700
Message-Id: <20190726224141.14044-12-ebiggers@kernel.org>
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
X-Headers-End: 1hr8yY-000WsH-SW
Subject: [f2fs-dev] [PATCH v7 11/16] fscrypt: allow unprivileged users to
 add/remove keys for v2 policies
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

Allow the FS_IOC_ADD_ENCRYPTION_KEY and FS_IOC_REMOVE_ENCRYPTION_KEY
ioctls to be used by non-root users to add and remove encryption keys
from the filesystem-level crypto keyrings, subject to limitations.

Motivation: while privileged fscrypt key management is sufficient for
some users (e.g. Android and Chromium OS, where a privileged process
manages all keys), the old API by design also allows non-root users to
set up and use encrypted directories, and we don't want to regress on
that.  Especially, we don't want to force users to continue using the
old API, running into the visibility mismatch between files and keyrings
and being unable to "lock" encrypted directories.

Intuitively, the ioctls have to be privileged since they manipulate
filesystem-level state.  However, it's actually safe to make them
unprivileged if we very carefully enforce some specific limitations.

First, each key must be identified by a cryptographic hash so that a
user can't add the wrong key for another user's files.  For v2
encryption policies, we use the key_identifier for this.  v1 policies
don't have this, so managing keys for them remains privileged.

Second, each key a user adds is charged to their quota for the keyrings
service.  Thus, a user can't exhaust memory by adding a huge number of
keys.  By default each non-root user is allowed up to 200 keys; this can
be changed using the existing sysctl 'kernel.keys.maxkeys'.

Third, if multiple users add the same key, we keep track of those users
of the key (of which there remains a single copy), and won't really
remove the key, i.e. "lock" the encrypted files, until all those users
have removed it.  This prevents denial of service attacks that would be
possible under simpler schemes, such allowing the first user who added a
key to remove it -- since that could be a malicious user who has
compromised the key.  Of course, encryption keys should be kept secret,
but the idea is that using encryption should never be *less* secure than
not using encryption, even if your key was compromised.

We tolerate that a user will be unable to really remove a key, i.e.
unable to "lock" their encrypted files, if another user has added the
same key.  But in a sense, this is actually a good thing because it will
avoid providing a false notion of security where a key appears to have
been removed when actually it's still in memory, available to any
attacker who compromises the operating system kernel.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fscrypt_private.h  |  31 +++-
 fs/crypto/keyring.c          | 309 +++++++++++++++++++++++++++++++++--
 fs/crypto/keysetup.c         |  18 +-
 include/uapi/linux/fscrypt.h |   9 +-
 4 files changed, 339 insertions(+), 28 deletions(-)

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 1e596cfd085bf..2445b0fc4f01c 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -335,9 +335,16 @@ struct fscrypt_master_key {
 	 * FS_IOC_REMOVE_ENCRYPTION_KEY can be retried, or
 	 * FS_IOC_ADD_ENCRYPTION_KEY can add the secret again.
 	 *
-	 * Locking: protected by key->sem.
+	 * Locking: protected by key->sem (outer) and mk_secret_sem (inner).
+	 * The reason for two locks is that key->sem also protects modifying
+	 * mk_users, which ranks it above the semaphore for the keyring key
+	 * type, which is in turn above page faults (via keyring_read).  But
+	 * sometimes filesystems call fscrypt_get_encryption_info() from within
+	 * a transaction, which ranks it below page faults.  So we need a
+	 * separate lock which protects mk_secret but not also mk_users.
 	 */
 	struct fscrypt_master_key_secret	mk_secret;
+	struct rw_semaphore			mk_secret_sem;
 
 	/*
 	 * For v1 policy keys: an arbitrary key descriptor which was assigned by
@@ -347,6 +354,22 @@ struct fscrypt_master_key {
 	 */
 	struct fscrypt_key_specifier		mk_spec;
 
+	/*
+	 * Keyring which contains a key of type 'key_type_fscrypt_user' for each
+	 * user who has added this key.  Normally each key will be added by just
+	 * one user, but it's possible that multiple users share a key, and in
+	 * that case we need to keep track of those users so that one user can't
+	 * remove the key before the others want it removed too.
+	 *
+	 * This is NULL for v1 policy keys; those can only be added by root.
+	 *
+	 * Locking: in addition to this keyrings own semaphore, this is
+	 * protected by the master key's key->sem, so we can do atomic
+	 * search+insert.  It can also be searched without taking any locks, but
+	 * in that case the returned key may have already been removed.
+	 */
+	struct key		*mk_users;
+
 	/*
 	 * Length of ->mk_decrypted_inodes, plus one if mk_secret is present.
 	 * Once this goes to 0, the master key is removed from ->s_master_keys.
@@ -374,9 +397,9 @@ is_master_key_secret_present(const struct fscrypt_master_key_secret *secret)
 	/*
 	 * The READ_ONCE() is only necessary for fscrypt_drop_inode() and
 	 * fscrypt_key_describe().  These run in atomic context, so they can't
-	 * take key->sem and thus 'secret' can change concurrently which would
-	 * be a data race.  But they only need to know whether the secret *was*
-	 * present at the time of check, so READ_ONCE() suffices.
+	 * take ->mk_secret_sem and thus 'secret' can change concurrently which
+	 * would be a data race.  But they only need to know whether the secret
+	 * *was* present at the time of check, so READ_ONCE() suffices.
 	 */
 	return READ_ONCE(secret->size) != 0;
 }
diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index 56e085c2ed8c6..307533d4d7c51 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -42,6 +42,7 @@ static void free_master_key(struct fscrypt_master_key *mk)
 	for (i = 0; i < ARRAY_SIZE(mk->mk_mode_keys); i++)
 		crypto_free_skcipher(mk->mk_mode_keys[i]);
 
+	key_put(mk->mk_users);
 	kzfree(mk);
 }
 
@@ -101,7 +102,39 @@ static struct key_type key_type_fscrypt = {
 	.describe		= fscrypt_key_describe,
 };
 
-/* Search ->s_master_keys */
+static int fscrypt_user_key_instantiate(struct key *key,
+					struct key_preparsed_payload *prep)
+{
+	/*
+	 * We just charge FSCRYPT_MAX_KEY_SIZE bytes to the user's key quota for
+	 * each key, regardless of the exact key size.  The amount of memory
+	 * actually used is greater than the size of the raw key anyway.
+	 */
+	return key_payload_reserve(key, FSCRYPT_MAX_KEY_SIZE);
+}
+
+static void fscrypt_user_key_describe(const struct key *key, struct seq_file *m)
+{
+	seq_puts(m, key->description);
+}
+
+/*
+ * Type of key in ->mk_users.  Each key of this type represents a particular
+ * user who has added a particular master key.
+ *
+ * Note that the name of this key type really should be something like
+ * ".fscrypt-user" instead of simply ".fscrypt".  But the shorter name is chosen
+ * mainly for simplicity of presentation in /proc/keys when read by a non-root
+ * user.  And it is expected to be rare that a key is actually added by multiple
+ * users, since users should keep their encryption keys confidential.
+ */
+static struct key_type key_type_fscrypt_user = {
+	.name			= ".fscrypt",
+	.instantiate		= fscrypt_user_key_instantiate,
+	.describe		= fscrypt_user_key_describe,
+};
+
+/* Search ->s_master_keys or ->mk_users */
 static struct key *search_fscrypt_keyring(struct key *keyring,
 					  struct key_type *type,
 					  const char *description)
@@ -127,6 +160,13 @@ static struct key *search_fscrypt_keyring(struct key *keyring,
 
 #define FSCRYPT_MK_DESCRIPTION_SIZE	(2 * FSCRYPT_KEY_IDENTIFIER_SIZE + 1)
 
+#define FSCRYPT_MK_USERS_DESCRIPTION_SIZE	\
+	(CONST_STRLEN("fscrypt-") + 2 * FSCRYPT_KEY_IDENTIFIER_SIZE + \
+	 CONST_STRLEN("-users") + 1)
+
+#define FSCRYPT_MK_USER_DESCRIPTION_SIZE	\
+	(2 * FSCRYPT_KEY_IDENTIFIER_SIZE + CONST_STRLEN(".uid.") + 10 + 1)
+
 static void format_fs_keyring_description(
 			char description[FSCRYPT_FS_KEYRING_DESCRIPTION_SIZE],
 			const struct super_block *sb)
@@ -142,6 +182,23 @@ static void format_mk_description(
 		master_key_spec_len(mk_spec), (u8 *)&mk_spec->u);
 }
 
+static void format_mk_users_keyring_description(
+			char description[FSCRYPT_MK_USERS_DESCRIPTION_SIZE],
+			const u8 mk_identifier[FSCRYPT_KEY_IDENTIFIER_SIZE])
+{
+	sprintf(description, "fscrypt-%*phN-users",
+		FSCRYPT_KEY_IDENTIFIER_SIZE, mk_identifier);
+}
+
+static void format_mk_user_description(
+			char description[FSCRYPT_MK_USER_DESCRIPTION_SIZE],
+			const u8 mk_identifier[FSCRYPT_KEY_IDENTIFIER_SIZE])
+{
+
+	sprintf(description, "%*phN.uid.%u", FSCRYPT_KEY_IDENTIFIER_SIZE,
+		mk_identifier, __kuid_val(current_fsuid()));
+}
+
 /* Create ->s_master_keys if needed.  Synchronized by fscrypt_add_key_mutex. */
 static int allocate_filesystem_keyring(struct super_block *sb)
 {
@@ -189,6 +246,81 @@ struct key *fscrypt_find_master_key(struct super_block *sb,
 	return search_fscrypt_keyring(keyring, &key_type_fscrypt, description);
 }
 
+static int allocate_master_key_users_keyring(struct fscrypt_master_key *mk)
+{
+	char description[FSCRYPT_MK_USERS_DESCRIPTION_SIZE];
+	struct key *keyring;
+
+	format_mk_users_keyring_description(description,
+					    mk->mk_spec.u.identifier);
+	keyring = keyring_alloc(description, GLOBAL_ROOT_UID, GLOBAL_ROOT_GID,
+				current_cred(), KEY_POS_SEARCH |
+				  KEY_USR_SEARCH | KEY_USR_READ | KEY_USR_VIEW,
+				KEY_ALLOC_NOT_IN_QUOTA, NULL, NULL);
+	if (IS_ERR(keyring))
+		return PTR_ERR(keyring);
+
+	mk->mk_users = keyring;
+	return 0;
+}
+
+/*
+ * Find the current user's key in the master key's ->mk_users.
+ * Returns ERR_PTR(-ENOKEY) if not found.
+ */
+static struct key *find_master_key_user(struct fscrypt_master_key *mk)
+{
+	char description[FSCRYPT_MK_USER_DESCRIPTION_SIZE];
+
+	format_mk_user_description(description, mk->mk_spec.u.identifier);
+	return search_fscrypt_keyring(mk->mk_users, &key_type_fscrypt_user,
+				      description);
+}
+
+/*
+ * Give the current user a key in ->mk_users.  This charges the user's quota and
+ * marks the master key as added by the current user, so that it cannot be
+ * removed by another user with the key.  Either the master key's key->sem must
+ * be held for write, or the master key must be still undergoing initialization.
+ */
+static int add_master_key_user(struct fscrypt_master_key *mk)
+{
+	char description[FSCRYPT_MK_USER_DESCRIPTION_SIZE];
+	struct key *mk_user;
+	int err;
+
+	format_mk_user_description(description, mk->mk_spec.u.identifier);
+	mk_user = key_alloc(&key_type_fscrypt_user, description,
+			    current_fsuid(), current_gid(), current_cred(),
+			    KEY_POS_SEARCH | KEY_USR_VIEW, 0, NULL);
+	if (IS_ERR(mk_user))
+		return PTR_ERR(mk_user);
+
+	err = key_instantiate_and_link(mk_user, NULL, 0, mk->mk_users, NULL);
+	key_put(mk_user);
+	return err;
+}
+
+/*
+ * Remove the current user's key from ->mk_users, if present.
+ * The master key's key->sem must be held for write.
+ */
+static int remove_master_key_user(struct fscrypt_master_key *mk)
+{
+	struct key *mk_user;
+	int err;
+
+	mk_user = find_master_key_user(mk);
+	if (IS_ERR(mk_user)) {
+		if (mk_user != ERR_PTR(-ENOKEY))
+			return PTR_ERR(mk_user);
+		return 0;
+	}
+	err = key_unlink(mk->mk_users, mk_user);
+	key_put(mk_user);
+	return err;
+}
+
 /*
  * Allocate a new fscrypt_master_key which contains the given secret, set it as
  * the payload of a new 'struct key' of type fscrypt, and link the 'struct key'
@@ -210,11 +342,26 @@ static int add_new_master_key(struct fscrypt_master_key_secret *secret,
 	mk->mk_spec = *mk_spec;
 
 	move_master_key_secret(&mk->mk_secret, secret);
+	init_rwsem(&mk->mk_secret_sem);
 
 	refcount_set(&mk->mk_refcount, 1); /* secret is present */
 	INIT_LIST_HEAD(&mk->mk_decrypted_inodes);
 	spin_lock_init(&mk->mk_decrypted_inodes_lock);
 
+	if (mk_spec->type != FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR) {
+		err = allocate_master_key_users_keyring(mk);
+		if (err)
+			goto out_free_mk;
+		err = add_master_key_user(mk);
+		if (err)
+			goto out_free_mk;
+	}
+
+	/*
+	 * Note that we don't charge this key to anyone's quota, since when
+	 * ->mk_users is in use those keys are charged instead, and otherwise
+	 * (when ->mk_users isn't in use) only root can add these keys.
+	 */
 	format_mk_description(description, mk_spec);
 	key = key_alloc(&key_type_fscrypt, description,
 			GLOBAL_ROOT_UID, GLOBAL_ROOT_GID, current_cred(),
@@ -242,13 +389,45 @@ static int add_existing_master_key(struct fscrypt_master_key *mk,
 				   struct fscrypt_master_key_secret *secret,
 				   const struct fscrypt_key_specifier *mk_spec)
 {
-	if (is_master_key_secret_present(&mk->mk_secret))
-		return 0;
+	struct key *mk_user;
+	bool rekey;
+	int err;
 
-	if (!refcount_inc_not_zero(&mk->mk_refcount))
+	/*
+	 * If the current user is already in ->mk_users, then there's nothing to
+	 * do.  (Not applicable for v1 policy keys, which have NULL ->mk_users.)
+	 */
+	if (mk->mk_users) {
+		mk_user = find_master_key_user(mk);
+		if (mk_user != ERR_PTR(-ENOKEY)) {
+			if (IS_ERR(mk_user))
+				return PTR_ERR(mk_user);
+			key_put(mk_user);
+			return 0;
+		}
+	}
+
+	/* If we'll be re-adding ->mk_secret, try to take the reference. */
+	rekey = !is_master_key_secret_present(&mk->mk_secret);
+	if (rekey && !refcount_inc_not_zero(&mk->mk_refcount))
 		return KEY_DEAD;
 
-	move_master_key_secret(&mk->mk_secret, secret);
+	/* Add the current user to ->mk_users, if applicable. */
+	if (mk->mk_users) {
+		err = add_master_key_user(mk);
+		if (err) {
+			if (rekey && refcount_dec_and_test(&mk->mk_refcount))
+				return KEY_DEAD;
+			return err;
+		}
+	}
+
+	/* Re-add the secret if needed. */
+	if (rekey) {
+		down_write(&mk->mk_secret_sem);
+		move_master_key_secret(&mk->mk_secret, secret);
+		up_write(&mk->mk_secret_sem);
+	}
 	return 0;
 }
 
@@ -275,7 +454,7 @@ static int add_master_key(struct super_block *sb,
 	} else {
 		/*
 		 * Found the key in ->s_master_keys.  Re-add the secret if
-		 * needed.
+		 * needed, and add the user to ->mk_users if needed.
 		 */
 		down_write(&key->sem);
 		err = add_existing_master_key(key->payload.data[0], secret,
@@ -297,6 +476,23 @@ static int add_master_key(struct super_block *sb,
 /*
  * Add a master encryption key to the filesystem, causing all files which were
  * encrypted with it to appear "unlocked" (decrypted) when accessed.
+ *
+ * When adding a key for use by v1 encryption policies, this ioctl is
+ * privileged, and userspace must provide the 'key_descriptor'.
+ *
+ * When adding a key for use by v2+ encryption policies, this ioctl is
+ * unprivileged.  This is needed, in general, to allow non-root users to use
+ * encryption without encountering the visibility problems of process-subscribed
+ * keyrings and the inability to properly remove keys.  This works by having
+ * each key identified by its cryptographically secure hash --- the
+ * 'key_identifier'.  The cryptographic hash ensures that a malicious user
+ * cannot add the wrong key for a given identifier.  Furthermore, each added key
+ * is charged to the appropriate user's quota for the keyrings service, which
+ * prevents a malicious user from adding too many keys.  Finally, we forbid a
+ * user from removing a key while other users have added it too, which prevents
+ * a user who knows another user's key from causing a denial-of-service by
+ * removing it at an inopportune time.  (We tolerate that a user who knows a key
+ * can prevent other users from removing it.)
  */
 int fscrypt_ioctl_add_key(struct file *filp, void __user *_uarg)
 {
@@ -325,11 +521,16 @@ int fscrypt_ioctl_add_key(struct file *filp, void __user *_uarg)
 	if (copy_from_user(secret.raw, uarg->raw, secret.size))
 		goto out_wipe_secret;
 
-	err = -EACCES;
-	if (!capable(CAP_SYS_ADMIN))
-		goto out_wipe_secret;
-
-	if (arg.key_spec.type != FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR) {
+	if (arg.key_spec.type == FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR) {
+		/*
+		 * Only root can add keys that are identified by an arbitrary
+		 * descriptor rather than by a cryptographic hash --- since
+		 * otherwise a malicious user could add the wrong key.
+		 */
+		err = -EACCES;
+		if (!capable(CAP_SYS_ADMIN))
+			goto out_wipe_secret;
+	} else {
 		err = fscrypt_init_hkdf(&secret.hkdf, secret.raw, secret.size);
 		if (err)
 			goto out_wipe_secret;
@@ -527,10 +728,26 @@ int fscrypt_ioctl_remove_key(struct file *filp, const void __user *uarg)
 	if (!valid_key_spec(&arg.key_spec))
 		return -EINVAL;
 
+	if (arg.flags & ~FSCRYPT_REMOVE_KEY_FLAG_ALL_USERS)
+		return -EINVAL;
+
 	if (memchr_inv(arg.__reserved, 0, sizeof(arg.__reserved)))
 		return -EINVAL;
 
-	if (!capable(CAP_SYS_ADMIN))
+	/*
+	 * Only root can request that the key be removed no matter how many
+	 * users have added it.
+	 */
+	if ((arg.flags & FSCRYPT_REMOVE_KEY_FLAG_ALL_USERS) &&
+	    !capable(CAP_SYS_ADMIN))
+		return -EACCES;
+
+	/*
+	 * Only root can add and remove keys that are identified by an arbitrary
+	 * descriptor rather than by a cryptographic hash.
+	 */
+	if (arg.key_spec.type == FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR &&
+	    !capable(CAP_SYS_ADMIN))
 		return -EACCES;
 
 	/* Find the key being removed. */
@@ -541,11 +758,35 @@ int fscrypt_ioctl_remove_key(struct file *filp, const void __user *uarg)
 
 	down_write(&key->sem);
 
-	/* Wipe the secret. */
+	/* If relevant, remove current user's (or all users) usage of the key */
+	if (mk->mk_users && mk->mk_users->keys.nr_leaves_on_tree != 0) {
+		if (arg.flags & FSCRYPT_REMOVE_KEY_FLAG_ALL_USERS)
+			err = keyring_clear(mk->mk_users);
+		else
+			err = remove_master_key_user(mk);
+		if (err) {
+			up_write(&key->sem);
+			goto out_put_key;
+		}
+		if (mk->mk_users->keys.nr_leaves_on_tree != 0) {
+			/*
+			 * Other users have still added the key too.  We removed
+			 * the current user's usage of the key if there was one,
+			 * but we still can't remove the key itself.
+			 */
+			err = -EUSERS;
+			up_write(&key->sem);
+			goto out_put_key;
+		}
+	}
+
+	/* No usages remaining.  Go ahead and wipe the secret. */
 	dead = false;
 	if (is_master_key_secret_present(&mk->mk_secret)) {
+		down_write(&mk->mk_secret_sem);
 		wipe_master_key_secret(&mk->mk_secret);
 		dead = refcount_dec_and_test(&mk->mk_refcount);
+		up_write(&mk->mk_secret_sem);
 	}
 	up_write(&key->sem);
 	if (dead) {
@@ -559,6 +800,7 @@ int fscrypt_ioctl_remove_key(struct file *filp, const void __user *uarg)
 		/* Some inodes still reference this key; try to evict them. */
 		err = try_to_lock_encrypted_files(sb, mk);
 	}
+out_put_key:
 	key_put(key);
 	return err;
 }
@@ -574,6 +816,15 @@ EXPORT_SYMBOL_GPL(fscrypt_ioctl_remove_key);
  * of an encrypted directory without using a hack such as trying to open a
  * regular file in it (which can confuse the "incompletely removed" state with
  * absent or present).
+ *
+ * In addition, for v2 policy keys we allow applications to determine, via
+ * ->status_flags and ->user_count, whether the key has been added by the
+ * current user, by other users, or by both.  Most applications should not need
+ * this, since ordinarily only one user should know a given key.  However, if a
+ * secret key is shared by multiple users, applications may wish to add an
+ * already-present key to prevent other users from removing it.  This ioctl can
+ * be used to check whether that really is the case before the work is done to
+ * add the key --- which might e.g. require prompting the user for a passphrase.
  */
 int fscrypt_ioctl_get_key_status(struct file *filp, void __user *uarg)
 {
@@ -592,6 +843,8 @@ int fscrypt_ioctl_get_key_status(struct file *filp, void __user *uarg)
 	if (memchr_inv(arg.__reserved, 0, sizeof(arg.__reserved)))
 		return -EINVAL;
 
+	arg.status_flags = 0;
+	arg.user_count = 0;
 	memset(arg.__out_reserved, 0, sizeof(arg.__out_reserved));
 
 	key = fscrypt_find_master_key(sb, &arg.key_spec);
@@ -612,6 +865,20 @@ int fscrypt_ioctl_get_key_status(struct file *filp, void __user *uarg)
 	}
 
 	arg.status = FSCRYPT_KEY_STATUS_PRESENT;
+	if (mk->mk_users) {
+		struct key *mk_user;
+
+		arg.user_count = mk->mk_users->keys.nr_leaves_on_tree;
+		mk_user = find_master_key_user(mk);
+		if (!IS_ERR(mk_user)) {
+			arg.status_flags |=
+				FSCRYPT_KEY_STATUS_FLAG_ADDED_BY_SELF;
+			key_put(mk_user);
+		} else if (mk_user != ERR_PTR(-ENOKEY)) {
+			err = PTR_ERR(mk_user);
+			goto out_release_key;
+		}
+	}
 	err = 0;
 out_release_key:
 	up_read(&key->sem);
@@ -625,5 +892,19 @@ EXPORT_SYMBOL_GPL(fscrypt_ioctl_get_key_status);
 
 int __init fscrypt_init_keyring(void)
 {
-	return register_key_type(&key_type_fscrypt);
+	int err;
+
+	err = register_key_type(&key_type_fscrypt);
+	if (err)
+		return err;
+
+	err = register_key_type(&key_type_fscrypt_user);
+	if (err)
+		goto err_unregister_fscrypt;
+
+	return 0;
+
+err_unregister_fscrypt:
+	unregister_key_type(&key_type_fscrypt);
+	return err;
 }
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index 358883cde0c9e..ba69ac0c0e3c8 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -291,10 +291,10 @@ static int fscrypt_setup_v2_file_key(struct fscrypt_info *ci,
  *
  * If the master key is found in the filesystem-level keyring, then the
  * corresponding 'struct key' is returned in *master_key_ret with
- * ->sem read-locked.  This is needed to ensure that only one task links the
- * fscrypt_info into ->mk_decrypted_inodes (as multiple tasks may race to create
- * an fscrypt_info for the same inode), and to synchronize the master key being
- * removed with a new inode starting to use it.
+ * ->mk_secret_sem read-locked.  This is needed to ensure that only one task
+ * links the fscrypt_info into ->mk_decrypted_inodes (as multiple tasks may race
+ * to create an fscrypt_info for the same inode), and to synchronize the master
+ * key being removed with a new inode starting to use it.
  */
 static int setup_file_encryption_key(struct fscrypt_info *ci,
 				     struct key **master_key_ret)
@@ -332,7 +332,7 @@ static int setup_file_encryption_key(struct fscrypt_info *ci,
 	}
 
 	mk = key->payload.data[0];
-	down_read(&key->sem);
+	down_read(&mk->mk_secret_sem);
 
 	/* Has the secret been removed (via FS_IOC_REMOVE_ENCRYPTION_KEY)? */
 	if (!is_master_key_secret_present(&mk->mk_secret)) {
@@ -366,7 +366,7 @@ static int setup_file_encryption_key(struct fscrypt_info *ci,
 	return 0;
 
 out_release_key:
-	up_read(&key->sem);
+	up_read(&mk->mk_secret_sem);
 	key_put(key);
 	return err;
 }
@@ -492,7 +492,9 @@ int fscrypt_get_encryption_info(struct inode *inode)
 	res = 0;
 out:
 	if (master_key) {
-		up_read(&master_key->sem);
+		struct fscrypt_master_key *mk = master_key->payload.data[0];
+
+		up_read(&mk->mk_secret_sem);
 		key_put(master_key);
 	}
 	if (res == -ENOKEY)
@@ -555,7 +557,7 @@ int fscrypt_drop_inode(struct inode *inode)
 	mk = ci->ci_master_key->payload.data[0];
 
 	/*
-	 * Note: since we aren't holding key->sem, the result here can
+	 * Note: since we aren't holding ->mk_secret_sem, the result here can
 	 * immediately become outdated.  But there's no correctness problem with
 	 * unnecessarily evicting.  Nor is there a correctness problem with not
 	 * evicting while iput() is racing with the key being removed, since
diff --git a/include/uapi/linux/fscrypt.h b/include/uapi/linux/fscrypt.h
index 78811564c95f1..e292d920ad2a0 100644
--- a/include/uapi/linux/fscrypt.h
+++ b/include/uapi/linux/fscrypt.h
@@ -104,7 +104,9 @@ struct fscrypt_add_key_arg {
 /* Struct passed to FS_IOC_REMOVE_ENCRYPTION_KEY */
 struct fscrypt_remove_key_arg {
 	struct fscrypt_key_specifier key_spec;
-	__u32 __reserved[6];
+#define FSCRYPT_REMOVE_KEY_FLAG_ALL_USERS	0x00000001
+	__u32 flags;
+	__u32 __reserved[5];
 };
 
 /* Struct passed to FS_IOC_GET_ENCRYPTION_KEY_STATUS */
@@ -118,7 +120,10 @@ struct fscrypt_get_key_status_arg {
 #define FSCRYPT_KEY_STATUS_PRESENT		2
 #define FSCRYPT_KEY_STATUS_INCOMPLETELY_REMOVED	3
 	__u32 status;
-	__u32 __out_reserved[15];
+#define FSCRYPT_KEY_STATUS_FLAG_ADDED_BY_SELF   0x00000001
+	__u32 status_flags;
+	__u32 user_count;
+	__u32 __out_reserved[13];
 };
 
 #define FS_IOC_SET_ENCRYPTION_POLICY	  _IOR('f', 19, struct fscrypt_policy)
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
