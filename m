Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F2E234F94
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Aug 2020 05:25:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k1i99-0003oB-5j; Sat, 01 Aug 2020 03:25:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chengzhihao1@huawei.com>) id 1k1i97-0003o4-NN
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Aug 2020 03:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GuS8OepY1FtcPE1oTHd4+KFREKHxNeMgQqDLOdpQQ2I=; b=fDQLWWN2BudM1VmGcUKBigTTsu
 KAN8kHNB0g/kxwjErDuPtFR5uNw6NQyvyTTHTNA3c1nHWlnD/IbNndjIHeESiNIJGj2y4iLnZ1U6w
 v09CkNsG2GiPXsEXhvD8WChErTqd91oR9TJHzuUYS9V/zxy7TZV4EF8KzrPF0+7Iwi8Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=GuS8OepY1FtcPE1oTHd4+KFREKHxNeMgQqDLOdpQQ2I=; b=W
 PNrNuYho8ZRHRKxB9fi0nKtntXPZSEjp6ATzdCGEzqArOX25yyQHco2fM2Q+DiQg8xz1Uu2g6X4RI
 faY+eK00aaGQyGNaFuHcCI9L3NHJ5j5VoywmlebnA7MGmNFN1baCs+Wxd2OZLz4qKBcZ5MUTLA+Bs
 XfnJxorq03hoDs90=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k1i93-008kjp-Kw
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Aug 2020 03:25:17 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D03D634FCD7D356B5745;
 Sat,  1 Aug 2020 11:24:59 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Sat, 1 Aug 2020
 11:24:52 +0800
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>, <yi.zhang@huawei.com>
Date: Sat, 1 Aug 2020 11:24:50 +0800
Message-ID: <20200801032450.3028986-1-chengzhihao1@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1k1i93-008kjp-Kw
Subject: [f2fs-dev] [PATCH] f2fs: update_sit_entry: Make the judgment
 condition of f2fs_bug_on more intuitive
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

Current judgment condition of f2fs_bug_on in function update_sit_entry():
  new_vblocks >> (sizeof(unsigned short) << 3) ||
	new_vblocks > sbi->blocks_per_seg

which equivalents to:
  new_vblocks < 0 || new_vblocks > sbi->blocks_per_seg

The latter is more intuitive.

Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
Reported-by: Jack Qiu <jack.qiu@huawei.com>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 196f31503511..41836447418d 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2140,7 +2140,7 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 	new_vblocks = se->valid_blocks + del;
 	offset = GET_BLKOFF_FROM_SEG0(sbi, blkaddr);
 
-	f2fs_bug_on(sbi, (new_vblocks >> (sizeof(unsigned short) << 3) ||
+	f2fs_bug_on(sbi, (new_vblocks < 0 ||
 				(new_vblocks > sbi->blocks_per_seg)));
 
 	se->valid_blocks = new_vblocks;
-- 
2.25.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
