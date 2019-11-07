Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B20CF2AA0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Nov 2019 10:29:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iSe6X-0004VD-0f; Thu, 07 Nov 2019 09:29:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iSe6V-0004V5-RS
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Nov 2019 09:29:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/nle6L8fHxVNQ4Q6NDhT8jzRGe/UGgSaDM2M8RFveSk=; b=NcYa3JFwN6MjaJno2gpJLGf/NV
 sgSPdc8f2Yav4fDRDm73q9IVC9agEMYIDYK/tr5ixWh1qF0cLdSWII3LEWqbt8R8qUGwDUryE+L6i
 nIBfiTYlqFOh/kJvIJU9P5/fIpD2tVNxw8r3JaJYkHeuwr0b62fpoOcb7o3Se4/D3A7o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/nle6L8fHxVNQ4Q6NDhT8jzRGe/UGgSaDM2M8RFveSk=; b=Z
 PXufUF8vxVm+RxhD5I0KgJCRrbTqc71VlFrP7qg20GczYognmvTajodIh1hLzbEnenQh737XAg5mR
 hijLT44MqZEaxoWCUI7IfMRcGYb+D8KGVe1M2JiEIpJZ+CxDrwVvVEH8gQ7ceh1R26uj3MnM/S6kK
 oTTFnwIEtLtdwTYo=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iSe6T-003SeP-BE
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 Nov 2019 09:29:23 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 542A81A8CF82C49C0A7D;
 Thu,  7 Nov 2019 17:29:14 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Thu, 7 Nov 2019 17:29:04 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 7 Nov 2019 17:29:00 +0800
Message-ID: <20191107092900.90588-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iSe6T-003SeP-BE
Subject: [f2fs-dev] [PATCH] f2fs: fix potential overflow
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

We expect 64-bit calculation result from below statement, however
in 32-bit machine, looped left shift operation on pgoff_t type
variable may cause overflow issue, fix it by forcing type cast.

page->index << PAGE_SHIFT;

Fixes: 26de9b117130 ("f2fs: avoid unnecessary updating inode during fsync")
Fixes: 0a2aa8fbb969 ("f2fs: refactor __exchange_data_block for speed up")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/data.c | 2 +-
 fs/f2fs/file.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 58f4bade6c2b..8f70dfcafab3 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2204,7 +2204,7 @@ static int __write_data_page(struct page *page, bool *submitted,
 	loff_t i_size = i_size_read(inode);
 	const pgoff_t end_index = ((unsigned long long) i_size)
 							>> PAGE_SHIFT;
-	loff_t psize = (page->index + 1) << PAGE_SHIFT;
+	loff_t psize = (loff_t)(page->index + 1) << PAGE_SHIFT;
 	unsigned nr_pages = DIV_ROUND_UP(i_size, PAGE_SIZE);
 	unsigned offset = 0;
 	bool need_balance_fs = false;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index a7d855efc294..3564cb6a4c18 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1139,7 +1139,7 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
 				}
 				dn.ofs_in_node++;
 				i++;
-				new_size = (dst + i) << PAGE_SHIFT;
+				new_size = (loff_t)(dst + i) << PAGE_SHIFT;
 				if (dst_inode->i_size < new_size)
 					f2fs_i_size_write(dst_inode, new_size);
 			} while (--ilen && (do_replace[i] || blkaddr[i] == NULL_ADDR));
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
