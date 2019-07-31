Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D46867B833
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Jul 2019 05:21:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hsfB3-0003na-Al; Wed, 31 Jul 2019 03:21:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <wangxiaojun11@huawei.com>) id 1hsfB1-0003nS-OF
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Jul 2019 03:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mmLuhp5y1/svEiGkNMveixoITxBH9CGjjHXJB8wxHKI=; b=RpmQk0sgh93xStkGyVsugKzY7O
 f1HTZUauxSHDCLF4g3MqpSfUD6ngUSaRBWoMca3LgJVZ6JmhIHCRalSWc14uNPZ93JIT6hpLHGvnC
 Pm61VH1FP/vE/PN8PqFwuLFA/aXPj1if4CzDGIn0n2kCb6k3dzYbS15CiNyAyXY63SBU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mmLuhp5y1/svEiGkNMveixoITxBH9CGjjHXJB8wxHKI=; b=G
 dWmPB8oJc+aCxDWIAbuN5DPTrDFEK+YQcrmg7waJQy4R1zuZqY7MzI/mMzfzb9N0VeyW7pqmlO067
 qC9Bots3F0M5K4zYOa5Kb6VtD43ZIH3LBlkMEaGhGmoftsCBJcF6myHYpujH3ht9NrJlmJHmjT9RA
 zJy8KWIpkYdzum6c=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hsfAz-004uNP-Hf
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Jul 2019 03:21:19 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 0E4CE197A8F40876B5B6;
 Wed, 31 Jul 2019 11:21:10 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Wed, 31 Jul 2019
 11:21:07 +0800
From: Xiaojun Wang <wangxiaojun11@huawei.com>
To: <linux-fsdevel@vger.kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
Date: Wed, 31 Jul 2019 11:27:01 +0800
Message-ID: <1564543621-123550-1-git-send-email-wangxiaojun11@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
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
X-Headers-End: 1hsfAz-004uNP-Hf
Subject: [f2fs-dev] [PATCH] f2fs: fix memory leak in build_directory
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

This patch fix bug that variable dentries going
out of scope leaks the storage it points to.

Signed-off-by: Xiaojun Wang<wangxiaojun11@huawei.com>
---
 fsck/sload.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fsck/sload.c b/fsck/sload.c
index f5a4651..e5de2e1 100644
--- a/fsck/sload.c
+++ b/fsck/sload.c
@@ -240,15 +240,18 @@ static int build_directory(struct f2fs_sb_info *sbi, const char *full_path,
 		ret = set_selinux_xattr(sbi, dentries[i].path,
 					dentries[i].ino, dentries[i].mode);
 		if (ret)
-			return ret;
+			goto out;
+	}
 
+out:
+	for (i = 0; i < entries; i++) {
 		free(dentries[i].path);
 		free(dentries[i].full_path);
 		free((void *)dentries[i].name);
 	}
 
 	free(dentries);
-	return 0;
+	return ret;
 }
 
 static int configure_files(void)
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
