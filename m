Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBB5A24C98
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  2 Feb 2025 05:49:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1teRuz-0005BR-1k;
	Sun, 02 Feb 2025 04:49:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=121f92608=enjuk@amazon.co.jp>)
 id 1teRux-0005BJ-FH for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 02 Feb 2025 04:49:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5wKm0aYw5LMzGFRHPLrYDtn9SZNot9Fk2U7Cck0hqJ0=; b=FsKmv1MlbHJBLKkRVyt5OlMI2E
 cj2eoNjYLDX1j/Zp5OZcxxrHImYPFRCDe2lW7UOdhhmp2BG+jMwlzpOLqFWbUQ53ViFnp38mGwvBk
 aMbSipcGJISjupucRe5YumYmJKqXaUc9O/FZ3NT3EKFtfVf2WDaNextxbi03TlzmY9LM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5wKm0aYw5LMzGFRHPLrYDtn9SZNot9Fk2U7Cck0hqJ0=; b=M
 PrIw6yzF6Sd+hIdJhlqmMpxnwBtRVo/2oxNprKnoMb6YX5D0/QTgy/vLh/oXNmE9KL8kvvpyWMx8C
 hzBLjAZ1NvPnbrPtWn4DXMPRVYhkoCqEiYTj7qRNuysz/y9YNjp2xu0aXcqBaPLVnSUSKgCF0Oap5
 WMup52DhGs4MG4TM=;
Received: from smtp-fw-9106.amazon.com ([207.171.188.206])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1teRuw-00077F-5v for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 02 Feb 2025 04:49:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1738471750; x=1770007750;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5wKm0aYw5LMzGFRHPLrYDtn9SZNot9Fk2U7Cck0hqJ0=;
 b=t/GvjKzMfJTcz6me0KQmHGdR5yks+RUjDFkvI2zq66DgYFZqkpNctCN6
 HyBUWwJk2Vxt/FZiaGl1Q2RGoU114TDSC0RI/0jOnV5kzLci6bQcDjz2u
 3irO4KVdj6Y/wcF7F8DorFRPfFMNurMPcIck7vUDmEJJq/5YO1rnOvMWb s=;
X-IronPort-AV: E=Sophos;i="6.13,253,1732579200"; d="scan'208";a="795416663"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
 by smtp-border-fw-9106.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 04:33:10 +0000
Received: from EX19MTAUWA002.ant.amazon.com [10.0.21.151:61079]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.14.41:2525]
 with esmtp (Farcaster)
 id c97bc524-8d2f-4380-8fcd-c91536b085e0; Sun, 2 Feb 2025 04:33:10 +0000 (UTC)
X-Farcaster-Flow-ID: c97bc524-8d2f-4380-8fcd-c91536b085e0
Received: from EX19D003ANC003.ant.amazon.com (10.37.240.197) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Sun, 2 Feb 2025 04:33:07 +0000
Received: from b0be8375a521.amazon.com (10.37.244.8) by
 EX19D003ANC003.ant.amazon.com (10.37.240.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Sun, 2 Feb 2025 04:33:03 +0000
To: <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
Date: Sun, 2 Feb 2025 13:32:53 +0900
Message-ID: <20250202043253.64389-1-enjuk@amazon.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-Originating-IP: [10.37.244.8]
X-ClientProxiedBy: EX19D046UWA003.ant.amazon.com (10.13.139.18) To
 EX19D003ANC003.ant.amazon.com (10.37.240.197)
X-Spam-Score: -3.7 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: When __GFP_DIRECT_RECLAIM (included in both GFP_NOIO and
 GFP_KERNEL) is specified,
 bio_alloc_bioset() never fails to allocate a bio. Commit 67883ade7a98
 ("f2fs: remove FAULT_ALLOC_BIO") replaced f2fs_ [...] 
 Content analysis details:   (-3.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [207.171.188.206 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [207.171.188.206 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [207.171.188.206 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [207.171.188.206 listed in wl.mailspike.net]
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1teRuw-00077F-5v
Subject: [f2fs-dev] [PATCH v1] f2fs: remove unnecessary null checking
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
From: Kohei Enju via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Kohei Enju <enjuk@amazon.com>
Cc: Jens Axboe <axboe@kernel.dk>, Damien Le
 Moal <damien.lemoal@wdc.com>, Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Kohei Enju <enjuk@amazon.com>,
 Kohei Enju <kohei.enju@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When __GFP_DIRECT_RECLAIM (included in both GFP_NOIO and GFP_KERNEL) is
specified, bio_alloc_bioset() never fails to allocate a bio.
Commit 67883ade7a98 ("f2fs: remove FAULT_ALLOC_BIO") replaced
f2fs_bio_alloc() with bio_alloc_bioset(), but null checking after
bio_alloc_bioset() was still left.

Fixes: 67883ade7a98 ("f2fs: remove FAULT_ALLOC_BIO")
Signed-off-by: Kohei Enju <enjuk@amazon.com>
---
 fs/f2fs/data.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index de4da6d9cd93..07b46b444d31 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1041,8 +1041,6 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
 	bio = bio_alloc_bioset(bdev, bio_max_segs(nr_pages),
 			       REQ_OP_READ | op_flag,
 			       for_write ? GFP_NOIO : GFP_KERNEL, &f2fs_bioset);
-	if (!bio)
-		return ERR_PTR(-ENOMEM);
 	bio->bi_iter.bi_sector = sector;
 	f2fs_set_bio_crypt_ctx(bio, inode, first_idx, NULL, GFP_NOFS);
 	bio->bi_end_io = f2fs_read_end_io;
-- 
2.39.5 (Apple Git-154)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
