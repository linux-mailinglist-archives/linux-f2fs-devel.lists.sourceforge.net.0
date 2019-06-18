Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 670DB49DE8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Jun 2019 12:01:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hdAvg-0004N5-6A; Tue, 18 Jun 2019 10:01:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hdAve-0004Mv-KR
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Jun 2019 10:01:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yRgYrMQUkqvBXxd8OjFCmDsowkM1zjaB0fuo5NSsQeI=; b=iJDTljux1kJ/pH5ByRtBhRNjn6
 H3sYRieDwEPx1+yRX8y/P55RolMTVZfR4360QRTduKCsj1zkmrFMiifziMM0wsiZMpnlRGaak74ni
 A8+8q8VgB1L0UxM0aoDo9vPYJwmD3MHlUaZF7ABkW+3JXNAn1HH+k+UNvDS4z++V7lwQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yRgYrMQUkqvBXxd8OjFCmDsowkM1zjaB0fuo5NSsQeI=; b=d
 7QmaV+rKgK20RIS+70emUHq/Zi11cOD2DgBj8wYjBESEnLCb+oJlMb/q3PDg1L58W/oGEluD7dBwJ
 lzLG8bbhZx6cTQgEyWaKgfJ1OSUv+6DB6iL2hSsLYFL3q5Xb3nnL+uqzGcm/MQCn8KN9PUR1olB/8
 biPHLQu34Hot7UO0=;
Received: from szxga01-in.huawei.com ([45.249.212.187] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hdAvZ-002jUF-SO
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Jun 2019 10:01:23 +0000
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.55])
 by Forcepoint Email with ESMTP id D8C6C14A0692539BE311;
 Tue, 18 Jun 2019 18:01:14 +0800 (CST)
Received: from dggeme763-chm.china.huawei.com (10.3.19.109) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 18 Jun 2019 18:01:11 +0800
Received: from szvp000201624.huawei.com (10.120.216.130) by
 dggeme763-chm.china.huawei.com (10.3.19.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 18 Jun 2019 18:01:10 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 18 Jun 2019 18:00:09 +0800
Message-ID: <20190618100009.20583-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-ClientProxiedBy: dggeme717-chm.china.huawei.com (10.1.199.113) To
 dggeme763-chm.china.huawei.com (10.3.19.109)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hdAvZ-002jUF-SO
Subject: [f2fs-dev] [PATCH] f2fs: avoid get_valid_blocks() for cleanup
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

No logic change.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/sysfs.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index fa184880cff3..50f38054b648 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -582,8 +582,7 @@ static int __maybe_unused segment_info_seq_show(struct seq_file *seq,
 
 		if ((i % 10) == 0)
 			seq_printf(seq, "%-10d", i);
-		seq_printf(seq, "%d|%-3u", se->type,
-					get_valid_blocks(sbi, i, false));
+		seq_printf(seq, "%d|%-3u", se->type, se->valid_blocks);
 		if ((i % 10) == 9 || i == (total_segs - 1))
 			seq_putc(seq, '\n');
 		else
@@ -609,8 +608,7 @@ static int __maybe_unused segment_bits_seq_show(struct seq_file *seq,
 		struct seg_entry *se = get_seg_entry(sbi, i);
 
 		seq_printf(seq, "%-10d", i);
-		seq_printf(seq, "%d|%-3u|", se->type,
-					get_valid_blocks(sbi, i, false));
+		seq_printf(seq, "%d|%-3u|", se->type, se->valid_blocks);
 		for (j = 0; j < SIT_VBLOCK_MAP_SIZE; j++)
 			seq_printf(seq, " %.2x", se->cur_valid_map[j]);
 		seq_putc(seq, '\n');
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
