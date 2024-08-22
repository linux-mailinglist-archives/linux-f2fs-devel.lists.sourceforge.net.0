Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE17B95AA36
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Aug 2024 03:29:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sgwe8-0002ub-2Z;
	Thu, 22 Aug 2024 01:29:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lizetao1@huawei.com>) id 1sgwe4-0002uU-Mu
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 01:29:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uWt/FB++UE/QihX1QoEMwvPJnjS3zRJ6b9vVA98DcX0=; b=ixfFzaxdJdjp2kmqle6Jty9+1a
 UbUVOFYK7AWACfGeBc9D6oAezqHn478q9zI92kDfOq79ntYZuosLIQlKOe8+Z8nqVlS35W905ZrQ5
 zPHofVOYZ3yqY8c9k0mmupOTKmu4A/U8wMO8iGjmdII3pVL9yDNfxBshVfMh6ki1EJHc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uWt/FB++UE/QihX1QoEMwvPJnjS3zRJ6b9vVA98DcX0=; b=TD+DY62R9OV/+/ZfOtkhonAWmN
 FI/gdeaP3GlqG67HYDxeOvrwIBm/y7AMWuZQ/lABNTooKKhRFz2fUDu7l8ZM+DNvtIHXHqZXVyZKh
 CPazO6N32IRwyhcnS38w0YMSbRkxpS8CoXU4RmC2iEtdYZJYXaXEMJMbCYz3+fMkX0qE=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sgwe3-0006bp-Gr for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 01:29:48 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Wq5G45pflzyR8j;
 Thu, 22 Aug 2024 09:29:16 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id 1CB5C180087;
 Thu, 22 Aug 2024 09:29:40 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Thu, 22 Aug
 2024 09:29:39 +0800
To: <clm@fb.com>, <josef@toxicpanda.com>, <dsterba@suse.com>, <terrelln@fb.com>
Date: Thu, 22 Aug 2024 09:37:03 +0800
Message-ID: <20240822013714.3278193-4-lizetao1@huawei.com>
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
 page and folio. And use folio_pos instend of page_offset, whic [...] 
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [45.249.212.187 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.187 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.187 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.187 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1sgwe3-0006bp-Gr
Subject: [f2fs-dev] [PATCH 03/14] btrfs: convert
 try_release_subpage_extent_buffer() to take a folio
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
and folio. And use folio_pos instend of page_offset, which is more
consistent with folio usage. At the same time, folio_test_private can
handle folio directly without converting from page to folio first.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 fs/btrfs/extent_io.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index b9d159fcbbc5..77c1f69f4229 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -4171,11 +4171,11 @@ static struct extent_buffer *get_next_extent_buffer(
 	return found;
 }
 
-static int try_release_subpage_extent_buffer(struct page *page)
+static int try_release_subpage_extent_buffer(struct folio *folio)
 {
-	struct btrfs_fs_info *fs_info = page_to_fs_info(page);
-	u64 cur = page_offset(page);
-	const u64 end = page_offset(page) + PAGE_SIZE;
+	struct btrfs_fs_info *fs_info = folio_to_fs_info(folio);
+	u64 cur = folio_pos(folio);
+	const u64 end = cur + PAGE_SIZE;
 	int ret;
 
 	while (cur < end) {
@@ -4190,7 +4190,7 @@ static int try_release_subpage_extent_buffer(struct page *page)
 		 * with spinlock rather than RCU.
 		 */
 		spin_lock(&fs_info->buffer_lock);
-		eb = get_next_extent_buffer(fs_info, page_folio(page), cur);
+		eb = get_next_extent_buffer(fs_info, folio, cur);
 		if (!eb) {
 			/* No more eb in the page range after or at cur */
 			spin_unlock(&fs_info->buffer_lock);
@@ -4231,12 +4231,12 @@ static int try_release_subpage_extent_buffer(struct page *page)
 	 * Finally to check if we have cleared folio private, as if we have
 	 * released all ebs in the page, the folio private should be cleared now.
 	 */
-	spin_lock(&page->mapping->i_private_lock);
-	if (!folio_test_private(page_folio(page)))
+	spin_lock(&folio->mapping->i_private_lock);
+	if (!folio_test_private(folio))
 		ret = 1;
 	else
 		ret = 0;
-	spin_unlock(&page->mapping->i_private_lock);
+	spin_unlock(&folio->mapping->i_private_lock);
 	return ret;
 
 }
@@ -4247,7 +4247,7 @@ int try_release_extent_buffer(struct page *page)
 	struct extent_buffer *eb;
 
 	if (page_to_fs_info(page)->nodesize < PAGE_SIZE)
-		return try_release_subpage_extent_buffer(page);
+		return try_release_subpage_extent_buffer(page_folio(page));
 
 	/*
 	 * We need to make sure nobody is changing folio private, as we rely on
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
