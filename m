Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D443E22CF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Aug 2021 07:12:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBs9T-00036O-Cf; Fri, 06 Aug 2021 05:12:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=845ab97a1=damien.lemoal@wdc.com>)
 id 1mBs9M-000365-96
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 05:12:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QbgWi2VAKYms7HaTX/4U47tejgC6uIs9GnBGHPESsMo=; b=BwmNUo0XycRyvgNp8cRFzklNRe
 YabbSDNkqoSPkPhulEP6Mlz/d2RlAsL2akqlOfNNcBU/WRB8FLeTP3/4XJjorABlq2oU3gNY+Uo4r
 53UL+yCQrsns5QHCb/o2hXpZdM1G5CU4HKHfoR8rKh0pDmhGipqugqrTb3A8d3sk1gxI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QbgWi2VAKYms7HaTX/4U47tejgC6uIs9GnBGHPESsMo=; b=R4+phZ0LgEcUMwQsuUEnOc59X5
 PG4wAt0M9driTsuZaXhdSEjZaceeMPbT/uP2K3my97hPCC3EWySjhaIqGNc2CtB1YEj5Ys8LaHbI8
 We3yfIBOmNwgxWOr2NA3wRGyHnJzdIfXLEZWN7BJH36YA36f6ybCCPwnlxb1G9pVAtUs=;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mBs9C-0003LZ-MA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 05:12:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1628226713; x=1659762713;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Wp3XBQ4C2+RmXOsZliWFH3OmT1O2FHqUTFX3us6q2JE=;
 b=kR8gx3qou/G8UWwgcfI443bwL/Oov01ZIlB2BgEzM+PXyYudIcDyMTYO
 SeFamZc95kIGZQlFDJhgV+c+tZSOGE+ivzlwBOOWsxpUuSrONG89DjqwG
 Vk7GDcjV+2wBwK7plchgxG9CA8z9K5IlgEIn2IKC909lzS9l4dbbdOQ/N
 mD3Da1jlI6DJdpTXmcMta3Ue3Q/XfbDYTBqG6N831O7iYr4li52jMHBxm
 H1h40OXfTNOqwCUIVrt6P3A2qQSjpf7w/HmXY9NGez0L6OQX0+qiOiiJv
 iV/28asySOh8gyilkoJ1rQR2Z9uVwFxpTo+udG/kS268Gi8os/5DO6MO+ g==;
X-IronPort-AV: E=Sophos;i="5.84,299,1620662400"; d="scan'208";a="181285574"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Aug 2021 13:11:44 +0800
IronPort-SDR: vbHGayJ5RAKVG4Qt6YU4Oh5p2qRs3WBwfBoT1+WVbaTJ3Y94YG2XabinBd528qKlS9iQWTddoo
 Ovv7bW3C6+GXPmUniB56KjeJu75sNLK1jA+x1IYx/zOhluQPMHj+KuTPGAzt2dutX/TF1PETxz
 51VtVXE6UUVkVdYVFpEN9YRexNmCE3C87RkxUKzCw4jX4qGathPbo6rL5aYVOrG+BKPJ9dQ7L9
 8BsW7j1um6iI59M8qzJrY43woFWM9DnloT25Ma8BNSXFHt8HNRi9oU13aOqDJ+k0Dc3L5Fhi+Z
 vTpufqP84oIB+x7GePYinvji
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2021 21:47:21 -0700
IronPort-SDR: QNJm2PaOzMPWCzdw1EsuuAdxLxP8R2nonVFdbU2x6988au7+jluwWdTJf1/OdxcT/WE9I83FS1
 vl/zDDGGUGU67rnSgrqHbb7ehIbOEEINXE6KcFMW6wvRqK26FrwJ3bf/Sn5DsFnArrqRt/tf7W
 GRHYGhPMa7dKQQ6Dqzt1DO4o2cxg5+XjA3UStOJfOO/ap6KlEEkgr/47WbnySi68TsWSZCa+wS
 fU7u83xUuMch1yb+owmg4tgyyzDBjEuyPLK0/taLAd3tgu8emDshcy8Dw7ooELfCoGOWoZkhkU
 7ds=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 Aug 2021 22:11:44 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Paolo Valente <paolo.valente@linaro.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
Date: Fri,  6 Aug 2021 14:11:37 +0900
Message-Id: <20210806051140.301127-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210806051140.301127-1-damien.lemoal@wdc.com>
References: <20210806051140.301127-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [216.71.153.141 listed in wl.mailspike.net]
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
X-Headers-End: 1mBs9C-0003LZ-MA
Subject: [f2fs-dev] [PATCH v2 1/4] block: bfq: fix bfq_set_next_ioprio_data()
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
