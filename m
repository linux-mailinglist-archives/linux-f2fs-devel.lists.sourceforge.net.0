Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C541A9183
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 05:27:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOYho-0006Zf-1w; Wed, 15 Apr 2020 03:27:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jOYhm-0006ZV-5U
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 03:27:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QRPHoqZ23JxJwQE4DB7UI0lQH+jJJkAtPq/pNaGxUbA=; b=CqlMqhQbdmgFy0X4Bew4QiAt63
 KmuWq55trH9JKIOuBcKids2xDa4TnOD0jF9kaayXvzXSAWgJJFuIXcUciVG5Ny7+SPRkRHFA5SYx4
 Ax48cRVuAPRhGGJ4jiUqD8h/72rm8TWpA1W1rAVqkRWd/EdZbxEogo24Lpp9Ua8CqvQg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QRPHoqZ23JxJwQE4DB7UI0lQH+jJJkAtPq/pNaGxUbA=; b=k
 aiUZiWdgUqfT4WIepRDwtPspB0vNHjQ0BcMam3Cf86DKuxhRtxDazafyo9lFfzj7lBQ+e2yz7oDMQ
 TXjXWk1OPZe0i1Fcrd69dDW9h2D4TSEmInOzhTfsAK8ZlMVNeFgQK7QVWD3ZGl7cT/+hCvv5DiAYj
 8aSAwrcDzh38EYA8=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOYhi-00GoN8-B4
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 03:27:14 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C185369FB8017DFB5C9D;
 Wed, 15 Apr 2020 11:26:59 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Wed, 15 Apr 2020 11:26:52 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Wed, 15 Apr 2020 11:26:48 +0800
Message-ID: <20200415032648.7294-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jOYhi-00GoN8-B4
Subject: [f2fs-dev] [PATCH] fsck.f2fs: fix to avoid overflow during
 print_inode_info()
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
Cc: kilobyte@angband.pl, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

While dumping files during fsck, print_inode_info() didn't check
sanity of inode, so insane i_extra_isize could cause overflow
when printing i_addr, to avoid that, let's add a check condition.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/mount.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index 0aab071..fb45941 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -237,9 +237,14 @@ void print_inode_info(struct f2fs_sb_info *sbi,
 	}
 
 	for (i = 0; i < ADDRS_PER_INODE(inode); i++) {
-		block_t blkaddr = le32_to_cpu(inode->i_addr[i + ofs]);
+		block_t blkaddr;
 		char *flag = "";
 
+		if (i + ofs >= DEF_ADDRS_PER_INODE)
+			break;
+
+		blkaddr = le32_to_cpu(inode->i_addr[i + ofs]);
+
 		if (blkaddr == 0x0)
 			continue;
 		if (blkaddr == COMPRESS_ADDR)
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
