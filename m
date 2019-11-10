Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FA1F62A7
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Nov 2019 03:44:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iTdDP-0005Wk-9s; Sun, 10 Nov 2019 02:44:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1iTdDO-0005WW-5h
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 10 Nov 2019 02:44:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K+s91CzXc0RthqVXtZFAOs12cEn2HKYF8NPTwLvV8Zw=; b=Lbm0Te+/eeB2favwuJohMW3mhD
 4OlzRzKGJz0c7+yqkTA1YohyvqOTO9f2ZZ9xpgtvp4BycMTPDYanGr30DDyAjptnFhimE/ItGetCq
 6KY9UifaSdxaegH3BvYigguG6+lHOy/eg0VUH5FAPCt2vUbqzjhxhFUQhFYGFdq4a2Sc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K+s91CzXc0RthqVXtZFAOs12cEn2HKYF8NPTwLvV8Zw=; b=blE0myCRzB091NlCARCrtLdvqO
 DzA7cBfcTH/Mr4j8C60s9jXsqQDeFSwPO7ol+DEffpts5SJPdhLTKjMludIVUYvei7cvdPs4pqrdA
 4m0RiaHWbWfSbkvyf0jRLQgBfqjP39bSZORlHZ7BrbdDTtu0yI2ej6PwuZeDY3ecNfak=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iTdDM-00A5Gu-W0
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 10 Nov 2019 02:44:34 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B78921655;
 Sun, 10 Nov 2019 02:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573353866;
 bh=Sg8qrQudyXGXbUZiWMaBT0NuDvDe+WK1N9/ihXre3Q4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0kwALOfWONzGrUrbGac1CiV62VxHO1ob3YKkADF2sqtxlUP5y45ya3M3rsSXEg1SF
 ljia4BaUBV6VRiDOQb3dmM1SZCLxpeuHFx3vWewmrSHF25SEL7kaSSeCRFOExTn0tw
 EfAlC+wvz4kntbyrWZab8kK2sDK7tFgHiT16Z1LE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat,  9 Nov 2019 21:39:28 -0500
Message-Id: <20191110024013.29782-146-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191110024013.29782-1-sashal@kernel.org>
References: <20191110024013.29782-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iTdDM-00A5Gu-W0
Subject: [f2fs-dev] [PATCH AUTOSEL 4.19 146/191] f2fs: update i_size after
 DIO completion
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Jaegeuk Kim <jaegeuk@kernel.org>

[ Upstream commit 0a4daae5ffea39f5015334e4d18a6a80b447cae4 ]

This is related to
ee70daaba82d ("xfs: update i_size after unwritten conversion in dio completion")

If we update i_size during dio_write, dio_read can read out stale data, which
breaks xfstests/465.

Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/data.c | 15 +++++++--------
 fs/f2fs/f2fs.h |  1 +
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 9511466bc7857..c0d0744a52a55 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -887,7 +887,6 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
 	struct f2fs_summary sum;
 	struct node_info ni;
 	block_t old_blkaddr;
-	pgoff_t fofs;
 	blkcnt_t count = 1;
 	int err;
 
@@ -916,12 +915,10 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
 					old_blkaddr, old_blkaddr);
 	f2fs_set_data_blkaddr(dn);
 
-	/* update i_size */
-	fofs = f2fs_start_bidx_of_node(ofs_of_node(dn->node_page), dn->inode) +
-							dn->ofs_in_node;
-	if (i_size_read(dn->inode) < ((loff_t)(fofs + 1) << PAGE_SHIFT))
-		f2fs_i_size_write(dn->inode,
-				((loff_t)(fofs + 1) << PAGE_SHIFT));
+	/*
+	 * i_size will be updated by direct_IO. Otherwise, we'll get stale
+	 * data from unwritten block via dio_read.
+	 */
 	return 0;
 }
 
@@ -1087,6 +1084,8 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 					last_ofs_in_node = dn.ofs_in_node;
 				}
 			} else {
+				WARN_ON(flag != F2FS_GET_BLOCK_PRE_DIO &&
+					flag != F2FS_GET_BLOCK_DIO);
 				err = __allocate_data_block(&dn,
 							map->m_seg_type);
 				if (!err)
@@ -1266,7 +1265,7 @@ static int get_data_block_dio(struct inode *inode, sector_t iblock,
 			struct buffer_head *bh_result, int create)
 {
 	return __get_data_block(inode, iblock, bh_result, create,
-						F2FS_GET_BLOCK_DEFAULT, NULL,
+						F2FS_GET_BLOCK_DIO, NULL,
 						f2fs_rw_hint_to_seg_type(
 							inode->i_write_hint));
 }
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index fb216488d67a9..6beda9147d3a0 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -600,6 +600,7 @@ enum {
 	F2FS_GET_BLOCK_DEFAULT,
 	F2FS_GET_BLOCK_FIEMAP,
 	F2FS_GET_BLOCK_BMAP,
+	F2FS_GET_BLOCK_DIO,
 	F2FS_GET_BLOCK_PRE_DIO,
 	F2FS_GET_BLOCK_PRE_AIO,
 	F2FS_GET_BLOCK_PRECACHE,
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
