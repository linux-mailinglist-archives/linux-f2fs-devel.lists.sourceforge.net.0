Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BECAB312708
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  7 Feb 2021 20:05:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l8pNb-0004tq-Ey; Sun, 07 Feb 2021 19:05:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=665305f4c=chaitanya.kulkarni@wdc.com>)
 id 1l8pNa-0004tj-Bd
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Feb 2021 19:05:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8PZE03PiHxgVMYl5aK9+neT60QRfxMxQFn/lXYmiUHs=; b=LoqRA04YN+Nj/gEmIlgIEg2JTF
 GNHDZvgS4yQSB+VzY87NYSt46WZcfLqa/KQ8qaZXzu0/2d3VYud5uiFRYv9BP5ivRpOEQoBUriB0K
 Hf0w4YD0YNdImxkDP/HGB7GD/kPF513ss4e0nVDuqFkY3r4AKtx/3hHYLU+6cN5cqubg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8PZE03PiHxgVMYl5aK9+neT60QRfxMxQFn/lXYmiUHs=; b=YGZEG4URF39esqP0hD+yJxj6mq
 9hlx6u7nC4KLthqUWT6JfVuS3KS+RyiK0UTCp3bZnGqxokGXa8da2DCR7L1IXmlJosuYsRYh+zI6T
 cvfWj6Cg703VS5VKFJTImx0t2J/lyDUkSrrLJYq1HsgXSUpkGtz9BF49AYDuQNq8fTHo=;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1l8pNT-0000g5-7f
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Feb 2021 19:05:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612724747; x=1644260747;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rNdz9k9ffw5LAUxhwO57X4gVRFYzjraWgYm8UMbARD0=;
 b=p7XumpPRc8PK/m2mGSLywZYd1sn9CFyEzGxoMNtbfei9/K+e9EZ0UlT0
 xcGBbF15q1OsqvbtRG+92xO6OS1yb423L6F032FvW26tM5kHRKTP7o++o
 bJ5iHEy6E8BUbkyH3RuxQCSqnZ3cuIWQUIcgMN6nj1U/jlNpKcar0eJIe
 gucA+pwO3NgDeIIjfjDi2flLxK9R8rhYxwwAIcqyewpMA9I5n09pmJ+8o
 wWrDE3po2TrHcoFNe4FfYbpXA7h6u8zLOjBXv30RHIjN0sIMy/vnSd0zb
 /92dLqLqBbaTl1mgA3FVQhME1o3zox3pcdIrEz9Vkofdm57snGXSQpiCf w==;
IronPort-SDR: +hIZ29k8Va38/NVc2KpCik/x2Anm9ujTMA4axvcF1XJ8pBKxKiPTmJWgxasLuLwJhRwCN0gwcc
 bEctLHflA4S7lLHnvMmInZdTXxrAwcOexLG52Vi7IY2BkfVPMtAXbPEVhhCElaI6r1cGvKECnY
 RHT2brXhpZaUXrSVDBbreU3Jy7d8wOwGMKfz27VY+nW+ByAUCK0GTlwsExA1J3gfTDJxfualog
 7hEG26E/Cl9IDvz3nC5jPQr1h3jwRZNLRhZAjgR7bJrlQ1xGGjxa7MQd4OHD/Qs2kODjUSwGCn
 zA0=
X-IronPort-AV: E=Sophos;i="5.81,160,1610380800"; d="scan'208";a="159383142"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2021 03:05:41 +0800
IronPort-SDR: 7ezNQ2bN5USYOAyJBDedwPjP5AKQ8Ys5m8G5YPYDYaAcxoFH04AO0zw+pcxAIZdOz4GcCWeSVa
 RzIcRKJsjKjm/kktcuKZT+OIBa2qnX936QBoAxP/z+CRBU3tMw76P442yMl4kSKKcZx7jD1aT1
 SWG6W/4TwrDaJLsQZ9n8Y9zvZtUF2ATr/5bPtYTa6O1dCwF3S6aILhUz7BG7j9ArPsYBE47CQk
 Mhn/9wtKbKDkI01yoGPaRky8BZZ+mTeinkYb1L1/HbH1A0SBOs7JKjPLK5RJdGS30onx3qyWty
 YSGRWX3b/V92DkvmwjB0Uzsl
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 10:49:35 -0800
IronPort-SDR: Mqq4oD3AeYBOMQHpGBqpa7pFTs3cc0c1FqPIJAN7pudJdrjE1cjRu0dCs025PGzN1w2mJSwrI8
 aLMozTCLuRjHR3U2Ava6HaEOdzuNs6BKCjySlUFnlbnsz2mfLlHcpwKmSdmyHd92gceMCoHjff
 SrgH+/UBPE/azNd55IrtFOrGh9hfZBqgwHFD1ONIv1Su/ou3XzTuek77zBP92E3JHf9gMZ3g5V
 C8UdjLamPyOsH/7UOibmR6FxstwDhtHmvtbREVOVNEGrv3OlsgYYoV5l9pJ5DScQGhniarovqX
 2lg=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Feb 2021 11:05:42 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org
Date: Sun,  7 Feb 2021 11:04:22 -0800
Message-Id: <20210207190425.38107-6-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210207190425.38107-1-chaitanya.kulkarni@wdc.com>
References: <20210207190425.38107-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [216.71.154.42 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l8pNT-0000g5-7f
Subject: [f2fs-dev] [RFC PATCH 5/8] ext4: use memcpy_from_page() in
 pagecache_read()
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
Cc: axboe@kernel.dk, hch@infradead.org, damien.lemoal@wdc.com, tytso@mit.edu,
 bvanassche@acm.org, chaitanya.kulkarni@wdc.com, dave.hansen@intel.com,
 johannes.thumshirn@wdc.com, ebiggers@kernel.org, clm@fb.com,
 adilger.kernel@dilger.ca, dongli.zhang@oracle.com, dsterba@suse.com,
 jaegeuk@kernel.org, ira.weiny@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 fs/ext4/verity.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
index 5b7ba8f71153..c8e07f8a792d 100644
--- a/fs/ext4/verity.c
+++ b/fs/ext4/verity.c
@@ -45,16 +45,13 @@ static int pagecache_read(struct inode *inode, void *buf, size_t count,
 		size_t n = min_t(size_t, count,
 				 PAGE_SIZE - offset_in_page(pos));
 		struct page *page;
-		void *addr;
 
 		page = read_mapping_page(inode->i_mapping, pos >> PAGE_SHIFT,
 					 NULL);
 		if (IS_ERR(page))
 			return PTR_ERR(page);
 
-		addr = kmap_atomic(page);
-		memcpy(buf, addr + offset_in_page(pos), n);
-		kunmap_atomic(addr);
+		memcpy_from_page(buf, page, offset_in_page(pos), n);
 
 		put_page(page);
 
-- 
2.22.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
