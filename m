Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3E43701C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jun 2019 11:38:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hYoqu-0000Z5-Rx; Thu, 06 Jun 2019 09:38:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stummala@codeaurora.org>) id 1hYoqt-0000Yu-NY
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 Jun 2019 09:38:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EpM0hncBhCbNW87vPgxFlMl8MkRRWcXptJbG+FdULdA=; b=HFfSgkyOux1kYLyK1mg/C7OQif
 bnh9KOIVCNAQoJdIMRxxVzjgPJKPFHWjLiiNcMk7UqmjjkKtK7YaxV6JQZ8bjICqZ4Rmy55j+P6V/
 RTEnLsUgql/5caK6Hlcf2eerfsM+kswwyjgMDufPAeLiGtvlrMgsty6aMKIYE1H5zWCw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EpM0hncBhCbNW87vPgxFlMl8MkRRWcXptJbG+FdULdA=; b=BauJC9FFXY9HvaMQ3qktlvIZM+
 s9z3O+YZVnsUX8OB6J9FwNQqjewOIj997lARwrt+8DnTXvPla5GgIyCF4QI+Y0D2RnRHq3pzx5G+S
 OuZZmwV4c8rEC6w2n125KsjN0vyJTTyUCDB8nBBSKKoeHReD8anfN8zkuV440YWGPNpI=;
Received: from smtp.codeaurora.org ([198.145.29.96])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hYoqs-00CvXw-Gd
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 Jun 2019 09:38:31 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 8F3836044E; Thu,  6 Jun 2019 09:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1559813904;
 bh=tsqL//XVJSyHPsn4WnbGr5Qz0DMSjGS8jSJVKedC0gA=;
 h=From:To:Cc:Subject:Date:From;
 b=g7fnb/zhTz/exA2ecO/+qVG4B7WFy4UzhxYZr3rIkg6w9Nn3h7mfU4NSYmFlH16D6
 eLBg6HARf3cEifaVGm5kv9fU5ZnbAjNvJSS/l2RX0JTwh4iO/0RXIBGC0EGL19rFKh
 J0cZg9qFglVCw/uurYFaJf5FObBPn0R/4UD8USN0=
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E43CF60255;
 Thu,  6 Jun 2019 09:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1559813903;
 bh=tsqL//XVJSyHPsn4WnbGr5Qz0DMSjGS8jSJVKedC0gA=;
 h=From:To:Cc:Subject:Date:From;
 b=HZaFc5gRGbuyS+uPsJOXHvLIc16i7lWVrelWKdHiOZCIZaJ4IaH5XQmk2kk0ESAPW
 U+3D/41cvMHrA6AUO1xd2+JccF7soEZuOWpO6yUNgcetn9eBp4GSHHLtMFujXvIc5i
 HI5X7MWbx0zNSxgpjkLk03sMqLf1mXFd5is10zpc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E43CF60255
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  6 Jun 2019 15:08:13 +0530
Message-Id: <1559813893-23452-1-git-send-email-stummala@codeaurora.org>
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
X-Headers-End: 1hYoqs-00CvXw-Gd
Subject: [f2fs-dev] [PATCH] f2fs: fix is_idle() check for discard type
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

The discard thread should issue upto dpolicy->max_requests at once
and wait for all those discard requests at once it reaches
dpolicy->max_requests. It should then sleep for dpolicy->min_interval
timeout before issuing the next batch of discard requests. But in the
current code of is_idle(), it checks for dcc_info->queued_discard and
aborts issuing the discard batch of max_requests. This
dcc_info->queued_discard will be true always once one discard command
is issued.

It is thus resulting into this type of discard request pattern -

- Issue discard request#1
- is_idle() returns false, discard thread waits for request#1 and then
  sleeps for min_interval 50ms.
- Issue discard request#2
- is_idle() returns false, discard thread waits for request#2 and then
  sleeps for min_interval 50ms.
- and so on for all other discard requests, assuming f2fs is idle w.r.t
  other conditions.

With this fix, the pattern will look like this -

- Issue discard request#1
- Issue discard request#2
  and so on upto max_requests of 8
- Issue discard request#8
- wait for min_interval 50ms.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
---
 fs/f2fs/f2fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 95adedb..ea34fef 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2209,7 +2209,7 @@ static inline bool is_idle(struct f2fs_sb_info *sbi, int type)
 		get_pages(sbi, F2FS_DIO_WRITE))
 		return false;
 
-	if (SM_I(sbi) && SM_I(sbi)->dcc_info &&
+	if (type != DISCARD_TIME && SM_I(sbi) && SM_I(sbi)->dcc_info &&
 			atomic_read(&SM_I(sbi)->dcc_info->queued_discard))
 		return false;
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
