Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA1834890C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Mar 2021 07:24:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lPJQ2-0004RE-UK; Thu, 25 Mar 2021 06:24:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gongruiqi1@huawei.com>) id 1lPJPv-0004Qx-KH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Mar 2021 06:24:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JLvJXzNiZSPU9Lgb0TEK49+mhMZdZYtQ5FP7U0tuMiA=; b=Ppga1dPKSvjRcLkjCxdrO/9DiC
 0iXCjDUI8+p4HVEaV29aI4fDVL12Upni12PxHfK3/z/OO6J4XyKKpk52tOdcwhd+Kl83ImiBZcE/k
 x5U5ceGQPsojfoXOGJmJCuRLLzjnh9DWKkaa4c4+RJMhv/6bMDJYtvltI10XpsU+L5Yk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JLvJXzNiZSPU9Lgb0TEK49+mhMZdZYtQ5FP7U0tuMiA=; b=N
 Aev/+jSb8B+RsOtJVj8VdfoOovXsPBEi1p4Z2ATqXyioWxUYHsHSGx4O87549IACNf+x3+z3RxVfL
 KPPHV3LhdNgMGGHCCcJt0xD//Fo0ZKgIVyelllm4c7EGmOfyDiKyDkYKKMYNTQk3uT/pbL515I73w
 9tpeS87sR5bb5P6Y=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lPJPj-0004SN-JO
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Mar 2021 06:24:27 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F5ZkJ6njnznWBW;
 Thu, 25 Mar 2021 14:21:28 +0800 (CST)
Received: from ubuntu.huawei.com (10.67.174.117) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Mar 2021 14:23:51 +0800
From: Ruiqi Gong <gongruiqi1@huawei.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Thu, 25 Mar 2021 02:38:11 -0400
Message-ID: <20210325063811.6486-1-gongruiqi1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.117]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lPJPj-0004SN-JO
Subject: [f2fs-dev] [PATCH -next] f2fs: fix a typo in inode.c
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
Cc: gongruiqi1@huawei.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Do a trivial typo fix.
s/runing/running

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Ruiqi Gong <gongruiqi1@huawei.com>
---
 fs/f2fs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 349d9cb933ee..5d2253d53f17 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -698,7 +698,7 @@ int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc)
 
 	/*
 	 * We need to balance fs here to prevent from producing dirty node pages
-	 * during the urgent cleaning time when runing out of free sections.
+	 * during the urgent cleaning time when running out of free sections.
 	 */
 	f2fs_update_inode_page(inode);
 	if (wbc && wbc->nr_to_write)
-- 
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
