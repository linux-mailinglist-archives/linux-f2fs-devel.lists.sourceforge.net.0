Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B4723BAF1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Aug 2020 15:15:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k2wnI-0004wd-Tn; Tue, 04 Aug 2020 13:15:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1k2wnH-0004wF-7y
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Aug 2020 13:15:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wHBxzkHmPzHBIHl5m53JO+okDY667WZR+kYW1Pjux/M=; b=SF5ay6c6W30Jxcj8BOM4xGRawj
 r12mfnUblxtYh+cYuyOjh7zMEDNPeRvEiCEbYJwMC6y8J6pCgbAU0CH+GsdkRd5sIelRQS0qx6Gno
 qmPQDkTyXA9kWiO/ap8NfXNUaovukal5fdIpKh8LIqFVckt619NHzgh95P8QG7/G7NDQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wHBxzkHmPzHBIHl5m53JO+okDY667WZR+kYW1Pjux/M=; b=TH45ZTNYTKsOxF5jaYgkyESI4Z
 vlLD/hfe/9gsd8krGVwkPQIVEilSeiviL/eCgnflKxVg5ZBIME+NN+aCGHlQ+AILn90TR3ADIS5OS
 cmnxfN360ozNrJYRsmb0QflZ6n182nMwGz2fvaAX9WpEz62g8LnPAwXzgq+Ov3Z6xQ7s=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k2wnE-00304D-6D
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Aug 2020 13:15:51 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 80AADA6D6BD6D2413D0F;
 Tue,  4 Aug 2020 21:15:28 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Tue, 4 Aug 2020 21:15:17 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 4 Aug 2020 21:14:46 +0800
Message-ID: <20200804131449.50517-3-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200804131449.50517-1-yuchao0@huawei.com>
References: <20200804131449.50517-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.8 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k2wnE-00304D-6D
Subject: [f2fs-dev] [PATCH v2 2/5] f2fs: record average update time of
 segment
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

Previously, once we update one block in segment, we will update mtime of
segment to last time, making aged segment becoming freshest, result in
that GC with cost benefit algorithm missing such segment, So this patch
changes to record mtime as average block updating time instead of last
updating time.

It's not needed to reset mtime for prefree segment, as se->valid_blocks
is zero, then old se->mtime won't take any weight with below calculation:

	se->mtime = div_u64(se->mtime * se->valid_blocks + mtime,
					se->valid_blocks + 1);

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/segment.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c9755a0cd304..3b9479cba1ef 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2150,6 +2150,22 @@ static void __set_sit_entry_type(struct f2fs_sb_info *sbi, int type,
 		__mark_sit_entry_dirty(sbi, segno);
 }
 
+static void update_segment_mtime(struct f2fs_sb_info *sbi, block_t blkaddr)
+{
+	unsigned int segno = GET_SEGNO(sbi, blkaddr);
+	struct seg_entry *se = get_seg_entry(sbi, segno);
+	unsigned long long mtime = get_mtime(sbi, false);
+
+	if (!se->mtime)
+		se->mtime = mtime;
+	else
+		se->mtime = div_u64(se->mtime * se->valid_blocks + mtime,
+						se->valid_blocks + 1);
+
+	if (mtime > SIT_I(sbi)->max_mtime)
+		SIT_I(sbi)->max_mtime = mtime;
+}
+
 static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 {
 	struct seg_entry *se;
@@ -2169,10 +2185,9 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 	f2fs_bug_on(sbi, (new_vblocks < 0 ||
 				(new_vblocks > sbi->blocks_per_seg)));
 
+	update_segment_mtime(sbi, blkaddr);
+
 	se->valid_blocks = new_vblocks;
-	se->mtime = get_mtime(sbi, false);
-	if (se->mtime > SIT_I(sbi)->max_mtime)
-		SIT_I(sbi)->max_mtime = se->mtime;
 
 	/* Update valid block bitmap */
 	if (del > 0) {
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
