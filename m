Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6C13493D7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Mar 2021 15:14:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lPQke-0000ZO-Fv; Thu, 25 Mar 2021 14:14:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <wangxiaojun11@huawei.com>) id 1lPQkc-0000ZF-8J
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Mar 2021 14:14:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MbApwDcrYgd2u1Z6Uv7zD/ZcyHLgfljeLHEC9rM08aw=; b=L6O4lz3SlmeMRuvdxWhlhoXGN4
 1rvVpO2xBKMuonDfZsP1svZVZKcH1VdTBBQMfxxD0+W1YRQdAscdHueAsGiq14jNOJ9U1tBF/7ufZ
 qBnDlukyM8K+p1kkqiSwz5iKSQtS5KjKyYD2do1KgleScq+uFqjaJKxk4VBsM4qPa6sA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MbApwDcrYgd2u1Z6Uv7zD/ZcyHLgfljeLHEC9rM08aw=; b=U
 6EAxmzKluuJZTV22EJuVQwpB3WrqmnlivJ35rJhfkEifMmTqvQVnHwTnpsP+6PQqm40mzyOaKHRso
 7CmvAAxNmLj7hr5aY0grhXmnRssYpCcRC2hJEd/cETwDxkS7oCfOzWXmMUldT3nhoIFX1r/PowFgs
 JQb/j8qV+0Q37Ca8=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lPQkV-00A1hF-Oh
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Mar 2021 14:14:18 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F5n9Z5JHGzkfc9;
 Thu, 25 Mar 2021 22:12:18 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Thu, 25 Mar 2021
 22:13:50 +0800
From: Wang Xiaojun <wangxiaojun11@huawei.com>
To: <yuchao0@huawei.com>, <jaegeuk@kernel.org>
Date: Thu, 25 Mar 2021 10:19:20 -0400
Message-ID: <20210325141920.858019-1-wangxiaojun11@huawei.com>
X-Mailer: git-send-email 2.25.4
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
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lPQkV-00A1hF-Oh
Subject: [f2fs-dev] [PATCH] f2fs: fix wrong alloc_type in
 f2fs_do_replace_block
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

If the alloc_type of the original curseg is LFS,
when we change_curseg and then do recover curseg,
the alloc_type becomes SSR.

Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>
---
 fs/f2fs/segment.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c2866561263e..c9294f38eb0f 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3539,6 +3539,7 @@ void f2fs_do_replace_block(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	struct seg_entry *se;
 	int type;
 	unsigned short old_blkoff;
+	unsigned char old_alloc_type;
 
 	segno = GET_SEGNO(sbi, new_blkaddr);
 	se = get_seg_entry(sbi, segno);
@@ -3572,6 +3573,7 @@ void f2fs_do_replace_block(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 
 	old_cursegno = curseg->segno;
 	old_blkoff = curseg->next_blkoff;
+	old_alloc_type = curseg->alloc_type;
 
 	/* change the current segment */
 	if (segno != curseg->segno) {
@@ -3606,6 +3608,7 @@ void f2fs_do_replace_block(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 			change_curseg(sbi, type, true);
 		}
 		curseg->next_blkoff = old_blkoff;
+		curseg->alloc_type = old_alloc_type;
 	}
 
 	up_write(&sit_i->sentry_lock);
-- 
2.25.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
