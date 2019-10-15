Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D9DD72D5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Oct 2019 12:10:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iKJmU-0006yj-Ou; Tue, 15 Oct 2019 10:10:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iKJmT-0006xF-CM
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Oct 2019 10:10:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rDh+k6jugqokgDD83HESWdNOBz+8oEqVmT0v5aUoF8w=; b=bUgSvi8dNrmkSFgwNC3ROfVGMm
 rUfRtZ5foEbES7RkZ6Qa/sa7+lSPIWlB3lrn36AOiM3TEiqFOz2m50u4ZuQX37rmX5jHZ8RpxeOsI
 m+bL1VbC06N2B5qh5ZLu6w8Kq23lPryJ4aSuxS63df82el/b5Ox9gPUGPAt2VR9pymNk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rDh+k6jugqokgDD83HESWdNOBz+8oEqVmT0v5aUoF8w=; b=iuiCOfSXkpXTKCBJSNli3Ll5Ih
 nMCxABmDj9b11/bVkbrQ4u4EsYlRDh/vUWF3LymV9OpQGdamKlZn0czetzg3xHsqGR9R6BNMOWNLO
 Ic8ucfe0+Z/VVeeCFvKpqHlyCZ5Rg//auXUTuNFPCYI5NEsQr2dznaqKVci/YAHle4+A=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iKJmS-009yAX-59
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Oct 2019 10:10:17 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 69A51920D057863A23CD;
 Tue, 15 Oct 2019 18:10:08 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Tue, 15 Oct 2019 18:09:58 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <guaneryu@gmail.com>
Date: Tue, 15 Oct 2019 18:09:38 +0800
Message-ID: <20191015100938.123519-2-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20191015100938.123519-1-yuchao0@huawei.com>
References: <20191015100938.123519-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iKJmS-009yAX-59
Subject: [f2fs-dev] [PATCH v2 2/2] common/casefold: support f2fs
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
Cc: fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Now, f2fs has ported casefold feature from ext4, let's enable the
testcase.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2:
- no changes.
 common/casefold | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/common/casefold b/common/casefold
index 2a7ab3eb..9172d818 100644
--- a/common/casefold
+++ b/common/casefold
@@ -9,6 +9,9 @@ _has_casefold_kernel_support()
 	ext4)
 		test -f '/sys/fs/ext4/features/casefold'
 		;;
+	f2fs)
+		test -f '/sys/fs/f2fs/features/casefold'
+		;;
 	*)
 		# defaults to unsupported
 		false
@@ -46,6 +49,9 @@ _scratch_mkfs_casefold()
 	ext4)
 		_scratch_mkfs -O casefold $*
 		;;
+	f2fs)
+		_scratch_mkfs -C utf8 $*
+		;;
 	*)
 		_notrun "Don't know how to mkfs with casefold support on $FSTYP"
 		;;
@@ -58,6 +64,9 @@ _scratch_mkfs_casefold_strict()
 	ext4)
 		_scratch_mkfs -O casefold -E encoding_flags=strict
 		;;
+	f2fs)
+		_scratch_mkfs -C utf8:strict
+		;;
 	*)
 		_notrun "Don't know how to mkfs with casefold-strict support on $FSTYP"
 		;;
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
