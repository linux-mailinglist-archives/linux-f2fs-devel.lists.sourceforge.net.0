Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4096995AA46
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Aug 2024 03:30:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sgweR-0002Kh-K8;
	Thu, 22 Aug 2024 01:30:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lizetao1@huawei.com>) id 1sgweD-0002Io-Ga
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 01:29:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f7M7Py0SsoPuTwCr007Kr49KwB+fGw5O6vA5toA7ZBA=; b=FdcTFrUA+wGHVLLYyOxXnKvDhI
 bsxgULZzYJXFx8tOX8zL4qWj6Ee2KUkRxSPc+0UBkXr278FLkaenJIP+uZsJr8ROcvoM8UhJ/ITmZ
 e/F8UBYd9jqgYqJFLg/r9GR0TS0q5AvvC6zxcgAOXtY2mHlKJn19SdOTqBEyXzm5UJ58=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f7M7Py0SsoPuTwCr007Kr49KwB+fGw5O6vA5toA7ZBA=; b=Wf22ng3RB0LpNFJDqDAdC785N+
 IMQWKF9A8P4lLZljDbhdpykK77iyyHBEad8EPjT6YgQv1MAVIAMKu//SyRLUUX8mXGgP8qaCKnCfo
 cVBrJsKjfE5kRl164xHnNA/m8+wBoB6WvXKdsoziRQW0zf/y/hj8aCxX7JEXWAmwcErQ=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sgweB-0006cI-OC for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 01:29:56 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Wq5GY0jV0z2Cn8v;
 Thu, 22 Aug 2024 09:29:41 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id 313851400FD;
 Thu, 22 Aug 2024 09:29:44 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Thu, 22 Aug
 2024 09:29:43 +0800
To: <clm@fb.com>, <josef@toxicpanda.com>, <dsterba@suse.com>, <terrelln@fb.com>
Date: Thu, 22 Aug 2024 09:37:13 +0800
Message-ID: <20240822013714.3278193-14-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822013714.3278193-1-lizetao1@huawei.com>
References: <20240822013714.3278193-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd500012.china.huawei.com (7.221.188.25)
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The old page API is being gradually replaced and converted
 to use folio to improve code readability and avoid repeated conversion between
 page and folio. Based on the previous patch, the compression p [...] 
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [45.249.212.190 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.190 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.190 listed in sa-accredit.habeas.com]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sgweB-0006cI-OC
Subject: [f2fs-dev] [PATCH 13/14] btrfs: convert btrfs_decompress() to take
 a folio
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
From: Li Zetao via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Li Zetao <lizetao1@huawei.com>
Cc: linux-btrfs@vger.kernel.org, willy@infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The old page API is being gradually replaced and converted to use folio
to improve code readability and avoid repeated conversion between page
and folio. Based on the previous patch, the compression path can be
directly used in folio without converting to page.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 fs/btrfs/compression.c | 14 +++++++-------
 fs/btrfs/compression.h |  2 +-
 fs/btrfs/inode.c       |  2 +-
 fs/btrfs/reflink.c     |  2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/btrfs/compression.c b/fs/btrfs/compression.c
index eab79edeb64c..9869944a5acc 100644
--- a/fs/btrfs/compression.c
+++ b/fs/btrfs/compression.c
@@ -138,15 +138,15 @@ static int compression_decompress_bio(struct list_head *ws,
 }
 
 static int compression_decompress(int type, struct list_head *ws,
-		const u8 *data_in, struct page *dest_page,
+		const u8 *data_in, struct folio *dest_folio,
 		unsigned long dest_pgoff, size_t srclen, size_t destlen)
 {
 	switch (type) {
-	case BTRFS_COMPRESS_ZLIB: return zlib_decompress(ws, data_in, page_folio(dest_page),
+	case BTRFS_COMPRESS_ZLIB: return zlib_decompress(ws, data_in, dest_folio,
 						dest_pgoff, srclen, destlen);
-	case BTRFS_COMPRESS_LZO:  return lzo_decompress(ws, data_in, page_folio(dest_page),
+	case BTRFS_COMPRESS_LZO:  return lzo_decompress(ws, data_in, dest_folio,
 						dest_pgoff, srclen, destlen);
-	case BTRFS_COMPRESS_ZSTD: return zstd_decompress(ws, data_in, page_folio(dest_page),
+	case BTRFS_COMPRESS_ZSTD: return zstd_decompress(ws, data_in, dest_folio,
 						dest_pgoff, srclen, destlen);
 	case BTRFS_COMPRESS_NONE:
 	default:
@@ -1061,10 +1061,10 @@ static int btrfs_decompress_bio(struct compressed_bio *cb)
  * single page, and we want to read a single page out of it.
  * start_byte tells us the offset into the compressed data we're interested in
  */
-int btrfs_decompress(int type, const u8 *data_in, struct page *dest_page,
+int btrfs_decompress(int type, const u8 *data_in, struct folio *dest_folio,
 		     unsigned long dest_pgoff, size_t srclen, size_t destlen)
 {
-	struct btrfs_fs_info *fs_info = page_to_fs_info(dest_page);
+	struct btrfs_fs_info *fs_info = folio_to_fs_info(dest_folio);
 	struct list_head *workspace;
 	const u32 sectorsize = fs_info->sectorsize;
 	int ret;
@@ -1077,7 +1077,7 @@ int btrfs_decompress(int type, const u8 *data_in, struct page *dest_page,
 	ASSERT(dest_pgoff + destlen <= PAGE_SIZE && destlen <= sectorsize);
 
 	workspace = get_workspace(type, 0);
-	ret = compression_decompress(type, workspace, data_in, dest_page,
+	ret = compression_decompress(type, workspace, data_in, dest_folio,
 				     dest_pgoff, srclen, destlen);
 	put_workspace(type, workspace);
 
diff --git a/fs/btrfs/compression.h b/fs/btrfs/compression.h
index d2453cf28eef..b6563b6a333e 100644
--- a/fs/btrfs/compression.h
+++ b/fs/btrfs/compression.h
@@ -96,7 +96,7 @@ void __cold btrfs_exit_compress(void);
 int btrfs_compress_folios(unsigned int type_level, struct address_space *mapping,
 			  u64 start, struct folio **folios, unsigned long *out_folios,
 			 unsigned long *total_in, unsigned long *total_out);
-int btrfs_decompress(int type, const u8 *data_in, struct page *dest_page,
+int btrfs_decompress(int type, const u8 *data_in, struct folio *dest_folio,
 		     unsigned long start_byte, size_t srclen, size_t destlen);
 int btrfs_decompress_buf2page(const char *buf, u32 buf_len,
 			      struct compressed_bio *cb, u32 decompressed);
diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index e844c409c12a..f9ade617700f 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -6746,7 +6746,7 @@ static noinline int uncompress_inline(struct btrfs_path *path,
 	read_extent_buffer(leaf, tmp, ptr, inline_size);
 
 	max_size = min_t(unsigned long, PAGE_SIZE, max_size);
-	ret = btrfs_decompress(compress_type, tmp, &folio->page, 0, inline_size,
+	ret = btrfs_decompress(compress_type, tmp, folio, 0, inline_size,
 			       max_size);
 
 	/*
diff --git a/fs/btrfs/reflink.c b/fs/btrfs/reflink.c
index df6b93b927cd..b768e590a44c 100644
--- a/fs/btrfs/reflink.c
+++ b/fs/btrfs/reflink.c
@@ -118,7 +118,7 @@ static int copy_inline_to_page(struct btrfs_inode *inode,
 		memcpy_to_page(page, offset_in_page(file_offset), data_start,
 			       datal);
 	} else {
-		ret = btrfs_decompress(comp_type, data_start, page,
+		ret = btrfs_decompress(comp_type, data_start, page_folio(page),
 				       offset_in_page(file_offset),
 				       inline_size, datal);
 		if (ret)
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
