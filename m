Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA96595AA38
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Aug 2024 03:29:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sgwe9-0002uq-Ez;
	Thu, 22 Aug 2024 01:29:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lizetao1@huawei.com>) id 1sgwe8-0002ug-3W
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 01:29:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ivs1xyjD4VeuwWZ8XWhDB1sEjfAkoDI4wWP2AQWxYMY=; b=de6wRuXfMg7pl490eTRPFpzcGC
 Z9pbcKQfuCc7w6iaMz+67sA7ZT4OWk3fIyx2GlMhrRmPirIJqjI+0DLsYB5GyHXHBTGLl/IqUmOQo
 9bChQwBM/QGaPt6GhzIgbqeKGJ53UOcT1SUY3UbFB+bJuPA95XiqqBqryLfrwUqQrrE0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ivs1xyjD4VeuwWZ8XWhDB1sEjfAkoDI4wWP2AQWxYMY=; b=C4NTzrGDdeGPOmDyfG16FCSHpQ
 t6HbGAg4yIDVktiP5mcJC6180HpZPO/GojmB+Qv39dU3nqpKW8HvrSxQErgkwuj65ajyPTjbMl16o
 4pqM2/NE/iUH7ZsU2eovtcBH4XouVJnmkh2EFqFUYWXxwRMgezB9CE2aXmgHAUQ/W/mE=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sgwe6-0006bv-Oi for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 01:29:52 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Wq5Dq3CgnzpTZC;
 Thu, 22 Aug 2024 09:28:11 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id BB3DC1404A6;
 Thu, 22 Aug 2024 09:29:43 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Thu, 22 Aug
 2024 09:29:43 +0800
To: <clm@fb.com>, <josef@toxicpanda.com>, <dsterba@suse.com>, <terrelln@fb.com>
Date: Thu, 22 Aug 2024 09:37:12 +0800
Message-ID: <20240822013714.3278193-13-lizetao1@huawei.com>
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
 page and folio. And memcpy_to_page() can be replaced with memc [...] 
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [45.249.212.188 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.188 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.188 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.188 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1sgwe6-0006bv-Oi
Subject: [f2fs-dev] [PATCH 12/14] btrfs: convert zstd_decompress() to take a
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
From: Li Zetao via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Li Zetao <lizetao1@huawei.com>
Cc: linux-btrfs@vger.kernel.org, willy@infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The old page API is being gradually replaced and converted to use folio
to improve code readability and avoid repeated conversion between page
and folio. And memcpy_to_page() can be replaced with memcpy_to_folio().
But there is no memzero_folio(), but it can be replaced equivalently by
folio_zero_range().

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 fs/btrfs/compression.c |  2 +-
 fs/btrfs/compression.h |  2 +-
 fs/btrfs/zstd.c        | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/btrfs/compression.c b/fs/btrfs/compression.c
index 8e67203ab97d..eab79edeb64c 100644
--- a/fs/btrfs/compression.c
+++ b/fs/btrfs/compression.c
@@ -146,7 +146,7 @@ static int compression_decompress(int type, struct list_head *ws,
 						dest_pgoff, srclen, destlen);
 	case BTRFS_COMPRESS_LZO:  return lzo_decompress(ws, data_in, page_folio(dest_page),
 						dest_pgoff, srclen, destlen);
-	case BTRFS_COMPRESS_ZSTD: return zstd_decompress(ws, data_in, dest_page,
+	case BTRFS_COMPRESS_ZSTD: return zstd_decompress(ws, data_in, page_folio(dest_page),
 						dest_pgoff, srclen, destlen);
 	case BTRFS_COMPRESS_NONE:
 	default:
diff --git a/fs/btrfs/compression.h b/fs/btrfs/compression.h
index 4b5a7ba54815..d2453cf28eef 100644
--- a/fs/btrfs/compression.h
+++ b/fs/btrfs/compression.h
@@ -183,7 +183,7 @@ int zstd_compress_folios(struct list_head *ws, struct address_space *mapping,
 		unsigned long *total_in, unsigned long *total_out);
 int zstd_decompress_bio(struct list_head *ws, struct compressed_bio *cb);
 int zstd_decompress(struct list_head *ws, const u8 *data_in,
-		struct page *dest_page, unsigned long dest_pgoff, size_t srclen,
+		struct folio *dest_folio, unsigned long dest_pgoff, size_t srclen,
 		size_t destlen);
 void zstd_init_workspace_manager(void);
 void zstd_cleanup_workspace_manager(void);
diff --git a/fs/btrfs/zstd.c b/fs/btrfs/zstd.c
index 05cf7cebc17c..866607fd3e58 100644
--- a/fs/btrfs/zstd.c
+++ b/fs/btrfs/zstd.c
@@ -656,11 +656,11 @@ int zstd_decompress_bio(struct list_head *ws, struct compressed_bio *cb)
 }
 
 int zstd_decompress(struct list_head *ws, const u8 *data_in,
-		struct page *dest_page, unsigned long dest_pgoff, size_t srclen,
+		struct folio *dest_folio, unsigned long dest_pgoff, size_t srclen,
 		size_t destlen)
 {
 	struct workspace *workspace = list_entry(ws, struct workspace, list);
-	struct btrfs_fs_info *fs_info = btrfs_sb(dest_page->mapping->host->i_sb);
+	struct btrfs_fs_info *fs_info = btrfs_sb(folio_inode(dest_folio)->i_sb);
 	const u32 sectorsize = fs_info->sectorsize;
 	zstd_dstream *stream;
 	int ret = 0;
@@ -669,12 +669,12 @@ int zstd_decompress(struct list_head *ws, const u8 *data_in,
 	stream = zstd_init_dstream(
 			ZSTD_BTRFS_MAX_INPUT, workspace->mem, workspace->size);
 	if (unlikely(!stream)) {
-		struct btrfs_inode *inode = BTRFS_I(dest_page->mapping->host);
+		struct btrfs_inode *inode = folio_to_inode(dest_folio);
 
 		btrfs_err(inode->root->fs_info,
 		"zstd decompression init failed, root %llu inode %llu offset %llu",
 			  btrfs_root_id(inode->root), btrfs_ino(inode),
-			  page_offset(dest_page));
+			  folio_pos(dest_folio));
 		ret = -EIO;
 		goto finish;
 	}
@@ -693,21 +693,21 @@ int zstd_decompress(struct list_head *ws, const u8 *data_in,
 	 */
 	ret = zstd_decompress_stream(stream, &workspace->out_buf, &workspace->in_buf);
 	if (unlikely(zstd_is_error(ret))) {
-		struct btrfs_inode *inode = BTRFS_I(dest_page->mapping->host);
+		struct btrfs_inode *inode = folio_to_inode(dest_folio);
 
 		btrfs_err(inode->root->fs_info,
 		"zstd decompression failed, error %d root %llu inode %llu offset %llu",
 			  zstd_get_error_code(ret), btrfs_root_id(inode->root),
-			  btrfs_ino(inode), page_offset(dest_page));
+			  btrfs_ino(inode), folio_pos(dest_folio));
 		goto finish;
 	}
 	to_copy = workspace->out_buf.pos;
-	memcpy_to_page(dest_page, dest_pgoff, workspace->out_buf.dst, to_copy);
+	memcpy_to_folio(dest_folio, dest_pgoff, workspace->out_buf.dst, to_copy);
 finish:
 	/* Error or early end. */
 	if (unlikely(to_copy < destlen)) {
 		ret = -EIO;
-		memzero_page(dest_page, dest_pgoff + to_copy, destlen - to_copy);
+		folio_zero_range(dest_folio, dest_pgoff + to_copy, destlen - to_copy);
 	}
 	return ret;
 }
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
