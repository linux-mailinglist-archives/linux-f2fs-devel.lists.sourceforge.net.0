Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D484206A47
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2020 04:45:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jnvPb-0002WV-UR; Wed, 24 Jun 2020 02:45:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jnvPa-0002Vl-57
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Jun 2020 02:45:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KrBfvoTD4etflGznyiH3x+r/MebQuLIujqEBDch+vX4=; b=G/fzrash/Zw3RVOnUx4J+3CWQ+
 ymjd+PrDu/HeyllQiGnZJkL65N+z6fh2Q5bCcV3zmXl7KSggwpUaTCgWUxzm57k3F5yEqjTcqWFAV
 28y+Ax/1ObVsHMIiGZcIYxkmhKWZQRN3idPNpM2DH7sjf+WRFMOq4WmQO5loWptQrSuE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KrBfvoTD4etflGznyiH3x+r/MebQuLIujqEBDch+vX4=; b=CXQuEvvNrdlOjH2HKHmuGdv4vt
 j2FO1NFJUDzTJvXzQzKlNaZSnqOTMD6NoWWS3ljZKwjiW2nSow9qPf2CiOIlkxurLZ45OoVM6GPv7
 Z2NaS7vvfFf+JMNNUlKJVOH4Wpe/AklNmx8NglphTrsu+R4iDelO1UFbQEwQHA4v3DMM=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jnvPW-00Gaq2-0i
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Jun 2020 02:45:18 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 560D42576DBCBF196A69;
 Wed, 24 Jun 2020 10:45:05 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 24 Jun
 2020 10:44:57 +0800
To: Qilong Zhang <zhangqilong3@huawei.com>, <jaegeuk@kernel.org>
References: <20200623143407.78400-1-zhangqilong3@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <117d9065-490c-a491-6f53-93ae3b814811@huawei.com>
Date: Wed, 24 Jun 2020 10:44:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200623143407.78400-1-zhangqilong3@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jnvPW-00Gaq2-0i
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: add f2fs_gc exception handle in
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/6/23 22:34, Qilong Zhang wrote:
> When f2fs_ioc_gc_range performs multiple segments gc ops, the return
> value of f2fs_ioc_gc_range is determined by the last segment gc ops.
> If its ops failed, the f2fs_ioc_gc_range will be considered to be failed
> despite some of previous segments gc ops succeeded. Therefore, so we
> fix: only all of segments gc ops are finished will return success. In
> particular, 1).if target has no valid blopcks, it will go on. 2).if
> target sectoion has valid blocks, but it is current segment, we will
> reminder the caller.
> 
> Signed-off-by: Qilong Zhang <zhangqilong3@huawei.com>
> ---
> v1:
> - handle the -ENODATA exceptions of f2fs_gc.

Should be v2?

I mean this:

---
 fs/f2fs/gc.c      | 24 ++++++++++++++++--------
 fs/f2fs/segment.c |  4 ++--
 2 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 5e1368ce2389..e017c79a11d0 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -330,6 +330,7 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
 	unsigned int secno, last_victim;
 	unsigned int last_segment;
 	unsigned int nsearched = 0;
+	int ret;

 	mutex_lock(&dirty_i->seglist_lock);
 	last_segment = MAIN_SECS(sbi) * sbi->segs_per_sec;
@@ -341,12 +342,20 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
 	p.min_cost = get_max_cost(sbi, &p);

 	if (*result != NULL_SEGNO) {
-		if (get_valid_blocks(sbi, *result, false) &&
-			!sec_usage_check(sbi, GET_SEC_FROM_SEG(sbi, *result)))
-			p.min_segno = *result;
+		if (!get_valid_blocks(sbi, *result, true)) {
+			ret = 0;
+			goto out;
+		}
+		if (sec_usage_check(sbi, GET_SEC_FROM_SEG(sbi, *result))) {
+			ret = -EAGAIN;
+			goto out;
+		}
+		p.min_segno = *result;
 		goto out;
 	}

+	ret = -ENODATA;
+
 	if (p.max_search == 0)
 		goto out;

@@ -447,7 +456,7 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
 			else
 				set_bit(secno, dirty_i->victim_secmap);
 		}
-
+		ret = 0;
 	}
 out:
 	if (p.min_segno != NULL_SEGNO)
@@ -456,7 +465,7 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
 				prefree_segments(sbi), free_segments(sbi));
 	mutex_unlock(&dirty_i->seglist_lock);

-	return (p.min_segno == NULL_SEGNO) ? 0 : 1;
+	return ret;
 }

 static const struct victim_selection default_v_ops = {
@@ -1340,10 +1349,9 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
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
index 735c598c25ea..5aa4158a1440 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2631,7 +2631,7 @@ static int get_ssr_segment(struct f2fs_sb_info *sbi, int type)
 	bool reversed = false;

 	/* f2fs_need_SSR() already forces to do this */
-	if (v_ops->get_victim(sbi, &segno, BG_GC, type, SSR)) {
+	if (!v_ops->get_victim(sbi, &segno, BG_GC, type, SSR)) {
 		curseg->next_segno = segno;
 		return 1;
 	}
@@ -2658,7 +2658,7 @@ static int get_ssr_segment(struct f2fs_sb_info *sbi, int type)
 	for (; cnt-- > 0; reversed ? i-- : i++) {
 		if (i == type)
 			continue;
-		if (v_ops->get_victim(sbi, &segno, BG_GC, i, SSR)) {
+		if (!v_ops->get_victim(sbi, &segno, BG_GC, i, SSR)) {
 			curseg->next_segno = segno;
 			return 1;
 		}
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
