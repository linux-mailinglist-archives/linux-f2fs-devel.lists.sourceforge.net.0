Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5D87ACFBD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Sep 2023 07:59:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qkeci-0002NF-TG;
	Mon, 25 Sep 2023 05:59:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qkecg-0002My-Ef
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Sep 2023 05:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qNAKr2mV5AJ58RSIU3VqiAv4vHbEYRZDhlpGSTrADx4=; b=QaNFom3IQUO5Ip5AtTNcDg7lGo
 yRY83ifRaZ/hmurTH2m7Duw23gdEnMTm7Z7muxZAYFRv7g0zlYndr5ZDuQOlRxyuzveKJe+C3tQzD
 XCfitDFu3yj5G5UkELHQJ2bTU7SNJysYYMIwX/ZNELia5UeluXwuy/VaTi67jVf1SiYc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qNAKr2mV5AJ58RSIU3VqiAv4vHbEYRZDhlpGSTrADx4=; b=JEw5nAiUWweIMe/75xTpE9Unyw
 TMuAS6IzazGAXecjruP6qmj7e8yL1eGWq4szmcRXFJD/xH2pT0QtVFvMtDaJ7vrBWgFojSTMJt9Ta
 03weUxk7xPP2pSpiS+MdVm+MabyjMr62mXecLXWyA6vjacMzaSx85Q3647fNqo8ys+8Y=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qkecf-0000QM-1N for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Sep 2023 05:59:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 73602CE0E2D;
 Mon, 25 Sep 2023 05:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8020DC433C8;
 Mon, 25 Sep 2023 05:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695621538;
 bh=idiVzlkasc6EOKYjPFwNaxxpxVhmkIQdbuE4cRL0Tzs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qd9ipEV70X7+ByaaCBd7HAb+BHhngMqY7dpRA/jPvTYup4xniVJ91BMtXoo5Sr35f
 6ONvHB4Yw2HGU9DRLYDTcdhq033DvfAPl4w90ommQ9+5w0dZRhTR0+3DMQ9vB7hue5
 8wo/OJb2lAf0B0Jp74s8nVrYNXjTqWO3vXQ/IxIIaKyR5WsTK4BTo88HrCyxXDwapK
 T6FMGs+vM0hSUM/LF4ERbrlSapj8atL5o1cLkPg6BUG5dVKN26Wg7TMz36/D/c6Xhm
 S4QVUJAR5/Fu8d/OlogAZo5LmHB6l0P2tqTRZ0GTMeKgaP8gwJtkaN+IpgFSAJ7knu
 Qy72UYYc6vkoQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Sun, 24 Sep 2023 22:54:47 -0700
Message-ID: <20230925055451.59499-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230925055451.59499-1-ebiggers@kernel.org>
References: <20230925055451.59499-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com>
 fscrypt_operations::key_prefix
 should not be set by any filesystems that aren't setting it already. This
 is already documented, but apparently it's not sufficiently clear, as both
 ceph and btrfs have [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qkecf-0000QM-1N
Subject: [f2fs-dev] [PATCH v3 1/5] fscrypt: make it clearer that key_prefix
 is deprecated
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

fscrypt_operations::key_prefix should not be set by any filesystems that
aren't setting it already.  This is already documented, but apparently
it's not sufficiently clear, as both ceph and btrfs have tried to set
it.  Rename the field to legacy_key_prefix and improve the documentation
to hopefully make it clearer.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/keysetup_v1.c |  5 +++--
 fs/ext4/crypto.c        |  2 +-
 fs/f2fs/super.c         |  2 +-
 fs/ubifs/crypto.c       |  2 +-
 include/linux/fscrypt.h | 14 +++++++++-----
 5 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/fs/crypto/keysetup_v1.c b/fs/crypto/keysetup_v1.c
index 75dabd9b27f9b..86b48a2b47d1b 100644
--- a/fs/crypto/keysetup_v1.c
+++ b/fs/crypto/keysetup_v1.c
@@ -292,29 +292,30 @@ static int setup_v1_file_key_derived(struct fscrypt_info *ci,
 int fscrypt_setup_v1_file_key(struct fscrypt_info *ci, const u8 *raw_master_key)
 {
 	if (ci->ci_policy.v1.flags & FSCRYPT_POLICY_FLAG_DIRECT_KEY)
 		return setup_v1_file_key_direct(ci, raw_master_key);
 	else
 		return setup_v1_file_key_derived(ci, raw_master_key);
 }
 
 int fscrypt_setup_v1_file_key_via_subscribed_keyrings(struct fscrypt_info *ci)
 {
+	const struct super_block *sb = ci->ci_inode->i_sb;
 	struct key *key;
 	const struct fscrypt_key *payload;
 	int err;
 
 	key = find_and_lock_process_key(FSCRYPT_KEY_DESC_PREFIX,
 					ci->ci_policy.v1.master_key_descriptor,
 					ci->ci_mode->keysize, &payload);
-	if (key == ERR_PTR(-ENOKEY) && ci->ci_inode->i_sb->s_cop->key_prefix) {
-		key = find_and_lock_process_key(ci->ci_inode->i_sb->s_cop->key_prefix,
+	if (key == ERR_PTR(-ENOKEY) && sb->s_cop->legacy_key_prefix) {
+		key = find_and_lock_process_key(sb->s_cop->legacy_key_prefix,
 						ci->ci_policy.v1.master_key_descriptor,
 						ci->ci_mode->keysize, &payload);
 	}
 	if (IS_ERR(key))
 		return PTR_ERR(key);
 
 	err = fscrypt_setup_v1_file_key(ci, payload->raw);
 	up_read(&key->sem);
 	key_put(key);
 	return err;
diff --git a/fs/ext4/crypto.c b/fs/ext4/crypto.c
index 453d4da5de520..99a4769a53f63 100644
--- a/fs/ext4/crypto.c
+++ b/fs/ext4/crypto.c
@@ -233,18 +233,18 @@ static bool ext4_has_stable_inodes(struct super_block *sb)
 }
 
 static void ext4_get_ino_and_lblk_bits(struct super_block *sb,
 				       int *ino_bits_ret, int *lblk_bits_ret)
 {
 	*ino_bits_ret = 8 * sizeof(EXT4_SB(sb)->s_es->s_inodes_count);
 	*lblk_bits_ret = 8 * sizeof(ext4_lblk_t);
 }
 
 const struct fscrypt_operations ext4_cryptops = {
-	.key_prefix		= "ext4:",
+	.legacy_key_prefix	= "ext4:",
 	.get_context		= ext4_get_context,
 	.set_context		= ext4_set_context,
 	.get_dummy_policy	= ext4_get_dummy_policy,
 	.empty_dir		= ext4_empty_dir,
 	.has_stable_inodes	= ext4_has_stable_inodes,
 	.get_ino_and_lblk_bits	= ext4_get_ino_and_lblk_bits,
 };
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index a8c8232852bb1..f60062b558fd1 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3224,21 +3224,21 @@ static struct block_device **f2fs_get_devices(struct super_block *sb,
 	if (!devs)
 		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; i < sbi->s_ndevs; i++)
 		devs[i] = FDEV(i).bdev;
 	*num_devs = sbi->s_ndevs;
 	return devs;
 }
 
 static const struct fscrypt_operations f2fs_cryptops = {
-	.key_prefix		= "f2fs:",
+	.legacy_key_prefix	= "f2fs:",
 	.get_context		= f2fs_get_context,
 	.set_context		= f2fs_set_context,
 	.get_dummy_policy	= f2fs_get_dummy_policy,
 	.empty_dir		= f2fs_empty_dir,
 	.has_stable_inodes	= f2fs_has_stable_inodes,
 	.get_ino_and_lblk_bits	= f2fs_get_ino_and_lblk_bits,
 	.get_devices		= f2fs_get_devices,
 };
 #endif
 
diff --git a/fs/ubifs/crypto.c b/fs/ubifs/crypto.c
index 3125e76376ee6..1be3e11da3b3e 100644
--- a/fs/ubifs/crypto.c
+++ b/fs/ubifs/crypto.c
@@ -82,15 +82,15 @@ int ubifs_decrypt(const struct inode *inode, struct ubifs_data_node *dn,
 		ubifs_err(c, "fscrypt_decrypt_block_inplace() failed: %d", err);
 		return err;
 	}
 	*out_len = clen;
 
 	return 0;
 }
 
 const struct fscrypt_operations ubifs_crypt_operations = {
 	.flags			= FS_CFLG_OWN_PAGES,
-	.key_prefix		= "ubifs:",
+	.legacy_key_prefix	= "ubifs:",
 	.get_context		= ubifs_crypt_get_context,
 	.set_context		= ubifs_crypt_set_context,
 	.empty_dir		= ubifs_crypt_empty_dir,
 };
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index c895b12737a19..b0037566ce308 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -66,26 +66,30 @@ struct fscrypt_name {
  */
 #define FS_CFLG_OWN_PAGES (1U << 1)
 
 /* Crypto operations for filesystems */
 struct fscrypt_operations {
 
 	/* Set of optional flags; see above for allowed flags */
 	unsigned int flags;
 
 	/*
-	 * If set, this is a filesystem-specific key description prefix that
-	 * will be accepted for "logon" keys for v1 fscrypt policies, in
-	 * addition to the generic prefix "fscrypt:".  This functionality is
-	 * deprecated, so new filesystems shouldn't set this field.
+	 * This field exists only for backwards compatibility reasons and should
+	 * only be set by the filesystems that are setting it already.  It
+	 * contains the filesystem-specific key description prefix that is
+	 * accepted for "logon" keys for v1 fscrypt policies.  This
+	 * functionality is deprecated in favor of the generic prefix
+	 * "fscrypt:", which itself is deprecated in favor of the filesystem
+	 * keyring ioctls such as FS_IOC_ADD_ENCRYPTION_KEY.  Filesystems that
+	 * are newly adding fscrypt support should not set this field.
 	 */
-	const char *key_prefix;
+	const char *legacy_key_prefix;
 
 	/*
 	 * Get the fscrypt context of the given inode.
 	 *
 	 * @inode: the inode whose context to get
 	 * @ctx: the buffer into which to get the context
 	 * @len: length of the @ctx buffer in bytes
 	 *
 	 * Return: On success, returns the length of the context in bytes; this
 	 *	   may be less than @len.  On failure, returns -ENODATA if the

base-commit: 6465e260f48790807eef06b583b38ca9789b6072
-- 
2.42.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
