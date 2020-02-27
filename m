Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7101715FB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Feb 2020 12:30:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j7HND-0006Gf-0j; Thu, 27 Feb 2020 11:30:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j7HNA-0006GM-OV
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Feb 2020 11:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AQFrci2zAX0cp0OC0eFA93OLqomTrxDjZCGvxX4PWvY=; b=c/PmQQ8cbMgKDI/m8q0P+Yltfo
 7wHwTQEk3w2GgZDLDZm+N74zw6+LpZmo+64MXqIhlrvxKkh5rtWjtFAhyKGZvUqleBzsuxhpwaaJC
 WkHkIq4ynHYUSyE5PzRVoHMaQY4B/y4+w9xpqWr0msn3xnDdkRX7FuZeOr353l9MIt8g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AQFrci2zAX0cp0OC0eFA93OLqomTrxDjZCGvxX4PWvY=; b=b5yUX+iXB27dTuS5LQH8u7gByP
 1GKCmp6PEG1TUaBYrxSBBhtayLi8WfJeSYTQeweF5reimWs7ZwwevRHGeqy5NofR/vk3eDAbN+d69
 T7LSWUSS8JlkeZjh9c9LMYFv6fNu/QeJjH6VQm9idR/zEiy91GAEIBvZH4TVxoeU5LgI=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j7HN6-007a0H-7w
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 27 Feb 2020 11:30:32 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id A92B6C192E6CC6BD8603;
 Thu, 27 Feb 2020 19:30:18 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Thu, 27 Feb 2020 19:30:10 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 27 Feb 2020 19:30:04 +0800
Message-ID: <20200227113005.127729-2-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20200227113005.127729-1-yuchao0@huawei.com>
References: <20200227113005.127729-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j7HN6-007a0H-7w
Subject: [f2fs-dev] [PATCH 2/3] f2fs: remove i_sem lock coverage in
 f2fs_setxattr()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs_inode.xattr_ver field was gone after commit d260081ccf37
("f2fs: change recovery policy of xattr node block"), remove i_sem
lock coverage in f2fs_setxattr()

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/xattr.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index e46a10eb0e42..5c3e82e7c0bb 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -777,12 +777,9 @@ int f2fs_setxattr(struct inode *inode, int index, const char *name,
 	f2fs_balance_fs(sbi, true);
 
 	f2fs_lock_op(sbi);
-	/* protect xattr_ver */
-	down_write(&F2FS_I(inode)->i_sem);
 	down_write(&F2FS_I(inode)->i_xattr_sem);
 	err = __f2fs_setxattr(inode, index, name, value, size, ipage, flags);
 	up_write(&F2FS_I(inode)->i_xattr_sem);
-	up_write(&F2FS_I(inode)->i_sem);
 	f2fs_unlock_op(sbi);
 
 	f2fs_update_time(sbi, REQ_TIME);
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
