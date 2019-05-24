Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8DD2930D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 May 2019 10:27:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hU5Xi-0002yB-W2; Fri, 24 May 2019 08:27:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hU5Xi-0002xt-BF
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 08:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ROzktamzHRYWjqEFeL0ljdLnXhEFdkjMWHJHXUZlcOM=; b=Prp/puJwuE9zF5c+/Ga5z5oAEK
 z0d1PJtBAkYbT1S6fOJwdPdoep1Pe4I3fsOEKgLVh3n7VK3A8/LhzJmrXTxgDWE7p3VpNl8WqH30P
 W1xjhWm9FtiCjQwwYBL0OjC3A4R65kvyc9qBIabuQf959WUp55smnz6rTG1PNKPoVLnE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ROzktamzHRYWjqEFeL0ljdLnXhEFdkjMWHJHXUZlcOM=; b=P
 DzTC0C70Qd9C8+GQJllXazY9M7DhPXIHElKAy2amwL9G5y/7LgB1CTgyMp3i2PbH+ar9Xbh8jXFZg
 kUWlX71TG5kLjXg4FIvJ4kdcSmvzR8gbRT7jHDissd/Qx1j/ywEoNtma/2RUOOIj9fvbtxw6LRwKa
 eCoAJ7qHjIIhlmVY=;
Received: from szxga01-in.huawei.com ([45.249.212.187] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hU5Xg-0069v7-B4
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 08:27:10 +0000
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.55])
 by Forcepoint Email with ESMTP id 3405427D79DFADAA72D7;
 Fri, 24 May 2019 16:26:58 +0800 (CST)
Received: from dggeme763-chm.china.huawei.com (10.3.19.109) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 24 May 2019 16:26:58 +0800
Received: from szvp000201624.huawei.com (10.120.216.130) by
 dggeme763-chm.china.huawei.com (10.3.19.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 24 May 2019 16:26:57 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Fri, 24 May 2019 16:26:40 +0800
Message-ID: <20190524082640.109172-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-ClientProxiedBy: dggeme752-chm.china.huawei.com (10.3.19.98) To
 dggeme763-chm.china.huawei.com (10.3.19.109)
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
X-Headers-End: 1hU5Xg-0069v7-B4
Subject: [f2fs-dev] [PATCH] f2fs-tools: update checkpoint data atomically
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
Cc: jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch keeps line with f2fs kernel module for checkpoint update:
1. writeback all blocks inside checkpoint except last cp_park block;
2. fsync;
3. write last cp_park block;
4. fsync;

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/fsck.c  | 16 ++++++++++------
 fsck/mount.c |  7 ++++---
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 6aed51d..3c0332c 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2113,24 +2113,28 @@ static void fix_checkpoint(struct f2fs_sb_info *sbi)
 		ASSERT(ret >= 0);
 	}
 
-	ret = dev_write_block(cp, cp_blk_no++);
-	ASSERT(ret >= 0);
-
 	/* Write nat bits */
 	if (flags & CP_NAT_BITS_FLAG)
 		write_nat_bits(sbi, sb, cp, sbi->cur_cp);
+
+	ret = f2fs_fsync_device();
+	ASSERT(ret >= 0);
+
+	ret = dev_write_block(cp, cp_blk_no++);
+	ASSERT(ret >= 0);
+
+	ret = f2fs_fsync_device();
+	ASSERT(ret >= 0);
 }
 
 static void fix_checkpoints(struct f2fs_sb_info *sbi)
 {
-	int i, ret;
+	int i;
 
 	for (i = 0; i < 2; i++) {
 		/* write checkpoint out of place first */
 		sbi->cur_cp = sbi->cur_cp % 2 + 1;
 		fix_checkpoint(sbi);
-		ret = f2fs_fsync_device();
-		ASSERT(ret >= 0);
 	}
 }
 
diff --git a/fsck/mount.c b/fsck/mount.c
index bbb1af7..a627f1d 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2450,18 +2450,19 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
 	/* write the last cp */
 	ret = dev_write_block(cp, cp_blk_no++);
 	ASSERT(ret >= 0);
+
+	ret = f2fs_fsync_device();
+	ASSERT(ret >= 0);
 }
 
 void write_checkpoints(struct f2fs_sb_info *sbi)
 {
-	int i, ret;
+	int i;
 
 	for (i = 0; i < 2; i++) {
 		/* write checkpoint out of place first */
 		sbi->cur_cp = sbi->cur_cp % 2 + 1;
 		write_checkpoint(sbi);
-		ret = f2fs_fsync_device();
-		ASSERT(ret >= 0);
 	}
 }
 
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
