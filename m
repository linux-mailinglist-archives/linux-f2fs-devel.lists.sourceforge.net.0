Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C6B2FF85D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Jan 2021 00:03:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e4ad6hKY97WXFAYNf9myxqws+1lbOIto+jStzvU07FE=; b=YQwq3wD1NHIh9/UzS5gpz/9y1
	IyHwyWJ+lZkV52s1KooFUk71/vxDExkWxTZA09jlv7HI11mgdczFtQv4Xu8MJnIPl0/Yh05CIWthI
	o8OszPniqrmtlAs0LCuLVamLhpQauTte54TULwuQiCcI6kGVyK5YaGOjxsDYLzdOxIyvc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l2iza-0002hY-32; Thu, 21 Jan 2021 23:03:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3TwgKYAYKAI4AsBGsBy66y3w.u64@flex--satyat.bounces.google.com>)
 id 1l2izY-0002hG-Pt
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Jan 2021 23:03:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BAlJPK4qVbFO+YocbKUqMkxk0C4PzWuOV8MSNSKCIhI=; b=fDEhckMGRd4YOI0Ad7d4+0AEi
 KE9f1jNFvIW2ONPaN3fWEGH2FdSCRUQX7d1PLEOzAXsSMKF6DOCa94NF7QM+EJ4VEtnREoIKZn9t3
 67glHqzZ86FPJpwWlnFjHtfJY2LsNSzMtf15S1CuvaArqRW+cubLjn7q9NMeQYUIyoU7g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BAlJPK4qVbFO+YocbKUqMkxk0C4PzWuOV8MSNSKCIhI=; b=cTkc8bJxQM4G09JZnXTwpfv5J7
 DQNpWenU9MQEKIRGNhyPk1Vi/Ivu5spdWrZsxLO+/j/iTorPV7qTb5gJ6edKtkfXGhP0j/nQBihBD
 4jKi6uKqkSRHaq+FaXdu4RzhI70KiXLsjW2bSNUdAWNqlUCIimjYpi9yRokoSVXV/1sM=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l2izU-006Hgk-VB
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Jan 2021 23:03:52 +0000
Received: by mail-yb1-f202.google.com with SMTP id k33so3664107ybj.14
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Jan 2021 15:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=BAlJPK4qVbFO+YocbKUqMkxk0C4PzWuOV8MSNSKCIhI=;
 b=QpJhHzvp1GXeEjDGYNxaJ+4dbtZiUzLq85/2LS484mjd4YFHF0DMU88K4lo+zwGWkM
 9LWilqjyHM5F5TtGZpKac7DrVr7HfcqlaVQK2F+DnPn7HQ1OpLiTN2syMLwN6sUYSfyq
 kMRuDoXMZo7mTk3nzJtbmwY7+bGtriVPvGjQkk+MnGqGoiLkOelUThpM6hXWK0x36ohG
 e4kaG1rglU1iTZ1tDhy7HPk7x9BjPJ8bIRyrdO3svNhEMvqS/Hns9be4EINUxvy/KNns
 rOQqszDYyJegCrtkYY9PpwY9HTVsvA0YScQQg5XyqxRJ8fMZK7LQEekKi+Z66tBXsO7I
 6JBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=BAlJPK4qVbFO+YocbKUqMkxk0C4PzWuOV8MSNSKCIhI=;
 b=BlW7Y0R3j7jTaydYPiRmzCumB9iakygWBKZnqWDctcIlTNaW4j8cwhwOhUdUc+QzUw
 oZgqOhlYMd2i/LiSn/9+EtbXB5t/pSnJ5lwvD1B79uZq/EN4iDxhCuLmfNtkfaCXyIdF
 +ROfwrltvKy00/SzDXlVpGvHtZWCOrJtCv665Rza3+iAKEpHyJlF10kJsmRObTBhqN8f
 QQzs+LfAe7yEfz9w5KFwsIfcvJ+KMBzoBxc+qBElURyl3js+S5KRKRgSKIVJPo9sXB41
 zasgxP4+Kv5NigvhhNRhUiPGLgO9S1mi0YALba9esD9M/iKaGAI90JGUjieESfslvbTr
 vFBQ==
X-Gm-Message-State: AOAM531iAFC5ujvvp8O6jQ0C7jckx5xbcVgBdFxmoyCswpLAP66CbkjQ
 +CofcG5DV0bOaaLBd+7FTfo4ydhQrI0=
X-Google-Smtp-Source: ABdhPJwxayAKSF6mXmBJ8++TA75KLd08uhG910WxJC5CctiAVx3ai3oKRw6joRzYaCJBGp4lZOg1Q76giQM=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a25:9d83:: with SMTP id
 v3mr2313605ybp.368.1611270223182; 
 Thu, 21 Jan 2021 15:03:43 -0800 (PST)
Date: Thu, 21 Jan 2021 23:03:30 +0000
In-Reply-To: <20210121230336.1373726-1-satyat@google.com>
Message-Id: <20210121230336.1373726-3-satyat@google.com>
Mime-Version: 1.0
References: <20210121230336.1373726-1-satyat@google.com>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, "Darrick J . Wong" <darrick.wong@oracle.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.202 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.202 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1l2izU-006Hgk-VB
Subject: [f2fs-dev] [PATCH v8 2/8] block: blk-crypto: relax alignment
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
index 5da43f0973b4..fcee0038f7e0 100644
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
2.30.0.280.ga3ce27912f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
