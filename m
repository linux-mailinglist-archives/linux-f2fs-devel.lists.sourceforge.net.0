Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87636207014
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2020 11:34:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jo1n2-0000Hb-EN; Wed, 24 Jun 2020 09:33:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <zhangqilong3@huawei.com>) id 1jo1n1-0000HO-84
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Jun 2020 09:33:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hLvyrecE1ZRgVZbXv5ZR0EBVxaVA+EH57Ol7iHNSd78=; b=cILx5kRuDKnYkVz1UK8Viztd6p
 5dbXm73Ljzec0D8Nt7jtZpRNKJZOyKEq5plwNVAQEpXTrRVlLL9diGVDn3llSdUm+Pn6xTgFm5rqc
 K3mVw+CnV/V8DxtiKNlpax2wX0+aC2EnB2zZBcoI4z3WB0qhHVLxpnn050ntakYrMa6c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hLvyrecE1ZRgVZbXv5ZR0EBVxaVA+EH57Ol7iHNSd78=; b=Z
 AHkN73CDQuIsVhDcY9g9loT7JQ9+1h8tS7FcijRvyi5KECUwSE1zqayPlhOCewnPR0d5hpYo9K6Az
 3m6Z+FI3wQOdHvmtxGHIlyAQ0jvU2/D6xU+VWSeWJT8y/r8FFMG5DlofgHNIKYmI6D0kqxb17kNhR
 0b1UYETJckZFwD1w=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jo1mz-00GQe2-4X
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Jun 2020 09:33:55 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 52CD2173780BFEC41EDF;
 Wed, 24 Jun 2020 17:33:39 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Wed, 24 Jun 2020
 17:33:31 +0800
From: Qilong Zhang <zhangqilong3@huawei.com>
To: <yuchao0@huawei.com>, <jaegeuk@kernel.org>
Date: Wed, 24 Jun 2020 17:40:33 +0800
Message-ID: <20200624094033.77410-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jo1mz-00GQe2-4X
Subject: [f2fs-dev] [PATCH v3] f2fs: add f2fs_gc exception handle in
 f2fs_ioc_gc_range
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
Cc: zhangqilong3@huawei.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When f2fs_ioc_gc_range performs multiple segments gc ops, the return
value of f2fs_ioc_gc_range is determined by the last segment gc ops.
If its ops failed, the f2fs_ioc_gc_range will be considered to be failed
despite some of previous segments gc ops succeeded. Therefore, so we
fix: Redefine the return value of getting victim ops and add exception
handle for f2fs_gc. In particular, 1).if target has no valid block, it
will go on. 2).if target sectoion has valid block(s), but it is current
section, we will reminder the caller.

Signed-off-by: Qilong Zhang <zhangqilong3@huawei.com>
---
 fs/f2fs/file.c    |  5 +++++
 fs/f2fs/gc.c      | 19 +++++++++++++------
 fs/f2fs/segment.c |  4 ++--
 3 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 3268f8dd59bb..209dd9cb4b7b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2527,6 +2527,11 @@ static int f2fs_ioc_gc_range(struct file *filp, unsigned long arg)
 	}
 
 	ret = f2fs_gc(sbi, range.sync, true, GET_SEGNO(sbi, range.start));
+	if (ret) {
+		if (ret == -EAGAIN)
+			ret = -EBUSY;
+		goto out;
+	}
 	range.start += BLKS_PER_SEC(sbi);
 	if (range.start <= end)
 		goto do_more;
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 5b95d5a146eb..297e53ef4cb1 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -321,6 +321,7 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
 	unsigned int secno, last_victim;
 	unsigned int last_segment;
 	unsigned int nsearched = 0;
+	int ret;
 
 	mutex_lock(&dirty_i->seglist_lock);
 	last_segment = MAIN_SECS(sbi) * sbi->segs_per_sec;
@@ -332,12 +333,18 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
 	p.min_cost = get_max_cost(sbi, &p);
 
 	if (*result != NULL_SEGNO) {
-		if (get_valid_blocks(sbi, *result, false) &&
-			!sec_usage_check(sbi, GET_SEC_FROM_SEG(sbi, *result)))
+		ret = 0;
+		if (!get_valid_blocks(sbi, *result, false))
+			goto out;
+
+		if (sec_usage_check(sbi, GET_SEC_FROM_SEG(sbi, *result)))
+			ret = -EAGAIN;
+		else
 			p.min_segno = *result;
 		goto out;
 	}
 
+	ret = -ENODATA;
 	if (p.max_search == 0)
 		goto out;
 
@@ -440,6 +447,7 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
 			else
 				set_bit(secno, dirty_i->victim_secmap);
 		}
+		ret = 0;
 
 	}
 out:
@@ -449,7 +457,7 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
 				prefree_segments(sbi), free_segments(sbi));
 	mutex_unlock(&dirty_i->seglist_lock);
 
-	return (p.min_segno == NULL_SEGNO) ? 0 : 1;
+	return ret;
 }
 
 static const struct victim_selection default_v_ops = {
@@ -1333,10 +1341,9 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
 		ret = -EINVAL;
 		goto stop;
 	}
-	if (!__get_victim(sbi, &segno, gc_type)) {
-		ret = -ENODATA;
+	ret = __get_victim(sbi, &segno, gc_type);
+	if (ret)
 		goto stop;
-	}
 
 	seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type);
 	if (gc_type == FG_GC && seg_freed == sbi->segs_per_sec)
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 196f31503511..b9fd93761b0a 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2605,7 +2605,7 @@ static int get_ssr_segment(struct f2fs_sb_info *sbi, int type)
 	bool reversed = false;
 
 	/* f2fs_need_SSR() already forces to do this */
-	if (v_ops->get_victim(sbi, &segno, BG_GC, type, SSR)) {
+	if (!v_ops->get_victim(sbi, &segno, BG_GC, type, SSR)) {
 		curseg->next_segno = segno;
 		return 1;
 	}
@@ -2632,7 +2632,7 @@ static int get_ssr_segment(struct f2fs_sb_info *sbi, int type)
 	for (; cnt-- > 0; reversed ? i-- : i++) {
 		if (i == type)
 			continue;
-		if (v_ops->get_victim(sbi, &segno, BG_GC, i, SSR)) {
+		if (!v_ops->get_victim(sbi, &segno, BG_GC, i, SSR)) {
 			curseg->next_segno = segno;
 			return 1;
 		}
-- 
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
