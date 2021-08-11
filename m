Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F25223E88FB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Aug 2021 05:47:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDfCn-00063T-4i; Wed, 11 Aug 2021 03:47:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <prvs=850e59ff9=damien.lemoal@wdc.com>)
 id 1mDf3a-0005ts-Fu
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 03:37:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=suceE7UkMo5c8unXi8kut0l5c5+IBYa1S4dLL5FY0hk=; b=ZpSjLkCgEc8uYRAVNk1gWkqbAi
 3FqXjMc1kXJBFiJkX6YSTzdn5i31UIhM4VdsWX3tzA10grE+/GYopE6wvnku/i4wc/yLM3vVpJcrl
 Qp+R1oSxtx5/Po2DHgRdwUvp2/VSFsT8DrzGRjMwJLtgj6oZGHW1Z8/M5ZqTNGYGf7pc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=suceE7UkMo5c8unXi8kut0l5c5+IBYa1S4dLL5FY0hk=; b=cu8yCuZd5FyhzPLO4KgHdG2ZEx
 59STb/d6X7cGOHXfLeUzpRq4pv/QmM1Vq4v7DS5qNUGGpL93orcgayQclaCapVIYf5adUlk7b+hWO
 k4JTsp4SlK3XCXkUm4QrYbhwPinSM1CoFnsgVq1b3JUQifjqiGsBeOBx0RQnAM/LtLFY=;
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDf3Z-0002eF-7z
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Aug 2021 03:37:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1628653048; x=1660189048;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=TLB12hws/We5+bFUS7lZWqDMzP/Axao9rVRwnxqY1E4=;
 b=D5PCwiV6KufoOtJimP061GqXCyfUCxcDktTIkEGkxx/bpUHZcnhVWVJa
 zq7C3q7R1LZxHJwp758xDR+0CQcca9b7iYRxPeHyKs7QJhxodh5YZwpZf
 gSYA8IDjJ5U1N1C98ZDBifQOV4ubM+uy9bOzt13S7NTObSVtbZPC9zvBG
 RryihbI98eds93s5x/r3iZ1zbgC5plGoKaFqcRs86NlYiQMuxq+PAg5Ox
 0pYNU2cBnqj/7Bsqv4Il7ww2ATtwPUr3ehjFtEFRgaWizKS2+15wBifA9
 HbtL3V2mqHlgZOE2p7oObvqWUdsa98BanYpuCW4UP32gxdYZmNIbA/3kx Q==;
X-IronPort-AV: E=Sophos;i="5.84,311,1620662400"; d="scan'208";a="176890902"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Aug 2021 11:37:09 +0800
IronPort-SDR: tZZPpwcHCR9kCJhJXuXaknjWNV824qKx0lb2QDJWJuTudv4Os0ebi7aWx8LObMNpMks12kIByp
 KCzwkeZIvW/6h3le2lWTdjueB46NC6s+I16udpa/gk4Ud4aQTLv9516W/JEbqPMCefvHxTmcs8
 93DhW/dy3HJTxNCSHmpw3ohNVv+q/9mUGPomq82ehSFxuvxHrHrZ7QvCqp6gAlMA/UrC/RkwJj
 HwMMFexjiG5GZOEubbI+MW4U42tVxk/j9MCuiiAkSLQmRqZeOXRoaRhUcf5zfRP84hpQ3zD4Zh
 ctUc6Il0gxVZ4QEINKjxmm0Z
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 20:12:40 -0700
IronPort-SDR: poaSQOX8guMoDEMVP4Z35+CJM/Vx+6J1kh3uYqQdi7arVOzPoixAfVoXto8nOL5jKzf6dOUlD3
 uKvdzRIRCCV6m99xWYt+NLKotFSP5I5FlIbRDr88E7OP3XLWs29WP+yApBy9+IXhJZFkxrpMXj
 lcL8951untx1ZeZIE3qTn1Kh4gc9OjWcqDtlRGCA3d50OB0xFs+4RGoi7YB64BN1N39Bi8Kott
 ri1LAmJ29wNRO1sqNEwPP9IbUzr62hZlYdXMoYpH1fn0UfGr80aMGsZMVC+9lzVQ9M/7+3TOix
 t58=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
 by uls-op-cesaip02.wdc.com with ESMTP; 10 Aug 2021 20:37:08 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Paolo Valente <paolo.valente@linaro.org>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
Date: Wed, 11 Aug 2021 12:37:00 +0900
Message-Id: <20210811033702.368488-5-damien.lemoal@wdc.com>
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
X-Headers-End: 1mDf3Z-0002eF-7z
Subject: [f2fs-dev] [PATCH v4 4/6] block: fix IOPRIO_PRIO_CLASS() and
 IOPRIO_PRIO_VALUE() macros
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

The ki_ioprio field of struct kiocb is 16-bits (u16) but often handled
as an int in the block layer. E.g. ioprio_check_cap() takes an int as
argument.

With such implicit int casting function calls, the upper 16-bits of the
int argument may be left uninitialized by the compiler, resulting in
invalid values for the IOPRIO_PRIO_CLASS() macro (garbage upper bits)
and in an error return for functions such as ioprio_check_cap().

Fix this by masking the result of the shift by IOPRIO_CLASS_SHIFT bits
in the IOPRIO_PRIO_CLASS() macro. The new macro IOPRIO_CLASS_MASK
defines the 3-bits mask for the priority class.
Similarly, apply the IOPRIO_PRIO_MASK mask to the data argument of the
IOPRIO_PRIO_VALUE() macro to ignore the upper bits of the data value.
The IOPRIO_CLASS_MASK mask is also applied to the class argument of this
macro before shifting the result by IOPRIO_CLASS_SHIFT bits.

While at it, also change the argument name of the IOPRIO_PRIO_CLASS()
and IOPRIO_PRIO_DATA() macros from "mask" to "ioprio" to reflect the
fact that a priority value should be passed rather than a mask.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 include/uapi/linux/ioprio.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/ioprio.h b/include/uapi/linux/ioprio.h
index 5064e230374c..936f0d8f30e1 100644
--- a/include/uapi/linux/ioprio.h
+++ b/include/uapi/linux/ioprio.h
@@ -5,12 +5,16 @@
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
+	((((class) & IOPRIO_CLASS_MASK) << IOPRIO_CLASS_SHIFT) | \
+	 ((data) & IOPRIO_PRIO_MASK))
 
 /*
  * These are the io priority groups as implemented by the BFQ and mq-deadline
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
