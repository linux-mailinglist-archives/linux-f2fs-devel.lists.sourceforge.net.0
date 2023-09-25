Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 651667ACFBA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Sep 2023 07:59:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qkeck-0004rk-58;
	Mon, 25 Sep 2023 05:59:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qkecg-0004rX-91
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Sep 2023 05:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JfsobkT5qArxLhr2VgQoefLetqHbgORr8Ux5upiwXWU=; b=dE1bGSr9fdbXbZ8GwUSP8d0hFv
 /ZlmQDplVP01nlywDt4uuDaS8/wimrJlLp3C/e8vNxgyZFKg1H6vYoDc0M3wwyZqCtmK7OHCkSL+/
 Htq9q8m5skaytOwn6vaMCYiT/w5XA3h1VBe/cCStJRuHcbbH2Srh68WFQqG4cmAqUFJk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JfsobkT5qArxLhr2VgQoefLetqHbgORr8Ux5upiwXWU=; b=NVadYQObEbSr6qn112J33gMa/B
 FYSZcMGfkBcQTLNq/ZfB322jNI+uwzJninjG8R/f+eUs8Mw6RNa0UqtcbfkcLXAC7diunm3oeo6DZ
 wYuh72KqftlJaUsApxt179JfcfjI6UoOQneByGN3IUdsbEeGV2R0yn9WWl/1JtPQ1Ct4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qkece-005UJk-Cn for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 25 Sep 2023 05:59:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B6BA860ED0;
 Mon, 25 Sep 2023 05:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A6ABC433CD;
 Mon, 25 Sep 2023 05:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695621539;
 bh=h8mTMAMQf4YlUJQ0ORVBKrImlVjE8z0fmjJV3yhH3u0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VbrDtfveGzBd60l2zP1eylFWyZPHZ/e6eVdAJ7HMHU6gOXEqB+AVjDS0ig218A7hn
 Zv873VDPSfQAOryryncPcPhJufNjEvtkgvlVwfZHwxE8hSDJ0JGPbqu+V6TjVGLyD+
 s7t+LkNB35eNqEAfjzPJcoG66J3ikLRjP0MXFi/3SZDm2joIlm09ZfkgEh+lYTn4Q4
 F9O27i/e43tmGRbnsFv6Z4RmPMBffpG+1oPQlV0CwU7OmolEkdF0WRQxv3DtvGc+T/
 ahSzuM0nf5Rka5sIMJ07wpS4SXTmWBuuMpt2C6UJZyTyu92Bz1r/70FchXhDa5Y2Ig
 VT6CHK9qQfiTQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Sun, 24 Sep 2023 22:54:49 -0700
Message-ID: <20230925055451.59499-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230925055451.59499-1-ebiggers@kernel.org>
References: <20230925055451.59499-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> For a given
 filesystem, 
 the number of bits used by the maximum file logical block number is computable
 from the maximum file size and block size. These values are always present
 in struct super_block. [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
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
X-Headers-End: 1qkece-005UJk-Cn
Subject: [f2fs-dev] [PATCH v3 3/5] fscrypt: compute max_lblk_bits from
 s_maxbytes and block size
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

For a given filesystem, the number of bits used by the maximum file
logical block number is computable from the maximum file size and block
size.  These values are always present in struct super_block.
Therefore, compute it this way instead of using the value from
fscrypt_operations::get_ino_and_lblk_bits.  Since filesystems always
have to set the super_block fields anyway, this avoids having to provide
this information redundantly via fscrypt_operations.

This change is in preparation for adding support for sub-block data
units.  For that, the value that is needed will become "the maximum file
data unit index".  A hardcoded value won't suffice for that; it will
need to be computed anyway.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fscrypt_private.h | 10 ++++++++++
 fs/crypto/inline_crypt.c    |  7 ++-----
 fs/crypto/policy.c          | 18 ++++++++++--------
 3 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 2d63da48635ab..4b113214b53af 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -289,20 +289,30 @@ union fscrypt_iv {
 		/* per-file nonce; only set in DIRECT_KEY mode */
 		u8 nonce[FSCRYPT_FILE_NONCE_SIZE];
 	};
 	u8 raw[FSCRYPT_MAX_IV_SIZE];
 	__le64 dun[FSCRYPT_MAX_IV_SIZE / sizeof(__le64)];
 };
 
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
 				    u32 *encrypted_len_ret);
 
 /* hkdf.c */
 struct fscrypt_hkdf {
 	struct crypto_shash *hmac_tfm;
 };
 
diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index 8bfb3ce864766..7d9f6c167de58 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -34,37 +34,34 @@ static struct block_device **fscrypt_get_devices(struct super_block *sb,
 	devs = kmalloc(sizeof(*devs), GFP_KERNEL);
 	if (!devs)
 		return ERR_PTR(-ENOMEM);
 	devs[0] = sb->s_bdev;
 	*num_devs = 1;
 	return devs;
 }
 
 static unsigned int fscrypt_get_dun_bytes(const struct fscrypt_info *ci)
 {
-	struct super_block *sb = ci->ci_inode->i_sb;
+	const struct super_block *sb = ci->ci_inode->i_sb;
 	unsigned int flags = fscrypt_policy_flags(&ci->ci_policy);
-	int ino_bits = 64, lblk_bits = 64;
 
 	if (flags & FSCRYPT_POLICY_FLAG_DIRECT_KEY)
 		return offsetofend(union fscrypt_iv, nonce);
 
 	if (flags & FSCRYPT_POLICY_FLAG_IV_INO_LBLK_64)
 		return sizeof(__le64);
 
 	if (flags & FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32)
 		return sizeof(__le32);
 
 	/* Default case: IVs are just the file logical block number */
-	if (sb->s_cop->get_ino_and_lblk_bits)
-		sb->s_cop->get_ino_and_lblk_bits(sb, &ino_bits, &lblk_bits);
-	return DIV_ROUND_UP(lblk_bits, 8);
+	return DIV_ROUND_UP(fscrypt_max_file_lblk_bits(sb), 8);
 }
 
 /*
  * Log a message when starting to use blk-crypto (native) or blk-crypto-fallback
  * for an encryption mode for the first time.  This is the blk-crypto
  * counterpart to the message logged when starting to use the crypto API for the
  * first time.  A limitation is that these messages don't convey which specific
  * filesystems or files are using each implementation.  However, *usually*
  * systems use just one implementation per mode, which makes these messages
  * helpful for debugging problems where the "wrong" implementation is used.
diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index f4456ecb3f877..7b34949e49de6 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -112,22 +112,21 @@ static bool supported_direct_key_modes(const struct inode *inode,
 	if (mode->ivsize < offsetofend(union fscrypt_iv, nonce)) {
 		fscrypt_warn(inode, "Direct key flag not allowed with %s",
 			     mode->friendly_name);
 		return false;
 	}
 	return true;
 }
 
 static bool supported_iv_ino_lblk_policy(const struct fscrypt_policy_v2 *policy,
 					 const struct inode *inode,
-					 const char *type,
-					 int max_ino_bits, int max_lblk_bits)
+					 const char *type, int max_ino_bits)
 {
 	struct super_block *sb = inode->i_sb;
 	int ino_bits = 64, lblk_bits = 64;
 
 	/*
 	 * IV_INO_LBLK_* exist only because of hardware limitations, and
 	 * currently the only known use case for them involves AES-256-XTS.
 	 * That's also all we test currently.  For these reasons, for now only
 	 * allow AES-256-XTS here.  This can be relaxed later if a use case for
 	 * IV_INO_LBLK_* with other encryption modes arises.
@@ -151,23 +150,28 @@ static bool supported_iv_ino_lblk_policy(const struct fscrypt_policy_v2 *policy,
 		return false;
 	}
 	if (sb->s_cop->get_ino_and_lblk_bits)
 		sb->s_cop->get_ino_and_lblk_bits(sb, &ino_bits, &lblk_bits);
 	if (ino_bits > max_ino_bits) {
 		fscrypt_warn(inode,
 			     "Can't use %s policy on filesystem '%s' because its inode numbers are too long",
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
 	return true;
 }
 
 static bool fscrypt_supported_v1_policy(const struct fscrypt_policy_v1 *policy,
 					const struct inode *inode)
 {
 	if (!fscrypt_valid_enc_modes_v1(policy->contents_encryption_mode,
@@ -232,33 +236,31 @@ static bool fscrypt_supported_v2_policy(const struct fscrypt_policy_v2 *policy,
 			     policy->flags);
 		return false;
 	}
 
 	if ((policy->flags & FSCRYPT_POLICY_FLAG_DIRECT_KEY) &&
 	    !supported_direct_key_modes(inode, policy->contents_encryption_mode,
 					policy->filenames_encryption_mode))
 		return false;
 
 	if ((policy->flags & FSCRYPT_POLICY_FLAG_IV_INO_LBLK_64) &&
-	    !supported_iv_ino_lblk_policy(policy, inode, "IV_INO_LBLK_64",
-					  32, 32))
+	    !supported_iv_ino_lblk_policy(policy, inode, "IV_INO_LBLK_64", 32))
 		return false;
 
 	/*
 	 * IV_INO_LBLK_32 hashes the inode number, so in principle it can
 	 * support any ino_bits.  However, currently the inode number is gotten
 	 * from inode::i_ino which is 'unsigned long'.  So for now the
 	 * implementation limit is 32 bits.
 	 */
 	if ((policy->flags & FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32) &&
-	    !supported_iv_ino_lblk_policy(policy, inode, "IV_INO_LBLK_32",
-					  32, 32))
+	    !supported_iv_ino_lblk_policy(policy, inode, "IV_INO_LBLK_32", 32))
 		return false;
 
 	if (memchr_inv(policy->__reserved, 0, sizeof(policy->__reserved))) {
 		fscrypt_warn(inode, "Reserved bits set in encryption policy");
 		return false;
 	}
 
 	return true;
 }
 
-- 
2.42.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
