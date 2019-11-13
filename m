Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0632CFA739
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Nov 2019 04:23:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iUjFn-0001Zo-M2; Wed, 13 Nov 2019 03:23:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <cgxu519@mykernel.net>) id 1iUjFl-0001ZV-QO
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 03:23:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Date:Subject:Message-ID:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oNA6b51YSLYTxOaQeYCw8BYJ7WLM52eOEE5HyCsYtdE=; b=egnL8UmGwnrMnTSdGPgsts/AdC
 1aetsPlbibt5SLsg3yPzjcqX5IR8SNIY5kQkdIiyWu992kn01NBM+Yj51pbqAhYPfV6xS6WwuTURc
 rzlJUrHzHyRr42lA/BHD3isPbNja6sSBrIyO8pSsHxLHFUFAUEkfvhdGpSh2s5QG7YrA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Date:Subject:
 Message-ID:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oNA6b51YSLYTxOaQeYCw8BYJ7WLM52eOEE5HyCsYtdE=; b=M9Ay1zmC+ImQ69blFHtuNLW5fJ
 UUBWku91vsQUKOgoKQEK9xmjW0YRz2wSgMbanV2Y13FPexZiGUGXxu2cgXZ0plUV0XjCtcy5JkmrO
 qHRphqUEbcrA/3mwhfq/pZwNIuoOuEwErDJCJUqNCU2fv9IUZU8mQp4H/Gsj7bfrS2fE=;
Received: from sender3-of-o52.zoho.com.cn ([124.251.121.247]
 helo=sender2.zoho.com.cn)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1iUjFi-00EQzQ-Vx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 03:23:33 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1573614463; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=dx+WMnmOtCUK97UqLQA6p8VpN7yL9cGOsQSdN3rnBqRclgQaMSPf87thlo5OwrlaMq4Y/zBmBw+q434gFaFpxf2TfrbYTRWVI7yx0gLe30B04bk8b1x780ah2CgB6fOi0mzBF9yUj6fB8f4f9ZfZzNDABcwhL6Z7fu/wmmS2Ies=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1573614463;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=oNA6b51YSLYTxOaQeYCw8BYJ7WLM52eOEE5HyCsYtdE=; 
 b=LFNes/BqeuzeGn3Ok+HZl4jKv5ZBBKF7Stkxlh+0/PCImOSosqQLV7xyDRqzWmhnKZplha415/S6l03Zx37yoq+nEyNl9Zp5+fPqI7OhxIAE1GTkNuUJQn5YvPrvc2k5FkXME+BWWHkBH3CpZiuQ+3YjH9pciLJrVRD70pd2mW8=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=mykernel.net;
 spf=pass  smtp.mailfrom=cgxu519@mykernel.net;
 dmarc=pass header.from=<cgxu519@mykernel.net>
 header.from=<cgxu519@mykernel.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1573614463; 
 s=zohomail; d=mykernel.net; i=cgxu519@mykernel.net;
 h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
 l=2997; bh=oNA6b51YSLYTxOaQeYCw8BYJ7WLM52eOEE5HyCsYtdE=;
 b=eI/SySjnZ3gB+e8BLe7VGUR/ldQVmLO7uGQFoo7B7au+x2j97mVHRWh2Cz6mYKck
 saP+7+2lWoh3MUx/l/ihgRZs55CDtakwyNXP8ODv3hHbQqD2QRG7H4nGLO2FN/LAV9u
 Z3/ClBiQrK24Ck4k+3ypawlF3dy7FYG1ohVsIhI8=
Received: from localhost.localdomain (218.18.229.179 [218.18.229.179]) by
 mx.zoho.com.cn with SMTPS id 1573614460358623.6100546947341;
 Wed, 13 Nov 2019 11:07:40 +0800 (CST)
From: Chengguang Xu <cgxu519@mykernel.net>
To: jaegeuk@kernel.org,
	chao@kernel.org
Message-ID: <20191113030731.3488-1-cgxu519@mykernel.net>
Date: Wed, 13 Nov 2019 11:07:31 +0800
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-ZohoCNMailClient: External
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mykernel.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iUjFi-00EQzQ-Vx
Subject: [f2fs-dev] [PATCH] f2fs: choose hardlimit when softlimit is larger
 than hardlimit in f2fs_statfs_project()
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
Cc: Chengguang Xu <cgxu519@mykernel.net>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Setting softlimit larger than hardlimit seems meaningless
for disk quota but currently it is allowed. In this case,
there may be a bit of comfusion for users when they run
df comamnd to directory which has project quota.

For example, we set 20M softlimit and 10M hardlimit of
block usage limit for project quota of test_dir(project id 123).

[root@hades f2fs]# repquota -P -a
*** Report for project quotas on device /dev/nvme0n1p8
Block grace time: 7days; Inode grace time: 7days
                        Block limits                File limits
Project         used    soft    hard  grace    used  soft  hard  grace
----------------------------------------------------------------------
0        --       4       0       0              1     0     0
123      +-   10248   20480   10240              2     0     0

The result of df command as below:

[root@hades f2fs]# df -h /mnt/f2fs/test
Filesystem      Size  Used Avail Use% Mounted on
/dev/nvme0n1p8   20M   11M   10M  51% /mnt/f2fs

Even though it looks like there is another 10M free space to use,
if we write new data to diretory test(inherit project id),
the write will fail with errno(-EDQUOT).

After this patch, the df result looks like below.

[root@hades f2fs]# df -h /mnt/f2fs/test
Filesystem      Size  Used Avail Use% Mounted on
/dev/nvme0n1p8   10M   10M     0 100% /mnt/f2fs

Signed-off-by: Chengguang Xu <cgxu519@mykernel.net>
---
 fs/f2fs/super.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1443cee15863..5bf6e619a8e2 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1213,9 +1213,15 @@ static int f2fs_statfs_project(struct super_block *sb,
 		return PTR_ERR(dquot);
 	spin_lock(&dquot->dq_dqb_lock);
 
-	limit = (dquot->dq_dqb.dqb_bsoftlimit ?
-		 dquot->dq_dqb.dqb_bsoftlimit :
-		 dquot->dq_dqb.dqb_bhardlimit) >> sb->s_blocksize_bits;
+	limit = 0;
+	if (dquot->dq_dqb.dqb_bsoftlimit &&
+	   (!limit || dquot->dq_dqb.dqb_bsoftlimit < limit))
+		limit = dquot->dq_dqb.dqb_bsoftlimit;
+	if (dquot->dq_dqb.dqb_bhardlimit &&
+	   (!limit || dquot->dq_dqb.dqb_bhardlimit < limit))
+		limit = dquot->dq_dqb.dqb_bhardlimit;
+	limit >>= sb->s_blocksize_bits;
+
 	if (limit && buf->f_blocks > limit) {
 		curblock = dquot->dq_dqb.dqb_curspace >> sb->s_blocksize_bits;
 		buf->f_blocks = limit;
@@ -1224,9 +1230,14 @@ static int f2fs_statfs_project(struct super_block *sb,
 			 (buf->f_blocks - curblock) : 0;
 	}
 
-	limit = dquot->dq_dqb.dqb_isoftlimit ?
-		dquot->dq_dqb.dqb_isoftlimit :
-		dquot->dq_dqb.dqb_ihardlimit;
+	limit = 0;
+	if (dquot->dq_dqb.dqb_isoftlimit &&
+	   (!limit || dquot->dq_dqb.dqb_isoftlimit < limit))
+		limit = dquot->dq_dqb.dqb_isoftlimit;
+	if (dquot->dq_dqb.dqb_ihardlimit &&
+	   (!limit || dquot->dq_dqb.dqb_ihardlimit < limit))
+		limit = dquot->dq_dqb.dqb_ihardlimit;
+
 	if (limit && buf->f_files > limit) {
 		buf->f_files = limit;
 		buf->f_ffree =
-- 
2.20.1





_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
