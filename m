Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2565A5CD8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Aug 2022 09:25:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oSvcJ-00072I-RY;
	Tue, 30 Aug 2022 07:24:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1oSvcI-00071v-Aq
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Aug 2022 07:24:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BxMDjlyn5JFirFkchBcYzLeZTr1jth0+imndIsVLaHo=; b=lO4PrK3qo53qLz81rEWXqmIcz7
 hTOEB410g/iniMH5P07ItsRqr/lsIF747HCWEOvv1b9orosBMZQLs9e6POCWW/qWJdQU34gFNPA2E
 Mhp3IQTqsC6CPhTybTp4d4LnMt9nB3PwgLatiUtEum8zSiulKUJ7Ti+3b5hC+3YShQHY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BxMDjlyn5JFirFkchBcYzLeZTr1jth0+imndIsVLaHo=; b=j
 8xTuWfA6AdzKWQYF3Cu1P7KODTZx1BbJfPV0QMHRCe+pGw1ns42NczW39iIJRPQzq5R4okGSK+gLJ
 rLDV1iBhWTlbbPQntZ1wEF1XOeBZtmvX3Wnz6eR8I30+1musLxVR2nin5TEGCTXskaal1SK3SJvG4
 saLyrsxPYeB3E0CE=;
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oSv6F-007DIa-I3 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Aug 2022 06:51:56 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MGyYd06P9z1N7dN;
 Tue, 30 Aug 2022 14:48:05 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 30 Aug 2022 14:51:42 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 30 Aug
 2022 14:51:41 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Tue, 30 Aug 2022 14:55:15 +0800
Message-ID: <20220830065515.101583-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Just use the defined COMPRESS_MAPPING to get compress cache
 mapping instaed of direct accessing name. Signed-off-by: Zhang Qilong
 <zhangqilong3@huawei.com>
 --- fs/f2fs/compress.c | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-)
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.255 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oSv6F-007DIa-I3
Subject: [f2fs-dev] [PATCH -next] f2fs: use COMPRESS_MAPPING to get compress
 cache mapping
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

Just use the defined COMPRESS_MAPPING to get compress cache
mapping instaed of direct accessing name.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 fs/f2fs/compress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 70e97075e535..06c3629a2597 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1905,7 +1905,7 @@ bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
 
 void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t ino)
 {
-	struct address_space *mapping = sbi->compress_inode->i_mapping;
+	struct address_space *mapping = COMPRESS_MAPPING(sbi);
 	struct folio_batch fbatch;
 	pgoff_t index = 0;
 	pgoff_t end = MAX_BLKADDR(sbi);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
