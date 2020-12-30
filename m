Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 662622E7712
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Dec 2020 09:39:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kuX0k-0007IY-M2; Wed, 30 Dec 2020 08:39:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kuX0i-0007IR-VY
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Dec 2020 08:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sT0AUtelC5S6Ak0bo3clITUU7m7ioVXUm/3532bosP0=; b=T0AD2l8T5LEuRk7YHBuup/Fp1I
 dqGP9JRtCGK6hlqGCUwIvpsEwBoeHdgLf65Yl7zuWYalsrHckCaQehjHE+Elwg9uUseXHzL9pDbWp
 sCb9SNYv8Ah1vKbKHmK09szdQmPHB4njx3GyMhONQ8PfAsl6GI64keZu+B3q7xQj5uA4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=sT0AUtelC5S6Ak0bo3clITUU7m7ioVXUm/3532bosP0=; b=I
 0UhtD3A7XSXZrrzqXHCq8hxynDXv3Dwz3gmyBpot8rF0SgvJNWTs51tKmkwqnia54qAu9nP1fWeRe
 O+kx73JyQlxVCkrf0Z+16iSozzm2w9PSbKEnxuWu1kkiUGvop+AtUCngNd6dxwtfV6kcLqf9qLOwv
 sYh7kb62/24ZVwE8=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kuX0T-008D6Y-VL
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Dec 2020 08:39:12 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D5Pmm3pZkzMBkC;
 Wed, 30 Dec 2020 16:37:44 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Wed, 30 Dec 2020 16:38:36 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 30 Dec 2020 16:38:35 +0800
Message-ID: <20201230083835.115049-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kuX0T-008D6Y-VL
Subject: [f2fs-dev] [PATCH] f2fs: trival cleanup in move_data_block()
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

Trival cleanups:
- relocate set_summary() before its use
- relocate "allocate block address" to correct place
- remove unneeded f2fs_wait_on_page_writeback()

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/gc.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 43919a3ae6a6..4561c44dfa8f 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1169,8 +1169,6 @@ static int move_data_block(struct inode *inode, block_t bidx,
 	if (err)
 		goto put_out;
 
-	set_summary(&sum, dn.nid, dn.ofs_in_node, ni.version);
-
 	/* read page */
 	fio.page = page;
 	fio.new_blkaddr = fio.old_blkaddr = dn.data_blkaddr;
@@ -1207,6 +1205,9 @@ static int move_data_block(struct inode *inode, block_t bidx,
 		}
 	}
 
+	set_summary(&sum, dn.nid, dn.ofs_in_node, ni.version);
+
+	/* allocate block address */
 	f2fs_allocate_data_block(fio.sbi, NULL, fio.old_blkaddr, &newaddr,
 				&sum, type, NULL);
 
@@ -1234,9 +1235,6 @@ static int move_data_block(struct inode *inode, block_t bidx,
 	set_page_writeback(fio.encrypted_page);
 	ClearPageError(page);
 
-	/* allocate block address */
-	f2fs_wait_on_page_writeback(dn.node_page, NODE, true, true);
-
 	fio.op = REQ_OP_WRITE;
 	fio.op_flags = REQ_SYNC;
 	fio.new_blkaddr = newaddr;
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
