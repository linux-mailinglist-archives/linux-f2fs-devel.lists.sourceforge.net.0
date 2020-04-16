Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CD81AB7D8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Apr 2020 08:18:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOxqs-0008BX-E3; Thu, 16 Apr 2020 06:18:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1jOxqr-0008BQ-0T
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Apr 2020 06:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z2cB104A3VarQK23oJ8oGoWJI/nVp7NdgHxvhORaQVM=; b=iEWfqlWM0TvYxDHdxqRaSgh4Fz
 25LgQcwAVNB9RZjIiA9B5YKG0lmNvTVcGrPUcJkARZvwKaHXw4jhu/ytaWcpvHB3276dyQqWaKrBL
 26MlQtbgW+DqpIwTVKlDOaB4az7kEOA7yRBM78QM/NwtjJsMyFbwLayqOMAGulcyg9t8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z2cB104A3VarQK23oJ8oGoWJI/nVp7NdgHxvhORaQVM=; b=VRO+nTAoRYIjOMMyeDsMd6HVAT
 nff4G1k81OGPeI9u8lUWZuDjT/mJoLWBZVutEtKRdRkVZmomceDxPvCzKRL3lbTlZAx2LZbuwtpk1
 gTy8nvMeJCwmWGFuogMLnYggFZCHfSxFDyw8C9gZv050WZiaUhm/+4QHnyMaUHa6cEmA=;
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jOxqh-00HTk5-S1
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Apr 2020 06:18:16 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1587017888; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Z2cB104A3VarQK23oJ8oGoWJI/nVp7NdgHxvhORaQVM=;
 b=eolSL/lHE9qdy8BXTdrRf56ULaYivgC4ZX5RVjDqsMY3QWxCC4ltuh9adoTbVxPKBPyakqzg
 yi9w6UFJvNt+FLjwwUpejWavprczUZM/O7UH4u2YEWoRiEDRU96ycwTb807U5nzmUCRzLsd+
 J0l3UjC1eYmtkMj5cnHdkI78IVU=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e97f893.7fed176d2e68-smtp-out-n01;
 Thu, 16 Apr 2020 06:17:55 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BB2ECC433BA; Thu, 16 Apr 2020 06:17:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5BA3BC433F2;
 Thu, 16 Apr 2020 06:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5BA3BC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 16 Apr 2020 11:47:41 +0530
Message-Id: <1587017861-6454-1-git-send-email-stummala@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [104.130.122.27 listed in list.dnswl.org]
X-Headers-End: 1jOxqh-00HTk5-S1
Subject: [f2fs-dev] [PATCH] f2fs: Fix the accounting of dcc->undiscard_blks
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

When a discard_cmd needs to be split due to dpolicy->max_requests, then
for the remaining length it will be either merged into another cmd or a
new discard_cmd will be created. In this case, there is double
accounting of dcc->undiscard_blks for the remaining len, due to which
it shows incorrect value in stats.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
---
 fs/f2fs/segment.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 728ff6e..1c48ec8 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1214,8 +1214,10 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 		len = total_len;
 	}
 
-	if (!err && len)
+	if (!err && len) {
+		dcc->undiscard_blks -= len;
 		__update_discard_tree_range(sbi, bdev, lstart, start, len);
+	}
 	return err;
 }
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
