Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2B18A6502
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Apr 2024 09:23:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rwdAU-0006Tv-V0;
	Tue, 16 Apr 2024 07:23:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rwdAS-0006Tm-7o
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Apr 2024 07:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ahDPmM48SVsKHciiLhwBsgPpLCn75dWharEla/iJ/1M=; b=A9vnQxRx9t2CErL32MbiPU4UZO
 RXFtrHgdMaPQZbG0hywRYmMOWufvrLn0C8pVx1+ObBoY367+Ru5OvDp1RPIcizCYR+xtcRpViy5Bp
 LFy3BQMw3FRmYGwSI8+TOUX6VTOyg9st8VjbywpK6zsmek/O/LC7+DOMripIUesKyvTQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ahDPmM48SVsKHciiLhwBsgPpLCn75dWharEla/iJ/1M=; b=OdbC8CDkj5skZ7c44LF3MNXMOh
 jMXf2zAjD2E2ZhMfyGfeEGUqvwla88CmZCoWq68K0ig3pACiV7qk8mzODpSarCZM4lEG1ijxnNjhT
 8vGsOUkD3wKZTbiboq2k17hdKSB2pJxathFUEtaNI4PzddEp3zLnuRBtiMbmmbskSick=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rwdAR-0002yI-Mf for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Apr 2024 07:23:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 346AA60F0E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Apr 2024 07:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A21E4C32781;
 Tue, 16 Apr 2024 07:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713252217;
 bh=yUmaqz0X2leLyEtaGKKFRv7XkWM87V0UO7GQWcOJJgU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XNr7HcJx5M5YA+w5jFOmPY72vMb7k70IPgptRYiFc4faHnpDQpE67a9nGIM8jgYOq
 +4PqtM0v3T+Mec0qeWCD41e2oND6173A09YEnMf0TQa66AwKUwpCWYo8ZB7MhylIXw
 0uesNtuMjEdd68M7k0G90bPqmOxndJctPQdjSdak7omhbWDp21BxH1CFhp78EhxIPo
 6BT+MtPaFKuawTILlY6fCKFkz94sbW1YBN2KKVf2NBGRO+2JSv9f9IMvRNfb0LKgcG
 aryb9tGw9QVtMa22lJr0y5g1QxGdvmJJ84z9wreAVPa/0bT6R06S7XXrRGcBLZXqmu
 GinxU2m2lvHkA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 16 Apr 2024 15:23:18 +0800
Message-Id: <20240416072318.6486-4-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240416072318.6486-1-chao@kernel.org>
References: <20240416072318.6486-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.0 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert f2fs__page tracepoint class() and its instances to
 use folio and related functionality,
 and rename it to f2fs__folio(). Signed-off-by:
 Chao Yu <chao@kernel.org> --- fs/f2fs/checkpoint.c | 4 ++-- fs/f2fs/data.c
 | 10 ++++----- fs/f2fs/node.c | 4 ++-- include/trace/events/f2fs.h | 42
 ++++++++++++++++++ [...] 
 Content analysis details:   (-2.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rwdAR-0002yI-Mf
Subject: [f2fs-dev] [PATCH 4/4] f2fs: convert f2fs__page tracepoint class to
 use folio
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
index 3eb90b9b0f8b..cf6d31e3e630 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2490,7 +2490,7 @@ static int f2fs_read_data_folio(struct file *file, struct folio *folio)
 	struct inode *inode = folio_file_mapping(folio)->host;
 	int ret = -EAGAIN;
 
-	trace_f2fs_readpage(&folio->page, DATA);
+	trace_f2fs_readpage(folio, DATA);
 
 	if (!f2fs_is_compress_backend_ready(inode)) {
 		folio_unlock(folio);
@@ -2739,7 +2739,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		} else {
 			set_inode_flag(inode, FI_UPDATE_WRITE);
 		}
-		trace_f2fs_do_write_data_page(fio->page, IPU);
+		trace_f2fs_do_write_data_page(page_folio(page), IPU);
 		return err;
 	}
 
@@ -2768,7 +2768,7 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 
 	/* LFS mode write path */
 	f2fs_outplace_write_data(&dn, fio);
-	trace_f2fs_do_write_data_page(page, OPU);
+	trace_f2fs_do_write_data_page(page_folio(page), OPU);
 	set_inode_flag(inode, FI_APPEND_WRITE);
 out_writepage:
 	f2fs_put_dnode(&dn);
@@ -2815,7 +2815,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 		.last_block = last_block,
 	};
 
-	trace_f2fs_writepage(page, DATA);
+	trace_f2fs_writepage(page_folio(page), DATA);
 
 	/* we should bypass data pages to proceed the kworker jobs */
 	if (unlikely(f2fs_cp_error(sbi))) {
@@ -3789,7 +3789,7 @@ static bool f2fs_dirty_data_folio(struct address_space *mapping,
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
