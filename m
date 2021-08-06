Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D153E295C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Aug 2021 13:19:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBxsq-0004EC-GM; Fri, 06 Aug 2021 11:19:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=845ab97a1=damien.lemoal@wdc.com>)
 id 1mBxsl-0004E1-0c
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 11:19:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o6SO8O/EoHFQOHiPSXEVcg9J0xj2Ce08G4J++qzu1LU=; b=ThZcz3Bca68tCZY2H8ZMo5B4o5
 5Ug5UPUbCJZ9Jlu6rsg01dsfGZD/xUobCyL880IhANPbuyGpM7Uc7SAPQYqIMz/dr/xtTb/mYJoum
 txnFBOTNe81gQ2UPi4K4fjVaxKO+GJxDn71IiHsDJmzMuf4uBYB8HtqhJtsa+h6/9VGw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o6SO8O/EoHFQOHiPSXEVcg9J0xj2Ce08G4J++qzu1LU=; b=Jb7qC02zKIUoTz00XHrRCFWe3E
 /NgqgQubcgANj1cybKl3I2fryRs4G8yES6RFM44nflKPVtP5m+ayRoQz5u5OCaUbGQBU1Z4WNwQUd
 nnOpoGnz9KRgQscBxtA1D4YKHMpz5tnK1X2vRRA4fVPG7m+zKhJ+H4bdt21RY18x+m+c=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mBxsg-00EcqQ-RQ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 11:19:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1628248754; x=1659784754;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=eBYyIbp0CVdKv+DUuPIld1FS7dkZOV4BqVmB32O6afo=;
 b=io7hGXoKUwEm7XKZ3PACkBwKDRW2BlzjTKkQtNieNFAYcLQAUEv3OXye
 ScN1h41M//lIXg4kRvyvJp+/Mo4QWkzfWgotehs1N0ku6TYF1wtqA3Zuf
 FtZd95vhSttQpSm6L42v7+8HcAIU8NPLRFSL/V1ouj3JcE1OjyESBjvCn
 ADIVnOfWdFEnxYFuUr7Qfngg+YhEDin9yZ0JfT35FqLl4dcRPHVBUSEp/
 1xP8f71k8Dnt/csqDBIOfLwExQmhlE7OSmEkE4y5XxELQ5HR0sUqUOAni
 EUGleqyMc8DNCOrO+dBIGxZ71rZOTLSjgHwTiWwKUPgTsd/TGL9A8qrkk g==;
X-IronPort-AV: E=Sophos;i="5.84,300,1620662400"; d="scan'208";a="176497161"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 06 Aug 2021 19:18:59 +0800
IronPort-SDR: qxBdRQfX7gsKRbJsDBjGzifvekqH8XB9fHmbjJ5Jpmm7si+aNHSxIvrCCGK4ln3HO5LVQVNEL+
 JMBM7bvTMdJJGOhS6uLik775w3A1s7ONqzN2Ntk3sXqq8+KDWBlOR8jOW+qdRDQG/IC9++NluE
 jz8Jj5G7l4xr4QB4VGmBoS6ZuNYP6TWb8CRNKuh4//62KWIk2tPADEPFWY2ns4RuUSeC+FqnwB
 382aXuA+QfnBCLl01E1uazpU/6hR08kwjOkYeZiWN7Fh/gcTyIrK+hfm3US6l1uJxTBE+pDHOE
 ru4se4zh8+3gHWjbLvLsN+Y4
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2021 03:56:29 -0700
IronPort-SDR: oTraU1UZnUhDYzNkFnTyCEZSYb3R1y0q03QZNJcThma5yfo1nzha3wSAVDuYHtxM3E5xJp/K3D
 hsoQcty3B1rJom29TclStr1w5HcbSYCsLDm/Mw9KNbgpQUWd0twa1Cz2cL8UJ8yU/cmpnUvzhQ
 H7/w3xDv/Eh7gm0cuUaRJKoJoznqISkw/nOhjGwxjjpaUTTox5IFkYXkz33VQFTQcPDDfDfxkQ
 rcedViC5nE+U9IaUC/v3RDFjBoig4edFMFMzYcvDZZ660zpsN/kBDyB3NhH6DKbsjqfpgajeJJ
 Gx0=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip02.wdc.com with ESMTP; 06 Aug 2021 04:19:00 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Paolo Valente <paolo.valente@linaro.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
Date: Fri,  6 Aug 2021 20:18:54 +0900
Message-Id: <20210806111857.488705-2-damien.lemoal@wdc.com>
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
X-Headers-End: 1mBxsg-00EcqQ-RQ
Subject: [f2fs-dev] [PATCH v3 1/4] block: bfq: fix bfq_set_next_ioprio_data()
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

For a request that has a priority level equal to or larger than
IOPRIO_BE_NR, bfq_set_next_ioprio_data() prints a critical warning but
defaults to setting the request new_ioprio field to IOPRIO_BE_NR. This
is not consistent with the warning and the allowed values for priority
levels. Fix this by setting the request new_ioprio field to
IOPRIO_BE_NR - 1, the lowest priority level allowed.

Cc: <stable@vger.kernel.org>
Fixes: aee69d78dec0 ("block, bfq: introduce the BFQ-v0 I/O scheduler as an extra scheduler")
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 block/bfq-iosched.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/bfq-iosched.c b/block/bfq-iosched.c
index 727955918563..1f38d75524ae 100644
--- a/block/bfq-iosched.c
+++ b/block/bfq-iosched.c
@@ -5293,7 +5293,7 @@ bfq_set_next_ioprio_data(struct bfq_queue *bfqq, struct bfq_io_cq *bic)
 	if (bfqq->new_ioprio >= IOPRIO_BE_NR) {
 		pr_crit("bfq_set_next_ioprio_data: new_ioprio %d\n",
 			bfqq->new_ioprio);
-		bfqq->new_ioprio = IOPRIO_BE_NR;
+		bfqq->new_ioprio = IOPRIO_BE_NR - 1;
 	}
 
 	bfqq->entity.new_weight = bfq_ioprio_to_weight(bfqq->new_ioprio);
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
