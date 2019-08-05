Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 096A68130E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Aug 2019 09:21:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1huXJT-0002Ym-Em; Mon, 05 Aug 2019 07:21:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <koulihong@huawei.com>) id 1huXJS-0002Yc-DD
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 07:21:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n4HiI1eHWHC5/I9HG5N+4xTpEDbKBCn7Q7dDK2TdG7w=; b=M20ytxXLYy839tQ61v2UXrkkRQ
 ZfYi+nVuZBS2EQeB9Q5YwzqTntD4DTfNSDbMAn+dZcb5dqRrfDbYDVrOp4NkOaU7F8VJcySBAyeOG
 EAeWyODo66sp2Pbtgw3cOy3ehdWuam1tN1dL995QK6Kb2g22/wxfz8RDw9egxxOXnjBQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=n4HiI1eHWHC5/I9HG5N+4xTpEDbKBCn7Q7dDK2TdG7w=; b=j
 DaB1s8qZ8P3i5+SmKgx6036jHVDavmptwL9j4+j2RiyytsnyQBqEqsoB+z/WDS30CZgniHbahlsi0
 6qM1AQftnjjs4SyiQ8I2acBIcL7l8xWJ9dq/Ky4FWGo6tByGNTrJAJcd2haJNWbHa4xfaN2JyI8WD
 5XB4Xw3EHd0gjI0Y=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1huXJP-00BK5O-NU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 07:21:46 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id B85D13046AED64EFE633;
 Mon,  5 Aug 2019 15:21:36 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Mon, 5 Aug 2019
 15:21:27 +0800
From: Lihong Kou <koulihong@huawei.com>
To: <yuchao0@huawei.com>, <jaegeuk@kernel.org>
Date: Mon, 5 Aug 2019 15:27:24 +0800
Message-ID: <1564990044-107117-1-git-send-email-koulihong@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1huXJP-00BK5O-NU
Subject: [f2fs-dev] [PATCH] f2fs: remove duplicate code in
 f2fs_file_write_iter
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
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 fangwei1@huawei.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We will do the same check in generic_write_checks.
if (iocb->ki_flags & IOCB_NOWAIT) && !(iocb->ki_flags & IOCB_DIRECT)
        return -EINVAL;
just remove the same check in f2fs_file_write_iter.

Signed-off-by: Lihong Kou <koulihong@huawei.com>
---
 fs/f2fs/file.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 3e58a6f..50a87cf 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3134,11 +3134,6 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		goto out;
 	}
 
-	if ((iocb->ki_flags & IOCB_NOWAIT) && !(iocb->ki_flags & IOCB_DIRECT)) {
-		ret = -EINVAL;
-		goto out;
-	}
-
 	if (!inode_trylock(inode)) {
 		if (iocb->ki_flags & IOCB_NOWAIT) {
 			ret = -EAGAIN;
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
