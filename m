Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C9C27542
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 May 2019 06:44:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hTfaM-0007Hr-HZ; Thu, 23 May 2019 04:44:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stummala@codeaurora.org>) id 1hTfaL-0007Hk-F7
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 04:44:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ccjglLszF9yzNOjTex9ScunebpuUEoyg+cs5efwbbhY=; b=DRtGyNSWH33M5SlS7iI1HVZQrZ
 IvRjusyGnWgZ9mXBjwbEHBbDB3hrbwx9OOJOx5u2AUMeCQ/vUliO80pF51k+UUNs1eMS4322csKXG
 ikgmYWS+ZVmFNpRgmwKxr1xtcTgoUHcvDglinHnEG4A8RreqkNG/Pc7B7uC0MgPmZaUA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ccjglLszF9yzNOjTex9ScunebpuUEoyg+cs5efwbbhY=; b=ZrVv1mbSfp9nNzYIylOibXwRFg
 MnsYBT8NKCKmhVlpF4FSscP9ZoTOZnu9G01pf42qTIKwc/vtG+Kg8vzjImP6d2BYpMBQBJgxC//Wf
 YIdkgVNJtl6wgG8LYv7gCcEtrNn3cC06L3h1/vr78rOp+5KY7Q22oJhjeAY6WL3goqQg=;
Received: from smtp.codeaurora.org ([198.145.29.96])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hTfaF-0089xM-Kj
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 04:44:09 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 291D360591; Thu, 23 May 2019 04:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1558586638;
 bh=hnbx3AX8C2pejL15wUhAHLQkIpyCGqzIO1Vv8xEgIb8=;
 h=From:To:Cc:Subject:Date:From;
 b=JiLs0C4pVjlCJfTDPUHjaQq33G//aucx1Zjq9jFYFXGQ53C7APhWnuhsRNQm9JCDv
 yPEm8HsyEDNA8zifw9ZGWR1oIpGE8nHZ9LZ+ZF2MmAmRyomCbXzAXYUG1vI4LlAsM5
 Wyc5ErccBFid6arxIBJZei5lNBeuHKXdIapyOX1A=
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0B86F60591;
 Thu, 23 May 2019 04:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1558586637;
 bh=hnbx3AX8C2pejL15wUhAHLQkIpyCGqzIO1Vv8xEgIb8=;
 h=From:To:Cc:Subject:Date:From;
 b=GZNgTSU+2neId9PBtVe2N7f7MF22x2q4/wMtRE6nDLi/0JJy6LLvZIq2a5a6witiT
 PPiYFmqQqOuJ4OWrwjQYHhCcQQlUsJG/BMlm2qaO6USI+O5f/GvOd21E2rGSPEoyZt
 VIUYfHKXrBY/4qwSxnCe+VfU3TudoeHQtSjz8920=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0B86F60591
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 23 May 2019 10:13:47 +0530
Message-Id: <1558586627-19784-1-git-send-email-stummala@codeaurora.org>
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
X-Headers-End: 1hTfaF-0089xM-Kj
Subject: [f2fs-dev] [PATCH] fsck.f2fs: Fix up nat journal corruption with -a
 (auto-fix) option
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
 fsck/mount.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index ec22783..46d62ee 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -943,6 +943,8 @@ static int f2fs_init_nid_bitmap(struct f2fs_sb_info *sbi)
 			"NAT_JOURNAL_ENTRIES(%lu)\n",
 			nats_in_cursum(journal), NAT_JOURNAL_ENTRIES);
 		journal->n_nats = cpu_to_le16(NAT_JOURNAL_ENTRIES);
+		c.auto_fix = 0;
+		c.fix_on = 1;
 	}
 
 	for (i = 0; i < nats_in_cursum(journal); i++) {
@@ -2363,19 +2365,6 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
 
 	print_ckpt_info(sbi);
 
-	if (c.auto_fix || c.preen_mode) {
-		u32 flag = get_cp(ckpt_flags);
-
-		if (flag & CP_FSCK_FLAG ||
-			(exist_qf_ino(sb) && (!(flag & CP_UMOUNT_FLAG) ||
-						flag & CP_ERROR_FLAG))) {
-			c.fix_on = 1;
-		} else if (!c.preen_mode) {
-			print_cp_state(flag);
-			return 1;
-		}
-	}
-
 	c.bug_on = 0;
 	c.feature = sb->feature;
 
@@ -2400,6 +2389,19 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
 		return -1;
 	}
 
+	if (c.auto_fix || c.preen_mode) {
+		u32 flag = get_cp(ckpt_flags);
+
+		if (flag & CP_FSCK_FLAG ||
+			(exist_qf_ino(sb) && (!(flag & CP_UMOUNT_FLAG) ||
+						flag & CP_ERROR_FLAG))) {
+			c.fix_on = 1;
+		} else if (!c.preen_mode) {
+			print_cp_state(flag);
+			return 1;
+		}
+	}
+
 	/* Check nat_bits */
 	if (c.func != DUMP && is_set_ckpt_flags(cp, CP_NAT_BITS_FLAG)) {
 		u_int32_t nat_bits_bytes, nat_bits_blocks;
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
