Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B828100B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Aug 2019 03:45:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1huS45-0005ZA-6F; Mon, 05 Aug 2019 01:45:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1huS43-0005Z3-KH
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 01:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ddat7D9t1ek/kivo0h62kwVb9B7Fu72fxK8cLBFwWb4=; b=Jz404LV7TQfNUbd31haEulrfcX
 HBzNAzuS1UvENCp8jWqEr+Vyu571yh089ZmF3mFR8CyHgXZQyPalta0xQP5DKcc2HBwCVz63XTXD9
 So0O899btGDHpLHkYlap7Tb+NUHxn88o4GBWaClxA+4wXis8OXYVJpXjOW3pNhuKfLf8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ddat7D9t1ek/kivo0h62kwVb9B7Fu72fxK8cLBFwWb4=; b=XWF4xzgt888L6bm40c3ik1wltz
 lZUWzpMPmEBnScoKYOPJ4+w0UwYHdnKyHou/u+IayVkJifJVUh1bhE6N/pppkxl5j/2l7WDvVqVOr
 EQt3e6jfIg6zKjedL60EucYSTNCinDE6OfUbliVJ27ifMcQDMxRHSuRjom9BcVQ2gsJY=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1huS41-00B2yM-EN
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 01:45:31 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1521CA36F1693BE6A49B;
 Mon,  5 Aug 2019 09:45:22 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Mon, 5 Aug 2019 09:45:12 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 5 Aug 2019 09:44:58 +0800
Message-ID: <20190805014459.119305-2-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20190805014459.119305-1-yuchao0@huawei.com>
References: <20190805014459.119305-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1huS41-00B2yM-EN
Subject: [f2fs-dev] [PATCH 2/3] sload.f2fs: fix memory leak of dentry.link
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

We forgot to release memory allocated in dentry.link, fix to release
it after last use of it.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/dir.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fsck/dir.c b/fsck/dir.c
index 92d7e05..0984d26 100644
--- a/fsck/dir.c
+++ b/fsck/dir.c
@@ -523,11 +523,15 @@ static void init_inode_block(struct f2fs_sb_info *sbi,
 	node_blk->footer.flag = 0;
 	node_blk->footer.cp_ver = ckpt->checkpoint_ver;
 
-	if (S_ISDIR(mode))
+	if (S_ISDIR(mode)) {
 		make_empty_dir(sbi, node_blk);
-	else if (S_ISLNK(mode))
+	} else if (S_ISLNK(mode)) {
 		page_symlink(sbi, node_blk, de->link, size);
 
+		free(de->link);
+		de->link = NULL;
+	}
+
 	if (c.feature & cpu_to_le32(F2FS_FEATURE_INODE_CHKSUM))
 		node_blk->i.i_inode_checksum =
 			cpu_to_le32(f2fs_inode_chksum(node_blk));
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
