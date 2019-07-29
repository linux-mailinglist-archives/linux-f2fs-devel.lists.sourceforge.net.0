Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BF578E9D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2019 17:03:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hs7BK-0003C1-6S; Mon, 29 Jul 2019 15:03:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hs7BI-0003Bc-FW
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 15:03:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jtFIr1RIGX2b6dlykb3oU4OxoiiCBNM6AQTdy7Grdbg=; b=LeFybXCRu2SDTKluomFzs5XWTz
 BtXdZNX+QeEE0WxGcx4oOVzYqDP+zh52o1R/K5mhWURo//8nZYCiF2+CJsUXaj81/63gu/OENQlic
 djPqCANJVQ7z2c1n6rHv0lXrYlVPRZWP6pfe0ZToryfhhG6f9gXPOViYS65rO9Wj3r0Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jtFIr1RIGX2b6dlykb3oU4OxoiiCBNM6AQTdy7Grdbg=; b=f
 PeZo4wpMZ/tKn1Wa+EmKNKUr9tpXLAdT86ufnFhrTBOUUy1MOwVBFhBnlLuvSxbT6TPNEkEtYno0n
 uikTDn8tvt3fkm69TkRk8A/4kgKlj0z0TBFYRCTW9z5mIe46G/IamoGB49+bJ/K0C5TTqwspCYh3l
 PQXXjtCpuirAng1s=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hs7BH-0038g4-6u
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 15:03:20 +0000
Received: from localhost.localdomain (unknown [180.111.32.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D379216C8;
 Mon, 29 Jul 2019 15:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564412591;
 bh=UjF/AwvKhVxU6D/HTh8Hq1nLgczmyOG6CMrKwunrSbc=;
 h=From:To:Cc:Subject:Date:From;
 b=Yy1NJQiT9GgkQ0qR1k5P1ZVp85SrdeWvmz8xBGwi+4V8vyxUb96PRkJahlMm2sGx0
 3j6PSU6phRDYOF76GM80X1+lAKWcwc6xbio1PfOJvJFNcLRHS9HRFE9zBk9BeMeaKP
 SIkf7DP4jjkYcn5jiJqRP+hbvhegrn7m67o+vlJE=
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 29 Jul 2019 23:02:29 +0800
Message-Id: <20190729150229.12121-1-chao@kernel.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
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
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hs7BH-0038g4-6u
Subject: [f2fs-dev] [PATCH RESEND] f2fs: fix to migrate blocks correctly
 during defragment
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

From: Chao Yu <yuchao0@huawei.com>

During defragment, we missed to trigger fragmented blocks migration
for below condition:

In defragment region:
- total number of valid blocks is smaller than 512;
- the tail part of the region are all holes;

In addtion, return zero to user via range->len if there is no
fragmented blocks.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/file.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ff93066ed515..ff2ffa850a6f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2384,8 +2384,10 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 		map.m_lblk += map.m_len;
 	}
 
-	if (!fragmented)
+	if (!fragmented) {
+		total = 0;
 		goto out;
+	}
 
 	sec_num = DIV_ROUND_UP(total, BLKS_PER_SEC(sbi));
 
@@ -2415,7 +2417,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 
 		if (!(map.m_flags & F2FS_MAP_FLAGS)) {
 			map.m_lblk = next_pgofs;
-			continue;
+			goto check;
 		}
 
 		set_inode_flag(inode, FI_DO_DEFRAG);
@@ -2439,8 +2441,8 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 		}
 
 		map.m_lblk = idx;
-
-		if (idx < pg_end && cnt < blk_per_seg)
+check:
+		if (map.m_lblk < pg_end && cnt < blk_per_seg)
 			goto do_map;
 
 		clear_inode_flag(inode, FI_DO_DEFRAG);
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
