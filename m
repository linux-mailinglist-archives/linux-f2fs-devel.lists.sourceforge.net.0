Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C207529376
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 May 2019 10:53:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hU5ws-0000eo-Rk; Fri, 24 May 2019 08:53:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hU5wq-0000eg-Qm
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 08:53:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qKTRO0GVegK+RBhtuhZobItl/seAkBbtzHG1f5jiwQg=; b=Hg/bthCqE/HfxXKfpVz4r3Zd3L
 MBTxtAsdVLk77eGkZsVFuv6aPJOYwsbRXaTZqMH79pdeKZIEI7vk1vKxnKRS0Tlm774kJA6Sdjw7g
 3le9SKDuXTmWiEhJhDJ4gxAMgLiuCgrN2jDV84ZJ8VEa8IV4df3vlkwvFZZ5nrDIkiHo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qKTRO0GVegK+RBhtuhZobItl/seAkBbtzHG1f5jiwQg=; b=C
 X1nvrrdjCWvcpjMpUd1nDj9B8tLFeci0OUKcHHyln55H7MqiBl+RoAhlXyiK0cn6xlAQS9oGToAiK
 FstGojjDnFOnre6Xqler2D22v4mmsWNy4ZMJgWIX5pbm2ycDOGhgU3wJPyse2fel0p0VQSRwJEoyd
 dPndZaiEELRWCyoc=;
Received: from szxga02-in.huawei.com ([45.249.212.188] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hU5wo-00CuWD-VH
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 08:53:08 +0000
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.57])
 by Forcepoint Email with ESMTP id D89C875F5CB6CBEC7617;
 Fri, 24 May 2019 16:52:59 +0800 (CST)
Received: from dggeme763-chm.china.huawei.com (10.3.19.109) by
 DGGEMM402-HUB.china.huawei.com (10.3.20.210) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 24 May 2019 16:52:58 +0800
Received: from szvp000201624.huawei.com (10.120.216.130) by
 dggeme763-chm.china.huawei.com (10.3.19.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 24 May 2019 16:52:58 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Fri, 24 May 2019 16:52:41 +0800
Message-ID: <20190524085241.111087-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-ClientProxiedBy: dggeme764-chm.china.huawei.com (10.3.19.110) To
 dggeme763-chm.china.huawei.com (10.3.19.109)
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
X-Headers-End: 1hU5wo-00CuWD-VH
Subject: [f2fs-dev] [PATCH] f2fs-tools: detect corrupted sit journal
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
Cc: jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Enables to detect corrupted sit journal
a) total count of entries.
b) segment no. in entry.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/mount.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/fsck/mount.c b/fsck/mount.c
index a627f1d..909c1f4 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1912,8 +1912,25 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 	}
 
 	free(sit_blk);
+
+	if (sits_in_cursum(journal) > SIT_JOURNAL_ENTRIES) {
+		MSG(0, "\tError: build_sit_entries truncate n_sits(%u) to "
+			"SIT_JOURNAL_ENTRIES(%lu)\n",
+			sits_in_cursum(journal), SIT_JOURNAL_ENTRIES);
+		journal->n_sits = cpu_to_le16(SIT_JOURNAL_ENTRIES);
+		c.fix_on = 1;
+	}
+
 	for (i = 0; i < sits_in_cursum(journal); i++) {
 		segno = le32_to_cpu(segno_in_journal(journal, i));
+
+		if (segno >= TOTAL_SEGS(sbi)) {
+			MSG(0, "\tError: build_sit_entries: segno(%u) is invalid!!!\n", segno);
+			journal->n_sits = cpu_to_le16(i);
+			c.fix_on = 1;
+			continue;
+		}
+
 		se = &sit_i->sentries[segno];
 		sit = sit_in_journal(journal, i);
 
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
