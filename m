Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE51E216366
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jul 2020 03:36:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jscWi-0005bf-Gh; Tue, 07 Jul 2020 01:36:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jscWh-0005bY-4X
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jul 2020 01:36:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PGn95N5IYfoWEISwfpA4yAdB5JS2kd3eFg0Nm2rpS0M=; b=bInyFiVVUqzb8xQ0yPF35e3IxF
 8RapupBfGTihKgFpPxTGW8tGnByD04EO5gW5JukPLylO8Xq++EW6AETiQyohE9oFFOCqhBIByjtUv
 wKuduHank9uJZsXalGL3XE3Lj08GGPbRpD8TRbuSMmy0Va4p5wwj1r0EKy5kjmXsLK3E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PGn95N5IYfoWEISwfpA4yAdB5JS2kd3eFg0Nm2rpS0M=; b=l
 ySf/lhbl+dYwj79mWAj4jN02a7RZQSy9ClYwomusOFIyeFaZ9PBEoY9OjMM/V9wVl31M/0A3soOwm
 8h1kznJovzyebM5zYEpCRcPRYqpYMvRmGR/vwjNBhstbRprwYrS23vEyUu2rAZ47ZXx/eTCgxB3Be
 bryt7ifITyM5PXLY=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jscWf-00FfWW-6K
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jul 2020 01:36:03 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3911B215BCAADAAE62B6;
 Tue,  7 Jul 2020 09:35:53 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Tue, 7 Jul 2020 09:35:44 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 7 Jul 2020 09:35:41 +0800
Message-ID: <20200707013541.26165-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jscWf-00FfWW-6K
Subject: [f2fs-dev] [PATCH] f2fs: don't keep meta inode pages used for
 compressed block migration
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

meta inode's pages are used for encrypted, verity and compressed blocks,
so the meta inode's cache invalidation condition in do_checkpoint() should
consider compression as well, not just for verity and encryption, fix it.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/checkpoint.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 415bd120e561..c5593a6f9240 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1515,9 +1515,10 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 
 	/*
 	 * invalidate intermediate page cache borrowed from meta inode which are
-	 * used for migration of encrypted or verity inode's blocks.
+	 * used for migration of encrypted, verity or compressed inode's blocks.
 	 */
-	if (f2fs_sb_has_encrypt(sbi) || f2fs_sb_has_verity(sbi))
+	if (f2fs_sb_has_encrypt(sbi) || f2fs_sb_has_verity(sbi) ||
+		f2fs_sb_has_compression(sbi))
 		invalidate_mapping_pages(META_MAPPING(sbi),
 				MAIN_BLKADDR(sbi), MAX_BLKADDR(sbi) - 1);
 
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
