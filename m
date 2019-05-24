Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 645A3290C6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 May 2019 08:10:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hU3PA-0001Y8-Mf; Fri, 24 May 2019 06:10:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stummala@codeaurora.org>) id 1hU3P9-0001Y1-BR
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 06:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yx2Db9wDB/5SVafvOJKuT97Jw4mtiv4v5QTA7Ii/qfc=; b=XFTt39C9fEyn8JnImgMXxqW1F9
 XVwk9VrCCxUxZUoLynhNLgf3Lz3Jprpoel+zoG2Phrd+L/STg3fJNGl3lP57o2F9kqJKFFtiZ1dlU
 NsEyS370GrrqzKXIO3BFLz7fFmduVyMMtiVElbr8CYWUW+5hYcLH+mPERJDy/2CC1aIw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yx2Db9wDB/5SVafvOJKuT97Jw4mtiv4v5QTA7Ii/qfc=; b=f3/4CkPdiREJK31KEiQkTKNMSw
 BXjKTaKElqMVgo89wPb1nDU42QtfXyNdS1hx/IKMniy+AKYYLlWwu7ZbQO15F+QoNqGe0gVFVTwzC
 ffb8IxsgYEI0cO8GtFdh9mXcc3y2YQXW+SDNZ390LMWNMSjbKGi3Yj9pwNlpVsJbtCiA=;
Received: from smtp.codeaurora.org ([198.145.29.96])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hU3P6-00CLnC-T0
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 06:10:11 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 4196160716; Fri, 24 May 2019 06:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1558678203;
 bh=bcFRdlNs8Xs80EY7zjGOlQQiKAPwEDUhjoomjelDCHE=;
 h=From:To:Cc:Subject:Date:From;
 b=gpPp4jtelJOETS5mfp99pu1rPukzdhpIjAdUOeZSvYcCLK0kCaUywvxcaLH4xjLuW
 1g5Vk7TyvLh9kEjOtnIACa2C97DdRDaH61xK6bUf70wwo8sPS+B4LobocZaZuKfPBw
 p/x+c7anxcyjXCgMHZ54Hbz642BUGstQDcTKOg6I=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: stummala@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 052CF6063A;
 Fri, 24 May 2019 06:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1558678202;
 bh=bcFRdlNs8Xs80EY7zjGOlQQiKAPwEDUhjoomjelDCHE=;
 h=From:To:Cc:Subject:Date:From;
 b=bfVH8ndyixLKfZTaw67fePq66XTi/gV4X6rudGtWPgJfQYrujKdg5iVxMSTsQk9+p
 50HYL+QR+3Uquyjs0YnshoGHfOa2/9+XBjK8ySRvGi/deEVWxdOhtPzhdNuUbw8w7t
 Z6rPniiCPzyhutBS9JJxr9UVM6frkqwLcnt8VurU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 052CF6063A
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 24 May 2019 11:39:47 +0530
Message-Id: <1558678187-13145-1-git-send-email-stummala@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hU3P6-00CLnC-T0
Subject: [f2fs-dev] [PATCH v2] fsck.f2fs: Fix up nat journal corruption with
 -a (auto-fix) option
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Build segment manager and node manager always to catch and auto-fix
invalid NAT entries found in the NAT journal.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
---
v2:
 - cover all error paths in f2fs_init_nid_bitmap()

 fsck/mount.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index aa64e93..784003c 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1071,6 +1071,7 @@ static int f2fs_init_nid_bitmap(struct f2fs_sb_info *sbi)
 			"NAT_JOURNAL_ENTRIES(%lu)\n",
 			nats_in_cursum(journal), NAT_JOURNAL_ENTRIES);
 		journal->n_nats = cpu_to_le16(NAT_JOURNAL_ENTRIES);
+		c.fix_on = 1;
 	}
 
 	for (i = 0; i < nats_in_cursum(journal); i++) {
@@ -1080,6 +1081,7 @@ static int f2fs_init_nid_bitmap(struct f2fs_sb_info *sbi)
 		if (!IS_VALID_BLK_ADDR(sbi, addr)) {
 			MSG(0, "\tError: f2fs_init_nid_bitmap: addr(%u) is invalid!!!\n", addr);
 			journal->n_nats = cpu_to_le16(i);
+			c.fix_on = 1;
 			continue;
 		}
 
@@ -1087,6 +1089,7 @@ static int f2fs_init_nid_bitmap(struct f2fs_sb_info *sbi)
 		if (!IS_VALID_NID(sbi, nid)) {
 			MSG(0, "\tError: f2fs_init_nid_bitmap: nid(%u) is invalid!!!\n", nid);
 			journal->n_nats = cpu_to_le16(i);
+			c.fix_on = 1;
 			continue;
 		}
 		if (addr != NULL_ADDR)
@@ -2632,19 +2635,6 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
 			c.fix_on = 1;
 	}
 
-	if (c.auto_fix || c.preen_mode) {
-		u32 flag = get_cp(ckpt_flags);
-
-		if (flag & CP_FSCK_FLAG ||
-			flag & CP_QUOTA_NEED_FSCK_FLAG ||
-			(exist_qf_ino(sb) && (flag & CP_ERROR_FLAG))) {
-			c.fix_on = 1;
-		} else if (!c.preen_mode) {
-			print_cp_state(flag);
-			return 1;
-		}
-	}
-
 	c.bug_on = 0;
 
 	tune_sb_features(sbi);
@@ -2670,6 +2660,19 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
 		return -1;
 	}
 
+	if (!c.fix_on && (c.auto_fix || c.preen_mode)) {
+		u32 flag = get_cp(ckpt_flags);
+
+		if (flag & CP_FSCK_FLAG ||
+			flag & CP_QUOTA_NEED_FSCK_FLAG ||
+			(exist_qf_ino(sb) && (flag & CP_ERROR_FLAG))) {
+			c.fix_on = 1;
+		} else if (!c.preen_mode) {
+			print_cp_state(flag);
+			return 1;
+		}
+	}
+
 	/* Check nat_bits */
 	if (c.func == FSCK && is_set_ckpt_flags(cp, CP_NAT_BITS_FLAG)) {
 		if (check_nat_bits(sbi, sb, cp) && c.fix_on)
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
