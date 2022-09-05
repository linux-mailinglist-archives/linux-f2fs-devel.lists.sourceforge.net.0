Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 336D05AC9AD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Sep 2022 06:56:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oV49Q-0000DO-0m;
	Mon, 05 Sep 2022 04:56:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1oV49O-0000DI-IJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Sep 2022 04:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fyLJlnCgRqaiczxtXcOJAoaITaMrCC6UqkwvPLFV00U=; b=kf8uOMnTq27IW6XgDaWXVJvHAT
 LLRqTHA+B1aSbEWZtoPOmQwpyA+zu/zqcbA2CghBZhv8g6+YA0bAd/SN9gAXL9i3xdn7xzKl0PVIk
 spnNFjQjH9GmU6nK56arR4oDdkItKr+eWU8eA6XiUOLdCe/wWDSgs8mT2+B9bA8PjndQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fyLJlnCgRqaiczxtXcOJAoaITaMrCC6UqkwvPLFV00U=; b=b
 65/R6JXQcAyKiis6h61PtueA9aH82jr8PgHURQcduaMHDdBh5a/zjQRZE3gjXPfJDSvOhhdWaJgPz
 QzlICRfp+eB82eTGntF1OZsK/iDD43qcrugpcqqnnjnmCM2dicGvG3UUmVuQkJz/M7532IWm52pGT
 YBVR0Pifc12Krnek=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oV49N-0005p9-2M for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Sep 2022 04:55:58 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MLbj90jB7zlWjG;
 Mon,  5 Sep 2022 12:52:13 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 5 Sep 2022 12:55:44 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 5 Sep
 2022 12:55:44 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Mon, 5 Sep 2022 12:59:17 +0800
Message-ID: <20220905045917.7520-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The following scenarios exist. process A: process B:
 ->f2fs_drop_extent_tree
 ->f2fs_update_extent_cache_range ->f2fs_update_extent_tree_range ->write_lock
 ->set_inode_flag ->is_inode_flag_set ->__free [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1oV49N-0005p9-2M
Subject: [f2fs-dev] [PATCH -next] f2fs: fix race condition on setting
 FI_NO_EXTENT flag
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

The following scenarios exist.
process A:               process B:
->f2fs_drop_extent_tree  ->f2fs_update_extent_cache_range
                          ->f2fs_update_extent_tree_range
                           ->write_lock
 ->set_inode_flag
                           ->is_inode_flag_set
                           ->__free_extent_tree // Shouldn't
                                                // have been
                                                // cleaned up
                                                // here
  ->write_lock

In this case, the "FI_NO_EXTENT" flag is set between
f2fs_update_extent_tree_range and is_inode_flag_set
by other process. it leads to clearing the whole exten
tree which should not have happened. And we fix it by
move the setting it to the range of write_lock.

Fixes:5f281fab9b9a3 ("f2fs: disable extent_cache for fcollapse/finsert inodes")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 fs/f2fs/extent_cache.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 866e72b29bd5..761fd42c93f2 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -804,9 +804,8 @@ void f2fs_drop_extent_tree(struct inode *inode)
 	if (!f2fs_may_extent_tree(inode))
 		return;
 
-	set_inode_flag(inode, FI_NO_EXTENT);
-
 	write_lock(&et->lock);
+	set_inode_flag(inode, FI_NO_EXTENT);
 	__free_extent_tree(sbi, et);
 	if (et->largest.len) {
 		et->largest.len = 0;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
