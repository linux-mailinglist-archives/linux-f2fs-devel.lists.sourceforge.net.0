Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 072B21923FB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2020 10:25:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jH2I4-0002OP-Fx; Wed, 25 Mar 2020 09:25:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jH2I3-0002OC-5q
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 09:25:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sKegA0MDQ4kAM0sok0UKPV1TT1USTXxZAZyO1BjDSJo=; b=Owgc0uxBfc3le4qyKK0ZbUSD16
 0glq0LMEzuxam6x7uTj6qo2+uhgOpCZm3ZieKfXmmVyxbjQ3Yj7qrRlQnDh0crJktdCmaP4DYNoBe
 Z9/28//oAlrP2uyux2aIMR80vn1mWHV/LVDSn5HOb7wmxF/8rG30DVio//LNPZCrXb3s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=sKegA0MDQ4kAM0sok0UKPV1TT1USTXxZAZyO1BjDSJo=; b=X
 eqLqAb6qwKUCOdXp2bq9IX5xZYyHKPtQgREyAhYSG9Wu9NlRJZ7RI9WRRtkxFcWFVvWqkgbVSDnN+
 /xpRxKr1S+66g+Eet5CgSdmpO6yKpI0huXAmm8xQNIIUZGoKAcxqXLdZOQqJeOjuqlsk4VVn7qDq8
 fjCHNaMWTw3GQi3U=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jH2Hz-00GCtY-Fv
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 09:25:35 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 8D90EB79BF7B9AB480BF;
 Wed, 25 Mar 2020 17:25:20 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Wed, 25 Mar 2020 17:25:11 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 25 Mar 2020 17:25:07 +0800
Message-ID: <20200325092507.62977-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jH2Hz-00GCtY-Fv
Subject: [f2fs-dev] [PATCH] f2fs: clean up dic->tpages assignment
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

Just cleanup, no logic change.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index c82ebba26e75..9cc279ea3bfb 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1363,20 +1363,16 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 		goto out_free;
 
 	for (i = 0; i < dic->cluster_size; i++) {
-		if (cc->rpages[i])
+		if (cc->rpages[i]) {
+			dic->tpages[i] = cc->rpages[i];
 			continue;
+		}
 
 		dic->tpages[i] = f2fs_grab_page();
 		if (!dic->tpages[i])
 			goto out_free;
 	}
 
-	for (i = 0; i < dic->cluster_size; i++) {
-		if (dic->tpages[i])
-			continue;
-		dic->tpages[i] = cc->rpages[i];
-	}
-
 	return dic;
 
 out_free:
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
