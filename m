Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B457F38227C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 May 2021 03:16:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1liRs4-0006TU-U8; Mon, 17 May 2021 01:16:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1liRs3-0006TN-Cu
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 May 2021 01:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GqUq9qqX3wIu98gP7gHddOrmKF2Z9i8ugCJPqpvYTFY=; b=GD3sSs2j81PL7ZHuP7567+rDZ5
 Gzf6WshGfSJlEAtg5SU6unYMhRf+jDUA7Tx1n2f4TBUbI1nd4HGxIQcgUHGkr/zdpTAzJFROzxiB3
 KziXXJ7+V6v8f9Hs+acXbkbLr/KjSN4d7HXaVYMbyxsVU6uJLbncq67DFq6G7CXd5Z+0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=GqUq9qqX3wIu98gP7gHddOrmKF2Z9i8ugCJPqpvYTFY=; b=X
 9vUKc6E6sKB3li0MCVPScktYL7bnhMKjQnx4wxPOf7fOZubDqyFcmiUsi02aVEkPAcxfJoHawLPbZ
 RF7buIu7Pf+Nq49tyYsE+zR5ljsLB4Zxq3XOiuUdA94Z9qGyCz/b7ypfxFbtU996xZujEmofBpjfS
 nv5MLGO4y3TgPk0Y=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1liRrq-00AsIL-6a
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 May 2021 01:16:37 +0000
Received: from dggems704-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fk1Mc6KDqzQpQK;
 Mon, 17 May 2021 09:12:44 +0800 (CST)
Received: from dggemx753-chm.china.huawei.com (10.0.44.37) by
 dggems704-chm.china.huawei.com (10.3.19.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 09:16:12 +0800
Received: from szvp000203569.huawei.com (10.120.216.130) by
 dggemx753-chm.china.huawei.com (10.0.44.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 17 May 2021 09:16:11 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 17 May 2021 09:15:57 +0800
Message-ID: <20210517011557.21722-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggemx753-chm.china.huawei.com (10.0.44.37)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1liRrq-00AsIL-6a
Subject: [f2fs-dev] [PATCH] f2fs: add MODULE_SOFTDEP to ensure crc32c is
 included in the initramfs
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
Cc: marcosfrm <marcosfrm@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As marcosfrm reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=213089

Initramfs generators rely on "pre" softdeps (and "depends") to include
additional required modules.

F2FS does not declare "pre: crc32" softdep. Then every generator (dracut,
mkinitcpio...) has to maintain a hardcoded list for this purpose.

Hence let's use MODULE_SOFTDEP("pre: crc32") in f2fs code.

Fixes: 43b6573bac95 ("f2fs: use cryptoapi crc32 functions")
Reported-by: marcosfrm <marcosfrm@gmail.com>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 3f8a7a6c250c..fa0ce6301c16 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4431,4 +4431,5 @@ module_exit(exit_f2fs_fs)
 MODULE_AUTHOR("Samsung Electronics's Praesto Team");
 MODULE_DESCRIPTION("Flash Friendly File System");
 MODULE_LICENSE("GPL");
+MODULE_SOFTDEP("pre: crc32c");
 
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
