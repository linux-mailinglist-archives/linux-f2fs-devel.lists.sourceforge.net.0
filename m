Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F271B58BD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Apr 2020 12:03:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jRYhg-0003UA-7v; Thu, 23 Apr 2020 10:03:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jRYhe-0003To-Qr
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Apr 2020 10:03:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PKg4zZNdJMLQ6wNmbdntTOpLaV/6PbVO2oG7yF+06Tc=; b=f+LAx9MhRDxs8bgQA0NzaclecV
 5uN8CuTFnZD/oTlK2+pjdQETX6+ThtyeCnG1X0Sa2SWPXICGUvHXacGV9H+fSxEXLDnwUNWGZvVQS
 iZ/jKnqPpsczajoTsTcYz0qqZCgb7shSyb7aP06DWt/znvBjgA1qKipdaGcr1sXOpOng=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PKg4zZNdJMLQ6wNmbdntTOpLaV/6PbVO2oG7yF+06Tc=; b=H
 j4ueRNqxh4IMOgq3s8CqFkRNaGJh0/6ErWtOZd6dcBw6rypzgWrpK2V/LkaRINu6kYxeO9q8Zf1e5
 n1puOAygkZMBbnOHKmxjEMXcwbsNzzYQzxFqPhNWXK0wrTNVB+GXSS1jBPosHaCRprx/x8V0GV3Q1
 a1Dmr6ZbugoS9Jbo=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jRYhc-00B4TT-MK
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Apr 2020 10:03:30 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 305877B68F68317747C4;
 Thu, 23 Apr 2020 18:03:21 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Thu, 23 Apr 2020 18:03:13 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 23 Apr 2020 18:03:06 +0800
Message-ID: <20200423100306.8817-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jRYhc-00B4TT-MK
Subject: [f2fs-dev] [PATCH] f2fs: add compressed/gc data read IO stat
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

in order to account data read IOs more accurately.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---

Jaegeuk, merge this patch into ("f2fs: support read iostat") will
be okay to me as well.

 fs/f2fs/data.c              |  1 +
 fs/f2fs/f2fs.h              |  2 ++
 fs/f2fs/gc.c                |  2 ++
 fs/f2fs/sysfs.c             |  7 +++++++
 include/trace/events/f2fs.h | 11 ++++++++---
 5 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 199877cb57fe..8dd48c5b6c0d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2176,6 +2176,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 
 		inc_page_count(sbi, F2FS_RD_DATA);
 		f2fs_update_iostat(sbi, FS_DATA_READ_IO, F2FS_BLKSIZE);
+		f2fs_update_iostat(sbi, FS_CDATA_READ_IO, F2FS_BLKSIZE);
 		ClearPageError(page);
 		*last_block_in_bio = blkaddr;
 	}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 3b9603266a2a..c154651335cd 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1108,6 +1108,8 @@ enum iostat_type {
 	APP_READ_IO,			/* app read IOs */
 	APP_MAPPED_READ_IO,		/* app mapped read IOs */
 	FS_DATA_READ_IO,		/* data read IOs */
+	FS_GDATA_READ_IO,		/* data read IOs from background gc */
+	FS_CDATA_READ_IO,		/* compressed data read IOs */
 	FS_NODE_READ_IO,		/* node read IOs */
 	FS_META_READ_IO,		/* meta read IOs */
 
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 28a8c79c8bdc..a4c02bf61f8a 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -739,6 +739,7 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 	f2fs_put_page(page, 1);
 
 	f2fs_update_iostat(sbi, FS_DATA_READ_IO, F2FS_BLKSIZE);
+	f2fs_update_iostat(sbi, FS_GDATA_READ_IO, F2FS_BLKSIZE);
 
 	return 0;
 put_encrypted_page:
@@ -845,6 +846,7 @@ static int move_data_block(struct inode *inode, block_t bidx,
 		}
 
 		f2fs_update_iostat(fio.sbi, FS_DATA_READ_IO, F2FS_BLKSIZE);
+		f2fs_update_iostat(fio.sbi, FS_GDATA_READ_IO, F2FS_BLKSIZE);
 
 		lock_page(mpage);
 		if (unlikely(mpage->mapping != META_MAPPING(fio.sbi) ||
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index eaf8088548f0..a117ae1f9d5f 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -803,6 +803,7 @@ static int __maybe_unused iostat_info_seq_show(struct seq_file *seq,
 	seq_printf(seq, "time:		%-16llu\n", now);
 
 	/* print app write IOs */
+	seq_puts(seq, "[WRITE]\n");
 	seq_printf(seq, "app buffered:	%-16llu\n",
 				sbi->rw_iostat[APP_BUFFERED_IO]);
 	seq_printf(seq, "app direct:	%-16llu\n",
@@ -829,6 +830,7 @@ static int __maybe_unused iostat_info_seq_show(struct seq_file *seq,
 				sbi->rw_iostat[FS_CP_META_IO]);
 
 	/* print app read IOs */
+	seq_puts(seq, "[READ]\n");
 	seq_printf(seq, "app buffered:	%-16llu\n",
 				sbi->rw_iostat[APP_BUFFERED_READ_IO]);
 	seq_printf(seq, "app direct:	%-16llu\n",
@@ -839,12 +841,17 @@ static int __maybe_unused iostat_info_seq_show(struct seq_file *seq,
 	/* print fs read IOs */
 	seq_printf(seq, "fs data:	%-16llu\n",
 				sbi->rw_iostat[FS_DATA_READ_IO]);
+	seq_printf(seq, "fs gc data:	%-16llu\n",
+				sbi->rw_iostat[FS_GDATA_READ_IO]);
+	seq_printf(seq, "fs compr_data:	%-16llu\n",
+				sbi->rw_iostat[FS_CDATA_READ_IO]);
 	seq_printf(seq, "fs node:	%-16llu\n",
 				sbi->rw_iostat[FS_NODE_READ_IO]);
 	seq_printf(seq, "fs meta:	%-16llu\n",
 				sbi->rw_iostat[FS_META_READ_IO]);
 
 	/* print other IOs */
+	seq_puts(seq, "[OTHER]\n");
 	seq_printf(seq, "fs discard:	%-16llu\n",
 				sbi->rw_iostat[FS_DISCARD]);
 
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 417a486f5c8a..9ef8dea5c833 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1837,6 +1837,8 @@ TRACE_EVENT(f2fs_iostat,
 		__field(unsigned long long,	app_rio)
 		__field(unsigned long long,	app_mrio)
 		__field(unsigned long long,	fs_drio)
+		__field(unsigned long long,	fs_gdrio)
+		__field(unsigned long long,	fs_cdrio)
 		__field(unsigned long long,	fs_nrio)
 		__field(unsigned long long,	fs_mrio)
 		__field(unsigned long long,	fs_discard)
@@ -1861,6 +1863,8 @@ TRACE_EVENT(f2fs_iostat,
 		__entry->app_rio	= iostat[APP_READ_IO];
 		__entry->app_mrio	= iostat[APP_MAPPED_READ_IO];
 		__entry->fs_drio	= iostat[FS_DATA_READ_IO];
+		__entry->fs_gdrio	= iostat[FS_GDATA_READ_IO];
+		__entry->fs_cdrio	= iostat[FS_CDATA_READ_IO];
 		__entry->fs_nrio	= iostat[FS_NODE_READ_IO];
 		__entry->fs_mrio	= iostat[FS_META_READ_IO];
 		__entry->fs_discard	= iostat[FS_DISCARD];
@@ -1872,15 +1876,16 @@ TRACE_EVENT(f2fs_iostat,
 		"gc [data=%llu, node=%llu], "
 		"cp [data=%llu, node=%llu, meta=%llu], "
 		"app [read=%llu (direct=%llu, buffered=%llu), mapped=%llu], "
-		"fs [data=%llu, node=%llu, meta=%llu]",
+		"fs [data=%llu, (gc_data=%llu, compr_data=%llu), "
+		"node=%llu, meta=%llu]",
 		show_dev(__entry->dev), __entry->app_wio, __entry->app_dio,
 		__entry->app_bio, __entry->app_mio, __entry->fs_dio,
 		__entry->fs_nio, __entry->fs_mio, __entry->fs_discard,
 		__entry->fs_gc_dio, __entry->fs_gc_nio, __entry->fs_cp_dio,
 		__entry->fs_cp_nio, __entry->fs_cp_mio,
 		__entry->app_rio, __entry->app_drio, __entry->app_brio,
-		__entry->app_mrio, __entry->fs_drio, __entry->fs_nrio,
-		__entry->fs_mrio)
+		__entry->app_mrio, __entry->fs_drio, __entry->fs_gdrio,
+		__entry->fs_cdrio, __entry->fs_nrio, __entry->fs_mrio)
 );
 
 #endif /* _TRACE_F2FS_H */
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
