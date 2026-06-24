Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5sf7Ns1lO2o0XQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 07:06:21 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7364A6BB5AF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 07:06:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=hZqsdhiZ;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Cc3EMFLc;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=HxhOIy1y;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=anSngnws;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9k7NWsGoV+bcQbNDuEVCcdCVx3HIQUhk76fum/GG3Aw=; b=hZqsdhiZPpddhilEKaCcdwkp3Z
	usywQmtPzSs2sue8jP4u8gG+rqu2Ci/PI4DHY5GvEN9a94R3b2a8QJC5rXEccCpyYGuLNYYwpqlmr
	8S+Gqu3xTI1DoLOJQbzsdR5pA3gl+Zj1el2QyRsZHJH7k7yx0RY1KPDdh4aPlucC6OQc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wcFoY-0006U2-AI;
	Wed, 24 Jun 2026 05:06:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wcFoV-0006TX-VN
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 05:06:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mHBePYhFW8fiLIg4xT1lr+T1/B7j/TW7c31PF92HJp4=; b=Cc3EMFLc1dOF3r+8w64jggQeFf
 OaccS1UnH8eIVvoKyKCgl92Ln4/vLzwYbodM3YaFtMzE1baK41koOaYdp/FvJ+pWUreLIm/+FfnB8
 ov8ZtgelIlCiwdPrhdgwldFL4Io9KqS38pph51o9TdWfQDQkDKuZS2dcftxO9BGZrkgw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mHBePYhFW8fiLIg4xT1lr+T1/B7j/TW7c31PF92HJp4=; b=HxhOIy1y2lpidDWGEgBfcbgSro
 qVG9s4Ig31K3SbCXh0FfFLXNub1E1cWIE/yI1dXXU1tnV37eGhpEFB2Rdp9xBPfWnOV5oe+G2b8M6
 qBGVa2VztmkNtB1ZXGHIpHXnz9YWcNgLRNoO+WGnPdHIKWXszWvLkljA+8MoTrHFb4RQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wcFoU-0004mo-R8 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 05:06:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id CD497444F8;
 Wed, 24 Jun 2026 05:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445E41F00A3A;
 Wed, 24 Jun 2026 05:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782277566;
 bh=mHBePYhFW8fiLIg4xT1lr+T1/B7j/TW7c31PF92HJp4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=anSngnwsuV1ySYv/vkdt57WvzoHLFFSb4QBO7PIFE/a80adwv1HnUSCk31UZoFOlr
 AyBfUxX4Kal517rupG4vo+b8ubwDpr9ZvwnuCCxDUJbUGEb6iaT3ZPqOKzTPjTwOwt
 b5hHC/bM099LGniIoFFXSFHToKZZv0O331AytS0Bn6c4EnjlOlEwrXzgynYRvDJ9vb
 y4j08QO3cWa84ULaPSk4ikZ1+OvHj+r+4s0DAyr5rlpSO57JIyo28Uejhvq3VX25n7
 Swns+KSNm4vZ2ljMXFhhT+xxlX1lsA3ejFg8P+ErszG8IX1/KV+n9irSeK4/Vnjrqk
 65PqagQL0vaOQ==
To: linux-fscrypt@vger.kernel.org
Date: Tue, 23 Jun 2026 22:03:31 -0700
Message-ID: <20260624050334.124606-14-ebiggers@kernel.org>
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
 Content preview: Now that fscrypt's file contents en/decryption is always
 implemented
 using blk-crypto when the filesystem is block-based, the fs-layer zeroout
 code in fs/crypto/bio.c is unused code. Remove it, then f [...] 
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
X-Headers-End: 1wcFoU-0004mo-R8
Subject: [f2fs-dev] [PATCH 13/16] fscrypt: Remove fs-layer zeroout code
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
X-Rspamd-Queue-Id: 7364A6BB5AF

Now that fscrypt's file contents en/decryption is always implemented
using blk-crypto when the filesystem is block-based, the fs-layer
zeroout code in fs/crypto/bio.c is unused code.  Remove it, then fold
fscrypt_zeroout_range_inline_crypt() into fscrypt_zeroout_range().

Then make fscrypt_alloc_bounce_page() and fscrypt_crypt_data_unit()
static, since they're no longer called from any other file.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/crypto/bio.c             | 134 +++++++-----------------------------
 fs/crypto/crypto.c          |  14 ++--
 fs/crypto/fscrypt_private.h |   5 --
 3 files changed, 32 insertions(+), 121 deletions(-)

diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index d07740680602..58b6b13eeedd 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -67,20 +67,40 @@ static void fscrypt_zeroout_range_end_io(struct bio *bio)
 		cmpxchg(&done->status, 0, bio->bi_status);
 	fscrypt_zeroout_range_done(done);
 	bio_put(bio);
 }
 
-static int fscrypt_zeroout_range_inline_crypt(const struct inode *inode,
-					      loff_t pos, sector_t sector,
-					      u64 len)
+/**
+ * fscrypt_zeroout_range() - zero out a range of blocks in an encrypted file
+ * @inode: the file's inode
+ * @pos: the first file position (in bytes) to zero out
+ * @sector: the first sector to zero out
+ * @len: bytes to zero out
+ *
+ * Zero out filesystem blocks in an encrypted regular file on-disk, i.e. write
+ * ciphertext blocks which decrypt to the all-zeroes block.  The blocks must be
+ * both logically and physically contiguous.  It's also assumed that the
+ * filesystem only uses a single block device, ->s_bdev.  @len must be a
+ * multiple of the file system logical block size.
+ *
+ * Note that since each block uses a different IV, this involves writing a
+ * different ciphertext to each block; we can't simply reuse the same one.
+ *
+ * Return: 0 on success; -errno on failure.
+ */
+int fscrypt_zeroout_range(const struct inode *inode, loff_t pos,
+			  sector_t sector, u64 len)
 {
 	struct fscrypt_zero_done done = {
 		.pending	= ATOMIC_INIT(1),
 		.done		= COMPLETION_INITIALIZER_ONSTACK(done.done),
 	};
 
-	while (len) {
+	if (len == 0)
+		return 0;
+
+	do {
 		struct bio *bio;
 		unsigned int n;
 
 		bio = bio_alloc(inode->i_sb->s_bdev, BIO_MAX_VECS, REQ_OP_WRITE,
 				GFP_NOFS);
@@ -100,117 +120,13 @@ static int fscrypt_zeroout_range_inline_crypt(const struct inode *inode,
 				break;
 		}
 
 		atomic_inc(&done.pending);
 		blk_crypto_submit_bio(bio);
-	}
+	} while (len);
 
 	fscrypt_zeroout_range_done(&done);
 
 	wait_for_completion(&done.done);
 	return blk_status_to_errno(done.status);
 }
-
-/**
- * fscrypt_zeroout_range() - zero out a range of blocks in an encrypted file
- * @inode: the file's inode
- * @pos: the first file position (in bytes) to zero out
- * @sector: the first sector to zero out
- * @len: bytes to zero out
- *
- * Zero out filesystem blocks in an encrypted regular file on-disk, i.e. write
- * ciphertext blocks which decrypt to the all-zeroes block.  The blocks must be
- * both logically and physically contiguous.  It's also assumed that the
- * filesystem only uses a single block device, ->s_bdev.  @len must be a
- * multiple of the file system logical block size.
- *
- * Note that since each block uses a different IV, this involves writing a
- * different ciphertext to each block; we can't simply reuse the same one.
- *
- * Return: 0 on success; -errno on failure.
- */
-int fscrypt_zeroout_range(const struct inode *inode, loff_t pos,
-			  sector_t sector, u64 len)
-{
-	const struct fscrypt_inode_info *ci = fscrypt_get_inode_info_raw(inode);
-	const unsigned int du_bits = ci->ci_data_unit_bits;
-	const unsigned int du_size = 1U << du_bits;
-	const unsigned int du_per_page_bits = PAGE_SHIFT - du_bits;
-	const unsigned int du_per_page = 1U << du_per_page_bits;
-	u64 du_index = pos >> du_bits;
-	u64 du_remaining = len >> du_bits;
-	struct page *pages[16]; /* write up to 16 pages at a time */
-	unsigned int nr_pages;
-	unsigned int i;
-	unsigned int offset;
-	struct bio *bio;
-	int ret, err;
-
-	if (len == 0)
-		return 0;
-
-	if (fscrypt_inode_uses_inline_crypto(inode))
-		return fscrypt_zeroout_range_inline_crypt(inode, pos, sector,
-							  len);
-
-	BUILD_BUG_ON(ARRAY_SIZE(pages) > BIO_MAX_VECS);
-	nr_pages = min_t(u64, ARRAY_SIZE(pages),
-			 (du_remaining + du_per_page - 1) >> du_per_page_bits);
-
-	/*
-	 * We need at least one page for ciphertext.  Allocate the first one
-	 * from a mempool, with __GFP_DIRECT_RECLAIM set so that it can't fail.
-	 *
-	 * Any additional page allocations are allowed to fail, as they only
-	 * help performance, and waiting on the mempool for them could deadlock.
-	 */
-	for (i = 0; i < nr_pages; i++) {
-		pages[i] = fscrypt_alloc_bounce_page(i == 0 ? GFP_NOFS :
-						     GFP_NOWAIT);
-		if (!pages[i])
-			break;
-	}
-	nr_pages = i;
-	if (WARN_ON_ONCE(nr_pages <= 0))
-		return -EINVAL;
-
-	/* This always succeeds since __GFP_DIRECT_RECLAIM is set. */
-	bio = bio_alloc(inode->i_sb->s_bdev, nr_pages, REQ_OP_WRITE, GFP_NOFS);
-
-	do {
-		bio->bi_iter.bi_sector = sector;
-
-		i = 0;
-		offset = 0;
-		do {
-			err = fscrypt_crypt_data_unit(ci, FS_ENCRYPT, du_index,
-						      ZERO_PAGE(0), pages[i],
-						      du_size, offset);
-			if (err)
-				goto out;
-			du_index++;
-			sector += 1U << (du_bits - SECTOR_SHIFT);
-			du_remaining--;
-			offset += du_size;
-			if (offset == PAGE_SIZE || du_remaining == 0) {
-				ret = bio_add_page(bio, pages[i++], offset, 0);
-				if (WARN_ON_ONCE(ret != offset)) {
-					err = -EIO;
-					goto out;
-				}
-				offset = 0;
-			}
-		} while (i != nr_pages && du_remaining != 0);
-
-		err = submit_bio_wait(bio);
-		if (err)
-			goto out;
-		bio_reset(bio, inode->i_sb->s_bdev, REQ_OP_WRITE);
-	} while (du_remaining != 0);
-	err = 0;
-out:
-	bio_put(bio);
-	for (i = 0; i < nr_pages; i++)
-		fscrypt_free_bounce_page(pages[i]);
-	return err;
-}
 EXPORT_SYMBOL(fscrypt_zeroout_range);
diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 94dd6c89ddcd..8c4660429418 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -47,11 +47,11 @@ void fscrypt_enqueue_decrypt_work(struct work_struct *work)
 {
 	queue_work(fscrypt_read_workqueue, work);
 }
 EXPORT_SYMBOL(fscrypt_enqueue_decrypt_work);
 
-struct page *fscrypt_alloc_bounce_page(gfp_t gfp_flags)
+static struct page *fscrypt_alloc_bounce_page(gfp_t gfp_flags)
 {
 	if (WARN_ON_ONCE(!fscrypt_bounce_page_pool)) {
 		/*
 		 * Oops, the filesystem called a function that uses the bounce
 		 * page pool, but it didn't set needs_bounce_pages.
@@ -63,12 +63,11 @@ struct page *fscrypt_alloc_bounce_page(gfp_t gfp_flags)
 
 /**
  * fscrypt_free_bounce_page() - free a ciphertext bounce page
  * @bounce_page: the bounce page to free, or NULL
  *
- * Free a bounce page that was allocated by fscrypt_encrypt_pagecache_blocks(),
- * or by fscrypt_alloc_bounce_page() directly.
+ * Free a bounce page that was allocated by fscrypt_encrypt_pagecache_blocks().
  */
 void fscrypt_free_bounce_page(struct page *bounce_page)
 {
 	if (!bounce_page)
 		return;
@@ -105,14 +104,15 @@ void fscrypt_generate_iv(union fscrypt_iv *iv, u64 index,
 	}
 	iv->index = cpu_to_le64(index);
 }
 
 /* Encrypt or decrypt a single "data unit" of file contents. */
-int fscrypt_crypt_data_unit(const struct fscrypt_inode_info *ci,
-			    fscrypt_direction_t rw, u64 index,
-			    struct page *src_page, struct page *dest_page,
-			    unsigned int len, unsigned int offs)
+static int fscrypt_crypt_data_unit(const struct fscrypt_inode_info *ci,
+				   fscrypt_direction_t rw, u64 index,
+				   struct page *src_page,
+				   struct page *dest_page, unsigned int len,
+				   unsigned int offs)
 {
 	struct crypto_sync_skcipher *tfm = ci->ci_enc_key.tfm;
 	SYNC_SKCIPHER_REQUEST_ON_STACK(req, tfm);
 	union fscrypt_iv iv;
 	struct scatterlist dst, src;
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 57b7ae2cfafc..da9040407d4a 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -327,15 +327,10 @@ typedef enum {
 } fscrypt_direction_t;
 
 /* crypto.c */
 extern struct kmem_cache *fscrypt_inode_info_cachep;
 int fscrypt_initialize(struct super_block *sb);
-int fscrypt_crypt_data_unit(const struct fscrypt_inode_info *ci,
-			    fscrypt_direction_t rw, u64 index,
-			    struct page *src_page, struct page *dest_page,
-			    unsigned int len, unsigned int offs);
-struct page *fscrypt_alloc_bounce_page(gfp_t gfp_flags);
 
 void __printf(3, 4) __cold
 fscrypt_msg(const struct inode *inode, const char *level, const char *fmt, ...);
 
 #define fscrypt_warn(inode, fmt, ...)		\
-- 
2.54.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
