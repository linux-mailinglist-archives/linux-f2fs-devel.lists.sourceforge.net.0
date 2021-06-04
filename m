Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D97339C34D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  5 Jun 2021 00:10:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xh63WYxTJFcblSKgtuac3UQiFQD1kVutE5fpMDNavLM=; b=cE51E+eLabk8qcPe+iB6oQQ0s
	3tfMNxdGpR/6ur9joiaoeIgNxXSgvFC+rnzDJcxZa00929yJ/RPI342ofvEFVoKSUKUxkjNz2Llgr
	Yr2b3/NIGRSve2xSYA0rEicd1XWX8Fin687GGHLdjZC2dYzHm0VkdchsTQHgteN4LzrxE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lpI1F-0001CC-Li; Fri, 04 Jun 2021 22:10:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3gZa6YAYKAKQWEXcEXKSSKPI.GSQ@flex--satyat.bounces.google.com>)
 id 1lpI1D-0001Bx-Uy
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 22:10:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RT0RrB/jxKMI6YW+PFYA3ymIrlH2UsJVKGU6y0kBnOw=; b=NQ2KVLoe/2dv93X3kW3Hp68C/
 5IW9ZQYVGfowaxCASxxHAl/fQtxWEKK1VJsQCDdYvl6KQr+vgndryQ9vzypdotKzdV5KdnIgXeEfO
 rM9c0XJNAXm1srpX5r12vlkll2417mjSCD1biZjtO1+k/A3QdgBwIYIXO0FjKPC8m09oc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RT0RrB/jxKMI6YW+PFYA3ymIrlH2UsJVKGU6y0kBnOw=; b=C1c8OdAhVerALp0zVb1VS8qvdj
 pDCjyCvB+08EjfNfaocoqy62xuVNZEq6pgiO50i97AhCztNZk/Fi9TkwpmVTtVxG1kDx3tQMQizaz
 LhAjK5UWe+UtUn64gm+wFc1OkVBLe5y/w/u76vtHNvWjQueBkS5wKxKeGSkMgokY3xC8=;
Received: from mail-vs1-f73.google.com ([209.85.217.73])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lpI17-0007uE-1E
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 22:10:20 +0000
Received: by mail-vs1-f73.google.com with SMTP id
 y77-20020a6732500000b029025a8097f3a3so2297641vsy.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 04 Jun 2021 15:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=RT0RrB/jxKMI6YW+PFYA3ymIrlH2UsJVKGU6y0kBnOw=;
 b=IlZOZ7kDYPui8ADSyBSgg53Xoy729/anXoL9HE6GnxaUrhX/OSd1UbLB0u1F+7d9Td
 JVxj6n9wuW+E0OZ7vDRXrTfbCD6XuwNVY9v22kKfJVNYb9WY404LeKW4yQ2tpPmzigpm
 V+j0KbaKVIPgWl/XtyfWFGvYkgLJlkemDaCQc25sAFQeYkHSg34+XxpgajWSGIfj4/be
 V52CdBnBn4uGgdqBlgjFpwgA4zIXigOLYYLcck1Ox7vAMAb0YTWh94/lpF9I2Q7F7RI/
 gPD6HaFeiyqVyFUYSb1DYREYy6u9CegrBeWpsXNHM9mK3f2L+mshA5baEf6Ew6vzjwfA
 VpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=RT0RrB/jxKMI6YW+PFYA3ymIrlH2UsJVKGU6y0kBnOw=;
 b=jrOXW3W7fLgipPZM0+XGvLpnqS5ZaPWdD3oguIp/EQjs+6QENj+87tdGctMHSBgKvP
 EUcHyQwm2moi60MkDlMe9ae3QiPh07kBXKHDmAbhd0ThYkIoCW5qix+FC3wfF8phqOAb
 5PbP8Ieqge/CIP7E2AAvDrNiYTpVJOUhVCOtcmLJLzClefYeU4TntdlmRw9IBMmPXky/
 aMXoN3F4CZkNz122kQ5AYIKXB0LJqV6u17ELUcDGul5ea3pHhsXgpSdD5NuQ5f8K9eD+
 wSHAaQwmQ1PUw7rF1sZol94C6Wu1H8OkghZkfTqeTojzrkprVGBNWza6gwPnNs6WnFcv
 s1cQ==
X-Gm-Message-State: AOAM531rAVZ5Azz28D2DcVH/dOd3AKF7Gypb4nbB+4/TZBYqgmaNCMnG
 dO14qXebQ4zK6UC4sNK3UxbKv5J1tfo=
X-Google-Smtp-Source: ABdhPJzJE4zslyGfGvcDlz07boMQ5nRjs8yyzCWvA2MMz8AlycCO4TqXJ8BnIMpWw/eg+X7rMUBks6idOm4=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a25:8185:: with SMTP id
 p5mr7728654ybk.54.1622840961400; 
 Fri, 04 Jun 2021 14:09:21 -0700 (PDT)
Date: Fri,  4 Jun 2021 21:09:05 +0000
In-Reply-To: <20210604210908.2105870-1-satyat@google.com>
Message-Id: <20210604210908.2105870-7-satyat@google.com>
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
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.73 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1lpI17-0007uE-1E
Subject: [f2fs-dev] [PATCH v9 6/9] iomap: support direct I/O with fscrypt
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
index 9398b8c31323..1c825deb36a9 100644
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
@@ -306,6 +310,8 @@ iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
 		}
 
 		bio = bio_alloc(GFP_KERNEL, nr_pages);
+		fscrypt_set_bio_crypt_ctx(bio, inode, pos >> inode->i_blkbits,
+					  GFP_KERNEL);
 		bio_set_dev(bio, iomap->bdev);
 		bio->bi_iter.bi_sector = iomap_sector(iomap, pos);
 		bio->bi_write_hint = dio->iocb->ki_hint;
-- 
2.32.0.rc1.229.g3e70b5a671-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
