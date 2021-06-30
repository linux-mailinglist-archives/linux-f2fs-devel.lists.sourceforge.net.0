Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D443B8157
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Jun 2021 13:32:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lyYRn-0001mt-4f; Wed, 30 Jun 2021 11:32:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sunke32@huawei.com>) id 1lyYRk-0001md-Uj
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Jun 2021 11:32:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2DJFSWIUwXCGUMVElcqRY0Q+DWkixSEFPZ0FvbC2ZQM=; b=HKInuBjrvvzvIQYma6Etj9IwJV
 mBYpDWfKBbF3VbwDySTZgVZ58mVLXQ/n+QxxJw4oRmIwjwTn2Y4wz8/oC7GTxwJub5ujpJyEiCGOk
 K1ZP4lGFUoL2Z7IcbW0tbpzunp4540czxAL4+NoW52/n02CQ8Z/gltU+srnnNpF+hZsE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2DJFSWIUwXCGUMVElcqRY0Q+DWkixSEFPZ0FvbC2ZQM=; b=XvVt9OysOxHD8n7d+aE9HJxupi
 M0RNGXxbedO6u3OxLheZz23+Iq9unxKOGrkgU8UouspD7YVX9PrQnqohtHX/5uMEagthJly+ZCUuw
 CFAEI9qK/d0RP7/NXwq3aM72eYWYZECo/PSyQHwz7C2ypDXvmzk3iitIbnJ4QofCTYR4=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lyYRg-004dVY-HA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Jun 2021 11:32:00 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GFJy13ZfRzZpDQ;
 Wed, 30 Jun 2021 19:28:41 +0800 (CST)
Received: from dggema759-chm.china.huawei.com (10.1.198.201) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 30 Jun 2021 19:31:48 +0800
Received: from huawei.com (10.175.101.6) by dggema759-chm.china.huawei.com
 (10.1.198.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 30
 Jun 2021 19:31:47 +0800
From: Sun Ke <sunke32@huawei.com>
To: <fstests@vger.kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>,
 <guan@eryu.me>, <chao@kernel.org>
Date: Wed, 30 Jun 2021 19:37:35 +0800
Message-ID: <20210630113736.551843-3-sunke32@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210630113736.551843-1-sunke32@huawei.com>
References: <20210630113736.551843-1-sunke32@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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
 [45.249.212.188 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lyYRg-004dVY-HA
Subject: [f2fs-dev] [PATCH v3 2/3] generic/103: special left calculation for
 f2fs
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
index 795f851dc6c8..4efa1dc366f9 100755
--- a/tests/generic/103
+++ b/tests/generic/103
@@ -27,10 +27,18 @@ _require_xfs_io_command "falloc"
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
2.25.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
