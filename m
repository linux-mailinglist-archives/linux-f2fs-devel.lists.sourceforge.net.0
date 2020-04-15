Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACB31A9194
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 05:31:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOYm3-0003Vs-MJ; Wed, 15 Apr 2020 03:31:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1jOYm2-0003Va-La
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 03:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MKy8Tu7gkaN05KHcqWvWLn00l3sUgPhsFIeSFjRZ1ZY=; b=KWO+pI6flGULLcP4LOKdSiGMCh
 qYlfDKVd+/LBmwg4MXIIgR9uCBK++3l8kYWqbjdv8Q0CfCTQHkq4U672RWXGuWSoanHuIla2JkWPO
 4IxyuI2BXnbg+8BXjsbw8PGnmxqAB6PXGbiLs/LY0klCIOUU9pJFn6NsdBkX3hX22vMQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MKy8Tu7gkaN05KHcqWvWLn00l3sUgPhsFIeSFjRZ1ZY=; b=Uruz+GKowpch9dNDKE7aEP1DxN
 zQpxh//7flZTzKj360aFqASJ5FzUzUdBEuxvhVQIFuUS4qmlnegvb2Q1zVJ6gwgGNmWLVP+yh2pcS
 BXnXurXD/OIRU4fAPvVJdx420cm20sRe7hA9D34j5k7y06MX5vtwDQ0nyy27ThR7FTr8=;
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jOYlz-00Goe0-D2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 03:31:38 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1586921497; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=MKy8Tu7gkaN05KHcqWvWLn00l3sUgPhsFIeSFjRZ1ZY=;
 b=BERMl4Zj2WUAxEz3GE8HOecYyQHlIDA3OiXGVmuLjOWXmd1CDg6geKcC2iF71BDK6qWJuErq
 E8n+1DnVsgBelOyLz7/FKHzOkuBu+NHxvc5XjLyt7tyGCnXyTw7dODLqv1QIyocSiHMBFw+r
 0qVIgyX6SdhCWdFqUV3UmjLtpng=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e968008.7f04e62506c0-smtp-out-n02;
 Wed, 15 Apr 2020 03:31:20 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AF4D8C432C2; Wed, 15 Apr 2020 03:31:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F2789C433F2;
 Wed, 15 Apr 2020 03:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F2789C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 15 Apr 2020 09:01:02 +0530
Message-Id: <1586921462-12972-1-git-send-email-stummala@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [104.130.122.27 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jOYlz-00Goe0-D2
Subject: [f2fs-dev] [PATCH v4] f2fs: fix long latency due to discard during
 umount
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

F2FS already has a default timeout of 5 secs for discards that
can be issued during umount, but it can take more than the 5 sec
timeout if the underlying UFS device queue is already full and there
are no more available free tags to be used. Fix this by submitting a
small batch of discard requests so that it won't cause the device
queue to be full at any time and thus doesn't incur its wait time
in the umount context.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
---
v4:
-Implement as per Jaegeuk's Suggestion to control the number of
outstanding discard requests.

 fs/f2fs/segment.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 1a62b27..764bab5 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1099,7 +1099,6 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
 	} else if (discard_type == DPOLICY_FSTRIM) {
 		dpolicy->io_aware = false;
 	} else if (discard_type == DPOLICY_UMOUNT) {
-		dpolicy->max_requests = UINT_MAX;
 		dpolicy->io_aware = false;
 		/* we need to issue all to keep CP_TRIMMED_FLAG */
 		dpolicy->granularity = 1;
@@ -1470,12 +1469,14 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
 	struct list_head *pend_list;
 	struct discard_cmd *dc, *tmp;
 	struct blk_plug plug;
-	int i, issued = 0;
+	int i, issued;
 	bool io_interrupted = false;
 
 	if (dpolicy->timeout != 0)
 		f2fs_update_time(sbi, dpolicy->timeout);
 
+retry:
+	issued = 0;
 	for (i = MAX_PLIST_NUM - 1; i >= 0; i--) {
 		if (dpolicy->timeout != 0 &&
 				f2fs_time_over(sbi, dpolicy->timeout))
@@ -1522,6 +1523,11 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
 			break;
 	}
 
+	if (dpolicy->type == DPOLICY_UMOUNT && issued) {
+		__wait_all_discard_cmd(sbi, dpolicy);
+		goto retry;
+	}
+
 	if (!issued && io_interrupted)
 		issued = -1;
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
