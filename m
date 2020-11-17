Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D67832B67A2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Nov 2020 15:36:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6rkECGmKgN5VlR5zCpliU0kkiV8w9ZAv/IjBdXigYfo=; b=PJjjn+2//XDMPgpzbQ3HgWfEx
	edwgBEkU2xlEFS/rIUK+ufvUcPE9nIuIx4rmCYTbYDJksvf+HBf4AEbu6SgwjDeL8HeRM47NVPQwX
	LRW9Vf5YPBLpJcmV/cv7opH9vnPzutyoHLDKH5P1RzTBoNfM0a9b2OR5z02UNmydxVFHU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kf25s-0007HN-DB; Tue, 17 Nov 2020 14:36:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3GtmzXwYKAJ8R9SX9SFNNFKD.BNL@flex--satyat.bounces.google.com>)
 id 1kf25q-0007HF-QB
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 14:36:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VFLfomyHfS1rChguiUYux0VDzmO87K0fqGJKV/Zo06o=; b=g94tGmbxj9Nv2RWOCXTVph7jo
 RrFQdR3iYui9Nqc1zx/wXtW0zya7CvAQ+cBd144FkYEJWnDMx+PjD/go8mWUIgexbJFWMHs4wx+Fm
 ZbIsDQFOEC9+WHQ7YNZUKcUZ/XuMD9SahTM9F5zmTQFy/pG8h81h2T54UNZsk+RSo+sWY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VFLfomyHfS1rChguiUYux0VDzmO87K0fqGJKV/Zo06o=; b=EOjRrP0wh/zHp0nxx6m/+br4U7
 lw2E7Z7JkmvxxWZ0ZfWT3QYGSOZ9YUvn17fO3a0/CJoAoI157+p2EOaSfqCbchWm7t1Fz6mOIbDSs
 vnIrXQNJaU23J9yevVhjJf2e+wuVaMpP6CxfDfJCgLcMmDf9vhteDrZ76KbydXRoo6Ug=;
Received: from mail-qk1-f202.google.com ([209.85.222.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kf25U-00AULW-GI
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 14:36:25 +0000
Received: by mail-qk1-f202.google.com with SMTP id b191so14101119qkc.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Nov 2020 06:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=VFLfomyHfS1rChguiUYux0VDzmO87K0fqGJKV/Zo06o=;
 b=lsrEjARHRfnK+GRKjAxdOdYK84058343x4ulP/2szJFkfRTORC2ldq4cnjAxiY8jFI
 VQLtam4zqFLuBEcfKLbMnYFBrc32LaXluaMUMRa9Q0lhpOiy17Y8e5FpWCYnvuxFlQcp
 +qgOqNxvhb7p7nbmzb3olVL/Wp9bYkkluw/hVMI8LRZExpX+23VEDIC4LLOSsmGyFkYJ
 uYKVQe833Zw5GqXv9aw6cVkP5qfvpcB7mibNUbGyOlTqiXHs2rELMbbwEkRA7ghwvovl
 8cJR9PNzWNaFeurdO8tvnYukki2HEdBkRu7gHibwFjZNw2DaBb8Sv8CWJWiewGjFMyKg
 o55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=VFLfomyHfS1rChguiUYux0VDzmO87K0fqGJKV/Zo06o=;
 b=rHZndFSXNX0yo3oFAQheAlozQD2AiHrVRsQdYbXCjCLr7SJ/9y9W707rjeQTNvuKeF
 W5DkPJ7muMu0pOl7EceA89kK7sngZEoCfTyPKxergKCrzymmA9jO5v9YcpMUFLBx9Nea
 XN9+QiLgrUiBrej6nFn02VBwbhh8LDNDSYM9bynTaZ7QP2CKa9Dr+KZ37r90TVVAO1Gj
 uWIy6ZA56jh+UOVKLt7qnezH1HsQGFbwTZ3Eli8aSfTWH7DWpylWD60SrZwIyXp+QIyB
 h6GLN44FtSv1ckaVdKGNMAxVfUTmlhswTv09sXb0t7RYGHz6QYuXEhrNT0fiBiY/CG6J
 C4rw==
X-Gm-Message-State: AOAM5336aWtqIsDpSMzRxlAw5UtkZLE6KBR0aYgYPI9RNpqoP9l6k6sM
 9ZpMCEQlu9JEUJa0Mtinj/7OABDNT2c=
X-Google-Smtp-Source: ABdhPJziptkvCq37CzgbpEBQNKwt2yD7i4Pi8fsOTIWooGKOH1aD86wFQm0soQyhT2NOVUgerF6aSe6rQFQ=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:ad4:470d:: with SMTP id
 k13mr21059648qvz.40.1605622042064; 
 Tue, 17 Nov 2020 06:07:22 -0800 (PST)
Date: Tue, 17 Nov 2020 14:07:05 +0000
In-Reply-To: <20201117140708.1068688-1-satyat@google.com>
Message-Id: <20201117140708.1068688-6-satyat@google.com>
Mime-Version: 1.0
References: <20201117140708.1068688-1-satyat@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, "Darrick J . Wong" <darrick.wong@oracle.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.202 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kf25U-00AULW-GI
Subject: [f2fs-dev] [PATCH v7 5/8] iomap: support direct I/O with fscrypt
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

From: Eric Biggers <ebiggers@google.com>

Set bio crypt contexts on bios by calling into fscrypt when required.
No DUN contiguity checks are done - callers are expected to set up the
iomap correctly to ensure that each bio submitted by iomap will not have
blocks with incontiguous DUNs by calling fscrypt_limit_io_blocks()
appropriately.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Co-developed-by: Satya Tangirala <satyat@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
---
 fs/iomap/direct-io.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index 933f234d5bec..b4240cc3c9f9 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -6,6 +6,7 @@
 #include <linux/module.h>
 #include <linux/compiler.h>
 #include <linux/fs.h>
+#include <linux/fscrypt.h>
 #include <linux/iomap.h>
 #include <linux/backing-dev.h>
 #include <linux/uio.h>
@@ -185,11 +186,14 @@ static void
 iomap_dio_zero(struct iomap_dio *dio, struct iomap *iomap, loff_t pos,
 		unsigned len)
 {
+	struct inode *inode = file_inode(dio->iocb->ki_filp);
 	struct page *page = ZERO_PAGE(0);
 	int flags = REQ_SYNC | REQ_IDLE;
 	struct bio *bio;
 
 	bio = bio_alloc(GFP_KERNEL, 1);
+	fscrypt_set_bio_crypt_ctx(bio, inode, pos >> inode->i_blkbits,
+				  GFP_KERNEL);
 	bio_set_dev(bio, iomap->bdev);
 	bio->bi_iter.bi_sector = iomap_sector(iomap, pos);
 	bio->bi_private = dio;
@@ -272,6 +276,8 @@ iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
 		}
 
 		bio = bio_alloc(GFP_KERNEL, nr_pages);
+		fscrypt_set_bio_crypt_ctx(bio, inode, pos >> inode->i_blkbits,
+					  GFP_KERNEL);
 		bio_set_dev(bio, iomap->bdev);
 		bio->bi_iter.bi_sector = iomap_sector(iomap, pos);
 		bio->bi_write_hint = dio->iocb->ki_hint;
-- 
2.29.2.299.gdc1121823c-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
