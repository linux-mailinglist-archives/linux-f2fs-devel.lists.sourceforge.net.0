Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBB21F9036
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2020 09:46:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jkjoZ-0001Yx-Sz; Mon, 15 Jun 2020 07:45:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <fangwei1@huawei.com>) id 1jkjoN-0001Y5-Ra
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 07:45:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dWo8u+/5XorankHj8n6CjFsdicaC2FYU/vfSvWOMs4A=; b=fy1sSpbOJ7atOp21PF3wcnj+cr
 lw+O/FamNIKGHjtKK/1spK2lGMQ2sLWnb9Hs4tRrbrYn4BSdpBatMhrhOnJkz2rl6cJWJsK/YVpYD
 8eum9yPoyVZgpEd8cFVgED7+q1Xcokh842GegEKZAVrTS4uEhVwtxNuYsGz2mjcnYQdY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=dWo8u+/5XorankHj8n6CjFsdicaC2FYU/vfSvWOMs4A=; b=O
 yu95cR1HanUzLRW07lz4a4v+HrjeEDIT6Bxzxnev4PqjbhOMIDcaetacpeZR422vhm2k/C08EqeMf
 5bAFdE0THknWTMMywb2m59S0J8zJcLKvRvF453nG7c5fFcxyCT4GoT5mcPIZA14VRPFDHl/VNqyYJ
 IVIKFeXkugA5+Dwc=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jkjoL-006CoC-Uu
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 07:45:43 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4D0E6AEDD8C8F1502077
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jun 2020 15:44:10 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Mon, 15 Jun 2020
 15:43:59 +0800
From: Wei Fang <fangwei1@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Mon, 15 Jun 2020 16:11:38 +0800
Message-ID: <20200615081138.11685-1-fangwei1@huawei.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jkjoL-006CoC-Uu
Subject: [f2fs-dev] [PATCH v2] f2fs: remove useless truncate in
 f2fs_collapse_range()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Since offset < new_size, no need to do truncate_pagecache() again
with new_size.

Signed-off-by: Wei Fang <fangwei1@huawei.com>
---
v2: remove the lock coverage change

 fs/f2fs/file.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 3268f8dd59bb..98721f9bef25 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1373,8 +1373,6 @@ static int f2fs_collapse_range(struct inode *inode, loff_t offset, loff_t len)
 	truncate_pagecache(inode, offset);
 
 	new_size = i_size_read(inode) - len;
-	truncate_pagecache(inode, new_size);
-
 	ret = f2fs_truncate_blocks(inode, new_size, true);
 	up_write(&F2FS_I(inode)->i_mmap_sem);
 	if (!ret)
-- 
2.21.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
