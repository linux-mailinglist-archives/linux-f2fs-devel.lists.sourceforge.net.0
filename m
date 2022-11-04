Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F259361929E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Nov 2022 09:19:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oqrun-0001ib-T1;
	Fri, 04 Nov 2022 08:19:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1oqruj-0001gt-7S
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Nov 2022 08:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AihrJqgoVd3c0h3fHGKr/hWXiMuYzumF5CStDRHPXeo=; b=ZzApQNfOIKEvxTM7PkI22NceAf
 Zddzpehi2yYNsI9/VL1as1thqVfQSs63ZM+vZIhxkuEgcN6WCs+ZlDa3MB9/8sZVslZywwcN1nhUP
 eZgVIdXquaUhsrCfgUE7JRMqA2OPNOlB8CrWBzG/KM+59Gm3HgR1yo+bs7TWKxEfmPp8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=AihrJqgoVd3c0h3fHGKr/hWXiMuYzumF5CStDRHPXeo=; b=j
 0DSdEATwfuvyEr1CQfSzxHrUq08kFRGfqZpgQOOxyoN/IKqeCzcpMjc2Eq5ATr7OhbODNOj8cg+d0
 qluGX9FaHA6DuIwbc7X5v3kYhxzhqRv059NtaomRhbD7brBtIUoUX2qB0Hf6Uv8pY75pq0Nte09mi
 Ho4dHm/qROI4xj1E=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.unisoc.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oqruh-00BSaa-Oa for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Nov 2022 08:18:57 +0000
Received: from SHSQR01.spreadtrum.com (localhost [127.0.0.2] (may be forged))
 by SHSQR01.unisoc.com with ESMTP id 2A47fopi019002
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 4 Nov 2022 15:41:50 +0800 (CST)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHSend.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by SHSQR01.spreadtrum.com with ESMTPS id 2A47epYA004466
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
 Fri, 4 Nov 2022 15:40:51 +0800 (CST)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from bj08434pcu.spreadtrum.com (10.0.74.109) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Fri, 4 Nov 2022 15:40:51 +0800
From: "zhiguo.niu" <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>
Date: Fri, 4 Nov 2022 15:40:21 +0800
Message-ID: <1667547621-26175-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.74.109]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 2A47epYA004466
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Zhiguo Niu <zhiguo.niu@unisoc.com> There is bug on
 issue
 after atgc feature is enabled in 32bits platform as the following log: F2FS-fs
 (dm-x): inconsistent rbtree, cur(3470333575168) next(3320009719808) [ cut
 here ] kernel BUG at fs/f2fs/gc.c:602! Internal error: Oops - BUG: 0 [#1]
 PREEMPT SMP ARM PC i [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1oqruh-00BSaa-Oa
Subject: [f2fs-dev] [PATCH] f2fs: fix atgc bug on issue in 32bits platform
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
Cc: zhiguo.niu@unisoc.com, niuzhiguo84@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Zhiguo Niu <zhiguo.niu@unisoc.com>

There is bug on issue after atgc feature is enabled in
32bits platform as the following log:

F2FS-fs (dm-x): inconsistent rbtree, cur(3470333575168) next(3320009719808)
------------[ cut here ]------------
kernel BUG at fs/f2fs/gc.c:602!
Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
PC is at get_victim_by_default+0x13c0/0x1498
LR is at f2fs_check_rb_tree_consistence+0xc4/0xd4
....
[<c04d98b0>] (get_victim_by_default) from [<c04d4f44>] (f2fs_gc+0x220/0x6cc)
[<c04d4f44>] (f2fs_gc) from [<c04d4780>] (gc_thread_func+0x2ac/0x708)
[<c04d4780>] (gc_thread_func) from [<c015c774>] (kthread+0x1a8/0x1b4)
[<c015c774>] (kthread) from [<c01010b4>] (ret_from_fork+0x14/0x20)

The reason is the 64bits key in struct rb_entry has __packed attibute
but has not in struct victim_entry, so the wrong key value got by
in f2fs_check_rb_tree_consistence, the following are the memory layouts
of struct rb_entry and struct victim_entry in 32bits platform:

struct rb_entry {
   [0] struct rb_node rb_node;
       union {
           struct {...};
  [12]     unsigned long long key;
       };
}
struct victim_entry {
   [0] struct rb_node rb_node;
       union {
           struct {...};
  [16]     struct victim_info vi;
       };
  [32] struct list_head list;
}

This patch fix this inconsistence layout of 64bits key between
struct rb_entry and struct victim_entry.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/gc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 19b956c2d697..9a03c6502b39 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -68,7 +68,7 @@ struct victim_entry {
 			unsigned int segno;		/* segment No. */
 		};
 		struct victim_info vi;	/* victim info */
-	};
+	} __packed;
 	struct list_head list;
 };
 
-- 
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
