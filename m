Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BB73E88FA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Aug 2021 05:47:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDfCo-0003wy-FX; Wed, 11 Aug 2021 03:47:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <prvs=850e59ff9=damien.lemoal@wdc.com>)
 id 1mDf3Z-0003gL-7n
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 03:37:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=caXEA/43AjbF0F+aUEF/TSnhWu1AbSP+C6PXyEJmuVw=; b=lRwF9vPTAceytFKu7gAtTMGCpZ
 ljkOYqmSLfcNImm2z9CT1IzXvb7Jpn7rYoRZt1gB9Tmswrpimu9HwaeZhUXax9XgaeCwvBJxgZftk
 OZDIXMZBd7Tt6HUTWV7nUZh2i7PfvkRuU7h54h5lIsQ8bE0fq7ORoEyhnz4dQkXsvGgc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=caXEA/43AjbF0F+aUEF/TSnhWu1AbSP+C6PXyEJmuVw=; b=BnRMMGFHOVggbuTaPfxX9u1EVr
 8CyqaviyYgK8wH3JQVWhskuXw/0cFWmaJkEKkTITfCZmBjFGBYxgpsqYnvukwC6g7bhyowl4Ml7O7
 rfLVuCYJ9hBK8PDG/MY/HpQfAqVhEjhh1UZB4Q1XNuzRykDhvlcOC3rrGOsBS0HdZRs8=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDf3Y-0002eF-3c
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 03:37:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1628653047; x=1660189047;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=j0s33+d09cJLd2qYDmoWRU5cJ5eobt/aSkEuXaJrC6o=;
 b=AeDFlJDf8/Q7tFKY/1cTcF/5dL+FXzVrjH2XlGl61/KRki15CUQpznzn
 2SekAI3CXvaGJWJHaUeorb4SR2x2YhaZxfYtHX4M8VrlVRmYpy+ZzKjZE
 hsReWPqPgt/y9Sydtg7ywaUI1IscwLn3NnzuLHpDVOjNkMEhYQZkbvadf
 Aarn07k1nQ/NF2NiQ7FF8IlzGOPSk9L3a0yliu757gkHvD2R10ZFUcV5u
 tKVo9WdIX7zFrtz2OM3GDWFR1DK9ySINmY/tgd86hcp3wgN6n+YFDHSPe
 HC3AJc5uFE3KFPXfcHX6km+dXl4OOdemiIKFAVML+h3shi8H+zuwo41Z8 w==;
X-IronPort-AV: E=Sophos;i="5.84,311,1620662400"; d="scan'208";a="176890900"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Aug 2021 11:37:08 +0800
IronPort-SDR: lgcDOwALee3sDXaSil7arxMoka2oqCgb/p2vLLcvFZrpP4ktH2J2A2zHCZtGSKtvCGaFbo2TT+
 khAE43XfJP0rhRyAO6D0laRh5gTTXMPVnrcOziQrX3CtxNg1YANX5Bm5tZe/TaQG7iKrK9S+6J
 v5IiMrNpWE9U4uR4UGOf5EEMzj0srvWjrcVhkLKHJqK0QbNQ/Ix8zTHWsGly8Gxw0OG3SbI6UP
 J8EqNFJhzwLL0jvH01uFdhWttK4i8JJc7Dku00WKT4Rg77XDD+Kj4/aRX+b7H2w/ztbei745Xa
 ia0Ezl61P3jKtBqHOrCd5M7I
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 20:12:39 -0700
IronPort-SDR: QeCHXqY/a+FukCgR81BdGDYdIyE+0w1AzjKJpMCShWexbiAx90FnRJ+V+isIko4lu+mbaplzmz
 oA7DjAgMs62UPnzMYSmnsht6YtMeZ2iBp/bI6NSwVuKuft8oiKSX2vTV7/bPGz5Tf3mypEolOq
 +89DW0cpmueqKaxItD2d2DjFQDT6woxqHugcdKRmNKtYqSPKPRNkYP52qlFEUDoh1V1GDCW0OW
 I7gNI5Zk1cE8IpvSwlaBfNTxuw/emiu2I25LFYlOK2SU2crMvZYnPkjrgmIjmDS4+WiKBVWuRe
 wzo=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip02.wdc.com with ESMTP; 10 Aug 2021 20:37:07 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Paolo Valente <paolo.valente@linaro.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
Date: Wed, 11 Aug 2021 12:36:59 +0900
Message-Id: <20210811033702.368488-4-damien.lemoal@wdc.com>
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
X-Headers-End: 1mDf3Y-0002eF-3c
Subject: [f2fs-dev] [PATCH v4 3/6] block: change ioprio_valid() to an inline
 function
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

Change the ioprio_valid() macro in include/usapi/linux/ioprio.h to an
inline function declared on the kernel side in include/linux/ioprio.h.
Also improve checks on the class value by checking the upper bound
value.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 include/linux/ioprio.h      | 10 ++++++++++
 include/uapi/linux/ioprio.h |  2 --
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/linux/ioprio.h b/include/linux/ioprio.h
index ef9ad4fb245f..2ee3373684b1 100644
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
+	return class > IOPRIO_CLASS_NONE && class <= IOPRIO_CLASS_IDLE;
+}
+
 /*
  * if process has set io priority explicitly, use that. if not, convert
  * the cpu scheduler nice value to an io priority
diff --git a/include/uapi/linux/ioprio.h b/include/uapi/linux/ioprio.h
index 6b735854aebd..5064e230374c 100644
--- a/include/uapi/linux/ioprio.h
+++ b/include/uapi/linux/ioprio.h
@@ -27,8 +27,6 @@ enum {
 	IOPRIO_CLASS_IDLE,
 };
 
-#define ioprio_valid(mask)	(IOPRIO_PRIO_CLASS((mask)) != IOPRIO_CLASS_NONE)
-
 /*
  * 8 best effort priority levels are supported
  */
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
