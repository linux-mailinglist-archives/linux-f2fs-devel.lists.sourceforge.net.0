Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5233680FC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Apr 2021 14:59:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lZYve-0003VX-OF; Thu, 22 Apr 2021 12:59:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <frank.li@vivo.com>) id 1lZYvc-0003VA-0N
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Apr 2021 12:59:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YKCeRG36rNQX1zgUrQeY5UviLe8/LSOimxJQgxtt+Y4=; b=jdZ4E7HY0Qja2dqFvy8sZse4Ql
 FLTesZp+peoTxNU8al0hVhgmd/G3BrwptQH/VxZNHTh7z1VJ468fBn8+VnHWhRwzxNQ0tE+itGkKs
 latFi6PwS5yAIkcxyexUNJneHWRleTti3Rspdt4w6BTQpuI4Uey9TdP7ypFjGVWrPSsg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YKCeRG36rNQX1zgUrQeY5UviLe8/LSOimxJQgxtt+Y4=; b=Q
 fnFXcyHE5C98p/s+KJE99x79M3MtoE4WuMj/Jqhphm5WCd26xSSjVKLt2Eu384dXyR5bdDuVbo+iR
 yJv9xKM/FVPztWBe/NHVGcoeapDGetmJHD6IBcihMnF9FiAqVIx1nmATU5q3TB5wTNJouj9+1hEH/
 A0+bTmocUYBsdxx4=;
Received: from mail-m176233.qiye.163.com ([59.111.176.233])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lZYvU-00ChEt-Mz
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Apr 2021 12:59:32 +0000
Received: from ubuntu.localdomain (unknown [58.250.176.229])
 by mail-m176233.qiye.163.com (Hmail) with ESMTPA id 650D58C00A4;
 Thu, 22 Apr 2021 20:59:15 +0800 (CST)
From: Yangtao Li <frank.li@vivo.com>
To: jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Date: Thu, 22 Apr 2021 20:59:10 +0800
Message-Id: <20210422125910.127871-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGU9MGVYaT0pPGE4eH0IdGUNVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hOSFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NRA6KRw4Hz8VSw4cTwkhQhoU
 Ax5PFEtVSlVKTUpCS0JNSE5OQktJVTMWGhIXVR0JGhUQVRcSOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5LVUpMTVVJSUJZV1kIAVlBSU1OSzcG
X-HM-Tid: 0a78f9a9c2f2d9abkuws650d58c00a4
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lZYvU-00ChEt-Mz
Subject: [f2fs-dev] [PATCH] f2fs: set prefree as free segments after clear
 prefree segments
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
Cc: Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

For now, when do_checkpoint fails, the prefree bitmap is not cleared,
but these segments are already in the free state. If these segments
are used, the segments in use will be reset to the free state when
f2fs_clear_prefree_segments is called next time.

So move set_prefree_as_free_segments after clear_prefree_segments.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/segment.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c2866561263e..ea1334e17a0d 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1945,20 +1945,6 @@ void f2fs_release_discard_addrs(struct f2fs_sb_info *sbi)
 		release_discard_addr(entry);
 }
 
-/*
- * Should call f2fs_clear_prefree_segments after checkpoint is done.
- */
-static void set_prefree_as_free_segments(struct f2fs_sb_info *sbi)
-{
-	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
-	unsigned int segno;
-
-	mutex_lock(&dirty_i->seglist_lock);
-	for_each_set_bit(segno, dirty_i->dirty_segmap[PRE], MAIN_SEGS(sbi))
-		__set_test_and_free(sbi, segno, false);
-	mutex_unlock(&dirty_i->seglist_lock);
-}
-
 void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 						struct cp_control *cpc)
 {
@@ -1993,6 +1979,7 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 		for (i = start; i < end; i++) {
 			if (test_and_clear_bit(i, prefree_map))
 				dirty_i->nr_dirty[PRE]--;
+			__set_test_and_free(sbi, i, false);
 		}
 
 		if (!f2fs_realtime_discard_enable(sbi))
@@ -4188,8 +4175,6 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 		cpc->trim_start = trim_start;
 	}
 	up_write(&sit_i->sentry_lock);
-
-	set_prefree_as_free_segments(sbi);
 }
 
 static int build_sit_info(struct f2fs_sb_info *sbi)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
