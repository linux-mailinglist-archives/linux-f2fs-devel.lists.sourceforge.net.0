Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A32F31A44FE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Apr 2020 12:07:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jMqZe-0001HR-9Y; Fri, 10 Apr 2020 10:07:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jMqZb-0001HF-V5
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Apr 2020 10:07:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=47FmyJK5M3jFWEE6dKbplRYJAfko4kLiw7ldOFsqUCw=; b=OwaK/JbyZ40BX6p/H2kLUvAbEx
 ETQEr8hu3RQwkESSixbvbmqbmRJGp7Lwufkdj4pojqKdRPoZO3uU1cQBHlphy0bdtYSEwrsFmHnFf
 JsfOusr9KKuq2CJ/15K+8LOaZ6f0Ci4g/B7wasnvWYgS7eGvxdGfjA7H0G0rObQEHAVM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=47FmyJK5M3jFWEE6dKbplRYJAfko4kLiw7ldOFsqUCw=; b=E
 LfhvZHvv5tmf0jSQz0IzUZ7L72tBsls6Jub+e5tiSixvGh4Gltbo4Qv+P+fXpmjdQw3JHefz4jC1G
 uH/VJOUL/82Jo9bUh6LHYBlXgyn5we0D2ZFWqtKeU6niJzWkHtE3ITDi7j7Cg2MYYH+q1rrWAgH3N
 4W947K1KBxH4mvTE=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jMqZZ-00AcGa-OY
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Apr 2020 10:07:43 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id B0C7AB7B63F072865E4C;
 Fri, 10 Apr 2020 18:07:32 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Fri, 10 Apr 2020 18:07:23 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 10 Apr 2020 18:07:20 +0800
Message-ID: <20200410100720.65723-1-yuchao0@huawei.com>
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
X-Headers-End: 1jMqZZ-00AcGa-OY
Subject: [f2fs-dev] [PATCH] f2fs: fix to handle error path of
 f2fs_ra_meta_pages()
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

In f2fs_ra_meta_pages(), if f2fs_submit_page_bio() failed, we need to
unlock page, fix it.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/checkpoint.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 852890b72d6a..6be357c8e002 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -220,6 +220,7 @@ int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, block_t start, int nrpages,
 		.is_por = (type == META_POR),
 	};
 	struct blk_plug plug;
+	int err;
 
 	if (unlikely(type == META_POR))
 		fio.op_flags &= ~REQ_META;
@@ -263,8 +264,8 @@ int f2fs_ra_meta_pages(struct f2fs_sb_info *sbi, block_t start, int nrpages,
 		}
 
 		fio.page = page;
-		f2fs_submit_page_bio(&fio);
-		f2fs_put_page(page, 0);
+		err = f2fs_submit_page_bio(&fio);
+		f2fs_put_page(page, err ? 1 : 0);
 	}
 out:
 	blk_finish_plug(&plug);
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
