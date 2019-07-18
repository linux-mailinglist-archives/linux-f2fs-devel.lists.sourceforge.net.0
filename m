Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB386CB93
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jul 2019 11:12:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ho2Sa-0008Hj-MQ; Thu, 18 Jul 2019 09:12:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ho2SZ-0008Hb-AN
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jul 2019 09:12:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hxZJr2hXE/Ihw3scwoKg5kWG6lDZhu+jpQg18oG3f9g=; b=LUgExcY5ritUEsrNH+LIDYbWAK
 E6qCDPbpiBcwCcFY2Zq0IOHNdZCc/6hiPl1HLY6bKBzofAahGPc9Rq1fXyBWddu+D3s6dE9Y1ZSbZ
 QbwiBoxpmjgx8Dpl6sfKpLCmKTEjGrEtDHJjJ90oslpBKbOCdFCN/d6YIkAdbtHvCsCw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hxZJr2hXE/Ihw3scwoKg5kWG6lDZhu+jpQg18oG3f9g=; b=L
 fP/gCLvqBejk0rPT3lnar8YKEILbu5lAqKBrWb0gFEUKq0B/rsT7FwUeZCxcNSc9CJFhKvUoGefsd
 HaG8a/wuUZwGVVAF82n6Ppo1wPsGHZKGmF2DHVgHjDanyqRoLU/gJB+m8j9XxgdYpzufB26orR5zq
 9Puk6daXaLBN6QXE=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1ho2SX-006BCe-2E
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jul 2019 09:12:19 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 233714516E6155E36F38;
 Thu, 18 Jul 2019 17:12:08 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Thu, 18 Jul 2019 17:12:01 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <fstests@vger.kernel.org>
Date: Thu, 18 Jul 2019 17:11:54 +0800
Message-ID: <20190718091154.37327-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1ho2SX-006BCe-2E
Subject: [f2fs-dev] [PATCH] common/rc: set max label length for f2fs
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs can support FS_IOC_{GET,SET}FSLABEL now, set max label length
to enable generic/492 testcase for f2fs.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 common/rc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/common/rc b/common/rc
index 75ca6324..45781619 100644
--- a/common/rc
+++ b/common/rc
@@ -3955,6 +3955,9 @@ _label_get_max()
 	btrfs)
 		echo 255
 		;;
+	f2fs)
+		echo 255
+		;;
 	*)
 		_notrun "$FSTYP does not define maximum label length"
 		;;
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
