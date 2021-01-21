Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EEF2FF86B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Jan 2021 00:06:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4WmI1EvKoZo+J+KZTXR7zo2GVYLmXwyK7mJ9Jm7L1xM=; b=Z56aCD3MAmaOIGAZmBohezhiF
	GiuHzaZw6GcAXZ/Cxt+HB3SKBl+quEF5kA3+w2pWmkjw9VE9OAGmGSXbA8Qk91no31ZXLYx588W7O
	8NuAFqlahy3wM6Xctr4TV+ZWsw4kQrS9xX98xabfmbD4GoAcYw5EGlQPsCET2cvUwnAdI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l2j28-0005jG-6l; Thu, 21 Jan 2021 23:06:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3VQgKYAYKAJQGyHMyH4CC492.0CA@flex--satyat.bounces.google.com>)
 id 1l2j1y-0005eU-62
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Jan 2021 23:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dk48xoljaDfKrHrHMhr41MTHc48m5tHc6K5cc6+60c0=; b=E854gNNOmS7sZILxQB1uD83SL
 mIvidzicLJkphPMZEsjXuVtBiyS+5sEeXvXaMmWjYeyt23rnqJiMUTHvf+aZaaJjVgqNX0TTRRyW3
 5n8myp1WlJSBiPog9DLZN0go0alBUkezZp4M2ABdcvecB4TYRx4x+0B2HgoJjEbgfqlUY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Dk48xoljaDfKrHrHMhr41MTHc48m5tHc6K5cc6+60c0=; b=jM6uxPuOem+accUXO5v+5e42+I
 S7R7luRIMUEE8z6OfE8reCJL938RCTq+/rX294nqxnUavccafMY1xpRSsPxousNMrrH2r++38DjY2
 l4NkZoHwVAOcgbt0tAqSGUuad0yB7fU1FgVlJc2iwRnMeu8oyJ7oDeD1bHoChuOuAKLY=;
Received: from mail-yb1-f201.google.com ([209.85.219.201])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l2izi-00BrE1-04
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Jan 2021 23:04:06 +0000
Received: by mail-yb1-f201.google.com with SMTP id q67so3649428ybg.19
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 21 Jan 2021 15:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=Dk48xoljaDfKrHrHMhr41MTHc48m5tHc6K5cc6+60c0=;
 b=AOwqVIYhEfj64Av4uEMJ8dSXxk8ne2BkUsUnz+ACunkTKRrxPpI/6sLcfbRBs7cNfl
 h5qPnwUs6LddC54j2mpWSWeh77OnP521QsSDsA2EqHU3eTeUqnT+oe4HtfLSjcnqB5V7
 D9cvChljpRJNuYOjKg9Oyj+cAe/xvu+QkQ1VIJQm6uloPLqIY07SFnMq2UBqecaSUDHp
 +Ajt62MR8Fp5RrZ7TibPGcZK9kJVvNizT+AUEgltWWilJcA7Fu0O34Tf4Eoqz77HP5X3
 wtX06Ui8oahF007Y1fWYBzCRcteJTi0Ni09bl5j2Z9rw84yplKdcqpX6r+O7nek4Me+V
 fvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Dk48xoljaDfKrHrHMhr41MTHc48m5tHc6K5cc6+60c0=;
 b=BAfMmFDqBW5BlUet5vEGxsbJuIG1C+3abC5iPHuKauYFNv8hCwUliWxgNLMhDd8XUt
 luftiyidieLw+TyebMT0UgguhfsFzHJb8wOuPTCHPpRVYheUActMObrG559I8vTjje9g
 Q646uQVz/sQ9RDJssNB6uHnmv1CTwu+aIzGeQjP6h1YBtRJp5p4Hqsh6Lqq4jLTo6iaL
 Vy4amFX9VU0jG8xsj8IqIYzqMhaCvH/gJrgkery9MPBMh1uNZLeOJm6nKvin0AxUVnLC
 vLLwTfO5cpDjadrQ0MMO0mzlOLDfc513YL+CAa7ZCljKdYbG4ODEueu1gaW7+yVSCCe1
 9Dog==
X-Gm-Message-State: AOAM532Pftr8RkJD8pjLyVKaGGRf0qOFyENw5WC2mCM1nCK5AtAfsMyX
 GICBUbhwvl1JCAHPEMxz/y+M5DQwcEY=
X-Google-Smtp-Source: ABdhPJyX5dl3YFdc0cGF8/opvXclsHMhLvELrPXG/G+g5KWNEjBlc4t0ZdcLzDJrZ/b4VlIyaHc4NeW9Ir8=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a25:cbca:: with SMTP id
 b193mr2572599ybg.324.1611270229151; 
 Thu, 21 Jan 2021 15:03:49 -0800 (PST)
Date: Thu, 21 Jan 2021 23:03:33 +0000
In-Reply-To: <20210121230336.1373726-1-satyat@google.com>
Message-Id: <20210121230336.1373726-6-satyat@google.com>
Mime-Version: 1.0
References: <20210121230336.1373726-1-satyat@google.com>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
To: "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
 Eric Biggers <ebiggers@kernel.org>, Chao Yu <chao@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, "Darrick J . Wong" <darrick.wong@oracle.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.201 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.201 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1l2izi-00BrE1-04
Subject: [f2fs-dev] [PATCH v8 5/8] iomap: support direct I/O with fscrypt
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
2.30.0.280.ga3ce27912f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
