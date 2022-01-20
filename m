Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4DE494820
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jan 2022 08:16:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nARgQ-0005Wa-LB; Thu, 20 Jan 2022 07:16:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nARgL-0005WD-Vo
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jan 2022 07:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xyG58hSuLTaNwrMbDuNGyNCATtA6u9OIQh0IWSX6M04=; b=bRTuCu51JZ5b2J2vDb+4uxCvMB
 N7aGfu4wnmHAI2abXNX3i3gznbdWZbgLyo2MyEl3okCTWswFLze8S3l3ONRnICjeBOK7IMQ53arSz
 YAFkUnGPcVzqGkNue21GGPirpilHuegtttpGP8RTEoHU7Ei8UoSqS0Wcfas8DwEppZLw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xyG58hSuLTaNwrMbDuNGyNCATtA6u9OIQh0IWSX6M04=; b=kyqFUm9bxB+UPw5Xfq8lCT/Oh6
 3dafcBhc/AN9mF4nedJOA4clqjC+IpT2DwccL2+k4sG++t50uGFtE4q4DGn1c/dNtB3qqy+6yU1uN
 yWfraTAHv+73QKitGVzCbKy8eD9DaYsvB8IhUtd3FpQVXqKBd/mt2VfbH9L7Q6rb3pYE=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nARgJ-0002kG-RA
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jan 2022 07:16:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7068ECE2000;
 Thu, 20 Jan 2022 07:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9082C340EA;
 Thu, 20 Jan 2022 07:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642662975;
 bh=XFRJyq9JwA9XPF4vR5ySTRSqsenmdAT9W838NjzwtMg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FgNVR2Z3+6Ee+qaX0ZbXbjAKDC07UhzIqb3SGXNLadLSv5hhejusWthRe4qnTC3k5
 Z/W7M97ZR/sdHMLYagSBimRYJ21iEwxtLQsjhE7h3SgTZb8vvoOLraHWyf9fu9c7CK
 NeuXH/yUGskmKxdRSxjXF2IH4MlfWQbv51/fh8HodUP0Q0Dy7kHc6FFgAA0oXWWej6
 mKhBol/dHRJzXePgQEAAI7MTAr3l2WzGuBykz4FjODp/dssy8J4psT0Asl7w9iIy8k
 tfORdcwRHeGQTQNN9cFhqAg9+NEACVxUYFfk7rqAJ1dKMV8XiGbHXrXjdu5EYeliLo
 JR613w5Npkc/A==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Wed, 19 Jan 2022 23:12:12 -0800
Message-Id: <20220120071215.123274-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120071215.123274-1-ebiggers@kernel.org>
References: <20220120071215.123274-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Encrypted files
 traditionally
 haven't supported DIO, due to the need to encrypt/decrypt the data. However,
 when the encryption is implemented using inline encryption (blk-crypto)
 instead of the tradit [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nARgJ-0002kG-RA
Subject: [f2fs-dev] [PATCH v10 2/5] iomap: support direct I/O with fscrypt
 using blk-crypto
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
Cc: Christoph Hellwig <hch@infradead.org>, Theodore Ts'o <tytso@mit.edu>,
 "Darrick J . Wong" <djwong@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Satya Tangirala <satyat@google.com>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Encrypted files traditionally haven't supported DIO, due to the need to
encrypt/decrypt the data.  However, when the encryption is implemented
using inline encryption (blk-crypto) instead of the traditional
filesystem-layer encryption, it is straightforward to support DIO.

Add support for this to the iomap DIO implementation by calling
fscrypt_set_bio_crypt_ctx() to set encryption contexts on the bios.

Don't check for the rare case where a DUN (crypto data unit number)
discontiguity creates a boundary that bios must not cross.  Instead,
filesystems are expected to handle this in ->iomap_begin() by limiting
the length of the mapping so that iomap doesn't have to worry about it.

Co-developed-by: Satya Tangirala <satyat@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
Acked-by: Darrick J. Wong <djwong@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/iomap/direct-io.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index 03ea367df19a4..20325b3926fa3 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -6,6 +6,7 @@
 #include <linux/module.h>
 #include <linux/compiler.h>
 #include <linux/fs.h>
+#include <linux/fscrypt.h>
 #include <linux/pagemap.h>
 #include <linux/iomap.h>
 #include <linux/backing-dev.h>
@@ -179,11 +180,14 @@ static void iomap_dio_bio_end_io(struct bio *bio)
 static void iomap_dio_zero(const struct iomap_iter *iter, struct iomap_dio *dio,
 		loff_t pos, unsigned len)
 {
+	struct inode *inode = file_inode(dio->iocb->ki_filp);
 	struct page *page = ZERO_PAGE(0);
 	int flags = REQ_SYNC | REQ_IDLE;
 	struct bio *bio;
 
 	bio = bio_alloc(GFP_KERNEL, 1);
+	fscrypt_set_bio_crypt_ctx(bio, inode, pos >> inode->i_blkbits,
+				  GFP_KERNEL);
 	bio_set_dev(bio, iter->iomap.bdev);
 	bio->bi_iter.bi_sector = iomap_sector(&iter->iomap, pos);
 	bio->bi_private = dio;
@@ -310,6 +314,8 @@ static loff_t iomap_dio_bio_iter(const struct iomap_iter *iter,
 		}
 
 		bio = bio_alloc(GFP_KERNEL, nr_pages);
+		fscrypt_set_bio_crypt_ctx(bio, inode, pos >> inode->i_blkbits,
+					  GFP_KERNEL);
 		bio_set_dev(bio, iomap->bdev);
 		bio->bi_iter.bi_sector = iomap_sector(iomap, pos);
 		bio->bi_write_hint = dio->iocb->ki_hint;
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
