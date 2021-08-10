Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED40A3E5B8C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Aug 2021 15:27:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDRmv-0001dh-5E; Tue, 10 Aug 2021 13:27:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <frank.li@vivo.com>) id 1mDRmt-0001da-4Z
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Aug 2021 13:27:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J+sGIWiJ7PrDzidKXQLS/ZdG3/x0WxOb9Y8Pl/Qp+V8=; b=Lc9A/7zYjytW0K168gs+//Ubo/
 83B89V/E+Ropzx5WRIyW3gU+1kjsgw3HBkDT5M8bByYr/SL8d+GsMNF2Dd56G2z1zKo+WuuRu3YYz
 lkXkwnoCNiiF5Lvgy8d6q1p73WnZLQUql3Iz8MKBLGP+EpwjsTlVG6MFkO9hf2azjkGY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J+sGIWiJ7PrDzidKXQLS/ZdG3/x0WxOb9Y8Pl/Qp+V8=; b=CjKjfAb83EJ7tGqlC9q7PlRmt3
 XdRpEQ9qQGku8GAr07k0o/UqFQwuh7DvDFWvLxyLLVgqbOgGVY0ZZHfIjwB7/6HrfCwJwfPzyGgg1
 e38RaIHU5Tsxew6mTyvvzA38pH+qA91wSEyKAuFMTs3AXwafDw3aO5C1VKJtjEBYKP84=;
Received: from mail-m17636.qiye.163.com ([59.111.176.36])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDRmq-001tpd-TE
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Aug 2021 13:27:22 +0000
Received: from comdg01144022.vivo.xyz (unknown [218.104.188.165])
 by mail-m17636.qiye.163.com (Hmail) with ESMTPA id 8E48BC401B8;
 Tue, 10 Aug 2021 21:27:13 +0800 (CST)
From: Yangtao Li <frank.li@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Aug 2021 21:27:07 +0800
Message-Id: <20210810132707.349147-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210810132707.349147-1-frank.li@vivo.com>
References: <20210810132707.349147-1-frank.li@vivo.com>
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRlCQ01WGUgYSR4eTx9NSE
 pMVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NTI6Fgw*ET9MKSwhOhU8HhQf
 FT5PCRlVSlVKTUlDTUtJS0hPSk9JVTMWGhIXVR0JGhUQVRcSOw0SDRRVGBQWRVlXWRILWUFZSUpD
 VUpLT1VKQ0NVSk1OWVdZCAFZQUlCTkI3Bg++
X-HM-Tid: 0a7b303ee63ed996kuws8e48bc401b8
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.36 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1mDRmq-001tpd-TE
Subject: [f2fs-dev] [PATCH] f2fs: improve sbi status info in
 debugfs/f2fs/status
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
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Do not use numbers but strings to improve readability.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/debug.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 473ad04d1891..91c0910b0bb7 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -323,22 +323,40 @@ static void update_mem_info(struct f2fs_sb_info *sbi)
 #endif
 }
 
+static char *s_flag[] = {
+	[SBI_IS_DIRTY]		= " dirty",
+	[SBI_IS_CLOSE]		= " close",
+	[SBI_NEED_FSCK]		= " fsck",
+	[SBI_POR_DOING]		= " doing",
+	[SBI_NEED_SB_WRITE]	= " sb_write",
+	[SBI_NEED_CP]		= " cp",
+	[SBI_IS_SHUTDOWN]	= " shutdown",
+	[SBI_IS_RECOVERED]	= " recovered",
+	[SBI_CP_DISABLED]	= " cp_disabled",
+	[SBI_CP_DISABLED_QUICK]	= " cp_disabled_quick",
+	[SBI_QUOTA_NEED_FLUSH]	= " quota_need_flush",
+	[SBI_QUOTA_SKIP_FLUSH]	= " quota_skip_flush",
+	[SBI_QUOTA_NEED_REPAIR]	= " quota_need_repair",
+	[SBI_IS_RESIZEFS]	= " resizefs",
+};
+
 static int stat_show(struct seq_file *s, void *v)
 {
 	struct f2fs_stat_info *si;
-	int i = 0;
-	int j;
+	int i = 0, j = 0;
 
 	mutex_lock(&f2fs_stat_mutex);
 	list_for_each_entry(si, &f2fs_stat_list, stat_list) {
 		update_general_status(si->sbi);
 
-		seq_printf(s, "\n=====[ partition info(%pg). #%d, %s, CP: %s (sbi: 0x%lx)]=====\n",
+		seq_printf(s, "\n=====[ partition info(%pg). #%d, %s, CP: %s (sbi:",
 			si->sbi->sb->s_bdev, i++,
 			f2fs_readonly(si->sbi->sb) ? "RO": "RW",
 			is_set_ckpt_flags(si->sbi, CP_DISABLED_FLAG) ?
-			"Disabled": (f2fs_cp_error(si->sbi) ? "Error": "Good"),
-			si->sbi->s_flag);
+			"Disabled" : (f2fs_cp_error(si->sbi) ? "Error" : "Good"));
+		for_each_set_bit(j, &si->sbi->s_flag, 32)
+			seq_puts(s, s_flag[j]);
+		seq_puts(s, ") ]=====\n");
 		seq_printf(s, "[SB: 1] [CP: 2] [SIT: %d] [NAT: %d] ",
 			   si->sit_area_segs, si->nat_area_segs);
 		seq_printf(s, "[SSA: %d] [MAIN: %d",
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
