Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEFE3DBEBF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Jul 2021 21:09:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m9Xsy-00080s-AH; Fri, 30 Jul 2021 19:09:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1m9Xsm-00080X-Sv
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Jul 2021 19:09:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ibZIgIehqEN/SPXOKoquoiRsI2KpGmXiLdZkpl8MuEM=; b=jg/P+nllyk1o8+pt1NVdEENm8r
 NGkHlEAQJRs2zuTo0AOq5WDT8275buE+F82Vim5hUQTtmbgyyp81cXZiBHMUITH9KL5W4QmsVDUAB
 +eG1g4SBc5Uv2HOSZKIHZB3NtCt7Jrmqi0QO/gKw+kUIsJWc/aV2ywTjXgnrdJ4Y380g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ibZIgIehqEN/SPXOKoquoiRsI2KpGmXiLdZkpl8MuEM=; b=U
 dACvzDLWDOTZWyiOZkgJz/miEO4PgI+BUwblx1oNEQpUIRcxV93JuqlgWArTxAYT5j5h1K0ZC3Q0U
 oMDtGnYL0Z0ks64hiporQEdRqtckuZSRZNlZm14dd74+zBeW3Nun0RWhV0+e43GROSSkvX6MMCxZm
 93wUyz5c95PCCCuY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m9Xsl-00051W-5f
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Jul 2021 19:09:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F30A360F00;
 Fri, 30 Jul 2021 19:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627672152;
 bh=00uKcfkCA0b/QBJBHFd/NCx0VSTJMUeiq41umtW8K/o=;
 h=From:To:Cc:Subject:Date:From;
 b=tgKBp5fC17GSQ9dnb6fsykoMRDRPkNPxQTRdLSmyvpP8lRnOSwTXiMP1ScyMpVPd3
 q+QQ/4/Te76EHAG/7DWuwPCCI+8Wwm1ykpVd8WprTuR0FJwYULb6DXaEz1lok9KcOd
 hXXMbwwyTH5B9WjOE1M+BzBhO4Pylz57h0ajj01Lpz1xEatNvw9arBq/8xeJifrbQu
 HeMy59T7kSH8HuLIyWAG0zip7dD+AAnwm/vn+2Vpey4XYhZBpjdFO0xC2bKTrnS80y
 PpF6mkC62NXr+0+EHZlBbd4lF8Yq765l5EEv6vT0oBrFTuHw77IKsuYXrG+BhjA0fj
 aNPbfbJdeRDSA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 30 Jul 2021 12:09:07 -0700
Message-Id: <20210730190907.2072122-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m9Xsl-00051W-5f
Subject: [f2fs-dev] [PATCH] f2fs: show sbi status in debugfs/f2f/sstatus
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We need to get sbi->s_flag to understand the current f2fs status as well.
One example is SBI_NEED_FSCK.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/debug.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 53ed1e9191f0..473ad04d1891 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -333,11 +333,12 @@ static int stat_show(struct seq_file *s, void *v)
 	list_for_each_entry(si, &f2fs_stat_list, stat_list) {
 		update_general_status(si->sbi);
 
-		seq_printf(s, "\n=====[ partition info(%pg). #%d, %s, CP: %s]=====\n",
+		seq_printf(s, "\n=====[ partition info(%pg). #%d, %s, CP: %s (sbi: 0x%lx)]=====\n",
 			si->sbi->sb->s_bdev, i++,
 			f2fs_readonly(si->sbi->sb) ? "RO": "RW",
 			is_set_ckpt_flags(si->sbi, CP_DISABLED_FLAG) ?
-			"Disabled": (f2fs_cp_error(si->sbi) ? "Error": "Good"));
+			"Disabled": (f2fs_cp_error(si->sbi) ? "Error": "Good"),
+			si->sbi->s_flag);
 		seq_printf(s, "[SB: 1] [CP: 2] [SIT: %d] [NAT: %d] ",
 			   si->sit_area_segs, si->nat_area_segs);
 		seq_printf(s, "[SSA: %d] [MAIN: %d",
-- 
2.32.0.554.ge1b32706d8-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
