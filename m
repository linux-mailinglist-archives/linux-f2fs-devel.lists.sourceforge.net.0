Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7C9216B5F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jul 2020 13:22:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jslfo-0005ab-A9; Tue, 07 Jul 2020 11:22:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jslfm-0005aH-Nt
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jul 2020 11:22:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n84N7M6ll973nCmT+bT4PV1uyN1mDR1TL1DwqZKaqpI=; b=HBYLv0AtBJpBQzDxm2luWd0XO6
 PkWqCcAAXmRN5FgIVCbPt4CfPQxPaxcm3Z0uMACzWDUInigZ4rUCpMdVjzpc2SH//USFCCJUD1MEv
 k4DQLUO+eP3bpyMOSr3wI0VLOPXqwK+C6Mhfj/nN10OocevV6K/JCvNnhA6Ta4VZ5Obc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n84N7M6ll973nCmT+bT4PV1uyN1mDR1TL1DwqZKaqpI=; b=fEtbfCl7O8+m07ZmMZU3Xt8t4R
 uAO3dJV5YvpelF6Q6TpOn95/bZ5qnXhWVsz/1LhRJlErZT1n0CwfHtoYIGbKfQhBsT/WoKRbQHacP
 yBfyhdP7HKziy9KhVqCObC93L35UN6F8m427FMtJaplZlVi6EPey3oPwkQDZZMhuUe5s=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jslfk-00D8KL-S0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jul 2020 11:22:02 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 33509EE35359BBB50C41;
 Tue,  7 Jul 2020 19:21:53 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Tue, 7 Jul 2020 19:21:44 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 7 Jul 2020 19:21:25 +0800
Message-ID: <20200707112128.89136-3-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200707112128.89136-1-yuchao0@huawei.com>
References: <20200707112128.89136-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jslfk-00D8KL-S0
Subject: [f2fs-dev] [PATCH 2/5] f2fs: record average update time of segment
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

Previously, once we update one block in segment, we will update mtime of
segment to last time, making aged segment becoming freshest, result in
that GC with cost benefit algorithm missing such segment, So this patch
changes to record mtime as average block updating time instead of last
updating time.

It's not needed to reset mtime for prefree segment, as se->valid_blocks
is zero, then old se->mtime won't take any weight with below calculation:

	se->mtime = div_u64(se->mtime * se->valid_blocks + mtime,
					se->valid_blocks + 1);

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/segment.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 7419aa07cf08..9d10285932f9 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2150,6 +2150,22 @@ static void __set_sit_entry_type(struct f2fs_sb_info *sbi, int type,
 		__mark_sit_entry_dirty(sbi, segno);
 }
 
+static void update_segment_mtime(struct f2fs_sb_info *sbi, block_t blkaddr)
+{
+	unsigned int segno = GET_SEGNO(sbi, blkaddr);
+	struct seg_entry *se = get_seg_entry(sbi, segno);
+	unsigned long long mtime = get_mtime(sbi, false);
+
+	if (!se->mtime)
+		se->mtime = mtime;
+	else
+		se->mtime = div_u64(se->mtime * se->valid_blocks + mtime,
+						se->valid_blocks + 1);
+
+	if (mtime > SIT_I(sbi)->max_mtime)
+		SIT_I(sbi)->max_mtime = mtime;
+}
+
 static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 {
 	struct seg_entry *se;
@@ -2169,10 +2185,9 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 	f2fs_bug_on(sbi, (new_vblocks >> (sizeof(unsigned short) << 3) ||
 				(new_vblocks > sbi->blocks_per_seg)));
 
+	update_segment_mtime(sbi, blkaddr);
+
 	se->valid_blocks = new_vblocks;
-	se->mtime = get_mtime(sbi, false);
-	if (se->mtime > SIT_I(sbi)->max_mtime)
-		SIT_I(sbi)->max_mtime = se->mtime;
 
 	/* Update valid block bitmap */
 	if (del > 0) {
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
