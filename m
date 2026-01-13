Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B102D19DB9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 16:24:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8WFTN3CWorAxQkAqT7/3BJvOU3BM3yaykrBKCXFRC+o=; b=JpCeUmrCpaF6FiBEJGYrKk/Ngo
	CyRelF6VcdantE9W6j0QH4HQrauW34un/JlQ/2Z2u5uDDpJzsjzVJ90Fo8q84JRafliQPT0rR1yP5
	PTX9wweke3bOLcXmT0GKg+GLkjytntlRpGwgVg3oUHQexUW1WuEyA0/9ZxksWgprKNgA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfgFo-0005c2-5U;
	Tue, 13 Jan 2026 15:24:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vfgFm-0005bv-3r
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 15:24:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hWwBRxYOv0qC67/L15SVoYmxA3mKyWPdBnWdfTPuLX0=; b=C3UBoCMfcCTIyZfJJMJRw/MwZ7
 60cUlzbSzVWTV5JphMtcLlPczZthxcttxJEF52onlZWlLQDG72yhnwsnIqacTdrL2zPfdOQCvv/Sb
 S/qeejx6E3aMT6eHQDFuu5Sben44KddB59plHiuxgssRBzSv0vxFgUH7hvRIH6z15NvA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hWwBRxYOv0qC67/L15SVoYmxA3mKyWPdBnWdfTPuLX0=; b=b3t0Lw/qC6MQAxMoxkeXyLd5ht
 q6f9Fc1M+swtu3n64cpYd6PzqbUieauYq/MBWFLeWu9VZOvLCngjV2thN4RSshdB70DEFMZ8QMIc7
 WwojK4L8cjf8bV1CbvN7RhKSgSFDYI99QFzV89NQFmmZI4fkTaRBA8bYMayWdUGD4Fx4=;
Received: from mail3-162.sinamail.sina.com.cn ([202.108.3.162])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfgFk-0001Ds-Sw for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 15:24:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1768317857; bh=hWwBRxYOv0qC67/L15SVoYmxA3mKyWPdBnWdfTPuLX0=;
 h=From:Subject:Date:Message-ID;
 b=mC6y28TWErBOJ/HnuNGHGujJHksWZPikjYvq7mg1MCD08h7Hol3xJCobgV7QyhCLw
 iNcxJok8YJS8GayH6LfOv7I9i8VlJ02x/XM/5eSVh+/tjv75ImRzMmjj9yo5J+XDtP
 eypm12HckNnVFt4gNxWovqtvlFe4nqyuSP1R4Ljw=
X-SMAIL-HELO: monty-pavel..
Received: from unknown (HELO monty-pavel..)([120.245.114.32])
 by sina.com (10.54.253.34) with ESMTP
 id 6966639000000605; Tue, 13 Jan 2026 23:24:02 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 5618716292035
X-SMAIL-UIID: B542EA3CA17F4D4BB4497CA429DF5D04-20260113-232402-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Tue, 13 Jan 2026 23:23:15 +0800
Message-ID: <20260113152138.15979-5-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113152138.15979-2-monty_pavel@sina.com>
References: <20260113152138.15979-2-monty_pavel@sina.com>
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang Under stress tests with frequent metadata
 operations, checkpoint write time can become excessively long. Analysis shows
 that the slowdown is caused by synchronous, one-by-one reads of NAT blocks
 durin [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [120.245.114.32 listed in dnsbl-2.uceprotect.net]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [202.108.3.162 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1vfgFk-0001Ds-Sw
Subject: [f2fs-dev] [PATCH v2 3/3] f2fs: optimize NAT block loading during
 checkpoint write
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

Under stress tests with frequent metadata operations, checkpoint write
time can become excessively long. Analysis shows that the slowdown is
caused by synchronous, one-by-one reads of NAT blocks during checkpoint
processing.

The issue can be reproduced with the following workload:
1. seq 1 650000 | xargs -P 16 -n 1 touch
2. sync # avoid checkpoint write during deleting
3. delete 1 file every 455 files
4. echo 3 > /proc/sys/vm/drop_caches
5. sync # trigger checkpoint write

This patch submits read I/O for all NAT blocks required in the
__flush_nat_entry_set() phase in advance, reducing the overhead of
synchronous waiting for individual NAT block reads.

The NAT block flush latency before and after the change is as below:

|             |NAT blocks accessed|NAT blocks read|Flush time (ms)|
|-------------|-------------------|---------------|---------------|
|Before change|1205               |1191           |158            |
|After change |1264               |1242           |11             |

With a similar number of NAT blocks accessed and read from disk, adding
NAT block readahead reduces the total NAT block flush time by more than
90%.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/node.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 99e425e8c00a..fa1ddfd6633f 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -3164,7 +3164,7 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	struct f2fs_journal *journal = curseg->journal;
 	struct nat_entry_set *setvec[NAT_VEC_SIZE];
 	struct nat_entry_set *set, *tmp;
-	unsigned int found;
+	unsigned int found, entry_count = 0;
 	nid_t set_idx = 0;
 	LIST_HEAD(sets);
 	int err = 0;
@@ -3204,6 +3204,17 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 						MAX_NAT_JENTRIES(journal));
 	}
 
+	/*
+	 * Readahead the current NAT block to prevent read requests from
+	 * being issued and waited on one by one.
+	 */
+	list_for_each_entry(set, &sets, set_list) {
+		entry_count += set->entry_cnt;
+		if (!enabled_nat_bits(sbi, cpc) &&
+			__has_cursum_space(journal, entry_count, NAT_JOURNAL))
+			continue;
+		f2fs_ra_meta_pages(sbi, set->set, 1, META_NAT, true);
+	}
 	/* flush dirty nats in nat entry set */
 	list_for_each_entry_safe(set, tmp, &sets, set_list) {
 		err = __flush_nat_entry_set(sbi, set, cpc);
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
