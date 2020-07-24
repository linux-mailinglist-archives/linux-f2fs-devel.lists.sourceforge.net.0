Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE8F22C2FD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 12:22:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jyupy-0005hL-LF; Fri, 24 Jul 2020 10:21:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jyupx-0005hE-IH
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 10:21:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ruosdhq7DhGo2nyEbGltcIFO3BYKyZ61vQk5gdfyasw=; b=meJovxcTE8Yj0Y1X0TTIFUpVcc
 GqjtKNwaP6d3udH2000p9t9cPVBxGIUdi8O/6IEBuQt24QXD+hjc/2rgLxCkt29QCuckj61DTnulV
 ON2aWekzCJqIyfw8pXO3NQBs9mFtOnZ05A9Tlq2s2p/ZD0YP0PnwdMsr78aOdKXrvi3M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Ruosdhq7DhGo2nyEbGltcIFO3BYKyZ61vQk5gdfyasw=; b=h
 uHhkLpX53N4nKHEUrKgvtdI1fH+Bjvo3qp7GP89o54+c2hVXiS2A+ndil4uEttA5NF32vhqwslcbj
 GbVCqpKCzKe/JOagyUNALfD2wUR3k6zie9Hb6V/8Bc+MqCeQBuoGuwvaaDG6ew5PWBm9cYGOoFnul
 TVDX4hll/qlHL5uw=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jyupv-007Pnn-FC
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 10:21:57 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 163CD4A04CD98040B875;
 Fri, 24 Jul 2020 18:21:48 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Fri, 24 Jul 2020 18:21:41 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 24 Jul 2020 18:21:36 +0800
Message-ID: <20200724102137.78696-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jyupv-007Pnn-FC
Subject: [f2fs-dev] [PATCH 1/2] f2fs: compress: fix to update isize when
 overwriting compressed file
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

We missed to update isize of compressed file in write_end() with
below case:

cluster size is 16KB

- write 14KB data from offset 0
- overwrite 16KB data from offset 0

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/data.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 44645f4f914b..1d7280a70e09 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3470,6 +3470,10 @@ static int f2fs_write_end(struct file *file,
 	if (f2fs_compressed_file(inode) && fsdata) {
 		f2fs_compress_write_end(inode, fsdata, page->index, copied);
 		f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
+
+		if (pos + copied > i_size_read(inode) &&
+				!f2fs_verity_in_progress(inode))
+			f2fs_i_size_write(inode, pos + copied);
 		return copied;
 	}
 #endif
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
