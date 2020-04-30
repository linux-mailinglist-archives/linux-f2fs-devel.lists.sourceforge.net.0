Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA231BF5FB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Apr 2020 12:59:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jU6uE-000649-NH; Thu, 30 Apr 2020 10:59:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1jU6uD-00063y-AZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Apr 2020 10:59:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=za6HroLULClL4klxf9rlWjn/dFf4z8nu70MmHfSuj6U=; b=f/q/8jyKXjU+fXhgxm3JXywhTl
 X8Fu9c61zWwPyzhvG6f6L/zi4Gv6Fs/COlltC8CyL7mCkshSwk/2Gjxg/T4lvlqSRJk8P10ytv3mj
 SlL4rH9+z7zebfFnIsY4HPvFuSsGW77vBdbsMzXM9LEwpDOJqERX65y5+hbT4YUIu/Rk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=za6HroLULClL4klxf9rlWjn/dFf4z8nu70MmHfSuj6U=; b=Bo9pwrgJGC1wJgWMoLdvX+NxuA
 or7d4AneB66OYJUI92XyB+olYI6a1bssADHHUCor2VZk3W7UnkJgHVK+bADd+7TpUT+sXVcbNuPxp
 r5HjguyJpEL9xWfUU4Tli3fdPPOcS22ocBXI1rX9n/u0thTAs0lcM4QwvS4kojRXafBk=;
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jU6u4-00591i-GK
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Apr 2020 10:59:01 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1588244332; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=za6HroLULClL4klxf9rlWjn/dFf4z8nu70MmHfSuj6U=;
 b=iH6z9vcrc0pNddzPSowLvC7GS/tFtAem78FWLVus1wNIVOuxNUD/rZoP6gUglTz/rpGmKrGo
 /mB3i7d0H7XGC+XSmjpBT4AgNwDMQtumcjoLsiu7g51QuXJfspSOIuE2qozLX9MC2zyjwyNY
 fKcIv9Xe3jCWFGbZWXXQRX5BUB4=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eaaaf63.7f88f8f39148-smtp-out-n01;
 Thu, 30 Apr 2020 10:58:43 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 17A12C433D2; Thu, 30 Apr 2020 10:58:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from sayalil-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: sayalil)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5E8DBC433CB;
 Thu, 30 Apr 2020 10:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5E8DBC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=sayalil@codeaurora.org
From: Sayali Lokhande <sayalil@codeaurora.org>
To: jaegeuk@kernel.org, yuchao0@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 30 Apr 2020 16:28:29 +0530
Message-Id: <1588244309-1468-1-git-send-email-sayalil@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [104.130.122.27 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [104.130.122.27 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jU6u4-00591i-GK
Subject: [f2fs-dev] [PATCH V4] f2fs: Avoid double lock for cp_rwsem during
 checkpoint
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

There could be a scenario where f2fs_sync_node_pages gets
called during checkpoint, which in turn tries to flush
inline data and calls iput(). This results in deadlock as
iput() tries to hold cp_rwsem, which is already held at the
beginning by checkpoint->block_operations().

Call stack :

Thread A		Thread B
f2fs_write_checkpoint()
- block_operations(sbi)
 - f2fs_lock_all(sbi);
  - down_write(&sbi->cp_rwsem);

                        - open()
                         - igrab()
                        - write() write inline data
                        - unlink()
- f2fs_sync_node_pages()
 - if (is_inline_node(page))
  - flush_inline_data()
   - ilookup()
     page = f2fs_pagecache_get_page()
     if (!page)
      goto iput_out;
     iput_out:
			-close()
			-iput()
       iput(inode);
       - f2fs_evict_inode()
        - f2fs_truncate_blocks()
         - f2fs_lock_op()
           - down_read(&sbi->cp_rwsem);

Fixes: 2049d4fcb057 ("f2fs: avoid multiple node page writes due to inline_data")
Signed-off-by: Sayali Lokhande <sayalil@codeaurora.org>
---
 fs/f2fs/checkpoint.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 5ba649e..97b6378 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1219,21 +1219,19 @@ static int block_operations(struct f2fs_sb_info *sbi)
 		goto retry_flush_quotas;
 	}
 
-retry_flush_nodes:
 	down_write(&sbi->node_write);
 
 	if (get_pages(sbi, F2FS_DIRTY_NODES)) {
 		up_write(&sbi->node_write);
+		up_write(&sbi->node_change);
+		f2fs_unlock_all(sbi);
 		atomic_inc(&sbi->wb_sync_req[NODE]);
 		err = f2fs_sync_node_pages(sbi, &wbc, false, FS_CP_NODE_IO);
 		atomic_dec(&sbi->wb_sync_req[NODE]);
-		if (err) {
-			up_write(&sbi->node_change);
-			f2fs_unlock_all(sbi);
+		if (err)
 			goto out;
-		}
 		cond_resched();
-		goto retry_flush_nodes;
+		goto retry_flush_quotas;
 	}
 
 	/*
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
