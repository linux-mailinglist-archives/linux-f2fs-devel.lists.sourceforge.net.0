Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9CF2E2A7F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Dec 2020 09:53:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ksiqs-0003lY-V2; Fri, 25 Dec 2020 08:53:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ksiqr-0003lQ-LZ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Dec 2020 08:53:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z1wfGqZN4/m99P16jjXHJ9H8Kr2y5CXSGn89lR43sPU=; b=Jf1ykU5C7G1M3OhepWdrLp2iLB
 OJJptpcFiBO/mUdWEM/+gwrH6BLwKryAmg4pCVBpmnebc+2YNmnNTW1uUdEEBX63l9U/Gc4X+n69x
 pl9RCbr3wI/siGqy+cMoDT99E3EnCAVb65GxjvbvBz9eQOKLnoGKiFON0scHeRbLID/Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=z1wfGqZN4/m99P16jjXHJ9H8Kr2y5CXSGn89lR43sPU=; b=Q
 6Cky7/FBBt3LjKgM9wDPVxkgRXoz3RcrpEz2KsC9A93BLj2kGF2I8RZUYWz69yY7RdknpJVk6KU9Z
 zVPzgoY4rTQqZOFMFduqBPno7flRTXHwVCMtg03aXfKOjIjs3iWEBRKpucLKKptS5EgXaPV5X9nOZ
 jWlfZTCyVY/uRguc=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ksiqn-00Dzwe-3E
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Dec 2020 08:53:33 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D2LLC2slSzhxJW;
 Fri, 25 Dec 2020 16:52:35 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Fri, 25 Dec 2020 16:53:12 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 25 Dec 2020 16:53:04 +0800
Message-ID: <20201225085304.114448-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1ksiqn-00Dzwe-3E
Subject: [f2fs-dev] [PATCH] f2fs: fix to keep isolation of atomic write
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

ThreadA					ThreadB
- f2fs_ioc_start_atomic_write
- write
- f2fs_ioc_commit_atomic_write
 - f2fs_commit_inmem_pages
 - f2fs_drop_inmem_pages
 - f2fs_drop_inmem_pages
  - __revoke_inmem_pages
					- f2fs_vm_page_mkwrite
					 - set_page_dirty
					  - tag ATOMIC_WRITTEN_PAGE and add page
					    to inmem_pages list
  - clear_inode_flag(FI_ATOMIC_FILE)
					- f2fs_vm_page_mkwrite
					  - set_page_dirty
					   - f2fs_update_dirty_page
					    - f2fs_trace_pid
					     - tag inmem page private to pid
					- truncate
					 - f2fs_invalidate_page
					 - set page->mapping to NULL
					  then it will cause panic once we
					  access page->mapping

The root cause is we missed to keep isolation of atomic write in the case
of commit_atomic_write vs mkwrite, let commit_atomic_write helds i_mmap_sem
lock to avoid this issue.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/file.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 22a0101538c0..1ff5fc10e1fa 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2094,10 +2094,12 @@ static int f2fs_ioc_commit_atomic_write(struct file *filp)
 		goto err_out;
 	}
 
+	down_write(&F2FS_I(inode)->i_mmap_sem);
+
 	if (f2fs_is_atomic_file(inode)) {
 		ret = f2fs_commit_inmem_pages(inode);
 		if (ret)
-			goto err_out;
+			goto up_write;
 
 		ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 0, true);
 		if (!ret)
@@ -2105,6 +2107,8 @@ static int f2fs_ioc_commit_atomic_write(struct file *filp)
 	} else {
 		ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 1, false);
 	}
+up_write:
+	up_write(&F2FS_I(inode)->i_mmap_sem);
 err_out:
 	if (is_inode_flag_set(inode, FI_ATOMIC_REVOKE_REQUEST)) {
 		clear_inode_flag(inode, FI_ATOMIC_REVOKE_REQUEST);
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
