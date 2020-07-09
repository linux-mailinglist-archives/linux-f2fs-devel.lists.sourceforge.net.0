Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3F421A80F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jul 2020 21:48:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E/Gul437mnvka+9u6GF3vjVF0QjBP+g/bTXmUDkECik=; b=UY99FQSYAuQQl7WgkxgUbG9yX
	35of4bZmIsW3W+v7LwWY9jYW34nZJugcpkA8jOJMkvMV2AsW07KgCvJ6B8PgyQ2xwshiRxIfTKMsl
	6R5cesu8s4gQ1twZiztb/j17TGUzme70jAFTtxGRr7o42ts/dg9SvLbuclT4io1+Qw0os=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtcWf-0004yJ-0V; Thu, 09 Jul 2020 19:48:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3b3QHXwYKAHQkSlqSlYggYdW.Uge@flex--satyat.bounces.google.com>)
 id 1jtcWc-0004yB-P1
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 19:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ypiy4fZMSHzKt5otJAVuZ4wRDcklaH0IoN6SqVj7WRE=; b=ktkcwLJDuqQ8KNHRmTYTY+dNT
 1LS66pEL5OfXU+MGJgNchFN7t7Qdm/+e3bjULWZcmrVYD+cP6UaU6TWyfZQ+6/zOygz5r3cxahL1S
 Uv/iObRrAguHs/Wv/+GgP8h9qHsPknmnl9FwrGolLhKKiUNY0OB5cwnkH7k9wmAYcCBos=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ypiy4fZMSHzKt5otJAVuZ4wRDcklaH0IoN6SqVj7WRE=; b=HcBgctlXqPEaDyODLLA7eSPS50
 LOhjYjS+2ANjYKgdFupTFod0efSxUuq5E+GibF584B6J3uq7v+2NFQPAZOeamUvOh4PQ8F/CucvZF
 1725DpIC05xUudlUgFGlxylTMjUf0pldzk0NXv7HVP01bMkOiN6rc+rajyccKrFOEP38=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jtcWa-00FUFK-TB
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 19:48:06 +0000
Received: by mail-yb1-f202.google.com with SMTP id u64so4082942ybf.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 09 Jul 2020 12:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=ypiy4fZMSHzKt5otJAVuZ4wRDcklaH0IoN6SqVj7WRE=;
 b=XSToy1Un+kanZIP/v7I36gilu8B8WWrWl9iO24C66p3jtXJiKaYdsyayZ1DDUtA8RR
 VjWimECct82y/QACP32b1OKg2j4nO6PH8dRrhvXaTUpYW7LqFORAfQuUQSELOVMEeX9+
 cRFRCr+eHO0opvt9lKdKzlMPg5NBfhW52yQ6Ytib5ylohaZ5FQjuBy0ZAh3JnopzzD6R
 4ZD6oa3W8S+TwWlZEOqU3Af3wfN811e60QYmu9DNPY2q1b5jUfVFHVuVdv43lzO4cahH
 Nr/6VPCIs+Dpz1Fxjr15ZWXbxDyZiyfA3UeVPLzA2zZbVhh0XDsOYm2ODMqmVBbRR70t
 0lPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ypiy4fZMSHzKt5otJAVuZ4wRDcklaH0IoN6SqVj7WRE=;
 b=nygq/pCJh3QPgK/y6HEZXS5iat2HahfzGUSCgJLTxwfIUgPscC+TY1+1QXsjzly6gO
 4EZpEGo/iW5ZbHEfoxDFnEkgcBnpHHBZiPZL0g8DWRzwQFQVuXmGgI3r0or0w49NA/cB
 avYISXnYZStLB+2oO6fXPmHxR+1+1AVHDDKM+Jl8r/zwR1DI5LH/qRTvvY9EcwobpjOf
 RZkr1UphNreqg8DDF+Q5OdoqlC4RCD5UFt7BTXLvBaTo5Csow1Z8sI96LTlkxOHseZ2d
 s493XTDhYw1MtmBVDGmTc84B/q5fJlexYv6/2tjgm/YW7FvIK1ZB7OfkiGG2AEWjwo2h
 QygQ==
X-Gm-Message-State: AOAM532WBtS5KGezgay9vHTQRtQs4BBLGB4XhP+jrCDfSqEbDigDcKCa
 5+3f0E3plAiFIJwop/+aJAQ9xyW82/E=
X-Google-Smtp-Source: ABdhPJwH95zt89pXB801EtQRqTBhoBOukmXpLUJNIbCr8au8pzQNgzGnXZYLrnCTro9o7o1SjhJQrRugcl8=
X-Received: by 2002:a25:56c3:: with SMTP id
 k186mr79785452ybb.183.1594324079089; 
 Thu, 09 Jul 2020 12:47:59 -0700 (PDT)
Date: Thu,  9 Jul 2020 19:47:48 +0000
In-Reply-To: <20200709194751.2579207-1-satyat@google.com>
Message-Id: <20200709194751.2579207-3-satyat@google.com>
Mime-Version: 1.0
References: <20200709194751.2579207-1-satyat@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.202 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.202 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtcWa-00FUFK-TB
Subject: [f2fs-dev] [PATCH 2/5] direct-io: add support for fscrypt using
 blk-crypto
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
Cc: Satya Tangirala <satyat@google.com>, Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Set bio crypt contexts on bios by calling into fscrypt when required,
and explicitly check for DUN continuity when adding pages to the bio.
(While DUN continuity is usually implied by logical block contiguity,
this is not the case when using certain fscrypt IV generation methods
like IV_INO_LBLK_32).

Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
---
 fs/direct-io.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/fs/direct-io.c b/fs/direct-io.c
index 6d5370eac2a8..f27f7e3780ee 100644
--- a/fs/direct-io.c
+++ b/fs/direct-io.c
@@ -24,6 +24,7 @@
 #include <linux/module.h>
 #include <linux/types.h>
 #include <linux/fs.h>
+#include <linux/fscrypt.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/highmem.h>
@@ -411,6 +412,7 @@ dio_bio_alloc(struct dio *dio, struct dio_submit *sdio,
 	      sector_t first_sector, int nr_vecs)
 {
 	struct bio *bio;
+	struct inode *inode = dio->inode;
 
 	/*
 	 * bio_alloc() is guaranteed to return a bio when allowed to sleep and
@@ -418,6 +420,9 @@ dio_bio_alloc(struct dio *dio, struct dio_submit *sdio,
 	 */
 	bio = bio_alloc(GFP_KERNEL, nr_vecs);
 
+	fscrypt_set_bio_crypt_ctx(bio, inode,
+				  sdio->cur_page_fs_offset >> inode->i_blkbits,
+				  GFP_KERNEL);
 	bio_set_dev(bio, bdev);
 	bio->bi_iter.bi_sector = first_sector;
 	bio_set_op_attrs(bio, dio->op, dio->op_flags);
@@ -782,9 +787,17 @@ static inline int dio_send_cur_page(struct dio *dio, struct dio_submit *sdio,
 		 * current logical offset in the file does not equal what would
 		 * be the next logical offset in the bio, submit the bio we
 		 * have.
+		 *
+		 * When fscrypt inline encryption is used, data unit number
+		 * (DUN) contiguity is also required.  Normally that's implied
+		 * by logical contiguity.  However, certain IV generation
+		 * methods (e.g. IV_INO_LBLK_32) don't guarantee it.  So, we
+		 * must explicitly check fscrypt_mergeable_bio() too.
 		 */
 		if (sdio->final_block_in_bio != sdio->cur_page_block ||
-		    cur_offset != bio_next_offset)
+		    cur_offset != bio_next_offset ||
+		    !fscrypt_mergeable_bio(sdio->bio, dio->inode,
+					   cur_offset >> dio->inode->i_blkbits))
 			dio_bio_submit(dio, sdio);
 	}
 
-- 
2.27.0.383.g050319c2ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
