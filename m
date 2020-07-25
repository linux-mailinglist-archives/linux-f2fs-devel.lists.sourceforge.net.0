Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF5C22D65A
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Jul 2020 11:15:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jzGH0-0007Se-Ik; Sat, 25 Jul 2020 09:15:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack.qiu@huawei.com>) id 1jzGGz-0007SX-8u
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 25 Jul 2020 09:15:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 To:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ky5H7hIALckFfkFh8kDaqyEIFGksJHyMMWlI7L1udzM=; b=TXFFwZ+tXckk5ZSsnPnncEK9gZ
 5tv3F5scb+Rdeki2Vt3CDNS6LcFn9JpJcOqn7DSUnaz95xRsjDw207ZSq92nBPJ+9VSkOidhXz1tb
 hJZKo2ufrNHTDxja+fFYs2yVLDzUeflQTZb5/c21m+/vjiXubyJakiPg8QdY0IqRKByo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ky5H7hIALckFfkFh8kDaqyEIFGksJHyMMWlI7L1udzM=; b=m
 TbjKS0WDckukI8H/o8qvTEgesX6Sm5wA8oP5kT/hXEfB1jsU4hDvDbGzccqRZkRD9Msd12RPWMGj7
 DgGapIuB9sC3ry2bNOz6CITl9nXcuQJwgS5NwniabV1xp7uiS31mKG0aH/AbuNSWNQ/wf3kwHe0pE
 jtbkqk2A0/U21TsU=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jzGGx-002DHQ-Hi
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 25 Jul 2020 09:15:17 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 0B2BC742A153E4355D2B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 25 Jul 2020 17:15:07 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Sat, 25 Jul 2020
 17:15:04 +0800
From: Jack Qiu <jack.qiu@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Sat, 25 Jul 2020 18:05:27 +0800
Message-ID: <20200725100527.8297-1-jack.qiu@huawei.com>
X-Mailer: git-send-email 2.17.1
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
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jzGGx-002DHQ-Hi
Subject: [f2fs-dev] [PATCH] f2fs: correct comment of f2fs_exist_written_data
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

Function parameter mode could be TRANS_DIR_INO.

Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
---
 fs/f2fs/checkpoint.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 8f5753cc3037..183cdbc6f451 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -523,7 +523,7 @@ void f2fs_remove_ino_entry(struct f2fs_sb_info *sbi, nid_t ino, int type)
 	__remove_ino_entry(sbi, ino, type);
 }

-/* mode should be APPEND_INO or UPDATE_INO */
+/* mode should be APPEND_INO, UPDATE_INO or TRANS_DIR_INO */
 bool f2fs_exist_written_data(struct f2fs_sb_info *sbi, nid_t ino, int mode)
 {
 	struct inode_management *im = &sbi->im[mode];
--
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
