Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 502A4B6346
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Sep 2019 14:32:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iAZ7y-00040V-Tw; Wed, 18 Sep 2019 12:32:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sunqiuyang@huawei.com>) id 1iAZ7x-00040H-J8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Sep 2019 12:32:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cSI9PXRC7QG1TYi0slV05KHZ76Nf5wQZJ5HHA5lhb7E=; b=GkdSk8xIrGmTQPukp+snNimVbq
 0EaFJnzxVCmuk6KVPA/OD61GVW6R4IJGp49a+67UbHBcYmY3jRBaOhNjfgX9oRZgkH89ZQveC9ssZ
 E7Kx5pZ19aQM3g0U8t7z3Cb4E9BtOIQ6A6EVV4k6opU1uV+fklZg1rtWomtCPnR6C+Rw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cSI9PXRC7QG1TYi0slV05KHZ76Nf5wQZJ5HHA5lhb7E=; b=Y
 ed5ybgMyOQGWOaDYpyGTyYNJpNWhgwxCldwt8jD93Q/abuXN+19/S3VbL0oTToZqUAgAohX/pzBUX
 BQ+zPf9YVKk3NNVYdXLOZ64OeI9YBjSycA2RRDx85cVGu/sXRiGg3RIS6gSXyQdzC8goVErUTIYMB
 9POxkICffH0Fndlc=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1iAZ7u-002Owh-1Y
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Sep 2019 12:32:09 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9643E23F11B82F483979;
 Wed, 18 Sep 2019 20:31:56 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Wed, 18 Sep 2019
 20:31:47 +0800
From: sunqiuyang <sunqiuyang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <jaegeuk@kernel.org>,
 <yuchao0@huawei.com>
Date: Wed, 18 Sep 2019 20:51:58 +0800
Message-ID: <20190918125158.12126-1-sunqiuyang@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
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
X-Headers-End: 1iAZ7u-002Owh-1Y
Subject: [f2fs-dev] [PATCH 1/1] f2fs: update multi-dev metadata in resize_fs
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

Signed-off-by: Qiuyang Sun <sunqiuyang@huawei.com>
---
 fs/f2fs/gc.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 5877bd7..a2b8cbe 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1431,26 +1431,46 @@ static void update_sb_metadata(struct f2fs_sb_info *sbi, int secs)
 	int segment_count_main = le32_to_cpu(raw_sb->segment_count_main);
 	long long block_count = le64_to_cpu(raw_sb->block_count);
 	int segs = secs * sbi->segs_per_sec;
+	int ndevs = sbi->s_ndevs;
 
 	raw_sb->section_count = cpu_to_le32(section_count + secs);
 	raw_sb->segment_count = cpu_to_le32(segment_count + segs);
 	raw_sb->segment_count_main = cpu_to_le32(segment_count_main + segs);
 	raw_sb->block_count = cpu_to_le64(block_count +
 					(long long)segs * sbi->blocks_per_seg);
+	if (ndevs > 1) {
+		int dev_segs =
+			le32_to_cpu(raw_sb->devs[ndevs - 1].total_segments);
+
+		raw_sb->devs[ndevs - 1].total_segments =
+						cpu_to_le32(dev_segs + segs);
+	}
 }
 
 static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
 {
 	int segs = secs * sbi->segs_per_sec;
+	long long blks = (long long)segs * sbi->blocks_per_seg;
 	long long user_block_count =
 				le64_to_cpu(F2FS_CKPT(sbi)->user_block_count);
+	int ndevs = sbi->s_ndevs;
 
 	SM_I(sbi)->segment_count = (int)SM_I(sbi)->segment_count + segs;
 	MAIN_SEGS(sbi) = (int)MAIN_SEGS(sbi) + segs;
 	FREE_I(sbi)->free_sections = (int)FREE_I(sbi)->free_sections + secs;
 	FREE_I(sbi)->free_segments = (int)FREE_I(sbi)->free_segments + segs;
-	F2FS_CKPT(sbi)->user_block_count = cpu_to_le64(user_block_count +
-					(long long)segs * sbi->blocks_per_seg);
+	F2FS_CKPT(sbi)->user_block_count = cpu_to_le64(user_block_count + blks);
+
+	if (ndevs > 1) {
+		FDEV(ndevs - 1).total_segments =
+				(int)FDEV(ndevs - 1).total_segments + segs;
+		FDEV(ndevs - 1).end_blk =
+				(long long)FDEV(ndevs - 1).end_blk + blks;
+#ifdef CONFIG_BLK_DEV_ZONED
+		FDEV(ndevs - 1).nr_blkz = (int)FDEV(ndevs - 1).nr_blkz +
+					(int)(blks >> sbi->log_blocks_per_blkz);
+#endif
+	}
 }
 
 int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
@@ -1465,6 +1485,14 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
 	if (block_count > old_block_count)
 		return -EINVAL;
 
+	if (sbi->s_ndevs > 1) {
+		__u64 last_segs = FDEV(sbi->s_ndevs - 1).total_segments;
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
