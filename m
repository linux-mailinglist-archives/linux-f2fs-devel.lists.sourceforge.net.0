Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B84CE39C27A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Jun 2021 23:32:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9iFd2NDQHBmtCSijsfl4IQYl21w6vFFwV1cX4N7CWd4=; b=P96Dsa3sRVGtfqIO9MDpIm/Wl
	n9M/fuUrwY85i7z2erDji2t4JDCErsTLOqoWzJ9v8cYf4HwtPw9aaHMMbQ5pZJzGZJf+MOh0MEriO
	BGyF9UQL8sulJk93+paF1keqtZiGaUKq54OX2VhecI9iA91TKGyIoGb4T74mf/ZknHnPw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lpHQP-0003gH-GZ; Fri, 04 Jun 2021 21:32:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3f5a6YAYKAKIUCVaCVIQQING.EQO@flex--satyat.bounces.google.com>)
 id 1lpHQO-0003g4-2r
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 21:32:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XCMW74I69DeN8Z3kX5iYnnwjp70fgDZ7aIjMCwTUzeM=; b=VbVmMcg5E9SGLiHcrWhJrvZFl
 5wdn9LnpFCKK7IkeSq0n2S6Hzu9lz1LOkzlckVOOSLxNdMQj0V3ZNIqXPhWQqZOMPZCNsw4+30nNc
 Kc9fhWaqaGeKT5mWa6/RSpHw0C1lQzizNpRp7UwyOtCPqz9bnA5yI6v+HOZKCPBvb3FcM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XCMW74I69DeN8Z3kX5iYnnwjp70fgDZ7aIjMCwTUzeM=; b=C1ZVA8XHZgXwCz+gnW4xLI0Qy/
 MTXsRgL519m8//GaZD39tkF4+R/HO9aeNZPBp8MUZgN8/GWoQo3QLp41sWhMNM+lC51wdpHzYG1Pf
 fNLgYA89ogFcvXY7ysFr12JfrE/d8Wl+vka+hF9OBTTCt6+Nyf0KUbxxN1UFgWIYBjsM=;
Received: from mail-ua1-f73.google.com ([209.85.222.73])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lpHQB-0005wy-Dt
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 21:32:16 +0000
Received: by mail-ua1-f73.google.com with SMTP id
 z43-20020a9f372e0000b029020dcb32d820so4536598uad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 04 Jun 2021 14:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=XCMW74I69DeN8Z3kX5iYnnwjp70fgDZ7aIjMCwTUzeM=;
 b=Mw++crRiYfOUuxBBsYJaIjEa2wzFZ7uIymgYyHPMmfqTENGSHY2XJFEFHfB0uF7oKU
 q+30l4Moqzicat/BsS7qK98HMHFB/NLzIAJndkfQNTeAD2gynzn1R3KcC6ecx+103TBP
 GDOBRtGgHEnAavWAyXnjadC5RjL1xZKdJoiqVP9LX+Baz1NH8ZskxxPR83N7wSzYmGmy
 AzR1MNMkb9T8NXWXKltKXehqDno9ArTvpLAmBtZwsBDFWHY2DN8mTuZF85xYugPqWMzK
 yDR3nmN38QXxX3Feu5LZLFS1lswICuDdid9tBrfJEby3qDOgFQZQYjh0Whmxpid95T2Z
 py5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=XCMW74I69DeN8Z3kX5iYnnwjp70fgDZ7aIjMCwTUzeM=;
 b=h3Jik7q6QSxajMgFRmQjL11VyhunNxHZQ22Etb7T4mlPw0XJflFLv+pICEMeXBBYVv
 vUh+qnUfW6r8SEAWwFevfiODaTIPauyYXB61yfVD5fdMoQPXMRJmrN9RwMFjOz7ZB/k6
 jFzyG7kqCg31A/cw3J0SjzeQXkEBvPsEm0S9T0XOqVb5Zk6iyvMf6gi4ZK866rHv2acL
 lQon80054ZBOsPeXlRnz/sR69H+e7PMhgLtoeGiufU8WZ/nivwjfbjtnaOOUr0jYB0l6
 PVzqQZQTHsFUkza+ZwUtrsX9zkWt59exdA7xkWJ4AncohcpO6GBB1SFPXa5ahFZ2F6pY
 /8Ug==
X-Gm-Message-State: AOAM531DTTR14uEvZxSb81T/pNGY5AEDLXs/5LM7T9kea+Dkug66njUY
 gvUQ3M6DXheMN0DNKNr4UjxxcR/64q0=
X-Google-Smtp-Source: ABdhPJxiSLZqcPqUF+AidxN8J2rs3GJOT86onesJOcAIexrEcLNAzcay/hdWehQRGDOJrX95PrTmEboMFxw=
X-Received: from satyaprateek.c.googlers.com
 ([fda3:e722:ac3:10:24:72f4:c0a8:1092])
 (user=satyat job=sendgmr) by 2002:a05:6214:2aa3:: with SMTP id
 js3mr6751098qvb.56.1622840959831; Fri, 04 Jun 2021 14:09:19 -0700 (PDT)
Date: Fri,  4 Jun 2021 21:09:04 +0000
In-Reply-To: <20210604210908.2105870-1-satyat@google.com>
Message-Id: <20210604210908.2105870-6-satyat@google.com>
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
 trust [209.85.222.73 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.73 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1lpHQB-0005wy-Dt
Subject: [f2fs-dev] [PATCH v9 5/9] block: Make bio_iov_iter_get_pages()
 respect bio_required_sector_alignment()
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
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Previously, bio_iov_iter_get_pages() wasn't used with bios that could have
an encryption context. However, direct I/O support using blk-crypto
introduces this possibility, so this function must now respect
bio_required_sector_alignment() (otherwise, xfstests like generic/465 with
ext4 will fail).

Signed-off-by: Satya Tangirala <satyat@google.com>
---
 block/bio.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/block/bio.c b/block/bio.c
index 32f75f31bb5c..99c510f706e2 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -1099,7 +1099,8 @@ static int __bio_iov_append_get_pages(struct bio *bio, struct iov_iter *iter)
  * The function tries, but does not guarantee, to pin as many pages as
  * fit into the bio, or are requested in @iter, whatever is smaller. If
  * MM encounters an error pinning the requested pages, it stops. Error
- * is returned only if 0 pages could be pinned.
+ * is returned only if 0 pages could be pinned. It also ensures that the number
+ * of sectors added to the bio is aligned to bio_required_sector_alignment().
  *
  * It's intended for direct IO, so doesn't do PSI tracking, the caller is
  * responsible for setting BIO_WORKINGSET if necessary.
@@ -1107,6 +1108,7 @@ static int __bio_iov_append_get_pages(struct bio *bio, struct iov_iter *iter)
 int bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter)
 {
 	int ret = 0;
+	unsigned int aligned_sectors;
 
 	if (iov_iter_is_bvec(iter)) {
 		if (bio_op(bio) == REQ_OP_ZONE_APPEND)
@@ -1121,6 +1123,15 @@ int bio_iov_iter_get_pages(struct bio *bio, struct iov_iter *iter)
 			ret = __bio_iov_iter_get_pages(bio, iter);
 	} while (!ret && iov_iter_count(iter) && !bio_full(bio, 0));
 
+	/*
+	 * Ensure that number of sectors in bio is aligned to
+	 * bio_required_sector_align()
+	 */
+	aligned_sectors = round_down(bio_sectors(bio),
+				     bio_required_sector_alignment(bio));
+	iov_iter_revert(iter, (bio_sectors(bio) - aligned_sectors) << SECTOR_SHIFT);
+	bio_truncate(bio, aligned_sectors << SECTOR_SHIFT);
+
 	/* don't account direct I/O as memory stall */
 	bio_clear_flag(bio, BIO_WORKINGSET);
 	return bio->bi_vcnt ? 0 : ret;
-- 
2.32.0.rc1.229.g3e70b5a671-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
