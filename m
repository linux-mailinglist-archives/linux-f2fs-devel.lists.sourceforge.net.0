Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D053481308
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Aug 2019 09:20:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1huXIS-00088i-38; Mon, 05 Aug 2019 07:20:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <koulihong@huawei.com>) id 1huXIO-00087v-Ns
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 07:20:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/G4mlcdCjEDcCfoCDyvwYk54S0cPAHtPygbPefU/jAg=; b=Vl35lOITQu58EFgOcPJMQEo47y
 0B5OgJmcjrnR4ZX2d5UgPB/Qpv7IOwtoGVNwLPU+M84j8JORVVZDJL0llJhOJ+Cp+S+0wtjIQThPq
 s9aJ2qLfR84k7jGZm0OEBAdjsytVBgsW64KEZCCnBEvrCv/w6JjnLTPgPvs30xQ/98c8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/G4mlcdCjEDcCfoCDyvwYk54S0cPAHtPygbPefU/jAg=; b=O
 S6Uu5a8RHzmq4Uvts+hKMZaxFQ3wOXP9S5++XlM0Tq+IPuKzBvkLtt6ixGf22PHd896jamvwXR/Cg
 213fCApPqBT4Yg65MX0lo7Xu0XJF1kUIABv5wE4Lh4AVUnY+9lOazph6omWQMLfeXjReWGLD25Ebk
 N/GIrH8iISB1uirw=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1huXIM-00BJz7-GR
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 07:20:40 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C9479E04882FA6FD9799;
 Mon,  5 Aug 2019 15:20:31 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Mon, 5 Aug 2019
 15:20:25 +0800
From: Lihong Kou <koulihong@huawei.com>
To: <yuchao0@huawei.com>, <jaegeuk@kernel.org>
Date: Mon, 5 Aug 2019 15:26:21 +0800
Message-ID: <1564989981-104324-1-git-send-email-koulihong@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1huXIM-00BJz7-GR
Subject: [f2fs-dev]  [PATCH] fsck.f2fs: fix the bug in reserve_new_block
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
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 fangwei1@huawei.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

if we new node block in fsck flow, we need to update
the valid_node_cnt at the same time.

Signed-off-by: Lihong Kou <koulihong@huawei.com>
---
 fsck/segment.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fsck/segment.c b/fsck/segment.c
index 98c836e..c16fb3a 100644
--- a/fsck/segment.c
+++ b/fsck/segment.c
@@ -51,8 +51,11 @@ void reserve_new_block(struct f2fs_sb_info *sbi, block_t *to,
 
 	if (old_blkaddr == NULL_ADDR) {
 		sbi->total_valid_block_count++;
-		if (c.func == FSCK)
+		if (c.func == FSCK) {
 			fsck->chk.valid_blk_cnt++;
+			if (IS_NODESEG(type))
+				fsck->chk.valid_node_cnt++;
+		}
 	}
 	se->dirty = 1;
 
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
