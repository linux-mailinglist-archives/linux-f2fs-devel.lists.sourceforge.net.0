Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2C23E295D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Aug 2021 13:19:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBxsu-00067h-Mv; Fri, 06 Aug 2021 11:19:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <prvs=845ab97a1=damien.lemoal@wdc.com>)
 id 1mBxss-00067U-4G
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 11:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RkIdPb7JkMF8FMjPuoap/9gMmdhwB+6lcHu8psID13Q=; b=kNMY5hHCApBq6GvHJ3xBljTZ3c
 8Ob7QoGFuaaCnu3q0EpzCoMz44CG5CNoYJkLzDe2MliobtbFCFnhdL3b4Fz6vBSWWJ57KoBydxbRB
 783karKVEnYlq6xWnJ9FiySi+aq1olVRGgWIO4i/GrQxCzewhRpSTWN9RbBCgABW3NPw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RkIdPb7JkMF8FMjPuoap/9gMmdhwB+6lcHu8psID13Q=; b=I8Mo3h7/nnjOH583JJUEyca0LS
 kKr3JwPfOr8TvVD4vX2m7SxkRUPfTmWfTH6rKAhHQQT8ADfooXkzwMxZYE1pKsF5lNsGBLWl6pzqM
 c4qfvBkUKoHEzmYRi6HhZoOLvAdWkNqr3F2SuYNfoT7Lx2BHwLsqd91cHao3sOSyvx5U=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mBxsq-0004is-Pe
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 11:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1628248764; x=1659784764;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=l73OOtQDoI8Lxh1ymV173oYw+D48u05DEVWXJroeX+w=;
 b=YWo0IZj1S2HO8IpgMK6qssaiLfG/YF5x9zftHF5GeqU7RxfZZgfIO776
 ikbUtHiTc5GYwtl7mSctBPAyGz09/Y6iFLTu5WStRL7NNwlWc7avkUosh
 YjsjCS7Ef9tA+KhTqV1YnR+AgQHiDG8ttPsYIwQZfFkfwcMDg6Fk0FJv3
 /SaW7nBDq52XGvGcHR0pbnb7FZSRoi+EnOIgc/Enw4UZJs4Tl/8AqL2HU
 6iVReeg0/Vuoko8cfgu2hwuvhYpyGsPa4VacyoB/Q3VI8y2sl0eTjcrge
 0wqgoOfpzXRf0oyuNcTYdDW2o8UlF7d+atutUUfv22VuSYO6KdjIwCakF w==;
X-IronPort-AV: E=Sophos;i="5.84,300,1620662400"; d="scan'208";a="176497168"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 06 Aug 2021 19:19:03 +0800
IronPort-SDR: srL4JljDB3RVeaYkBDlrF/o/B5//JPHivAUHTdCZ415vOkNEDknz4ngtLURdaQ2G+OQZnMHVzF
 NAeW1UoPbr0aYlQi72t+NawG9F8ypGRY+AUI+X0J4i55kTEMNLqI6ONv3QhTRZG1RruLaqJxPQ
 bZPh4+wLz0BQoqzSr73t6DMPR1sGYPYL1qEhG2kv+bamueXRmpQ4dO9ZClD4ZO1l7AFQ2JCoHB
 oVKnsTtaAQEjDw4DqJEdVCNwM9mK2w6sba1QKlzgGq/ROnpa0MRRR4ALAUCTZsfkpsYYTiHVQS
 PvhBL3mWdPkOphwuBgAoJ8+w
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2021 03:56:33 -0700
IronPort-SDR: rWQclTnV4zrIjuHqNp5m37PfzLiDm+tiiYQIR3uqTXgrG58JdIgowUlfC+0mhiEQCqTDmjhlnD
 y8cvn6uzuH7/i26snEYEh2DgUrqL2gbAB+21Q3S7F6RCg/cWGl0suNptovhETAP2/muHj8IfmC
 UToT9Nqw+PhYWRQpU/SgolznF4VPDOaKt+J1OvgKwSwcY2w0baLxPP0Y6tsZ/j2697xytR0koV
 ybcTw+Uk849fsUwHqbR5orrtkXQEqDaNLDKieibmiyRiA47MiWbyEFKve9ZgjtFkGNMniKvsLw
 vzE=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip02.wdc.com with ESMTP; 06 Aug 2021 04:19:04 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Paolo Valente <paolo.valente@linaro.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
Date: Fri,  6 Aug 2021 20:18:57 +0900
Message-Id: <20210806111857.488705-5-damien.lemoal@wdc.com>
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
X-Headers-End: 1mBxsq-0004is-Pe
Subject: [f2fs-dev] [PATCH v3 4/4] block: fix default IO priority handling
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

The default IO priority is the best effort (BE) class with the
normal priority level IOPRIO_NORM (4). However, get_task_ioprio()
returns IOPRIO_CLASS_NONE/IOPRIO_NORM as the default priority and
get_current_ioprio() returns IOPRIO_CLASS_NONE/0. Let's be consistent
with the defined default and have both of these functions return the
default priority IOPRIO_PRIO_VALUE(IOPRIO_CLASS_BE, IOPRIO_NORM) when
the user did not define another default IO priority for the task.

In include/linux/ioprio.h, rename the IOPRIO_NORM macro to
IOPRIO_BE_NORM to clarify that this default level applies to the BE
priotity class. Also, define the macro IOPRIO_DEFAULT as
IOPRIO_PRIO_VALUE(IOPRIO_CLASS_BE, IOPRIO_BE_NORM) and use this new
macro when setting a priority to the default.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 block/bfq-iosched.c          | 2 +-
 block/ioprio.c               | 6 +++---
 drivers/nvme/host/lightnvm.c | 2 +-
 include/linux/ioprio.h       | 7 ++++++-
 include/uapi/linux/ioprio.h  | 4 ++--
 5 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/block/bfq-iosched.c b/block/bfq-iosched.c
index d5824cab34d7..a07d630c6972 100644
--- a/block/bfq-iosched.c
+++ b/block/bfq-iosched.c
@@ -5408,7 +5408,7 @@ static struct bfq_queue **bfq_async_queue_prio(struct bfq_data *bfqd,
 	case IOPRIO_CLASS_RT:
 		return &bfqg->async_bfqq[0][ioprio];
 	case IOPRIO_CLASS_NONE:
-		ioprio = IOPRIO_NORM;
+		ioprio = IOPRIO_BE_NORM;
 		fallthrough;
 	case IOPRIO_CLASS_BE:
 		return &bfqg->async_bfqq[1][ioprio];
diff --git a/block/ioprio.c b/block/ioprio.c
index ca6b136c5586..0e4ff245f2bf 100644
--- a/block/ioprio.c
+++ b/block/ioprio.c
@@ -170,7 +170,7 @@ static int get_task_ioprio(struct task_struct *p)
 	ret = security_task_getioprio(p);
 	if (ret)
 		goto out;
-	ret = IOPRIO_PRIO_VALUE(IOPRIO_CLASS_NONE, IOPRIO_NORM);
+	ret = IOPRIO_DEFAULT;
 	task_lock(p);
 	if (p->io_context)
 		ret = p->io_context->ioprio;
@@ -182,9 +182,9 @@ static int get_task_ioprio(struct task_struct *p)
 int ioprio_best(unsigned short aprio, unsigned short bprio)
 {
 	if (!ioprio_valid(aprio))
-		aprio = IOPRIO_PRIO_VALUE(IOPRIO_CLASS_BE, IOPRIO_NORM);
+		aprio = IOPRIO_DEFAULT;
 	if (!ioprio_valid(bprio))
-		bprio = IOPRIO_PRIO_VALUE(IOPRIO_CLASS_BE, IOPRIO_NORM);
+		bprio = IOPRIO_DEFAULT;
 
 	return min(aprio, bprio);
 }
diff --git a/drivers/nvme/host/lightnvm.c b/drivers/nvme/host/lightnvm.c
index e9d9ad47f70f..0fbbff0b3edb 100644
--- a/drivers/nvme/host/lightnvm.c
+++ b/drivers/nvme/host/lightnvm.c
@@ -662,7 +662,7 @@ static struct request *nvme_nvm_alloc_request(struct request_queue *q,
 	if (rqd->bio)
 		blk_rq_append_bio(rq, rqd->bio);
 	else
-		rq->ioprio = IOPRIO_PRIO_VALUE(IOPRIO_CLASS_BE, IOPRIO_NORM);
+		rq->ioprio = IOPRIO_DEFAULT;
 
 	return rq;
 }
diff --git a/include/linux/ioprio.h b/include/linux/ioprio.h
index 9b3a6d8172b4..2837c3a0d2e1 100644
--- a/include/linux/ioprio.h
+++ b/include/linux/ioprio.h
@@ -8,6 +8,11 @@
 
 #include <uapi/linux/ioprio.h>
 
+/*
+ * Default IO priority.
+ */
+#define IOPRIO_DEFAULT	IOPRIO_PRIO_VALUE(IOPRIO_CLASS_BE, IOPRIO_BE_NORM)
+
 /*
  * Check that a priority value has a valid class.
  */
@@ -50,7 +55,7 @@ static inline int get_current_ioprio(void)
 
 	if (ioc)
 		return ioc->ioprio;
-	return IOPRIO_PRIO_VALUE(IOPRIO_CLASS_NONE, 0);
+	return IOPRIO_DEFAULT;
 }
 
 /*
diff --git a/include/uapi/linux/ioprio.h b/include/uapi/linux/ioprio.h
index 99d37d4807b8..5b4a39c2f623 100644
--- a/include/uapi/linux/ioprio.h
+++ b/include/uapi/linux/ioprio.h
@@ -42,8 +42,8 @@ enum {
 };
 
 /*
- * Fallback BE priority
+ * Fallback BE priority level.
  */
-#define IOPRIO_NORM	4
+#define IOPRIO_BE_NORM	4
 
 #endif /* _UAPI_LINUX_IOPRIO_H */
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
