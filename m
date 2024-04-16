Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 807308A64FD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Apr 2024 09:23:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rwdAO-0003UG-9b;
	Tue, 16 Apr 2024 07:23:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rwdAL-0003Ty-W2
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Apr 2024 07:23:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rtVUkBTJcjSa+L7EdHisHuloTjpcZUPXL+TsgrMn0bY=; b=IM6SsyLt6NVPDhyr+w00G9tbrN
 0sT6+jRiyTqV21Ia+2jrWMaUkGInBr2Db/98kmCStIQlelMtNzqD9i1XsLYnf4U0lJ20NBEbf1KaH
 iMddwEKO6DpiACyJe76k55ryTlYdHCXLVtYRzdV4knX03bJLl8eH5EOqUv3T41Yj1yWc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rtVUkBTJcjSa+L7EdHisHuloTjpcZUPXL+TsgrMn0bY=; b=U
 NiZVFwUPGs/JO506hNQ3b7Y926BJ/02wKIjNUAoPoDGzTqzCPtS/YniMbzE9PxgGWibeFo8IryvX2
 KmOWJdftwryrbsKd7yDAiSEGgDVmyLpvqmQgZjUWhJ54Q0xEsIynnkgGgaI3PXppsQOFeNcgNeopV
 lh6N1FpBFbAE9xRI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rwdAM-0002xr-3O for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Apr 2024 07:23:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 97EB360AB6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Apr 2024 07:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFFBCC113CE;
 Tue, 16 Apr 2024 07:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713252211;
 bh=i3fSC2Sh/bh/pxYyReh8mIapiLEcvyOrjS7DPGLwxGg=;
 h=From:To:Cc:Subject:Date:From;
 b=pmzRrNAn/c99ECm+p/63BcBUXJBAOvsCcC0qPDo6usf22bxfystbdB+0IXl5k6KKr
 CMgYFlwRYQ0oyci0aN29K4ii7j6Jn80azXZapmjhevKloLQ0/SLH5+SuTnAyYwHdcj
 MNaHVb9ak8i3ZnYWY96+CMb+yFWMSgcqn8XN+BETuOo+KdjAVRLtZaoSNGqLXYndY+
 kjjZ3ZjfsFFgvK0QoKV1JnvILvgRQut30UcqNgc5B5XE4qVxXSSd6ggg7kvX3O6DU2
 u+ybA9Vn3/zO64Bl8ln8HR/3A3pmNOtpysmQvEQ+SlYLJAOCU90aM3wuxReBspWLEw
 vWS+cgEPombzw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 16 Apr 2024 15:23:15 +0800
Message-Id: <20240416072318.6486-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -2.4 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Convert f2fs_mpage_readpages() to use folio and related
 functionality.
 Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/data.c | 80
 +++++++++++++++++++++++++
 1 file changed, 40 insertions(+), 40 deletions(-) 
 Content analysis details:   (-2.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rwdAM-0002xr-3O
Subject: [f2fs-dev] [PATCH 1/4] f2fs: convert f2fs_mpage_readpages() to use
 folio
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

Convert f2fs_mpage_readpages() to use folio and related
functionality.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 80 +++++++++++++++++++++++++-------------------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 9c5512be1a1b..14dcd621acaa 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2374,7 +2374,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
  * Major change was from block_size == page_size in f2fs by default.
  */
 static int f2fs_mpage_readpages(struct inode *inode,
-		struct readahead_control *rac, struct page *page)
+		struct readahead_control *rac, struct folio *folio)
 {
 	struct bio *bio = NULL;
 	sector_t last_block_in_bio = 0;
@@ -2394,6 +2394,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
 #endif
 	unsigned nr_pages = rac ? readahead_count(rac) : 1;
 	unsigned max_nr_pages = nr_pages;
+	pgoff_t index;
 	int ret = 0;
 
 	map.m_pblk = 0;
@@ -2407,64 +2408,63 @@ static int f2fs_mpage_readpages(struct inode *inode,
 
 	for (; nr_pages; nr_pages--) {
 		if (rac) {
-			page = readahead_page(rac);
-			prefetchw(&page->flags);
+			folio = readahead_folio(rac);
+			prefetchw(&folio->flags);
 		}
 
-#ifdef CONFIG_F2FS_FS_COMPRESSION
-		if (f2fs_compressed_file(inode)) {
-			/* there are remained compressed pages, submit them */
-			if (!f2fs_cluster_can_merge_page(&cc, page->index)) {
-				ret = f2fs_read_multi_pages(&cc, &bio,
-							max_nr_pages,
-							&last_block_in_bio,
-							rac != NULL, false);
-				f2fs_destroy_compress_ctx(&cc, false);
-				if (ret)
-					goto set_error_page;
-			}
-			if (cc.cluster_idx == NULL_CLUSTER) {
-				if (nc_cluster_idx ==
-					page->index >> cc.log_cluster_size) {
-					goto read_single_page;
-				}
-
-				ret = f2fs_is_compressed_cluster(inode, page->index);
-				if (ret < 0)
-					goto set_error_page;
-				else if (!ret) {
-					nc_cluster_idx =
-						page->index >> cc.log_cluster_size;
-					goto read_single_page;
-				}
+		index = folio_index(folio);
 
-				nc_cluster_idx = NULL_CLUSTER;
-			}
-			ret = f2fs_init_compress_ctx(&cc);
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+		if (!f2fs_compressed_file(inode))
+			goto read_single_page;
+
+		/* there are remained compressed pages, submit them */
+		if (!f2fs_cluster_can_merge_page(&cc, index)) {
+			ret = f2fs_read_multi_pages(&cc, &bio,
+						max_nr_pages,
+						&last_block_in_bio,
+						rac != NULL, false);
+			f2fs_destroy_compress_ctx(&cc, false);
 			if (ret)
 				goto set_error_page;
+		}
+		if (cc.cluster_idx == NULL_CLUSTER) {
+			if (nc_cluster_idx == index >> cc.log_cluster_size)
+				goto read_single_page;
 
-			f2fs_compress_ctx_add_page(&cc, page);
+			ret = f2fs_is_compressed_cluster(inode, index);
+			if (ret < 0)
+				goto set_error_page;
+			else if (!ret) {
+				nc_cluster_idx =
+					index >> cc.log_cluster_size;
+				goto read_single_page;
+			}
 
-			goto next_page;
+			nc_cluster_idx = NULL_CLUSTER;
 		}
+		ret = f2fs_init_compress_ctx(&cc);
+		if (ret)
+			goto set_error_page;
+
+		f2fs_compress_ctx_add_page(&cc, &folio->page);
+
+		goto next_page;
 read_single_page:
 #endif
 
-		ret = f2fs_read_single_page(inode, page, max_nr_pages, &map,
+		ret = f2fs_read_single_page(inode, &folio->page, max_nr_pages, &map,
 					&bio, &last_block_in_bio, rac);
 		if (ret) {
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 set_error_page:
 #endif
-			zero_user_segment(page, 0, PAGE_SIZE);
-			unlock_page(page);
+			folio_zero_segment(folio, 0, folio_size(folio));
+			folio_unlock(folio);
 		}
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 next_page:
 #endif
-		if (rac)
-			put_page(page);
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 		if (f2fs_compressed_file(inode)) {
@@ -2501,7 +2501,7 @@ static int f2fs_read_data_folio(struct file *file, struct folio *folio)
 	if (f2fs_has_inline_data(inode))
 		ret = f2fs_read_inline_data(inode, page);
 	if (ret == -EAGAIN)
-		ret = f2fs_mpage_readpages(inode, NULL, page);
+		ret = f2fs_mpage_readpages(inode, NULL, folio);
 	return ret;
 }
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
