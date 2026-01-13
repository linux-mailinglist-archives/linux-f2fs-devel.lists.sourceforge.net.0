Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE50D18A52
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 13:13:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihpEAYYPeC/gqzRTVjUbOhlkquvbb57afNEJaR4Iv4U=; b=W0fPxPhfeY9NFV8n6jERvIa0re
	9si4LFdVBFqbd5M7KpnmzlsnLD213ctmzhscd6S7AMf3Vv59HtS4OXR46SsvN2xa/HQ+JFbnB+E4+
	hvX8f1TEggUfMkYxKCyKTnkHeN6Ru0u8A1/fr01EZk2oAI0dniYU6fGSbedsepHsXoVs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfdGj-00043F-3S;
	Tue, 13 Jan 2026 12:13:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vfdGh-00042w-A5
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 12:13:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T4JZGPC0+Du1bMEZY82FqBwBl5irqMXgmIDTO5hKdOI=; b=INuguNAHtg7yRav51Bdx4pRdrS
 ayLNXfAhUq9m7fXjPcygx+XUAaVe/nZpn35XZ+mEYDcbUVHlTjmCZfdkZscaJat8fOAUFOCKbxPYF
 u82UNWOhvc2PU272VgZmdss8dxe56G7AkINuGRAy3AIZCOyMK0JT1og4P0HnbftIUNlg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T4JZGPC0+Du1bMEZY82FqBwBl5irqMXgmIDTO5hKdOI=; b=iUYcDpnWENVmjMuAWMpvW67D4G
 cFhHPSRxbLR1HGIsMXHut/+/p/P2U5u1ZBkhM/sl1jRFr+sotIrQseMEz4PzIYq+cApSlk650OOAK
 VlDkcxU+se36galYcPjEbqKp9owUBCLSQtSKIJJc0ZgSYd/eAa3gTaaUybDbkGIuwTOk=;
Received: from smtp153-168.sina.com.cn ([61.135.153.168])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfdGh-0008Ng-DT for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 12:13:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1768306383; bh=T4JZGPC0+Du1bMEZY82FqBwBl5irqMXgmIDTO5hKdOI=;
 h=From:Subject:Date:Message-ID;
 b=MB9CXjHjG9Uo985zfcjzXLARhaRYGzVkbsU83M9GM9zpFogZ9kk871Tc+c7BWofVl
 GwGIsbBghZYHQMR31TqAf1VyeUJZDtUo1coMUhVMK3y5yzuNL+lXry+T5TxN6e2luw
 ig/XVJUPcA0qHy/pbUa6TYK3ATM5F2eTThbXgqUU=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.33) with ESMTP
 id 696636A700004646; Tue, 13 Jan 2026 20:12:53 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 6127986684949
X-SMAIL-UIID: 35BEA8BA60734714A9394CA78280B8D4-20260113-201253-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Tue, 13 Jan 2026 20:11:47 +0800
Message-ID: <20260113120837.215336-6-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113120837.215336-2-monty_pavel@sina.com>
References: 
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang Under stress tests with frequent metadata
 operations, checkpoint write time can become excessively long. Analysis shows
 that the slowdown is caused by synchronous, one-by-one reads of NAT blocks
 durin [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1vfdGh-0008Ng-DT
Subject: [f2fs-dev] [PATCH 3/3] f2fs: optimize NAT block loading during
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
3. Delete 1 file every 455 files
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
index 99e425e8c00a..7a9d9d1a59ec 100644
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
+	 * Read ahead the current NAT block to prevent read requests from
+	 * being issued and waited on one by one.
+	 */
+	list_for_each_entry_safe(set, tmp, &sets, set_list) {
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
