Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B410A1E3EF2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 May 2020 12:28:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jdtIB-00024S-1S; Wed, 27 May 2020 10:28:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jdtI9-00024L-Qw
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 May 2020 10:28:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tokL2Ahp5f3sIgITPU1xb6FsgZO64Cf9G0Q6+gH7/nY=; b=RzNQKdOMHMEkFIdtseofpg3y6e
 chRQ9PKXOGBTj86WOeiAg7ub5ihLSkv6+PDyDW9Moly0u2Xm7fPqESuoXNJOCagicmXAlGSc6PuTd
 BOTwoc4YP7n9TCueZgFvqPAB/XMpM2HL3s6G9E9lUxfDTEn+oq3fQCBQTzpB+634OY9w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tokL2Ahp5f3sIgITPU1xb6FsgZO64Cf9G0Q6+gH7/nY=; b=brzpPz2k1f/jp1ytiTZCnWnk2Q
 HGJ9Y2Y8MIwW5nRVM+W6BR/PiXOODXuLiB8t853GgBdeAN1VWQ55boqcGPQAhby/Ey5bkFU9Ougvr
 K1sFbyHk6xDdFtbrQ5PwmThn5oQZx/j+bIApnxLTZSGKh9U0+2JwlccU0p2FPkKgWs60=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jdtI7-0007ZA-N6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 May 2020 10:28:09 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 0562BA029DB6410E33CF;
 Wed, 27 May 2020 18:28:01 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Wed, 27 May 2020 18:27:55 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 27 May 2020 18:27:52 +0800
Message-ID: <20200527102753.15743-2-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20200527102753.15743-1-yuchao0@huawei.com>
References: <20200527102753.15743-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jdtI7-0007ZA-N6
Subject: [f2fs-dev] [PATCH 2/3] f2fs: remove unneeded return value of
 __insert_discard_tree()
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

We never use return value of __insert_discard_tree(), so remove it.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/segment.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 1c48ec866b8c..ebbadde6cbce 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1221,7 +1221,7 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 	return err;
 }
 
-static struct discard_cmd *__insert_discard_tree(struct f2fs_sb_info *sbi,
+static void __insert_discard_tree(struct f2fs_sb_info *sbi,
 				struct block_device *bdev, block_t lstart,
 				block_t start, block_t len,
 				struct rb_node **insert_p,
@@ -1230,7 +1230,6 @@ static struct discard_cmd *__insert_discard_tree(struct f2fs_sb_info *sbi,
 	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
 	struct rb_node **p;
 	struct rb_node *parent = NULL;
-	struct discard_cmd *dc = NULL;
 	bool leftmost = true;
 
 	if (insert_p && insert_parent) {
@@ -1242,12 +1241,8 @@ static struct discard_cmd *__insert_discard_tree(struct f2fs_sb_info *sbi,
 	p = f2fs_lookup_rb_tree_for_insert(sbi, &dcc->root, &parent,
 							lstart, &leftmost);
 do_insert:
-	dc = __attach_discard_cmd(sbi, bdev, lstart, start, len, parent,
+	__attach_discard_cmd(sbi, bdev, lstart, start, len, parent,
 								p, leftmost);
-	if (!dc)
-		return NULL;
-
-	return dc;
 }
 
 static void __relocate_discard_cmd(struct discard_cmd_control *dcc,
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
