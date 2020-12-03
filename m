Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3B12CE033
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 21:55:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkvdq-0000Mi-CS; Thu, 03 Dec 2020 20:55:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kkvdn-0000Ma-H2
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 20:55:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6nEPHg8bIlPARy2qYNOOErM+y84LDqr81I7urzbkpko=; b=NrJgEuzciUMfafgINmIP9CSeNy
 xLYQbOm0Y9J0vYWJNnS3cLCIGUEhOtJ+ag0vixK31bppC/7+pQWjJqqy2A+FojbkKz9DT2lroFccE
 84u4I5dnu+xyrVSfVzPdIQqvaY0gSuLdrToaqFOwwdKlSkOAufBrsg7sGQB2IzgHblI8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6nEPHg8bIlPARy2qYNOOErM+y84LDqr81I7urzbkpko=; b=kQ1b8lJlNvrOOUG9UJxc3jtF+i
 46EDz0vzMG6dHl0SVYmU6dmpoW+RqFqHJVvc0ApSZDmrUlns5SzrSE7uSQE9iJct6rhzuKaOXJMn9
 GyQ+DFaXEtlvwJEaNoEg6S5CO7f6ODSZs5Vomg4rneoVgTF1Dz/bEfF8BFJDoN8SeGFQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkvdf-000iz0-1l
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 20:55:51 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu,  3 Dec 2020 12:55:22 -0800
Message-Id: <20201203205522.891082-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
In-Reply-To: <20201203205522.891082-1-jaegeuk@kernel.org>
References: <20201203205522.891082-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kkvdf-000iz0-1l
Subject: [f2fs-dev] [PATCH 2/2] f2fs: introduce max_io_bytes, a sysfs entry,
 to limit bio size
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch adds max_io_bytes to limit bio size when f2fs tries to merge
consecutive IOs. This can give a testing point to split out bios and check
end_io handles those bios correctly. This is used to capture a recent bug
on the decompression and fsverity flow.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 7 +++++++
 fs/f2fs/data.c                          | 3 +++
 fs/f2fs/f2fs.h                          | 1 +
 fs/f2fs/sysfs.c                         | 2 ++
 4 files changed, 13 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 67b3ed8e8c2f..3dfee94e0618 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -370,3 +370,10 @@ Date:		April 2020
 Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	Give a way to change iostat_period time. 3secs by default.
 		The new iostat trace gives stats gap given the period.
+What:		/sys/fs/f2fs/<disk>/max_io_bytes
+Date:		December 2020
+Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
+Description:	This gives a control to limit the bio size in f2fs.
+		Default is zero, which will follow underlying block layer limit,
+		whereas, if it has a certain bytes value, f2fs won't submit a
+		bio larger than that size.
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index e85fd8f77f3f..cb28089e1eff 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -736,6 +736,9 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 static bool page_is_mergeable(struct f2fs_sb_info *sbi, struct bio *bio,
 				block_t last_blkaddr, block_t cur_blkaddr)
 {
+	if (unlikely(sbi->max_io_bytes &&
+			bio->bi_iter.bi_size >= sbi->max_io_bytes))
+		return false;
 	if (last_blkaddr + 1 != cur_blkaddr)
 		return false;
 	return __same_bdev(sbi, cur_blkaddr, bio);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 36090cd09011..594df6391390 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1446,6 +1446,7 @@ struct f2fs_sb_info {
 	loff_t max_file_blocks;			/* max block index of file */
 	int dir_level;				/* directory level */
 	int readdir_ra;				/* readahead inode in readdir */
+	u64 max_io_bytes;			/* max io bytes to merge IOs */
 
 	block_t user_block_count;		/* # of user blocks */
 	block_t total_valid_block_count;	/* # of valid blocks */
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index fce2997382af..989a649cfa8b 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -567,6 +567,7 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info,
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, iostat_enable, iostat_enable);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, iostat_period_ms, iostat_period_ms);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, readdir_ra, readdir_ra);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_io_bytes, max_io_bytes);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_pin_file_thresh, gc_pin_file_threshold);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_super_block, extension_list, extension_list);
 #ifdef CONFIG_F2FS_FAULT_INJECTION
@@ -651,6 +652,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(iostat_enable),
 	ATTR_LIST(iostat_period_ms),
 	ATTR_LIST(readdir_ra),
+	ATTR_LIST(max_io_bytes),
 	ATTR_LIST(gc_pin_file_thresh),
 	ATTR_LIST(extension_list),
 #ifdef CONFIG_F2FS_FAULT_INJECTION
-- 
2.29.2.576.ga3fc446d84-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
