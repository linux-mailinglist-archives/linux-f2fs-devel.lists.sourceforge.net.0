Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB7EEC0DE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Nov 2019 10:54:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iQTdD-0007Dw-Go; Fri, 01 Nov 2019 09:54:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iQTdB-0007De-L4
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Nov 2019 09:54:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E4xg7o4BZYmggCqKdus3rRqvJ+Lb2cY/P0qQmQglha4=; b=BJ5xrzLgZq54+YAR1tCdrKvhA1
 ZcWhiP/0eTBROyD2zQrODc90LxxeB60JIS+lC4Fd2MPNumOdrcqr7fSVRALBX5OrUwcCupZQx+2Il
 1CBltRlD98SmcFz8ME4i64IKIREaz52jsXM0QAusbhZ2V7fI2Pciz6FBXQU1VPZzxlg8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=E4xg7o4BZYmggCqKdus3rRqvJ+Lb2cY/P0qQmQglha4=; b=A
 whNoosMI7zP6KGnqSrMi+Lzd1Im7X/PA0lI/dnzV6N7eup5G9fIxW2NEQXvtNgwLadFim6y7hsu6m
 611wADD+tEWLrqVF8oqIum6hj7fyR2uNFkz9nZ8Am512qXv3pBe6M6YH4EgiU/NQYdurqfiX9eEY5
 gYxKictFoKBJveIo=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iQTd9-00DmCg-Cp
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Nov 2019 09:54:09 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 60DFD2FAC0E85D290225;
 Fri,  1 Nov 2019 17:53:59 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.439.0; Fri, 1 Nov 2019 17:53:48 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 1 Nov 2019 17:53:22 +0800
Message-ID: <20191101095324.9902-1-yuchao0@huawei.com>
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
X-Headers-End: 1iQTd9-00DmCg-Cp
Subject: [f2fs-dev] [PATCH 1/3] f2fs: clean up check condition for writting
 beyond EOF
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

Clean up with below codes suggested by Eric:

__write_data_page()

	unsigned nr_pages = DIV_ROUND_UP(i_size, PAGE_SIZE);

	/*
	 * If the offset is out-of-range of file size,
	 * this page does not have to be written to disk.
	 */
	if (page->index >= nr_pages)
		goto out;

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/data.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index ba3bcf4c7889..ca7161e38d1f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2204,6 +2204,7 @@ static int __write_data_page(struct page *page, bool *submitted,
 	const pgoff_t end_index = ((unsigned long long) i_size)
 							>> PAGE_SHIFT;
 	loff_t psize = (page->index + 1) << PAGE_SHIFT;
+	unsigned nr_pages = DIV_ROUND_UP(i_size, PAGE_SIZE);
 	unsigned offset = 0;
 	bool need_balance_fs = false;
 	int err = 0;
@@ -2248,8 +2249,7 @@ static int __write_data_page(struct page *page, bool *submitted,
 	 * If the offset is out-of-range of file size,
 	 * this page does not have to be written to disk.
 	 */
-	offset = i_size & (PAGE_SIZE - 1);
-	if ((page->index >= end_index + 1) || !offset)
+	if (page->index >= nr_pages)
 		goto out;
 
 	zero_user_segment(page, offset, PAGE_SIZE);
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
