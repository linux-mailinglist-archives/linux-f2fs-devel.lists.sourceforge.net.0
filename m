Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 702E739C29D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Jun 2021 23:39:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aWqOg2tBsEgGSx82UIdjFZUn/GK5eFPfRwVTAsGQxDY=; b=E4X+wdQlep8iN36RIhxwpOjIK
	ElWz+bMbFyVQirATfCl0j+MKZpdjBL63WkqRB/O03G5gxCGKYU8IELOcZ9mswYi8RjGTUSVKPUdb5
	TsXam+QJrHRHPgNvq1MLdzC+R6/cHINJUBuhMGP6QRUeVv+xm/EUkArehBLkJubn8q+K8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lpHXS-0005Ih-MN; Fri, 04 Jun 2021 21:39:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <3epa6YAYKAJ0P7QV7QDLLDIB.9LJ@flex--satyat.bounces.google.com>)
 id 1lpHXR-0005IV-CB
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 21:39:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=91peql34DHbFUki+AbIkoVzV6GEWt4wa1rjinU0Vj1o=; b=YOx9LZqWVq1hMiFxuCD3/Le2c
 Vt42eIM589W93/lIoCpceumOXZO4gryw2KQHNQ8IeqBuiNXoxh0kzM8DHo0MS1A6ZXOC/E2AWTu+S
 GePGs1XNvbaxB91PD0D5NkoxpXtiZ55t0XfJPIKfnBs27rhX4PjQKdDwC4pmnN08xed5g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=91peql34DHbFUki+AbIkoVzV6GEWt4wa1rjinU0Vj1o=; b=bOulThoW3/uRAc7KNr3jjhVEqy
 zBEzFessLbRvHqE3i/HlPs9L4AVk2d9d76/oif8Gmb0FgCLmJXMqr6VsaIPMEjnp1p6M6J5K9IETT
 H1FxniaBI8QUJJhNHwHMoyG//NoSv/TA9XrMC65nESfpyrwnb/fEDT+FQo+LlPwVIIXI=;
Received: from mail-vs1-f73.google.com ([209.85.217.73])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lpHXN-00AsXl-M0
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 21:39:34 +0000
Received: by mail-vs1-f73.google.com with SMTP id
 j11-20020a67ef0b0000b029025d2626b5beso91343vsr.18
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 04 Jun 2021 14:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=91peql34DHbFUki+AbIkoVzV6GEWt4wa1rjinU0Vj1o=;
 b=NWM6rSqjQWgBV4b0PQCeKKpM41Gh30JBudqV4IzVKloaLmDl/Elq/REtE98KKwRDDK
 RoyIta1OKr/9Zo6G9QXrLium4ej+9gKZTVPYUePqI1jhOJgobWyhOoEeUm6Z8HlMRjIr
 Qx4GLl9jime2jzklU9y2MF4l4VIiast22wwPkx8CULvJraclZ2P+a0Rou3l70zG/oHiq
 1UjT69ghMT/VyqfhLtg/Z6iCpGrigd9QganfvoleBrBwR0XeBn1h+LbhUsV4OYDFF6iX
 rkUigqHsbMPT6bWEOC6ezUgYqzhG+7kTT2s2TUnbwbfhC+8Z9agd+FqZP4QJKKf7EKS3
 yU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=91peql34DHbFUki+AbIkoVzV6GEWt4wa1rjinU0Vj1o=;
 b=mxULxF5+Z0nQS7dYUULgB/8ZEH2qnEFSdYtRYF5ChIjTrxrvW0zZ8deEqXtfF5DnNJ
 L0IEJyxegDrY4RiVESsIFhIbAKU1y5znceMDhcN9FWSplT3kaA4VTrBIfgU4AF8EIrKG
 jWrUwXESIibIy6tQnY6IMpty2ULsHL0T3Kgig81qESIx32JhKpR3Pb8uBdBzKWZqLIDs
 BO1FwtONq29A01fn/1mxs1cl5EV/+oJ3m9L20V/91I2wyY7o7xhjI0mHm+jHn96GAjoA
 k51CKg6VK9n9OkK+kDDUfitM+4JSm9t6aafc3/DRqBJVczxpBIAngVfLVSE7fNebS6hg
 nPVA==
X-Gm-Message-State: AOAM5317puTGVTYWEi2ByEKN2+5o0jjm9kE0dmgePsxxWFnnvU6jAqA7
 NLqnm3hMHCly7ER5og1UX6YipaTQxDk=
X-Google-Smtp-Source: ABdhPJyxZNAgaBzH8MB4R3w5D0FDEiNYSY0E6g3pRNVW4sq6jgFG0GaBevF/RjxS6fOw2/bE9D33hwV+eRU=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a05:6214:428:: with SMTP id
 a8mr3037233qvy.3.1622840954643; Fri, 04 Jun 2021 14:09:14 -0700 (PDT)
Date: Fri,  4 Jun 2021 21:09:01 +0000
In-Reply-To: <20210604210908.2105870-1-satyat@google.com>
Message-Id: <20210604210908.2105870-3-satyat@google.com>
Mime-Version: 1.0
References: <20210604210908.2105870-1-satyat@google.com>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, "Darrick J . Wong" <darrick.wong@oracle.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.73 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.73 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1lpHXN-00AsXl-M0
Subject: [f2fs-dev] [PATCH v9 2/9] block: blk-crypto: relax alignment
 requirements for bvecs in bios
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: linux-block@vger.kernel.org, Eric Biggers <ebiggers@google.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 Satya Tangirala <satyat@google.com>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

blk-crypto only accepted bios whose bvecs' offsets and lengths were aligned
to the crypto data unit size, since blk-crypto-fallback required that to
work correctly.

Now that the blk-crypto-fallback has been updated to work without that
assumption, we relax the alignment requirement - blk-crypto now only needs
the total size of the bio to be aligned to the crypto data unit size.

Co-developed-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
---
 block/blk-crypto.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/block/blk-crypto.c b/block/blk-crypto.c
index c5bdaafffa29..06f81e64151d 100644
--- a/block/blk-crypto.c
+++ b/block/blk-crypto.c
@@ -200,22 +200,6 @@ bool bio_crypt_ctx_mergeable(struct bio_crypt_ctx *bc1, unsigned int bc1_bytes,
 	return !bc1 || bio_crypt_dun_is_contiguous(bc1, bc1_bytes, bc2->bc_dun);
 }
 
-/* Check that all I/O segments are data unit aligned. */
-static bool bio_crypt_check_alignment(struct bio *bio)
-{
-	const unsigned int data_unit_size =
-		bio->bi_crypt_context->bc_key->crypto_cfg.data_unit_size;
-	struct bvec_iter iter;
-	struct bio_vec bv;
-
-	bio_for_each_segment(bv, bio, iter) {
-		if (!IS_ALIGNED(bv.bv_len | bv.bv_offset, data_unit_size))
-			return false;
-	}
-
-	return true;
-}
-
 blk_status_t __blk_crypto_init_request(struct request *rq)
 {
 	return blk_ksm_get_slot_for_key(rq->q->ksm, rq->crypt_ctx->bc_key,
@@ -271,7 +255,8 @@ bool __blk_crypto_bio_prep(struct bio **bio_ptr)
 		goto fail;
 	}
 
-	if (!bio_crypt_check_alignment(bio)) {
+	if (!IS_ALIGNED(bio->bi_iter.bi_size,
+			bc_key->crypto_cfg.data_unit_size)) {
 		bio->bi_status = BLK_STS_IOERR;
 		goto fail;
 	}
-- 
2.32.0.rc1.229.g3e70b5a671-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
