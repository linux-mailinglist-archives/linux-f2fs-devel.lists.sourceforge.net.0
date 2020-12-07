Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A6F2D0E93
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Dec 2020 12:01:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmEGY-0002VJ-2R; Mon, 07 Dec 2020 11:01:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack.qiu@huawei.com>) id 1kmEGT-0002U3-8A
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 11:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7k4XM8/c79+5G3q2LgN7JdZ0dWMdCDmpjLCIIsCst98=; b=hnBvuJTExfrdis1vSNVaA27NbQ
 RB7CL3+55e0E28xmBTb5ghHTSmJhoaMdttrYAPIiErr4JHl4deucI0wR1FFCIFuGOQEnEx5kM5D4c
 kgsBPN4XuSxzSrs/urC7t89rFdtl3OHkX9722tGC5EHXWZSATgzbr+OWl/QwmC/sQY7I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 To:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7k4XM8/c79+5G3q2LgN7JdZ0dWMdCDmpjLCIIsCst98=; b=H7/J1fQtXdEiVt3epr8KwLna8U
 lfRRRICq+Zc3WLoT5YHnCGArFTd7ROlumzj/z17F7tgMnM4SHLhL3hyR87pA5+uiM6OlpYQfSSLNm
 7EK1uwyzi8C2qNTk0/XejZJUsjYYILyNyFCu8LRDe1SA1NHjrCWP8yjphnkQhkdR6ySY=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmEGM-005EpX-4J
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 11:01:09 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CqL1w3DPHzhnqQ
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  7 Dec 2020 19:00:20 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Mon, 7 Dec 2020
 19:00:48 +0800
From: Jack Qiu <jack.qiu@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Mon, 7 Dec 2020 20:01:12 +0800
Message-ID: <20201207120114.25642-2-jack.qiu@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201207120114.25642-1-jack.qiu@huawei.com>
References: <20201207120114.25642-1-jack.qiu@huawei.com>
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
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kmEGM-005EpX-4J
Subject: [f2fs-dev] [PATCH v3 1/3] f2fs: inline: correct comment in
 f2fs_recover_inline_data
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

In 3rd scene, it should remove data blocks instead of inline_data.

Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/inline.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 70384e31788d..0399531efcd3 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -266,7 +266,7 @@ int f2fs_recover_inline_data(struct inode *inode, struct page *npage)
 	 * [prev.] [next] of inline_data flag
 	 *    o       o  -> recover inline_data
 	 *    o       x  -> remove inline_data, and then recover data blocks
-	 *    x       o  -> remove inline_data, and then recover inline_data
+	 *    x       o  -> remove data blocks, and then recover inline_data
 	 *    x       x  -> recover data blocks
 	 */
 	if (IS_INODE(npage))
--
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
