Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A99B536671C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Apr 2021 10:40:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lZ8PF-0007DU-EW; Wed, 21 Apr 2021 08:40:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lZ8PD-0007D2-Gf
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Apr 2021 08:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oNcGkR2RFmcYTTYOpVq8cFHchJCu8Yp9TBtAmFiyPW4=; b=dzGCzrQCMOQelNq+cVpgHwk8gp
 HSwBNDzxc6r58OrAoYa/WvAHsJBVzO4yV96M/qdwhei44Q5Eko8EA/L5P6f89UxiE4Rn9kblFYXsF
 wS+PJKb/MqhJG8EsGv0BFxN2GOuEGThDsY77r15ZUvrHqgyswm3pl3T7LmWY6FLP2H0s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oNcGkR2RFmcYTTYOpVq8cFHchJCu8Yp9TBtAmFiyPW4=; b=c
 svIOYmtqN6T9QbDlopl32RT53iU3QXRBAC3MteQoqqhLRTB12XWx7gt5j8pJsfXUtL5nsZP7phrHy
 gLwA76q1UbqZEKRNZ5uny4zj4qm6e+eghDCT49P/y839i9c5/gxfLWxs3wVJohIKptLDyorNNtnXh
 2yqb4qgV3GVYsMPg=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lZ8P7-0072Vu-Mz
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Apr 2021 08:40:19 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FQDT04nV0z17RLn;
 Wed, 21 Apr 2021 16:37:40 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Wed, 21 Apr 2021 16:39:52 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 21 Apr 2021 16:39:41 +0800
Message-ID: <20210421083941.66371-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lZ8P7-0072Vu-Mz
Subject: [f2fs-dev] [PATCH] f2fs: compress: remove unneed check condition
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

In only call path of __cluster_may_compress(), __f2fs_write_data_pages()
has checked SBI_POR_DOING condition, and also cluster_may_compress()
has checked CP_ERROR_FLAG condition, so remove redundant check condition
in __cluster_may_compress() for cleanup.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 3c9d797dbdd6..532c311e3a89 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -906,11 +906,6 @@ static bool __cluster_may_compress(struct compress_ctx *cc)
 
 		f2fs_bug_on(sbi, !page);
 
-		if (unlikely(f2fs_cp_error(sbi)))
-			return false;
-		if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
-			return false;
-
 		/* beyond EOF */
 		if (page->index >= nr_pages)
 			return false;
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
