Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8A379FE18
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Sep 2023 10:15:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qghVG-0006xh-0a;
	Thu, 14 Sep 2023 08:15:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qghVE-0006xP-7v
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Sep 2023 08:15:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HC/OTlDlVciChmITxRaVOiGo+AzVd6Ej7sPewe3w2nM=; b=QCcTtVWCkY72C2ljrGnhKhEBSZ
 dU3DjKjWbHgwexxruoUJrrztom5Y8BYdLWrAH/dfmvqBy86FncI1VWB32XVuUrU4HFvyM6hSCDxhP
 RZCtCCx1RSBGuRmSNxjigD0OaPupEM9RbXML1mwgs4TaGZYroMqfOHPDZT5w8wi19a+U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HC/OTlDlVciChmITxRaVOiGo+AzVd6Ej7sPewe3w2nM=; b=jLRRIYV66ZFyYSobuyy1kiCmNL
 8yPMU00F9Twsky/2zYIuWGnVJEKLExLPSgdDQKKpD4LxuSfn3gmHRJShYc7Rk+/db09oz+Zw+dUzJ
 /OWnxhvxyQkgiCavHbR/GBw/KCPze1YxBFm8KG01fn9yMqURSvB1x+ckolfSQRLuz1UU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qghV7-005AYt-LS for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Sep 2023 08:15:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C03A5CE21D1;
 Thu, 14 Sep 2023 08:14:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C88CEC433CA;
 Thu, 14 Sep 2023 08:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694679290;
 bh=mYxCTQ86ndfR+rG1ZcbI1ZmUOxowNicifI01Yc/k8I4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LV7fZB0rZqk2cvNIBfNYL2D33oreK0M1zQ1KB8VRklLb8/KFbhnpTkpesrBb/wD5l
 7sUG+9PCGS8EUpen1ZDr8ChULNm2ucgrYD5vXclqazioUfLOVB3vrxaZJ1xkJGOx8e
 gmz1U/gegdppvfSVLPb/dmRZYsU8VTUDcnGgchOhSgVbdjvx9as0+EanPwd+nRhRyd
 SiM83ZWhTex1PD/YlhzByi2wLq+6HzBEkfW51I4DJAu3Vu1FdmocCcUZ4Xec6Jpg3j
 c2cQuygHevgwYOQpSL3dPp7JAWg2eHNgimNJwHeW8XF6LtzZg/e9cZdG+NMfJWRExA
 QoRocWk+jmrfA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Thu, 14 Sep 2023 01:12:51 -0700
Message-ID: <20230914081255.193502-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230914081255.193502-1-ebiggers@kernel.org>
References: <20230914081255.193502-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
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
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qghV7-005AYt-LS
Subject: [f2fs-dev] [PATCH v2 1/5] fscrypt: make it extra clear that
 key_prefix is deprecated
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
it.  Rename the field to 'legacy_key_prefix_for_backcompat' and improve
the documentation to hopefully make it clearer.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/keysetup_v1.c |  5 +++--
 fs/ext4/crypto.c        |  2 +-
 fs/f2fs/super.c         |  2 +-
 fs/ubifs/crypto.c       |  2 +-
 include/linux/fscrypt.h | 14 +++++++++-----
 5 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/fs/crypto/keysetup_v1.c b/fs/crypto/keysetup_v1.c
index 75dabd9b27f9b..df44d0d2d44ea 100644
--- a/fs/crypto/keysetup_v1.c
+++ b/fs/crypto/keysetup_v1.c
@@ -299,6 +299,7 @@ int fscrypt_setup_v1_file_key(struct fscrypt_info *ci, const u8 *raw_master_key)
 
 int fscrypt_setup_v1_file_key_via_subscribed_keyrings(struct fscrypt_info *ci)
 {
+	const struct super_block *sb = ci->ci_inode->i_sb;
 	struct key *key;
 	const struct fscrypt_key *payload;
 	int err;
@@ -306,8 +307,8 @@ int fscrypt_setup_v1_file_key_via_subscribed_keyrings(struct fscrypt_info *ci)
 	key = find_and_lock_process_key(FSCRYPT_KEY_DESC_PREFIX,
 					ci->ci_policy.v1.master_key_descriptor,
 					ci->ci_mode->keysize, &payload);
-	if (key == ERR_PTR(-ENOKEY) && ci->ci_inode->i_sb->s_cop->key_prefix) {
-		key = find_and_lock_process_key(ci->ci_inode->i_sb->s_cop->key_prefix,
+	if (key == ERR_PTR(-ENOKEY) && sb->s_cop->legacy_key_prefix_for_backcompat) {
+		key = find_and_lock_process_key(sb->s_cop->legacy_key_prefix_for_backcompat,
 						ci->ci_policy.v1.master_key_descriptor,
 						ci->ci_mode->keysize, &payload);
 	}
diff --git a/fs/ext4/crypto.c b/fs/ext4/crypto.c
index 453d4da5de520..8cdb7bbc655b0 100644
--- a/fs/ext4/crypto.c
+++ b/fs/ext4/crypto.c
@@ -240,7 +240,7 @@ static void ext4_get_ino_and_lblk_bits(struct super_block *sb,
 }
 
 const struct fscrypt_operations ext4_cryptops = {
-	.key_prefix		= "ext4:",
+	.legacy_key_prefix_for_backcompat = "ext4:",
 	.get_context		= ext4_get_context,
 	.set_context		= ext4_set_context,
 	.get_dummy_policy	= ext4_get_dummy_policy,
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index a8c8232852bb1..8de799a8bad04 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3231,7 +3231,7 @@ static struct block_device **f2fs_get_devices(struct super_block *sb,
 }
 
 static const struct fscrypt_operations f2fs_cryptops = {
-	.key_prefix		= "f2fs:",
+	.legacy_key_prefix_for_backcompat = "f2fs:",
 	.get_context		= f2fs_get_context,
 	.set_context		= f2fs_set_context,
 	.get_dummy_policy	= f2fs_get_dummy_policy,
diff --git a/fs/ubifs/crypto.c b/fs/ubifs/crypto.c
index 3125e76376ee6..fab90f9a8eaff 100644
--- a/fs/ubifs/crypto.c
+++ b/fs/ubifs/crypto.c
@@ -89,7 +89,7 @@ int ubifs_decrypt(const struct inode *inode, struct ubifs_data_node *dn,
 
 const struct fscrypt_operations ubifs_crypt_operations = {
 	.flags			= FS_CFLG_OWN_PAGES,
-	.key_prefix		= "ubifs:",
+	.legacy_key_prefix_for_backcompat = "ubifs:",
 	.get_context		= ubifs_crypt_get_context,
 	.set_context		= ubifs_crypt_set_context,
 	.empty_dir		= ubifs_crypt_empty_dir,
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index c895b12737a19..70e0d4917dd59 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -73,12 +73,16 @@ struct fscrypt_operations {
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
+	const char *legacy_key_prefix_for_backcompat;
 
 	/*
 	 * Get the fscrypt context of the given inode.
-- 
2.42.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
