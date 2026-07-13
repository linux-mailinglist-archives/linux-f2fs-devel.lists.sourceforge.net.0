Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j5gpIydQVGockgMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jul 2026 04:40:39 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECE6746B52
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jul 2026 04:40:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=fqnx87T1;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=BLSVABSM;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=SaDkE17z;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=ANkDROT4;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WL67gTnY56CwVlfIftOHm0tXKymQ222kTNDNa5lRbRA=; b=fqnx87T1D9e+bqdSmpkmw6Jb5E
	rBLgQYIJwnZgPjA52vVcLq9Hy37r9NG3SLO5kylsA76JsxODsNN+kvrkMh6ya/39Atfqdy4pkYpX7
	SJu9ICxVf2AzkvvAjXVfU8w9D5Ccwx9J1x5orxCuDkIx9AR5mPJTZN483zVuawj5S3HY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wj6ay-00043B-Ou;
	Mon, 13 Jul 2026 02:40:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wj6ag-0003ze-I8
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jul 2026 02:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pE7bbyCIfEGQNNQjWamewFFH78jPMNhR5rgr+ViUAxo=; b=BLSVABSMxtRxp4h8rOA+exRdWy
 9Fz99a7+wuSJomD+mab6l5Rd9Jzp7cYE8Xobc2izo7pj6y/6glgNme7zJZyJN6XPqpb8tfuPft5tS
 UEF9ize/XC9GxqJLCITUKXgeZnGyKibXHbp/mcIEg4NW97PbPaSUKLPM06X7pauL0j/8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pE7bbyCIfEGQNNQjWamewFFH78jPMNhR5rgr+ViUAxo=; b=SaDkE17zKr7BJ1jHsgh83fr15V
 QPqxJCdzrZReXZEoPCrp1t6rTrD2Y6NvCkOojIjBM/j7nDUJ0eV/Yukoc5oKixwPtFpffBlGvcHnW
 sqlZhXRmpDrnJ2t0VQ6APbDn/qkVIafL4V6yqIWk7xPD5Y5Pwcq6eLbVnq3M/AstuG34=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wj6aU-0003DZ-Cu for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Jul 2026 02:40:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id BDA84600FC;
 Mon, 13 Jul 2026 02:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC381F00ACA;
 Mon, 13 Jul 2026 02:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783910395;
 bh=pE7bbyCIfEGQNNQjWamewFFH78jPMNhR5rgr+ViUAxo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ANkDROT4zMUquKbNg79DiTBRB2KaONx4VL4tRsPrOnL1S89gwLaDleVkkic/mTBEf
 0LMsEOvaCRf/xAE9PvC0SrmuU06RsX0kr2LuFfEj67FCsC4UdqKpuCD2TxqARRl+bW
 /L/VZmOJ1phODXlH6KKN49NUV9KCfe7Tu4ZzTVzosCWZD3qHozbpU+L4ZU6gYvJBI4
 eFvPPhW/miGQB453uD69mQqi3Z4YhYbR3QSeT0yiqZBv2DE+3K54I6ESqKbWwlLIWq
 UeT9iOkNTfmEPI496CcAm0r6aw2RpbILrrElltAkZ5xb7Kj5VS3wWvh1zylhg3/uA7
 QmCofVXcg0DsA==
To: linux-fscrypt@vger.kernel.org
Date: Sun, 12 Jul 2026 22:37:07 -0400
Message-ID: <20260713023708.9245-17-ebiggers@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713023708.9245-1-ebiggers@kernel.org>
References: <20260713023708.9245-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Now that fscrypt always uses blk-crypto on block-based
 filesystems, 
 there's no meaningful difference between bio.c and inline_crypt.c. Therefore
 merge the two files into one named block.c. Note: I didn't carry over bio.c's
 "Copyright (C) 2015, Motorola Mobility", as none of the code that applied
 to remained. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wj6aU-0003DZ-Cu
Subject: [f2fs-dev] [PATCH v3 16/17] fscrypt: Merge bio.c and inline_crypt.c
 into block.c
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lst.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1ECE6746B52

Now that fscrypt always uses blk-crypto on block-based filesystems,
there's no meaningful difference between bio.c and inline_crypt.c.
Therefore merge the two files into one named block.c.

Note: I didn't carry over bio.c's "Copyright (C) 2015, Motorola
Mobility", as none of the code that applied to remained.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/crypto/Makefile                    |   3 +-
 fs/crypto/bio.c                       | 100 --------------------------
 fs/crypto/{inline_crypt.c => block.c} |  96 +++++++++++++++++++++++--
 fs/crypto/fscrypt_private.h           |   2 +-
 include/linux/fscrypt.h               |  22 +++---
 5 files changed, 101 insertions(+), 122 deletions(-)
 delete mode 100644 fs/crypto/bio.c
 rename fs/crypto/{inline_crypt.c => block.c} (79%)

diff --git a/fs/crypto/Makefile b/fs/crypto/Makefile
index 652c7180ec6d..b03e02f0f09d 100644
--- a/fs/crypto/Makefile
+++ b/fs/crypto/Makefile
@@ -10,5 +10,4 @@ fscrypto-y := crypto.o \
 	      keysetup_v1.o \
 	      policy.o
 
-fscrypto-$(CONFIG_BLOCK) += bio.o
-fscrypto-$(CONFIG_FS_ENCRYPTION_INLINE_CRYPT) += inline_crypt.o
+fscrypto-$(CONFIG_BLOCK) += block.o
diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
deleted file mode 100644
index db095258cfca..000000000000
--- a/fs/crypto/bio.c
+++ /dev/null
@@ -1,100 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Utility functions for file contents encryption/decryption on
- * block device-based filesystems.
- *
- * Copyright (C) 2015, Google, Inc.
- * Copyright (C) 2015, Motorola Mobility
- */
-
-#include <linux/bio.h>
-#include <linux/export.h>
-#include <linux/module.h>
-#include <linux/namei.h>
-#include <linux/pagemap.h>
-
-#include "fscrypt_private.h"
-
-struct fscrypt_zero_done {
-	atomic_t		pending;
-	blk_status_t		status;
-	struct completion	done;
-};
-
-static void fscrypt_zeroout_range_done(struct fscrypt_zero_done *done)
-{
-	if (atomic_dec_and_test(&done->pending))
-		complete(&done->done);
-}
-
-static void fscrypt_zeroout_range_end_io(struct bio *bio)
-{
-	struct fscrypt_zero_done *done = bio->bi_private;
-
-	if (bio->bi_status)
-		cmpxchg(&done->status, 0, bio->bi_status);
-	fscrypt_zeroout_range_done(done);
-	bio_put(bio);
-}
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
-	struct fscrypt_zero_done done = {
-		.pending	= ATOMIC_INIT(1),
-		.done		= COMPLETION_INITIALIZER_ONSTACK(done.done),
-	};
-
-	if (len == 0)
-		return 0;
-
-	do {
-		struct bio *bio;
-		unsigned int n;
-
-		bio = bio_alloc(inode->i_sb->s_bdev, BIO_MAX_VECS, REQ_OP_WRITE,
-				GFP_NOFS);
-		bio->bi_iter.bi_sector = sector;
-		bio->bi_private = &done;
-		bio->bi_end_io = fscrypt_zeroout_range_end_io;
-		fscrypt_set_bio_crypt_ctx(bio, inode, pos, GFP_NOFS);
-
-		for (n = 0; n < BIO_MAX_VECS; n++) {
-			unsigned int bytes_this_page = min(len, PAGE_SIZE);
-
-			__bio_add_page(bio, ZERO_PAGE(0), bytes_this_page, 0);
-			len -= bytes_this_page;
-			pos += bytes_this_page;
-			sector += (bytes_this_page >> SECTOR_SHIFT);
-			if (!len || !fscrypt_mergeable_bio(bio, inode, pos))
-				break;
-		}
-
-		atomic_inc(&done.pending);
-		blk_crypto_submit_bio(bio);
-	} while (len);
-
-	fscrypt_zeroout_range_done(&done);
-
-	wait_for_completion(&done.done);
-	return blk_status_to_errno(done.status);
-}
-EXPORT_SYMBOL(fscrypt_zeroout_range);
diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/block.c
similarity index 79%
rename from fs/crypto/inline_crypt.c
rename to fs/crypto/block.c
index 14c8af322c2f..059b7ecc70ea 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/block.c
@@ -1,20 +1,20 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Inline encryption support for fscrypt
+ * File contents en/decryption on block-based filesystems
  *
  * Copyright 2019 Google LLC
  */
 
 /*
- * With "inline encryption", the block layer handles the decryption/encryption
- * as part of the bio, instead of the filesystem doing the crypto itself via
- * crypto API.  See Documentation/block/inline-encryption.rst.  fscrypt still
- * provides the key and IV to use.
+ * This file implements fscrypt's file contents en/decryption using blk-crypto
+ * (Documentation/block/inline-encryption.rst).  fscrypt assigns a bio_crypt_ctx
+ * with a key and IV to each bio, and the block layer does the en/decryption.
+ *
+ * This file's exported functions are called only by block-based filesystems.
  */
 
 #include <linux/blk-crypto.h>
 #include <linux/blkdev.h>
-#include <linux/buffer_head.h>
 #include <linux/export.h>
 #include <linux/sched/mm.h>
 #include <linux/slab.h>
@@ -341,3 +341,87 @@ u64 fscrypt_limit_io_blocks(const struct inode *inode, u64 lblk, u64 nr_blocks)
 	return min_t(u64, nr_blocks, (u64)U32_MAX + 1 - dun);
 }
 EXPORT_SYMBOL_GPL(fscrypt_limit_io_blocks);
+
+struct fscrypt_zero_done {
+	atomic_t		pending;
+	blk_status_t		status;
+	struct completion	done;
+};
+
+static void fscrypt_zeroout_range_done(struct fscrypt_zero_done *done)
+{
+	if (atomic_dec_and_test(&done->pending))
+		complete(&done->done);
+}
+
+static void fscrypt_zeroout_range_end_io(struct bio *bio)
+{
+	struct fscrypt_zero_done *done = bio->bi_private;
+
+	if (bio->bi_status)
+		cmpxchg(&done->status, 0, bio->bi_status);
+	fscrypt_zeroout_range_done(done);
+	bio_put(bio);
+}
+
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
+{
+	struct fscrypt_zero_done done = {
+		.pending	= ATOMIC_INIT(1),
+		.done		= COMPLETION_INITIALIZER_ONSTACK(done.done),
+	};
+
+	if (len == 0)
+		return 0;
+
+	do {
+		struct bio *bio;
+		unsigned int n;
+
+		bio = bio_alloc(inode->i_sb->s_bdev, BIO_MAX_VECS, REQ_OP_WRITE,
+				GFP_NOFS);
+		bio->bi_iter.bi_sector = sector;
+		bio->bi_private = &done;
+		bio->bi_end_io = fscrypt_zeroout_range_end_io;
+		fscrypt_set_bio_crypt_ctx(bio, inode, pos, GFP_NOFS);
+
+		for (n = 0; n < BIO_MAX_VECS; n++) {
+			unsigned int bytes_this_page = min(len, PAGE_SIZE);
+
+			__bio_add_page(bio, ZERO_PAGE(0), bytes_this_page, 0);
+			len -= bytes_this_page;
+			pos += bytes_this_page;
+			sector += (bytes_this_page >> SECTOR_SHIFT);
+			if (!len || !fscrypt_mergeable_bio(bio, inode, pos))
+				break;
+		}
+
+		atomic_inc(&done.pending);
+		blk_crypto_submit_bio(bio);
+	} while (len);
+
+	fscrypt_zeroout_range_done(&done);
+
+	wait_for_completion(&done.done);
+	return blk_status_to_errno(done.status);
+}
+EXPORT_SYMBOL(fscrypt_zeroout_range);
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index da9040407d4a..74329e0953d1 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -395,7 +395,7 @@ void fscrypt_hkdf_expand(const struct hmac_sha512_key *hkdf, u8 context,
 			 const u8 *info, unsigned int infolen,
 			 u8 *okm, unsigned int okmlen);
 
-/* inline_crypt.c */
+/* block.c */
 #ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
 static inline bool
 fscrypt_using_inline_encryption(const struct fscrypt_inode_info *ci)
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index acf5b28eb9d7..52ff014aeae6 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -446,10 +446,6 @@ bool fscrypt_match_name(const struct fscrypt_name *fname,
 			const u8 *de_name, u32 de_name_len);
 u64 fscrypt_fname_siphash(const struct inode *dir, const struct qstr *name);
 
-/* bio.c */
-int fscrypt_zeroout_range(const struct inode *inode, loff_t pos,
-			  sector_t sector, u64 len);
-
 /* hooks.c */
 int fscrypt_file_open(struct inode *inode, struct file *filp);
 int __fscrypt_prepare_link(struct inode *inode, struct inode *dir,
@@ -737,14 +733,6 @@ static inline int fscrypt_d_revalidate(struct inode *dir, const struct qstr *nam
 	return 1;
 }
 
-/* bio.c */
-
-static inline int fscrypt_zeroout_range(const struct inode *inode, loff_t pos,
-					sector_t sector, u64 len)
-{
-	return -EOPNOTSUPP;
-}
-
 /* hooks.c */
 
 static inline int fscrypt_file_open(struct inode *inode, struct file *filp)
@@ -844,7 +832,7 @@ static inline void fscrypt_set_ops(struct super_block *sb,
 
 #endif	/* !CONFIG_FS_ENCRYPTION */
 
-/* inline_crypt.c */
+/* block.c */
 #ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
 
 void fscrypt_set_bio_crypt_ctx(struct bio *bio, const struct inode *inode,
@@ -854,6 +842,8 @@ bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
 			   loff_t pos);
 
 u64 fscrypt_limit_io_blocks(const struct inode *inode, u64 lblk, u64 nr_blocks);
+int fscrypt_zeroout_range(const struct inode *inode, loff_t pos,
+			  sector_t sector, u64 len);
 
 #else /* CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
 
@@ -873,6 +863,12 @@ static inline u64 fscrypt_limit_io_blocks(const struct inode *inode, u64 lblk,
 {
 	return nr_blocks;
 }
+
+static inline int fscrypt_zeroout_range(const struct inode *inode, loff_t pos,
+					sector_t sector, u64 len)
+{
+	return -EOPNOTSUPP;
+}
 #endif /* !CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
 
 /**
-- 
2.55.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
