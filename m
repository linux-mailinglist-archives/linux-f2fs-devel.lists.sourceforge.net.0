Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C4F7F4D7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Aug 2019 12:16:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1htUbu-0004On-13; Fri, 02 Aug 2019 10:16:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1htUbs-0004Od-SI
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Aug 2019 10:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b8jH7eAf3IghUEiBSQKnRzd6QNQiMXWWCa8itWyzRuY=; b=gLNGGdE91HDXclLaJwsUGYOpfU
 tpar1BGIe0TIxENOlp/m/AI9LNiVchw3tAtfymgRK8EIdyiB+K6CFm8wYb/cdvP7qTvC7Gv2FcPj5
 Bqbn6JAtFdCIxN/yLMxqVsIftbqJMRAEiSdcw5P1s4Armb9aZ1F2QbI8lXG+Chcx+x0M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=b8jH7eAf3IghUEiBSQKnRzd6QNQiMXWWCa8itWyzRuY=; b=M
 19Yj3DRgoa4V6bWkBTM4EJLZK7Rhy4rBOlUAHiOGttSR/i/D1wqzlSdln5U45OYzi6kxpGRqREUes
 OrmHWAvDjr5RW+/CNcAtJBloiz9AjzXMxNpxNKfhtzZGYF/OFNNuSW8/csnO2OEpeZMD30zrfuYkU
 dIMJz4h/WWJ58aAQ=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1htUbq-007z3r-Ms
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Aug 2019 10:16:28 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id F15548CA8EEC0A7AC45B;
 Fri,  2 Aug 2019 18:16:15 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Fri, 2 Aug 2019 18:16:05 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 2 Aug 2019 18:15:48 +0800
Message-ID: <20190802101548.96543-1-yuchao0@huawei.com>
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
X-Headers-End: 1htUbq-007z3r-Ms
Subject: [f2fs-dev] [PATCH] Revert "f2fs: avoid out-of-range memory access"
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

As Pavel Machek reported:

"We normally use -EUCLEAN to signal filesystem corruption. Plus, it is
good idea to report it to the syslog and mark filesystem as "needing
fsck" if filesystem can do that."

Still we need improve the original patch with:
- use unlikely keyword
- add message print
- return EUCLEAN

However, after rethink this patch, I don't think we should add such
condition check here as below reasons:
- We have already checked the field in f2fs_sanity_check_ckpt(),
- If there is fs corrupt or security vulnerability, there is nothing
to guarantee the field is integrated after the check, unless we do
the check before each of its use, however no filesystem does that.
- We only have similar check for bitmap, which was added due to there
is bitmap corruption happened on f2fs' runtime in product.
- There are so many key fields in SB/CP/NAT did have such check
after f2fs_sanity_check_{sb,cp,..}.

So I propose to revert this unneeded check.

This reverts commit 56f3ce675103e3fb9e631cfb4131fc768bc23e9a.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/segment.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 9693fa4c8971..2eff9c008ae0 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3492,11 +3492,6 @@ static int read_compacted_summaries(struct f2fs_sb_info *sbi)
 		seg_i = CURSEG_I(sbi, i);
 		segno = le32_to_cpu(ckpt->cur_data_segno[i]);
 		blk_off = le16_to_cpu(ckpt->cur_data_blkoff[i]);
-		if (blk_off > ENTRIES_IN_SUM) {
-			f2fs_bug_on(sbi, 1);
-			f2fs_put_page(page, 1);
-			return -EFAULT;
-		}
 		seg_i->next_segno = segno;
 		reset_curseg(sbi, i, 0);
 		seg_i->alloc_type = ckpt->alloc_type[i];
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
