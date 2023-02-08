Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F10DD68E836
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Feb 2023 07:21:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pPdq9-0006La-6C;
	Wed, 08 Feb 2023 06:21:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pPdpz-0006L0-QE
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Feb 2023 06:21:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZM2gebMby0FP9+HsVZ0LPm3InqNmJr/0inCyE6wV4Pk=; b=UdGNsZ+jxiMe1nwE5fGlzsr4l0
 X1H71FRKZ9/v9IdRRtvs13u20wC51ELv7yN+eukoW8Z9vzVZnGGRpArCkys3VehTrte0DNhS4rjmm
 wz1MCvsgRZcPvZwmzkVzooBb+utFn6hm+M4oJAP7ZHjraqd8+QtljBmUopRhZNuTT3lo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZM2gebMby0FP9+HsVZ0LPm3InqNmJr/0inCyE6wV4Pk=; b=avoeMxB0m9VwcjKycIzjpfwBVe
 1GE6Z5kPMdzRnb+5s/vW/QDiJuOHDP1zlFDw4dWfiLsrWei8TnRG/QkhBZX0FbtcLHjU9hpERsymV
 SVkbuNmpJc5bFASVZvyZUdXyGvW5JgahRjcl7Y6vNEnKnloFSK0qud/V3j73gNGAJii8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pPdpv-0008R5-Eu for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Feb 2023 06:21:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B13AAB81C20;
 Wed,  8 Feb 2023 06:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8D2C4339C;
 Wed,  8 Feb 2023 06:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675837296;
 bh=9FKAgPpudsEY1b71O+8Pdv2NPJKqQ94hKa6qzZM+f/E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X2gSotr/T2tuDmj7eKZmGldsLfnOOCW8QnUhI2J1RVyfsgRQkq6H/4aUYesDQqe5u
 p9xk2PzVPdD3+GWILcUbgcq3lYj62oT2jWOjX9pvjpMINlDn9DM8Ba7BMJtgrazy7L
 MQnl1SYZ/1vlQofGYyiIllHv+nQqLWAQJKdkHMJRW0XXpjuq+/53oHp4oNTNvW0uXB
 DGMASFJ6wcbYlRfKN9HQJ83ru/vWVpJ761mzUoHLe2g8zHMOvokUupC6LVJnjhERJI
 HXgyqcAzu02y7ZMxIXGiHqkJumxfzUmZ6lJ7AZurqZgLD7eZw3M/uzoUunaFzn/wNP
 zEVtwiPO+49gw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Tue,  7 Feb 2023 22:21:07 -0800
Message-Id: <20230208062107.199831-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208062107.199831-1-ebiggers@kernel.org>
References: <20230208062107.199831-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Now that
 fscrypt_add_test_dummy_key()
 is only called by setup_file_encryption_key() and not by the individual
 filesystems, 
 un-export it. Also change its prototype to take the fscrypt_key_specifier
 dir [...] 
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pPdpv-0008R5-Eu
Subject: [f2fs-dev] [PATCH 5/5] fscrypt: clean up
 fscrypt_add_test_dummy_key()
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Now that fscrypt_add_test_dummy_key() is only called by
setup_file_encryption_key() and not by the individual filesystems,
un-export it.  Also change its prototype to take the
fscrypt_key_specifier directly, as the caller already has it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fscrypt_private.h |  3 +++
 fs/crypto/keyring.c         | 26 +++++++-------------------
 fs/crypto/keysetup.c        |  4 +---
 include/linux/fscrypt.h     |  9 ---------
 4 files changed, 11 insertions(+), 31 deletions(-)

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 17dd33d9a522e..0fec2dfc36ebe 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -573,6 +573,9 @@ fscrypt_find_master_key(struct super_block *sb,
 int fscrypt_get_test_dummy_key_identifier(
 			  u8 key_identifier[FSCRYPT_KEY_IDENTIFIER_SIZE]);
 
+int fscrypt_add_test_dummy_key(struct super_block *sb,
+			       struct fscrypt_key_specifier *key_spec);
+
 int fscrypt_verify_key_added(struct super_block *sb,
 			     const u8 identifier[FSCRYPT_KEY_IDENTIFIER_SIZE]);
 
diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index 78dd2ff306bd7..78086f8dbda52 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -211,10 +211,6 @@ static int allocate_filesystem_keyring(struct super_block *sb)
  * are still available at this time; this is important because after user file
  * accesses have been allowed, this function may need to evict keys from the
  * keyslots of an inline crypto engine, which requires the block device(s).
- *
- * This is also called when the super_block is being freed.  This is needed to
- * avoid a memory leak if mounting fails after the "test_dummy_encryption"
- * option was processed, as in that case the unmount-time call isn't made.
  */
 void fscrypt_destroy_keyring(struct super_block *sb)
 {
@@ -778,34 +774,26 @@ int fscrypt_get_test_dummy_key_identifier(
 /**
  * fscrypt_add_test_dummy_key() - add the test dummy encryption key
  * @sb: the filesystem instance to add the key to
- * @dummy_policy: the encryption policy for test_dummy_encryption
+ * @key_spec: the key specifier of the test dummy encryption key
  *
- * If needed, add the key for the test_dummy_encryption mount option to the
- * filesystem.  To prevent misuse of this mount option, a per-boot random key is
- * used instead of a hardcoded one.  This makes it so that any encrypted files
- * created using this option won't be accessible after a reboot.
+ * Add the key for the test_dummy_encryption mount option to the filesystem.  To
+ * prevent misuse of this mount option, a per-boot random key is used instead of
+ * a hardcoded one.  This makes it so that any encrypted files created using
+ * this option won't be accessible after a reboot.
  *
  * Return: 0 on success, -errno on failure
  */
 int fscrypt_add_test_dummy_key(struct super_block *sb,
-			       const struct fscrypt_dummy_policy *dummy_policy)
+			       struct fscrypt_key_specifier *key_spec)
 {
-	const union fscrypt_policy *policy = dummy_policy->policy;
-	struct fscrypt_key_specifier key_spec;
 	struct fscrypt_master_key_secret secret;
 	int err;
 
-	if (!policy)
-		return 0;
-	err = fscrypt_policy_to_key_spec(policy, &key_spec);
-	if (err)
-		return err;
 	fscrypt_get_test_dummy_secret(&secret);
-	err = add_master_key(sb, &secret, &key_spec);
+	err = add_master_key(sb, &secret, key_spec);
 	wipe_master_key_secret(&secret);
 	return err;
 }
-EXPORT_SYMBOL_GPL(fscrypt_add_test_dummy_key);
 
 /*
  * Verify that the current user has added a master key with the given identifier
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index 20323c0ba4c5e..aa94fba9d17e7 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -464,9 +464,7 @@ static int setup_file_encryption_key(struct fscrypt_info *ci,
 		 */
 		if (dummy_policy &&
 		    fscrypt_policies_equal(dummy_policy, &ci->ci_policy)) {
-			struct fscrypt_dummy_policy tmp = { dummy_policy };
-
-			err = fscrypt_add_test_dummy_key(sb, &tmp);
+			err = fscrypt_add_test_dummy_key(sb, &mk_spec);
 			if (err)
 				return err;
 			mk = fscrypt_find_master_key(sb, &mk_spec);
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 4f5f8a6512132..44848d870046a 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -309,8 +309,6 @@ fscrypt_free_dummy_policy(struct fscrypt_dummy_policy *dummy_policy)
 /* keyring.c */
 void fscrypt_destroy_keyring(struct super_block *sb);
 int fscrypt_ioctl_add_key(struct file *filp, void __user *arg);
-int fscrypt_add_test_dummy_key(struct super_block *sb,
-			       const struct fscrypt_dummy_policy *dummy_policy);
 int fscrypt_ioctl_remove_key(struct file *filp, void __user *arg);
 int fscrypt_ioctl_remove_key_all_users(struct file *filp, void __user *arg);
 int fscrypt_ioctl_get_key_status(struct file *filp, void __user *arg);
@@ -530,13 +528,6 @@ static inline int fscrypt_ioctl_add_key(struct file *filp, void __user *arg)
 	return -EOPNOTSUPP;
 }
 
-static inline int
-fscrypt_add_test_dummy_key(struct super_block *sb,
-			   const struct fscrypt_dummy_policy *dummy_policy)
-{
-	return 0;
-}
-
 static inline int fscrypt_ioctl_remove_key(struct file *filp, void __user *arg)
 {
 	return -EOPNOTSUPP;
-- 
2.39.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
