Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0417150A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jul 2019 11:26:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hpr3k-0005cI-RV; Tue, 23 Jul 2019 09:26:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hpr3k-0005c8-2e
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Jul 2019 09:26:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AkiElZs+5LD/wuVb2BEYB3yryrN2Oi0E37Bb+FYDwnI=; b=NOXmefv5HhdP8qvNtgZ7ZTD6lO
 yOwvcz6RUEnDOGAFRii3R5dR+eZVAfTEcl2PKmY+Tm1vT15OsMwM2el+XAJL/aRYK0HbZKmynS0j2
 975eg1QaHa5t2QzpO79pJX3gzH7DNGvHiX4KZwzm3CF1yO3AN9HjxSOnlbDnp/cEcEzA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AkiElZs+5LD/wuVb2BEYB3yryrN2Oi0E37Bb+FYDwnI=; b=XcfSI6nQN1vGC8magEMLGF4LlI
 g4ikRUqPBzZFd63sBYDReJLeux4MFIlgDTbtB7IOyKpQCRzaxfpvu9hOwN/W203uHj12nfxSPQV7s
 3MiQ3Fp/oK08zInafOGEzlGU7wID1RJD7w/xo1K+gkuHsxeB8UEUnBddU5o902m0cr7g=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hpr3g-00E3RU-16
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 23 Jul 2019 09:26:12 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 6D662C290FC82737B9F7;
 Tue, 23 Jul 2019 17:25:51 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Tue, 23 Jul 2019 17:25:40 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <guaneryu@gmail.com>
Date: Tue, 23 Jul 2019 17:25:28 +0800
Message-ID: <20190723092529.112426-2-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20190723092529.112426-1-yuchao0@huawei.com>
References: <20190723092529.112426-1-yuchao0@huawei.com>
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
X-Headers-End: 1hpr3g-00E3RU-16
Subject: [f2fs-dev] [PATCH 2/3] common/quota: support f2fs in
 _require_quota() and _check_quota_usage()
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
Cc: jaegeuk@kernel.org, chao@kernel.orga, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This can let f2fs pass the check of quota testcases.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 common/quota | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/common/quota b/common/quota
index f19f81a1..9af280a2 100644
--- a/common/quota
+++ b/common/quota
@@ -12,7 +12,7 @@ _require_quota()
     [ -n "$QUOTA_PROG" ] || _notrun "Quota user tools not installed"
 
     case $FSTYP in
-    ext2|ext3|ext4|ext4dev|reiserfs)
+    ext2|ext3|ext4|ext4dev|f2fs|reiserfs)
 	if [ ! -d /proc/sys/fs/quota ]; then
 	    _notrun "Installed kernel does not support quotas"
 	fi
@@ -257,7 +257,7 @@ _check_quota_usage()
 
 	VFS_QUOTA=0
 	case $FSTYP in
-	ext2|ext3|ext4|ext4dev|reiserfs|gfs2)
+	ext2|ext3|ext4|ext4dev|f2fs|reiserfs|gfs2)
 		VFS_QUOTA=1
 		quotaon -f -u -g $SCRATCH_MNT 2>/dev/null
 		;;
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
