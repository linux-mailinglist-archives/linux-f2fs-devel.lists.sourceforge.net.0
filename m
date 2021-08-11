Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 289FB3E88EE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Aug 2021 05:40:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDf61-00085i-RT; Wed, 11 Aug 2021 03:40:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=850e59ff9=damien.lemoal@wdc.com>)
 id 1mDf3b-0007me-RI
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 03:37:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dr5dvv2BhY9LEBt4Se5JERsLlPYwiYufwDRll8+o+Y4=; b=A76lmuT2Fr3ApKzjlJ+4SnO27J
 oVLx/7pD0hJrtqFUla+b+xp9Xmc5GNZBsJKTv30uGyLuiEZwXPniyfR8ePsDzcHSEyfrHlfAJfgfK
 rm2yy8b9W/zeLLODPaPCTL/+S8p+cAutW8jo12eTIkdhOW+YKQRK3UUrZDBo3QWokOIU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dr5dvv2BhY9LEBt4Se5JERsLlPYwiYufwDRll8+o+Y4=; b=lmkS8/1i/WTiy7QAZ6ZzytjOI4
 h7W6OW8uDGX+5iE9ELmLNRWO022gt/A2Qj9WuhEVpfUmVoPCSWGVC+1FnV5NLu35GYCxRQmuyqunD
 howGZnba7lRyLtHhi/KSZI5YXRMob1FKDlUBs4JRufM/MFiSWJg1nRZ7tPTaFq7rGsiU=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDf3a-0002eF-G6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 03:37:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1628653050; x=1660189050;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aIY39d4hgoXJ5yC909GBcv4Zo1XR4CYUFpg6offLqg4=;
 b=dnzr4APec1X4QBwhuLrPn5Jr2UTEZu064m6w7Mp1p/f+ZND3bLoaKfCp
 RdaZZBE7RejhOVR3Wx1iCbHys/DA6ZAEJzNBsHlIMK9waQZ1X2/y+H46H
 vnK+UNjD7HGYkiMGQkojtkyZ5Gh4FbzsaAxzguHuBbnLQIsLDErV/kRYZ
 WnhxYffRJeZXHcX1dY/Jbj2/XqHBt8KLnmoJrsXiyIEwM3Vo3XMVcH5EX
 xI6Pul3ZY1lZdUNUhoHIuW+VKr3otSDtxhy36DuHp3fQcgBK0eWOxqNrg
 E4BpwIEbEDZavKhPw5uxqoPMmY9qBMO5cojnSNq4yTKHYIWvKyMT+yVhD g==;
X-IronPort-AV: E=Sophos;i="5.84,311,1620662400"; d="scan'208";a="176890909"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Aug 2021 11:37:12 +0800
IronPort-SDR: eilj8MilRcko25PmWpNSZQ7rq0+blVClUTPdDOB9sheGajkNMQ7pETXqBiAS3Zu8joNR7BvxRV
 xeKWkPqJjjKeHgVgQvspt4Htm/28uLHceaQRsc6Xv+eV+zGVJYzMJAFU2STm+tRP6okzIzyzVm
 BLhg9Wr9x+zbulUYKooOQvItMPxoiWmn1ahkHtDuT1KFASfM7LCVCz7xcoycvYYtp1lYxoe3Cl
 RGo3oc3tELTHwwH42606sPEkwRL5naPQzakdHt28vyP16GOzzKhYg7mWj6wD3f0xKXYUNqRxym
 cwz/hC5+734ezMf8ttF9Yn9k
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 20:12:43 -0700
IronPort-SDR: Xb3/7ZlwUG+JnG3iXyej6Y9GLbcebGNIfPJy6Y8FRbvgl69fAikHEiz4PTscm0LpsRymbEL1M9
 YBnLe88i40M7lEwfZSYnJZKTIf1T9bN4cyxi7cYb4aqEOiLTy8dbisxhryK4ErmqWwTyfKy4hm
 A5LhpCiaYghAo2RB2Hs5jbkSF0+hw8AxP04tIZ8olrXMvGF9hzbP2zi1i03O1QPD6UllLz1nzJ
 XeEcq0aFesgKtspnyc6Qae6mQC4uMddcX/niF19d8OlOydIhjzGC+I4d6ahrUZx/iIeZcU/G20
 i/0=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip02.wdc.com with ESMTP; 10 Aug 2021 20:37:11 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Paolo Valente <paolo.valente@linaro.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
Date: Wed, 11 Aug 2021 12:37:02 +0900
Message-Id: <20210811033702.368488-7-damien.lemoal@wdc.com>
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
X-Headers-End: 1mDf3a-0002eF-G6
Subject: [f2fs-dev] [PATCH v4 6/6] block: fix default IO priority handling
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

In include/uapi/linux/ioprio.h, introduce the IOPRIO_BE_NORM macro as
an alias to IOPRIO_NORM to clarify that this default level applies to
the BE priotity class. In include/linux/ioprio.h, define the macro
IOPRIO_DEFAULT as IOPRIO_PRIO_VALUE(IOPRIO_CLASS_BE, IOPRIO_BE_NORM)
and use this new macro when setting a priority to the default.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 block/bfq-iosched.c          | 2 +-
 block/ioprio.c               | 6 +++---
 drivers/nvme/host/lightnvm.c | 2 +-
 include/linux/ioprio.h       | 7 ++++++-
 include/uapi/linux/ioprio.h  | 5 +++--
 5 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/block/bfq-iosched.c b/block/bfq-iosched.c
index 4b434369e411..e92bc0348433 100644
--- a/block/bfq-iosched.c
+++ b/block/bfq-iosched.c
@@ -5411,7 +5411,7 @@ static struct bfq_queue **bfq_async_queue_prio(struct bfq_data *bfqd,
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
index 2ee3373684b1..3f53bc27a19b 100644
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
@@ -51,7 +56,7 @@ static inline int get_current_ioprio(void)
 
 	if (ioc)
 		return ioc->ioprio;
-	return IOPRIO_PRIO_VALUE(IOPRIO_CLASS_NONE, 0);
+	return IOPRIO_DEFAULT;
 }
 
 /*
diff --git a/include/uapi/linux/ioprio.h b/include/uapi/linux/ioprio.h
index aac39338d02c..f70f2596a6bf 100644
--- a/include/uapi/linux/ioprio.h
+++ b/include/uapi/linux/ioprio.h
@@ -44,8 +44,9 @@ enum {
 };
 
 /*
- * Fallback BE priority
+ * Fallback BE priority level.
  */
-#define IOPRIO_NORM	(4)
+#define IOPRIO_NORM	4
+#define IOPRIO_BE_NORM	IOPRIO_NORM
 
 #endif /* _UAPI_LINUX_IOPRIO_H */
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
