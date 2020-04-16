Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D89891ABDBA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Apr 2020 12:17:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jP1aH-0002FY-OH; Thu, 16 Apr 2020 10:17:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jP1aG-0002FE-KP
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Apr 2020 10:17:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e9vTb23Acc4a/cnJA3bq3fjLRDGOJtZb7KIMH6ZjaAk=; b=BESFmc3AD/HAU0JWcwxAcGIKX6
 LINHEUBYcvvToBkiVYw7kcRMDq6e6EmEhYruQO1uPPJjUWs2JJP45Ca2fXTtTEGYGWs1ND0kG8sr3
 gf3HsurP4Upqg4KFGOdrm2h32ul+pgzLKGqDmR06jT4A/e6oldv8RHaP876U2TppzCs8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=e9vTb23Acc4a/cnJA3bq3fjLRDGOJtZb7KIMH6ZjaAk=; b=U
 CbcvzXvsSj2o1M3+yIvPvkn0xXstc3uhze0DCOlMVa4oDg9292l1U2w0ev6xvj3GOlXV1eNCl7i+l
 GGq6y16Q3bLwrGw+Q1aEWts88mZn6JFx+la50AdExLFX5lg+XDxrexyQSt78CxaIK/rrJRcGyi0cr
 e0mqYzRvwK/s6YiA=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jP1aD-0005Tg-8d
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Apr 2020 10:17:24 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id DB013ED08882747518D6;
 Thu, 16 Apr 2020 18:17:12 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Thu, 16 Apr 2020 18:17:04 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 16 Apr 2020 18:16:56 +0800
Message-ID: <20200416101656.106970-1-yuchao0@huawei.com>
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
X-Headers-End: 1jP1aD-0005Tg-8d
Subject: [f2fs-dev] [PATCH] f2fs: support read iostat
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

Adds to support accounting read IOs from userspace/kernel.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/checkpoint.c        |  5 ++++
 fs/f2fs/data.c              |  6 +++++
 fs/f2fs/f2fs.h              | 37 +++++++++++++++++++-------
 fs/f2fs/file.c              | 12 ++++++++-
 fs/f2fs/gc.c                |  6 +++++
 fs/f2fs/node.c              |  8 +++++-
 fs/f2fs/sysfs.c             | 52 +++++++++++++++++++++++++------------
 include/trace/events/f2fs.h | 23 ++++++++++++++--
 8 files changed, 118 insertions(+), 31 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index dcb3a15574c9..eafe37eab5e0 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -86,6 +86,8 @@ static struct page *__get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index,
 		return ERR_PTR(err);
 	}
 
+	f2fs_update_iostat(sbi, FS_META_READ_IO, F2FS_BLKSIZE);
+
 	lock_page(page);
 	if (unlikely(page->mapping != mapping)) {
 		f2fs_put_page(page, 1);
@@ -266,6 +268,9 @@ int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, block_t start, int nrpages,
 		fio.page = page;
 		err = f2fs_submit_page_bio(&fio);
 		f2fs_put_page(page, err ? 1 : 0);
+
+		if (!err)
+			f2fs_update_iostat(sbi, FS_META_READ_IO, F2FS_BLKSIZE);
 	}
 out:
 	blk_finish_plug(&plug);
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 22a31e2401cf..676f48bf79eb 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1033,6 +1033,7 @@ static int f2fs_submit_page_read(struct inode *inode, struct page *page,
 	}
 	ClearPageError(page);
 	inc_page_count(sbi, F2FS_RD_DATA);
+	f2fs_update_iostat(sbi, FS_DATA_READ_IO, F2FS_BLKSIZE);
 	__submit_bio(sbi, bio, DATA);
 	return 0;
 }
@@ -2089,6 +2090,7 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 		goto submit_and_realloc;
 
 	inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
+	f2fs_update_iostat(F2FS_I_SB(inode), FS_DATA_READ_IO, F2FS_BLKSIZE);
 	ClearPageError(page);
 	*last_block_in_bio = block_nr;
 	goto out;
@@ -2224,6 +2226,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 			goto submit_and_realloc;
 
 		inc_page_count(sbi, F2FS_RD_DATA);
+		f2fs_update_iostat(sbi, FS_DATA_READ_IO, F2FS_BLKSIZE);
 		ClearPageError(page);
 		*last_block_in_bio = blkaddr;
 	}
@@ -3581,6 +3584,9 @@ static ssize_t f2fs_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
 		} else if (err < 0) {
 			f2fs_write_failed(mapping, offset + count);
 		}
+	} else {
+		if (err > 0)
+			f2fs_update_iostat(sbi, APP_DIRECT_READ_IO, err);
 	}
 
 out:
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9dd1fc957b94..bae8e65deed6 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1093,8 +1093,9 @@ enum cp_reason_type {
 };
 
 enum iostat_type {
-	APP_DIRECT_IO,			/* app direct IOs */
-	APP_BUFFERED_IO,		/* app buffered IOs */
+	/* WRITE IO */
+	APP_DIRECT_IO,			/* app direct write IOs */
+	APP_BUFFERED_IO,		/* app buffered write IOs */
 	APP_WRITE_IO,			/* app write IOs */
 	APP_MAPPED_IO,			/* app mapped IOs */
 	FS_DATA_IO,			/* data IOs from kworker/fsync/reclaimer */
@@ -1105,6 +1106,17 @@ enum iostat_type {
 	FS_CP_DATA_IO,			/* data IOs from checkpoint */
 	FS_CP_NODE_IO,			/* node IOs from checkpoint */
 	FS_CP_META_IO,			/* meta IOs from checkpoint */
+
+	/* READ IO */
+	APP_DIRECT_READ_IO,		/* app direct read IOs */
+	APP_BUFFERED_READ_IO,		/* app buffered read IOs */
+	APP_READ_IO,			/* app read IOs */
+	APP_MAPPED_READ_IO,		/* app mapped read IOs */
+	FS_DATA_READ_IO,		/* data read IOs */
+	FS_NODE_READ_IO,		/* node read IOs */
+	FS_META_READ_IO,		/* meta read IOs */
+
+	/* other */
 	FS_DISCARD,			/* discard */
 	NR_IO_TYPE,
 };
@@ -1509,8 +1521,8 @@ struct f2fs_sb_info {
 
 	/* For app/fs IO statistics */
 	spinlock_t iostat_lock;
-	unsigned long long write_iostat[NR_IO_TYPE];
-	unsigned long long prev_write_iostat[NR_IO_TYPE];
+	unsigned long long rw_iostat[NR_IO_TYPE];
+	unsigned long long prev_rw_iostat[NR_IO_TYPE];
 	bool iostat_enable;
 	unsigned long iostat_next_period;
 	unsigned int iostat_period_ms;
@@ -3018,8 +3030,8 @@ static inline void f2fs_reset_iostat(struct f2fs_sb_info *sbi)
 
 	spin_lock(&sbi->iostat_lock);
 	for (i = 0; i < NR_IO_TYPE; i++) {
-		sbi->write_iostat[i] = 0;
-		sbi->prev_write_iostat[i] = 0;
+		sbi->rw_iostat[i] = 0;
+		sbi->prev_rw_iostat[i] = 0;
 	}
 	spin_unlock(&sbi->iostat_lock);
 }
@@ -3032,12 +3044,17 @@ static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi,
 	if (!sbi->iostat_enable)
 		return;
 	spin_lock(&sbi->iostat_lock);
-	sbi->write_iostat[type] += io_bytes;
+	sbi->rw_iostat[type] += io_bytes;
 
 	if (type == APP_WRITE_IO || type == APP_DIRECT_IO)
-		sbi->write_iostat[APP_BUFFERED_IO] =
-			sbi->write_iostat[APP_WRITE_IO] -
-			sbi->write_iostat[APP_DIRECT_IO];
+		sbi->rw_iostat[APP_BUFFERED_IO] =
+			sbi->rw_iostat[APP_WRITE_IO] -
+			sbi->rw_iostat[APP_DIRECT_IO];
+
+	if (type == APP_READ_IO || type == APP_DIRECT_READ_IO)
+		sbi->rw_iostat[APP_BUFFERED_READ_IO] =
+			sbi->rw_iostat[APP_READ_IO] -
+			sbi->rw_iostat[APP_DIRECT_READ_IO];
 	spin_unlock(&sbi->iostat_lock);
 
 	f2fs_record_iostat(sbi);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 212c5996d380..ea04fb4dcdbd 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -40,6 +40,10 @@ static vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
 	ret = filemap_fault(vmf);
 	up_read(&F2FS_I(inode)->i_mmap_sem);
 
+	if (!ret)
+		f2fs_update_iostat(F2FS_I_SB(inode), APP_MAPPED_READ_IO,
+							F2FS_BLKSIZE);
+
 	trace_f2fs_filemap_fault(inode, vmf->pgoff, (unsigned long)ret);
 
 	return ret;
@@ -3822,11 +3826,17 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter)
 {
 	struct file *file = iocb->ki_filp;
 	struct inode *inode = file_inode(file);
+	int ret;
 
 	if (!f2fs_is_compress_backend_ready(inode))
 		return -EOPNOTSUPP;
 
-	return generic_file_read_iter(iocb, iter);
+	ret = generic_file_read_iter(iocb, iter);
+
+	if (ret > 0)
+		f2fs_update_iostat(F2FS_I_SB(inode), APP_READ_IO, ret);
+
+	return ret;
 }
 
 static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index ad395b774a0b..1cd4992aeec0 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -737,6 +737,9 @@ static int ra_data_block(struct inode *inode, pgoff_t index)
 		goto put_encrypted_page;
 	f2fs_put_page(fio.encrypted_page, 0);
 	f2fs_put_page(page, 1);
+
+	f2fs_update_iostat(sbi, FS_DATA_READ_IO, F2FS_BLKSIZE);
+
 	return 0;
 put_encrypted_page:
 	f2fs_put_page(fio.encrypted_page, 1);
@@ -840,6 +843,9 @@ static int move_data_block(struct inode *inode, block_t bidx,
 			f2fs_put_page(mpage, 1);
 			goto up_out;
 		}
+
+		f2fs_update_iostat(fio.sbi, FS_DATA_READ_IO, F2FS_BLKSIZE);
+
 		lock_page(mpage);
 		if (unlikely(mpage->mapping != META_MAPPING(fio.sbi) ||
 						!PageUptodate(mpage))) {
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index ecbd6bd14a49..4da0d8713df5 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1300,7 +1300,13 @@ static int read_node_page(struct page *page, int op_flags)
 	}
 
 	fio.new_blkaddr = fio.old_blkaddr = ni.blk_addr;
-	return f2fs_submit_page_bio(&fio);
+
+	err = f2fs_submit_page_bio(&fio);
+
+	if (!err)
+		f2fs_update_iostat(sbi, FS_NODE_READ_IO, F2FS_BLKSIZE);
+
+	return err;
 }
 
 /*
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index d05cb68c2637..eaf8088548f0 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -781,9 +781,9 @@ void f2fs_record_iostat(struct f2fs_sb_info *sbi)
 				msecs_to_jiffies(sbi->iostat_period_ms);
 
 	for (i = 0; i < NR_IO_TYPE; i++) {
-		iostat_diff[i] = sbi->write_iostat[i] -
-				sbi->prev_write_iostat[i];
-		sbi->prev_write_iostat[i] = sbi->write_iostat[i];
+		iostat_diff[i] = sbi->rw_iostat[i] -
+				sbi->prev_rw_iostat[i];
+		sbi->prev_rw_iostat[i] = sbi->rw_iostat[i];
 	}
 	spin_unlock(&sbi->iostat_lock);
 
@@ -802,33 +802,51 @@ static int __maybe_unused iostat_info_seq_show(struct seq_file *seq,
 
 	seq_printf(seq, "time:		%-16llu\n", now);
 
-	/* print app IOs */
+	/* print app write IOs */
 	seq_printf(seq, "app buffered:	%-16llu\n",
-				sbi->write_iostat[APP_BUFFERED_IO]);
+				sbi->rw_iostat[APP_BUFFERED_IO]);
 	seq_printf(seq, "app direct:	%-16llu\n",
-				sbi->write_iostat[APP_DIRECT_IO]);
+				sbi->rw_iostat[APP_DIRECT_IO]);
 	seq_printf(seq, "app mapped:	%-16llu\n",
-				sbi->write_iostat[APP_MAPPED_IO]);
+				sbi->rw_iostat[APP_MAPPED_IO]);
 
-	/* print fs IOs */
+	/* print fs write IOs */
 	seq_printf(seq, "fs data:	%-16llu\n",
-				sbi->write_iostat[FS_DATA_IO]);
+				sbi->rw_iostat[FS_DATA_IO]);
 	seq_printf(seq, "fs node:	%-16llu\n",
-				sbi->write_iostat[FS_NODE_IO]);
+				sbi->rw_iostat[FS_NODE_IO]);
 	seq_printf(seq, "fs meta:	%-16llu\n",
-				sbi->write_iostat[FS_META_IO]);
+				sbi->rw_iostat[FS_META_IO]);
 	seq_printf(seq, "fs gc data:	%-16llu\n",
-				sbi->write_iostat[FS_GC_DATA_IO]);
+				sbi->rw_iostat[FS_GC_DATA_IO]);
 	seq_printf(seq, "fs gc node:	%-16llu\n",
-				sbi->write_iostat[FS_GC_NODE_IO]);
+				sbi->rw_iostat[FS_GC_NODE_IO]);
 	seq_printf(seq, "fs cp data:	%-16llu\n",
-				sbi->write_iostat[FS_CP_DATA_IO]);
+				sbi->rw_iostat[FS_CP_DATA_IO]);
 	seq_printf(seq, "fs cp node:	%-16llu\n",
-				sbi->write_iostat[FS_CP_NODE_IO]);
+				sbi->rw_iostat[FS_CP_NODE_IO]);
 	seq_printf(seq, "fs cp meta:	%-16llu\n",
-				sbi->write_iostat[FS_CP_META_IO]);
+				sbi->rw_iostat[FS_CP_META_IO]);
+
+	/* print app read IOs */
+	seq_printf(seq, "app buffered:	%-16llu\n",
+				sbi->rw_iostat[APP_BUFFERED_READ_IO]);
+	seq_printf(seq, "app direct:	%-16llu\n",
+				sbi->rw_iostat[APP_DIRECT_READ_IO]);
+	seq_printf(seq, "app mapped:	%-16llu\n",
+				sbi->rw_iostat[APP_MAPPED_READ_IO]);
+
+	/* print fs read IOs */
+	seq_printf(seq, "fs data:	%-16llu\n",
+				sbi->rw_iostat[FS_DATA_READ_IO]);
+	seq_printf(seq, "fs node:	%-16llu\n",
+				sbi->rw_iostat[FS_NODE_READ_IO]);
+	seq_printf(seq, "fs meta:	%-16llu\n",
+				sbi->rw_iostat[FS_META_READ_IO]);
+
+	/* print other IOs */
 	seq_printf(seq, "fs discard:	%-16llu\n",
-				sbi->write_iostat[FS_DISCARD]);
+				sbi->rw_iostat[FS_DISCARD]);
 
 	return 0;
 }
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 421a661bfd5a..4dbcdc6d2738 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1835,6 +1835,13 @@ TRACE_EVENT(f2fs_iostat,
 		__field(unsigned long long,	fs_cp_dio)
 		__field(unsigned long long,	fs_cp_nio)
 		__field(unsigned long long,	fs_cp_mio)
+		__field(unsigned long long,	app_drio)
+		__field(unsigned long long,	app_brio)
+		__field(unsigned long long,	app_rio)
+		__field(unsigned long long,	app_mrio)
+		__field(unsigned long long,	fs_drio)
+		__field(unsigned long long,	fs_nrio)
+		__field(unsigned long long,	fs_mrio)
 		__field(unsigned long long,	fs_discard)
 	),
 
@@ -1852,6 +1859,13 @@ TRACE_EVENT(f2fs_iostat,
 		__entry->fs_cp_dio	= iostat[FS_CP_DATA_IO];
 		__entry->fs_cp_nio	= iostat[FS_CP_NODE_IO];
 		__entry->fs_cp_mio	= iostat[FS_CP_META_IO];
+		__entry->app_drio	= iostat[APP_DIRECT_READ_IO];
+		__entry->app_brio	= iostat[APP_BUFFERED_READ_IO];
+		__entry->app_rio	= iostat[APP_READ_IO];
+		__entry->app_mrio	= iostat[APP_MAPPED_READ_IO];
+		__entry->fs_drio	= iostat[FS_DATA_READ_IO];
+		__entry->fs_nrio	= iostat[FS_NODE_READ_IO];
+		__entry->fs_mrio	= iostat[FS_META_READ_IO];
 		__entry->fs_discard	= iostat[FS_DISCARD];
 	),
 
@@ -1859,12 +1873,17 @@ TRACE_EVENT(f2fs_iostat,
 		"app [write=%llu (direct=%llu, buffered=%llu), mapped=%llu], "
 		"fs [data=%llu, node=%llu, meta=%llu, discard=%llu], "
 		"gc [data=%llu, node=%llu], "
-		"cp [data=%llu, node=%llu, meta=%llu]",
+		"cp [data=%llu, node=%llu, meta=%llu], "
+		"app [read=%llu (direct=%llu, buffered=%llu), mapped=%llu], "
+		"fs [data=%llu, node=%llu, meta=%llu]",
 		show_dev(__entry->dev), __entry->app_wio, __entry->app_dio,
 		__entry->app_bio, __entry->app_mio, __entry->fs_dio,
 		__entry->fs_nio, __entry->fs_mio, __entry->fs_discard,
 		__entry->fs_gc_dio, __entry->fs_gc_nio, __entry->fs_cp_dio,
-		__entry->fs_cp_nio, __entry->fs_cp_mio)
+		__entry->fs_cp_nio, __entry->fs_cp_mio,
+		__entry->app_rio, __entry->app_drio, __entry->app_brio,
+		__entry->app_mrio, __entry->fs_drio, __entry->fs_nrio,
+		__entry->fs_mrio)
 );
 
 #endif /* _TRACE_F2FS_H */
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
