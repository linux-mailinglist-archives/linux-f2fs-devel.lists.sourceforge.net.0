Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0BC9A461A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Oct 2024 20:45:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t1ryL-00010I-J2;
	Fri, 18 Oct 2024 18:45:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1t1ryK-00010A-P3
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Oct 2024 18:45:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=13m6iHJC97GgDZeNITlexe9FUh0oANaCkDaM707WUQ0=; b=Ex1BXptcRqY1PfdRyV2EJVkxqm
 HwF5zcd/2gx0/qLV7bO/2FsUDAncBEH1wKMe2dxAI2jJE1PoVboKKcT/9NhnXJIC+iuiUsxqiqH84
 v9ntInUrDZPBPJ+8bbAgeeiiS7bWOaDrCdVmi0E/CE6hkhYulJ5LI3inAc7JF/O+Qygs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=13m6iHJC97GgDZeNITlexe9FUh0oANaCkDaM707WUQ0=; b=QMUN3RrQPuLlW3+1vo6nsPODQ4
 rFQC1ceJtPsHkCptke8aGoB16jtrebfIKrt6HttolB6bid+neu4U7oEaa2/FA3xl2ubYurp6/yx9d
 KbHr7+5LfTP1FALzQamuojgu8mLVvHWI2jEbiIHpsMIpfWssZK/vsWBscps57vmZU/W0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t1ryJ-00013K-Es for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Oct 2024 18:45:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6FE9F5C3FCD;
 Fri, 18 Oct 2024 18:45:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EAFEC4CEC7;
 Fri, 18 Oct 2024 18:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729277105;
 bh=0qchzt7gBgYJL42I9oOzic2a5iFiBbDN8bBm6iTAtt4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lP58+IJ7tGDLYShN+HUc2tPy2kDe9kB2VqDCKrSP6RWS26eooYpruQeVtU2dhKkK/
 Ht7Q+1lADA2gM5X72mZwvZy/G7nScEOmvsxjuv6aZnoxsTusK1mNr/LfPBpHF1I81s
 5zb0CTfAUvRGXhEr9gKp6s8GqULfYpIWUiZw73DvYHDnqWC6dN0wJzgMFEjmOPNOr0
 qKzR3STi+6oT/BbwRt8xkKviKGO5s/KlwFDyqY5H0bRmaL3u8RWdoVvOY2+zErcn0D
 a9M++TZCS/MGO5T52V4k0d2cADGh45aICwEL2UF3Cv4OKu8/uMY7kqJUmUZxO1ksZG
 IYIl2RSqXYj0A==
To: dm-devel@lists.linux.dev
Date: Fri, 18 Oct 2024 11:43:37 -0700
Message-ID: <20241018184339.66601-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241018184339.66601-1-ebiggers@kernel.org>
References: <20241018184339.66601-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Add a flag
 bi_skip_dm_default_key
 to struct bio. This flag indicates that dm-default-key should not en/decrypt
 the bio, due to it targeting the contents of an encrypted file. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t1ryJ-00013K-Es
Subject: [f2fs-dev] [RFC PATCH 2/4] block: add the bi_skip_dm_default_key
 flag
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
Cc: Israel Rukshin <israelr@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, Mikulas Patocka <mpatocka@redhat.com>,
 Adrian Vovk <adrianvovk@gmail.com>, Md Sadre Alam <quic_mdalam@quicinc.com>,
 linux-ext4@vger.kernel.org, Milan Broz <gmazyland@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Add a flag bi_skip_dm_default_key to struct bio.  This flag indicates
that dm-default-key should not en/decrypt the bio, due to it targeting
the contents of an encrypted file.

When a bio is cloned, copy the bi_skip_dm_default_key flag.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 block/bio.c                 |  3 +++
 block/blk-crypto-fallback.c |  2 ++
 include/linux/blk-crypto.h  | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/blk_types.h   |  3 +++
 4 files changed, 44 insertions(+)

diff --git a/block/bio.c b/block/bio.c
index ac4d77c889322..5ff0b66e47a42 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -267,10 +267,13 @@ void bio_init(struct bio *bio, struct block_device *bdev, struct bio_vec *table,
 	bio->bi_iocost_cost = 0;
 #endif
 #endif
 #ifdef CONFIG_BLK_INLINE_ENCRYPTION
 	bio->bi_crypt_context = NULL;
+#if IS_ENABLED(CONFIG_DM_DEFAULT_KEY)
+	bio->bi_skip_dm_default_key = false;
+#endif
 #endif
 #ifdef CONFIG_BLK_DEV_INTEGRITY
 	bio->bi_integrity = NULL;
 #endif
 	bio->bi_vcnt = 0;
diff --git a/block/blk-crypto-fallback.c b/block/blk-crypto-fallback.c
index b1e7415f8439c..dd5f1edcc44b3 100644
--- a/block/blk-crypto-fallback.c
+++ b/block/blk-crypto-fallback.c
@@ -179,10 +179,12 @@ static struct bio *blk_crypto_fallback_clone_bio(struct bio *bio_src)
 	bio_for_each_segment(bv, bio_src, iter)
 		bio->bi_io_vec[bio->bi_vcnt++] = bv;
 
 	bio_clone_blkg_association(bio, bio_src);
 
+	bio_clone_skip_dm_default_key(bio, bio_src);
+
 	return bio;
 }
 
 static bool
 blk_crypto_fallback_alloc_cipher_req(struct blk_crypto_keyslot *slot,
diff --git a/include/linux/blk-crypto.h b/include/linux/blk-crypto.h
index 5e5822c18ee41..f1f3d546c53e5 100644
--- a/include/linux/blk-crypto.h
+++ b/include/linux/blk-crypto.h
@@ -110,10 +110,13 @@ static inline bool bio_has_crypt_ctx(struct bio *bio)
 	return false;
 }
 
 #endif /* CONFIG_BLK_INLINE_ENCRYPTION */
 
+static inline void bio_clone_skip_dm_default_key(struct bio *dst,
+						 const struct bio *src);
+
 int __bio_crypt_clone(struct bio *dst, struct bio *src, gfp_t gfp_mask);
 /**
  * bio_crypt_clone - clone bio encryption context
  * @dst: destination bio
  * @src: source bio
@@ -125,11 +128,44 @@ int __bio_crypt_clone(struct bio *dst, struct bio *src, gfp_t gfp_mask);
  *	   @gfp_mask doesn't include %__GFP_DIRECT_RECLAIM.
  */
 static inline int bio_crypt_clone(struct bio *dst, struct bio *src,
 				  gfp_t gfp_mask)
 {
+	bio_clone_skip_dm_default_key(dst, src);
 	if (bio_has_crypt_ctx(src))
 		return __bio_crypt_clone(dst, src, gfp_mask);
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_DM_DEFAULT_KEY)
+static inline void bio_set_skip_dm_default_key(struct bio *bio)
+{
+	bio->bi_skip_dm_default_key = true;
+}
+
+static inline bool bio_should_skip_dm_default_key(const struct bio *bio)
+{
+	return bio->bi_skip_dm_default_key;
+}
+
+static inline void bio_clone_skip_dm_default_key(struct bio *dst,
+						 const struct bio *src)
+{
+	dst->bi_skip_dm_default_key = src->bi_skip_dm_default_key;
+}
+#else /* CONFIG_DM_DEFAULT_KEY */
+static inline void bio_set_skip_dm_default_key(struct bio *bio)
+{
+}
+
+static inline bool bio_should_skip_dm_default_key(const struct bio *bio)
+{
+	return false;
+}
+
+static inline void bio_clone_skip_dm_default_key(struct bio *dst,
+						 const struct bio *src)
+{
+}
+#endif /* !CONFIG_DM_DEFAULT_KEY */
+
 #endif /* __LINUX_BLK_CRYPTO_H */
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index dce7615c35e7e..2ee6a7e570796 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -247,10 +247,13 @@ struct bio {
 #endif
 #endif
 
 #ifdef CONFIG_BLK_INLINE_ENCRYPTION
 	struct bio_crypt_ctx	*bi_crypt_context;
+#if IS_ENABLED(CONFIG_DM_DEFAULT_KEY)
+	bool			bi_skip_dm_default_key;
+#endif
 #endif
 
 #if defined(CONFIG_BLK_DEV_INTEGRITY)
 	struct bio_integrity_payload *bi_integrity; /* data integrity */
 #endif
-- 
2.47.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
