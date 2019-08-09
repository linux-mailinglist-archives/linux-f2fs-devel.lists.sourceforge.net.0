Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0247877D3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Aug 2019 12:53:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hw2WY-0007Oq-98; Fri, 09 Aug 2019 10:53:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hw2WV-0007O9-Ma
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 10:53:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w7H6Tmq3lOw8ksg9YOlwmwETE3jGtOtQv7H+RxZB5xo=; b=bee7qFDYt8u/1oTq0zQxrGj7lO
 omB8Rx+Id8N6NjQl0VpSwyct7wm3MTjqETdxBiuRpx+ODya7LcYdIib3O9jo/8byP3vdOr5SjNfmN
 J/+4/TM9lT9MGf1PmtMBHTnZXiYvEr67A+spjrEbMWCaNYwRMrArenLQdy+DG9zLI5fU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w7H6Tmq3lOw8ksg9YOlwmwETE3jGtOtQv7H+RxZB5xo=; b=H9o+SvMOAxG6WSGfPmi9HaV4oi
 LZwbq7aEJnJ/QUFPy9iEQK/KHY1XAbfgVLVz6XtKDsA4oihn86SlcGkxwUzIQQvWeLqkOu/W3VBkb
 AXwWJ9jA7j9bxLonb7HUz61WjzvbF0tSTq1eN2n5vWSA7G0HL+0Sz6YbJZWGnAarfMNo=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hw2WT-00HEew-Mz
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 10:53:27 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id BB29DC058791E39F234A;
 Fri,  9 Aug 2019 18:53:18 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Fri, 9 Aug 2019 18:53:11 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 9 Aug 2019 18:52:54 +0800
Message-ID: <20190809105302.79876-2-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20190809105302.79876-1-yuchao0@huawei.com>
References: <20190809105302.79876-1-yuchao0@huawei.com>
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
X-Headers-End: 1hw2WT-00HEew-Mz
Subject: [f2fs-dev] [PATCH 02/10] f2fs-tools: fix to avoid memory leak of
 sit_i->sentries
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We missed to free sit_i->sentries in f2fs_do_umount(), fix it.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/mount.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fsck/mount.c b/fsck/mount.c
index f97c4ea..af7149e 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2917,6 +2917,7 @@ void f2fs_do_umount(struct f2fs_sb_info *sbi)
 		free(sit_i->sentries[i].cur_valid_map);
 
 	free(sit_i->sit_bitmap);
+	free(sit_i->sentries);
 	free(sm_i->sit_info);
 
 	/* free sm_info */
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
