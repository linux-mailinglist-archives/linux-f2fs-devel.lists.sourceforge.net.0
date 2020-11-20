Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF7F2BAB20
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Nov 2020 14:30:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kg6Uy-0005rd-CA; Fri, 20 Nov 2020 13:30:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <zhangqilong3@huawei.com>) id 1kg6Ua-0005qz-Ii
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Nov 2020 13:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UUIMi4+dwRUdhlyAFdOLn+v+dVZnyDe5Fdsl4yZNZSk=; b=dN5CahWVrhAoCcZdqpdT/+0l7y
 Gkx2d+GVOS52JMe+lDrLFssaExoxiK8Q7YAtJZL3D9qBP44Hy+8BXGVvtsfMSKJJNlCNIeI3BoDbE
 2lWXLFuMZmpS11g1UWjHPMJ7S76spnuZ/zy7kkC4XCSWufj/VTsygx6nu53zoq9EBpvU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UUIMi4+dwRUdhlyAFdOLn+v+dVZnyDe5Fdsl4yZNZSk=; b=K
 e9tlA0wuJ0uRYOCTDq+Pq/cW/+0Ir/Yl8Y6CttwaABuZ2X6clXe2DgP/L458Jdo6BLka8o0JjPJU2
 uJm2iOc6jaq+qAVz5UsP/mBzbR+s91Mn6a25+XosiDv/C5VgcqC7uULSBBDM36acSmNlNLKWM/v6v
 hgJ8mQb0C6X/J2Co=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kg6UT-00AQPO-Sz
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Nov 2020 13:30:24 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Ccy8B4QD0zLm3K;
 Fri, 20 Nov 2020 21:29:46 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Fri, 20 Nov 2020
 21:29:59 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <jaegeuk@kernel.org>, <yuchao0@huawei.com>
Date: Fri, 20 Nov 2020 21:33:34 +0800
Message-ID: <20201120133334.2555310-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kg6UT-00AQPO-Sz
Subject: [f2fs-dev] [PATCH] f2fs: Remove the redundancy initialization
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There are two assignments are meaningless, and remove them.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 fs/f2fs/acl.c        | 2 +-
 fs/f2fs/checkpoint.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/acl.c b/fs/f2fs/acl.c
index 306413589827..1e5e9b1136ee 100644
--- a/fs/f2fs/acl.c
+++ b/fs/f2fs/acl.c
@@ -384,7 +384,7 @@ int f2fs_init_acl(struct inode *inode, struct inode *dir, struct page *ipage,
 							struct page *dpage)
 {
 	struct posix_acl *default_acl = NULL, *acl = NULL;
-	int error = 0;
+	int error;
 
 	error = f2fs_acl_create(dir, &inode->i_mode, &default_acl, &acl, dpage);
 	if (error)
diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 023462e80e58..9b0628e0d8bc 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -37,7 +37,7 @@ void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io)
 struct page *f2fs_grab_meta_page(struct f2fs_sb_info *sbi, pgoff_t index)
 {
 	struct address_space *mapping = META_MAPPING(sbi);
-	struct page *page = NULL;
+	struct page *page;
 repeat:
 	page = f2fs_grab_cache_page(mapping, index, false);
 	if (!page) {
-- 
2.25.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
