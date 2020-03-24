Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FB71905A5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2020 07:21:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGcwH-00026e-Qu; Tue, 24 Mar 2020 06:21:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jGcwG-00026P-7w
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Mar 2020 06:21:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PiZ2Q6VFKUyikU07MLpHA55Sus/QQcpho6owDmynDTk=; b=XSXXNdcR5bvC8ZUXraTriqWMVm
 tqLmE5LhsiHxjCEcintT/oFhUMPe8kFoykpvGYg/beMsoIk7y4Bgy1X18KgSKlvO03Oln7Ws3JSg1
 8HdKo+1lWF9q5YHQ6mi1rMTciIdYMcKE1kRVaqJx89w9vIR3dwWQve9gTwO8s/2XQioY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PiZ2Q6VFKUyikU07MLpHA55Sus/QQcpho6owDmynDTk=; b=D
 IZ/OwcvnrLPU9miNKnpObidm9yxaNHOjpiQYwmV9ViKskMO5PPXhTrgpR0ThbDqoQzI2BoMzefBna
 uschhzOkaHAe9lhfs7+bowAPiKN20E2nB+Erh6jA/tDZfWyhVI6MGxKEwxx9+8cy/QcTPXGXQiipR
 fjkLBev+07IlrnHo=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGcw9-005NPy-FD
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Mar 2020 06:21:24 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 217FDB9B832C6BE91BF2;
 Tue, 24 Mar 2020 14:21:09 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Tue, 24 Mar 2020 14:21:00 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 24 Mar 2020 14:20:57 +0800
Message-ID: <20200324062057.52222-1-yuchao0@huawei.com>
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
X-Headers-End: 1jGcw9-005NPy-FD
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid double unlock
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

On image that has verity and compression feature, if compressed pages
and non-compressed pages are mixed in one bio, we may double unlock
non-compressed page in below flow:

- f2fs_post_read_work
 - f2fs_decompress_work
  - f2fs_decompress_bio
   - __read_end_io
    - unlock_page
 - fsverity_enqueue_verify_work
  - f2fs_verity_work
   - f2fs_verify_bio
    - unlock_page

So it should skip handling non-compressed page in f2fs_decompress_work()
if verity is on.

Besides, add missing dec_page_count() in f2fs_verify_bio().

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/data.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 0197b7b80d19..24643680489b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -139,6 +139,8 @@ static void __read_end_io(struct bio *bio, bool compr, bool verity)
 			f2fs_decompress_pages(bio, page, verity);
 			continue;
 		}
+		if (verity)
+			continue;
 #endif
 
 		/* PG_error was set if any post_read step failed */
@@ -216,6 +218,7 @@ static void f2fs_verify_bio(struct bio *bio)
 		ClearPageUptodate(page);
 		ClearPageError(page);
 unlock:
+		dec_page_count(F2FS_P_SB(page), __read_io_type(page));
 		unlock_page(page);
 	}
 }
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
