Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F8B3BD770
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Jul 2021 15:04:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m0kki-0005ZD-Hc; Tue, 06 Jul 2021 13:04:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <wangxiaojun11@huawei.com>) id 1m0kkh-0005Z6-0b
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Jul 2021 13:04:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CoHnf1IcngU1WGn40+WFyK7nicwHKZy2mB7zPzbPhb4=; b=JdIAY7kLFPlQXvSHIkqCTHCvBS
 f4gUH4Pytj23jdPZ6giqmpCSEzRlQptO4ZSk1DBP0bCbGF+njm/GEA2GfURusEZI6w0CLz1RCGd6q
 BXgfOGtvLpiTDC1RA4juERKqN/84gd68/22L7+ALTimoZB8mSOz21xikwlc9SqYyd0lA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=CoHnf1IcngU1WGn40+WFyK7nicwHKZy2mB7zPzbPhb4=; b=a
 HYXlx8qMHlKpUy708uvKnbRLA/y2mv8nvEnmbmM6TLsBYhYgIW57lOMGA3/eNaDiov5qGBv65RAzn
 YYDxwgAHiza8k8Ot/y16vrFK9hKO1jmy3EZRr1/gEBIfP05c7aPbkedyNhNgRV44+9KxzliPdQ63C
 kvuFBbl10Q+ZvzXg=;
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m0kkZ-0007xo-CC
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Jul 2021 13:04:38 +0000
Received: from dggeml756-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GK2g804f3z1CG0m;
 Tue,  6 Jul 2021 20:58:44 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggeml756-chm.china.huawei.com
 (10.1.199.158) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 6 Jul
 2021 21:04:11 +0800
From: Wang Xiaojun <wangxiaojun11@huawei.com>
To: <chao@kernel.org>, <jaegeuk@kernel.org>
Date: Tue, 6 Jul 2021 21:10:08 +0800
Message-ID: <20210706131008.1299060-1-wangxiaojun11@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggeml756-chm.china.huawei.com (10.1.199.158)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.255 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1m0kkZ-0007xo-CC
Subject: [f2fs-dev] [PATCH] f2fs-tools: fix wrong value of reserve_new_block
 parameter in page_symlink
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In page_symlink, reserve_new_block applies address for data block,
not for inodes. Therefore, is_inode is set to 0.

Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>
---
 fsck/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fsck/dir.c b/fsck/dir.c
index aeb876d..f7491a7 100644
--- a/fsck/dir.c
+++ b/fsck/dir.c
@@ -400,7 +400,7 @@ static void page_symlink(struct f2fs_sb_info *sbi, struct f2fs_node *inode,
 	memcpy(data_blk, symname, symlen);
 
 	set_summary(&sum, ino, 0, ni.version);
-	ret = reserve_new_block(sbi, &blkaddr, &sum, CURSEG_WARM_DATA, 1);
+	ret = reserve_new_block(sbi, &blkaddr, &sum, CURSEG_WARM_DATA, 0);
 	ASSERT(!ret);
 
 	ret = dev_write_block(data_blk, blkaddr);
-- 
2.25.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
