Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 610FC3E22CD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Aug 2021 07:12:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBs9T-00036W-GZ; Fri, 06 Aug 2021 05:12:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=845ab97a1=damien.lemoal@wdc.com>)
 id 1mBs9O-00036C-Gc
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 05:12:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0pAqb7KW5HQHBc5okwxjoO3bGB6E82fHOV0GMKX5+/4=; b=W270+0+0GEU66+JuVqlyCFa1EH
 8UuSlE5KglQ2ydzfZ/wH79aaIjAvZkd6ewI0TQfS7Ji12AmVqarPzSUgYditzCJjdZq8ll+c4lbVU
 zHbd36iliiqTyyTNGo2gKhlGFJHAlvpP0hVsYkrTlGFL8k3AyMAgdxrV4ibV9c237JTw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0pAqb7KW5HQHBc5okwxjoO3bGB6E82fHOV0GMKX5+/4=; b=ZRetTy5MBPdJFBtXBnAUGyhMT+
 QNQBGr282D/afjLKLzsttKs4O/YBmojWw/0OT6QI4r+8TfKiwR38si4jwUzSzH9/wA/2LQHmDbaiH
 wybnVfXSeKtC2IrEV5dHzHDNJrL9XFPvjUyz77iDBK1tuMD0CDDll95QB23elG/PyqVs=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mBs9M-0003ML-IL
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 05:12:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1628226724; x=1659762724;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+OpAXsVDLz2Ny3LQhVu0MrzvsDmzH5eHoGx5hiUXaJY=;
 b=jrteMFMBAF2/Sq1LKNQ9zUdlAJHRe1q59F7AO3NeGBfPB75Y6MZIUa0t
 XRDZrpFbvw/6Chym03XRJuPuaQf/YjXe+MXtVm3BWVsCX++tDzGlCLo8G
 LrXMIeU9QemyHjJOW9yRUhdKQyg2mZ5MA7C8clLF81oOhTA9nESppdhqs
 bn6MR/zzqXA20gg8rh+XqS/uPnZSQ8aQGoLC4LlvWiNjxf7VeGXjGp/hC
 bsDAECS/SUVhscmcDgvMGgUdOw81mJOHuzYsbI1U5y+SZFNeFQK4hFaKW
 WhSEhdRIFfchaAUC78NHzAaNewsS0Cml+qszcE6sRpg77Dcahoxi9ZFH9 w==;
X-IronPort-AV: E=Sophos;i="5.84,299,1620662400"; d="scan'208";a="181285587"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Aug 2021 13:11:47 +0800
IronPort-SDR: xYf8DDFqtvaYgP0MWLNkadsjkS7asIQKHijFrFxv1HPoJ6o66Czwdq1p2xKpH2wIm5MIwUXAKl
 ZhKViL5PAn1qST77XBQvMraL0DXcXWTHYAz81W//figrWMJIzYDFfJx7FLc5h3wHXg+WVPo1cv
 6/ykIZ45NnTvD915eY0Y5M2o5P2bIlMNGAV4oNFDO9cp73DQ/3rRHzeQ7n0xCf33k5H7N9LqCB
 B20E5ApMbRkJVXTfDUxSX297NKCmurudNuwVhpcIhc3qgEVdehYilD8VAwD9T65a+yrCKGionJ
 jpBLbj08ZkMX8WKL7HJAr4yJ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2021 21:47:25 -0700
IronPort-SDR: 22bMgQnoxG5sp7x2hvn2K3YHCdNwflGlEcDrZfWjwLRWYcRJ4BCbuBQwZ3OLjGwvJRCNSzuyof
 7pJoyx1EKVnbN9sT6Bu6L39GDZyMI/J09olBlnSXSzOsioMx8JK7ge3ACzu1gNPPAYmrl95UZr
 crUOI786zIhDAb7zXfX22KLKHLqMOwpyAqo2zplSvPRf25hel/17/oiDuLFO2OjJHgqG99euXU
 75uBR0CG10IJB0mf8PPOTUNSZZbxBeS6GfM5/fK3q1vgowHzDmxoyHVGSGxCQ27zJyOaJoH7/W
 dq4=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 Aug 2021 22:11:48 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Paolo Valente <paolo.valente@linaro.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
Date: Fri,  6 Aug 2021 14:11:40 +0900
Message-Id: <20210806051140.301127-5-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210806051140.301127-1-damien.lemoal@wdc.com>
References: <20210806051140.301127-1-damien.lemoal@wdc.com>
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
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [216.71.153.141 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mBs9M-0003ML-IL
Subject: [f2fs-dev] [PATCH v2 4/4] block: fix default IO priority handling
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
index b9d48744dacb..ccc633af44d5 100644
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
