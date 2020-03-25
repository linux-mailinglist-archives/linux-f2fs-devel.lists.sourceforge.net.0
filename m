Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA42F191EF1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2020 03:22:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGvge-0000Xb-LH; Wed, 25 Mar 2020 02:22:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jGvgd-0000XU-3R
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 02:22:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z5izPxL5W9mhHRIe39X8ThYakl2SFSsAZTjm17IqLa0=; b=FkZn8ZHzpPLP3j8SYzy2Rbl1pK
 72LP+R7EBe3mfXFGmN9G9lzpQ/BvWUk+4ws+fwjjxIkIkSJW6K6GzWmsOhc/obrE65gjxlmfAhEPX
 /oCufOpBpE9HE1iwNe9jSqwCcyZPo7xl1cit5E2OeWGDs3PEBmty1Y/7Z4xlMzuBYwoA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Z5izPxL5W9mhHRIe39X8ThYakl2SFSsAZTjm17IqLa0=; b=G
 ZA9KwMkN0SQDPgQHJcFs/NJ8VnPKkz2kn/Pkko7VU+c7ff59l+OXyApfk47kOspVdYYnEwgrJcZpW
 /kdIVdxumnVmi7jjxlSUH1kYajRQrP0f8TvGtWITT6KLhbb+aCuiZf9OozFrfL/RG0Raa7JC4DkqY
 RJV681ds5ZzyPWT4=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGvgb-00FsoN-05
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 02:22:31 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 2423E8143BBFC871EF9E;
 Wed, 25 Mar 2020 10:22:22 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Wed, 25 Mar 2020 10:22:13 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 25 Mar 2020 10:22:09 +0800
Message-ID: <20200325022209.66156-1-yuchao0@huawei.com>
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
X-Headers-End: 1jGvgb-00FsoN-05
Subject: [f2fs-dev] [PATCH] f2fs: show compression in statx
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

fstest reports below message when compression is on:

generic/424 1s ... - output mismatch
    --- tests/generic/424.out
    +++ results/generic/424.out.bad
    @@ -1,2 +1,26 @@
     QA output created by 424
    +[!] Attribute compressed should be set
    +Failed
    +stat_test failed
    +[!] Attribute compressed should be set
    +Failed
    +stat_test failed

We missed to set STATX_ATTR_COMPRESSED on compressed inode in getattr(),
fix it.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/file.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 1cc6919e1c5e..5c24f2ca3465 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -818,6 +818,8 @@ int f2fs_getattr(const struct path *path, struct kstat *stat,
 	}
 
 	flags = fi->i_flags;
+	if (flags & F2FS_COMPR_FL)
+		stat->attributes |= STATX_ATTR_COMPRESSED;
 	if (flags & F2FS_APPEND_FL)
 		stat->attributes |= STATX_ATTR_APPEND;
 	if (IS_ENCRYPTED(inode))
@@ -829,7 +831,8 @@ int f2fs_getattr(const struct path *path, struct kstat *stat,
 	if (IS_VERITY(inode))
 		stat->attributes |= STATX_ATTR_VERITY;
 
-	stat->attributes_mask |= (STATX_ATTR_APPEND |
+	stat->attributes_mask |= (STATX_ATTR_COMPRESSED |
+				  STATX_ATTR_APPEND |
 				  STATX_ATTR_ENCRYPTED |
 				  STATX_ATTR_IMMUTABLE |
 				  STATX_ATTR_NODUMP |
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
