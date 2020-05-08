Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E95681C9FFF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 May 2020 03:16:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWrcq-0008QS-Oy; Fri, 08 May 2020 01:16:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jWrcq-0008QM-3R
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 01:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S6V0ZRvqg/enz5yY1vTLarCM1Y3fRSj1mlWZfejcQic=; b=WDtzQ1S0TJj6CIZY8hYFTIJJBB
 cnK0Z+jPdJl0X1yrsZ5juirYNswHLl7ifgGPTA/nVINbc2MUIv0PKtBEXquZrFFSG/NPYNjgCKByt
 EZJVNAj8kdzD+0qaUAjAQy1XgX8B9PCSvrVo4kug1cv1n/MFM/dAr4PocPovrsz1GtVY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=S6V0ZRvqg/enz5yY1vTLarCM1Y3fRSj1mlWZfejcQic=; b=L
 VZXLjEzhkzC90WrUPbW4sbGeniSjT2TO8IsC1goGgFCqrMvdRlkWClrppsiCTGGvn4vCoP+UbZZJ6
 UMxv24lUaUS1pDqaC1lbUC8o0Vvcs1BKL+1bbK0Wi+tT8yaWm7rlN4iDjOr0iENyPb3oBVlDzRPxM
 qql+jeD3UU8t0S7M=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWrcm-00BtLD-CS
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 01:16:28 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 8C19EA0F301D32FD195F;
 Fri,  8 May 2020 09:16:16 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Fri, 8 May 2020 09:16:07 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 8 May 2020 09:16:03 +0800
Message-ID: <20200508011603.54553-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWrcm-00BtLD-CS
Subject: [f2fs-dev] [PATCH] f2fs: compress: fix zstd data corruption
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

During zstd compression, ZSTD_endStream() may return non-zero value
because distination buffer is full, but there is still compressed data
remained in intermediate buffer, it means that zstd algorithm can not
save at last one block space, let's just writeback raw data instead of
compressed one, this can fix data corruption when decompressing
incomplete stored compression data.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index c22cc0d37369..5e4947250262 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -358,6 +358,13 @@ static int zstd_compress_pages(struct compress_ctx *cc)
 		return -EIO;
 	}
 
+	/*
+	 * there is compressed data remained in intermediate buffer due to
+	 * no more space in cbuf.cdata
+	 */
+	if (ret)
+		return -EAGAIN;
+
 	cc->clen = outbuf.pos;
 	return 0;
 }
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
