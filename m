Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6163A82208
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Aug 2019 18:29:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hufr2-0004ik-5B; Mon, 05 Aug 2019 16:29:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hufqv-0004ga-Im
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 16:28:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C7aA00JtGnttKKrxNjSl1CRvQB6AK7OCIyIlVC7CI38=; b=ZwTOOgvQAMOM6Llg8XYBauv8wn
 KRQJ1sBeNgUjUIJ3TTZ7THXpPgoHHv8w0PweV6/J49HCWO0Kp0BeB8x4s4dXVszVTRJtQlR5orDBI
 6mwWE7RqIEv97PgYch6DyvgMN9zICwYpojOtdvsElS58WR9+o27Zmj8qCRDj1ch7ehGg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C7aA00JtGnttKKrxNjSl1CRvQB6AK7OCIyIlVC7CI38=; b=lqT/R1SgneAp4xB3b9HakZNa0c
 HrF1DaJ973uXaebgWHqy4uQzkhMPpP/lUL7SUOqPFt6YVxUTFv8WMuoAuvkkkmG54+aLEXGajEOHo
 U0kiaGmYldFIRC6KXtk1kgD05K+2IW1wCJgbQtnzlOsC/RntYnsGINC+O9EtvwF7whl4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hufqs-00BnL4-Vd
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 16:28:52 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8ABEF21882;
 Mon,  5 Aug 2019 16:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565022517;
 bh=VjAaNT/bB/mmrNPRrRj2ZZRW/GYtz3hszPigcawoqzI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z/Z2qEREoFm/mmXKw0i8w5vAqkR/mAb7ptX3C3G4hUGzHmRT1I+2nh4hBecUKx7qP
 qBhsWoKbVZ1N1GU379pIrI8rEbMfoI9deXoMQu2LigEP21H3iI02xzcwQUzPrjanzh
 kdeLKNiBRCc55d1D1wuKOC8WZUtDl/AbFtSL7UFA=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon,  5 Aug 2019 09:25:16 -0700
Message-Id: <20190805162521.90882-16-ebiggers@kernel.org>
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
X-Headers-End: 1hufqs-00BnL4-Vd
Subject: [f2fs-dev] [PATCH v8 15/20] fscrypt: add
 FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS ioctl
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

Add a root-only variant of the FS_IOC_REMOVE_ENCRYPTION_KEY ioctl which
removes all users' claims of the key, not just the current user's claim.
I.e., it always removes the key itself, no matter how many users have
added it.

This is useful for forcing a directory to be locked, without having to
figure out which user ID(s) the key was added under.  This is planned to
be used by a command like 'sudo fscrypt lock DIR --all-users' in the
fscrypt userspace tool (http://github.com/google/fscrypt).

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/keyring.c          | 29 ++++++++++++++++++++++++-----
 include/linux/fscrypt.h      |  8 ++++++++
 include/uapi/linux/fscrypt.h |  1 +
 3 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index 2f47464f8cf603..86bfcc02b31fcf 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -11,6 +11,7 @@
  *
  * - FS_IOC_ADD_ENCRYPTION_KEY
  * - FS_IOC_REMOVE_ENCRYPTION_KEY
+ * - FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS
  * - FS_IOC_GET_ENCRYPTION_KEY_STATUS
  *
  * See the "User API" section of Documentation/filesystems/fscrypt.rst for more
@@ -699,8 +700,10 @@ static int try_to_lock_encrypted_files(struct super_block *sb,
 /*
  * Try to remove an fscrypt master encryption key.
  *
- * This removes the current user's claim to the key, then removes the key itself
- * if no other users have claims.
+ * FS_IOC_REMOVE_ENCRYPTION_KEY (all_users=false) removes the current user's
+ * claim to the key, then removes the key itself if no other users have claims.
+ * FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS (all_users=true) always removes the
+ * key itself.
  *
  * To "remove the key itself", first we wipe the actual master key secret, so
  * that no more inodes can be unlocked with it.  Then we try to evict all cached
@@ -715,7 +718,7 @@ static int try_to_lock_encrypted_files(struct super_block *sb,
  * For more details, see the "Removing keys" section of
  * Documentation/filesystems/fscrypt.rst.
  */
-int fscrypt_ioctl_remove_key(struct file *filp, void __user *_uarg)
+static int do_remove_key(struct file *filp, void __user *_uarg, bool all_users)
 {
 	struct super_block *sb = file_inode(filp)->i_sb;
 	struct fscrypt_remove_key_arg __user *uarg = _uarg;
@@ -751,9 +754,12 @@ int fscrypt_ioctl_remove_key(struct file *filp, void __user *_uarg)
 
 	down_write(&key->sem);
 
-	/* If relevant, remove current user's claim to the key */
+	/* If relevant, remove current user's (or all users) claim to the key */
 	if (mk->mk_users && mk->mk_users->keys.nr_leaves_on_tree != 0) {
-		err = remove_master_key_user(mk);
+		if (all_users)
+			err = keyring_clear(mk->mk_users);
+		else
+			err = remove_master_key_user(mk);
 		if (err) {
 			up_write(&key->sem);
 			goto out_put_key;
@@ -806,8 +812,21 @@ int fscrypt_ioctl_remove_key(struct file *filp, void __user *_uarg)
 		err = put_user(status_flags, &uarg->removal_status_flags);
 	return err;
 }
+
+int fscrypt_ioctl_remove_key(struct file *filp, void __user *uarg)
+{
+	return do_remove_key(filp, uarg, false);
+}
 EXPORT_SYMBOL_GPL(fscrypt_ioctl_remove_key);
 
+int fscrypt_ioctl_remove_key_all_users(struct file *filp, void __user *uarg)
+{
+	if (!capable(CAP_SYS_ADMIN))
+		return -EACCES;
+	return do_remove_key(filp, uarg, true);
+}
+EXPORT_SYMBOL_GPL(fscrypt_ioctl_remove_key_all_users);
+
 /*
  * Retrieve the status of an fscrypt master encryption key.
  *
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 8b8ff048404297..f622f7460ed8c6 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -143,6 +143,8 @@ extern int fscrypt_inherit_context(struct inode *, struct inode *,
 extern void fscrypt_sb_free(struct super_block *sb);
 extern int fscrypt_ioctl_add_key(struct file *filp, void __user *arg);
 extern int fscrypt_ioctl_remove_key(struct file *filp, void __user *arg);
+extern int fscrypt_ioctl_remove_key_all_users(struct file *filp,
+					      void __user *arg);
 extern int fscrypt_ioctl_get_key_status(struct file *filp, void __user *arg);
 
 /* keysetup.c */
@@ -396,6 +398,12 @@ static inline int fscrypt_ioctl_remove_key(struct file *filp, void __user *arg)
 	return -EOPNOTSUPP;
 }
 
+static inline int fscrypt_ioctl_remove_key_all_users(struct file *filp,
+						     void __user *arg)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int fscrypt_ioctl_get_key_status(struct file *filp,
 					       void __user *arg)
 {
diff --git a/include/uapi/linux/fscrypt.h b/include/uapi/linux/fscrypt.h
index b9fb775e3db8e4..39ccfe9311c387 100644
--- a/include/uapi/linux/fscrypt.h
+++ b/include/uapi/linux/fscrypt.h
@@ -148,6 +148,7 @@ struct fscrypt_get_key_status_arg {
 #define FS_IOC_GET_ENCRYPTION_POLICY_EX		_IOWR('f', 22, __u8[9]) /* size + version */
 #define FS_IOC_ADD_ENCRYPTION_KEY		_IOWR('f', 23, struct fscrypt_add_key_arg)
 #define FS_IOC_REMOVE_ENCRYPTION_KEY		_IOWR('f', 24, struct fscrypt_remove_key_arg)
+#define FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS	_IOWR('f', 25, struct fscrypt_remove_key_arg)
 #define FS_IOC_GET_ENCRYPTION_KEY_STATUS	_IOWR('f', 26, struct fscrypt_get_key_status_arg)
 
 /**********************************************************************/
-- 
2.22.0.770.g0f2c4a37fd-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
