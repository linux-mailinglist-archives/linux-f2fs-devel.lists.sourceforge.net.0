Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2875C9EC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Jul 2019 09:25:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hiD9h-0000Ch-Ha; Tue, 02 Jul 2019 07:24:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sunqiuyang@huawei.com>) id 1hiD9g-0000CG-1d
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Jul 2019 07:24:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZQkDXAF33gP41qnnki4SU+EBEVJm6QBldIA699CBSfI=; b=Zs0F0aKtno4GbjsAL0QeVcc0dn
 5x0lY9hnVJY0z5QmcUt/KU4UKFA2R4wK/1mcg2X/ph/oMAMqqjwPjJyOeQu08V+9432kR6TiYSC0a
 25s11cWY7DJ+ZgUN3ol/jlsazu8Y0vQIu8RWClve6jjcfbVt3HHnCNfWdY3g+LBHDY94=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZQkDXAF33gP41qnnki4SU+EBEVJm6QBldIA699CBSfI=; b=g
 RWqElR18tYvE3Ug5dGDETffFQscWWnmCbDiNMPcarLOHY3rTBvOvKgYoH2x9oipj8dwOsVru5x1dl
 JAa/aqEApPVnueBjG6VxnNTRf1LpHdaxWFOHoR+xpoS2g7c3zZ+sZ+KTEiiXyAQtE5yA47QnbPt8r
 qQ9v/RTm+YPSar6I=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hiD9r-004Gqi-BU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Jul 2019 07:24:59 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 3A659E68C5E0B147C43E;
 Tue,  2 Jul 2019 15:24:46 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Tue, 2 Jul 2019
 15:24:40 +0800
From: sunqiuyang <sunqiuyang@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>, <jaegeuk@kernel.org>,
 <yuchao0@huawei.com>
Date: Tue, 2 Jul 2019 15:42:01 +0800
Message-ID: <20190702074201.34869-1-sunqiuyang@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
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
X-Headers-End: 1hiD9r-004Gqi-BU
Subject: [f2fs-dev] [PATCH 1/1] fsck.f2fs: allow to fix inconsistency from
 online resize
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
Cc: fangwei1@huawei.com, sunqiuyang@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Qiuyang Sun <sunqiuyang@huawei.com>

During F2FS online resize, if panic or poweroff happens when the new SB
has been committed but not the new CP, the FS may end up with an
inconsistent state, where user_block_count and free_segment_count in CP 
can be larger than allowed by the new SB.

This patch allows fsck.f2fs to fix such inconsistency.

Signed-off-by: Qiuyang Sun <sunqiuyang@huawei.com>
---
 fsck/fsck.c  | 2 ++
 fsck/mount.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 6f0f262..66eb53c 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2083,6 +2083,8 @@ static void fix_checkpoint(struct f2fs_sb_info *sbi)
 	set_cp(valid_block_count, fsck->chk.valid_blk_cnt);
 	set_cp(valid_node_count, fsck->chk.valid_node_cnt);
 	set_cp(valid_inode_count, fsck->chk.valid_inode_cnt);
+	set_cp(user_block_count, (uint64_t)(get_sb(segment_count_main) -
+			get_cp(overprov_segment_count)) * c.blks_per_seg);
 
 	crc = f2fs_checkpoint_chksum(cp);
 	*((__le32 *)((unsigned char *)cp + get_cp(checksum_offset))) =
diff --git a/fsck/mount.c b/fsck/mount.c
index aecd0cd..81ab660 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -953,7 +953,7 @@ int sanity_check_ckpt(struct f2fs_sb_info *sbi)
 	segment_count_main = get_sb(segment_count_main);
 	log_blocks_per_seg = get_sb(log_blocks_per_seg);
 	if (!user_block_count || user_block_count >=
-			segment_count_main << log_blocks_per_seg) {
+			c.total_sectors / c.sectors_per_blk) {
 		MSG(0, "\tWrong user_block_count(%u)\n", user_block_count);
 		return 1;
 	}
-- 
1.8.3.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
