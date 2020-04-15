Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D15511A91B8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 06:06:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOZK3-0008Gz-FC; Wed, 15 Apr 2020 04:06:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1jOZK2-0008Gs-Dm
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 04:06:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oLbhlgZzFDibP9R9n4hBuNeeF1cgEDuQEqH3Hj43Rl0=; b=Q3Qxv8NZWrntBTKnpXSVDFqWzG
 zs3nzKQHN4iVMT9TofFB6vBTNVic0ksuBQem4EAFD0LngfAqngYA+RQDi/JXyON4VM/mVOP0XmAac
 C8uOOY8W6mm9bs1u5iVT6t8j+EozME0KP0Q4RIBVc04bjkyHcZJjh1nDf6EbzF4jy/cs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oLbhlgZzFDibP9R9n4hBuNeeF1cgEDuQEqH3Hj43Rl0=; b=EnHV9odozzErWbiqf5OXJHkGDd
 fhd2vmIOSw7clLHNL0bW5mJVnbfa1OzGybnE9pXPaEzMEk2ED4/qUYt7d+HIGK1THP413UGLs5dL0
 unoovjxa92OD+uSn0uhT6XgjdqsUIjmrjb2EF515FJfdJz4UXSAygpKWORK5Yre+kiH0=;
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jOZJs-00GqKn-Td
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 04:06:46 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1586923599; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=oLbhlgZzFDibP9R9n4hBuNeeF1cgEDuQEqH3Hj43Rl0=;
 b=rokYPItAsN+8e9A3KEvA7jPf1OwAyiPa87Fpa+UsoLS61ZSzGqa1708jzZtQtXL6skGwxQjr
 PjPyFjFVCVF8nu2mxuZ+Wlnejtj0kqnmsZ98wpo1t3DN+EkcF9gfF14C6wuhV7Pxos0OAI+9
 Wez9czm2yNaxXSDBKjaNVlNYDpA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e96883f.7fe1d9816f48-smtp-out-n04;
 Wed, 15 Apr 2020 04:06:23 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0C9D8C433BA; Wed, 15 Apr 2020 04:06:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9F5CFC433CB;
 Wed, 15 Apr 2020 04:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9F5CFC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 15 Apr 2020 09:35:54 +0530
Message-Id: <1586923554-30257-1-git-send-email-stummala@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [104.130.122.26 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jOZJs-00GqKn-Td
Subject: [f2fs-dev] [PATCH] f2fs: report the discard cmd errors properly
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

In case a discard_cmd is split into several bios, the dc->error
must not be overwritten once an error is reported by a bio. Also,
move it under dc->lock.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
---
 fs/f2fs/segment.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index bd6dd19..745e4dd 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1031,9 +1031,9 @@ static void f2fs_submit_discard_endio(struct bio *bio)
 	struct discard_cmd *dc = (struct discard_cmd *)bio->bi_private;
 	unsigned long flags;
 
-	dc->error = blk_status_to_errno(bio->bi_status);
-
 	spin_lock_irqsave(&dc->lock, flags);
+	if (!dc->error)
+		dc->error = blk_status_to_errno(bio->bi_status);
 	dc->bio_ref--;
 	if (!dc->bio_ref && dc->state == D_SUBMIT) {
 		dc->state = D_DONE;
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
