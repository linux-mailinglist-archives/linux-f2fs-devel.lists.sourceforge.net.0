Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFMONaVdoGlbiwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 15:50:13 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CEF1A7EB2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 15:50:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hXny1585FwmpVqKj0UmQ582Anr2/yxhxZWFKKutcQc=; b=F1HkvRBQTr5utI+HBpmr/6gwL0
	UNLX+kzNVpDIwN6ek9OphjqvtzaOHOpKzSBRZcear6J9zNu3IYlsGkfA/qjvxNEhL4pF+cBIHN2cH
	ov2v8YfddWesX1AcVXG15YhNxSDBxUNTR8mrmluMsYVC2tIcG+GaG/hqqvOoKq8ygNMw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvcgr-0000TQ-Jn;
	Thu, 26 Feb 2026 14:50:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+c5cab09b19de097b6dd3+8222+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vvcgl-0000T4-RL for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Feb 2026 14:50:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=prullTp9LHQrqh8Xt6O1yFS0g5pZcBygbWXiKMvvhew=; b=FwPGH8jr+wBoJEqvNT8BnkQ37i
 7NlpOBp6uj4UI61iT/rx8sPEgeiytlXAYDIkm/35eOyCXKz1msf5uhgfRG3r4b6il/HsZ54uzxZIs
 QPDFjH0l84qIpyuFT8/jrKXB+g3RZG+k6/ndkhXUM/eiW7Nrni/b6RXkEywGD54NE8oU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=prullTp9LHQrqh8Xt6O1yFS0g5pZcBygbWXiKMvvhew=; b=bFZ0gN20+nAZ/thjPivjjmsAPA
 oiblr51LnuAbh7YDXrZp0WO06pH2BJFu5aMLnH+RWG7sYgR1aOrsr2R3YFZsQf8obY7T3xXr+ayQ8
 IeimrKr3dBdFKjUMKG9q6j7UiK3qGzj5CO2RSyMDHSKO0q6gFrHraz0FG8ze41wEW9g4=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvcgl-0000Rr-9k for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Feb 2026 14:50:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=prullTp9LHQrqh8Xt6O1yFS0g5pZcBygbWXiKMvvhew=; b=jDdcwxsDnRBxmI58i9QfsXcGMX
 fa3h4t5/BKNG+M8VGQ8Ir0uruXkUUMxCEAOUjQGt330hcivLliF8STs9c7tEWFqOn71enK46Vt2cm
 8h5SpoM1/88SWDju4QsYp/BHyR9nyQ0XVX4IrhAbf/Dle9tI+kRW1nRINDyZJ6UM8Zd8/9+9ucW2p
 +mpcZFF0n+LNryoFtkX0G5DaBWVykdj0PDHGH3enekzRmGo0XcKfCLSyOYXe3xvoeSQQYum8LbJWu
 oUOFVJWyTvqAHkjMwHTJROyQICuqzeja8jAomJkrOlHIsWU1ERgy+hMaZe0a+p8wT0G1XucNWXNQA
 hJCxXE9g==;
Received: from [4.28.11.157] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vvcgf-00000006Nb7-0tfZ; Thu, 26 Feb 2026 14:49:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Thu, 26 Feb 2026 06:49:26 -0800
Message-ID: <20260226144954.142278-7-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226144954.142278-1-hch@lst.de>
References: <20260226144954.142278-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Logical offsets into an inode are usually expressed as bytes
 in the VFS. Switch fscrypt_generate_dun to that convention and remove the
 ci_data_units_per_block_bits member in struct fscrypt_inode_info [...] 
 Content analysis details:   (0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [198.137.202.133 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vvcgl-0000Rr-9k
Subject: [f2fs-dev] [PATCH 06/14] fscrypt: pass a byte offset to
 fscrypt_generate_dun
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
Cc: Christian Brauner <brauner@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:brauner@kernel.org,m:tytso@mit.edu,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fscrypt@vger.kernel.org,m:adilger.kernel@dilger.ca,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 27CEF1A7EB2
X-Rspamd-Action: no action

Logical offsets into an inode are usually expressed as bytes in the VFS.
Switch fscrypt_generate_dun to that convention and remove the
ci_data_units_per_block_bits member in struct fscrypt_inode_info that
was only used to cache the DUN shift based on the logical block size
granularity.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/crypto/fscrypt_private.h |  3 ---
 fs/crypto/inline_crypt.c    | 10 ++++------
 fs/crypto/keysetup.c        |  2 --
 3 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 4e8e82a9ccf9..8d3c278a7591 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -278,9 +278,6 @@ struct fscrypt_inode_info {
 	 */
 	u8 ci_data_unit_bits;
 
-	/* Cached value: log2 of number of data units per FS block */
-	u8 ci_data_units_per_block_bits;
-
 	/* Hashed inode number.  Only set for IV_INO_LBLK_32 */
 	u32 ci_hashed_ino;
 
diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index 702d13d138aa..5279565e9846 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -268,14 +268,12 @@ bool __fscrypt_inode_uses_inline_crypto(const struct inode *inode)
 EXPORT_SYMBOL_GPL(__fscrypt_inode_uses_inline_crypto);
 
 static void fscrypt_generate_dun(const struct fscrypt_inode_info *ci,
-				 u64 lblk_num,
-				 u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE])
+				 loff_t pos, u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE])
 {
-	u64 index = lblk_num << ci->ci_data_units_per_block_bits;
 	union fscrypt_iv iv;
 	int i;
 
-	fscrypt_generate_iv(&iv, index, ci);
+	fscrypt_generate_iv(&iv, pos >> ci->ci_data_unit_bits, ci);
 
 	BUILD_BUG_ON(FSCRYPT_MAX_IV_SIZE > BLK_CRYPTO_MAX_IV_SIZE);
 	memset(dun, 0, BLK_CRYPTO_MAX_IV_SIZE);
@@ -309,7 +307,7 @@ void fscrypt_set_bio_crypt_ctx(struct bio *bio, const struct inode *inode,
 		return;
 	ci = fscrypt_get_inode_info_raw(inode);
 
-	fscrypt_generate_dun(ci, first_lblk, dun);
+	fscrypt_generate_dun(ci, first_lblk << inode->i_blkbits, dun);
 	bio_crypt_set_ctx(bio, ci->ci_enc_key.blk_key, dun, gfp_mask);
 }
 EXPORT_SYMBOL_GPL(fscrypt_set_bio_crypt_ctx);
@@ -356,7 +354,7 @@ bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
 	if (bc->bc_key != ci->ci_enc_key.blk_key)
 		return false;
 
-	fscrypt_generate_dun(ci, next_lblk, next_dun);
+	fscrypt_generate_dun(ci, next_lblk << inode->i_blkbits, next_dun);
 	return bio_crypt_dun_is_contiguous(bc, bio->bi_iter.bi_size, next_dun);
 }
 EXPORT_SYMBOL_GPL(fscrypt_mergeable_bio);
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index 40fa05688d3a..d83257e9945e 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -609,8 +609,6 @@ fscrypt_setup_encryption_info(struct inode *inode,
 
 	crypt_info->ci_data_unit_bits =
 		fscrypt_policy_du_bits(&crypt_info->ci_policy, inode);
-	crypt_info->ci_data_units_per_block_bits =
-		inode->i_blkbits - crypt_info->ci_data_unit_bits;
 
 	res = setup_file_encryption_key(crypt_info, need_dirhash_key, &mk);
 	if (res)
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
