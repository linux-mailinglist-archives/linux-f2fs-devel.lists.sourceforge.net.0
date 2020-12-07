Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB5A2D0CF0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Dec 2020 10:24:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmCka-0007wk-8c; Mon, 07 Dec 2020 09:24:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack.qiu@huawei.com>) id 1kmCkR-0007uO-Me
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 09:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cjnITATTgHUAz1GwabhOGzVatTwUikDw+cYlYETKV2c=; b=TzZDzFtq4gARgHM3UcJFk5jgn5
 o5O/puEnElz1o4JGTJpos/m88925AaVn8DOCbqI+NuaJOzt1LynvT4fTFg7dSjVOFiysMkZudKc+8
 UbFoQl/Iy7dMQW8jfh594yF5yadX8KHENbptuwBP0IFGRcdHRDJliG2+p2L1ORYQSWFE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 To:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cjnITATTgHUAz1GwabhOGzVatTwUikDw+cYlYETKV2c=; b=ZpIDFNu9zBbZAIAI0YR8Mxy/R3
 foJuNpCoMbspOU47wjVzVpC+QJaIavvQdIzj4gCneTud1aTvq5W3N8VJZFCBZNZC4NPJ8YufvqG/b
 cRSa7l2axoulh6V9tIPSMIep7uttQGdX+I6gmB5JEAs/2qmNDVnxDrW7Da4kkbTYE/zk=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmCkO-001kdk-TX
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 09:23:59 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CqHsr4yCqz15X0D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  7 Dec 2020 17:23:12 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Mon, 7 Dec 2020
 17:23:40 +0800
From: Jack Qiu <jack.qiu@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Mon, 7 Dec 2020 18:24:05 +0800
Message-ID: <20201207102407.25154-2-jack.qiu@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201207102407.25154-1-jack.qiu@huawei.com>
References: <20201207102407.25154-1-jack.qiu@huawei.com>
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
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kmCkO-001kdk-TX
Subject: [f2fs-dev] [PATCH v2 1/3] f2fs: inline: correct comment in
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
