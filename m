Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E12C27538
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 May 2019 06:36:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hTfSW-0003t2-K8; Thu, 23 May 2019 04:36:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stummala@codeaurora.org>) id 1hTfSV-0003sn-4F
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 04:36:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YPatqqcHpTqeUaoYijKsz+5lMpuv87ry0xwT2u6xeqM=; b=CRGGWwch3NkHgFsJsOTLRWi5Df
 ZqxQptAGwIitpYWb5KDd0x//+bcImhv9H7K/fuoPcW4yckS+yV7e5Y5/tAcgRc6FknVQB0CXuFCBL
 P/7Qe/oI/O8562V8A6y1RaMxLoLtv15LfYdqqCyRNFcYxZdCseE70s0xo05nwqg3i+QA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YPatqqcHpTqeUaoYijKsz+5lMpuv87ry0xwT2u6xeqM=; b=GRc/Abb7k4ThISKcMy2LWaE0zP
 PNjxZxdCOoDK8CQb1ToFcMcPR7S7X+JLAwaC1D6NlqJZfUPuu63+VyC7TYqB+S01gZFqWpyEqYgSt
 Q/Ta1+vmjd/28lmCfXzF/YLoulV5757wawi3lZogbq9euPD7awbZRpGAuOvOj6LwN+ig=;
Received: from smtp.codeaurora.org ([198.145.29.96])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hTfSQ-001Lk4-UT
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 04:36:03 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 0198C600C1; Thu, 23 May 2019 04:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1558585196;
 bh=fcgjdJ/PJA3qLLQdtDzwInWMZt4bLcUj3OyOsUB08Sc=;
 h=From:To:Cc:Subject:Date:From;
 b=PpC3lN8BDTY+iUn2gZfoMDqpZAXxrahmq7Q7FmmeQnn3wCocxqiiA0zAz5s3L5ncD
 NlXBJuDbMgWQRsyPXVQF1uFVmhJr0TfFiqsfrcyWaO3TaTqMC0VX21gTkTomXGwdYi
 54zt2GqjVZ8f/BgUXlg8xSoZoA21vK7Z/7OzjWqQ=
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9DF656030E;
 Thu, 23 May 2019 04:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1558585195;
 bh=fcgjdJ/PJA3qLLQdtDzwInWMZt4bLcUj3OyOsUB08Sc=;
 h=From:To:Cc:Subject:Date:From;
 b=HpUEeHGTGyVc3ys5xm/2+psHewPGfZYJp3grZUcmAKFX3YEx4k1DLFHGtQ10m+MsP
 yc1iierAqa+6FvyeIJ9Rw8dakWGTS5heqtRLDYwPA0GlbW1eLbc/oUMRzm7fSazAEO
 YPAMNYQr8ai0O7fWkDxXl5HxqofkEyRBMBbYqj3g=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9DF656030E
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 23 May 2019 09:49:17 +0530
Message-Id: <1558585157-9349-1-git-send-email-stummala@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
X-Headers-End: 1hTfSQ-001Lk4-UT
Subject: [f2fs-dev] [PATCH] f2fs: add error prints for debugging mount
 failure
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
Cc: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Add error prints to get more details on the mount failure.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
---
 fs/f2fs/segment.c | 6 +++++-
 fs/f2fs/super.c   | 4 ++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 4896443..bdc6956 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3567,8 +3567,12 @@ static int restore_curseg_summaries(struct f2fs_sb_info *sbi)
 
 	/* sanity check for summary blocks */
 	if (nats_in_cursum(nat_j) > NAT_JOURNAL_ENTRIES ||
-			sits_in_cursum(sit_j) > SIT_JOURNAL_ENTRIES)
+			sits_in_cursum(sit_j) > SIT_JOURNAL_ENTRIES) {
+		f2fs_msg(sbi->sb, KERN_ERR,
+			"invalid journal entries nats %u sits %u\n",
+			nats_in_cursum(nat_j), sits_in_cursum(sit_j));
 		return -EINVAL;
+	}
 
 	return 0;
 }
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 52f1497..2c9d4f7 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3413,13 +3413,13 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	err = f2fs_build_segment_manager(sbi);
 	if (err) {
 		f2fs_msg(sb, KERN_ERR,
-			"Failed to initialize F2FS segment manager");
+			"Failed to initialize F2FS segment manager (%d)", err);
 		goto free_sm;
 	}
 	err = f2fs_build_node_manager(sbi);
 	if (err) {
 		f2fs_msg(sb, KERN_ERR,
-			"Failed to initialize F2FS node manager");
+			"Failed to initialize F2FS node manager (%d)", err);
 		goto free_nm;
 	}
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
