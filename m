Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4775161F4
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  1 May 2022 07:13:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nl1tK-0001cW-5V; Sun, 01 May 2022 05:13:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nl1tH-0001c3-2h
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 May 2022 05:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xkNDnyZnBYgU1/QxWNYjHBxwBa0pfruL1EtBbDvER+U=; b=O9LXJzMu8/YDPj0ZENk3gC1p2U
 7jwbPPeCc1Y+gEvXE9yvCJja7YUZXeb3BitXmV1XxK6b/Hc8ZbDz1hvYgtCUXHYGOfcz/NoUQKdTv
 Kv9ISYirGsPlqDgqFFdMkbSLIDVgzRBGcYXJSe3wrCSbpl5M3zAFF74Nz2sp8D7zTvaM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xkNDnyZnBYgU1/QxWNYjHBxwBa0pfruL1EtBbDvER+U=; b=e8bIKZUMlBy2/Ho0C/Rr/Sw47k
 f8wqiPG25nnEyxWPW0FI2//RptIWgOyOXb4bGEImSw7iQe8nkES8ngugxkQ05iX+SDupFxqVpNrk/
 +cGQjJpZDJ57dZSHqMBBzSzZ8LAJpZlR+kJYqd2cNdzgoAz73VZE4YqM1VjXeVlEoaSs=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nl1tE-00FPck-Rt
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 May 2022 05:13:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 49392B80CDD;
 Sun,  1 May 2022 05:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2865C385B7;
 Sun,  1 May 2022 05:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651381968;
 bh=LFV+rcUJgQ1DI9XwhNGr36IDFgBCKz1fud5yjZDOxsw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jcVRwIUqLOGYdNLM1cVI5DOpSD2GWVqsC7IB5GYTRaHrn/mSIx8w1uZmcgo0hq27m
 67/4cwkMcFz2cO9tXYg/Cv2YPkp08rr47Djo8Rs2hsyGrpmvzf6aMr3JlgQPxggjGB
 PLp9M3521hUe7577WQDkgfnHEcz/UH55Jf8Q/3AmJD+5AST1eRDakK0VHzPn0YnG4m
 PJDRugOwLxnfHWdrbrHjO0V/Z3vEEtfRqAVS5SQ2g5R9KuN430MzpOExk04kAd2i1M
 MmXMmVWGv33EHvUxTd1ypNbMduJqKNooymaOdO7cYuIVy6OhSPyRdJn0Gt+vgTJnVA
 r4wvbPbwaiJVQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 30 Apr 2022 22:08:54 -0700
Message-Id: <20220501050857.538984-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220501050857.538984-1-ebiggers@kernel.org>
References: <20220501050857.538984-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Eric Biggers <ebiggers@google.com> Unfortunately the
 design of fscrypt_set_test_dummy_encryption() doesn't work properly for the
 new mount API, as it combines too many steps into one function: - Parse the
 argument to test_dummy_encryption - Check the setting against the filesystem
 instance - Apply the setting to the filesystem instance 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nl1tE-00FPck-Rt
Subject: [f2fs-dev] [PATCH v2 4/7] fscrypt: add new helper functions for
 test_dummy_encryption
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
Cc: Jeff Layton <jlayton@kernel.org>, Lukas Czerner <lczerner@redhat.com>,
 Theodore Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Unfortunately the design of fscrypt_set_test_dummy_encryption() doesn't
work properly for the new mount API, as it combines too many steps into
one function:

  - Parse the argument to test_dummy_encryption
  - Check the setting against the filesystem instance
  - Apply the setting to the filesystem instance

The new mount API has split these into separate steps.  ext4 partially
worked around this by duplicating some of the logic, but it still had
some bugs.  To address this, add some new helper functions that split up
the steps of fscrypt_set_test_dummy_encryption():

  - fscrypt_parse_test_dummy_encryption()
  - fscrypt_dummy_policies_equal()
  - fscrypt_add_test_dummy_key()

While we're add it, also add a function fscrypt_is_dummy_policy_set()
which will be useful to avoid some #ifdef's.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fscrypt_private.h |   4 +-
 fs/crypto/keyring.c         |  64 +++++++++++++++++----
 fs/crypto/policy.c          | 112 +++++++++++++++++++-----------------
 include/linux/fscrypt.h     |  39 +++++++++++++
 4 files changed, 151 insertions(+), 68 deletions(-)

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index f32d0ee91e70e..36941d7fd6ad1 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -545,8 +545,8 @@ struct key *
 fscrypt_find_master_key(struct super_block *sb,
 			const struct fscrypt_key_specifier *mk_spec);
 
-int fscrypt_add_test_dummy_key(struct super_block *sb,
-			       struct fscrypt_key_specifier *key_spec);
+int fscrypt_get_test_dummy_key_identifier(
+			  u8 key_identifier[FSCRYPT_KEY_IDENTIFIER_SIZE]);
 
 int fscrypt_verify_key_added(struct super_block *sb,
 			     const u8 identifier[FSCRYPT_KEY_IDENTIFIER_SIZE]);
diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index 0b3ffbb4faf4a..caee9f8620dd9 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -688,28 +688,68 @@ int fscrypt_ioctl_add_key(struct file *filp, void __user *_uarg)
 }
 EXPORT_SYMBOL_GPL(fscrypt_ioctl_add_key);
 
-/*
- * Add the key for '-o test_dummy_encryption' to the filesystem keyring.
- *
- * Use a per-boot random key to prevent people from misusing this option.
- */
-int fscrypt_add_test_dummy_key(struct super_block *sb,
-			       struct fscrypt_key_specifier *key_spec)
+static void
+fscrypt_get_test_dummy_secret(struct fscrypt_master_key_secret *secret)
 {
 	static u8 test_key[FSCRYPT_MAX_KEY_SIZE];
+
+	get_random_once(test_key, FSCRYPT_MAX_KEY_SIZE);
+
+	memset(secret, 0, sizeof(*secret));
+	secret->size = FSCRYPT_MAX_KEY_SIZE;
+	memcpy(secret->raw, test_key, FSCRYPT_MAX_KEY_SIZE);
+}
+
+int fscrypt_get_test_dummy_key_identifier(
+				u8 key_identifier[FSCRYPT_KEY_IDENTIFIER_SIZE])
+{
 	struct fscrypt_master_key_secret secret;
 	int err;
 
-	get_random_once(test_key, FSCRYPT_MAX_KEY_SIZE);
+	fscrypt_get_test_dummy_secret(&secret);
 
-	memset(&secret, 0, sizeof(secret));
-	secret.size = FSCRYPT_MAX_KEY_SIZE;
-	memcpy(secret.raw, test_key, FSCRYPT_MAX_KEY_SIZE);
+	err = fscrypt_init_hkdf(&secret.hkdf, secret.raw, secret.size);
+	if (err)
+		goto out;
+	err = fscrypt_hkdf_expand(&secret.hkdf, HKDF_CONTEXT_KEY_IDENTIFIER,
+				  NULL, 0, key_identifier,
+				  FSCRYPT_KEY_IDENTIFIER_SIZE);
+out:
+	wipe_master_key_secret(&secret);
+	return err;
+}
+
+/**
+ * fscrypt_add_test_dummy_key() - add the test dummy encryption key
+ * @sb: the filesystem instance to add the key to
+ * @dummy_policy: the encryption policy for test_dummy_encryption
+ *
+ * If needed, add the key for the test_dummy_encryption mount option to the
+ * filesystem.  To prevent misuse of this mount option, a per-boot random key is
+ * used instead of a hardcoded one.  This makes it so that any encrypted files
+ * created using this option won't be accessible after a reboot.
+ *
+ * Return: 0 on success, -errno on failure
+ */
+int fscrypt_add_test_dummy_key(struct super_block *sb,
+			       const struct fscrypt_dummy_policy *dummy_policy)
+{
+	const union fscrypt_policy *policy = dummy_policy->policy;
+	struct fscrypt_key_specifier key_spec;
+	struct fscrypt_master_key_secret secret;
+	int err;
 
-	err = add_master_key(sb, &secret, key_spec);
+	if (!policy)
+		return 0;
+	err = fscrypt_policy_to_key_spec(policy, &key_spec);
+	if (err)
+		return err;
+	fscrypt_get_test_dummy_secret(&secret);
+	err = add_master_key(sb, &secret, &key_spec);
 	wipe_master_key_secret(&secret);
 	return err;
 }
+EXPORT_SYMBOL_GPL(fscrypt_add_test_dummy_key);
 
 /*
  * Verify that the current user has added a master key with the given identifier
diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index 2a11276913a98..5f858cee1e3b0 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -10,6 +10,7 @@
  * Modified by Eric Biggers, 2019 for v2 policy support.
  */
 
+#include <linux/fs_context.h>
 #include <linux/random.h>
 #include <linux/seq_file.h>
 #include <linux/string.h>
@@ -724,73 +725,45 @@ int fscrypt_set_context(struct inode *inode, void *fs_data)
 EXPORT_SYMBOL_GPL(fscrypt_set_context);
 
 /**
- * fscrypt_set_test_dummy_encryption() - handle '-o test_dummy_encryption'
- * @sb: the filesystem on which test_dummy_encryption is being specified
- * @arg: the argument to the test_dummy_encryption option.  May be NULL.
- * @dummy_policy: the filesystem's current dummy policy (input/output, see
- *		  below)
+ * fscrypt_parse_test_dummy_encryption() - parse the test_dummy_encryption mount option
+ * @param: the mount option
+ * @dummy_policy: (input/output) the place to write the dummy policy that will
+ *	result from parsing the option.  Zero-initialize this.  If a policy is
+ *	already set here (due to test_dummy_encryption being given multiple
+ *	times), then this function will verify that the policies are the same.
  *
- * Handle the test_dummy_encryption mount option by creating a dummy encryption
- * policy, saving it in @dummy_policy, and adding the corresponding dummy
- * encryption key to the filesystem.  If the @dummy_policy is already set, then
- * instead validate that it matches @arg.  Don't support changing it via
- * remount, as that is difficult to do safely.
- *
- * Return: 0 on success (dummy policy set, or the same policy is already set);
- *         -EEXIST if a different dummy policy is already set;
- *         or another -errno value.
+ * Return: 0 on success; -EINVAL if the argument is invalid; -EEXIST if the
+ *	   argument conflicts with one already specified; or -ENOMEM.
  */
-int fscrypt_set_test_dummy_encryption(struct super_block *sb, const char *arg,
-				      struct fscrypt_dummy_policy *dummy_policy)
+int fscrypt_parse_test_dummy_encryption(const struct fs_parameter *param,
+				struct fscrypt_dummy_policy *dummy_policy)
 {
-	struct fscrypt_key_specifier key_spec = { 0 };
-	int version;
-	union fscrypt_policy *policy = NULL;
+	const char *arg = "v2";
+	union fscrypt_policy *policy;
 	int err;
 
-	if (!arg)
-		arg = "v2";
-
-	if (!strcmp(arg, "v1")) {
-		version = FSCRYPT_POLICY_V1;
-		key_spec.type = FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR;
-		memset(key_spec.u.descriptor, 0x42,
-		       FSCRYPT_KEY_DESCRIPTOR_SIZE);
-	} else if (!strcmp(arg, "v2")) {
-		version = FSCRYPT_POLICY_V2;
-		key_spec.type = FSCRYPT_KEY_SPEC_TYPE_IDENTIFIER;
-		/* key_spec.u.identifier gets filled in when adding the key */
-	} else {
-		err = -EINVAL;
-		goto out;
-	}
+	if (param->type == fs_value_is_string && *param->string)
+		arg = param->string;
 
 	policy = kzalloc(sizeof(*policy), GFP_KERNEL);
-	if (!policy) {
-		err = -ENOMEM;
-		goto out;
-	}
-
-	err = fscrypt_add_test_dummy_key(sb, &key_spec);
-	if (err)
-		goto out;
+	if (!policy)
+		return -ENOMEM;
 
-	policy->version = version;
-	switch (policy->version) {
-	case FSCRYPT_POLICY_V1:
+	if (!strcmp(arg, "v1")) {
+		policy->version = FSCRYPT_POLICY_V1;
 		policy->v1.contents_encryption_mode = FSCRYPT_MODE_AES_256_XTS;
 		policy->v1.filenames_encryption_mode = FSCRYPT_MODE_AES_256_CTS;
-		memcpy(policy->v1.master_key_descriptor, key_spec.u.descriptor,
+		memset(policy->v1.master_key_descriptor, 0x42,
 		       FSCRYPT_KEY_DESCRIPTOR_SIZE);
-		break;
-	case FSCRYPT_POLICY_V2:
+	} else if (!strcmp(arg, "v2")) {
+		policy->version = FSCRYPT_POLICY_V2;
 		policy->v2.contents_encryption_mode = FSCRYPT_MODE_AES_256_XTS;
 		policy->v2.filenames_encryption_mode = FSCRYPT_MODE_AES_256_CTS;
-		memcpy(policy->v2.master_key_identifier, key_spec.u.identifier,
-		       FSCRYPT_KEY_IDENTIFIER_SIZE);
-		break;
-	default:
-		WARN_ON(1);
+		err = fscrypt_get_test_dummy_key_identifier(
+				policy->v2.master_key_identifier);
+		if (err)
+			goto out;
+	} else {
 		err = -EINVAL;
 		goto out;
 	}
@@ -809,6 +782,37 @@ int fscrypt_set_test_dummy_encryption(struct super_block *sb, const char *arg,
 	kfree(policy);
 	return err;
 }
+EXPORT_SYMBOL_GPL(fscrypt_parse_test_dummy_encryption);
+
+/**
+ * fscrypt_dummy_policies_equal() - check whether two dummy policies are equal
+ * @p1: the first test dummy policy (may be unset)
+ * @p2: the second test dummy policy (may be unset)
+ *
+ * Return: %true if the dummy policies are both set and equal, or both unset.
+ */
+bool fscrypt_dummy_policies_equal(const struct fscrypt_dummy_policy *p1,
+				  const struct fscrypt_dummy_policy *p2)
+{
+	if (!p1->policy && !p2->policy)
+		return true;
+	if (!p1->policy || !p2->policy)
+		return false;
+	return fscrypt_policies_equal(p1->policy, p2->policy);
+}
+EXPORT_SYMBOL_GPL(fscrypt_dummy_policies_equal);
+
+/* Deprecated, do not use */
+int fscrypt_set_test_dummy_encryption(struct super_block *sb, const char *arg,
+				      struct fscrypt_dummy_policy *dummy_policy)
+{
+	struct fs_parameter param = {
+		.type = fs_value_is_string,
+		.string = arg ? (char *)arg : "",
+	};
+	return fscrypt_parse_test_dummy_encryption(&param, dummy_policy) ?:
+		fscrypt_add_test_dummy_key(sb, dummy_policy);
+}
 EXPORT_SYMBOL_GPL(fscrypt_set_test_dummy_encryption);
 
 /**
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 50d92d805bd8c..099b881e63e49 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -22,6 +22,7 @@
 
 union fscrypt_policy;
 struct fscrypt_info;
+struct fs_parameter;
 struct seq_file;
 
 struct fscrypt_str {
@@ -279,10 +280,19 @@ struct fscrypt_dummy_policy {
 	const union fscrypt_policy *policy;
 };
 
+int fscrypt_parse_test_dummy_encryption(const struct fs_parameter *param,
+				    struct fscrypt_dummy_policy *dummy_policy);
+bool fscrypt_dummy_policies_equal(const struct fscrypt_dummy_policy *p1,
+				  const struct fscrypt_dummy_policy *p2);
 int fscrypt_set_test_dummy_encryption(struct super_block *sb, const char *arg,
 				struct fscrypt_dummy_policy *dummy_policy);
 void fscrypt_show_test_dummy_encryption(struct seq_file *seq, char sep,
 					struct super_block *sb);
+static inline bool
+fscrypt_is_dummy_policy_set(const struct fscrypt_dummy_policy *dummy_policy)
+{
+	return dummy_policy->policy != NULL;
+}
 static inline void
 fscrypt_free_dummy_policy(struct fscrypt_dummy_policy *dummy_policy)
 {
@@ -293,6 +303,8 @@ fscrypt_free_dummy_policy(struct fscrypt_dummy_policy *dummy_policy)
 /* keyring.c */
 void fscrypt_sb_free(struct super_block *sb);
 int fscrypt_ioctl_add_key(struct file *filp, void __user *arg);
+int fscrypt_add_test_dummy_key(struct super_block *sb,
+			       const struct fscrypt_dummy_policy *dummy_policy);
 int fscrypt_ioctl_remove_key(struct file *filp, void __user *arg);
 int fscrypt_ioctl_remove_key_all_users(struct file *filp, void __user *arg);
 int fscrypt_ioctl_get_key_status(struct file *filp, void __user *arg);
@@ -467,12 +479,32 @@ static inline int fscrypt_set_context(struct inode *inode, void *fs_data)
 struct fscrypt_dummy_policy {
 };
 
+static inline int
+fscrypt_parse_test_dummy_encryption(const struct fs_parameter *param,
+				    struct fscrypt_dummy_policy *dummy_policy)
+{
+	return -EINVAL;
+}
+
+static inline bool
+fscrypt_dummy_policies_equal(const struct fscrypt_dummy_policy *p1,
+			     const struct fscrypt_dummy_policy *p2)
+{
+	return true;
+}
+
 static inline void fscrypt_show_test_dummy_encryption(struct seq_file *seq,
 						      char sep,
 						      struct super_block *sb)
 {
 }
 
+static inline bool
+fscrypt_is_dummy_policy_set(const struct fscrypt_dummy_policy *dummy_policy)
+{
+	return false;
+}
+
 static inline void
 fscrypt_free_dummy_policy(struct fscrypt_dummy_policy *dummy_policy)
 {
@@ -488,6 +520,13 @@ static inline int fscrypt_ioctl_add_key(struct file *filp, void __user *arg)
 	return -EOPNOTSUPP;
 }
 
+static inline int
+fscrypt_add_test_dummy_key(struct super_block *sb,
+			   const struct fscrypt_dummy_policy *dummy_policy)
+{
+	return 0;
+}
+
 static inline int fscrypt_ioctl_remove_key(struct file *filp, void __user *arg)
 {
 	return -EOPNOTSUPP;
-- 
2.36.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
