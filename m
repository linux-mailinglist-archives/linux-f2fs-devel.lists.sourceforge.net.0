Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sQFfE8plO2onXQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 07:06:18 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D19AA6BB582
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 07:06:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=XtRqxAck;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=G8MuTol2;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=JFSE5uZ8;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b="jN+mn/kY";
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmkcHPHsANi2se6DdND147BU3t1ImbOWI41SGgORPBc=; b=XtRqxAckf1oS2Q36YCcPQOSarG
	76QGluGYgqW3LEh6u6dlBDpoRrWha9ZmSUcRYBvvTVp7F2/6XIn7B1Aygamo6zr+ETJDii4XHyTn1
	VsU+MYfdk7cqoeI/Z38yy5EZvlUgHy9qCbzlSFYqIIBTn1+Y/jrlWZxPOOUZ+QnPsDN8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wcFoS-0006Sn-Ui;
	Wed, 24 Jun 2026 05:06:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wcFoQ-0006SQ-TP
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 05:06:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cdtSpL9FRuNu5ZvOQb0nQS1YVG/M9728PcsaSITfvVI=; b=G8MuTol2iB8JGOuArrcK9cLhvc
 7uBjDnB6oteaV+BJDTSf5KESChzed9DoE8vSVoc0tAoFTGp+0Hs7dlwHHzpUXRx8n8y0JoYz1xTJ/
 AQSDuhYdu/lxUKWq0dQFXoZHWGLjgYf6Y0X5PehoaN7wGqWVNVsBSdrdfWmXtoDP9Rzc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cdtSpL9FRuNu5ZvOQb0nQS1YVG/M9728PcsaSITfvVI=; b=JFSE5uZ8F4kARvQMZgYyRIG+aB
 3wUz5BT6YAFLfsR5r0vVujyAdL+PsMpf7MPttXOSy/SWerAb53TSFUnwzlSpoKaxDuB3Wtv5xnKE6
 T6EZBxHD5EjNgWTpWELFeyCOcETrMF1Lhi0LUaIO46yS2LtpVysU9R6MjFksrcW5xgkA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wcFoQ-0004mT-Ek for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 05:06:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 815D444438;
 Wed, 24 Jun 2026 05:06:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9481F00AC4;
 Wed, 24 Jun 2026 05:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782277560;
 bh=cdtSpL9FRuNu5ZvOQb0nQS1YVG/M9728PcsaSITfvVI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=jN+mn/kYV8/QvOaOPr0HLlFqfiwAlsa83EIbPu1RC3P22Hu6KOnGHHXL5a7DCS41b
 bXLl/Lsy5J42/f2KJ4zO36IkQ6L7ytlcwJePz2z04oOkz2wNi4K/4sSYyiayXOqK8G
 7Ab49k6RK3LpF25O5m9U66TtHSTRldDXwj7AbTth1SHk/KbmYuDbM99E26NNYJsBaa
 tuPWlIG2Xb74p/iPCvTtukS37UOSmKXUHmKniuGEEW/pYqOoESQp4lg/ZjcSVTOnT5
 OkYmrhMIUOee+fIX2JfYg5p2+WrhaQKnS5YGtLcWjdYChOS6LZYDR8lMxwgaoCMxhX
 DHwRXaFw136+w==
To: linux-fscrypt@vger.kernel.org
Date: Tue, 23 Jun 2026 22:03:21 -0700
Message-ID: <20260624050334.124606-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624050334.124606-1-ebiggers@kernel.org>
References: <20260624050334.124606-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: fscrypt uses inline encryption hardware only when the
 "inlinecrypt"
 mount option is given. I'd like to keep that behavior even after standardizing
 on the blk-crypto API for file contents encryption. T [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wcFoQ-0004mT-Ek
Subject: [f2fs-dev] [PATCH 03/16] blk-crypto: Allow control over whether
 hardware is used
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, Theodore Ts'o <tytso@mit.edu>,
 Zhang Yi <yi.zhang@huawei.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Ojaswin Mujoo <ojaswin@linux.ibm.com>, Baokun Li <libaokun@linux.alibaba.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-fsdevel@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-fscrypt@vger.kernel.org,m:ritesh.list@gmail.com,m:tytso@mit.edu,m:yi.zhang@huawei.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:adilger.kernel@dilger.ca,m:ojaswin@linux.ibm.com,m:libaokun@linux.alibaba.com,m:jaegeuk@kernel.org,m:linux-fsdevel@vger.kernel.org,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:ebiggers@kernel.org,m:riteshlist@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,mit.edu,huawei.com,lists.sourceforge.net,vger.kernel.org,dilger.ca,linux.ibm.com,linux.alibaba.com,kernel.org,suse.cz,lst.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D19AA6BB582

fscrypt uses inline encryption hardware only when the "inlinecrypt"
mount option is given.  I'd like to keep that behavior even after
standardizing on the blk-crypto API for file contents encryption.  That
is, the default should continue to be the well-tested CPU-based
encryption code, and the use of inline encryption hardware should
continue to be an opt-in feature for systems where it's beneficial and
has been fully validated (including verifying ciphertext correctness).

To support this use case, add an allow_hw field to struct
blk_crypto_config.

For now it's always set to true.  Later commits will change that.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 block/blk-crypto.c          | 8 +++++++-
 drivers/md/dm-inlinecrypt.c | 2 +-
 fs/crypto/inline_crypt.c    | 3 ++-
 include/linux/blk-crypto.h  | 6 +++++-
 4 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/block/blk-crypto.c b/block/blk-crypto.c
index dd83fc5af282..c157db869183 100644
--- a/block/blk-crypto.c
+++ b/block/blk-crypto.c
@@ -298,20 +298,21 @@ int __blk_crypto_rq_bio_prep(struct request *rq, struct bio *bio,
  * @key_type: type of the key -- either raw or hardware-wrapped
  * @crypto_mode: identifier for the encryption algorithm to use
  * @dun_bytes: number of bytes that will be used to specify the DUN when this
  *	       key is used
  * @data_unit_size: the data unit size to use for en/decryption
+ * @allow_hw: true if using inline encryption hardware is allowed
  *
  * Return: 0 on success, -errno on failure.  The caller is responsible for
  *	   zeroizing both blk_key and key_bytes when done with them.
  */
 int blk_crypto_init_key(struct blk_crypto_key *blk_key,
 			const u8 *key_bytes, size_t key_size,
 			enum blk_crypto_key_type key_type,
 			enum blk_crypto_mode_num crypto_mode,
 			unsigned int dun_bytes,
-			unsigned int data_unit_size)
+			unsigned int data_unit_size, bool allow_hw)
 {
 	const struct blk_crypto_mode *mode;
 
 	memset(blk_key, 0, sizeof(*blk_key));
 
@@ -326,10 +327,12 @@ int blk_crypto_init_key(struct blk_crypto_key *blk_key,
 		break;
 	case BLK_CRYPTO_KEY_TYPE_HW_WRAPPED:
 		if (key_size < mode->security_strength ||
 		    key_size > BLK_CRYPTO_MAX_HW_WRAPPED_KEY_SIZE)
 			return -EINVAL;
+		if (!allow_hw)
+			return -EINVAL;
 		break;
 	default:
 		return -EINVAL;
 	}
 
@@ -341,10 +344,11 @@ int blk_crypto_init_key(struct blk_crypto_key *blk_key,
 
 	blk_key->crypto_cfg.crypto_mode = crypto_mode;
 	blk_key->crypto_cfg.dun_bytes = dun_bytes;
 	blk_key->crypto_cfg.data_unit_size = data_unit_size;
 	blk_key->crypto_cfg.key_type = key_type;
+	blk_key->crypto_cfg.allow_hw = allow_hw;
 	blk_key->data_unit_size_bits = ilog2(data_unit_size);
 	blk_key->size = key_size;
 	memcpy(blk_key->bytes, key_bytes, key_size);
 
 	return 0;
@@ -366,10 +370,12 @@ bool blk_crypto_config_supported_natively(struct block_device *bdev,
 {
 	struct blk_crypto_profile *profile = bdev_get_queue(bdev)->crypto_profile;
 
 	if (!profile)
 		return false;
+	if (!cfg->allow_hw)
+		return false;
 	if (!(profile->modes_supported[cfg->crypto_mode] & cfg->data_unit_size))
 		return false;
 	if (profile->max_dun_bytes_supported < cfg->dun_bytes)
 		return false;
 	if (!(profile->key_types_supported & cfg->key_type))
diff --git a/drivers/md/dm-inlinecrypt.c b/drivers/md/dm-inlinecrypt.c
index be1b4aa8f28b..a0f039c1e153 100644
--- a/drivers/md/dm-inlinecrypt.c
+++ b/drivers/md/dm-inlinecrypt.c
@@ -404,11 +404,11 @@ static int inlinecrypt_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		       (ctx->sector_bits - SECTOR_SHIFT);
 	dun_bytes = DIV_ROUND_UP(fls64(ctx->max_dun), 8);
 
 	err = blk_crypto_init_key(&ctx->key, key_bytes, ctx->key_size,
 				  ctx->key_type, cipher->mode_num,
-				  dun_bytes, ctx->sector_size);
+				  dun_bytes, ctx->sector_size, true);
 	if (err) {
 		ti->error = "Error initializing blk-crypto key";
 		goto bad;
 	}
 
diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index 47324062fee5..0d4c0dd04d20 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -132,10 +132,11 @@ int fscrypt_select_encryption_impl(struct fscrypt_inode_info *ci,
 	crypto_cfg.crypto_mode = ci->ci_mode->blk_crypto_mode;
 	crypto_cfg.data_unit_size = 1U << ci->ci_data_unit_bits;
 	crypto_cfg.dun_bytes = fscrypt_get_dun_bytes(ci);
 	crypto_cfg.key_type = is_hw_wrapped_key ?
 		BLK_CRYPTO_KEY_TYPE_HW_WRAPPED : BLK_CRYPTO_KEY_TYPE_RAW;
+	crypto_cfg.allow_hw = true;
 
 	devs = fscrypt_get_devices(sb, &num_devs);
 	if (IS_ERR(devs))
 		return PTR_ERR(devs);
 
@@ -173,11 +174,11 @@ int fscrypt_prepare_inline_crypt_key(struct fscrypt_prepared_key *prep_key,
 	if (!blk_key)
 		return -ENOMEM;
 
 	err = blk_crypto_init_key(blk_key, key_bytes, key_size, key_type,
 				  crypto_mode, fscrypt_get_dun_bytes(ci),
-				  1U << ci->ci_data_unit_bits);
+				  1U << ci->ci_data_unit_bits, true);
 	if (err) {
 		fscrypt_err(inode, "error %d initializing blk-crypto key", err);
 		goto fail;
 	}
 
diff --git a/include/linux/blk-crypto.h b/include/linux/blk-crypto.h
index f7c3cb4a342f..7b9dca89aec9 100644
--- a/include/linux/blk-crypto.h
+++ b/include/linux/blk-crypto.h
@@ -75,16 +75,20 @@ enum blk_crypto_key_type {
  *	key.  This is the size in bytes of each individual plaintext and
  *	ciphertext.  This is always a power of 2.  It might be e.g. the
  *	filesystem block size or the disk sector size.
  * @dun_bytes: the maximum number of bytes of DUN used when using this key
  * @key_type: the type of this key -- either raw or hardware-wrapped
+ * @allow_hw: true if inline encryption hardware will be used if available;
+ *	      false to always use CPU-based encryption (requires
+ *	      CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK)
  */
 struct blk_crypto_config {
 	enum blk_crypto_mode_num crypto_mode;
 	unsigned int data_unit_size;
 	unsigned int dun_bytes;
 	enum blk_crypto_key_type key_type;
+	bool allow_hw;
 };
 
 /**
  * struct blk_crypto_key - an inline encryption key
  * @crypto_cfg: the crypto mode, data unit size, key type, and other
@@ -148,11 +152,11 @@ bool bio_crypt_dun_is_contiguous(const struct bio_crypt_ctx *bc,
 int blk_crypto_init_key(struct blk_crypto_key *blk_key,
 			const u8 *key_bytes, size_t key_size,
 			enum blk_crypto_key_type key_type,
 			enum blk_crypto_mode_num crypto_mode,
 			unsigned int dun_bytes,
-			unsigned int data_unit_size);
+			unsigned int data_unit_size, bool allow_hw);
 
 int blk_crypto_start_using_key(struct block_device *bdev,
 			       const struct blk_crypto_key *key);
 
 void blk_crypto_evict_key(struct block_device *bdev,
-- 
2.54.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
