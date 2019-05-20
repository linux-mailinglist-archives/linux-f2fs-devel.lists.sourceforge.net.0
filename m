Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B75923D67
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 May 2019 18:30:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hSlBO-0001XK-Tb; Mon, 20 May 2019 16:30:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hSlBN-0001Wl-Fg
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 16:30:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ksTW5t7LrDkdmxxLiVWFi2xvfAWeZOBdnz/ElqdOHQM=; b=MacPxICch/lMlUJCq/I+TRJjb4
 wfyY7WY7wITi4UYp4EsdzC/esWYmh1vuUk3OQXWmdBdicRGc0rkxn4b7YcjL80bZ7+taQiOOgc4Hh
 Bw3xQJhaPbAaNDDeJb5FG9VkmFGDL5l+G9BNVGstWb4mlOXd1VvyD5hdQJZ3l75Mms/Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ksTW5t7LrDkdmxxLiVWFi2xvfAWeZOBdnz/ElqdOHQM=; b=S4nPZmI4hgZ8rkrpA5gfFbeGoT
 I+jkwxLy/62tnM9a9gPXu+w1/FPgNQVdsaVChWawmqMVqLKW2ildMsLilKjMUJS8lF8LZ8rwtOQf4
 3chM9FoBwoVjFR78XAFi14zvQXxNKY4fxxEPDuRWyw9o5vEbgijaA5q8Gd+UA8KMr4as=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hSlBM-00BNhO-77
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 16:30:37 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 23BF321743;
 Mon, 20 May 2019 16:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558369823;
 bh=FsQP/22WhDGSwV7eheG5LJxh8F1YOJFtBPeRIUtSKqs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=1tTDTdCtFZWdMRppc12iWNivhCMli9AU6LE+jjt9uvdwTVFxa3KFrDikvO9dVkK3I
 U9zhYEYzW2vlWVUf/yTtQHCopNynk0H8CFyKpXGCmZzwblSxW/mZ660sNSuNYeyYBk
 CD6jBTj/f12yOD05IfYRdNc4yZUMaXnVj5CGCoTw=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 20 May 2019 09:29:45 -0700
Message-Id: <20190520162952.156212-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190520162952.156212-1-ebiggers@kernel.org>
References: <20190520162952.156212-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 2.4 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hSlBM-00BNhO-77
Subject: [f2fs-dev] [PATCH v2 07/14] fscrypt: handle blocksize < PAGE_SIZE
 in fscrypt_zeroout_range()
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
Cc: linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 Chandan Rajendra <chandan@linux.ibm.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Adjust fscrypt_zeroout_range() to encrypt a block at a time rather than
a page at a time, so that it works when blocksize < PAGE_SIZE.

This isn't optimized for performance, but then again this function
already wasn't optimized for performance.  As a future optimization, we
could submit much larger bios here.

This is in preparation for allowing encryption on ext4 filesystems with
blocksize != PAGE_SIZE.

This is based on work by Chandan Rajendra.

Reviewed-by: Chandan Rajendra <chandan@linux.ibm.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/bio.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index 92b2d5da5d8e1..f9111ffa12ffd 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -72,12 +72,12 @@ EXPORT_SYMBOL(fscrypt_enqueue_decrypt_bio);
 int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 				sector_t pblk, unsigned int len)
 {
+	const unsigned int blockbits = inode->i_blkbits;
+	const unsigned int blocksize = 1 << blockbits;
 	struct page *ciphertext_page;
 	struct bio *bio;
 	int ret, err = 0;
 
-	BUG_ON(inode->i_sb->s_blocksize != PAGE_SIZE);
-
 	ciphertext_page = fscrypt_alloc_bounce_page(GFP_NOWAIT);
 	if (!ciphertext_page)
 		return -ENOMEM;
@@ -85,7 +85,7 @@ int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 	while (len--) {
 		err = fscrypt_crypt_block(inode, FS_ENCRYPT, lblk,
 					  ZERO_PAGE(0), ciphertext_page,
-					  PAGE_SIZE, 0, GFP_NOFS);
+					  blocksize, 0, GFP_NOFS);
 		if (err)
 			goto errout;
 
@@ -95,14 +95,11 @@ int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 			goto errout;
 		}
 		bio_set_dev(bio, inode->i_sb->s_bdev);
-		bio->bi_iter.bi_sector =
-			pblk << (inode->i_sb->s_blocksize_bits - 9);
+		bio->bi_iter.bi_sector = pblk << (blockbits - 9);
 		bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
-		ret = bio_add_page(bio, ciphertext_page,
-					inode->i_sb->s_blocksize, 0);
-		if (ret != inode->i_sb->s_blocksize) {
+		ret = bio_add_page(bio, ciphertext_page, blocksize, 0);
+		if (WARN_ON(ret != blocksize)) {
 			/* should never happen! */
-			WARN_ON(1);
 			bio_put(bio);
 			err = -EIO;
 			goto errout;
-- 
2.21.0.1020.gf2820cf01a-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
