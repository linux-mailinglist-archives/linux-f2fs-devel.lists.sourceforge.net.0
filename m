Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B975186382
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Mar 2020 04:05:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jDg4L-0004ht-FX; Mon, 16 Mar 2020 03:05:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jDg4J-0004hZ-9m
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Mar 2020 03:05:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QOO6QRFk8k6t0jJR9xcpseubvGZKpJOAp7cvnV1EYko=; b=ReSgx058ZiExFlGDoBDeiRCM80
 2V/o+2a3/+P+8Rcz21YJQ6RYzIXqj9nAUTmS5EZIUgpYU06vbNiWTwCuYDG2Jawg5MPSZCvzfSkSY
 n4OjOVmPA+bAs3+gBwrTvYM8I6AT/2k110H/0tHPgD4s4jA53pFFJ1uDm3L/TmvvUs9Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QOO6QRFk8k6t0jJR9xcpseubvGZKpJOAp7cvnV1EYko=; b=V
 gtmRblPtzptodBsZQ4zPo81OnA/r9ShQ3aIOSi1TDVeCDevTVLON5fT1pXJu0eqONGXGyJ6l1Y800
 mU4x3Yn+MiFW0eWrAsQHADMqo9BMygZRPnXe+pB34w3X+WZewxDuzfzE+LL3Ps6hRrVJR4VZmmwAZ
 KPr+jUAlssMK9Ewk=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jDg4G-00C9xL-7F
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Mar 2020 03:05:31 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 518DDD8AC34E9030E7AF;
 Mon, 16 Mar 2020 11:05:19 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Mon, 16 Mar 2020 11:05:11 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 16 Mar 2020 11:05:04 +0800
Message-ID: <20200316030504.41505-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jDg4G-00C9xL-7F
Subject: [f2fs-dev] [PATCH] dump.f2fs: fix to print all blkaddr in .i_addr
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

There are totally ADDRS_PER_INODE() blkaddrs in .i_addr, fix to
print all of them.

In addition, use get_extra_isize() rather than __get_extra_isize()

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/mount.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index e3e699f..3bd2886 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -171,7 +171,7 @@ void print_inode_info(struct f2fs_sb_info *sbi,
 	unsigned int i = 0;
 	u32 namelen = le32_to_cpu(inode->i_namelen);
 	int enc_name = file_enc_name(inode);
-	int ofs = __get_extra_isize(inode);
+	int ofs = get_extra_isize(node);
 
 	pretty_print_filename(inode->i_name, namelen, en, enc_name);
 	if (name && en[0]) {
@@ -236,8 +236,8 @@ void print_inode_info(struct f2fs_sb_info *sbi,
 		}
 	}
 
-	for (i = ofs; i < ADDRS_PER_INODE(inode); i++) {
-		block_t blkaddr = le32_to_cpu(inode->i_addr[i]);
+	for (i = 0; i < ADDRS_PER_INODE(inode); i++) {
+		block_t blkaddr = le32_to_cpu(inode->i_addr[i + ofs]);
 		char *flag = "";
 
 		if (blkaddr == 0x0)
@@ -246,7 +246,7 @@ void print_inode_info(struct f2fs_sb_info *sbi,
 			flag = "cluster flag";
 		else if (blkaddr == NEW_ADDR)
 			flag = "reserved flag";
-		printf("i_addr[0x%x] %-16s\t\t[0x%8x : %u]\n", i, flag,
+		printf("i_addr[0x%x] %-16s\t\t[0x%8x : %u]\n", i + ofs, flag,
 				blkaddr, blkaddr);
 	}
 
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
