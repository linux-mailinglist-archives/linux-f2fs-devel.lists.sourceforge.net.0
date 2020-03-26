Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A44B193D09
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Mar 2020 11:39:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jHPul-0002k1-Lk; Thu, 26 Mar 2020 10:39:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1jHPuk-0002jV-9s
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Mar 2020 10:39:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZvQ1jdFwqw7szV2N4aXKvGSeJpZKMjp8kiQ4LNqos/M=; b=Vd428riaAM8ezaR36fN0Kwrwd3
 r2DaNel8oJoWFOBly5pAxofRAf47pXwLyTRGljgZ0tK5ISJXY21htwQzn6CXk2wME6VTMeaOZswHq
 HN+PFecVB/mDUJnDzhn8rHc5hOCmiCGFVl4gF/N58M4t6AjNkJ6LwTshmsM3GKUMhuvE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZvQ1jdFwqw7szV2N4aXKvGSeJpZKMjp8kiQ4LNqos/M=; b=hruSy24MX2OUHoPeecDtQYRpeR
 3AQrK8rHnTSVGJi5lHosFTiF267WP5iQ96uSutbd08X7RSs9gdasbmARBRTCfguPFTTB/5VDw3dV0
 BBICYifoei19fT2OebXJS/g7EDjSMXer7JjuboOm3dwI52wgdg1XXcTkSyqfF+YB4lR0=;
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jHPuf-004L57-JN
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Mar 2020 10:39:06 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1585219143; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ZvQ1jdFwqw7szV2N4aXKvGSeJpZKMjp8kiQ4LNqos/M=;
 b=DSDwlGVo7atAdiI3bQGFaL6IoHhHG7OpOnNHK6mh5JptLdnK6OLjTgN5GudMaEYUeAYMyqEj
 5voe811y9antWwlroFmzG6/jnVXxE4wUeNycMT9DBvGBn4NciNQsM8GT5p12adKn98NsA8E6
 jmDcb6wMDeZhX0UDVvICeeMQvHY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7c8634.7f5fc43eba08-smtp-out-n02;
 Thu, 26 Mar 2020 10:38:44 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5D7E9C433F2; Thu, 26 Mar 2020 10:38:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F2808C433D2;
 Thu, 26 Mar 2020 10:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F2808C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 26 Mar 2020 16:06:59 +0530
Message-Id: <1585219019-24831-1-git-send-email-stummala@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [104.130.122.26 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
X-Headers-End: 1jHPuf-004L57-JN
Subject: [f2fs-dev] [PATCH] f2fs: prevent meta updates while checkpoint is
 in progress
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

allocate_segment_for_resize() can cause metapage updates if
it requires to change the current node/data segments for resizing.
Stop these meta updates when there is a checkpoint already
in progress to prevent inconsistent CP data.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
---
 fs/f2fs/gc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 5bca560..6122bad 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1399,8 +1399,10 @@ static int free_segment_range(struct f2fs_sb_info *sbi, unsigned int start,
 	int err = 0;
 
 	/* Move out cursegs from the target range */
+	f2fs_lock_op(sbi);
 	for (type = CURSEG_HOT_DATA; type < NR_CURSEG_TYPE; type++)
 		allocate_segment_for_resize(sbi, type, start, end);
+	f2fs_unlock_op(sbi);
 
 	/* do GC to move out valid blocks in the range */
 	for (segno = start; segno <= end; segno += sbi->segs_per_sec) {
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
