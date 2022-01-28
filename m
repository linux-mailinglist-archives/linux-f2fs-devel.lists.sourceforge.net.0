Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 953C14A0468
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 Jan 2022 00:40:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nDaqo-0007t0-Tb; Fri, 28 Jan 2022 23:40:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nDaqm-0007sl-M8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jan 2022 23:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/ok10WbDmhTRKNece83mpN4hp0FIdypGNz7GlyoPoRg=; b=O/W+dI9wwejrHCeDIryapwrixP
 PghuQeTfxaGZT10YjAjn9xYlXk6ypY1+PXMPfyDh55BblV5gM7q/7yPbAeN1cdeu0CWWEPGGw1trr
 Js8TCLDpgMOlhhVhML54rGTrAhKcZwZRaQTmCCUB7xTfOMAg+m91AdJBLVuEb9gcSuAk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/ok10WbDmhTRKNece83mpN4hp0FIdypGNz7GlyoPoRg=; b=Ncx6NZRs17y5g4KuCTpyko+5nz
 IYAZXP9XMiKHC0s1swzIYD3LuXqCrGYXB3N4+jdZvdw5Y360f78ZMslTdG62pRwps4TldvZtRzwth
 GzaJcMXX4C0tBZ4CwD6e6Z4Fg9Ms4pvt5u20tzP58ycX6FlkxgCu5nOwc8x4K95whrs8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nDaqi-0002Hf-SV
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jan 2022 23:40:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9742CB82732;
 Fri, 28 Jan 2022 23:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD01C340EF;
 Fri, 28 Jan 2022 23:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643413202;
 bh=nHFxT7m7n/PO9ZU3JSReFnLKGQ9T4BVIVZVRwmNnf2g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fj+13BS78mdCrmo5S6M/b382/MAfnkitlX3HyZoWmg4D+9S0x/95C5cct4w4L9zBW
 VjsPvxInYpZiwtX4aOKrk/DlSBmvh6e4WBo34Pdv1quVkpRO1NW/F7WTht7toJ+SoG
 IsWT0ATowuzfE57mX9sMPlYEQaGPf3HDehY7aecPAI93s3dtWaVQPd1vbJCa8uhglS
 nufOl+TZz3h/qsbsVyjEBWtnDXq2teEP/DMidl5gsMnWNaCEG24rXCxMzWNLHn1DPN
 8os7U5SMIGS1+SJu5EgxfDU+HQS7FnKhlNduWLwTVnCzBNZdQghd1dWynd4il7K2T2
 BXrL26K8jIJ+g==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 28 Jan 2022 15:39:37 -0800
Message-Id: <20220128233940.79464-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220128233940.79464-1-ebiggers@kernel.org>
References: <20220128233940.79464-1-ebiggers@kernel.org>
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
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nDaqi-0002Hf-SV
Subject: [f2fs-dev] [PATCH v11 2/5] iomap: support direct I/O with fscrypt
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
Cc: Satya Tangirala <satyat@google.com>, Theodore Ts'o <tytso@mit.edu>,
 "Darrick J . Wong" <djwong@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
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
Reviewed-by: Christoph Hellwig <hch@lst.de>
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
2.35.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
