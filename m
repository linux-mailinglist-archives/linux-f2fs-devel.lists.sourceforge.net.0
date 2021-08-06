Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 664753E295E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Aug 2021 13:19:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBxss-0000ya-Qs; Fri, 06 Aug 2021 11:19:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=845ab97a1=damien.lemoal@wdc.com>)
 id 1mBxso-0000xE-LA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 11:19:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4CqbAIE0Qc1J7AmBkjMmIfVBgpqSQpPk2wxD109fEFI=; b=I+V7ZopcGR+meEzArAw6aGCs5T
 bAJ3rodYxWFBaiDPBlxtd3gexN0b9O4ikJrVytdcrbWdqAlbuMjXTWtRjjT6it7c4qxJVgNfSRaYX
 WKUtYKU3q0YEKyletoUml981rwFa+W5tMn28wC8NghOVLwwF2mzlMxORN+h6P858LDc8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4CqbAIE0Qc1J7AmBkjMmIfVBgpqSQpPk2wxD109fEFI=; b=gQGIofJoWyhP6yFOXZ60UHz2kA
 x/y9hD9HCYNZF4uyu8qeuBV/Ke6rPOMi6HzwlZ1CKRT8caCxu+6tt8tLGz99Skqtsz/v/kVCKCUH5
 GEt7Hprk5wyUpgCOSwBKEZTHqa2AWBt212uaoRiexveZv6eO/jcPLLkhgKXR6DYs2TMo=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mBxsl-00EcqQ-0U
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 11:19:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1628248758; x=1659784758;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=KHg8Sra+YQiVG3zbWEreEoFHIL92ska5iKqjkGR69C8=;
 b=klSbj4OjHWIx9/ptMurVPHmsHStqTVCweDezwLwDUXgs7FGVdJKmC8YW
 /lG5dWSv/fDKMkIEeLwi3SE8LSGA6N52m5q6dzQLQW7aRhjiNAE6q8Ntz
 EIZCN0kOGuPP65F1143m1gBHiQ6fV0fvnLbUK/RD8HbI0+INT4gYD+bOm
 eaHREZtjA+qdQ6UzB9bwtvunoVJdAf6cuLBRN+Y5laURS9GCu0nUHJNct
 aKSKtr3s8/FKtaPfR6KqXmYDlzxTfndQ3oIiLXsfUiagrASNL5vzhojyM
 exS5QtqMd6NaA0htXbKUdODthSbzpvmZjERc83AHhH+wS1l11EjXwVU/3 g==;
X-IronPort-AV: E=Sophos;i="5.84,300,1620662400"; d="scan'208";a="176497162"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 06 Aug 2021 19:19:00 +0800
IronPort-SDR: 4lrlVu1zF92WNQUz4OAgjyiEkgI9xXDTsUEWG8NaeElABEBf+SkGBjOEG84KCLXaovq8MGxMau
 Vtn5iNzJ1sEhB4lZe9JiRBKs82nnUYEUCB1+XvMhaIbKC1CGfKoj9pifTNOntjE/gqAui1YsvN
 h+t18i/dy7257KEyGMj1kON9ISBW10frAzGncdQe2J1SHK63HB7ohNeLyb2evitZ546BFo2Y1C
 2KLKDsCNhcCT59kIykhWEt5YFhi3v2nOvpqGeK9yaPk2zSfP3hZihJB/CUPMrW74mMetuAJL7g
 AxwNkuDOiqDDep2QQzAoPtZD
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2021 03:56:30 -0700
IronPort-SDR: gcWMLSnrWNmtL36SOHHbhSiOjB70PU6s11tfT7w0ZQmsr0h4mvgyZDnvegbpX9BR25TIlOGRyA
 CkDI1MxysedBd9ifbugnc8To8dR0dlSSfCJ6+YaxwP06zsWIYJrNHRyuQO1fWzjpy776US/oem
 85n8zyZivyOHZ5XLFSuzU4Q9e1hn3RubAUPg5FczSGPp1FEuzgljovtlXFVMkkIBFt+Sf0lwN9
 DE/0JLLUCfYUWDLozRqRuWPXZDlUlewAztxy6NaT+oOm9CSfXQYTpKm1IsF9OlD8IHP9V64ixb
 3zg=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip02.wdc.com with ESMTP; 06 Aug 2021 04:19:02 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Paolo Valente <paolo.valente@linaro.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
Date: Fri,  6 Aug 2021 20:18:55 +0900
Message-Id: <20210806111857.488705-3-damien.lemoal@wdc.com>
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
 for more information. [URIs: suse.de]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mBxsl-00EcqQ-0U
Subject: [f2fs-dev] [PATCH v3 2/4] block: fix ioprio interface
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

An iocb aio_reqprio field is 16-bits (u16) but often handled as an int
in the block layer. E.g. ioprio_check_cap() takes an int as argument.
With such implicit int casting function calls, the upper 16-bits of the
int argument may be left uninitialized by the compiler, resulting in
invalid values for the IOPRIO_PRIO_CLASS() macro (garbage upper bits)
and in an error return for functions such as ioprio_check_cap().

Fix this by masking the result of the shift by IOPRIO_CLASS_SHIFT bits
in the IOPRIO_PRIO_CLASS() macro. The new macro IOPRIO_CLASS_MASK
defines the 3-bits mask for the priority class.

While at it, cleanup the following:
* Apply the mask IOPRIO_PRIO_MASK to the data argument of the
  IOPRIO_PRIO_VALUE() macro to ignore upper bits of the data value.
* Remove unnecessary parenthesis around fixed values in the macro
  definitions in include/uapi/linux/ioprio.h.
* Update the outdated mention of CFQ in the comment describing priority
  classes and instead mention BFQ and mq-deadline.
* Change the argument name of the IOPRIO_PRIO_CLASS() and
  IOPRIO_PRIO_DATA() macros from "mask" to "ioprio" to reflect the fact
  that an IO priority value should be passed rather than a mask.
* Change the ioprio_valid() macro into an inline function, adding a
  check on the maximum value of the class of a priority value as
  defined by the IOPRIO_CLASS_MAX enum value. Move this function to
  the kernel side in include/linux/ioprio.h.
* Remove the unnecessary "else" after the return statements in
  task_nice_ioclass().

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 include/linux/ioprio.h      | 15 ++++++++++++---
 include/uapi/linux/ioprio.h | 19 +++++++++++--------
 2 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/include/linux/ioprio.h b/include/linux/ioprio.h
index ef9ad4fb245f..9b3a6d8172b4 100644
--- a/include/linux/ioprio.h
+++ b/include/linux/ioprio.h
@@ -8,6 +8,16 @@
 
 #include <uapi/linux/ioprio.h>
 
+/*
+ * Check that a priority value has a valid class.
+ */
+static inline bool ioprio_valid(unsigned short ioprio)
+{
+	unsigned short class = IOPRIO_PRIO_CLASS(ioprio);
+
+	return class > IOPRIO_CLASS_NONE && class < IOPRIO_CLASS_MAX;
+}
+
 /*
  * if process has set io priority explicitly, use that. if not, convert
  * the cpu scheduler nice value to an io priority
@@ -25,10 +35,9 @@ static inline int task_nice_ioclass(struct task_struct *task)
 {
 	if (task->policy == SCHED_IDLE)
 		return IOPRIO_CLASS_IDLE;
-	else if (task_is_realtime(task))
+	if (task_is_realtime(task))
 		return IOPRIO_CLASS_RT;
-	else
-		return IOPRIO_CLASS_BE;
+	return IOPRIO_CLASS_BE;
 }
 
 /*
diff --git a/include/uapi/linux/ioprio.h b/include/uapi/linux/ioprio.h
index 77b17e08b0da..abc40965aa96 100644
--- a/include/uapi/linux/ioprio.h
+++ b/include/uapi/linux/ioprio.h
@@ -5,12 +5,15 @@
 /*
  * Gives us 8 prio classes with 13-bits of data for each class
  */
-#define IOPRIO_CLASS_SHIFT	(13)
+#define IOPRIO_CLASS_SHIFT	13
+#define IOPRIO_CLASS_MASK	0x07
 #define IOPRIO_PRIO_MASK	((1UL << IOPRIO_CLASS_SHIFT) - 1)
 
-#define IOPRIO_PRIO_CLASS(mask)	((mask) >> IOPRIO_CLASS_SHIFT)
-#define IOPRIO_PRIO_DATA(mask)	((mask) & IOPRIO_PRIO_MASK)
-#define IOPRIO_PRIO_VALUE(class, data)	(((class) << IOPRIO_CLASS_SHIFT) | data)
+#define IOPRIO_PRIO_CLASS(ioprio)	\
+	(((ioprio) >> IOPRIO_CLASS_SHIFT) & IOPRIO_CLASS_MASK)
+#define IOPRIO_PRIO_DATA(ioprio)	((ioprio) & IOPRIO_PRIO_MASK)
+#define IOPRIO_PRIO_VALUE(class, data)	\
+	(((class) << IOPRIO_CLASS_SHIFT) | ((data) & IOPRIO_PRIO_MASK))
 
 /*
  * These are the io priority groups as implemented by CFQ. RT is the realtime
@@ -23,14 +26,14 @@ enum {
 	IOPRIO_CLASS_RT,
 	IOPRIO_CLASS_BE,
 	IOPRIO_CLASS_IDLE,
-};
 
-#define ioprio_valid(mask)	(IOPRIO_PRIO_CLASS((mask)) != IOPRIO_CLASS_NONE)
+	IOPRIO_CLASS_MAX,
+};
 
 /*
  * 8 best effort priority levels are supported
  */
-#define IOPRIO_BE_NR	(8)
+#define IOPRIO_BE_NR	8
 
 enum {
 	IOPRIO_WHO_PROCESS = 1,
@@ -41,6 +44,6 @@ enum {
 /*
  * Fallback BE priority
  */
-#define IOPRIO_NORM	(4)
+#define IOPRIO_NORM	4
 
 #endif /* _UAPI_LINUX_IOPRIO_H */
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
