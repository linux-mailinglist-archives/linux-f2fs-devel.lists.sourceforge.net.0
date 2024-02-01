Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E93845243
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Feb 2024 08:57:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rVRwk-000668-Ig;
	Thu, 01 Feb 2024 07:57:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <huangxiaojia2@huawei.com>) id 1rVRwj-000662-4D
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Feb 2024 07:57:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1g7n/qEtfWD5cGW6SJGIHiQHA34rsIwYv2x96u3sREU=; b=AZ3b2zNP47rcBbA1AllXwD4Amu
 jGIw0aM4RcojHqU5sadLE5CQ81FBzlolpHmjqDCxwx+2dpH+fxhBUPVjb/ZLSEGATIfFBrWm8uheM
 pKZkqVVRC8jeChFfwXph/3MkIEY4ZOIM2cVZaO+B3ODRi2KUP+4/FbMGdRZ+msw8522U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1g7n/qEtfWD5cGW6SJGIHiQHA34rsIwYv2x96u3sREU=; b=E
 3kjMVWnbbuxMzvdi/FyPQiBVe4Te7aDYG2V2q9uD5PtDZyoN097PcnTupBtwf2myZhsICJ6bRvqYP
 tYC1rB7ejJ0EWdgsY7nPNF7nDT+N+J+bnyUMkpPzMM0C/2py4L/nvNWhLJGk/i4qCVchSHUDZ2DbI
 xb/Dj1BRu0fJnRaU=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rVRwg-0008T3-GT for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Feb 2024 07:57:18 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4TQW4F5YvHz1vsnc;
 Thu,  1 Feb 2024 15:38:53 +0800 (CST)
Received: from dggpemm500021.china.huawei.com (unknown [7.185.36.109])
 by mail.maildlp.com (Postfix) with ESMTPS id 40CD61400D4;
 Thu,  1 Feb 2024 15:39:19 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemm500021.china.huawei.com
 (7.185.36.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 1 Feb
 2024 15:39:19 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Thu, 1 Feb 2024 15:38:58 +0800
Message-ID: <20240201073858.104773-1-huangxiaojia2@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500021.china.huawei.com (7.185.36.109)
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: HuangXiaojia <huangxiaojia2@huawei.com> Use folio in
 f2fs_read_merkle_tree_page to reduce folio & page converisons from
 find_get_page_flags
 and read_mapping_page functions. But the return value should be the exact
 page. Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.32 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [45.249.212.32 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rVRwg-0008T3-GT
Subject: [f2fs-dev] [Patch-next] f2fs: Use folio in
 f2fs_read_merkle_tree_page
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
From: Huang Xiaojia via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Huang Xiaojia <huangxiaojia2@huawei.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: HuangXiaojia <huangxiaojia2@huawei.com>

Use folio in f2fs_read_merkle_tree_page to reduce folio & page converisons
from find_get_page_flags and read_mapping_page functions. But the return
value should be the exact page.

Signed-off-by: HuangXiaojia <huangxiaojia2@huawei.com>
---
 fs/f2fs/verity.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index 4fc95f353a7a..f7bb0c54502c 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -258,21 +258,23 @@ static struct page *f2fs_read_merkle_tree_page(struct inode *inode,
 					       pgoff_t index,
 					       unsigned long num_ra_pages)
 {
-	struct page *page;
+	struct folio *folio;
 
 	index += f2fs_verity_metadata_pos(inode) >> PAGE_SHIFT;
 
-	page = find_get_page_flags(inode->i_mapping, index, FGP_ACCESSED);
-	if (!page || !PageUptodate(page)) {
+	folio = __filemap_get_folio(inode->i_mapping, index, FGP_ACCESSED, 0);
+	if (IS_ERR(folio) || !folio_test_uptodate(folio)) {
 		DEFINE_READAHEAD(ractl, NULL, NULL, inode->i_mapping, index);
 
-		if (page)
-			put_page(page);
+		if (!IS_ERR(folio))
+			folio_put(folio);
 		else if (num_ra_pages > 1)
 			page_cache_ra_unbounded(&ractl, num_ra_pages, 0);
-		page = read_mapping_page(inode->i_mapping, index, NULL);
+		folio = read_mapping_folio(inode->i_mapping, index, NULL);
+		if (IS_ERR(folio))
+			return ERR_CAST(folio);
 	}
-	return page;
+	return folio_file_page(folio, index);
 }
 
 static int f2fs_write_merkle_tree_block(struct inode *inode, const void *buf,
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
