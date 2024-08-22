Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD5695AA48
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Aug 2024 03:30:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sgweU-0002y2-G3;
	Thu, 22 Aug 2024 01:30:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lizetao1@huawei.com>) id 1sgweD-0002vh-GU
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 01:29:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YipowFvU9A/GEcx6MlP8N8S95vTRH8p6e2ozHvWJbX8=; b=mcevjkPBkfp4CXs5Q2PWY0uF+8
 3NQ38vnnurFrIgKJSOr90SGteuBY4VkVVBgUZDtn5RdnIOV4Bnfz+TSgwglqwmxMAy0+vkybzJ3W9
 vmhdRZWKwnELuZHj8AeO93Hp/8fjlO3jj8KkdBQwLJAvGShKBTTIE775oSm/+cuwW6iQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YipowFvU9A/GEcx6MlP8N8S95vTRH8p6e2ozHvWJbX8=; b=ZU0rt5/YiXxyj0HN6hnMV2zdHr
 wdYEduU7Tnx7l3IHC1WwvFsbyudm2LbWzXmj7BBuVH8xBgyYSAHY9WaS8Afgo0qv4dc5CJE0cagGB
 mQvMGdl4PlFnztGLEDj6ztVYN2IwpzFzCiRvxIblXTbdv3Yr0HEC/hGeato9ubmCEzKM=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sgweC-0006cK-CY for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 01:29:57 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Wq5DH5KK5zhY5Y;
 Thu, 22 Aug 2024 09:27:43 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id 942941800D3;
 Thu, 22 Aug 2024 09:29:44 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Thu, 22 Aug
 2024 09:29:44 +0800
To: <clm@fb.com>, <josef@toxicpanda.com>, <dsterba@suse.com>, <terrelln@fb.com>
Date: Thu, 22 Aug 2024 09:37:14 +0800
Message-ID: <20240822013714.3278193-15-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822013714.3278193-1-lizetao1@huawei.com>
References: <20240822013714.3278193-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd500012.china.huawei.com (7.221.188.25)
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The old page API is being gradually replaced and converted
 to use folio to improve code readability and avoid repeated conversion between
 page and folio. Moreover find_or_create_page() is compatible A [...] 
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.188 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.188 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.188 listed in sa-accredit.habeas.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [45.249.212.188 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1sgweC-0006cK-CY
Subject: [f2fs-dev] [PATCH 14/14] btrfs: convert copy_inline_to_page() to
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
From: Li Zetao via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Li Zetao <lizetao1@huawei.com>
Cc: linux-btrfs@vger.kernel.org, willy@infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The old page API is being gradually replaced and converted to use folio
to improve code readability and avoid repeated conversion between page
and folio. Moreover find_or_create_page() is compatible API, and it can
replaced with __filemap_get_folio(). Some interfaces have been converted
to use folio before, so the conversion operation from page can be
eliminated here.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 fs/btrfs/reflink.c | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/fs/btrfs/reflink.c b/fs/btrfs/reflink.c
index b768e590a44c..1681d63f03dd 100644
--- a/fs/btrfs/reflink.c
+++ b/fs/btrfs/reflink.c
@@ -66,7 +66,7 @@ static int copy_inline_to_page(struct btrfs_inode *inode,
 	const size_t inline_size = size - btrfs_file_extent_calc_inline_size(0);
 	char *data_start = inline_data + btrfs_file_extent_calc_inline_size(0);
 	struct extent_changeset *data_reserved = NULL;
-	struct page *page = NULL;
+	struct folio *folio = NULL;
 	struct address_space *mapping = inode->vfs_inode.i_mapping;
 	int ret;
 
@@ -83,14 +83,15 @@ static int copy_inline_to_page(struct btrfs_inode *inode,
 	if (ret)
 		goto out;
 
-	page = find_or_create_page(mapping, file_offset >> PAGE_SHIFT,
-				   btrfs_alloc_write_mask(mapping));
-	if (!page) {
+	folio = __filemap_get_folio(mapping, file_offset >> PAGE_SHIFT,
+					FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
+					btrfs_alloc_write_mask(mapping));
+	if (IS_ERR(folio)) {
 		ret = -ENOMEM;
 		goto out_unlock;
 	}
 
-	ret = set_page_extent_mapped(page);
+	ret = set_folio_extent_mapped(folio);
 	if (ret < 0)
 		goto out_unlock;
 
@@ -115,15 +116,15 @@ static int copy_inline_to_page(struct btrfs_inode *inode,
 	set_bit(BTRFS_INODE_NO_DELALLOC_FLUSH, &inode->runtime_flags);
 
 	if (comp_type == BTRFS_COMPRESS_NONE) {
-		memcpy_to_page(page, offset_in_page(file_offset), data_start,
-			       datal);
+		memcpy_to_folio(folio, offset_in_folio(folio, file_offset), data_start,
+					datal);
 	} else {
-		ret = btrfs_decompress(comp_type, data_start, page_folio(page),
-				       offset_in_page(file_offset),
+		ret = btrfs_decompress(comp_type, data_start, folio,
+				       offset_in_folio(folio, file_offset),
 				       inline_size, datal);
 		if (ret)
 			goto out_unlock;
-		flush_dcache_page(page);
+		flush_dcache_folio(folio);
 	}
 
 	/*
@@ -139,15 +140,15 @@ static int copy_inline_to_page(struct btrfs_inode *inode,
 	 * So what's in the range [500, 4095] corresponds to zeroes.
 	 */
 	if (datal < block_size)
-		memzero_page(page, datal, block_size - datal);
+		folio_zero_range(folio, datal, block_size - datal);
 
-	btrfs_folio_set_uptodate(fs_info, page_folio(page), file_offset, block_size);
-	btrfs_folio_clear_checked(fs_info, page_folio(page), file_offset, block_size);
-	btrfs_folio_set_dirty(fs_info, page_folio(page), file_offset, block_size);
+	btrfs_folio_set_uptodate(fs_info, folio, file_offset, block_size);
+	btrfs_folio_clear_checked(fs_info, folio, file_offset, block_size);
+	btrfs_folio_set_dirty(fs_info, folio, file_offset, block_size);
 out_unlock:
-	if (page) {
-		unlock_page(page);
-		put_page(page);
+	if (IS_ERR(folio)) {
+		folio_unlock(folio);
+		folio_put(folio);
 	}
 	if (ret)
 		btrfs_delalloc_release_space(inode, data_reserved, file_offset,
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
