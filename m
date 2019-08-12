Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E38B289D49
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Aug 2019 13:46:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hx8m3-0004HF-Jl; Mon, 12 Aug 2019 11:46:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hx8m2-0004H5-6s
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Aug 2019 11:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gW73TgrCLKebMXKCtjGPGz6dIQjfcSvCF6sFWIuywRk=; b=iaTaKCDUldyva9u212YavEYa9M
 46D/11/ioq6NlUBLKtgr05UGwDLoUBNYaZG9LgYCcTUJR7cP2DxpBqfMXYVbdzi7gxaoee7njt2r/
 AuI9OY7LWKgpOXmGwKA+QsQ3DyGL+h+vW8VLtWI4EibPBRMeSyF064MNYx1dCQ73GtFM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gW73TgrCLKebMXKCtjGPGz6dIQjfcSvCF6sFWIuywRk=; b=CadFJZFYSif5AjChD7YwntjpNf
 VegyNXl4nNCFJo7TJkpv7FLjRxMVw4BZ5qzcqbIuFl4FyaK9jf5hzyjzKgm8deKiNrX6TSc3SeNQ6
 lRfPHrxX5VJ0SwUT8MD7p1WcVyK5sZ1pVSG0GcUyq+AsT5+o+jxFLk06J3JeAuiBn9Yk=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hx8m0-002dSe-TN
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Aug 2019 11:46:02 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9132EBC782C4752FEDDA;
 Mon, 12 Aug 2019 19:45:49 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Mon, 12 Aug 2019 19:45:39 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 12 Aug 2019 19:45:26 +0800
Message-ID: <20190812114527.34613-3-yuchao0@huawei.com>
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
X-Headers-End: 1hx8m0-002dSe-TN
Subject: [f2fs-dev] [PATCH 3/4] fsck.f2fs: fix to show removed x_nid
 correctly
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

Otherwise, we just show fixed zero x_nid value.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/fsck.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 91ddd49..1ea8590 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -659,6 +659,7 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 	u32 i_links = le32_to_cpu(node_blk->i.i_links);
 	u64 i_size = le64_to_cpu(node_blk->i.i_size);
 	u64 i_blocks = le64_to_cpu(node_blk->i.i_blocks);
+	nid_t i_xattr_nid = le32_to_cpu(node_blk->i.i_xattr_nid);
 	int ofs;
 	char *en;
 	u32 namelen;
@@ -709,15 +710,14 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 	}
 
 	/* readahead xattr node block */
-	fsck_reada_node_block(sbi, le32_to_cpu(node_blk->i.i_xattr_nid));
+	fsck_reada_node_block(sbi, i_xattr_nid);
 
-	if (fsck_chk_xattr_blk(sbi, nid,
-			le32_to_cpu(node_blk->i.i_xattr_nid), blk_cnt)) {
+	if (fsck_chk_xattr_blk(sbi, nid, i_xattr_nid, blk_cnt)) {
 		if (c.fix_on) {
 			node_blk->i.i_xattr_nid = 0;
 			need_fix = 1;
 			FIX_MSG("Remove xattr block: 0x%x, x_nid = 0x%x",
-					nid, le32_to_cpu(node_blk->i.i_xattr_nid));
+							nid, i_xattr_nid);
 		}
 	}
 
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
