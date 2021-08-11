Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A783E88ED
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Aug 2021 05:40:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDf60-000855-Nf; Wed, 11 Aug 2021 03:40:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=850e59ff9=damien.lemoal@wdc.com>)
 id 1mDf3Y-0007mC-3j
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 03:37:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kKGGKzA5fdwd95/6w+lUdE9AmP9/h2ss8dYT+5HbtQ4=; b=UZ4aGhF8OvA/4HSAzQl+jPOiqZ
 58EiN+7CJLdoKAdqgV9iy2HE3t8R87G8lPLtvw08qrYHUe+1L3FBjBoOYAObd/s+u7YaVLOTqwuws
 y+52j6MYzCjcmLj/R8aEXkt8ks5qTzjjqeirs+lOS/IIqKV9YZaPm1VvsMXU4FSmiv+0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kKGGKzA5fdwd95/6w+lUdE9AmP9/h2ss8dYT+5HbtQ4=; b=RqBgvbGr/CXoJ4rg/oTXY+fyN5
 PPpeMIar1RvdzvktTsjdwPDaunrY78QmI42tW9lhUeLg//POlNj9tbTHgGCxXv4CKqzhT5OqRW5+j
 NHk3btLtXFjYH4v0A7SJMNk/YO77oYjX/3hl1s6052/LT7n7ifxwZnXcUPPSNwH2LEj4=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDf3V-0002eF-3Z
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 03:37:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1628653044; x=1660189044;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=tda/wI1ZwrYqH4umND8+Og63Ye/tFaSza1oypzr1bnw=;
 b=kL95xcN8vekLoijUils2ARPnm/o8vcHkl6EtcQHMDSSIpDpZIUwdEJKk
 tVtxiOh46YGETzopA3WSDD9b53wRliLs3oHhLX9OZKCTscLxY2+xSHC3y
 /UtVnHENPtQ0oawwqdSXhkn2mQXE0dQGU+cq3GnAiZO8AYq8gRYFOUeLB
 jy7abkK3WrtseWRrU93w3csMz+CpfbJAtKMB4XOj9w/QsovdtOFcHsrxx
 oCHVD5TuqQOaeUZR767QTJDeNiuSFlOs77TuZReJBPLRqRcUT2OZP9RyV
 YPUYa8oV7rJ5c/J8v6JVNEGY1fMHQrqRmyc1ncs/cfGvhxO+D7imG53hd w==;
X-IronPort-AV: E=Sophos;i="5.84,311,1620662400"; d="scan'208";a="176890898"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Aug 2021 11:37:06 +0800
IronPort-SDR: uU6TZSKZ+A0qLPLhJmKY9qq+Ho1YNgMhnnLB4ykFkNHAD4ZH+cUkesvA91Exe7VtYAXULEM8Kc
 DjajxrTBRG82Qxq7jZCV1xcYwuts21ICO0IuXtm8dlv+J0WDVJ7cret5JgChXekC92h0+LsY3P
 W7lvUIUmqj2MWvaaQjrb7rLtEByzmvrszP+WKPyNYbl9N+0aX0DIq42F6sF1CG4pUa3aqvpATW
 IBbyM2/xz+ViV7Guc8I9e/DeYBAePwRmdv/HXHJpGn0JNXlZxH8p2vzbJIflfqpY5ID37yioug
 VhJ4EYV8tRW3cdgntw5mxqa9
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 20:12:38 -0700
IronPort-SDR: FEZpBFus5K4fWMAEN+mHd0TgFuIveatp72Uyh2x27MEW0zq4qojs02FF9Dxp3k7YSsNwfmtUkb
 LiYzfuXUFhBfjFGA77x1/YdMOkmVf2QTq3DXgVTMr3u5g6Im2G5lGNZMxOxkAZQvydmmhJOxY3
 cgbyqTsQTKluBApb9vli7rxpTAHQt4aLK0LEaFVlxn3o+6dpXxWkTqjlqx7dk1W/E+gNtFLwcS
 p9UY0rh+tKoLKXMAa9+IRCWk7+YVWTSQs9L1klQ4TzgGpkYCKz9g7QbcV2yurdj6ZWOW9icMNS
 GMo=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip02.wdc.com with ESMTP; 10 Aug 2021 20:37:06 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Paolo Valente <paolo.valente@linaro.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
Date: Wed, 11 Aug 2021 12:36:58 +0900
Message-Id: <20210811033702.368488-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210811033702.368488-1-damien.lemoal@wdc.com>
References: <20210811033702.368488-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mDf3V-0002eF-3Z
Subject: [f2fs-dev] [PATCH v4 2/6] block: improve ioprio class description
 comment
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

In include/usapi/linux/ioprio.h, change the ioprio class enum comment
to remove the outdated reference to CFQ and mention BFQ and mq-deadline
instead. Also document the high priority NCQ command use for RT class
IOs directed at ATA drives that support NCQ priority.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 include/uapi/linux/ioprio.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/ioprio.h b/include/uapi/linux/ioprio.h
index 77b17e08b0da..6b735854aebd 100644
--- a/include/uapi/linux/ioprio.h
+++ b/include/uapi/linux/ioprio.h
@@ -13,10 +13,12 @@
 #define IOPRIO_PRIO_VALUE(class, data)	(((class) << IOPRIO_CLASS_SHIFT) | data)
 
 /*
- * These are the io priority groups as implemented by CFQ. RT is the realtime
- * class, it always gets premium service. BE is the best-effort scheduling
- * class, the default for any process. IDLE is the idle scheduling class, it
- * is only served when no one else is using the disk.
+ * These are the io priority groups as implemented by the BFQ and mq-deadline
+ * schedulers. RT is the realtime class, it always gets premium service. For
+ * ATA disks supporting NCQ IO priority, RT class IOs will be processed using
+ * high priority NCQ commands. BE is the best-effort scheduling class, the
+ * default for any process. IDLE is the idle scheduling class, it is only
+ * served when no one else is using the disk.
  */
 enum {
 	IOPRIO_CLASS_NONE,
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
