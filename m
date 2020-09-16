Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE8226BE9D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Sep 2020 09:58:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kISL7-0005oc-8k; Wed, 16 Sep 2020 07:58:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <wangxiaojun11@huawei.com>) id 1kISL5-0005oP-Jx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Sep 2020 07:58:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xWVcQ8R0ajqyG9WhsYUgyKc/TFDPq0fcvFzizFOaGbs=; b=aR3mYsRyegCtR+WMqjne9H/uMr
 dVimiqThtNZMTGwXJkMn4G0saZb4JNyom1K8b/psEPoxOsSi+JCC5jZjOnAPnh24KxkKgy21lu33N
 M/SPq09E7Bi2JF9iLqmtWXOlP78Lr/ZGv2FvkFaTeskjp0qV85i6+NNNHlPnv2IpWvSg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xWVcQ8R0ajqyG9WhsYUgyKc/TFDPq0fcvFzizFOaGbs=; b=J
 I/u0gqLBXl3zPi1UO3N2D8ZUi8tYx9hPdjgmMBDB0dRF+TY40eiidM1sG1ykuVMhtH6JnFyWq/wQw
 wzuWTRgNl2JK2u3qb8MjFKn6UgzbwX0h6h1WUbU9dMhtqHO7GZlwtFFYu+e8xuYf3ghGZbnGlXfFn
 3glHCJ8vduf7ksVw=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kISKx-00B10Y-VW
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Sep 2020 07:58:50 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id D3AEBF5703915BF31C5E;
 Wed, 16 Sep 2020 15:58:32 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Wed, 16 Sep 2020
 15:58:23 +0800
From: Xiaojun Wang <wangxiaojun11@huawei.com>
To: <yuchao0@huawei.com>, <jaegeuk@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
Date: Wed, 16 Sep 2020 16:00:46 +0800
Message-ID: <20200916080046.2417806-1-wangxiaojun11@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kISKx-00B10Y-VW
Subject: [f2fs-dev] [PATCH] f2fs: change return value of reserved_segments
 to unsigned int
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

The type of SM_I(sbi)->reserved_segments is unsigned int,
so change the return value to unsigned int.
The type cast can be removed in reserved_sections as a result.

Signed-off-by: Xiaojun Wang <wangxiaojun11@huawei.com>
---
 fs/f2fs/segment.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 752b177073b2..f28836a9903e 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -500,7 +500,7 @@ static inline unsigned int free_segments(struct f2fs_sb_info *sbi)
 	return FREE_I(sbi)->free_segments;
 }
 
-static inline int reserved_segments(struct f2fs_sb_info *sbi)
+static inline unsigned int reserved_segments(struct f2fs_sb_info *sbi)
 {
 	return SM_I(sbi)->reserved_segments;
 }
@@ -532,7 +532,7 @@ static inline int overprovision_segments(struct f2fs_sb_info *sbi)
 
 static inline int reserved_sections(struct f2fs_sb_info *sbi)
 {
-	return GET_SEC_FROM_SEG(sbi, (unsigned int)reserved_segments(sbi));
+	return GET_SEC_FROM_SEG(sbi, reserved_segments(sbi));
 }
 
 static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
