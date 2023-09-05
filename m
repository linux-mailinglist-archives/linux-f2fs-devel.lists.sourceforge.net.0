Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F51D791FD3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Sep 2023 03:04:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qdKUk-0003sF-JA;
	Tue, 05 Sep 2023 01:04:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qdKUj-0003rw-GZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Sep 2023 01:04:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9V54Y4Ekd+dGSKb1dg7S8e1d86fnqpDdznVsLu8apy4=; b=LQmGqHBIyNRCjvySXjhlIutaOE
 Gip3+cJzxkkmMi8HR5RiWP9iBw5V8S12qrJShIEDOhz06uCcZb9x/rjSFAINWiDtEM89p8Xb1T8h0
 o5BYBjDMXGQHSFd171W1QQcDSg5e4rFjnwTRPCb98ewRD7UzSHdBYoilz2DCXFccBvnE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9V54Y4Ekd+dGSKb1dg7S8e1d86fnqpDdznVsLu8apy4=; b=GHFKS0tDpFFpGjKoOmo5avidWW
 daePEMdEQ+EDati1xAHdiYX8XL8qxBQ1hs/jg1laxUr+y1FXw6D+96A+XQVmHTXJnraEC+PcRvsAr
 NuOxYFhhVHWxFoVHW0PnQPdcNs98uHqYThYXkXdOAJtETtd3SwVzN1siOD1i56VkllGY=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qdKUf-00048y-Rd for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Sep 2023 01:04:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id CA5C7CE0ABD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  5 Sep 2023 01:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07982C433CB;
 Tue,  5 Sep 2023 01:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693875867;
 bh=p3a2uN2tAZ707/skilVDeTRZvcvkaY5rfhOHvxATwY4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qhSgUiDXOmH5Kx+vNSNz1ej2NRNKMmxVC/mq7cJ51DmM+5XXRhsdFtzzv0YzM+5gw
 3U0zAVJnbS6PPaA6vlwpMWbdE0TdVZVq0zPdq2SrLJrq1ZM4HAcAjy+JyXtVy7fLAP
 9S9P92FIim1IzWNg46D3qXyDJC0pFLc/NE3uSAXCoOjt5gKFIfjXQXS7WFy+LlJT+J
 FmHXZI3nvb07FxhZows1ecXWcx/v/aAXH0eqTytqRm4/Jv82sCdxokgSI0btL7KpE1
 Vgt/ToAQZ9AefDXFqxuuwbOEiJBgbu2lZ4v1uUxAXhtXM1r+udnXl+f2CK0Qb8uG9C
 iaPlGmN+oFR1Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon,  4 Sep 2023 17:58:28 -0700
Message-ID: <20230905005830.365985-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230905005830.365985-1-ebiggers@kernel.org>
References: <20230905005830.365985-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> For a given
 filesystem, 
 the number of bits used by the maximum file logical block number is computable
 from the maximum file size and block size. These values are always present
 in struct super_block. [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qdKUf-00048y-Rd
Subject: [f2fs-dev] [PATCH 3/5] fscrypt: use s_maxbytes instead of
 filesystem lblk_bits
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

For a given filesystem, the number of bits used by the maximum file
logical block number is computable from the maximum file size and block
size.  These values are always present in struct super_block.
Therefore, compute it this way instead of using the value from
fscrypt_operations::get_ino_and_lblk_bits.  Since filesystems always
have to set the super_block fields anyway, this avoids having to provide
this information redundantly via fscrypt_operations.

This change is in preparation for adding support for sub-block data
units.  For that, the value that is needed will become "the maximum file
data unit number".  A hardcoded value won't suffice for that; it will
need to be computed anyway.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fscrypt_private.h | 10 ++++++++++
 fs/crypto/inline_crypt.c    |  7 ++-----
 fs/crypto/policy.c          | 20 +++++++++++---------
 3 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 2d63da48635ab..4b113214b53af 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -296,6 +296,16 @@ union fscrypt_iv {
 void fscrypt_generate_iv(union fscrypt_iv *iv, u64 lblk_num,
 			 const struct fscrypt_info *ci);
 
+/*
+ * Return the number of bits used by the maximum file logical block number that
+ * is possible on the given filesystem.
+ */
+static inline int
+fscrypt_max_file_lblk_bits(const struct super_block *sb)
+{
+	return fls64(sb->s_maxbytes - 1) - sb->s_blocksize_bits;
+}
+
 /* fname.c */
 bool __fscrypt_fname_encrypted_size(const union fscrypt_policy *policy,
 				    u32 orig_len, u32 max_len,
diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index 8bfb3ce864766..7d9f6c167de58 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -41,9 +41,8 @@ static struct block_device **fscrypt_get_devices(struct super_block *sb,
 
 static unsigned int fscrypt_get_dun_bytes(const struct fscrypt_info *ci)
 {
-	struct super_block *sb = ci->ci_inode->i_sb;
+	const struct super_block *sb = ci->ci_inode->i_sb;
 	unsigned int flags = fscrypt_policy_flags(&ci->ci_policy);
-	int ino_bits = 64, lblk_bits = 64;
 
 	if (flags & FSCRYPT_POLICY_FLAG_DIRECT_KEY)
 		return offsetofend(union fscrypt_iv, nonce);
@@ -55,9 +54,7 @@ static unsigned int fscrypt_get_dun_bytes(const struct fscrypt_info *ci)
 		return sizeof(__le32);
 
 	/* Default case: IVs are just the file logical block number */
-	if (sb->s_cop->get_ino_and_lblk_bits)
-		sb->s_cop->get_ino_and_lblk_bits(sb, &ino_bits, &lblk_bits);
-	return DIV_ROUND_UP(lblk_bits, 8);
+	return DIV_ROUND_UP(fscrypt_max_file_lblk_bits(sb), 8);
 }
 
 /*
diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index f4456ecb3f877..36bffc4d6228d 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -119,8 +119,7 @@ static bool supported_direct_key_modes(const struct inode *inode,
 
 static bool supported_iv_ino_lblk_policy(const struct fscrypt_policy_v2 *policy,
 					 const struct inode *inode,
-					 const char *type,
-					 int max_ino_bits, int max_lblk_bits)
+					 const char *type, int max_ino_bits)
 {
 	struct super_block *sb = inode->i_sb;
 	int ino_bits = 64, lblk_bits = 64;
@@ -154,13 +153,18 @@ static bool supported_iv_ino_lblk_policy(const struct fscrypt_policy_v2 *policy,
 		sb->s_cop->get_ino_and_lblk_bits(sb, &ino_bits, &lblk_bits);
 	if (ino_bits > max_ino_bits) {
 		fscrypt_warn(inode,
-			     "Can't use %s policy on filesystem '%s' because its inode numbers are too long",
+			     "Can't use %s policy on filesystem '%s' because its maximum inode number is too large",
 			     type, sb->s_id);
 		return false;
 	}
-	if (lblk_bits > max_lblk_bits) {
+
+	/*
+	 * IV_INO_LBLK_64 and IV_INO_LBLK_32 both require that file logical
+	 * block numbers fit in 32 bits.
+	 */
+	if (fscrypt_max_file_lblk_bits(sb) > 32) {
 		fscrypt_warn(inode,
-			     "Can't use %s policy on filesystem '%s' because its block numbers are too long",
+			     "Can't use %s policy on filesystem '%s' because its maximum file size is too large",
 			     type, sb->s_id);
 		return false;
 	}
@@ -239,8 +243,7 @@ static bool fscrypt_supported_v2_policy(const struct fscrypt_policy_v2 *policy,
 		return false;
 
 	if ((policy->flags & FSCRYPT_POLICY_FLAG_IV_INO_LBLK_64) &&
-	    !supported_iv_ino_lblk_policy(policy, inode, "IV_INO_LBLK_64",
-					  32, 32))
+	    !supported_iv_ino_lblk_policy(policy, inode, "IV_INO_LBLK_64", 32))
 		return false;
 
 	/*
@@ -250,8 +253,7 @@ static bool fscrypt_supported_v2_policy(const struct fscrypt_policy_v2 *policy,
 	 * implementation limit is 32 bits.
 	 */
 	if ((policy->flags & FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32) &&
-	    !supported_iv_ino_lblk_policy(policy, inode, "IV_INO_LBLK_32",
-					  32, 32))
+	    !supported_iv_ino_lblk_policy(policy, inode, "IV_INO_LBLK_32", 32))
 		return false;
 
 	if (memchr_inv(policy->__reserved, 0, sizeof(policy->__reserved))) {
-- 
2.42.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
