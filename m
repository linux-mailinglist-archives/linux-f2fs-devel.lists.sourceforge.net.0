Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ndt9KctlO2ouXQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 07:06:19 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBF06BB593
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 07:06:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=k8riXSpM;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=YQvM80jb;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="jfH3p/py";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=hLmfBDEM;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCWzje8CZCmESCPs+OMdrWyHH7Dx6a53EMhfnGM57i4=; b=k8riXSpMUXDgVKMQN3d4ifTst9
	PUC4DRX/mLt+jmMBsRALVq2+YgyY6htCWc0kpd9iIGA/6AsFW0KuyVBYEEXMoTktDQr62R8k7MzLs
	yBn2R/vU5m6bOMIVv0tbdw1uTaqaTBEZjhYmZaCvmcmMg5RhVavZzUTxcmorSc5c74UI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wcFoT-00065G-2I;
	Wed, 24 Jun 2026 05:06:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wcFoP-000659-VD
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 05:06:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lPH0UMQfDl3YAr28CUIry+4cjf/OMOF0bylodk25xRQ=; b=YQvM80jbg1ASQAknWJdtcuQnpH
 ktGMM0bEWvOh/VchACjLK+CPnoEfnK6tcFhLmzSQWtI7k3/m8pdhXgHXtgp20ho6ukSnOKv7n+d9M
 BbeqW/M5E59AgbzLgZgx/K0gVFqEsS434dsMhOoDMMv/yPhT8xeZKolJZqT5zA2j1pbk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lPH0UMQfDl3YAr28CUIry+4cjf/OMOF0bylodk25xRQ=; b=jfH3p/pygf4RPcWy+tUS9SLw3b
 BY0AmVFlZ+HZLACXawWBd1plmDwVZXxJOiLrJDArYQSRcE5TllhQehK9qzn5b8VxEbIECSXjkgayU
 8ajDHKBIH8ScGb6AUgcJJtQGWtCdli1v0Z++o0NZRgSPxLvjpsR34EUtj8r8BuOnmU/M=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wcFoL-0004mH-EI for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 05:06:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E66C9601F8;
 Wed, 24 Jun 2026 05:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D4B71F00A3E;
 Wed, 24 Jun 2026 05:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782277559;
 bh=lPH0UMQfDl3YAr28CUIry+4cjf/OMOF0bylodk25xRQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=hLmfBDEMQ1hPOMkn+crXMjxoKmNS8pwqRQPDc87m7MZhhsJsdluEsetaSm8iNfGgi
 jtOGZbJ07b6SUVMsztjXRSMa0QjckjRO2vvrdtVgv03mej4b37jEO7AFBuNalp2Bux
 mmcFc0UnhOhzsWjPYaAiScfH+5RRl7qUkRWveNu8eBqmfuzO5lbcUfpg6BqgiPwIh0
 xTogghjFT5ZjnZ/2Qfy7gZYpmBR8z79KQgfmY4Prl7vuxIH1QHJUk5SIm096oCO3CG
 ZzfLhqsw2oOE+1QtIEEsQm+1D2oFniOJ6xtrONIPHI5dd5dgvAKlskkf47qvussjdp
 Fy5mq8BfYEpJQ==
To: linux-fscrypt@vger.kernel.org
Date: Tue, 23 Jun 2026 22:03:20 -0700
Message-ID: <20260624050334.124606-3-ebiggers@kernel.org>
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
 Content preview: __blk_crypto_cfg_supported() is called only by
 blk_crypto_config_supported_natively(), 
 so fold it in. Signed-off-by: Eric Biggers <ebiggers@kernel.org> ---
 block/blk-crypto-profile.c
 | 22 block/blk-crypto.c | 23 +++++++++++++++++++++-- 2 files changed, 21
 insertions(+), 24 delet [...] 
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
X-Headers-End: 1wcFoL-0004mH-EI
Subject: [f2fs-dev] [PATCH 02/16] blk-crypto: Fold
 __blk_crypto_cfg_supported() into its caller
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
X-Rspamd-Queue-Id: 3DBF06BB593

__blk_crypto_cfg_supported() is called only by
blk_crypto_config_supported_natively(), so fold it in.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 block/blk-crypto-profile.c | 22 ----------------------
 block/blk-crypto.c         | 23 +++++++++++++++++++++--
 2 files changed, 21 insertions(+), 24 deletions(-)

diff --git a/block/blk-crypto-profile.c b/block/blk-crypto-profile.c
index cf447ba4a66e..53126c091b0b 100644
--- a/block/blk-crypto-profile.c
+++ b/block/blk-crypto-profile.c
@@ -333,32 +333,10 @@ void blk_crypto_put_keyslot(struct blk_crypto_keyslot *slot)
 		spin_unlock_irqrestore(&profile->idle_slots_lock, flags);
 		wake_up(&profile->idle_slots_wait_queue);
 	}
 }
 
-/**
- * __blk_crypto_cfg_supported() - Check whether the given crypto profile
- *				  supports the given crypto configuration.
- * @profile: the crypto profile to check
- * @cfg: the crypto configuration to check for
- *
- * Return: %true if @profile supports the given @cfg.
- */
-bool __blk_crypto_cfg_supported(struct blk_crypto_profile *profile,
-				const struct blk_crypto_config *cfg)
-{
-	if (!profile)
-		return false;
-	if (!(profile->modes_supported[cfg->crypto_mode] & cfg->data_unit_size))
-		return false;
-	if (profile->max_dun_bytes_supported < cfg->dun_bytes)
-		return false;
-	if (!(profile->key_types_supported & cfg->key_type))
-		return false;
-	return true;
-}
-
 /*
  * This is an internal function that evicts a key from an inline encryption
  * device that can be either a real device or the blk-crypto-fallback "device".
  * It is used only by blk_crypto_evict_key(); see that function for details.
  */
diff --git a/block/blk-crypto.c b/block/blk-crypto.c
index 15e25e41b166..dd83fc5af282 100644
--- a/block/blk-crypto.c
+++ b/block/blk-crypto.c
@@ -349,15 +349,34 @@ int blk_crypto_init_key(struct blk_crypto_key *blk_key,
 
 	return 0;
 }
 EXPORT_SYMBOL_GPL(blk_crypto_init_key);
 
+
+/**
+ * blk_crypto_config_supported_natively() - Check whether a block device
+ *					    supports hardware inline encryption
+ *					    with the given configuration.
+ * @bdev: the block device
+ * @cfg: the crypto configuration to check for
+ *
+ * Return: %true if @bdev supports hardware inline encryption with @cfg.
+ */
 bool blk_crypto_config_supported_natively(struct block_device *bdev,
 					  const struct blk_crypto_config *cfg)
 {
-	return __blk_crypto_cfg_supported(bdev_get_queue(bdev)->crypto_profile,
-					  cfg);
+	struct blk_crypto_profile *profile = bdev_get_queue(bdev)->crypto_profile;
+
+	if (!profile)
+		return false;
+	if (!(profile->modes_supported[cfg->crypto_mode] & cfg->data_unit_size))
+		return false;
+	if (profile->max_dun_bytes_supported < cfg->dun_bytes)
+		return false;
+	if (!(profile->key_types_supported & cfg->key_type))
+		return false;
+	return true;
 }
 
 /*
  * Check if bios with @cfg can be en/decrypted by blk-crypto (i.e. either the
  * block_device it's submitted to supports inline crypto, or the
-- 
2.54.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
