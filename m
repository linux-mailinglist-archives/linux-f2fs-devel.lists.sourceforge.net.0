Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD07C3E295F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Aug 2021 13:19:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBxsw-0004Eq-Ji; Fri, 06 Aug 2021 11:19:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=845ab97a1=damien.lemoal@wdc.com>)
 id 1mBxsu-0004Ea-L7
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 11:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jZMkkIgKugCWChbXkXHsuWAql4KGbYKl+MP3En5izJo=; b=CCpkm4sx+oPmUXMmegE+PxEYqn
 PREVQ9rSiyIyEYJbATycs8Bl2hgvnlnP7ARS+TmMO2WtO5IiQp3aNwgvMaMa7KHLGR7xt8sBgcppb
 hIkdXBbqmGNe958Y1MEH3tZDBYBmBpr1aAj/Mnq218mp9b9JQ+5Ey+jCXFG+/9qY+Na0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jZMkkIgKugCWChbXkXHsuWAql4KGbYKl+MP3En5izJo=; b=bfj64dbyW4i2ehcIdIvhTfdUqJ
 qIxs0MqrlA5PpZ8koptfSwMNtXXIEchEQxDeM0yZ9xpTFheBH8T553G+Va5wM9p5T3Zus2YZ4SCZf
 Veb6Us1UNC8JtHutWlNdfJ68cjlmVj1S8WVY4OPUwxcMPoF+oO+XrixDwvYQuwiqqggg=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mBxso-00EcqQ-Bp
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 11:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1628248761; x=1659784761;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=hDDi7vXfsrDlHCkMc281gJJnA9RDGTzvWYwvp67gk0g=;
 b=BQz4vfmbMwXP2rLfxvESfvRaY+hZ77XsnIq8zldOEz0AGP1z5NpDGX3t
 sxfzChXRUCMKefUDRS95azA6vUdVaubCK5o997JS9Vzgt2ncs0fq7BSiH
 PDoUOQ749+q6K1clMmpp7Gf2w4J0T6lYjxDOcHGMBZeMIQe2O72SbEbfi
 129dRUsw9IXQfUn3vr+p5b//9c46gGFsV67N1iynSmRFdmuSIVlLlurZ0
 xPpe8J8ud3OfNYpRGjTGvGSHJIYlqqq/tdJJWimlXDwNtN1jh7baOhfkr
 b3CNdCUkJQNOMVJPlLdfY9SjlNAgUiqj54QEKXjBBCyLOdMKvvg4z5Gk0 A==;
X-IronPort-AV: E=Sophos;i="5.84,300,1620662400"; d="scan'208";a="176497166"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 06 Aug 2021 19:19:01 +0800
IronPort-SDR: ITJynRnOqGpRPuxqksvt5C+/NqIVoi2Xxmix1OsRdtVOc0dGAv89AYK34RIrzpCdKVY2QwSiCr
 ZIHS77V+kWSzAd1pFYTnvyuFJ2KK1Y0vSLDbaR3ihy3aTwy7UpaacyPzFJlq3jlDFQdiKGb+41
 cOMvWjptR2YVvbFRlQQztRDhs/F6xrl2elePY4vCF1AezDInN16Gzfrv5Rx/SIsb3ejT7dsvxt
 1kKBIlrATg+zWfQ94fDiwXPZdlIrnogWaH6vtgIgecpGnJoKPmAwX5jbASf+JCi7PGdoNaIUSc
 BQOwaVfXZ5wQUcfSS36/PcBk
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2021 03:56:31 -0700
IronPort-SDR: 2K3V6hxI0acVop5thmOZuQTW7omntvz7SUcp3sKWpFCgqFHrCn3WxD73ccSiewenY1xcJues6h
 GZpUYKyl84WsBr0jfUJRKdTCkXlnjLzuetvKyHB53kP4mWIpfBt1JqY+jSIBdApNX0cr46KWdc
 wLavhIGyc/PE57WXf6mdMaXTRiPBzkoXjQiCMg88UylNYrAQ2FzYKEuN24HAdKxKSUWVnVvqA6
 e7Low8nSJ0d8x4Er3ouWkMKPsLzVTi3d4Q/wMq2FqrU6m7DLEjigNrjObvXncka8QDfTQKwK/p
 g84=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip02.wdc.com with ESMTP; 06 Aug 2021 04:19:03 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Paolo Valente <paolo.valente@linaro.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
Date: Fri,  6 Aug 2021 20:18:56 +0900
Message-Id: <20210806111857.488705-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210806111857.488705-1-damien.lemoal@wdc.com>
References: <20210806111857.488705-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mBxso-00EcqQ-Bp
Subject: [f2fs-dev] [PATCH v3 3/4] block: rename IOPRIO_BE_NR
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

The BFQ scheduler and ioprio_check_cap() both assume that the RT
priority class (IOPRIO_CLASS_RT) can have up to 8 different priority
levels. This is controlled using the macro IOPRIO_BE_NR, which is badly
named as the number of levels also applies to the RT class.

Rename IOPRIO_BE_NR to the class independent IOPRIO_NR_LEVELS to make
things clear.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 block/bfq-iosched.c         | 8 ++++----
 block/bfq-iosched.h         | 4 ++--
 block/bfq-wf2q.c            | 6 +++---
 block/ioprio.c              | 3 +--
 fs/f2fs/sysfs.c             | 2 +-
 include/uapi/linux/ioprio.h | 4 ++--
 6 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/block/bfq-iosched.c b/block/bfq-iosched.c
index 1f38d75524ae..d5824cab34d7 100644
--- a/block/bfq-iosched.c
+++ b/block/bfq-iosched.c
@@ -2505,7 +2505,7 @@ void bfq_end_wr_async_queues(struct bfq_data *bfqd,
 	int i, j;
 
 	for (i = 0; i < 2; i++)
-		for (j = 0; j < IOPRIO_BE_NR; j++)
+		for (j = 0; j < IOPRIO_NR_LEVELS; j++)
 			if (bfqg->async_bfqq[i][j])
 				bfq_bfqq_end_wr(bfqg->async_bfqq[i][j]);
 	if (bfqg->async_idle_bfqq)
@@ -5290,10 +5290,10 @@ bfq_set_next_ioprio_data(struct bfq_queue *bfqq, struct bfq_io_cq *bic)
 		break;
 	}
 
-	if (bfqq->new_ioprio >= IOPRIO_BE_NR) {
+	if (bfqq->new_ioprio >= IOPRIO_NR_LEVELS) {
 		pr_crit("bfq_set_next_ioprio_data: new_ioprio %d\n",
 			bfqq->new_ioprio);
-		bfqq->new_ioprio = IOPRIO_BE_NR - 1;
+		bfqq->new_ioprio = IOPRIO_NR_LEVELS - 1;
 	}
 
 	bfqq->entity.new_weight = bfq_ioprio_to_weight(bfqq->new_ioprio);
@@ -6822,7 +6822,7 @@ void bfq_put_async_queues(struct bfq_data *bfqd, struct bfq_group *bfqg)
 	int i, j;
 
 	for (i = 0; i < 2; i++)
-		for (j = 0; j < IOPRIO_BE_NR; j++)
+		for (j = 0; j < IOPRIO_NR_LEVELS; j++)
 			__bfq_put_async_bfqq(bfqd, &bfqg->async_bfqq[i][j]);
 
 	__bfq_put_async_bfqq(bfqd, &bfqg->async_idle_bfqq);
diff --git a/block/bfq-iosched.h b/block/bfq-iosched.h
index 99c2a3cb081e..385e28a843d1 100644
--- a/block/bfq-iosched.h
+++ b/block/bfq-iosched.h
@@ -931,7 +931,7 @@ struct bfq_group {
 
 	void *bfqd;
 
-	struct bfq_queue *async_bfqq[2][IOPRIO_BE_NR];
+	struct bfq_queue *async_bfqq[2][IOPRIO_NR_LEVELS];
 	struct bfq_queue *async_idle_bfqq;
 
 	struct bfq_entity *my_entity;
@@ -948,7 +948,7 @@ struct bfq_group {
 	struct bfq_entity entity;
 	struct bfq_sched_data sched_data;
 
-	struct bfq_queue *async_bfqq[2][IOPRIO_BE_NR];
+	struct bfq_queue *async_bfqq[2][IOPRIO_NR_LEVELS];
 	struct bfq_queue *async_idle_bfqq;
 
 	struct rb_root rq_pos_tree;
diff --git a/block/bfq-wf2q.c b/block/bfq-wf2q.c
index 7a462df71f68..b74cc0da118e 100644
--- a/block/bfq-wf2q.c
+++ b/block/bfq-wf2q.c
@@ -505,7 +505,7 @@ static void bfq_active_insert(struct bfq_service_tree *st,
  */
 unsigned short bfq_ioprio_to_weight(int ioprio)
 {
-	return (IOPRIO_BE_NR - ioprio) * BFQ_WEIGHT_CONVERSION_COEFF;
+	return (IOPRIO_NR_LEVELS - ioprio) * BFQ_WEIGHT_CONVERSION_COEFF;
 }
 
 /**
@@ -514,12 +514,12 @@ unsigned short bfq_ioprio_to_weight(int ioprio)
  *
  * To preserve as much as possible the old only-ioprio user interface,
  * 0 is used as an escape ioprio value for weights (numerically) equal or
- * larger than IOPRIO_BE_NR * BFQ_WEIGHT_CONVERSION_COEFF.
+ * larger than IOPRIO_NR_LEVELS * BFQ_WEIGHT_CONVERSION_COEFF.
  */
 static unsigned short bfq_weight_to_ioprio(int weight)
 {
 	return max_t(int, 0,
-		     IOPRIO_BE_NR * BFQ_WEIGHT_CONVERSION_COEFF - weight);
+		     IOPRIO_NR_LEVELS * BFQ_WEIGHT_CONVERSION_COEFF - weight);
 }
 
 static void bfq_get_entity(struct bfq_entity *entity)
diff --git a/block/ioprio.c b/block/ioprio.c
index bee628f9f1b2..ca6b136c5586 100644
--- a/block/ioprio.c
+++ b/block/ioprio.c
@@ -74,9 +74,8 @@ int ioprio_check_cap(int ioprio)
 			fallthrough;
 			/* rt has prio field too */
 		case IOPRIO_CLASS_BE:
-			if (data >= IOPRIO_BE_NR || data < 0)
+			if (data >= IOPRIO_NR_LEVELS || data < 0)
 				return -EINVAL;
-
 			break;
 		case IOPRIO_CLASS_IDLE:
 			break;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 6642246206bd..daad532a4e2b 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -378,7 +378,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		ret = kstrtol(name, 10, &data);
 		if (ret)
 			return ret;
-		if (data >= IOPRIO_BE_NR || data < 0)
+		if (data >= IOPRIO_NR_LEVELS || data < 0)
 			return -EINVAL;
 
 		cprc->ckpt_thread_ioprio = IOPRIO_PRIO_VALUE(class, data);
diff --git a/include/uapi/linux/ioprio.h b/include/uapi/linux/ioprio.h
index abc40965aa96..99d37d4807b8 100644
--- a/include/uapi/linux/ioprio.h
+++ b/include/uapi/linux/ioprio.h
@@ -31,9 +31,9 @@ enum {
 };
 
 /*
- * 8 best effort priority levels are supported
+ * The RT and BE priority classes both support up to 8 priority levels.
  */
-#define IOPRIO_BE_NR	8
+#define IOPRIO_NR_LEVELS	8
 
 enum {
 	IOPRIO_WHO_PROCESS = 1,
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
