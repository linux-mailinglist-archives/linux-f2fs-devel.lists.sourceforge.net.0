Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A28B45A4E0B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Aug 2022 15:28:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oSeo3-0002P0-BC;
	Mon, 29 Aug 2022 13:27:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1oSeo1-0002Ou-Ga
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Aug 2022 13:27:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p3Z4XCtJFdFSPoD+jyFBEnQNjWdIe1+Yhr+43rv48nE=; b=B8SV49rik7ar0zWHrmav2fudIs
 XPsNsqoU/yA5QMYCaM97ZGb4v2NpXLfY5qtoLOF26p2lAMupbRI/krDxlGC9rYeObq+NrqovHU7t+
 8RA//tdaH12gmDKd7o7+7MHw3djGDtvCycGCQR9jzj0bawhAMaqxeBhf310Bb2thZWj8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=p3Z4XCtJFdFSPoD+jyFBEnQNjWdIe1+Yhr+43rv48nE=; b=Y
 j0GyTNvDAmhxBL9cubgQVx90v/QoGUgP5xN/LyokftnVbEAz7wMH/d8QWlKg3X8lW5RRCAC09RAJp
 ZZZC/hPWQyzUeWXFsuMT2JM5uyjPNGKTzGZO4m02ZGmvJ1G7VOe2ehGdS/RzoDFWXAU7BFqT504h5
 Cpgxy93BM9MBn9EY=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oSenz-006RSF-JR for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Aug 2022 13:27:57 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MGWPN6pG4zlWXK;
 Mon, 29 Aug 2022 21:24:24 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 29 Aug 2022 21:27:46 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 29 Aug
 2022 21:27:46 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Mon, 29 Aug 2022 21:31:20 +0800
Message-ID: <20220829133120.100373-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The "true" is not match the parametera type "int", and we
 modify it. Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com> ---
 fs/f2fs/segment.c | 2 +- 1 file changed, 1 insertion(+),
 1 deletion(-) diff --git a/fs/f2fs/segment.c
 b/fs/f2fs/segment.c index a5054725d0b6..460048f3c850 100644 ---
 a/fs/f2fs/segment.c
 +++ b/fs/f2fs/segment.c @@ -481,7 +481,7 @@ void f2fs_balance_fs_bg(struct
 f2fs_sb_in [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1oSenz-006RSF-JR
Subject: [f2fs-dev] [PATCH -next] f2fs: replace logical value "true" with a
 int number
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

The "true" is not match the parametera type "int", and
we modify it.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a5054725d0b6..460048f3c850 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -481,7 +481,7 @@ void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi, bool from_bg)
 
 		mutex_unlock(&sbi->flush_lock);
 	}
-	f2fs_sync_fs(sbi->sb, true);
+	f2fs_sync_fs(sbi->sb, 1);
 	stat_inc_bg_cp_count(sbi->stat_info);
 }
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
