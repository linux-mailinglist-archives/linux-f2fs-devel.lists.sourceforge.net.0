Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A888F877D7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Aug 2019 12:53:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hw2Wb-0007Q3-E0; Fri, 09 Aug 2019 10:53:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hw2WZ-0007PS-U2
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 10:53:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GZZHgpz6VRQA2rDuTM1kd+p2Dsil5oyKlZu93eOKkxw=; b=FAizNfovtXEnA3gxR5h8IF7SvW
 R4CDJD+lAI3x6JtQoyB4UshO3WS8GErzMR9xVejb5XzsaDVGE5vJWaF9K+atd67kPhyJMbuvTktT2
 ehp2iUBp7mpOPqzzKz4kw6WTELYeT6pXH5UGd8CegiPs8Q6vhIMv7hpcbnGiOX3L9PoM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GZZHgpz6VRQA2rDuTM1kd+p2Dsil5oyKlZu93eOKkxw=; b=PQ+6jAHrLnHfx8QpdULdiyRJtU
 6Z43EqASVvN0EEbZtpLKbS2gff0CFl9AKNYhnr5oAo8KyYI+D0tZNPf0btc30AG+Q5LeFKEwN6Iqs
 USTMRkbhmDGQtWspyg8oWvJjutZTUBHUaEJdeTNoVhV0r1Q2u2FcmGls+2qJrUBGmXgk=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hw2WY-00GHD1-NN
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 10:53:31 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id D40C775AB627D9731918;
 Fri,  9 Aug 2019 18:53:23 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Fri, 9 Aug 2019 18:53:13 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 9 Aug 2019 18:52:58 +0800
Message-ID: <20190809105302.79876-6-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20190809105302.79876-1-yuchao0@huawei.com>
References: <20190809105302.79876-1-yuchao0@huawei.com>
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
X-Headers-End: 1hw2WY-00GHD1-NN
Subject: [f2fs-dev] [PATCH 06/10] dump.f2fs: introduce start_bidx_of_node()
 for cleanup
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

Just cleanup, no logic change, besides, it can be reused by latter
patch.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/dump.c | 39 +++++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index 390361d..a6a1635 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -527,11 +527,31 @@ static void dump_node_from_blkaddr(struct f2fs_sb_info *sbi, u32 blk_addr)
 	free(node_blk);
 }
 
+unsigned int start_bidx_of_node(unsigned int node_ofs,
+					struct f2fs_node *node_blk)
+{
+	unsigned int indirect_blks = 2 * NIDS_PER_BLOCK + 4;
+	unsigned int bidx;
+
+	if (node_ofs == 0)
+		return 0;
+
+	if (node_ofs <= 2) {
+		bidx = node_ofs - 1;
+	} else if (node_ofs <= indirect_blks) {
+		int dec = (node_ofs - 4) / (NIDS_PER_BLOCK + 1);
+		bidx = node_ofs - 2 - dec;
+	} else {
+		int dec = (node_ofs - indirect_blks - 3) / (NIDS_PER_BLOCK + 1);
+		bidx = node_ofs - 5 - dec;
+	}
+	return bidx * ADDRS_PER_BLOCK + ADDRS_PER_INODE(&node_blk->i);
+}
+
 static void dump_data_offset(u32 blk_addr, int ofs_in_node)
 {
 	struct f2fs_node *node_blk;
-	unsigned int indirect_blks = 2 * NIDS_PER_BLOCK + 4;
-	unsigned int bidx = 0;
+	unsigned int bidx;
 	unsigned int node_ofs;
 	int ret;
 
@@ -543,20 +563,7 @@ static void dump_data_offset(u32 blk_addr, int ofs_in_node)
 
 	node_ofs = ofs_of_node(node_blk);
 
-	if (node_ofs == 0)
-		goto got_it;
-
-	if (node_ofs > 0 && node_ofs <= 2) {
-		bidx = node_ofs - 1;
-	} else if (node_ofs <= indirect_blks) {
-		int dec = (node_ofs - 4) / (NIDS_PER_BLOCK + 1);
-		bidx = node_ofs - 2 - dec;
-	} else {
-		int dec = (node_ofs - indirect_blks - 3) / (NIDS_PER_BLOCK + 1);
-		bidx = node_ofs - 5 - dec;
-	}
-	bidx = bidx * ADDRS_PER_BLOCK + ADDRS_PER_INODE(&node_blk->i);
-got_it:
+	bidx = start_bidx_of_node(node_ofs, node_blk);
 	bidx +=  ofs_in_node;
 
 	setlocale(LC_ALL, "");
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
