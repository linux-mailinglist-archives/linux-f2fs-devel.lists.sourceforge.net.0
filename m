Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE251354A1E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Apr 2021 03:36:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lTadp-00052I-L1; Tue, 06 Apr 2021 01:36:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <zhuangyi1@huawei.com>) id 1lTado-00052A-5t
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Apr 2021 01:36:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lkrEc8HLNrCtwK1XTpX9rsMiLL4wWOtK+0zbl0C3SnE=; b=mIFllbGGwmcCtT1djTxlB6gkVF
 zCZIQoWxP1sJGJRN4FL8BazyCMIfWzSrInXpGAQB5/npU/TH6QOhNA63SLnDB7UToMok3MkVqTKKx
 Oh2pO2jCsZcvMNEsd4cSpV6w9WJwcNPgv+bOuzPrF/d60I3/jGaSSF600nIb5fqNWGd0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lkrEc8HLNrCtwK1XTpX9rsMiLL4wWOtK+0zbl0C3SnE=; b=j
 x75sNTBKU9da/uqVfDBG8NdROJ0LD5LoGsiaPPT6tCulyN1dTQD8E0zX5fCBw+l4LM21ZbwXhvE6Z
 xWFttlnCfa9dRAMpKKjxoj+O/7LMR/M7mdiZnugDHl/d+imobvj563Q89q3KT4APEloiUNWRUS0iP
 pk7GhzFRyQ3vaNYQ=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lTadg-0083XH-HZ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Apr 2021 01:36:28 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FDqn45q1bz166hT;
 Tue,  6 Apr 2021 09:34:00 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Tue, 6 Apr 2021
 09:36:06 +0800
From: Yi Zhuang <zhuangyi1@huawei.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
Date: Tue, 6 Apr 2021 09:47:35 +0800
Message-ID: <20210406014735.127457-1-zhuangyi1@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lTadg-0083XH-HZ
Subject: [f2fs-dev] [PATCH -next] f2fs: modify open brace '{' following
 function definitions
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

Made suggested modifications from checkpatch in reference to ERROR:
 open brace '{' following function definitions go on the next line

Signed-off-by: Yi Zhuang <zhuangyi1@huawei.com>
---
 fs/f2fs/segment.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 213cc1b8279a..301121dc9f75 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4764,7 +4764,8 @@ static struct f2fs_dev_info *get_target_zoned_dev(struct f2fs_sb_info *sbi,
 }
 
 static int report_one_zone_cb(struct blk_zone *zone, unsigned int idx,
-			      void *data) {
+			      void *data)
+{
 	memcpy(data, zone, sizeof(struct blk_zone));
 	return 0;
 }
@@ -4880,7 +4881,8 @@ struct check_zone_write_pointer_args {
 };
 
 static int check_zone_write_pointer_cb(struct blk_zone *zone, unsigned int idx,
-				      void *data) {
+				      void *data)
+{
 	struct check_zone_write_pointer_args *args;
 	args = (struct check_zone_write_pointer_args *)data;
 
-- 
2.26.0.106.g9fadedd



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
