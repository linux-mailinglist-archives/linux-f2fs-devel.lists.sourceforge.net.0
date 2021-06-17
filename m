Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F16F3AACCD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Jun 2021 08:57:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ltlxh-0001Yq-1X; Thu, 17 Jun 2021 06:57:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <sunke32@huawei.com>) id 1ltlxf-0001Yf-HM
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Jun 2021 06:57:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7LKs2thIpBB5iCvv1y/TkXLZGwaqucWCGbFNRu+nTVo=; b=a2SUfzAwIek6NzM9jER0blQY4r
 nrxkOWbl5Lp334vRP2ijWBEfN5yTFGquzHvAIycA7CI4uVGUK/WpPwlKTO7vMR98k4G7/sqNNoyHN
 MQ5pWw3CEyNccAA9jljxLZPje7lXWtZ8YV68Lu98mfEeU/AXX7axnQK6Cu8XsUFXC/aU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7LKs2thIpBB5iCvv1y/TkXLZGwaqucWCGbFNRu+nTVo=; b=J
 StLvJTuXX1pgDyZP5Ix5wcq40rVNuajqsP+fgPqnuZC4f0q+Sem65nlVx3VyPYWCKYpCOkyS80tU8
 hLUE1yhy4E4m2F2A3dH/vqte55LL72JI585F7G67+1E0QUnQfBpFu+2/oyAfUMKHiegYvyPOXvJj6
 YzRiZtNo1xpaH/Kc=;
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1ltlxb-0007oI-Rm
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Jun 2021 06:57:11 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4G5CQh40CTz1BN8R;
 Thu, 17 Jun 2021 14:51:56 +0800 (CST)
Received: from dggema759-chm.china.huawei.com (10.1.198.201) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 17 Jun 2021 14:56:58 +0800
Received: from huawei.com (10.175.101.6) by dggema759-chm.china.huawei.com
 (10.1.198.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 17
 Jun 2021 14:56:57 +0800
From: Sun Ke <sunke32@huawei.com>
To: <fstests@vger.kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>,
 <guan@eryu.me>, <chao@kernel.org>
Date: Thu, 17 Jun 2021 15:03:09 +0800
Message-ID: <20210617070310.3515665-1-sunke32@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggema759-chm.china.huawei.com (10.1.198.201)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.255 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ltlxb-0007oI-Rm
Subject: [f2fs-dev] [PATCH v2] generic/103: special left calculation for f2fs
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
Cc: sunke32@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

It failed on f2fs:
      QA output created by 103
     +fallocate: No space left on device
      Silence is golden.
     ...

f2fs uses index(radix) tree as mapping metadata, its space overhead
is about one thousandth of the data.

Suggested-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Sun Ke <sunke32@huawei.com>
---
 tests/generic/103 | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/generic/103 b/tests/generic/103
index b22b0159..cf610047 100755
--- a/tests/generic/103
+++ b/tests/generic/103
@@ -40,10 +40,18 @@ rm -f $seqres.full
 _consume_freesp()
 {
 	file=$1
+	left=512
 
 	# consume nearly all available space (leave ~512kB)
 	avail=`_get_available_space $SCRATCH_MNT`
-	filesizekb=$((avail / 1024 - 512))
+
+	# f2fs uses index(radix) tree as mapping metadata, its space overhead
+	# is about one thousandth of the data
+	if [ $FSTYP == "f2fs" ]; then
+		left=$((left + avail / 1024000))
+	fi
+
+	filesizekb=$((avail / 1024 - $left))
 	$XFS_IO_PROG -fc "falloc 0 ${filesizekb}k" $file
 }
 
-- 
2.13.6



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
