Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F321923DF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2020 10:18:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jH2BU-0008V1-70; Wed, 25 Mar 2020 09:18:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jH2BS-0008UP-DH
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 09:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1EhaVgNbSIrx2FjuHM+REZ2qRvWdblU1YnsAgIGlO9Q=; b=MYhjxaUsrpwbcuYkwiygLTK8OX
 JPtdkXo4QvZKBoTJbntnWsjc9i0gNqYkwU+WCetnhlDibzG/oLZvyfyvhEsNyZUOScqU2luYWxXjH
 JpTDtyRsj3MkdwI1cqvVfi8Tf5JK2sSZpABzZ0ICrhKHIp/UUBfSk0/dNJD5S7uE4uoc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1EhaVgNbSIrx2FjuHM+REZ2qRvWdblU1YnsAgIGlO9Q=; b=h
 HYSChHHllF4xoHQ/E23wO2v5BBWWwK/QlhDKDumZiq0vwZ2zX64OaesUuWgldnLr3vleFeFWC2lu9
 /kouC/WthaaaRR5jsrX/i9+R+hpYS9WulUmwDxhMBMCUev16EZE5+u8BQx1Qi4Yv+NkDqw1XCtWJN
 9tlnPzkf0jhYZh2I=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jH2BP-002lAP-RS
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 25 Mar 2020 09:18:46 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id DF0359B4CF8D141A553E;
 Wed, 25 Mar 2020 17:18:31 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Wed, 25 Mar 2020 17:18:24 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 25 Mar 2020 17:18:11 +0800
Message-ID: <20200325091811.60725-1-yuchao0@huawei.com>
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
X-Headers-End: 1jH2BP-002lAP-RS
Subject: [f2fs-dev] [PATCH v2 3/5] f2fs: fix to avoid NULL pointer
 dereference
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

Unable to handle kernel NULL pointer dereference at virtual address 00000000
PC is at f2fs_free_dic+0x60/0x2c8
LR is at f2fs_decompress_pages+0x3c4/0x3e8
f2fs_free_dic+0x60/0x2c8
f2fs_decompress_pages+0x3c4/0x3e8
__read_end_io+0x78/0x19c
f2fs_post_read_work+0x6c/0x94
process_one_work+0x210/0x48c
worker_thread+0x2e8/0x44c
kthread+0x110/0x120
ret_from_fork+0x10/0x18

In f2fs_free_dic(), we can not use f2fs_put_page(,1) to release dic->tpages[i],
as the page's mapping is NULL.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2:
- fix to skip release tpages[i] if it is NULL in error path.
 fs/f2fs/compress.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index ef7dd04312fe..6e10800729b6 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1137,7 +1137,10 @@ void f2fs_free_dic(struct decompress_io_ctx *dic)
 		for (i = 0; i < dic->cluster_size; i++) {
 			if (dic->rpages[i])
 				continue;
-			f2fs_put_page(dic->tpages[i], 1);
+			if (!dic->tpages[i])
+				continue;
+			unlock_page(dic->tpages[i]);
+			put_page(dic->tpages[i]);
 		}
 		kfree(dic->tpages);
 	}
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
