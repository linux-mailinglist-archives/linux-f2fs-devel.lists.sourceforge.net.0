Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF78B59DADF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Aug 2022 13:17:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oQRuN-0003mQ-NW;
	Tue, 23 Aug 2022 11:17:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1oQRuD-0003mE-3G
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Aug 2022 11:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RBx41knHYxiRtJMArZVs6j5zg2GSyqn4VZ8fu1uz8N8=; b=kkkOd+Qyr5CdyBOAZQU1ard0gO
 hDipHK2L8dDMUAaqCTKV0T0IsEZaRK2kG/6zhi8ACGOqOJdINGY4w2FGFwCYOcVVpxcnhCU/CUVfY
 QC0+eFbtHy14xHJdpH20IgyNbqvBvY09+4Lqh2fUMIWuFzBM0dTVxtUuFN1/CAstVRi0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RBx41knHYxiRtJMArZVs6j5zg2GSyqn4VZ8fu1uz8N8=; b=W
 ozhCSbGm4M3027WKIR5fkTqg3gXhMEOaMMahIcC97f56hMLhqcqF5yvP2spXb0iwU7cwpVl/ezs/9
 HL/yf+a2b9EvmgMvzMQxrNYyw0kDS6Deb7bRUeZmfkNO7boWsCEAXgyrJRywDLyYsC43Pn010AAzS
 n3sj63aB7crUIxks=;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oQRu5-00EDqZ-O0 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Aug 2022 11:17:10 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MBmq10s17zGpht;
 Tue, 23 Aug 2022 19:15:09 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 23 Aug 2022 19:16:47 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 23 Aug
 2022 19:16:47 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Tue, 23 Aug 2022 19:20:22 +0800
Message-ID: <20220823112022.132333-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: It could return directly after init_decompress_ctx.
 Signed-off-by:
 Zhang Qilong <zhangqilong3@huawei.com> --- fs/f2fs/compress.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-) diff --git a/fs/f2fs/compress.c
 b/fs/f2fs/compress.c index 0d7e9021b90d..2a41d2aee515 100644 ---
 a/fs/f2fs/compress.c
 +++ b/fs/f2fs/compress.c @@ -1579, 12 +1579,
 8 @@ static int f2fs_prepare_decomp_mem [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.189 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1oQRu5-00EDqZ-O0
Subject: [f2fs-dev] [PATCH -next] f2fs: simplify code in
 f2fs_prepare_decomp_mem
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
From: Zhang Qilong via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zhang Qilong <zhangqilong3@huawei.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

It could return directly after init_decompress_ctx.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 fs/f2fs/compress.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 0d7e9021b90d..2a41d2aee515 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1579,12 +1579,8 @@ static int f2fs_prepare_decomp_mem(struct decompress_io_ctx *dic,
 	if (!dic->cbuf)
 		return -ENOMEM;
 
-	if (cops->init_decompress_ctx) {
-		int ret = cops->init_decompress_ctx(dic);
-
-		if (ret)
-			return ret;
-	}
+	if (cops->init_decompress_ctx)
+		return cops->init_decompress_ctx(dic);
 
 	return 0;
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
