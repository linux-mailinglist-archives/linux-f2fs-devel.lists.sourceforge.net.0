Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 311441FA676
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2020 04:32:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jl1Os-0002a8-Rj; Tue, 16 Jun 2020 02:32:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <wangxiaojun11@huawei.com>) id 1jl1Or-0002a1-8E
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Jun 2020 02:32:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+86ZuqvUmLz8XFfC9wOc9lyI22UnrVlbBY0vo6T2P74=; b=KGUQ0Kvi8Oj9dazX6oKnUpvUHh
 xFLTbI8oJ66gQooiTuPhOjIRlS9s5f/gXyZg+oNSeBj+lyNc2SPi/187Z0lzyTraFTcYPw0R/C3Aa
 jGYaE4WBkvBSsvdF5jUkT+EKiWjrrI7RhDYaoGXe6M8h8Oo/GodXJ/E7TdlfOdwEAvO4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+86ZuqvUmLz8XFfC9wOc9lyI22UnrVlbBY0vo6T2P74=; b=Y
 flwV5/HkoP2tJCC7cfocFMQkqhh6zB+AFoi3FnA4AHh5BGE2VUnSSwzx87w0WsvtP9NBzqvNkBuGP
 AHOBO0gRo5De0Iacdg4VoJkEU8rEBpj+oEV/lzMujaiCGioHajqFm2SJ7Hfy+VFjZZ7mTZJhjH3dG
 qfQ+Vtj0HzhmFIVE=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jl1Op-007Q4l-Go
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Jun 2020 02:32:33 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id EC2FAD844082374FA629
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jun 2020 10:32:23 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Tue, 16 Jun 2020
 10:32:19 +0800
From: Wang Xiaojun <wangxiaojun11@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Tue, 16 Jun 2020 10:39:24 +0800
Message-ID: <20200616023924.17351-1-wangxiaojun11@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jl1Op-007Q4l-Go
Subject: [f2fs-dev]  [PATCH] f2fs: remove the unused compr parameter
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The parameter compr is unused in the f2fs_cluster_blocks function
so we no longer need to pass it as a parameter.

Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>
---
 fs/f2fs/compress.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index df7b2d15eacd..286406b79d9f 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -761,7 +761,7 @@ static int f2fs_compressed_blocks(struct compress_ctx *cc)
 }
 
 /* return # of valid blocks in compressed cluster */
-static int f2fs_cluster_blocks(struct compress_ctx *cc, bool compr)
+static int f2fs_cluster_blocks(struct compress_ctx *cc)
 {
 	return __f2fs_cluster_blocks(cc, false);
 }
@@ -775,7 +775,7 @@ int f2fs_is_compressed_cluster(struct inode *inode, pgoff_t index)
 		.cluster_idx = index >> F2FS_I(inode)->i_log_cluster_size,
 	};
 
-	return f2fs_cluster_blocks(&cc, false);
+	return f2fs_cluster_blocks(&cc);
 }
 
 static bool cluster_may_compress(struct compress_ctx *cc)
@@ -824,7 +824,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 	bool prealloc;
 
 retry:
-	ret = f2fs_cluster_blocks(cc, false);
+	ret = f2fs_cluster_blocks(cc);
 	if (ret <= 0)
 		return ret;
 
-- 
2.26.0.106.g9fadedd



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
