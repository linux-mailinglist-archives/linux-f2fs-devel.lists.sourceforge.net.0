Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB7E95AA45
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Aug 2024 03:30:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sgweR-0002KN-0L;
	Thu, 22 Aug 2024 01:30:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lizetao1@huawei.com>) id 1sgwe9-0002Ia-W6
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 01:29:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ylNJxk9rBa8CXPxvZcCvTSGXlexatxCjYQC3hzNklu0=; b=FqBMsJAXj2EUka1mgBOZgfqlTc
 TAIR3viFeZryXfaFuYproVN8k3acBQ9ilJIRUT8094MH9LXK+XGHgIxTmda3ZJQE13OiXCpw37knQ
 WR8tfsfstPsmSOTiEKO2n1qyyS+GYGReehOrHjFQTE6ZT+nmObWnmcjdJCR3w/Easkk4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ylNJxk9rBa8CXPxvZcCvTSGXlexatxCjYQC3hzNklu0=; b=M0VeTYTwEOqLoTAHk4GbZ6s6XU
 kNwgkFDqelT1UBRXnd93TW5IGbVHa9EVdnVFX8depsWwIbt7Ix/1ynFxp20pVQT3IpNsCHw1z2jD3
 S5HvnrU/xZHlPuTzQwhafnwkQ+OMiFSXtI49vzrt5ArqWkl5BKmMBePM1033FEqMxvMY=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sgwe8-0006c0-CD for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 01:29:53 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Wq5G51c7KzyR80;
 Thu, 22 Aug 2024 09:29:17 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id 83B521800FF;
 Thu, 22 Aug 2024 09:29:40 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Thu, 22 Aug
 2024 09:29:39 +0800
To: <clm@fb.com>, <josef@toxicpanda.com>, <dsterba@suse.com>, <terrelln@fb.com>
Date: Thu, 22 Aug 2024 09:37:04 +0800
Message-ID: <20240822013714.3278193-5-lizetao1@huawei.com>
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
 page and folio. Signed-off-by: Li Zetao <lizetao1@huawei.com> ---
 fs/btrfs/disk-io.c
 | 2 +- fs/btrfs/extent_io.c | 15 +++++++-------- fs/btrfs/extent_io.h | 2
 +- 3 files changed, 9 insertions(+), 10 deletions(-) 
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.187 listed in sa-accredit.habeas.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [45.249.212.187 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.187 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.187 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1sgwe8-0006c0-CD
Subject: [f2fs-dev] [PATCH 04/14] btrfs: convert try_release_extent_buffer()
 to take a folio
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
and folio.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 fs/btrfs/disk-io.c   |  2 +-
 fs/btrfs/extent_io.c | 15 +++++++--------
 fs/btrfs/extent_io.h |  2 +-
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
index a6f5441e62d1..ca2f52a28fb0 100644
--- a/fs/btrfs/disk-io.c
+++ b/fs/btrfs/disk-io.c
@@ -525,7 +525,7 @@ static bool btree_release_folio(struct folio *folio, gfp_t gfp_flags)
 	if (folio_test_writeback(folio) || folio_test_dirty(folio))
 		return false;
 
-	return try_release_extent_buffer(&folio->page);
+	return try_release_extent_buffer(folio);
 }
 
 static void btree_invalidate_folio(struct folio *folio, size_t offset,
diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index 77c1f69f4229..a0102b9b67ff 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -4241,21 +4241,20 @@ static int try_release_subpage_extent_buffer(struct folio *folio)
 
 }
 
-int try_release_extent_buffer(struct page *page)
+int try_release_extent_buffer(struct folio *folio)
 {
-	struct folio *folio = page_folio(page);
 	struct extent_buffer *eb;
 
-	if (page_to_fs_info(page)->nodesize < PAGE_SIZE)
-		return try_release_subpage_extent_buffer(page_folio(page));
+	if (folio_to_fs_info(folio)->nodesize < PAGE_SIZE)
+		return try_release_subpage_extent_buffer(folio);
 
 	/*
 	 * We need to make sure nobody is changing folio private, as we rely on
 	 * folio private as the pointer to extent buffer.
 	 */
-	spin_lock(&page->mapping->i_private_lock);
+	spin_lock(&folio->mapping->i_private_lock);
 	if (!folio_test_private(folio)) {
-		spin_unlock(&page->mapping->i_private_lock);
+		spin_unlock(&folio->mapping->i_private_lock);
 		return 1;
 	}
 
@@ -4270,10 +4269,10 @@ int try_release_extent_buffer(struct page *page)
 	spin_lock(&eb->refs_lock);
 	if (atomic_read(&eb->refs) != 1 || extent_buffer_under_io(eb)) {
 		spin_unlock(&eb->refs_lock);
-		spin_unlock(&page->mapping->i_private_lock);
+		spin_unlock(&folio->mapping->i_private_lock);
 		return 0;
 	}
-	spin_unlock(&page->mapping->i_private_lock);
+	spin_unlock(&folio->mapping->i_private_lock);
 
 	/*
 	 * If tree ref isn't set then we know the ref on this eb is a real ref,
diff --git a/fs/btrfs/extent_io.h b/fs/btrfs/extent_io.h
index 236da2231a0e..f4c93ca46bdd 100644
--- a/fs/btrfs/extent_io.h
+++ b/fs/btrfs/extent_io.h
@@ -237,7 +237,7 @@ static inline void extent_changeset_free(struct extent_changeset *changeset)
 }
 
 bool try_release_extent_mapping(struct page *page, gfp_t mask);
-int try_release_extent_buffer(struct page *page);
+int try_release_extent_buffer(struct folio *folio);
 
 int btrfs_read_folio(struct file *file, struct folio *folio);
 void extent_write_locked_range(struct inode *inode, const struct folio *locked_folio,
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
