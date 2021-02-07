Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5363C312706
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  7 Feb 2021 20:05:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l8pNE-0004sH-3U; Sun, 07 Feb 2021 19:05:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=665305f4c=chaitanya.kulkarni@wdc.com>)
 id 1l8pNC-0004s9-HO
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Feb 2021 19:05:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5iyLJSyIOomyX5jCb09trHMMtmoQxDgbxu8X5Tvwzrw=; b=CX1nZpRTcriF3b0cd6G/5kAzxE
 W4c+A99PQvExA56Z9ZUQbEU4AzN3MM8Pdgbk3n0SHuLx1rpk34K8JkN5nb/5RpRM+mPRGNOoqKpaV
 +bL9YJE/M8WBmUq9/kQnLI5/1gpI7czuwG4VakSuUyJM4/7qZXChOGVTVj7Xzb3++SN8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5iyLJSyIOomyX5jCb09trHMMtmoQxDgbxu8X5Tvwzrw=; b=nRKzIkPABCu6wKo9vlijX8edfU
 /slHy4PXI0ItgkTpt/jOySvDyAfPXDJa5To+LCoL8g4Vh9MwOBQNRdddvZoQkg658eui5fHZu27Mb
 ygbtL2WLKJt99ALLugize1gCtvHZaUM9e4IX9kP0EljnIN+vY6v8XyyFdJODmlKwUqLk=;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l8pN5-00Dxbi-Hi
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Feb 2021 19:05:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612724723; x=1644260723;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dehfSSqAC1aZX9IJSa3h7Royg46gKKUc/ViSk1Qqt4w=;
 b=leHr6GjEtMyhMpST4dnphIgD8Lor8r/Pi47Z9B+TGvRXD2iTPtW23VFY
 /hL2rJq2ia/z1PzHSvN4howbFm8nhA3M8Q/h7t76dBS4ewK+fqIVQ6BeI
 A3du0+lQpa8aU0DI7ps9vfs1dojDERoNMCz8RVmc6NJLSLeDsZNUAz/py
 kCqm2Zh6pDRmhSWE3dDeFIxeykl4fDTQPprjwoK2EZwbwZf5co2T3I4rP
 wG/fQLG/nbRJhcat41kNYysyjA5O6dXqG504RFPUIRBsv/kmhwHT3pipH
 MzO6VJDYOTmRU3oJMQYgtQiF3iy2pisHY3IqTJehO9s6Ov3Yah8B85x57 w==;
IronPort-SDR: NGYF+8vFZGgjT+t/GfwK9rH3ejIgO/wmmo/bvWViShPfAU1Sijn3FuI78NGUM7Zwc3ea1s0Q3A
 /piqnYyUAX3myEkeduQVu5/AK+6mXWwKnkUel6H2jXQM9HTJjKllfZop77I22UzqWkI9Z43cYX
 2HCKV7BGlWyxEtCgXkv3lCH/W9soex/f9AQEzuAOVzryHrYLdjwIGrySmGOn7YB+IaKmrkkH6N
 nEW+U3i6yHnf9mfeRPcBptUTlbpCRrGI2JnAcSArft0TcHVdFA/5bZXRsruMnfbJgLG8mbzZtR
 gIo=
X-IronPort-AV: E=Sophos;i="5.81,160,1610380800"; d="scan'208";a="269855521"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2021 03:05:17 +0800
IronPort-SDR: /BiE4WsHrbCHHwvA1dl95IBo7GXbimqZb5+7u2NUbqg46n2dlDXg9EOwJqYCx22b5n8WFUUuOH
 TplB3bHIr0MwvXOvQHTkEsd6HrVmlPd5WIePdCPvRa1TzB4EWkIAqOoQQxERIRhMJ2/eUKYzD+
 wHr8eNsQLITswqeSDaLMWe2b6etFaCyrhoXytdgckUJgKsz0BKukp/OYYSbjoNm8NgfZzGHNSN
 e0XU50aXEM35bNTU/3ahD3/tqMk4bAx8rnPx148nw2xAf7q+R7Y6ssg7wthmmZvbviXxx+A3Mw
 ZA8hCBG+omEII08Kck+jGm8c
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 10:47:13 -0800
IronPort-SDR: /NXkTLt/6qjduDdq2JFD7H6ZU+2oB0Rep9ax9+DK8GZwj+QwFm5xGHo/lvt8Jhf3VxkmGz9WKT
 ozZQT+ilXxLz9H78tNiiEyGRBVVQePcWqrOyWOs7rre3+lFVAGrVsUvOX5xKbv0BNnkxYqCDo6
 lcfJ0FnspF3wCcBsGYidK8L/jGC7u9NuvCYsuTVkTuxmgmuxeG/bdTYhdVz/T5bsstD10Aa/nN
 IJw8c3dJ5LpA9hTAS8X5AegS9FKMJ7cCnR8aKsp4kZvUGwJoa3LEMV3Fa3PQRHONuomK97B3SY
 j1k=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Feb 2021 11:05:18 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org
Date: Sun,  7 Feb 2021 11:04:21 -0800
Message-Id: <20210207190425.38107-5-chaitanya.kulkarni@wdc.com>
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
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1l8pN5-00Dxbi-Hi
Subject: [f2fs-dev] [RFC PATCH 4/8] null_blk: use memcpy_page() in
 copy_from_nullb()
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
 drivers/block/null_blk/main.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
index c9b6db82b07c..1c0e1a295e90 100644
--- a/drivers/block/null_blk/main.c
+++ b/drivers/block/null_blk/main.c
@@ -1042,7 +1042,6 @@ static int copy_from_nullb(struct nullb *nullb, struct page *dest,
 	size_t temp, count = 0;
 	unsigned int offset;
 	struct nullb_page *t_page;
-	void *dst, *src;
 
 	while (count < n) {
 		temp = min_t(size_t, nullb->dev->blocksize, n - count);
@@ -1051,16 +1050,11 @@ static int copy_from_nullb(struct nullb *nullb, struct page *dest,
 		t_page = null_lookup_page(nullb, sector, false,
 			!null_cache_active(nullb));
 
-		dst = kmap_atomic(dest);
-		if (!t_page) {
-			memset(dst + off + count, 0, temp);
-			goto next;
-		}
-		src = kmap_atomic(t_page->page);
-		memcpy(dst + off + count, src + offset, temp);
-		kunmap_atomic(src);
-next:
-		kunmap_atomic(dst);
+		if (t_page)
+			memcpy_page(dest, off + count, t_page->page, offset,
+				    temp);
+		else
+			zero_user(dest, off + count, temp);
 
 		count += temp;
 		sector += temp >> SECTOR_SHIFT;
-- 
2.22.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
