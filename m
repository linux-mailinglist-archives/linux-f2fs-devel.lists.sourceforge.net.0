Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 388532071C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 May 2019 14:41:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hRFhM-0002uW-BG; Thu, 16 May 2019 12:41:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hRFhG-0002uF-KP
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 May 2019 12:41:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tREmCAzFqhlC4cabldOsHWbghEEvkCrHgRRODDvA26o=; b=BaSIgvqALSRrKEdepgE4KoN0z/
 GVuE1lrhEIOzbuJR5UPQs2TcZbdnr2OKozIdcg9yOcTNXVh4pq6C4FQ3QUie9piRvLVUsXKG8uRMn
 WwfCBAnrpyga9S9znwro0PzvIPXrPOaUhh6KKF5yBAM9/E8rgaGeNzo5Ai/r4JBoLsTI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tREmCAzFqhlC4cabldOsHWbghEEvkCrHgRRODDvA26o=; b=I
 5d1AZB3GxxR7T0kHQ2CMTF22NX0pulpmhMRat39mEbDObDku3atLQjjw9RLT/CTGyk4etJjY4EoDD
 HFak+RMyQHK55i4PUPJ9dgvKIAAfuD/Gy8atlpIyeWJ5B0/6koWeu1WTqzQq+amTZo9ayE40JJUao
 eWWpqkuS7YDrQa5Q=;
Received: from szxga03-in.huawei.com ([45.249.212.189] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hRFhC-006BlX-Ut
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 May 2019 12:41:18 +0000
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.53])
 by Forcepoint Email with ESMTP id 368EA38C362AAFA423F2;
 Thu, 16 May 2019 20:41:05 +0800 (CST)
Received: from dggeme763-chm.china.huawei.com (10.3.19.109) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 16 May 2019 20:41:04 +0800
Received: from szvp000201624.huawei.com (10.120.216.130) by
 dggeme763-chm.china.huawei.com (10.3.19.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 16 May 2019 20:41:04 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Thu, 16 May 2019 20:40:42 +0800
Message-ID: <20190516124043.90103-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-ClientProxiedBy: dggeme757-chm.china.huawei.com (10.3.19.103) To
 dggeme763-chm.china.huawei.com (10.3.19.109)
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
X-Headers-End: 1hRFhC-006BlX-Ut
Subject: [f2fs-dev] [PATCH 1/2] fsck.f2fs: introduce check_curseg_offsets()
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
Cc: jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let check_curseg_offset() just check one curseg, and introduce
check_curseg_offsets() to check all cursegs, no logic changes.

In addition, update message printed a bit.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/fsck.c | 58 ++++++++++++++++++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 23 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index b5daeb4..b10b201 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2129,33 +2129,45 @@ static void fix_checkpoint(struct f2fs_sb_info *sbi)
 		write_nat_bits(sbi, sb, cp, sbi->cur_cp);
 }
 
-int check_curseg_offset(struct f2fs_sb_info *sbi)
+int check_curseg_offset(struct f2fs_sb_info *sbi, int type)
 {
-	int i;
+	struct curseg_info *curseg = CURSEG_I(sbi, type);
+	struct seg_entry *se;
+	int j, nblocks;
 
-	for (i = 0; i < NO_CHECK_TYPE; i++) {
-		struct curseg_info *curseg = CURSEG_I(sbi, i);
-		struct seg_entry *se;
-		int j, nblocks;
+	if ((curseg->next_blkoff >> 3) >= SIT_VBLOCK_MAP_SIZE) {
+		ASSERT_MSG("Next block offset:%u is invalid, type:%d",
+			curseg->next_blkoff, type);
+		return -EINVAL;
+	}
+	se = get_seg_entry(sbi, curseg->segno);
+	if (f2fs_test_bit(curseg->next_blkoff,
+				(const char *)se->cur_valid_map)) {
+		ASSERT_MSG("Next block offset is not free, type:%d", type);
+		return -EINVAL;
+	}
+	if (curseg->alloc_type == SSR)
+		return 0;
 
-		if ((curseg->next_blkoff >> 3) >= SIT_VBLOCK_MAP_SIZE)
-			return -EINVAL;
-		se = get_seg_entry(sbi, curseg->segno);
-		if (f2fs_test_bit(curseg->next_blkoff,
-					(const char *)se->cur_valid_map)) {
-			ASSERT_MSG("Next block offset is not free, type:%d", i);
+	nblocks = sbi->blocks_per_seg;
+	for (j = curseg->next_blkoff + 1; j < nblocks; j++) {
+		if (f2fs_test_bit(j, (const char *)se->cur_valid_map)) {
+			ASSERT_MSG("For LFS curseg, space after .next_blkoff "
+				"should be unused, type:%d", type);
 			return -EINVAL;
 		}
-		if (curseg->alloc_type == SSR)
-			continue;
+	}
+	return 0;
+}
 
-		nblocks = sbi->blocks_per_seg;
-		for (j = curseg->next_blkoff + 1; j < nblocks; j++) {
-			if (f2fs_test_bit(j, (const char *)se->cur_valid_map)) {
-				ASSERT_MSG("LFS must have free section:%d", i);
-				return -EINVAL;
-			}
-		}
+int check_curseg_offsets(struct f2fs_sb_info *sbi)
+{
+	int i, ret;
+
+	for (i = 0; i < NO_CHECK_TYPE; i++) {
+		ret = check_curseg_offset(sbi, i);
+		if (ret)
+			return ret;
 	}
 	return 0;
 }
@@ -2703,7 +2715,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 	}
 
 	printf("[FSCK] next block offset is free                     ");
-	if (check_curseg_offset(sbi) == 0) {
+	if (check_curseg_offsets(sbi) == 0) {
 		printf(" [Ok..]\n");
 	} else {
 		printf(" [Fail]\n");
@@ -2748,7 +2760,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 			fix_hard_links(sbi);
 			fix_nat_entries(sbi);
 			rewrite_sit_area_bitmap(sbi);
-			if (check_curseg_offset(sbi)) {
+			if (check_curseg_offsets(sbi)) {
 				move_curseg_info(sbi, SM_I(sbi)->main_blkaddr, 0);
 				write_curseg_info(sbi);
 				flush_curseg_sit_entries(sbi);
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
