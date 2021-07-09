Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C58F3C1D3B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Jul 2021 04:00:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m1foS-0002s4-D8; Fri, 09 Jul 2021 02:00:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <wangxiaojun11@huawei.com>) id 1m1foR-0002rs-3r
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Jul 2021 02:00:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yldrAxgCyNLcLRTgZq3OErvolJEUuqCHSL5onlV9C6g=; b=lG75ZfMG3CwiHEkvkLbrI309HC
 BZ1tkoulkt6PLTtZf7KAdAG7zsywSqeIoATGm6wUfpSFTpiO/jtRnlTEAmUMTGlThmT59pvi6Bifk
 MXKjdC9LVX985QQA28Xvw5xVvK6voxg5GhQcdkOcgaMznOucvz4NAslA3ALCgNmhz2fg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yldrAxgCyNLcLRTgZq3OErvolJEUuqCHSL5onlV9C6g=; b=O
 WOUmxWrTYfHPA6o2OU5eJwQx/QHge2a4YvJ/g/pzEEQ1HfFcFKi/nm+inJvqk2uNrsIg4Gx0N7IsK
 4RqYyg5Owd2NgF2YFE/v15+SUrPYwJxUbD/a7vZPxtIB7rf+fiRAxJ2JI56SnJxo4dVOGa3x5IrcC
 uKjD3RxEL9JHez+k=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m1foO-0001qq-Jq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Jul 2021 02:00:19 +0000
Received: from dggeml756-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GLbr46cRLzcbLY;
 Fri,  9 Jul 2021 09:56:52 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggeml756-chm.china.huawei.com
 (10.1.199.158) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 9 Jul
 2021 10:00:05 +0800
From: Wang Xiaojun <wangxiaojun11@huawei.com>
To: <chao@kernel.org>, <jaegeuk@kernel.org>
Date: Fri, 9 Jul 2021 10:05:59 +0800
Message-ID: <20210709020559.3885430-1-wangxiaojun11@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggeml756-chm.china.huawei.com (10.1.199.158)
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
X-Headers-End: 1m1foO-0001qq-Jq
Subject: [f2fs-dev] [PATCH] f2fs: avoid to create an empty string as the
 extension_list
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When creating a file, we need to set the temperature based on
extension_list. If the empty string is a valid extension_list,
the is_extension_exist will always returns true,
which affects the separation of hot and cold.

Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>
---
 fs/f2fs/namei.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index a9cd9cf97229..34341d3edb8d 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -219,6 +219,8 @@ int f2fs_update_extension_list(struct f2fs_sb_info *sbi, const char *name,
 	int start, count;
 	int i;
 
+	if (!strlen(name))
+		return -EINVAL;
 	if (set) {
 		if (total_count == F2FS_MAX_EXTENSION)
 			return -EINVAL;
-- 
2.25.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
