Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5BF3E88E1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Aug 2021 05:37:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDf3X-0005tb-Fk; Wed, 11 Aug 2021 03:37:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=850e59ff9=damien.lemoal@wdc.com>)
 id 1mDf3V-0005tJ-38
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 03:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yC7bB7BpUSHJNPnn9f86hpeEGfs6W8RAQZin4kvixzA=; b=bPGr0L+RrdRbg7twArdHNKzor9
 jqJM/1ExlNYW2pkJwg9kuGNKa3dKY/r9IcojCQp90s0UxAxWEuoLrjlzuYXTeVWSZBupEXBgKoYLx
 cKMSF4Gh0HPXPZV8DVPtOiPwvhfTQONzdi2I7Ha37xoIEjj1uNmMA+2ZPW007wtazLh4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yC7bB7BpUSHJNPnn9f86hpeEGfs6W8RAQZin4kvixzA=; b=E3X0zgIuw4S8233cDjOnqqi6vv
 CO1QvNDBPHKZXb5mNXLWxJh3cVi7n76bD8hI04BDPR2Yv26M+eHs4G0U8w7uw7iJXfOWylV9pxr19
 tEh+5ZEZasdFnQmImjePzqYzz9htZNBzcCYWH4lkt+wR9T0x2Jy25XeRq9Q+1+UjyNjw=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDf3Q-0002eF-Qd
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 03:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1628653040; x=1660189040;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=RGO3k7Im0/zmf/Hv3HDGjqGVpHrOQ5t3E9jTrtJYPo4=;
 b=O+0nszcFgXa7cnu6Ne59QVp7R/li99XpbubKISDk67anFDVQxI8l451t
 Ob/ZNTNY2thwIu5JsFMMzezUCOuDFPrr6NXbMYuokixy0MpnwBp1EJrRi
 SUAehpiRh5ftZP2ubAU5NT9v1AgO7TOIGAqwf+5KjBA0aRTEuD8MJOo81
 uboElpICrIa1NA3ryleb+eBGchHjSx3LAIvZ5GENGAbGX13RfeNPpzbfa
 LzQxURdXxS7uGLitwRszoma9d51QjSQJVMx2xctpRYgpKubz16tVrGlL9
 Gv2jT4Mgq3dUV2CzUfys7tp2/riH+wTJV9bJwP2a349vqZAbr7m6BXmgz A==;
X-IronPort-AV: E=Sophos;i="5.84,311,1620662400"; d="scan'208";a="176890894"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Aug 2021 11:37:05 +0800
IronPort-SDR: G8up3OxKegNSuHk34l54xQGNqlWs7U2BdPITeFT7JhoAAOxtnABgh2y07OR+D6gPvOYggeSAHd
 7BbiotCuhamL2A2bNo7onDI/LyW6qPOK9yiq5LfA5tntLXt2/YMzQCWk8qb2phf8pggMcp/8gU
 9H/aERpD2hLgI1Huh/h7CfSyQnz6SWzsrkCRLpQZKzqc9Qfkk6uEPPvzCzw2+brwYd7m8sJZ4J
 J0viUx+h32dl01W2CSIoeTQLJEZRndcdnm4lyxD1SIz+BjX6PLRd01t6gUGWFSRLc/9Twzi9jH
 +xbMeNRfpfGv74gP9mz56VFi
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 20:12:36 -0700
IronPort-SDR: trfAXxLIff8ymscFRb/l6NN/HkytkwfYfAw417EtaTEXyemhSBWjvjNC8ki0XCnK4sIwPxfn7k
 Abmk4qG4Py4oSPrzhMTJ8hjxLYp18VB//UY4PolxdCzCaNGkpt5x1ayHXZak3TPz+dMw3tQ3zh
 0xPwojW92rU0BS4DXETNoZJT7r4e2GQmj6Pn+06g8VMiSUCVNotZJjyXMX+kOZZUKPFr0OOVL2
 /e+b2/phSfkkHuzahvspJ7SV5uk+P9t3GLtkD3uT6gwqMLwRGrveyJuwzidx1JUrm6q3UVWdAU
 QwQ=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip02.wdc.com with ESMTP; 10 Aug 2021 20:37:05 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Paolo Valente <paolo.valente@linaro.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
Date: Wed, 11 Aug 2021 12:36:57 +0900
Message-Id: <20210811033702.368488-2-damien.lemoal@wdc.com>
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
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mDf3Q-0002eF-Qd
Subject: [f2fs-dev] [PATCH v4 1/6] block: bfq: fix bfq_set_next_ioprio_data()
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
index e4a61eda2d0f..e546a5f4bff9 100644
--- a/block/bfq-iosched.c
+++ b/block/bfq-iosched.c
@@ -5296,7 +5296,7 @@ bfq_set_next_ioprio_data(struct bfq_queue *bfqq, struct bfq_io_cq *bic)
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
