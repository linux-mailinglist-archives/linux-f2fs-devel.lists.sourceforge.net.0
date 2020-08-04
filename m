Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB3923BB54
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Aug 2020 15:44:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k2xEb-0003J9-Uv; Tue, 04 Aug 2020 13:44:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <wangxiaojun11@huawei.com>) id 1k2xEb-0003J2-1B
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Aug 2020 13:44:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fMHXTXIef5c2VohepCcUgA/RBJugRMMaOlHc9NiOBCw=; b=dyVp8lsIpFAsTE7rIAist+ihIk
 hqO74eJe2F2w7uqU7PX6LPOIOHGKjHszvUdqFciG4JHJAHr8OnucBYloK+muto84qLWC/EEi/eBk/
 xWG0xXhzAjJzSHGlsJHTVaTNYpfnkjEf6fq8PRDJ2neroLZCqGLO613xaMsIBG5How34=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fMHXTXIef5c2VohepCcUgA/RBJugRMMaOlHc9NiOBCw=; b=N
 7bUUTNZKfaKMrYMWqJKnnFEjLT1Ic2CbtW2hg9ftk3ZZ/zDZosbAXoFa9NiDjUDWfVcwKlV5aKHrp
 f9Nmy0///sPkysOHdmIyNKPHwIsYSwZR/RYZIfUpZaP8FSZMQqw5M0C8j0a/EXUjx198GWR5rYS0e
 /3fvRT4qwMwSgh3I=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k2xEY-0036cO-45
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Aug 2020 13:44:04 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 057F9914857DD7B7283F;
 Tue,  4 Aug 2020 21:43:50 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Tue, 4 Aug 2020
 21:43:41 +0800
From: w00407079 <wangxiaojun11@huawei.com>
To: <yuchao0@huawei.com>, <jaegeuk@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
Date: Tue, 4 Aug 2020 21:46:04 +0800
Message-ID: <20200804134604.459039-1-wangxiaojun11@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1k2xEY-0036cO-45
Subject: [f2fs-dev] [PATCH] f2fs: remove duplicated type casting
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Xiaojun Wang <wangxiaojun11@huawei.com>

Since DUMMY_WRITTEN_PAGE and ATOMIC_WRITTEN_PAGE have already been
converted as unsigned long type, we don't need do type casting again.

Signed-off-by: Xiaojun Wang <wangxiaojun11@huawei.com>
Reported-by: Jack Qiu <jack.qiu@huawei.com>
---
 fs/f2fs/data.c    | 2 +-
 fs/f2fs/f2fs.h    | 4 ++--
 fs/f2fs/segment.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b9642607c07d..30574747374b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -517,7 +517,7 @@ static inline void __submit_bio(struct f2fs_sb_info *sbi,
 
 			zero_user_segment(page, 0, PAGE_SIZE);
 			SetPagePrivate(page);
-			set_page_private(page, (unsigned long)DUMMY_WRITTEN_PAGE);
+			set_page_private(page, DUMMY_WRITTEN_PAGE);
 			lock_page(page);
 			if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE)
 				f2fs_bug_on(sbi, 1);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b35a50f4953c..7ad77bf4b1d9 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1309,9 +1309,9 @@ enum fsync_mode {
 #define DUMMY_WRITTEN_PAGE		((unsigned long)-2)
 
 #define IS_ATOMIC_WRITTEN_PAGE(page)			\
-		(page_private(page) == (unsigned long)ATOMIC_WRITTEN_PAGE)
+		(page_private(page) == ATOMIC_WRITTEN_PAGE)
 #define IS_DUMMY_WRITTEN_PAGE(page)			\
-		(page_private(page) == (unsigned long)DUMMY_WRITTEN_PAGE)
+		(page_private(page) == DUMMY_WRITTEN_PAGE)
 
 #ifdef CONFIG_FS_ENCRYPTION
 #define DUMMY_ENCRYPTION_ENABLED(sbi) \
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 196f31503511..37c8d2a25b88 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -189,7 +189,7 @@ void f2fs_register_inmem_page(struct inode *inode, struct page *page)
 
 	f2fs_trace_pid(page);
 
-	f2fs_set_page_private(page, (unsigned long)ATOMIC_WRITTEN_PAGE);
+	f2fs_set_page_private(page, ATOMIC_WRITTEN_PAGE);
 
 	new = f2fs_kmem_cache_alloc(inmem_entry_slab, GFP_NOFS);
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
