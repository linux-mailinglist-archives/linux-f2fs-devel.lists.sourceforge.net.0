Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C29375B72A0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Sep 2022 17:02:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oY7Qs-0001aR-U6;
	Tue, 13 Sep 2022 15:02:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1oY7Qn-0001aK-7Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 15:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iOmqrGT7VLaNy0izFr47G/81mka1A+iMQol5j8Pp6AE=; b=kXmduoGML9Nq1+Mo1rl2/W11es
 Y8DQR1Ec/hmguKG7W0/ot741lEOJxVJP7+WcI4njrvpGsqq2dBPjKjrcB3EshRrprEsKlUlJVX+kR
 vT7Qlpj7B3Ex092V3DRpQGCXcHe5lK19JWu6ZkBQhax1AINcVM7xtrvsatP0i9UgtHqA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iOmqrGT7VLaNy0izFr47G/81mka1A+iMQol5j8Pp6AE=; b=MjkhEA67bGnJxIiMyZFPGxZeWU
 CSxibq1Up3EkLJOcvWHn+/QiIT4LMXUHPAN2VvvbFEFg47F2mB1uTdlE4n7NndUJXgB6qpFktQT5m
 4mEQsqBH63jORlJDys2BBB3sGT8weY7FRrxqWMgbPKLNc1ZNTrvAPsqEopyIhn51GF0s=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oY7Qw-0070m9-Qx for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 15:02:45 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MRmmQ45b7zNmBx;
 Tue, 13 Sep 2022 22:57:58 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 13 Sep 2022 23:02:33 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 13 Sep
 2022 23:02:33 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Tue, 13 Sep 2022 23:06:04 +0800
Message-ID: <20220913150604.45447-4-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
In-Reply-To: <20220913150604.45447-1-zhangqilong3@huawei.com>
References: <20220913150604.45447-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: A little awkward when looking at this code. Just replace the
 tab key with a space for better view here. Signed-off-by: Zhang Qilong
 <zhangqilong3@huawei.com>
 --- fs/f2fs/extent_cache.c | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-)
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1oY7Qw-0070m9-Qx
Subject: [f2fs-dev] [PATCH -next 3/3] f2fs: fix a stype error in
 f2fs_update_extent_tree_range
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

A little awkward when looking at this code. Just
replace the tab key with a space for better view
here.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 fs/f2fs/extent_cache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 761fd42c93f2..9ca4b7ab9b9d 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -583,7 +583,7 @@ static void f2fs_update_extent_tree_range(struct inode *inode,
 		org_end = dei.fofs + dei.len;
 		f2fs_bug_on(sbi, pos >= org_end);
 
-		if (pos > dei.fofs &&	pos - dei.fofs >= F2FS_MIN_EXTENT_LEN) {
+		if (pos > dei.fofs && pos - dei.fofs >= F2FS_MIN_EXTENT_LEN) {
 			en->ei.len = pos - en->ei.fofs;
 			prev_en = en;
 			parts = 1;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
