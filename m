Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 363881A97F8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 11:08:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOe1q-0001w5-RX; Wed, 15 Apr 2020 09:08:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1jOe1p-0001vw-4l
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 09:08:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zS4c6L0D9jU2WBM14Jk1In+hYKeTXj+XmH473wOiYXQ=; b=jf5c7psoKiX3l1hO52ylJDcwm1
 oD63MBsWiOuwqbrikO0dHdXuPqdHmrXyExBNtY9umxP2MDi2PCGA/FGr83PssBYCBvpDYs8zCJO+C
 2+t870OAt+2Kkg/TKgURD1k9vIzZlaosnp9JFzKnvp8hksxlv+DPmhO8rnUCEwI7vzJk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zS4c6L0D9jU2WBM14Jk1In+hYKeTXj+XmH473wOiYXQ=; b=MsJvIdYoyxk66GIyWWNQHUSjWR
 Mc+dRAjdg2wS5ifsNtNH4S+FNxg261ubmOf4H6EHQ3s/WsXJm+DQ5mNyWkTLILcxmYTpMf7o+VcMg
 3pyN04j9uIA0oICxOZOBgmAC1yHrn1qYxiEYWX5OLat/AHJUTLcaNcr3Lll4ONqtbazo=;
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jOe1k-00G5Ak-UO
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 09:08:17 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1586941693; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=zS4c6L0D9jU2WBM14Jk1In+hYKeTXj+XmH473wOiYXQ=;
 b=BM0pJYJZhm3uaqm82zB/x+YqpgPWSPukHg+/uAKXlgdfJESkTDbfpEzo+2RsLh+ZzVGEBF1t
 hquPicFwkrufAQDtoLbTGB0lINY+iUqKZRtjSSgbETs0ZdNo4c4sJJg8sDxeBtuA2phJo+Ty
 Zq5xalIIswY1C8xWb7JHXPyxas8=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e96cef6.7ff1c49387d8-smtp-out-n05;
 Wed, 15 Apr 2020 09:08:06 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 28212C432C2; Wed, 15 Apr 2020 09:08:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AC877C433F2;
 Wed, 15 Apr 2020 09:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AC877C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 15 Apr 2020 14:37:53 +0530
Message-Id: <1586941673-4296-1-git-send-email-stummala@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [104.130.122.27 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jOe1k-00G5Ak-UO
Subject: [f2fs-dev] [PATCH v5] f2fs: fix long latency due to discard during
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
v5:
- rebase on Jaegeuk's dev branch.
- add a missing change to fix compilation issue.

 fs/f2fs/segment.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index b7a9421..90c7582 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1101,7 +1101,6 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
 	} else if (discard_type == DPOLICY_FSTRIM) {
 		dpolicy->io_aware = false;
 	} else if (discard_type == DPOLICY_UMOUNT) {
-		dpolicy->max_requests = UINT_MAX;
 		dpolicy->io_aware = false;
 		/* we need to issue all to keep CP_TRIMMED_FLAG */
 		dpolicy->granularity = 1;
@@ -1463,6 +1462,8 @@ static unsigned int __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
 
 	return issued;
 }
+static unsigned int __wait_all_discard_cmd(struct f2fs_sb_info *sbi,
+					struct discard_policy *dpolicy);
 
 static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
 					struct discard_policy *dpolicy)
@@ -1471,12 +1472,14 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
 	struct list_head *pend_list;
 	struct discard_cmd *dc, *tmp;
 	struct blk_plug plug;
-	int i, issued = 0;
+	int i, issued;
 	bool io_interrupted = false;
 
 	if (dpolicy->timeout)
 		f2fs_update_time(sbi, UMOUNT_DISCARD_TIMEOUT);
 
+retry:
+	issued = 0;
 	for (i = MAX_PLIST_NUM - 1; i >= 0; i--) {
 		if (dpolicy->timeout &&
 				f2fs_time_over(sbi, UMOUNT_DISCARD_TIMEOUT))
@@ -1523,6 +1526,11 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
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
