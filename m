Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 063CA1A0AA8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Apr 2020 12:01:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jLl2x-0001NJ-O3; Tue, 07 Apr 2020 10:01:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jLl2v-0001N7-UD
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Apr 2020 10:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8BDkSKXGC9fL/gTjOWZuJs6nNfJ50xBbNxWEWGXFvbs=; b=OTNXUK4bQcvx1gyxmGQylyRZGV
 9XVfKbHL/KtPtLxJT0Wgw3zkh8MSDhIA0cRLCBMD4k1qaTRZYr6pXJS8Ri8uaji8z48y77OjAxSOV
 51BygEw0L2wzg6tPnx5xRHpTa+rw3MyVVn5OhSaf2rGTpaurj5VbJ/eyjkIDptpuMebo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8BDkSKXGC9fL/gTjOWZuJs6nNfJ50xBbNxWEWGXFvbs=; b=b
 AEKGMRSd4O28x8g3v4GRLOSB9wki6aedqrWIwEf5RoyADx2f/otd/Chc8qjWrAmQ+0hI6b4jgz0tA
 aypTMa0MhpwhiMlmmtQIE0mZaCoFr4EzSIL05uSn2IzdjcxLLa86hng39no13mbdNJQ91rungoDXO
 xkiCIYerTOG99JPA=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jLl2t-006KS0-HL
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Apr 2020 10:01:29 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 80C676C8AB323EB90CCE;
 Tue,  7 Apr 2020 18:01:20 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Tue, 7 Apr 2020 18:01:11 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Tue, 7 Apr 2020 18:01:06 +0800
Message-ID: <20200407100107.4356-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
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
X-Headers-End: 1jLl2t-006KS0-HL
Subject: [f2fs-dev] [PATCH 1/2] fsck.f2fs: fix to check validation of block
 address
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
Cc: kilobyte@angband.pl, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Otherwise, if block address is invalid, we may access invalid
memory address in is_sit_bitmap_set().

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/dump.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index 8481a58..144c10e 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -486,10 +486,15 @@ void dump_node(struct f2fs_sb_info *sbi, nid_t nid, int force)
 	DBG(1, "nat_entry.version     [0x%x]\n", ni.version);
 	DBG(1, "nat_entry.ino         [0x%x]\n", ni.ino);
 
+	if (!IS_VALID_BLK_ADDR(sbi, ni.blk_addr)) {
+		MSG(force, "Invalid node blkaddr: %u\n\n", ni.blk_addr);
+		goto out;
+	}
+
 	if (ni.blk_addr == 0x0)
 		MSG(force, "Invalid nat entry\n\n");
 	else if (!is_sit_bitmap_set(sbi, ni.blk_addr))
-		MSG(force, "Invalid node blk addr\n\n");
+		MSG(force, "Invalid sit bitmap, %u\n\n", ni.blk_addr);
 
 	DBG(1, "node_blk.footer.ino [0x%x]\n", le32_to_cpu(node_blk->footer.ino));
 	DBG(1, "node_blk.footer.nid [0x%x]\n", le32_to_cpu(node_blk->footer.nid));
@@ -504,7 +509,7 @@ void dump_node(struct f2fs_sb_info *sbi, nid_t nid, int force)
 		print_node_info(sbi, node_blk, force);
 		MSG(force, "Invalid (i)node block\n\n");
 	}
-
+out:
 	free(node_blk);
 }
 
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
