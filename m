Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE0033AA99
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Mar 2021 05:57:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lLfHs-0007BC-Qt; Mon, 15 Mar 2021 04:57:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1lLfHr-0007B0-QB
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Mar 2021 04:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VPQLi2OI4TfV8yqp40xNH75AHkUMN4RCTBTNwk+/Bsg=; b=mc1txjxdjhtys0MDbRApupNz4b
 U1NRnLA2898yu48t7cEtlLnPWzWT96KodlJC+6631KT7EU9rrQHxYVlpMVQ0qBe+tebydF9F30A/5
 3bf6nRAnXAGLgpT61B7I7FoL9cYyohibN5aPGZ4mT2/BaWZEqgowGwj40e6mAFuasZ04=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VPQLi2OI4TfV8yqp40xNH75AHkUMN4RCTBTNwk+/Bsg=; b=Ni9ZUKY8t5zCEu3v+w0nZAKlGp
 rFC+/gZ71bjYyRV4gVgWfY4CXJj4ysPrX5YvX6pg60HQ53JtszxI8zbF3BZNgW/UKAL6LR93oj7QG
 +PBv2Vp0NFnFv1xrhebetUejicYAWMVMYiHJMnBOmBytdEbGFZBQ1RWgT4nO+/qGjtaE=;
Received: from z11.mailgun.us ([104.130.96.11])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lLfHh-0002J2-Pf
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Mar 2021 04:57:03 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1615784213; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=VPQLi2OI4TfV8yqp40xNH75AHkUMN4RCTBTNwk+/Bsg=;
 b=pJXQPyqJYoKE2S92Jv0fAJjjWWzcSVSPy8OMaS4gUicsr+u9ejLpAIqdRhggk+7IvPUMCL1G
 mQpHzsSZ/lh+lOjRW7MBe7/42ixUdT8OMpxsW/Dl6u0NaJA+dfMyYIUwtxjf8r7vuM7l3Tpq
 jPLUsnwV6PZk9p43oXFHHzjsr9M=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 604ee9053f267701a4026f34 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Mar 2021 04:56:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B2688C43462; Mon, 15 Mar 2021 04:56:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 30629C433C6;
 Mon, 15 Mar 2021 04:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 30629C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 15 Mar 2021 10:26:26 +0530
Message-Id: <1615784186-2693-1-git-send-email-stummala@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lLfHh-0002J2-Pf
Subject: [f2fs-dev] [PATCH] f2fs: fix the discard thread sleep timeout under
 high utilization
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

When f2fs is heavily utilized over 80%, the current discard policy
sets the max sleep timeout of discard thread as 50ms
(DEF_MIN_DISCARD_ISSUE_TIME). But this is set even when there are
no pending discard commands to be issued. This results into
unnecessary frequent and periodic wake ups of the discard thread.
This patch adds check for pending  discard commands in addition
to heavy utilization condition to prevent those wake ups.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
---
 fs/f2fs/segment.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index dced46c..df30220 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1112,6 +1112,8 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
 				struct discard_policy *dpolicy,
 				int discard_type, unsigned int granularity)
 {
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+
 	/* common policy */
 	dpolicy->type = discard_type;
 	dpolicy->sync = true;
@@ -1129,7 +1131,8 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
 		dpolicy->io_aware = true;
 		dpolicy->sync = false;
 		dpolicy->ordered = true;
-		if (utilization(sbi) > DEF_DISCARD_URGENT_UTIL) {
+		if (utilization(sbi) > DEF_DISCARD_URGENT_UTIL &&
+				atomic_read(&dcc->discard_cmd_cnt)) {
 			dpolicy->granularity = 1;
 			dpolicy->max_interval = DEF_MIN_DISCARD_ISSUE_TIME;
 		}
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
