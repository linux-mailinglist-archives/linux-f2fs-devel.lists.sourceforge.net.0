Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC9B3E88EF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Aug 2021 05:40:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDf61-00085u-WE; Wed, 11 Aug 2021 03:40:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=850e59ff9=damien.lemoal@wdc.com>)
 id 1mDf3c-0007ml-5q
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 03:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HO6UdtCc3K8ESoxYxgO9sjGDh8ao6Ty1/IXspWERdv8=; b=WGS8edXZoE2aEh9gY3gNddCUhE
 VUHBXioFi84z8QosmLJtMRuc4k8OGcuGHdTvHlDUcjI47JCSW25AfHgww/Or/adOpgN1QdWeLwU6w
 ZeNtH3ps2BY0KOnn7hZgKzqke6DSMJ4A0nqLWs8c8XTcQoBz04oil+fi8mYOrIC0y/IE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HO6UdtCc3K8ESoxYxgO9sjGDh8ao6Ty1/IXspWERdv8=; b=Oe1krUVUrgBTVb+Kf/xMrqO6et
 0zgjZDRGO4XW8sGdgjYSJ7JTCcKvLFwzkPVAQ1f0SvzzufvjwPAaNB6wWXlN7gXEIlbHt/8ApLRB/
 fw/4eB6DF4m7DsAU4gJxP7YdbMEaIrE/c1ZSfWbFEdSM0Xy5/8w78b7x6Xh2oFHumj3I=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDf3a-0002fL-7Z
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 03:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1628653049; x=1660189049;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+YKFJGf1DXtdTGWfV/bu2IJ+KfNBXvFKm3zTlEpFKjU=;
 b=Ux1zyPRkoj3LURVhQ0UI1HBXO8B7LfDBgRrm/C90CIKu7cSxpwUIqJoa
 stfQSGNoCSjdSmp0VDTjjQZ87g6NlCHu+ZgDPa7aCNhUUFbn21tjtTaV2
 Z3yo7Ctg6fhXL+AYgslqR6WTciY55izmt4wkOWJkKbbh7tmT0cwKRpdql
 FcAttlPIjIZUbjlmXM6lmC3k9Jlx1k0UI/NbvUxg9l6vFjrW0QiifH16w
 PpGl76fsiX4+dnSEuk8OcXXLuREN63/Uoa4Y3enxTxxDknFmgKRF9ojBs
 hjFxACZq34R/poK4oLgFHVJQurzJuKU2HkKUgh0dOmiRKPOLNkTP0UMZT Q==;
X-IronPort-AV: E=Sophos;i="5.84,311,1620662400"; d="scan'208";a="176890906"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Aug 2021 11:37:10 +0800
IronPort-SDR: VSPLOSZAHV+bI14PJLpTZ41R/BlncWCw9+5HziEQHm2Dgi0bqiQVoeBPPk0XEEhEl51cNdC2EL
 7C4jX77uV/+uraVIftdcEw0Kk2oT8MeknYeJa1eXPq1Ous9dTyt1WlR51dQFOi/Ko94p7Z7xMv
 iaX/reSZ9Vz9BFRjbdqwzA0bvM2cqP2CVDfRUDfQLXDo3O6FVEuz9dkcOzKhIsOc9CEkcULNBI
 8qg1IwNbPOs9chXC0LA88zLSzkOPaPQx7OKX317UhIRvOmPo69r7TX+czWT19qWGkBli0ou9QT
 f5prOgCgYSX9mbB0Cj+8LVId
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 20:12:42 -0700
IronPort-SDR: xNep8P0pzuh2eZT9WzcRvVAjSIspnFg1trw1UROtsdqh7v5PrbS+mSpP745Hl9b4WfPVtlOf1A
 kWtPfZHmO2iRVKMUMTPJ7BIiS1rR6tdxVaUAx0LiKeHRPaQbuxBj0aIa1O4+IS5knSWeLDHKwO
 GzYc3Kb+dvqicIs3Nnj0+6Oly/WiCKL6BsCva9pCbCOrA6ivGxp05d71oaz9rNOXDSE39/dPdy
 LV11YjlEMk4Bn2h+IvvY4QFIn7GYBe7XkEhEgt6ssT7iZF4Q/u0gl0w/mpnOO1bckq/32EbdwQ
 1ZA=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip02.wdc.com with ESMTP; 10 Aug 2021 20:37:10 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Paolo Valente <paolo.valente@linaro.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
Date: Wed, 11 Aug 2021 12:37:01 +0900
Message-Id: <20210811033702.368488-6-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210811033702.368488-1-damien.lemoal@wdc.com>
References: <20210811033702.368488-1-damien.lemoal@wdc.com>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mDf3a-0002fL-7Z
Subject: [f2fs-dev] [PATCH v4 5/6] block: Introduce IOPRIO_NR_LEVELS
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
levels, similarly to the BE class (IOPRIO_CLASS_iBE). This is
controlled using the IOPRIO_BE_NR macro , which is badly named as the
number of levels also applies to the RT class.

Introduce the class independent IOPRIO_NR_LEVELS macro, defined to 8,
to make things clear. Keep the old IOPRIO_BE_NR macro definition as an
alias for IOPRIO_NR_LEVELS.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 block/bfq-iosched.c         | 8 ++++----
 block/bfq-iosched.h         | 4 ++--
 block/bfq-wf2q.c            | 6 +++---
 block/ioprio.c              | 3 +--
 fs/f2fs/sysfs.c             | 2 +-
 include/uapi/linux/ioprio.h | 5 +++--
 6 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/block/bfq-iosched.c b/block/bfq-iosched.c
index e546a5f4bff9..4b434369e411 100644
--- a/block/bfq-iosched.c
+++ b/block/bfq-iosched.c
@@ -2508,7 +2508,7 @@ void bfq_end_wr_async_queues(struct bfq_data *bfqd,
 	int i, j;
 
 	for (i = 0; i < 2; i++)
-		for (j = 0; j < IOPRIO_BE_NR; j++)
+		for (j = 0; j < IOPRIO_NR_LEVELS; j++)
 			if (bfqg->async_bfqq[i][j])
 				bfq_bfqq_end_wr(bfqg->async_bfqq[i][j]);
 	if (bfqg->async_idle_bfqq)
@@ -5293,10 +5293,10 @@ bfq_set_next_ioprio_data(struct bfq_queue *bfqq, struct bfq_io_cq *bic)
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
@@ -6825,7 +6825,7 @@ void bfq_put_async_queues(struct bfq_data *bfqd, struct bfq_group *bfqg)
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
index 936f0d8f30e1..aac39338d02c 100644
--- a/include/uapi/linux/ioprio.h
+++ b/include/uapi/linux/ioprio.h
@@ -32,9 +32,10 @@ enum {
 };
 
 /*
- * 8 best effort priority levels are supported
+ * The RT and BE priority classes both support up to 8 priority levels.
  */
-#define IOPRIO_BE_NR	(8)
+#define IOPRIO_NR_LEVELS	8
+#define IOPRIO_BE_NR		IOPRIO_NR_LEVELS
 
 enum {
 	IOPRIO_WHO_PROCESS = 1,
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
