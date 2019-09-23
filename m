Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D61BACFA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Sep 2019 06:01:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iCFXX-00023b-FS; Mon, 23 Sep 2019 04:01:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sunqiuyang@huawei.com>) id 1iCFXV-00023T-B2
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Sep 2019 04:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vet1MMFjcEffVbNH1qzdiAm57gcibz6pa64sLFGOtLY=; b=mJIQOQh+jet6sOR+CeqCKR4Kyy
 ESkh3tIPp+mgFPt2fuM/vUwm0CvI/x67glPTjW84DZoKNCHoKX/r70/HydU10v5g1FqClFzPNWJqs
 nkdLt3eje3cpkPGoEmqS2SxRwWnMHjEgl+YsN84eK6NTHQto8uHt5Jgu0+xqrR+jC4vw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Vet1MMFjcEffVbNH1qzdiAm57gcibz6pa64sLFGOtLY=; b=H
 brftw4MvAIV+VydVTUXV5EaQOUx0gWxH5IpcrqMIOHZzyQkshy+2vfRT/linNfmVqymhk8n3ULmQz
 wbsZQnXx3t/M9WL23npP1djuC3Dfp2ZVpASjjUzWyDczfQ4Cfx/G1wasDXTd8r+aV4i5G3KIL4bfR
 4xVXvDIXnFZ3CMJg=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iCFXT-003XM8-4L
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Sep 2019 04:01:29 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 609AE3DBB045AC9296C6;
 Mon, 23 Sep 2019 12:01:19 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Mon, 23 Sep 2019
 12:01:12 +0800
From: sunqiuyang <sunqiuyang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <jaegeuk@kernel.org>,
 <yuchao0@huawei.com>
Date: Mon, 23 Sep 2019 12:21:39 +0800
Message-ID: <20190923042139.36470-1-sunqiuyang@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iCFXT-003XM8-4L
Subject: [f2fs-dev] [PATCH v2 1/1] f2fs: update multi-dev metadata in
 resize_fs
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
Cc: sunqiuyang@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Qiuyang Sun <sunqiuyang@huawei.com>

Multi-device metadata should be updated in resize_fs as well.

Also, we check that the new FS size still reaches the last device.

--
Changelog v1 => v2:
Use f2fs_is_multi_device() and some minor cleanup.

Signed-off-by: Qiuyang Sun <sunqiuyang@huawei.com>
---
 fs/f2fs/gc.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 5877bd7..ef7686a 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1437,11 +1437,20 @@ static void update_sb_metadata(struct f2fs_sb_info *sbi, int secs)
 	raw_sb->segment_count_main = cpu_to_le32(segment_count_main + segs);
 	raw_sb->block_count = cpu_to_le64(block_count +
 					(long long)segs * sbi->blocks_per_seg);
+	if (f2fs_is_multi_device(sbi)) {
+		int last_dev = sbi->s_ndevs - 1;
+		int dev_segs =
+			le32_to_cpu(raw_sb->devs[last_dev].total_segments);
+
+		raw_sb->devs[last_dev].total_segments =
+						cpu_to_le32(dev_segs + segs);
+	}
 }
 
 static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
 {
 	int segs = secs * sbi->segs_per_sec;
+	long long blks = (long long)segs * sbi->blocks_per_seg;
 	long long user_block_count =
 				le64_to_cpu(F2FS_CKPT(sbi)->user_block_count);
 
@@ -1449,8 +1458,20 @@ static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
 	MAIN_SEGS(sbi) = (int)MAIN_SEGS(sbi) + segs;
 	FREE_I(sbi)->free_sections = (int)FREE_I(sbi)->free_sections + secs;
 	FREE_I(sbi)->free_segments = (int)FREE_I(sbi)->free_segments + segs;
-	F2FS_CKPT(sbi)->user_block_count = cpu_to_le64(user_block_count +
-					(long long)segs * sbi->blocks_per_seg);
+	F2FS_CKPT(sbi)->user_block_count = cpu_to_le64(user_block_count + blks);
+
+	if (f2fs_is_multi_device(sbi)) {
+		int last_dev = sbi->s_ndevs - 1;
+
+		FDEV(last_dev).total_segments =
+				(int)FDEV(last_dev).total_segments + segs;
+		FDEV(last_dev).end_blk =
+				(long long)FDEV(last_dev).end_blk + blks;
+#ifdef CONFIG_BLK_DEV_ZONED
+		FDEV(last_dev).nr_blkz = (int)FDEV(last_dev).nr_blkz +
+					(int)(blks >> sbi->log_blocks_per_blkz);
+#endif
+	}
 }
 
 int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
@@ -1465,6 +1486,15 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
 	if (block_count > old_block_count)
 		return -EINVAL;
 
+	if (f2fs_is_multi_device(sbi)) {
+		int last_dev = sbi->s_ndevs - 1;
+		__u64 last_segs = FDEV(last_dev).total_segments;
+
+		if (block_count + last_segs * sbi->blocks_per_seg <=
+								old_block_count)
+			return -EINVAL;
+	}
+
 	/* new fs size should align to section size */
 	div_u64_rem(block_count, BLKS_PER_SEC(sbi), &rem);
 	if (rem)
-- 
1.8.3.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
