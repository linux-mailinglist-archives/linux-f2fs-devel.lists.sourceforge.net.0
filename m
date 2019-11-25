Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B471086CE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Nov 2019 04:21:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iZ4wK-0006WT-NV; Mon, 25 Nov 2019 03:21:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <cgxu519@mykernel.net>) id 1iZ4wJ-0006WM-EV
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 03:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Date:Subject:Message-ID:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AMNnaaOEHLZ2nAp+iznIFMLJZGfTjtKwhzorpWB1mpY=; b=PKDgQgim8VmUVNNcqK9LYwDX4F
 7Eqrwc32lypir9oFhHgo4fh1lZBFtv9qT/OduJUplF0G9mmUWVdsG8IcFlGokRGMdJ1fVP7hSI0JO
 jKehxqt8MjPPw4NMYQNrcAHFXiOwBPHOBUNnVbVFjJOSLVrt3W5P9G/528YzebjXakyU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Date:Subject:
 Message-ID:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AMNnaaOEHLZ2nAp+iznIFMLJZGfTjtKwhzorpWB1mpY=; b=UNc3DqS+GqGL2BqvtcopogV3Up
 C2450qQS6+4QbXkPaj8q9w/VgelrqDYJQR7y9JPhYustmcDSJuSBaRvRkh8RkAYMWrS2EO5rhvsBJ
 S9xoZDlAsZGs2Ti9F/laXT+mCUX5V4tEUNq3q6SuheyBDfh6W6djU9pQQakuNEPCW8Jw=;
Received: from sender3-of-o52.zoho.com.cn ([124.251.121.247]
 helo=sender3.zoho.com.cn)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1iZ4wE-00CxSN-PP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Nov 2019 03:21:27 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1574652066; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=kVxpcNlT2Fszfn1xF9H0wtoQ1DsQQ46uh6ev2QdzZEaV+Dgmx6kv4FY/5086XBmghcBT1UY11iFoEyqQY19hmIq5DhjJRYHy3Pu3yVKbMe1KS/LKzeukZSCW0zyzCPsTNturrfZRMF7cQgQIkEgxLgm+26u8ss9Vo5xDxb2OJS8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1574652066;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To;
 bh=AMNnaaOEHLZ2nAp+iznIFMLJZGfTjtKwhzorpWB1mpY=; 
 b=h9i/+bzyifi/K3UBKEZZWU2wDKo5cDjslWtDFqKSRwdb5UHbOaGDcki/qefFPxzgpu/o84/RiDNmya96WqvtKyLk7pbj9NreQVBCGlzgzZarEd2CKQhlnh7qmb6bPyGUp4CQjFXUz7wCiujDmltBdjqNIqjCicHwneAngOqNVV4=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=mykernel.net;
 spf=pass  smtp.mailfrom=cgxu519@mykernel.net;
 dmarc=pass header.from=<cgxu519@mykernel.net>
 header.from=<cgxu519@mykernel.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574652066; 
 s=zohomail; d=mykernel.net; i=cgxu519@mykernel.net;
 h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
 l=2919; bh=AMNnaaOEHLZ2nAp+iznIFMLJZGfTjtKwhzorpWB1mpY=;
 b=LXsGsLOInMbUlUePM4U0UhQJ/idBEhNpbnrmgUe+qoU9G3ThqvJZG6qo6WT0odPA
 Bk+GKvttVCHrYRtCRPCTFmUkzLSKEjDnpSD7HKgfeBRtx61TSVxVGb2bP5jYB0eGow8
 JSWrXyuaZyJEVNsU4v7GBZtEILH01WXo8T29uNQw=
Received: from localhost.localdomain (218.18.229.179 [218.18.229.179]) by
 mx.zoho.com.cn with SMTPS id 1574652065399438.41058336567346;
 Mon, 25 Nov 2019 11:21:05 +0800 (CST)
From: Chengguang Xu <cgxu519@mykernel.net>
To: jaegeuk@kernel.org,
	chao@kernel.org
Message-ID: <20191125032036.30490-1-cgxu519@mykernel.net>
Date: Mon, 25 Nov 2019 11:20:36 +0800
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
X-Headers-End: 1iZ4wE-00CxSN-PP
Subject: [f2fs-dev] [PATCH v2] f2fs: choose hardlimit when softlimit is
 larger than hardlimit in f2fs_statfs_project()
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
Block limits File limits
Project used soft hard grace used soft hard grace
----------------------------------------------------------------------
0 -- 4 0 0 1 0 0
123 +- 10248 20480 10240 2 0 0

The result of df command as below:

[root@hades f2fs]# df -h /mnt/f2fs/test
Filesystem Size Used Avail Use% Mounted on
/dev/nvme0n1p8 20M 11M 10M 51% /mnt/f2fs

Even though it looks like there is another 10M free space to use,
if we write new data to diretory test(inherit project id),
the write will fail with errno(-EDQUOT).

After this patch, the df result looks like below.

[root@hades f2fs]# df -h /mnt/f2fs/test
Filesystem Size Used Avail Use% Mounted on
/dev/nvme0n1p8 10M 10M 0 100% /mnt/f2fs

Signed-off-by: Chengguang Xu <cgxu519@mykernel.net>
---
v1->v2:
- Remove unnecessary condition check.
- Fix coding sytle.

 fs/f2fs/super.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1443cee15863..a2af155567b8 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1213,9 +1213,13 @@ static int f2fs_statfs_project(struct super_block *sb,
 		return PTR_ERR(dquot);
 	spin_lock(&dquot->dq_dqb_lock);
 
-	limit = (dquot->dq_dqb.dqb_bsoftlimit ?
-		 dquot->dq_dqb.dqb_bsoftlimit :
-		 dquot->dq_dqb.dqb_bhardlimit) >> sb->s_blocksize_bits;
+	limit = 0;
+	if (dquot->dq_dqb.dqb_bsoftlimit)
+		limit = dquot->dq_dqb.dqb_bsoftlimit;
+	if (dquot->dq_dqb.dqb_bhardlimit &&
+			(!limit || dquot->dq_dqb.dqb_bhardlimit < limit))
+		limit = dquot->dq_dqb.dqb_bhardlimit;
+
 	if (limit && buf->f_blocks > limit) {
 		curblock = dquot->dq_dqb.dqb_curspace >> sb->s_blocksize_bits;
 		buf->f_blocks = limit;
@@ -1224,9 +1228,13 @@ static int f2fs_statfs_project(struct super_block *sb,
 			 (buf->f_blocks - curblock) : 0;
 	}
 
-	limit = dquot->dq_dqb.dqb_isoftlimit ?
-		dquot->dq_dqb.dqb_isoftlimit :
-		dquot->dq_dqb.dqb_ihardlimit;
+	limit = 0;
+	if (dquot->dq_dqb.dqb_isoftlimit)
+		limit = dquot->dq_dqb.dqb_isoftlimit;
+	if (dquot->dq_dqb.dqb_ihardlimit &&
+			(!limit || dquot->dq_dqb.dqb_ihardlimit < limit))
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
