Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D6A89D48
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Aug 2019 13:46:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hx8m0-0005OR-Nf; Mon, 12 Aug 2019 11:46:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hx8ly-0005OA-Uz
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Aug 2019 11:45:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i9HclnUglyl5syXAEuUZGSzY2nbotp8tQWBNb3vlcTg=; b=AmExHvWBB58YG5FmTLInP3H4BS
 g9MqVzVMs1B1MoPRPbgBEr4QEx3IKXvgYH+c/iO2zy7jWPpN4hfb8j913Ww2ohOgGPY/hzVniVS18
 AFRaMhi2EIyWde2sM5c6envrIMaPkNXwstXorny4/soJlOeI/Se5qiMIayZGGe3GbViQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i9HclnUglyl5syXAEuUZGSzY2nbotp8tQWBNb3vlcTg=; b=Ju84dL8l+amoUgp6/P0WvqOFwE
 s3LJfE870yiE9DzZcMDnZYUovoe7c0YHMcEWG1pjAG9Q6Ce7FQnPLCTmrVht+Ujq2B+/FM/pB3loV
 mGkgnA/na/JxNtgSthtyZpHjkXWjLbcURET5vQE7zvuDzuT0WzO/6keNgFiOUNyQ1wgE=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hx8lw-000csp-Ph
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Aug 2019 11:45:58 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 8A283C03BB7B99A065B0;
 Mon, 12 Aug 2019 19:45:49 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Mon, 12 Aug 2019 19:45:40 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 12 Aug 2019 19:45:27 +0800
Message-ID: <20190812114527.34613-4-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20190812114527.34613-1-yuchao0@huawei.com>
References: <20190812114527.34613-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hx8lw-000csp-Ph
Subject: [f2fs-dev] [PATCH 4/4] fsck.f2fs: fix symlink correctly
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

inode.i_blocks includes inode, xnode and data block count, so, only
fix in below condition:
- i_blocks := 3 (inode + xnode + data_block)
- i_blocks := 2 (inode + data_block)

In addition, it recovers symlink's i_size to 4k rather than i_blocks *
4k.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/fsck.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 1ea8590..61d1a8d 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -1027,16 +1027,15 @@ skip_blkcnt_fix:
 
 	free(en);
 
-	if (ftype == F2FS_FT_SYMLINK && i_blocks && i_size == 0) {
+	if (ftype == F2FS_FT_SYMLINK && i_size == 0 &&
+			i_blocks == (i_xattr_nid ? 3 : 2)) {
 		ASSERT_MSG("ino: 0x%x i_blocks: %lu with zero i_size\n",
 						nid, (unsigned long)i_blocks);
 		if (c.fix_on) {
-			u64 i_size = i_blocks * F2FS_BLKSIZE;
-
-			node_blk->i.i_size = cpu_to_le64(i_size);
+			node_blk->i.i_size = cpu_to_le64(F2FS_BLKSIZE);
 			need_fix = 1;
 			FIX_MSG("Symlink: recover 0x%x with i_size=%lu",
-						nid, (unsigned long)i_size);
+					nid, (unsigned long)F2FS_BLKSIZE);
 		}
 	}
 
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
