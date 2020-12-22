Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6842E0ACB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Dec 2020 14:34:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1krhnx-0000t1-54; Tue, 22 Dec 2020 13:34:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <zhengyongjun3@huawei.com>) id 1krhnn-0000sh-Ps
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Dec 2020 13:34:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ioc4w23Sj0f0+9J48LOwiHREbHqYihtgEygjv4wYOTY=; b=AkceXDIAGLnqqPQ7oYgtnSBVz9
 jmyHhE6EbHaq+5f7KbiuuBP8qzsgyHPiVd7SbddVUEx8ZjpYNH81nZ5DQR+PZEe1rHeqn4s5mph0L
 A/FOGurDyjOWi1NqHZLzUd9hciAd9QPhmZNmIJ6C5vvKZi5YzsjHdA78a684mbN/0VmI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Ioc4w23Sj0f0+9J48LOwiHREbHqYihtgEygjv4wYOTY=; b=A
 h2wG++T8zc8J+q1HymBHrM6S5ldFLqShX2LwURjkJmz3vgVCx7aMT9umTiniR6OhrJN/5+rD2TZSw
 ievilzKAu9nAXZzkuTuRD2c7lOw3iUJBDhaxe57NKHQAxFq5Vu7SYWfPLWUMkuPn0+25S+H8cu8so
 PECbYxEW+MgWR15Y=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1krhnc-00666H-5r
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Dec 2020 13:34:11 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D0cj25xsTzktP5;
 Tue, 22 Dec 2020 21:32:54 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Tue, 22 Dec 2020 21:33:39 +0800
From: Zheng Yongjun <zhengyongjun3@huawei.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
Date: Tue, 22 Dec 2020 21:34:15 +0800
Message-ID: <20201222133415.19915-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1krhnc-00666H-5r
Subject: [f2fs-dev] [PATCH -next] f2fs: Replace expression with offsetof()
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
Cc: Zheng Yongjun <zhengyongjun3@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use the existing offsetof() macro instead of duplicating code.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 fs/f2fs/node.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index d5d8ce077f29..000cafb522ec 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2686,7 +2686,7 @@ int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct page *page)
 	src = F2FS_INODE(page);
 	dst = F2FS_INODE(ipage);
 
-	memcpy(dst, src, (unsigned long)&src->i_ext - (unsigned long)src);
+	memcpy(dst, src, offsetof(struct f2fs_inode, i_ext));
 	dst->i_size = 0;
 	dst->i_blocks = cpu_to_le64(1);
 	dst->i_links = cpu_to_le32(1);
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
