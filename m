Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F0D791FD2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Sep 2023 03:04:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qdKUk-0003s6-7Q;
	Tue, 05 Sep 2023 01:04:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qdKUj-0003rt-4o
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Sep 2023 01:04:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K5cb6BPbXm0wLW7eAgabyy6UJuFo+ON8U7dHWNynHkw=; b=U8L83OTwTxVN0VGIbYJR3jtfIg
 CsyiTfg0SxUnWpRwwjNeoZS2rBdrVTaUzA/bVOpr4s+tlxSD0zrFDeufQB6TVxtK+EJPVrbXRUetg
 jP/S6gARlDn2oTOMC1EwmA7+8/CbQUZnlq4gOYiYTPvdHtx/fe23qsLUbIlemoCBFzig=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K5cb6BPbXm0wLW7eAgabyy6UJuFo+ON8U7dHWNynHkw=; b=aO9KttFuLc+XkXkWWP9qeIlfl9
 +3iBYZ6XNzsTfhRTqMnarFT8e7LopS1ZZ7FnOCg1zqZKEUCc/bxqVNWNNhLdfitDnNJlzoxbxHwbK
 VSkVKH++7EPAjQ8eD9ZkJoRu4HoHgB5kk+pgsrrBbyQgGvP3h5d36d2C02+S7qkNR6lA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qdKUe-009lle-EH for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Sep 2023 01:04:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DCF57B81059
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  5 Sep 2023 01:04:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53823C433CC;
 Tue,  5 Sep 2023 01:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693875867;
 bh=ZD+Z0ymC6v+NTgD8Io2pUOkKRPb7xF1w6LxtCKdRREU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k5Ywg0BWZ9QNcRcFSQLFqhYxn6yBSHXSk/gg6rAoBOoiF9PYiOSNYl6NPK0GJFPTh
 cvv6WlnIsA8NJ4Au0a19Ya4r/lzv64+t9HxEr/59HiggwZNKodlpiblrPqFstn+kxm
 eYyUDqdfvmfqMcg4udD+EfYRwEhHuZ+tqE3fH15R352YL78Nr59OaA2m0JwcVFJyZK
 8xTUQrCj6mEY3yjt9OVUsbbPPLzuY9vo+ATi40uLljMAW/nvicYPMi+RdJYBRK5e6s
 j1LaPmAljyIHEVI0N63gDH9AQlt37u+ZIh+TH2HHYg7P7I8q1Qdmrrd6PE7uPmUFhD
 Uk1NTiFUTF+/Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon,  4 Sep 2023 17:58:29 -0700
Message-ID: <20230905005830.365985-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230905005830.365985-1-ebiggers@kernel.org>
References: <20230905005830.365985-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Now that fs/crypto/
 computes the filesystem's lblk_bits from its maximum file size, it is no
 longer necessary for filesystems to provide lblk_bits via
 fscrypt_operations::get_ino_and_lblk_bits.
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qdKUe-009lle-EH
Subject: [f2fs-dev] [PATCH 4/5] fscrypt: replace get_ino_and_lblk_bits with
 just has_32bit_inodes
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
 linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Now that fs/crypto/ computes the filesystem's lblk_bits from its maximum
file size, it is no longer necessary for filesystems to provide
lblk_bits via fscrypt_operations::get_ino_and_lblk_bits.

It is still necessary for fs/crypto/ to retrieve ino_bits from the
filesystem.  However, this is used only to decide whether inode numbers
fit in 32 bits.  Also, ino_bits is static for all relevant filesystems,
i.e. it doesn't depend on the filesystem instance.

Therefore, in the interest of keeping things as simple as possible,
replace 'get_ino_and_lblk_bits' with a flag 'has_32bit_inodes'.  This
can always be changed back to a function if a filesystem needs it to be
dynamic, but for now a static flag is all that's needed.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/policy.c      | 33 +++++++++++++++------------------
 fs/ext4/crypto.c        |  9 +--------
 fs/f2fs/super.c         |  9 +--------
 include/linux/fscrypt.h | 26 +++++++++++---------------
 4 files changed, 28 insertions(+), 49 deletions(-)

diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index 36bffc4d6228d..c8072a634af8f 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -118,11 +118,11 @@ static bool supported_direct_key_modes(const struct inode *inode,
 }
 
 static bool supported_iv_ino_lblk_policy(const struct fscrypt_policy_v2 *policy,
-					 const struct inode *inode,
-					 const char *type, int max_ino_bits)
+					 const struct inode *inode)
 {
+	const char *type = (policy->flags & FSCRYPT_POLICY_FLAG_IV_INO_LBLK_64)
+				? "IV_INO_LBLK_64" : "IV_INO_LBLK_32";
 	struct super_block *sb = inode->i_sb;
-	int ino_bits = 64, lblk_bits = 64;
 
 	/*
 	 * IV_INO_LBLK_* exist only because of hardware limitations, and
@@ -149,9 +149,15 @@ static bool supported_iv_ino_lblk_policy(const struct fscrypt_policy_v2 *policy,
 			     type, sb->s_id);
 		return false;
 	}
-	if (sb->s_cop->get_ino_and_lblk_bits)
-		sb->s_cop->get_ino_and_lblk_bits(sb, &ino_bits, &lblk_bits);
-	if (ino_bits > max_ino_bits) {
+
+	/*
+	 * IV_INO_LBLK_64 requires that inode numbers fit in 32 bits.
+	 * IV_INO_LBLK_32 hashes the inode number, so in principle it can
+	 * support any length; however, currently the inode number is gotten
+	 * from inode::i_ino which is 'unsigned long'.  So for now the
+	 * implementation limit is 32 bits, the same as IV_INO_LBLK_64.
+	 */
+	if (!sb->s_cop->has_32bit_inodes) {
 		fscrypt_warn(inode,
 			     "Can't use %s policy on filesystem '%s' because its maximum inode number is too large",
 			     type, sb->s_id);
@@ -242,18 +248,9 @@ static bool fscrypt_supported_v2_policy(const struct fscrypt_policy_v2 *policy,
 					policy->filenames_encryption_mode))
 		return false;
 
-	if ((policy->flags & FSCRYPT_POLICY_FLAG_IV_INO_LBLK_64) &&
-	    !supported_iv_ino_lblk_policy(policy, inode, "IV_INO_LBLK_64", 32))
-		return false;
-
-	/*
-	 * IV_INO_LBLK_32 hashes the inode number, so in principle it can
-	 * support any ino_bits.  However, currently the inode number is gotten
-	 * from inode::i_ino which is 'unsigned long'.  So for now the
-	 * implementation limit is 32 bits.
-	 */
-	if ((policy->flags & FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32) &&
-	    !supported_iv_ino_lblk_policy(policy, inode, "IV_INO_LBLK_32", 32))
+	if ((policy->flags & (FSCRYPT_POLICY_FLAG_IV_INO_LBLK_64 |
+			      FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32)) &&
+	    !supported_iv_ino_lblk_policy(policy, inode))
 		return false;
 
 	if (memchr_inv(policy->__reserved, 0, sizeof(policy->__reserved))) {
diff --git a/fs/ext4/crypto.c b/fs/ext4/crypto.c
index a9221be67f2a7..2859d9569aa74 100644
--- a/fs/ext4/crypto.c
+++ b/fs/ext4/crypto.c
@@ -232,20 +232,13 @@ static bool ext4_has_stable_inodes(struct super_block *sb)
 	return ext4_has_feature_stable_inodes(sb);
 }
 
-static void ext4_get_ino_and_lblk_bits(struct super_block *sb,
-				       int *ino_bits_ret, int *lblk_bits_ret)
-{
-	*ino_bits_ret = 8 * sizeof(EXT4_SB(sb)->s_es->s_inodes_count);
-	*lblk_bits_ret = 8 * sizeof(ext4_lblk_t);
-}
-
 const struct fscrypt_operations ext4_cryptops = {
 	.needs_bounce_pages	= 1,
+	.has_32bit_inodes	= 1,
 	.legacy_key_prefix_for_backcompat = "ext4:",
 	.get_context		= ext4_get_context,
 	.set_context		= ext4_set_context,
 	.get_dummy_policy	= ext4_get_dummy_policy,
 	.empty_dir		= ext4_empty_dir,
 	.has_stable_inodes	= ext4_has_stable_inodes,
-	.get_ino_and_lblk_bits	= ext4_get_ino_and_lblk_bits,
 };
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 276535af5bf3c..7e8e510ef77af 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3203,13 +3203,6 @@ static bool f2fs_has_stable_inodes(struct super_block *sb)
 	return true;
 }
 
-static void f2fs_get_ino_and_lblk_bits(struct super_block *sb,
-				       int *ino_bits_ret, int *lblk_bits_ret)
-{
-	*ino_bits_ret = 8 * sizeof(nid_t);
-	*lblk_bits_ret = 8 * sizeof(block_t);
-}
-
 static struct block_device **f2fs_get_devices(struct super_block *sb,
 					      unsigned int *num_devs)
 {
@@ -3232,13 +3225,13 @@ static struct block_device **f2fs_get_devices(struct super_block *sb,
 
 static const struct fscrypt_operations f2fs_cryptops = {
 	.needs_bounce_pages	= 1,
+	.has_32bit_inodes	= 1,
 	.legacy_key_prefix_for_backcompat = "f2fs:",
 	.get_context		= f2fs_get_context,
 	.set_context		= f2fs_set_context,
 	.get_dummy_policy	= f2fs_get_dummy_policy,
 	.empty_dir		= f2fs_empty_dir,
 	.has_stable_inodes	= f2fs_has_stable_inodes,
-	.get_ino_and_lblk_bits	= f2fs_get_ino_and_lblk_bits,
 	.get_devices		= f2fs_get_devices,
 };
 #endif
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index ac684f688d488..fb2a74e618a11 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -73,6 +73,17 @@ struct fscrypt_operations {
 	 */
 	unsigned int needs_bounce_pages : 1;
 
+	/*
+	 * If set, then fs/crypto/ will allow the use of encryption settings
+	 * that assume inode numbers fit in 32 bits (i.e.
+	 * FSCRYPT_POLICY_FLAG_IV_INO_LBLK_{32,64}), provided that the other
+	 * prerequisites for these settings are also met.  This is only useful
+	 * if the filesystem wants to support inline encryption hardware that is
+	 * limited to 32-bit or 64-bit data unit numbers and where programming
+	 * keyslots is very slow.
+	 */
+	unsigned int has_32bit_inodes : 1;
+
 	/*
 	 * This field exists only for backwards compatibility reasons and should
 	 * only be set by the filesystems that are setting it already.  It
@@ -150,21 +161,6 @@ struct fscrypt_operations {
 	 */
 	bool (*has_stable_inodes)(struct super_block *sb);
 
-	/*
-	 * Get the number of bits that the filesystem uses to represent inode
-	 * numbers and file logical block numbers.
-	 *
-	 * By default, both of these are assumed to be 64-bit.  This function
-	 * can be implemented to declare that either or both of these numbers is
-	 * shorter, which may allow the use of the
-	 * FSCRYPT_POLICY_FLAG_IV_INO_LBLK_{32,64} flags and/or the use of
-	 * inline crypto hardware whose maximum DUN length is less than 64 bits
-	 * (e.g., eMMC v5.2 spec compliant hardware).  This function only needs
-	 * to be implemented if support for one of these features is needed.
-	 */
-	void (*get_ino_and_lblk_bits)(struct super_block *sb,
-				      int *ino_bits_ret, int *lblk_bits_ret);
-
 	/*
 	 * Return an array of pointers to the block devices to which the
 	 * filesystem may write encrypted file contents, NULL if the filesystem
-- 
2.42.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
