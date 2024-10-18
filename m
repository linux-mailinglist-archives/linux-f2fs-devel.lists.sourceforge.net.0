Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FDE9A461C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Oct 2024 20:45:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t1ryM-0006DD-MD;
	Fri, 18 Oct 2024 18:45:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1t1ryL-0006D3-59
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Oct 2024 18:45:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=snfzKISbk2CfCx4xHSEQrfFWU8mw4okBmD7+Mwl1e8k=; b=GklWvlTA53FSrWIjRty1W72l2u
 Y04Ga166UVRyyeEFEk6v8R9zAGsOGGaYey1vf+xVZWPN12h0EZCvRo6U/q/BHxVkHOw9JgyOyz0P2
 OsJtQyi3z33c8V6P3dLqQeoWgeiRyJmdyR0esyy6ytvo2c+C6RX2Nq9qUvoFxRRDf8lY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=snfzKISbk2CfCx4xHSEQrfFWU8mw4okBmD7+Mwl1e8k=; b=Elkr1U2iaY3a6Q1WMx0E2mOMsS
 21evOHBOWhnvx7gBUYg4EkP54J0BKCcCcKCFMfrK4sJmhXawfKb6UacfpNnyS2lJ4Dtc3ovdbFL4b
 x6gwoWpQZwnS1W0Mwtuef6CVaaNe+pUb1mLmxx/1La8u5i3KMwW1WksuB5HG+lBnmc8k=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t1ryJ-00013H-1G for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Oct 2024 18:45:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4C3E7A448C6;
 Fri, 18 Oct 2024 18:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E2BDC4CEC5;
 Fri, 18 Oct 2024 18:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729277104;
 bh=gDP8bNinKpdnrrwyqZpwB7f4CjBe/aJ8mHb0cW6EzyQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jtMpLz7FOC53ds7U19K69hS1Vhm/axzXN37sg529ObJME8qhr+bnA90aW60XZau8z
 CZJSrha/KceHnkk1+CeEhYSPpvcyWn1o4Zh3PoetfnWkNsljuGKYQpz1XNaLqPXGXM
 9z0jt5TRRYvWLBU7uhfoujlZpf0mQRYchc5hSrXBwhM9iwJOsUFTBCHAbHHQlASraa
 thUuY3tmEdQMkAL0pz+/RN2sRrJ9BaeuZFUUeojMjach+iL6XQEUXvWL50sIy03JuP
 jCQcuuSXt2/OU+Ea+E6/VkAcQw2Exz3syuKiK9sDlkfVs2D6WVXrvsTCUvWLhnIe1M
 02dW7di19adaw==
To: dm-devel@lists.linux.dev
Date: Fri, 18 Oct 2024 11:43:36 -0700
Message-ID: <20241018184339.66601-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241018184339.66601-1-ebiggers@kernel.org>
References: <20241018184339.66601-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> bio_crypt_set_ctx(),
 blk_crypto_init_key(), and blk_crypto_start_using_key() are needed to use
 inline encryption; see Documentation/block/inline-encryption.rst. Export
 them so that dm-default-key can [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t1ryJ-00013H-1G
Subject: [f2fs-dev] [RFC PATCH 1/4] block: export blk-crypto symbols
 required by dm-default-key
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

bio_crypt_set_ctx(), blk_crypto_init_key(), and
blk_crypto_start_using_key() are needed to use inline encryption; see
Documentation/block/inline-encryption.rst.  Export them so that
dm-default-key can use them.  The only reason these weren't exported
before was that inline encryption was previously used only by fs/crypto/
which is built-in code.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 block/blk-crypto.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/block/blk-crypto.c b/block/blk-crypto.c
index 4d760b092deb9..5a121b1292f9a 100644
--- a/block/blk-crypto.c
+++ b/block/blk-crypto.c
@@ -104,10 +104,11 @@ void bio_crypt_set_ctx(struct bio *bio, const struct blk_crypto_key *key,
 	bc->bc_key = key;
 	memcpy(bc->bc_dun, dun, sizeof(bc->bc_dun));
 
 	bio->bi_crypt_context = bc;
 }
+EXPORT_SYMBOL_GPL(bio_crypt_set_ctx);
 
 void __bio_crypt_free_ctx(struct bio *bio)
 {
 	mempool_free(bio->bi_crypt_context, bio_crypt_ctx_pool);
 	bio->bi_crypt_context = NULL;
@@ -354,10 +355,11 @@ int blk_crypto_init_key(struct blk_crypto_key *blk_key, const u8 *raw_key,
 	blk_key->size = mode->keysize;
 	memcpy(blk_key->raw, raw_key, mode->keysize);
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(blk_crypto_init_key);
 
 bool blk_crypto_config_supported_natively(struct block_device *bdev,
 					  const struct blk_crypto_config *cfg)
 {
 	return __blk_crypto_cfg_supported(bdev_get_queue(bdev)->crypto_profile,
@@ -396,10 +398,11 @@ int blk_crypto_start_using_key(struct block_device *bdev,
 {
 	if (blk_crypto_config_supported_natively(bdev, &key->crypto_cfg))
 		return 0;
 	return blk_crypto_fallback_start_using_mode(key->crypto_cfg.crypto_mode);
 }
+EXPORT_SYMBOL_GPL(blk_crypto_start_using_key);
 
 /**
  * blk_crypto_evict_key() - Evict a blk_crypto_key from a block_device
  * @bdev: a block_device on which I/O using the key may have been done
  * @key: the key to evict
-- 
2.47.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
