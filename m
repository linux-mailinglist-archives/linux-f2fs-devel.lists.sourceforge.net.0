Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 244B095AA3D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Aug 2024 03:29:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sgweC-0003Ys-TQ;
	Thu, 22 Aug 2024 01:29:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lizetao1@huawei.com>) id 1sgweB-0003YV-MH
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 01:29:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J63If87hVIuHjNt9QKFABY3dpsWo54CKym+jHnW8ez0=; b=JtuY9Ni3p9PE6ZVzCAPftFVmNr
 ZLs8NTV8FFfufJgSUcMbP6vxq7QGhVju1MtO9NsbPECwB7kV8KriRjObA7GrMptXCJm0k99yDxmJd
 VglIRCD+RH6lenMlD7sBe5L5rea5q9lq8ek3Nup/JCCSfbPL1m4mIcYXhdqZx0u3xAes=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J63If87hVIuHjNt9QKFABY3dpsWo54CKym+jHnW8ez0=; b=kuGCudoA47K4/efNJPcoCB+s50
 AyQwdPj0jdr0yq3PFnEMuLXpez8ZPOza4qn2/I8BqWuzIsOcfMlymHS7YXlxTpcID8r6Y2qlFK1Kj
 DN/I4nb/QCBFkTI1LEi+z/U1RtiIhqHbXxW1FGuXttmafqF7TnZrmoIsEmQk8nHSPWLE=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sgweA-0006c8-NW for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 01:29:55 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Wq5GV6PHbz1S8V0;
 Thu, 22 Aug 2024 09:29:38 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id 8DFC11400FD;
 Thu, 22 Aug 2024 09:29:42 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Thu, 22 Aug
 2024 09:29:42 +0800
To: <clm@fb.com>, <josef@toxicpanda.com>, <dsterba@suse.com>, <terrelln@fb.com>
Date: Thu, 22 Aug 2024 09:37:09 +0800
Message-ID: <20240822013714.3278193-10-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822013714.3278193-1-lizetao1@huawei.com>
References: <20240822013714.3278193-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd500012.china.huawei.com (7.221.188.25)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The old page API is being gradually replaced and converted
 to use folio to improve code readability and avoid repeated conversion between
 page and folio. And page_to_inode() can be replaced with folio [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [45.249.212.35 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.35 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.35 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sgweA-0006c8-NW
Subject: [f2fs-dev] [PATCH 09/14] btrfs: convert
 try_release_extent_mapping() to take a folio
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
and folio. And page_to_inode() can be replaced with folio_to_inode() now.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 fs/btrfs/extent_io.c | 6 +++---
 fs/btrfs/extent_io.h | 2 +-
 fs/btrfs/inode.c     | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index 27ca7a56d8f5..cfd523b523b3 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -2435,11 +2435,11 @@ static bool try_release_extent_state(struct extent_io_tree *tree,
  * in the range corresponding to the page, both state records and extent
  * map records are removed
  */
-bool try_release_extent_mapping(struct page *page, gfp_t mask)
+bool try_release_extent_mapping(struct folio *folio, gfp_t mask)
 {
-	u64 start = page_offset(page);
+	u64 start = folio_pos(folio);
 	u64 end = start + PAGE_SIZE - 1;
-	struct btrfs_inode *inode = page_to_inode(page);
+	struct btrfs_inode *inode = folio_to_inode(folio);
 	struct extent_io_tree *io_tree = &inode->io_tree;
 
 	while (start <= end) {
diff --git a/fs/btrfs/extent_io.h b/fs/btrfs/extent_io.h
index f4c93ca46bdd..d1c54788d444 100644
--- a/fs/btrfs/extent_io.h
+++ b/fs/btrfs/extent_io.h
@@ -236,7 +236,7 @@ static inline void extent_changeset_free(struct extent_changeset *changeset)
 	kfree(changeset);
 }
 
-bool try_release_extent_mapping(struct page *page, gfp_t mask);
+bool try_release_extent_mapping(struct folio *folio, gfp_t mask);
 int try_release_extent_buffer(struct folio *folio);
 
 int btrfs_read_folio(struct file *file, struct folio *folio);
diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 5e3b834cc72b..e844c409c12a 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -7238,7 +7238,7 @@ static int btrfs_launder_folio(struct folio *folio)
 
 static bool __btrfs_release_folio(struct folio *folio, gfp_t gfp_flags)
 {
-	if (try_release_extent_mapping(&folio->page, gfp_flags)) {
+	if (try_release_extent_mapping(folio, gfp_flags)) {
 		wait_subpage_spinlock(folio);
 		clear_page_extent_mapped(folio);
 		return true;
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
