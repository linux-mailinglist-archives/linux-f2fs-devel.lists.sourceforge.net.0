Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0008B24D2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Apr 2024 17:15:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s00of-0003se-1N;
	Thu, 25 Apr 2024 15:15:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhaoyifan@sjtu.edu.cn>) id 1s00od-0003sY-M7
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Apr 2024 15:15:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/Nl3JOPVeBdfmD2v9lCk6sV034nFP8z6mhsfuVwoaAM=; b=ZMK0nZHtOvVbNNAEAulSOsZFKD
 hCZpe3bgGRkQTrQkgZzIGx7yuYG03QOcxkIwKHLH5zIOtYkabqeINqSsEsHJMAHA/M9Kkmq+Qo5Pr
 oe11wblv9it9UujU0QDNnLp4EemlTXGP+Vukz9sIumHOCAMG0FbVhoDugQSnY653AjPw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/Nl3JOPVeBdfmD2v9lCk6sV034nFP8z6mhsfuVwoaAM=; b=h
 6SuGyvctm0alWbhmSc3FoQUAxEa4J5pdYA56z3gd+27ueWZ4+JRKDGLgjCEpBj8ERm7vyzrU0BetX
 aCdjrgebiKtTRwXeMrfFftm2sbQR8Zckv9axNZGJTMDyKuhGOCfqbVbvpK/30G2fcrxno7657VvDv
 ffcICEZSIH+QvVuE=;
Received: from smtp232.sjtu.edu.cn ([202.120.2.232])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s00oa-0002Jb-Tm for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Apr 2024 15:15:15 +0000
Received: from proxy188.sjtu.edu.cn (smtp188.sjtu.edu.cn [202.120.2.188])
 by smtp232.sjtu.edu.cn (Postfix) with ESMTPS id 05E30100460AA;
 Thu, 25 Apr 2024 22:55:57 +0800 (CST)
Received: from zhaoyf.ipads-lab.se.sjtu.edu.cn (unknown [202.120.40.82])
 by proxy188.sjtu.edu.cn (Postfix) with ESMTPSA id D655C380D11;
 Thu, 25 Apr 2024 22:55:52 +0800 (CST)
From: Yifan Zhao <zhaoyifan@sjtu.edu.cn>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 25 Apr 2024 22:55:28 +0800
Message-ID: <20240425145528.2925372-1-zhaoyifan@sjtu.edu.cn>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Spam-Score: -3.5 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  is_next_segment_free() takes a redundant `type` parameter.
 Remove it. Signed-off-by: Yifan Zhao <zhaoyifan@sjtu.edu.cn> ---
 fs/f2fs/segment.c
 | 5 ++--- 1 file changed, 2 insertions(+), 3 deletions(-) 
 Content analysis details:   (-3.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [202.120.2.232 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.5 RCVD_IN_SORBS_WEB      RBL: SORBS: sender is an abusable web server
 [202.120.40.82 listed in dnsbl.sorbs.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1s00oa-0002Jb-Tm
Subject: [f2fs-dev] [PATCH] f2fs: remove redundant parameter in
 is_next_segment_free()
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
Cc: Yifan Zhao <zhaoyifan@sjtu.edu.cn>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

is_next_segment_free() takes a redundant `type` parameter. Remove it.

Signed-off-by: Yifan Zhao <zhaoyifan@sjtu.edu.cn>
---
 fs/f2fs/segment.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 2206199e8099..8d63ddfe4a77 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2645,7 +2645,7 @@ static void write_current_sum_page(struct f2fs_sb_info *sbi,
 }
 
 static int is_next_segment_free(struct f2fs_sb_info *sbi,
-				struct curseg_info *curseg, int type)
+				struct curseg_info *curseg)
 {
 	unsigned int segno = curseg->segno + 1;
 	struct free_segmap_info *free_i = FREE_I(sbi);
@@ -3073,8 +3073,7 @@ static bool need_new_seg(struct f2fs_sb_info *sbi, int type)
 	if (!is_set_ckpt_flags(sbi, CP_CRC_RECOVERY_FLAG) &&
 	    curseg->seg_type == CURSEG_WARM_NODE)
 		return true;
-	if (curseg->alloc_type == LFS &&
-	    is_next_segment_free(sbi, curseg, type) &&
+	if (curseg->alloc_type == LFS && is_next_segment_free(sbi, curseg) &&
 	    likely(!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
 		return true;
 	if (!f2fs_need_SSR(sbi) || !get_ssr_segment(sbi, type, SSR, 0))
-- 
2.44.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
