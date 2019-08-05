Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E93218100C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Aug 2019 03:45:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1huS45-00034l-2i; Mon, 05 Aug 2019 01:45:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1huS43-00034W-KN
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 01:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IyUD6f/36jx4ASl1y37og27Ptk2RuewytUREIqEcXLA=; b=JhJJEdg5UwTr8Z3SURzihB46mA
 iyI4WGSamIAI2d1fw7e6mSSkkTwLP18orDI1kLZktRbXjq+H5flijoBy+2xYpwRK/aSF2XXosyo3U
 3dJmnUwC10Cb4Iq/DKEH7zGR8vSw3ZdOgDVIRvAO4oIhDAn73blOQ4F7tIweOkq66DqM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IyUD6f/36jx4ASl1y37og27Ptk2RuewytUREIqEcXLA=; b=S
 OkCj8bWK3XhEQlYyRn/k3ZLam8matzpeAjvzazQHPOs1n7VRJ0dEsZQa8bnZf0rkzeTzrpU82PNCD
 Qu5ikg/ECuZKbRtWn64ZJx+NaiNdxbZhex4/Gidh0d9HbYANLW6l12ZnT8akGNmwC1RyXaK11XGpQ
 EeRV9M10Em+Z4m2U=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1huS41-00AbyE-IU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 01:45:31 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 2045DD54890DAE4DEEB4;
 Mon,  5 Aug 2019 09:45:22 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Mon, 5 Aug 2019 09:45:11 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 5 Aug 2019 09:44:57 +0800
Message-ID: <20190805014459.119305-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1huS41-00AbyE-IU
Subject: [f2fs-dev] [PATCH 1/3] sload.f2fs: fix memory leak in
 build_directory
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
Cc: Xiaojun Wang <wangxiaojun11@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Xiaojun Wang <wangxiaojun11@huawei.com>

This patch fix bug that variable dentries going out of scope leaks
the storage it points to.

Signed-off-by: Xiaojun Wang <wangxiaojun11@huawei.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/sload.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fsck/sload.c b/fsck/sload.c
index f5a4651..940da5c 100644
--- a/fsck/sload.c
+++ b/fsck/sload.c
@@ -240,12 +240,18 @@ static int build_directory(struct f2fs_sb_info *sbi, const char *full_path,
 		ret = set_selinux_xattr(sbi, dentries[i].path,
 					dentries[i].ino, dentries[i].mode);
 		if (ret)
-			return ret;
+			goto out_free;
 
 		free(dentries[i].path);
 		free(dentries[i].full_path);
 		free((void *)dentries[i].name);
 	}
+out_free:
+	for (; i < entries; i++) {
+		free(dentries[i].path);
+		free(dentries[i].full_path);
+		free((void *)dentries[i].name);
+	}
 
 	free(dentries);
 	return 0;
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
