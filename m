Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEDF58BA9A
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  7 Aug 2022 12:50:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oKdrF-00055l-Ed; Sun, 07 Aug 2022 10:50:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1oKdrC-00055f-6q
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Aug 2022 10:50:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z8HR0Fna6nKa9DU5g4C8W6/KxVszuUqKV+TPqClbnx8=; b=M0gOfFYRSgNlpbiaeYSkv2jg4z
 yq18odEnpAAijFddzkh/bZnxV3n1BXuobZO7x2yx28gTNVb8w/efJuGLqLTgL3OsXKwWWt7GJNsgv
 WZYJbT9BNZgkG4xBj7RC8PxKIaXHndHpLnfKukYjSAVuRKIkkdoPbfUa0N/rXh4f+Zuo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Z8HR0Fna6nKa9DU5g4C8W6/KxVszuUqKV+TPqClbnx8=; b=j
 FPSiu26etwH0G5fUxMgMjkNHp4dRm0cBL1rOXW4PsAdiotA6h4TS4lH7m84aoRuUegXLGC3ezyP/R
 6OsFI+TBGU3G9hTt27RakFQPedu/CaCXv4btnYnOpXhf3tQRku7/iepWk/Ey8gbUHEwx3msdgvRiv
 OlSVzotUEGE8CpVY=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oKdrB-006fBN-Ou
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 07 Aug 2022 10:50:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0B992B80502;
 Sun,  7 Aug 2022 10:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD78C433D6;
 Sun,  7 Aug 2022 10:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659869387;
 bh=DmbCuuU5e1jvUUvZvjUaqgRuX4gkjlI6niZU5JvCJ3Y=;
 h=From:To:Cc:Subject:Date:From;
 b=fDfLcngSJ1oVveeg7WGZn3GKJ73B/rj+eiyBCyHdjy/Um9SlKg4bIBsAXnDH4oOih
 M0NfFoHdouH5eFz8Z22TwhmA4iT26kVWfdM0tvGRc/yM2TUZpv3xFtAPBv5HXdYVzm
 uhdqBa34bQxqLfrKml6fuYJLAaDtyob1P9hs81Z+GH0a0J0gHjjbNL5lND+oTiTlhL
 DaG2XeXqFPGjoXcbFve0IO7UejOXMajEJJf4xtgUThtPS0b4sywZAv5oXxjtpe+Alr
 4mvlurIBwH8kpdDSJoU1oMqIhYbAhrRj7i0WXvY5p1183xaXP3ZSPZjn+bbTTjbnEu
 aGN9zd3LM1WWQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun,  7 Aug 2022 18:49:40 +0800
Message-Id: <20220807104940.4233-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Chao Yu <chao.yu@oppo.com> Previously, we supported
 to account FS_CDATA_READ_IO type IO only, in this patch, it adds to account
 more type IO for compressed file: - APP_BUFFERED_CDATA_IO -
 APP_MAPPED_CDATA_IO - FS_CDATA_IO - APP [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oKdrB-006fBN-Ou
Subject: [f2fs-dev] [PATCH v2] f2fs: iostat: support accounting compressed IO
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

From: Chao Yu <chao.yu@oppo.com>

Previously, we supported to account FS_CDATA_READ_IO type IO only,
in this patch, it adds to account more type IO for compressed file:
- APP_BUFFERED_CDATA_IO
- APP_MAPPED_CDATA_IO
- FS_CDATA_IO
- APP_BUFFERED_CDATA_READ_IO
- APP_MAPPED_CDATA_READ_IO

Signed-off-by: Chao Yu <chao.yu@oppo.com>
---
v2:
- fix to update write count of compressed blocks correctly.
 fs/f2fs/f2fs.h              |  5 ++++
 fs/f2fs/file.c              | 27 ++++++++++++++++----
 fs/f2fs/iostat.c            | 50 ++++++++++++++++++++++---------------
 fs/f2fs/segment.c           |  2 ++
 include/trace/events/f2fs.h | 24 ++++++++++++++----
 5 files changed, 78 insertions(+), 30 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index eddfd35eadb6..a015935b55dd 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1158,7 +1158,10 @@ enum iostat_type {
 	APP_BUFFERED_IO,		/* app buffered write IOs */
 	APP_WRITE_IO,			/* app write IOs */
 	APP_MAPPED_IO,			/* app mapped IOs */
+	APP_BUFFERED_CDATA_IO,		/* app buffered write IOs on compressed file */
+	APP_MAPPED_CDATA_IO,		/* app mapped write IOs on compressed file */
 	FS_DATA_IO,			/* data IOs from kworker/fsync/reclaimer */
+	FS_CDATA_IO,			/* data IOs from kworker/fsync/reclaimer on compressed file */
 	FS_NODE_IO,			/* node IOs from kworker/fsync/reclaimer */
 	FS_META_IO,			/* meta IOs from kworker/reclaimer */
 	FS_GC_DATA_IO,			/* data IOs from forground gc */
@@ -1172,6 +1175,8 @@ enum iostat_type {
 	APP_BUFFERED_READ_IO,		/* app buffered read IOs */
 	APP_READ_IO,			/* app read IOs */
 	APP_MAPPED_READ_IO,		/* app mapped read IOs */
+	APP_BUFFERED_CDATA_READ_IO,	/* app buffered read IOs on compressed file  */
+	APP_MAPPED_CDATA_READ_IO,	/* app mapped read IOs on compressed file  */
 	FS_DATA_READ_IO,		/* data read IOs */
 	FS_GDATA_READ_IO,		/* data read IOs from background gc */
 	FS_CDATA_READ_IO,		/* compressed data read IOs */
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 24f5b02c78e7..bd45464001b6 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -42,9 +42,14 @@ static vm_fault_t f2fs_filemap_fault(struct vm_fault *vmf)
 	vm_fault_t ret;
 
 	ret = filemap_fault(vmf);
-	if (!ret)
-		f2fs_update_iostat(F2FS_I_SB(inode), APP_MAPPED_READ_IO,
+	if (!ret) {
+		struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+
+		f2fs_update_iostat(sbi, APP_MAPPED_READ_IO, F2FS_BLKSIZE);
+		if (f2fs_compressed_file(inode))
+			f2fs_update_iostat(sbi, APP_MAPPED_CDATA_READ_IO,
 							F2FS_BLKSIZE);
+	}
 
 	trace_f2fs_filemap_fault(inode, vmf->pgoff, (unsigned long)ret);
 
@@ -155,6 +160,8 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 		SetPageUptodate(page);
 
 	f2fs_update_iostat(sbi, APP_MAPPED_IO, F2FS_BLKSIZE);
+	if (f2fs_compressed_file(inode))
+		f2fs_update_iostat(sbi, APP_MAPPED_CDATA_IO, F2FS_BLKSIZE);
 	f2fs_update_time(sbi, REQ_TIME);
 
 	trace_f2fs_vm_page_mkwrite(page, DATA);
@@ -4306,8 +4313,14 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 		ret = f2fs_dio_read_iter(iocb, to);
 	} else {
 		ret = filemap_read(iocb, to, 0);
-		if (ret > 0)
-			f2fs_update_iostat(F2FS_I_SB(inode), APP_BUFFERED_READ_IO, ret);
+		if (ret > 0) {
+			struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+
+			f2fs_update_iostat(sbi, APP_BUFFERED_READ_IO, ret);
+			if (f2fs_compressed_file(inode))
+				f2fs_update_iostat(sbi,
+					APP_BUFFERED_CDATA_READ_IO, ret);
+		}
 	}
 	if (trace_f2fs_dataread_end_enabled())
 		trace_f2fs_dataread_end(inode, pos, ret);
@@ -4423,8 +4436,12 @@ static ssize_t f2fs_buffered_write_iter(struct kiocb *iocb,
 	current->backing_dev_info = NULL;
 
 	if (ret > 0) {
+		struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+
 		iocb->ki_pos += ret;
-		f2fs_update_iostat(F2FS_I_SB(inode), APP_BUFFERED_IO, ret);
+		f2fs_update_iostat(sbi, APP_BUFFERED_IO, ret);
+		if (f2fs_compressed_file(inode))
+			f2fs_update_iostat(sbi, APP_BUFFERED_CDATA_IO, ret);
 	}
 	return ret;
 }
diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
index d84c5f6cc09d..b46a6c65d8fd 100644
--- a/fs/f2fs/iostat.c
+++ b/fs/f2fs/iostat.c
@@ -31,55 +31,65 @@ int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
 
 	/* print app write IOs */
 	seq_puts(seq, "[WRITE]\n");
-	seq_printf(seq, "app buffered:	%-16llu\n",
+	seq_printf(seq, "app buffered data:	%-16llu\n",
 				sbi->rw_iostat[APP_BUFFERED_IO]);
-	seq_printf(seq, "app direct:	%-16llu\n",
+	seq_printf(seq, "app direct data:	%-16llu\n",
 				sbi->rw_iostat[APP_DIRECT_IO]);
-	seq_printf(seq, "app mapped:	%-16llu\n",
+	seq_printf(seq, "app mapped data:	%-16llu\n",
 				sbi->rw_iostat[APP_MAPPED_IO]);
+	seq_printf(seq, "app buffered cdata:	%-16llu\n",
+				sbi->rw_iostat[APP_BUFFERED_CDATA_IO]);
+	seq_printf(seq, "app mapped cdata:	%-16llu\n",
+				sbi->rw_iostat[APP_MAPPED_CDATA_IO]);
 
 	/* print fs write IOs */
-	seq_printf(seq, "fs data:	%-16llu\n",
+	seq_printf(seq, "fs data:		%-16llu\n",
 				sbi->rw_iostat[FS_DATA_IO]);
-	seq_printf(seq, "fs node:	%-16llu\n",
+	seq_printf(seq, "fs cdata:		%-16llu\n",
+				sbi->rw_iostat[FS_CDATA_IO]);
+	seq_printf(seq, "fs node:		%-16llu\n",
 				sbi->rw_iostat[FS_NODE_IO]);
-	seq_printf(seq, "fs meta:	%-16llu\n",
+	seq_printf(seq, "fs meta:		%-16llu\n",
 				sbi->rw_iostat[FS_META_IO]);
-	seq_printf(seq, "fs gc data:	%-16llu\n",
+	seq_printf(seq, "fs gc data:		%-16llu\n",
 				sbi->rw_iostat[FS_GC_DATA_IO]);
-	seq_printf(seq, "fs gc node:	%-16llu\n",
+	seq_printf(seq, "fs gc node:		%-16llu\n",
 				sbi->rw_iostat[FS_GC_NODE_IO]);
-	seq_printf(seq, "fs cp data:	%-16llu\n",
+	seq_printf(seq, "fs cp data:		%-16llu\n",
 				sbi->rw_iostat[FS_CP_DATA_IO]);
-	seq_printf(seq, "fs cp node:	%-16llu\n",
+	seq_printf(seq, "fs cp node:		%-16llu\n",
 				sbi->rw_iostat[FS_CP_NODE_IO]);
-	seq_printf(seq, "fs cp meta:	%-16llu\n",
+	seq_printf(seq, "fs cp meta:		%-16llu\n",
 				sbi->rw_iostat[FS_CP_META_IO]);
 
 	/* print app read IOs */
 	seq_puts(seq, "[READ]\n");
-	seq_printf(seq, "app buffered:	%-16llu\n",
+	seq_printf(seq, "app buffered data:	%-16llu\n",
 				sbi->rw_iostat[APP_BUFFERED_READ_IO]);
-	seq_printf(seq, "app direct:	%-16llu\n",
+	seq_printf(seq, "app direct data:	%-16llu\n",
 				sbi->rw_iostat[APP_DIRECT_READ_IO]);
-	seq_printf(seq, "app mapped:	%-16llu\n",
+	seq_printf(seq, "app mapped data:	%-16llu\n",
 				sbi->rw_iostat[APP_MAPPED_READ_IO]);
+	seq_printf(seq, "app buffered cdata:	%-16llu\n",
+				sbi->rw_iostat[APP_BUFFERED_CDATA_READ_IO]);
+	seq_printf(seq, "app mapped cdata:	%-16llu\n",
+				sbi->rw_iostat[APP_MAPPED_CDATA_READ_IO]);
 
 	/* print fs read IOs */
-	seq_printf(seq, "fs data:	%-16llu\n",
+	seq_printf(seq, "fs data:		%-16llu\n",
 				sbi->rw_iostat[FS_DATA_READ_IO]);
-	seq_printf(seq, "fs gc data:	%-16llu\n",
+	seq_printf(seq, "fs gc data:		%-16llu\n",
 				sbi->rw_iostat[FS_GDATA_READ_IO]);
-	seq_printf(seq, "fs compr_data:	%-16llu\n",
+	seq_printf(seq, "fs cdata:		%-16llu\n",
 				sbi->rw_iostat[FS_CDATA_READ_IO]);
-	seq_printf(seq, "fs node:	%-16llu\n",
+	seq_printf(seq, "fs node:		%-16llu\n",
 				sbi->rw_iostat[FS_NODE_READ_IO]);
-	seq_printf(seq, "fs meta:	%-16llu\n",
+	seq_printf(seq, "fs meta:		%-16llu\n",
 				sbi->rw_iostat[FS_META_READ_IO]);
 
 	/* print other IOs */
 	seq_puts(seq, "[OTHER]\n");
-	seq_printf(seq, "fs discard:	%-16llu\n",
+	seq_printf(seq, "fs discard:		%-16llu\n",
 				sbi->rw_iostat[FS_DISCARD]);
 
 	return 0;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 72ce00ebcede..07cd162d268d 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3413,6 +3413,8 @@ void f2fs_outplace_write_data(struct dnode_of_data *dn,
 	f2fs_update_data_blkaddr(dn, fio->new_blkaddr);
 
 	f2fs_update_iostat(sbi, fio->io_type, F2FS_BLKSIZE);
+	if (f2fs_compressed_file(dn->inode) && fio->io_type == FS_DATA_IO)
+		f2fs_update_iostat(sbi, FS_CDATA_IO, F2FS_BLKSIZE);
 }
 
 int f2fs_inplace_write_data(struct f2fs_io_info *fio)
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 513e889ef8aa..e395442502e8 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1823,7 +1823,10 @@ TRACE_EVENT(f2fs_iostat,
 		__field(unsigned long long,	app_bio)
 		__field(unsigned long long,	app_wio)
 		__field(unsigned long long,	app_mio)
+		__field(unsigned long long,	app_bcdio)
+		__field(unsigned long long,	app_mcdio)
 		__field(unsigned long long,	fs_dio)
+		__field(unsigned long long,	fs_cdio)
 		__field(unsigned long long,	fs_nio)
 		__field(unsigned long long,	fs_mio)
 		__field(unsigned long long,	fs_gc_dio)
@@ -1835,6 +1838,8 @@ TRACE_EVENT(f2fs_iostat,
 		__field(unsigned long long,	app_brio)
 		__field(unsigned long long,	app_rio)
 		__field(unsigned long long,	app_mrio)
+		__field(unsigned long long,	app_bcrio)
+		__field(unsigned long long,	app_mcrio)
 		__field(unsigned long long,	fs_drio)
 		__field(unsigned long long,	fs_gdrio)
 		__field(unsigned long long,	fs_cdrio)
@@ -1849,7 +1854,10 @@ TRACE_EVENT(f2fs_iostat,
 		__entry->app_bio	= iostat[APP_BUFFERED_IO];
 		__entry->app_wio	= iostat[APP_WRITE_IO];
 		__entry->app_mio	= iostat[APP_MAPPED_IO];
+		__entry->app_bcdio	= iostat[APP_BUFFERED_CDATA_IO];
+		__entry->app_mcdio	= iostat[APP_MAPPED_CDATA_IO];
 		__entry->fs_dio		= iostat[FS_DATA_IO];
+		__entry->fs_cdio	= iostat[FS_CDATA_IO];
 		__entry->fs_nio		= iostat[FS_NODE_IO];
 		__entry->fs_mio		= iostat[FS_META_IO];
 		__entry->fs_gc_dio	= iostat[FS_GC_DATA_IO];
@@ -1861,6 +1869,8 @@ TRACE_EVENT(f2fs_iostat,
 		__entry->app_brio	= iostat[APP_BUFFERED_READ_IO];
 		__entry->app_rio	= iostat[APP_READ_IO];
 		__entry->app_mrio	= iostat[APP_MAPPED_READ_IO];
+		__entry->app_bcrio	= iostat[APP_BUFFERED_CDATA_READ_IO];
+		__entry->app_mcrio	= iostat[APP_MAPPED_CDATA_READ_IO];
 		__entry->fs_drio	= iostat[FS_DATA_READ_IO];
 		__entry->fs_gdrio	= iostat[FS_GDATA_READ_IO];
 		__entry->fs_cdrio	= iostat[FS_CDATA_READ_IO];
@@ -1870,20 +1880,24 @@ TRACE_EVENT(f2fs_iostat,
 	),
 
 	TP_printk("dev = (%d,%d), "
-		"app [write=%llu (direct=%llu, buffered=%llu), mapped=%llu], "
-		"fs [data=%llu, node=%llu, meta=%llu, discard=%llu], "
+		"app [write=%llu (direct=%llu, buffered=%llu), mapped=%llu, "
+		"compr(buffered=%llu, mapped=%llu)], "
+		"fs [data=%llu, cdata=%llu, node=%llu, meta=%llu, discard=%llu], "
 		"gc [data=%llu, node=%llu], "
 		"cp [data=%llu, node=%llu, meta=%llu], "
 		"app [read=%llu (direct=%llu, buffered=%llu), mapped=%llu], "
-		"fs [data=%llu, (gc_data=%llu, compr_data=%llu), "
+		"compr(buffered=%llu, mapped=%llu)], "
+		"fs [data=%llu, (gc_data=%llu, cdata=%llu), "
 		"node=%llu, meta=%llu]",
 		show_dev(__entry->dev), __entry->app_wio, __entry->app_dio,
-		__entry->app_bio, __entry->app_mio, __entry->fs_dio,
+		__entry->app_bio, __entry->app_mio, __entry->app_bcdio,
+		__entry->app_mcdio, __entry->fs_dio, __entry->fs_cdio,
 		__entry->fs_nio, __entry->fs_mio, __entry->fs_discard,
 		__entry->fs_gc_dio, __entry->fs_gc_nio, __entry->fs_cp_dio,
 		__entry->fs_cp_nio, __entry->fs_cp_mio,
 		__entry->app_rio, __entry->app_drio, __entry->app_brio,
-		__entry->app_mrio, __entry->fs_drio, __entry->fs_gdrio,
+		__entry->app_mrio, __entry->app_bcrio, __entry->app_mcrio,
+		__entry->fs_drio, __entry->fs_gdrio,
 		__entry->fs_cdrio, __entry->fs_nrio, __entry->fs_mrio)
 );
 
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
