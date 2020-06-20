Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC97201F73
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Jun 2020 03:21:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jmSCO-0006nZ-Kb; Sat, 20 Jun 2020 01:21:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <koulihong@huawei.com>) id 1jmSCM-0006nQ-Hx
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 20 Jun 2020 01:21:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s4z8Q2qDMcQL+m8tWDhNb3H5C963MwRHECzBMZVyoyk=; b=QHlTLZKemz1sR6hMbKrRWGWL1A
 Ts9ZI2JfKPKJ9p7QbnOPEYfkhzvCfAF2g4Av3+DDQozGzQlVa48aKGA6pbQ73j513bwDvBouvLOEl
 DUsj4ik8hFrzHWmaYWhEFfBleW0SN3bQ0tOgMGE+atre21V/qtuAOhaKZu5ZXapv+l94=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=s4z8Q2qDMcQL+m8tWDhNb3H5C963MwRHECzBMZVyoyk=; b=l
 UZs3Rb0IB4Fius3bo1SQ5m2V0bRh/isw+ANUuBMT0bE6bTFDt8yWCq5aUmx1h+EOx25l9z9H52F7R
 weYDmZGvqjEYEyoDW7dJcLWgrpq8rgDIoBMmP41ZgNB4afYu2gCaya70ksVQ7+FN/TFP3jSq3/9s4
 KJ6b98/fhCx7+9A0=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jmSCK-009aF9-63
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 20 Jun 2020 01:21:34 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C08139E37AD00A37F8B5;
 Sat, 20 Jun 2020 09:21:22 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Sat, 20 Jun 2020
 09:21:14 +0800
From: Lihong Kou <koulihong@huawei.com>
To: <yuchao0@huawei.com>, <jaegeuk@kernel.org>
Date: Sat, 20 Jun 2020 10:12:17 +0800
Message-ID: <20200620021217.10877-1-koulihong@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jmSCK-009aF9-63
Subject: [f2fs-dev] [PATCH] f2fs: make trace enter and end in pairs for
 unlink
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

In the f2fs_unlink we do not add trace end for some
error paths, just add.

Signed-off-by: Lihong Kou <koulihong@huawei.com>
---
 fs/f2fs/namei.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index e94e02c6580a..a15a2831d43b 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -569,15 +569,17 @@ static int f2fs_unlink(struct inode *dir, struct dentry *dentry)
 
 	trace_f2fs_unlink_enter(dir, dentry);
 
-	if (unlikely(f2fs_cp_error(sbi)))
-		return -EIO;
+	if (unlikely(f2fs_cp_error(sbi))) {
+		err = -EIO;
+		goto fail;
+	}
 
 	err = dquot_initialize(dir);
 	if (err)
-		return err;
+		goto fail;
 	err = dquot_initialize(inode);
 	if (err)
-		return err;
+		goto fail;
 
 	de = f2fs_find_entry(dir, &dentry->d_name, &page);
 	if (!de) {
-- 
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
