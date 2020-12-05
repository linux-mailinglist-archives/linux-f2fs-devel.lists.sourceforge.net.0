Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B702CFA09
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  5 Dec 2020 07:41:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1klRFe-00084U-BH; Sat, 05 Dec 2020 06:41:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack.qiu@huawei.com>) id 1klRFY-00083q-0E
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 05 Dec 2020 06:40:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cjnITATTgHUAz1GwabhOGzVatTwUikDw+cYlYETKV2c=; b=dsa0i2sMineSOWqUnU7pCrbbe+
 RQeqRNH16oq/KfMSBKPbamC76H7sveswuV/g8iu5L2Itzb21Hcfqy2UvhTB2DIadoCwdea5+16Ezz
 sTpmJiGLqX8FbdV5CHoRI4wSFtnadmx2k4YAhzHdmjPSYkb5rx49Rec/iEZwE3QYOYl8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 To:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cjnITATTgHUAz1GwabhOGzVatTwUikDw+cYlYETKV2c=; b=Vwec0E/77lgvxA7ddUdIl0rOI3
 UCqjPVPextfz20F2fJNt+cNijEWunHFylI8hNgGnkDGgH+dSYWx7G+JIt6vqBBX9mGpDc03ZnUH2G
 3Zs63Na5YLfddlpLo8DkHYa/2RExTikMV4x6Rcm7yUzS4MjnPWkTp5Go5AtzNzoxCNlA=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1klRFN-002n1g-TG
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 05 Dec 2020 06:40:55 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Cp0LW5tWnz78r7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  5 Dec 2020 14:40:03 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Sat, 5 Dec 2020
 14:40:26 +0800
From: Jack Qiu <jack.qiu@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Sat, 5 Dec 2020 15:40:53 +0800
Message-ID: <20201205074055.31574-2-jack.qiu@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201205074055.31574-1-jack.qiu@huawei.com>
References: <20201205074055.31574-1-jack.qiu@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1klRFN-002n1g-TG
Subject: [f2fs-dev] [PATCH 1/3] f2fs: inline: correct comment in
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
