Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A6E9FE88
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Aug 2019 11:33:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i2uKz-0000bI-Ce; Wed, 28 Aug 2019 09:33:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i2uKy-0000b2-84
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Aug 2019 09:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a32tDUiwvAliWHYONgZxHdSVHgxBtA4CMgrmB1H+ZG4=; b=UtAfKgRIBGoqITbLd7vubHeeol
 893ivCXe0g+gzZPLt09Gskyl4QqtqsXC049tkW8+V4ER27oYdU2dh09FCMy92DWHLiD064ust780b
 UUj/+EMDJOOpPLHCF6GS5mV6V6TSaos1h7baW29HRCcrVmBf+/eteRPwMKnRMsXxipgY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=a32tDUiwvAliWHYONgZxHdSVHgxBtA4CMgrmB1H+ZG4=; b=F
 d0MFZZl82Ax8m6qJchVRy96S2+/13SZjqGfRk78iWzCDIEyHhoy5aj8IIUQ/bgQ46FpWYIf+ozbxi
 qYvl/cVkrPVGXsRe6U9XHdVtgGHt0k5HqzsQa2zfN3t6uZJAQCS9al6+SLJjrPea8VhvzTybXZ3AL
 EW4lEv6tAmLLwQNU=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i2uKw-000imQ-Dr
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 28 Aug 2019 09:33:56 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9D1DA661CCA65AFB3D68;
 Wed, 28 Aug 2019 17:33:46 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.439.0; Wed, 28 Aug 2019 17:33:40 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 28 Aug 2019 17:33:35 +0800
Message-ID: <20190828093338.29446-1-yuchao0@huawei.com>
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
X-Headers-End: 1i2uKw-000imQ-Dr
Subject: [f2fs-dev] [PATCH 1/4] f2fs: fix extent corrupotion during directIO
 in LFS mode
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

In LFS mode, por_fsstress testcase reports a bug as below:

[ASSERT] (fsck_chk_inode_blk: 931)  --> ino: 0x12fe has wrong ext: [pgofs:142, blk:215424, len:16]

Since commit f847c699cff3 ("f2fs: allow out-place-update for direct
IO in LFS mode"), we start to allow OPU mode for direct IO, however,
we missed to update extent cache in __allocate_data_block(), finally,
it cause extent field being inconsistent with physical block address,
fix it.

Fixes: f847c699cff3 ("f2fs: allow out-place-update for direct IO in LFS mode")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index bf648c8c50ad..727df32382c6 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1018,7 +1018,7 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
 	if (GET_SEGNO(sbi, old_blkaddr) != NULL_SEGNO)
 		invalidate_mapping_pages(META_MAPPING(sbi),
 					old_blkaddr, old_blkaddr);
-	f2fs_set_data_blkaddr(dn);
+	f2fs_update_data_blkaddr(dn, dn->data_blkaddr);
 
 	/*
 	 * i_size will be updated by direct_IO. Otherwise, we'll get stale
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
