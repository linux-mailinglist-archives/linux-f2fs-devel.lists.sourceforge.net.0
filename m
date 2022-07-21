Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 057D857C397
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Jul 2022 06:41:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oEO0A-00017h-O6; Thu, 21 Jul 2022 04:41:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <yuyufen@huawei.com>) id 1oEO09-00017b-II
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Jul 2022 04:41:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cO4xr1h+em4lbHQNwzIAQbQ/uko3QOxpCDYBZUI+g5Y=; b=gbpewCwnJD00tC6TJ5Ulus06qK
 5eLkl92e9EP8CNaIDw/IJPZp92XCx3rSvg7my/BlH55tkyW5l/D8F3apoDjGb/JC5E3J/tHiBgKNa
 mi0ToLqUM+0eEj+BKtjJ9y4heBzW0e2RW3ELploB4GRvL5b85sOTp1JCOQR8DYCvyt74=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cO4xr1h+em4lbHQNwzIAQbQ/uko3QOxpCDYBZUI+g5Y=; b=J
 kTZxuDKgpEPKXoTGZLFLnhzz1yioecRWnb6WENB/eUFUKakULIgHW6n1xlgsQHWlPS51gIUFGVbcB
 VhE2yeA07coOkG2UFpwlzBMyYpeYMn4Y40Brvvj+l5dA0M5Low0n+VLTeJEV3MmFfmsyaSU4/TNtb
 OcUWWK1BUcq4AMSA=;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oEO08-00074u-El
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Jul 2022 04:41:29 +0000
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4LpKcY4kWRzFpyN;
 Thu, 21 Jul 2022 12:40:13 +0800 (CST)
Received: from dggpeml500009.china.huawei.com (7.185.36.209) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 21 Jul 2022 12:41:17 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500009.china.huawei.com
 (7.185.36.209) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 21 Jul
 2022 12:41:16 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Thu, 21 Jul 2022 12:53:29 +0800
Message-ID: <20220721045329.2155449-1-yuyufen@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500009.china.huawei.com (7.185.36.209)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If f2fs_iget cannot search inode from inode cache, it will
 read the inode from disk. The processing of read from disk and init inode
 should not dirty the inode, as the commit 530e07042002 ("f2fs: don' [...]
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.189 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1oEO08-00074u-El
Subject: [f2fs-dev] [PATCH] f2fs: get rid of f2fs_inode_synced from f2fs_iget
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
From: Yufen Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yufen Yu <yuyufen@huawei.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If f2fs_iget cannot search inode from inode cache, it will read
the inode from disk. The processing of read from disk and init inode
should not dirty the inode, as the commit 530e07042002 ("f2fs:
don't mark compressed inode dirty during f2fs_iget()").

Thus, we can remove the unnecessary f2fs_inode_synced().

Signed-off-by: Yufen Yu <yuyufen@huawei.com>
---
 fs/f2fs/inode.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index fc55f5bd1fcc..ce87b66c6dfe 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -562,7 +562,6 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
 	return inode;
 
 bad_inode:
-	f2fs_inode_synced(inode);
 	iget_failed(inode);
 	trace_f2fs_iget_exit(inode, ret);
 	return ERR_PTR(ret);
-- 
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
