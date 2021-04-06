Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D968E354F98
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Apr 2021 11:10:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lThiw-0006oM-2p; Tue, 06 Apr 2021 09:10:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1lThit-0006oE-VH
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Apr 2021 09:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F4jdbffDeZDNKhypu4nbWbPE4bfUYUk0a5UryZXysDE=; b=GKhujzq2hMIXl73JSvzd3BRDIL
 rRlK6Cnuu37ZoFrIXOyAwhmdTbPKFGhljPEmroUYEsBfX64Tc7fPg4vAnQtq+NW/kkWjqyuzYVv93
 tfdDbcMnluYKN0Nb/t0k42qxIUHdHlZII57AUgd+IWI6uv1M/hCbKRaDL3/WWpGOCIGQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F4jdbffDeZDNKhypu4nbWbPE4bfUYUk0a5UryZXysDE=; b=L55fvA8G8LSTtwBBOnZ9XVIsGx
 S457AxDur+cl2qTt3+MqOj3nNCrQKXGKlJDrTzG/ooNbjIWW2ONCzlxCspfmS3UNu5Xa7kA2CytWH
 P2Zco+5u4htXmtQBVT3m6WjRzBEGAG6ryZsxDYZBKS7qYFSM3/QYlJANBkF1STDTMVYg=;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lThic-0001sp-6j
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 06 Apr 2021 09:10:11 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617700195; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=F4jdbffDeZDNKhypu4nbWbPE4bfUYUk0a5UryZXysDE=;
 b=eREwx27vAvm4FeW5ktAieoZln26KlHFTrKfYwM7a/hDIwc/jNNUFdozB6+f7Y6b+ckUdxVs5
 obtMP2IMTO54oJamE4lzQ4AYoVFtZ8rxlDrL/qDHa+llguSYEtr6HqqmFDP15QjtXNJov7Mt
 5d1bPqOdpRwClWud4qgE2D5U4g0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 606c254cc06dd10a2d3fbe2a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 06 Apr 2021 09:09:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9C726C43461; Tue,  6 Apr 2021 09:09:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 44B04C43463;
 Tue,  6 Apr 2021 09:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 44B04C43463
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  6 Apr 2021 14:39:16 +0530
Message-Id: <1617700156-19719-1-git-send-email-stummala@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <20210316093406.GC8562@codeaurora.org>
References: <20210316093406.GC8562@codeaurora.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [69.72.43.7 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [69.72.43.7 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lThic-0001sp-6j
Subject: [f2fs-dev] [PATCH v2] f2fs: fix the periodic wakeups of discard
 thread
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

Fix the unnecessary periodic wakeups of discard thread that happens under
below two conditions -

1. When f2fs is heavily utilized over 80%, the current discard policy
sets the max sleep timeout of discard thread as 50ms
(DEF_MIN_DISCARD_ISSUE_TIME). But this is set even when there are
no pending discard commands to be issued.

2. In the issue_discard_thread() path when there are no pending discard
commands, it fails to reset the wait_ms to max timeout value.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
---
v2:
- Fix the second scenario mentioned above in commit text

 fs/f2fs/segment.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index d7076796..59efec5 100644
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
@@ -1131,7 +1133,9 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
 		dpolicy->ordered = true;
 		if (utilization(sbi) > DEF_DISCARD_URGENT_UTIL) {
 			dpolicy->granularity = 1;
-			dpolicy->max_interval = DEF_MIN_DISCARD_ISSUE_TIME;
+			if (atomic_read(&dcc->discard_cmd_cnt))
+				dpolicy->max_interval =
+					DEF_MIN_DISCARD_ISSUE_TIME;
 		}
 	} else if (discard_type == DPOLICY_FORCE) {
 		dpolicy->min_interval = DEF_MIN_DISCARD_ISSUE_TIME;
@@ -1747,8 +1751,15 @@ static int issue_discard_thread(void *data)
 	set_freezable();
 
 	do {
-		__init_discard_policy(sbi, &dpolicy, DPOLICY_BG,
-					dcc->discard_granularity);
+		if (sbi->gc_mode == GC_URGENT_HIGH ||
+			!f2fs_available_free_memory(sbi, DISCARD_CACHE))
+			__init_discard_policy(sbi, &dpolicy, DPOLICY_FORCE, 1);
+		else
+			__init_discard_policy(sbi, &dpolicy, DPOLICY_BG,
+						dcc->discard_granularity);
+
+		if (!atomic_read(&dcc->discard_cmd_cnt))
+		       wait_ms = dpolicy.max_interval;
 
 		wait_event_interruptible_timeout(*q,
 				kthread_should_stop() || freezing(current) ||
@@ -1775,10 +1786,6 @@ static int issue_discard_thread(void *data)
 		if (!atomic_read(&dcc->discard_cmd_cnt))
 			continue;
 
-		if (sbi->gc_mode == GC_URGENT_HIGH ||
-			!f2fs_available_free_memory(sbi, DISCARD_CACHE))
-			__init_discard_policy(sbi, &dpolicy, DPOLICY_FORCE, 1);
-
 		sb_start_intwrite(sbi->sb);
 
 		issued = __issue_discard_cmd(sbi, &dpolicy);
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
