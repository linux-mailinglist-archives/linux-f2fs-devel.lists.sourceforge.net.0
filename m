Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFDC821E0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Aug 2019 18:28:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hufqp-0001wR-27; Mon, 05 Aug 2019 16:28:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hufqn-0001vu-Ny
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 16:28:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TgLOyJ/rtd9uK59WP4Qtt/WY1x1dPDfX4xhuWEKtDB8=; b=VRFEnO03tM1w+C+Pwz13jnXc3S
 ZssBT0QRG5EV5AoRDIGh9Nx/vo3Ga2nQMYuwBaM2H/TPhcJnM3x/AR+Lr3/M2kqDkDftWswexolJa
 PxI3+JUxJ9ArdrWdUFz9fYAB6p1UWfk7Zv4l5cCvhHK+2gOv5U3iTZcSZ85tyCoJre1A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TgLOyJ/rtd9uK59WP4Qtt/WY1x1dPDfX4xhuWEKtDB8=; b=AuUrw4Cno3mrqcpMU/2TMVl6u9
 Xgmd1OgUMFWuCGlYhVjPnmjbGY9U2y8nmXM+OyKtZm/QnnoYwRlB7FdF/ZNLx+OTKrUNreJt8eD1n
 zgMzZ56qUDydCN+sNme7I+lF14wO1YCO0MesbCjejuVG9U8BkuXrLQnScAnk24a4GAKk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hufql-00BLym-RX
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 16:28:45 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EF5C921874;
 Mon,  5 Aug 2019 16:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565022515;
 bh=EAlHGZ9mtcGgQ+E3T+dNDezm5vtarFuCgLaj8FD79+w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HJG1sKe8hZUV3G3+bcaufUgxOoRLIGKBbxYC1mVHNgYpeynmUgKMsmglY8R/yQlLp
 iM00prIp3pX/WDj5NWKmWE3J2Gz8FhudxG9aqJGMbXp575f/MxKW/NnLDVy6siCXmA
 srLdlO3fw7kmQ1BNZOlHMSR0coRrH99YhLscFLvg=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon,  5 Aug 2019 09:25:11 -0700
Message-Id: <20190805162521.90882-11-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
In-Reply-To: <20190805162521.90882-1-ebiggers@kernel.org>
References: <20190805162521.90882-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
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
 0.9 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hufql-00BLym-RX
Subject: [f2fs-dev] [PATCH v8 10/20] fscrypt: add
 FS_IOC_REMOVE_ENCRYPTION_KEY ioctl
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

Add a new fscrypt ioctl, FS_IOC_REMOVE_ENCRYPTION_KEY.  This ioctl
removes an encryption key that was added by FS_IOC_ADD_ENCRYPTION_KEY.
It wipes the secret key itself, then "locks" the encrypted files and
directories that had been unlocked using that key -- implemented by
evicting the relevant dentries and inodes from the VFS caches.

The problem this solves is that many fscrypt users want the ability to
remove encryption keys, causing the corresponding encrypted directories
to appear "locked" (presented in ciphertext form) again.  Moreover,
users want removing an encryption key to *really* remove it, in the
sense that the removed keys cannot be recovered even if kernel memory is
compromised, e.g. by the exploit of a kernel security vulnerability or
by a physical attack.  This is desirable after a user logs out of the
system, for example.  In many cases users even already assume this to be
the case and are surprised to hear when it's not.

It is not sufficient to simply unlink the master key from the keyring
(or to revoke or invalidate it), since the actual encryption transform
objects are still pinned in memory by their inodes.  Therefore, to
really remove a key we must also evict the relevant inodes.

Currently one workaround is to run 'sync && echo 2 >
/proc/sys/vm/drop_caches'.  But, that evicts all unused inodes in the
system rather than just the inodes associated with the key being
removed, causing severe performance problems.  Moreover, it requires
root privileges, so regular users can't "lock" their encrypted files.

Another workaround, used in Chromium OS kernels, is to add a new
VFS-level ioctl FS_IOC_DROP_CACHE which is a more restricted version of
drop_caches that operates on a single super_block.  It does:

        shrink_dcache_sb(sb);
        invalidate_inodes(sb, false);

But it's still a hack.  Yet, the major users of filesystem encryption
want this feature badly enough that they are actually using these hacks.

To properly solve the problem, start maintaining a list of the inodes
which have been "unlocked" using each master key.  Originally this
wasn't possible because the kernel didn't keep track of in-use master
keys at all.  But, with the ->s_master_keys keyring it is now possible.

Then, add an ioctl FS_IOC_REMOVE_ENCRYPTION_KEY.  It finds the specified
master key in ->s_master_keys, then wipes the secret key itself, which
prevents any additional inodes from being unlocked with the key.  Then,
it syncs the filesystem and evicts the inodes in the key's list.  The
normal inode eviction code will free and wipe the per-file keys (in
->i_crypt_info).  Note that freeing ->i_crypt_info without evicting the
inodes was also considered, but would have been racy.

Some inodes may still be in use when a master key is removed, and we
can't simply revoke random file descriptors, mmap's, etc.  Thus, the
ioctl simply skips in-use inodes, and returns -EBUSY to indicate that
some inodes weren't evicted.  The master key *secret* is still removed,
but the fscrypt_master_key struct remains to keep track of the remaining
inodes.  Userspace can then retry the ioctl to evict the remaining
inodes.  Alternatively, if userspace adds the key again, the refreshed
secret will be associated with the existing list of inodes so they
remain correctly tracked for future key removals.

The ioctl doesn't wipe pagecache pages.  Thus, we tolerate that after a
kernel compromise some portions of plaintext file contents may still be
recoverable from memory.  This can be solved by enabling page poisoning
system-wide, which security conscious users may choose to do.  But it's
very difficult to solve otherwise, e.g. note that plaintext file
contents may have been read in other places than pagecache pages.

Like FS_IOC_ADD_ENCRYPTION_KEY, FS_IOC_REMOVE_ENCRYPTION_KEY is
initially restricted to privileged users only.  This is sufficient for
some use cases, but not all.  A later patch will relax this restriction,
but it will require introducing key hashes, among other changes.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fscrypt_private.h  |  53 +++++++-
 fs/crypto/keyring.c          | 253 ++++++++++++++++++++++++++++++++++-
 fs/crypto/keysetup.c         | 103 +++++++++++++-
 include/linux/fscrypt.h      |  12 ++
 include/uapi/linux/fscrypt.h |   9 ++
 5 files changed, 425 insertions(+), 5 deletions(-)

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 0d9ebfd3bf3a54..fc804f4a03fc92 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -78,6 +78,19 @@ struct fscrypt_info {
 	/* Back-pointer to the inode */
 	struct inode *ci_inode;
 
+	/*
+	 * The master key with which this inode was unlocked (decrypted).  This
+	 * will be NULL if the master key was found in a process-subscribed
+	 * keyring rather than in the filesystem-level keyring.
+	 */
+	struct key *ci_master_key;
+
+	/*
+	 * Link in list of inodes that were unlocked with the master key.
+	 * Only used when ->ci_master_key is set.
+	 */
+	struct list_head ci_master_key_link;
+
 	/*
 	 * If non-NULL, then encryption is done using the master key directly
 	 * and ci_ctfm will equal ci_direct_key->dk_ctfm.
@@ -183,14 +196,52 @@ struct fscrypt_master_key_secret {
  */
 struct fscrypt_master_key {
 
-	/* The secret key material */
+	/*
+	 * The secret key material.  After FS_IOC_REMOVE_ENCRYPTION_KEY is
+	 * executed, this is wiped and no new inodes can be unlocked with this
+	 * key; however, there may still be inodes in ->mk_decrypted_inodes
+	 * which could not be evicted.  As long as some inodes still remain,
+	 * FS_IOC_REMOVE_ENCRYPTION_KEY can be retried, or
+	 * FS_IOC_ADD_ENCRYPTION_KEY can add the secret again.
+	 *
+	 * Locking: protected by key->sem.
+	 */
 	struct fscrypt_master_key_secret	mk_secret;
 
 	/* Arbitrary key descriptor which was assigned by userspace */
 	struct fscrypt_key_specifier		mk_spec;
 
+	/*
+	 * Length of ->mk_decrypted_inodes, plus one if mk_secret is present.
+	 * Once this goes to 0, the master key is removed from ->s_master_keys.
+	 * The 'struct fscrypt_master_key' will continue to live as long as the
+	 * 'struct key' whose payload it is, but we won't let this reference
+	 * count rise again.
+	 */
+	refcount_t		mk_refcount;
+
+	/*
+	 * List of inodes that were unlocked using this key.  This allows the
+	 * inodes to be evicted efficiently if the key is removed.
+	 */
+	struct list_head	mk_decrypted_inodes;
+	spinlock_t		mk_decrypted_inodes_lock;
+
 } __randomize_layout;
 
+static inline bool
+is_master_key_secret_present(const struct fscrypt_master_key_secret *secret)
+{
+	/*
+	 * The READ_ONCE() is only necessary for fscrypt_drop_inode() and
+	 * fscrypt_key_describe().  These run in atomic context, so they can't
+	 * take key->sem and thus 'secret' can change concurrently which would
+	 * be a data race.  But they only need to know whether the secret *was*
+	 * present at the time of check, so READ_ONCE() suffices.
+	 */
+	return READ_ONCE(secret->size) != 0;
+}
+
 static inline const char *master_key_spec_type(
 				const struct fscrypt_key_specifier *spec)
 {
diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index bcd7d2836e1e4c..9901593051424b 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -10,6 +10,7 @@
  * filesystem-level keyring, including the ioctls:
  *
  * - FS_IOC_ADD_ENCRYPTION_KEY
+ * - FS_IOC_REMOVE_ENCRYPTION_KEY
  *
  * See the "User API" section of Documentation/filesystems/fscrypt.rst for more
  * information about these ioctls.
@@ -60,6 +61,13 @@ static void fscrypt_key_destroy(struct key *key)
 static void fscrypt_key_describe(const struct key *key, struct seq_file *m)
 {
 	seq_puts(m, key->description);
+
+	if (key_is_positive(key)) {
+		const struct fscrypt_master_key *mk = key->payload.data[0];
+
+		if (!is_master_key_secret_present(&mk->mk_secret))
+			seq_puts(m, ": secret removed");
+	}
 }
 
 /*
@@ -186,6 +194,10 @@ static int add_new_master_key(struct fscrypt_master_key_secret *secret,
 
 	move_master_key_secret(&mk->mk_secret, secret);
 
+	refcount_set(&mk->mk_refcount, 1); /* secret is present */
+	INIT_LIST_HEAD(&mk->mk_decrypted_inodes);
+	spin_lock_init(&mk->mk_decrypted_inodes_lock);
+
 	format_mk_description(description, mk_spec);
 	key = key_alloc(&key_type_fscrypt, description,
 			GLOBAL_ROOT_UID, GLOBAL_ROOT_GID, current_cred(),
@@ -207,6 +219,21 @@ static int add_new_master_key(struct fscrypt_master_key_secret *secret,
 	return err;
 }
 
+#define KEY_DEAD	1
+
+static int add_existing_master_key(struct fscrypt_master_key *mk,
+				   struct fscrypt_master_key_secret *secret)
+{
+	if (is_master_key_secret_present(&mk->mk_secret))
+		return 0;
+
+	if (!refcount_inc_not_zero(&mk->mk_refcount))
+		return KEY_DEAD;
+
+	move_master_key_secret(&mk->mk_secret, secret);
+	return 0;
+}
+
 static int add_master_key(struct super_block *sb,
 			  struct fscrypt_master_key_secret *secret,
 			  const struct fscrypt_key_specifier *mk_spec)
@@ -216,6 +243,7 @@ static int add_master_key(struct super_block *sb,
 	int err;
 
 	mutex_lock(&fscrypt_add_key_mutex); /* serialize find + link */
+retry:
 	key = fscrypt_find_master_key(sb, mk_spec);
 	if (IS_ERR(key)) {
 		err = PTR_ERR(key);
@@ -227,8 +255,20 @@ static int add_master_key(struct super_block *sb,
 			goto out_unlock;
 		err = add_new_master_key(secret, mk_spec, sb->s_master_keys);
 	} else {
+		/*
+		 * Found the key in ->s_master_keys.  Re-add the secret if
+		 * needed.
+		 */
+		down_write(&key->sem);
+		err = add_existing_master_key(key->payload.data[0], secret);
+		up_write(&key->sem);
+		if (err == KEY_DEAD) {
+			/* Key being removed or needs to be removed */
+			key_invalidate(key);
+			key_put(key);
+			goto retry;
+		}
 		key_put(key);
-		err = 0;
 	}
 out_unlock:
 	mutex_unlock(&fscrypt_add_key_mutex);
@@ -280,6 +320,217 @@ int fscrypt_ioctl_add_key(struct file *filp, void __user *_uarg)
 }
 EXPORT_SYMBOL_GPL(fscrypt_ioctl_add_key);
 
+/*
+ * Try to evict the inode's dentries from the dentry cache.  If the inode is a
+ * directory, then it can have at most one dentry; however, that dentry may be
+ * pinned by child dentries, so first try to evict the children too.
+ */
+static void shrink_dcache_inode(struct inode *inode)
+{
+	struct dentry *dentry;
+
+	if (S_ISDIR(inode->i_mode)) {
+		dentry = d_find_any_alias(inode);
+		if (dentry) {
+			shrink_dcache_parent(dentry);
+			dput(dentry);
+		}
+	}
+	d_prune_aliases(inode);
+}
+
+static void evict_dentries_for_decrypted_inodes(struct fscrypt_master_key *mk)
+{
+	struct fscrypt_info *ci;
+	struct inode *inode;
+	struct inode *toput_inode = NULL;
+
+	spin_lock(&mk->mk_decrypted_inodes_lock);
+
+	list_for_each_entry(ci, &mk->mk_decrypted_inodes, ci_master_key_link) {
+		inode = ci->ci_inode;
+		spin_lock(&inode->i_lock);
+		if (inode->i_state & (I_FREEING | I_WILL_FREE | I_NEW)) {
+			spin_unlock(&inode->i_lock);
+			continue;
+		}
+		__iget(inode);
+		spin_unlock(&inode->i_lock);
+		spin_unlock(&mk->mk_decrypted_inodes_lock);
+
+		shrink_dcache_inode(inode);
+		iput(toput_inode);
+		toput_inode = inode;
+
+		spin_lock(&mk->mk_decrypted_inodes_lock);
+	}
+
+	spin_unlock(&mk->mk_decrypted_inodes_lock);
+	iput(toput_inode);
+}
+
+static int check_for_busy_inodes(struct super_block *sb,
+				 struct fscrypt_master_key *mk)
+{
+	struct list_head *pos;
+	size_t busy_count = 0;
+	unsigned long ino;
+	struct dentry *dentry;
+	char _path[256];
+	char *path = NULL;
+
+	spin_lock(&mk->mk_decrypted_inodes_lock);
+
+	list_for_each(pos, &mk->mk_decrypted_inodes)
+		busy_count++;
+
+	if (busy_count == 0) {
+		spin_unlock(&mk->mk_decrypted_inodes_lock);
+		return 0;
+	}
+
+	{
+		/* select an example file to show for debugging purposes */
+		struct inode *inode =
+			list_first_entry(&mk->mk_decrypted_inodes,
+					 struct fscrypt_info,
+					 ci_master_key_link)->ci_inode;
+		ino = inode->i_ino;
+		dentry = d_find_alias(inode);
+	}
+	spin_unlock(&mk->mk_decrypted_inodes_lock);
+
+	if (dentry) {
+		path = dentry_path(dentry, _path, sizeof(_path));
+		dput(dentry);
+	}
+	if (IS_ERR_OR_NULL(path))
+		path = "(unknown)";
+
+	fscrypt_warn(NULL,
+		     "%s: %zu inode(s) still busy after removing key with %s %*phN, including ino %lu (%s)",
+		     sb->s_id, busy_count, master_key_spec_type(&mk->mk_spec),
+		     master_key_spec_len(&mk->mk_spec), (u8 *)&mk->mk_spec.u,
+		     ino, path);
+	return -EBUSY;
+}
+
+static int try_to_lock_encrypted_files(struct super_block *sb,
+				       struct fscrypt_master_key *mk)
+{
+	int err1;
+	int err2;
+
+	/*
+	 * An inode can't be evicted while it is dirty or has dirty pages.
+	 * Thus, we first have to clean the inodes in ->mk_decrypted_inodes.
+	 *
+	 * Just do it the easy way: call sync_filesystem().  It's overkill, but
+	 * it works, and it's more important to minimize the amount of caches we
+	 * drop than the amount of data we sync.  Also, unprivileged users can
+	 * already call sync_filesystem() via sys_syncfs() or sys_sync().
+	 */
+	down_read(&sb->s_umount);
+	err1 = sync_filesystem(sb);
+	up_read(&sb->s_umount);
+	/* If a sync error occurs, still try to evict as much as possible. */
+
+	/*
+	 * Inodes are pinned by their dentries, so we have to evict their
+	 * dentries.  shrink_dcache_sb() would suffice, but would be overkill
+	 * and inappropriate for use by unprivileged users.  So instead go
+	 * through the inodes' alias lists and try to evict each dentry.
+	 */
+	evict_dentries_for_decrypted_inodes(mk);
+
+	/*
+	 * evict_dentries_for_decrypted_inodes() already iput() each inode in
+	 * the list; any inodes for which that dropped the last reference will
+	 * have been evicted due to fscrypt_drop_inode() detecting the key
+	 * removal and telling the VFS to evict the inode.  So to finish, we
+	 * just need to check whether any inodes couldn't be evicted.
+	 */
+	err2 = check_for_busy_inodes(sb, mk);
+
+	return err1 ?: err2;
+}
+
+/*
+ * Try to remove an fscrypt master encryption key.
+ *
+ * First we wipe the actual master key secret, so that no more inodes can be
+ * unlocked with it.  Then we try to evict all cached inodes that had been
+ * unlocked with the key.
+ *
+ * If all inodes were evicted, then we unlink the fscrypt_master_key from the
+ * keyring.  Otherwise it remains in the keyring in the "incompletely removed"
+ * state (without the actual secret key) where it tracks the list of remaining
+ * inodes.  Userspace can execute the ioctl again later to retry eviction, or
+ * alternatively can re-add the secret key again.
+ *
+ * For more details, see the "Removing keys" section of
+ * Documentation/filesystems/fscrypt.rst.
+ */
+int fscrypt_ioctl_remove_key(struct file *filp, void __user *_uarg)
+{
+	struct super_block *sb = file_inode(filp)->i_sb;
+	struct fscrypt_remove_key_arg __user *uarg = _uarg;
+	struct fscrypt_remove_key_arg arg;
+	struct key *key;
+	struct fscrypt_master_key *mk;
+	u32 status_flags = 0;
+	bool dead;
+
+	if (copy_from_user(&arg, uarg, sizeof(arg)))
+		return -EFAULT;
+
+	if (!valid_key_spec(&arg.key_spec))
+		return -EINVAL;
+
+	if (memchr_inv(arg.__reserved, 0, sizeof(arg.__reserved)))
+		return -EINVAL;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EACCES;
+
+	/* Find the key being removed. */
+	key = fscrypt_find_master_key(sb, &arg.key_spec);
+	if (IS_ERR(key))
+		return PTR_ERR(key);
+	mk = key->payload.data[0];
+
+	down_write(&key->sem);
+
+	/* Wipe the secret. */
+	dead = false;
+	if (is_master_key_secret_present(&mk->mk_secret)) {
+		wipe_master_key_secret(&mk->mk_secret);
+		dead = refcount_dec_and_test(&mk->mk_refcount);
+	}
+	up_write(&key->sem);
+	if (dead) {
+		/*
+		 * No inodes reference the key, and we wiped the secret, so the
+		 * key object is free to be removed from the keyring.
+		 */
+		key_invalidate(key);
+	} else {
+		/* Some inodes still reference this key; try to evict them. */
+		if (try_to_lock_encrypted_files(sb, mk) != 0)
+			status_flags |=
+				FSCRYPT_KEY_REMOVAL_STATUS_FLAG_FILES_BUSY;
+	}
+	/*
+	 * We return 0 if we successfully did something: wiped the secret, or
+	 * tried locking the files again.  Users need to check the informational
+	 * status flags if they care whether the key has been fully removed
+	 * including all files locked.
+	 */
+	key_put(key);
+	return put_user(status_flags, &uarg->removal_status_flags);
+}
+EXPORT_SYMBOL_GPL(fscrypt_ioctl_remove_key);
+
 int __init fscrypt_init_keyring(void)
 {
 	return register_key_type(&key_type_fscrypt);
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index 1c6d18bcdc7b64..7b60a47fc73c73 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -213,8 +213,16 @@ int fscrypt_set_derived_key(struct fscrypt_info *ci, const u8 *derived_key)
 
 /*
  * Find the master key, then set up the inode's actual encryption key.
+ *
+ * If the master key is found in the filesystem-level keyring, then the
+ * corresponding 'struct key' is returned in *master_key_ret with
+ * ->sem read-locked.  This is needed to ensure that only one task links the
+ * fscrypt_info into ->mk_decrypted_inodes (as multiple tasks may race to create
+ * an fscrypt_info for the same inode), and to synchronize the master key being
+ * removed with a new inode starting to use it.
  */
-static int setup_file_encryption_key(struct fscrypt_info *ci)
+static int setup_file_encryption_key(struct fscrypt_info *ci,
+				     struct key **master_key_ret)
 {
 	struct key *key;
 	struct fscrypt_master_key *mk = NULL;
@@ -234,6 +242,13 @@ static int setup_file_encryption_key(struct fscrypt_info *ci)
 	}
 
 	mk = key->payload.data[0];
+	down_read(&key->sem);
+
+	/* Has the secret been removed (via FS_IOC_REMOVE_ENCRYPTION_KEY)? */
+	if (!is_master_key_secret_present(&mk->mk_secret)) {
+		err = -ENOKEY;
+		goto out_release_key;
+	}
 
 	if (mk->mk_secret.size < ci->ci_mode->keysize) {
 		fscrypt_warn(NULL,
@@ -246,14 +261,22 @@ static int setup_file_encryption_key(struct fscrypt_info *ci)
 	}
 
 	err = fscrypt_setup_v1_file_key(ci, mk->mk_secret.raw);
+	if (err)
+		goto out_release_key;
+
+	*master_key_ret = key;
+	return 0;
 
 out_release_key:
+	up_read(&key->sem);
 	key_put(key);
 	return err;
 }
 
 static void put_crypt_info(struct fscrypt_info *ci)
 {
+	struct key *key;
+
 	if (!ci)
 		return;
 
@@ -263,6 +286,26 @@ static void put_crypt_info(struct fscrypt_info *ci)
 		crypto_free_skcipher(ci->ci_ctfm);
 		crypto_free_cipher(ci->ci_essiv_tfm);
 	}
+
+	key = ci->ci_master_key;
+	if (key) {
+		struct fscrypt_master_key *mk = key->payload.data[0];
+
+		/*
+		 * Remove this inode from the list of inodes that were unlocked
+		 * with the master key.
+		 *
+		 * In addition, if we're removing the last inode from a key that
+		 * already had its secret removed, invalidate the key so that it
+		 * gets removed from ->s_master_keys.
+		 */
+		spin_lock(&mk->mk_decrypted_inodes_lock);
+		list_del(&ci->ci_master_key_link);
+		spin_unlock(&mk->mk_decrypted_inodes_lock);
+		if (refcount_dec_and_test(&mk->mk_refcount))
+			key_invalidate(key);
+		key_put(key);
+	}
 	kmem_cache_free(fscrypt_info_cachep, ci);
 }
 
@@ -271,6 +314,7 @@ int fscrypt_get_encryption_info(struct inode *inode)
 	struct fscrypt_info *crypt_info;
 	struct fscrypt_context ctx;
 	struct fscrypt_mode *mode;
+	struct key *master_key = NULL;
 	int res;
 
 	if (fscrypt_has_encryption_key(inode))
@@ -335,13 +379,30 @@ int fscrypt_get_encryption_info(struct inode *inode)
 	WARN_ON(mode->ivsize > FSCRYPT_MAX_IV_SIZE);
 	crypt_info->ci_mode = mode;
 
-	res = setup_file_encryption_key(crypt_info);
+	res = setup_file_encryption_key(crypt_info, &master_key);
 	if (res)
 		goto out;
 
-	if (cmpxchg_release(&inode->i_crypt_info, NULL, crypt_info) == NULL)
+	if (cmpxchg_release(&inode->i_crypt_info, NULL, crypt_info) == NULL) {
+		if (master_key) {
+			struct fscrypt_master_key *mk =
+				master_key->payload.data[0];
+
+			refcount_inc(&mk->mk_refcount);
+			crypt_info->ci_master_key = key_get(master_key);
+			spin_lock(&mk->mk_decrypted_inodes_lock);
+			list_add(&crypt_info->ci_master_key_link,
+				 &mk->mk_decrypted_inodes);
+			spin_unlock(&mk->mk_decrypted_inodes_lock);
+		}
 		crypt_info = NULL;
+	}
+	res = 0;
 out:
+	if (master_key) {
+		up_read(&master_key->sem);
+		key_put(master_key);
+	}
 	if (res == -ENOKEY)
 		res = 0;
 	put_crypt_info(crypt_info);
@@ -376,3 +437,39 @@ void fscrypt_free_inode(struct inode *inode)
 	}
 }
 EXPORT_SYMBOL(fscrypt_free_inode);
+
+/**
+ * fscrypt_drop_inode - check whether the inode's master key has been removed
+ *
+ * Filesystems supporting fscrypt must call this from their ->drop_inode()
+ * method so that encrypted inodes are evicted as soon as they're no longer in
+ * use and their master key has been removed.
+ *
+ * Return: 1 if fscrypt wants the inode to be evicted now, otherwise 0
+ */
+int fscrypt_drop_inode(struct inode *inode)
+{
+	const struct fscrypt_info *ci = READ_ONCE(inode->i_crypt_info);
+	const struct fscrypt_master_key *mk;
+
+	/*
+	 * If ci is NULL, then the inode doesn't have an encryption key set up
+	 * so it's irrelevant.  If ci_master_key is NULL, then the master key
+	 * was provided via the legacy mechanism of the process-subscribed
+	 * keyrings, so we don't know whether it's been removed or not.
+	 */
+	if (!ci || !ci->ci_master_key)
+		return 0;
+	mk = ci->ci_master_key->payload.data[0];
+
+	/*
+	 * Note: since we aren't holding key->sem, the result here can
+	 * immediately become outdated.  But there's no correctness problem with
+	 * unnecessarily evicting.  Nor is there a correctness problem with not
+	 * evicting while iput() is racing with the key being removed, since
+	 * then the thread removing the key will either evict the inode itself
+	 * or will correctly detect that it wasn't evicted due to the race.
+	 */
+	return !is_master_key_secret_present(&mk->mk_secret);
+}
+EXPORT_SYMBOL_GPL(fscrypt_drop_inode);
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 46bf66cf76ef88..b494c5f9c01f79 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -141,11 +141,13 @@ extern int fscrypt_inherit_context(struct inode *, struct inode *,
 /* keyring.c */
 extern void fscrypt_sb_free(struct super_block *sb);
 extern int fscrypt_ioctl_add_key(struct file *filp, void __user *arg);
+extern int fscrypt_ioctl_remove_key(struct file *filp, void __user *arg);
 
 /* keysetup.c */
 extern int fscrypt_get_encryption_info(struct inode *);
 extern void fscrypt_put_encryption_info(struct inode *);
 extern void fscrypt_free_inode(struct inode *);
+extern int fscrypt_drop_inode(struct inode *inode);
 
 /* fname.c */
 extern int fscrypt_setup_filename(struct inode *, const struct qstr *,
@@ -381,6 +383,11 @@ static inline int fscrypt_ioctl_add_key(struct file *filp, void __user *arg)
 	return -EOPNOTSUPP;
 }
 
+static inline int fscrypt_ioctl_remove_key(struct file *filp, void __user *arg)
+{
+	return -EOPNOTSUPP;
+}
+
 /* keysetup.c */
 static inline int fscrypt_get_encryption_info(struct inode *inode)
 {
@@ -396,6 +403,11 @@ static inline void fscrypt_free_inode(struct inode *inode)
 {
 }
 
+static inline int fscrypt_drop_inode(struct inode *inode)
+{
+	return 0;
+}
+
  /* fname.c */
 static inline int fscrypt_setup_filename(struct inode *dir,
 					 const struct qstr *iname,
diff --git a/include/uapi/linux/fscrypt.h b/include/uapi/linux/fscrypt.h
index 6aeca3cb0a2dec..07f37a27a94445 100644
--- a/include/uapi/linux/fscrypt.h
+++ b/include/uapi/linux/fscrypt.h
@@ -76,10 +76,19 @@ struct fscrypt_add_key_arg {
 	__u8 raw[];
 };
 
+/* Struct passed to FS_IOC_REMOVE_ENCRYPTION_KEY */
+struct fscrypt_remove_key_arg {
+	struct fscrypt_key_specifier key_spec;
+#define FSCRYPT_KEY_REMOVAL_STATUS_FLAG_FILES_BUSY	0x00000001
+	__u32 removal_status_flags;	/* output */
+	__u32 __reserved[5];
+};
+
 #define FS_IOC_SET_ENCRYPTION_POLICY		_IOR('f', 19, struct fscrypt_policy)
 #define FS_IOC_GET_ENCRYPTION_PWSALT		_IOW('f', 20, __u8[16])
 #define FS_IOC_GET_ENCRYPTION_POLICY		_IOW('f', 21, struct fscrypt_policy)
 #define FS_IOC_ADD_ENCRYPTION_KEY		_IOWR('f', 23, struct fscrypt_add_key_arg)
+#define FS_IOC_REMOVE_ENCRYPTION_KEY		_IOWR('f', 24, struct fscrypt_remove_key_arg)
 
 /**********************************************************************/
 
-- 
2.22.0.770.g0f2c4a37fd-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
