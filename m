Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F168AC426
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Apr 2024 08:24:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ryn6Y-0007iF-Ts;
	Mon, 22 Apr 2024 06:24:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ryn6U-0007i4-71
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Apr 2024 06:24:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BpKLwF+Fb+l/RtCr9J2Nldy2Ln7wvLwcX88TaHDTTds=; b=ifMZmAMIO3fT04pYfh/nxruH6o
 ogfHcDjh4TsiefAGkkUw3XDZ+pAuJexgqXThzlOn+8JIHKy/gpflUcc4gvKEHR2FkE4KeXHD953Ty
 TSIWaOJtTiDvMQAzNt5jadojMLBfSS1ehdI/Y1Ss+iCZOClHmlwAwHD9MrgJPl42Xjok=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BpKLwF+Fb+l/RtCr9J2Nldy2Ln7wvLwcX88TaHDTTds=; b=CMEjhGFSOSJl65G7WIMrnP3PHh
 Wgj/ajfLYZCGa+uLLEKRTWPQLsQkDhkhHEeP98EuXvEbiYS2+yPRLeF+RpCRyOiUQoiLpKbqzzx1u
 wJVGc4MNonV5QgQNNOR4ZKjFAhXLw9odaBKP0dBZNz5XAVTcAgJuthIG0RRUEFk6SSbA=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ryn6S-0003dj-Ov for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Apr 2024 06:24:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 953C5CE0A48
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 22 Apr 2024 06:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E93ABC2BD11;
 Mon, 22 Apr 2024 06:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713767070;
 bh=HuVjVZ6RRiLFQGFS0GihV94ntmz3batSIusPOiVW4t4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fOhzCanV+6czMu++OWThyb2BTreGgvNYbvY3iaw6oRWSINrjZVmr8apXaVRhiwbSh
 sfmhC/k6l+QrBWkvLyTNku2s0FT6xzXAG8lMmn3vijbSAWEqfPui1Fhlh1xHqhn3Vl
 1qy+eM5resmmwPp8JZlrA60nc05zqdlWPbcJ5vsVWBKFzA2h7TNKFJJAUudbLFxwhE
 5Or+x22l8mEOUrqP4cCTVGKDEqO8lccNZOvRvH3tKhrhpiJqP8LH0BVZtiyUu8urWE
 cJtmfu+MslzOK/bxusEogKhrtyKeE3rpFlhYozZYY0LJ5xjLYn4rTlihgOpW5z10iK
 2OC0RkyPnLIIw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 22 Apr 2024 14:24:17 +0800
Message-Id: <20240422062417.2421616-4-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240422062417.2421616-1-chao@kernel.org>
References: <20240422062417.2421616-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert f2fs__page tracepoint class() and its instances to
 use folio and related functionality,
 and rename it to f2fs__folio(). Signed-off-by:
 Chao Yu <chao@kernel.org> --- v2: - no change. fs/f2fs/checkpoint.c | 4 ++--
 fs/f2fs/data.c | 10 ++++----- fs/f2fs/node.c | 4 ++--
 include/trace/events/f2fs.h | 42 ++++++++++++++++++--- [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ryn6S-0003dj-Ov
Subject: [f2fs-dev] [PATCH v2 4/4] f2fs: convert f2fs__page tracepoint class
 to use folio
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

Convert f2fs__page tracepoint class() and its instances to use folio
and related functionality, and rename it to f2fs__folio().

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- no change.
 fs/f2fs/checkpoint.c        |  4 ++--
 fs/f2fs/data.c              | 10 ++++-----
 fs/f2fs/node.c              |  4 ++--
 include/trace/events/f2fs.h | 42 ++++++++++++++++++-------------------
 4 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index eac698b8dd38..5d05a413f451 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -345,7 +345,7 @@ static int __f2fs_write_meta_page(struct page *page,
 {
 	struct f2fs_sb_info *sbi = F2FS_P_SB(page);
 
-	trace_f2fs_writepage(page, META);
+	trace_f2fs_writepage(page_folio(page), META);
 
 	if (unlikely(f2fs_cp_error(sbi))) {
 		if (is_sbi_flag_set(sbi, SBI_IS_CLOSE)) {
@@ -492,7 +492,7 @@ long f2fs_sync_meta_pages(struct f2fs_sb_info *sbi, enum page_type type,
 static bool f2fs_dirty_meta_folio(struct address_space *mapping,
 		struct folio *folio)
 {
-	trace_f2fs_set_page_dirty(&folio->page, META);
+	trace_f2fs_set_page_dirty(folio, META);
 
 	if (!folio_test_uptodate(folio))
 		folio_mark_uptodate(folio);
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 24f9a39ffd56..21d4c1c9b25b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2460,7 +2460,7 @@ static int f2fs_read_data_folio(struct file *file, struct folio *folio)
 	struct inode *inode = folio_file_mapping(folio)->host;
 	int ret = -EAGAIN;
 
-	trace_f2fs_readpage(&folio->page, DATA);
+	trace_f2fs_readpage(folio, DATA);
 
 	if (!f2fs_is_compress_backend_ready(inode)) {
 		folio_unlock(folio);
@@ -2709,7 +2709,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		} else {
 			set_inode_flag(inode, FI_UPDATE_WRITE);
 		}
-		trace_f2fs_do_write_data_page(fio->page, IPU);
+		trace_f2fs_do_write_data_page(page_folio(page), IPU);
 		return err;
 	}
 
@@ -2738,7 +2738,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 
 	/* LFS mode write path */
 	f2fs_outplace_write_data(&dn, fio);
-	trace_f2fs_do_write_data_page(page, OPU);
+	trace_f2fs_do_write_data_page(page_folio(page), OPU);
 	set_inode_flag(inode, FI_APPEND_WRITE);
 out_writepage:
 	f2fs_put_dnode(&dn);
@@ -2785,7 +2785,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 		.last_block = last_block,
 	};
 
-	trace_f2fs_writepage(page, DATA);
+	trace_f2fs_writepage(page_folio(page), DATA);
 
 	/* we should bypass data pages to proceed the kworker jobs */
 	if (unlikely(f2fs_cp_error(sbi))) {
@@ -3759,7 +3759,7 @@ static bool f2fs_dirty_data_folio(struct address_space *mapping,
 {
 	struct inode *inode = mapping->host;
 
-	trace_f2fs_set_page_dirty(&folio->page, DATA);
+	trace_f2fs_set_page_dirty(folio, DATA);
 
 	if (!folio_test_uptodate(folio))
 		folio_mark_uptodate(folio);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 3b9eb5693683..95cecf08cb37 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1624,7 +1624,7 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
 	};
 	unsigned int seq;
 
-	trace_f2fs_writepage(page, NODE);
+	trace_f2fs_writepage(page_folio(page), NODE);
 
 	if (unlikely(f2fs_cp_error(sbi))) {
 		/* keep node pages in remount-ro mode */
@@ -2171,7 +2171,7 @@ static int f2fs_write_node_pages(struct address_space *mapping,
 static bool f2fs_dirty_node_folio(struct address_space *mapping,
 		struct folio *folio)
 {
-	trace_f2fs_set_page_dirty(&folio->page, NODE);
+	trace_f2fs_set_page_dirty(folio, NODE);
 
 	if (!folio_test_uptodate(folio))
 		folio_mark_uptodate(folio);
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 7ed0fc430dc6..371ba28415f5 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1304,11 +1304,11 @@ TRACE_EVENT(f2fs_write_end,
 		__entry->copied)
 );
 
-DECLARE_EVENT_CLASS(f2fs__page,
+DECLARE_EVENT_CLASS(f2fs__folio,
 
-	TP_PROTO(struct page *page, int type),
+	TP_PROTO(struct folio *folio, int type),
 
-	TP_ARGS(page, type),
+	TP_ARGS(folio, type),
 
 	TP_STRUCT__entry(
 		__field(dev_t,	dev)
@@ -1321,14 +1321,14 @@ DECLARE_EVENT_CLASS(f2fs__page,
 	),
 
 	TP_fast_assign(
-		__entry->dev	= page_file_mapping(page)->host->i_sb->s_dev;
-		__entry->ino	= page_file_mapping(page)->host->i_ino;
+		__entry->dev	= folio_file_mapping(folio)->host->i_sb->s_dev;
+		__entry->ino	= folio_file_mapping(folio)->host->i_ino;
 		__entry->type	= type;
 		__entry->dir	=
-			S_ISDIR(page_file_mapping(page)->host->i_mode);
-		__entry->index	= page->index;
-		__entry->dirty	= PageDirty(page);
-		__entry->uptodate = PageUptodate(page);
+			S_ISDIR(folio_file_mapping(folio)->host->i_mode);
+		__entry->index	= folio_index(folio);
+		__entry->dirty	= folio_test_dirty(folio);
+		__entry->uptodate = folio_test_uptodate(folio);
 	),
 
 	TP_printk("dev = (%d,%d), ino = %lu, %s, %s, index = %lu, "
@@ -1341,32 +1341,32 @@ DECLARE_EVENT_CLASS(f2fs__page,
 		__entry->uptodate)
 );
 
-DEFINE_EVENT(f2fs__page, f2fs_writepage,
+DEFINE_EVENT(f2fs__folio, f2fs_writepage,
 
-	TP_PROTO(struct page *page, int type),
+	TP_PROTO(struct folio *folio, int type),
 
-	TP_ARGS(page, type)
+	TP_ARGS(folio, type)
 );
 
-DEFINE_EVENT(f2fs__page, f2fs_do_write_data_page,
+DEFINE_EVENT(f2fs__folio, f2fs_do_write_data_page,
 
-	TP_PROTO(struct page *page, int type),
+	TP_PROTO(struct folio *folio, int type),
 
-	TP_ARGS(page, type)
+	TP_ARGS(folio, type)
 );
 
-DEFINE_EVENT(f2fs__page, f2fs_readpage,
+DEFINE_EVENT(f2fs__folio, f2fs_readpage,
 
-	TP_PROTO(struct page *page, int type),
+	TP_PROTO(struct folio *folio, int type),
 
-	TP_ARGS(page, type)
+	TP_ARGS(folio, type)
 );
 
-DEFINE_EVENT(f2fs__page, f2fs_set_page_dirty,
+DEFINE_EVENT(f2fs__folio, f2fs_set_page_dirty,
 
-	TP_PROTO(struct page *page, int type),
+	TP_PROTO(struct folio *folio, int type),
 
-	TP_ARGS(page, type)
+	TP_ARGS(folio, type)
 );
 
 TRACE_EVENT(f2fs_replace_atomic_write_block,
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
