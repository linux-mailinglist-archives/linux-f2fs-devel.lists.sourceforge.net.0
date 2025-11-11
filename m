Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A85C4D84B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Nov 2025 12:53:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4UFuMlMMbTn52nW+0W5JWeQbZqRz9dRLQ6jSA81iig=; b=INx/lUxO1UimPryTG66BiaGpLk
	wZApW+hcki7miMBT/0p+pdH3B11I8kuIZStreRwz3P5adT7tvUfVFgxzEHD2/BSNrBT9keKGnMOMA
	EfcIS0aoYYlhPMOabRs634CnyvqRwE3BLnIiNzcCAgsaLtIk4v+YU1EIf2V0mt9Jsaq0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vImve-0003IC-CA;
	Tue, 11 Nov 2025 11:52:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vImvc-0003I6-EX
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 11:52:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bDfJvTiBrV1cX5SER4iva7CEHccFDmLJ27uFVLUwRMA=; b=DSiOdtP9qJvYceQmvHDuHFosGZ
 00zta16uJD5GKSlS3UI2aGJMlJTUnzsSmHFNKtaGK+sIuFjtMDuc2byiwSi9jn60bB6eK+XbMynS+
 fBurkWQA2vhIoORAKNnhpanL23P3m7yS08sUvi8yzTs33UILqfLHOskT9iPles8D3ekQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bDfJvTiBrV1cX5SER4iva7CEHccFDmLJ27uFVLUwRMA=; b=UQUhzG0PjGDHQbu5llYIUYCLQu
 Ujw3eXV+wgxO0WTEyk9bd83k7E4TLanbD8sDwRd9sh2mRUIPRCIHCHDTAC0FdADm/GWsItSsKh67B
 JzoIH2jRpQ8y51kWn0BYprltOl7hqgH8iKzlKd5DLp/SGMjystckJh3zxIMRcr1057cM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vImvc-0003Ht-R1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 11:52:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 87FCE43DAE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Nov 2025 11:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56582C19423;
 Tue, 11 Nov 2025 11:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762861962;
 bh=f6RcoELmzojj6s6Tg/noSowPetDGuPHU0f5LoaPLD7g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XsIlg9URmd5Z32DmwfJllCOqoT4FFNMrnIOQpTunvJgHxOGWaXwm4UYd8PztkT1Jz
 v2iD7wCWOpWjrVTXF/DFIdRztCnzfRBUZGuuEr8Gplt6vGjjm8oQ7K2mR2zbCBTXce
 YA5HSI7jin3x1KD7XZLRuEIQxLV5FiZwFtZ3oM1UdeUp837MXeVqHccA4PlpO3rifq
 dmIokR5pPUYGaOcMLobqGpbDpR4J5xUHpKYy1VjgTTvIMOE0URKvwwd7AmGfVxsWQ/
 C02M6HnS1QB/20qc6aX88xvSqCToNklNa9H2xpg7RBPnnLg/Fxi3P73bqU0r2oGY5i
 VQ/jyIzkFvD7A==
To: jaegeuk@kernel.org
Date: Tue, 11 Nov 2025 19:52:29 +0800
Message-ID: <20251111115229.1729729-2-chao@kernel.org>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
In-Reply-To: <20251111115229.1729729-1-chao@kernel.org>
References: <20251111115229.1729729-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch changes default schedule timeout value from 20ms
 to 1ms, in order to give caller more chances to check whether IO or non-IO
 congestion condition has already been mitigable. In addition, default interval
 of periodical discard submission is kept to 20ms. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vImvc-0003Ht-R1
Subject: [f2fs-dev] [PATCH 2/2] f2fs: change default schedule timeout value
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch changes default schedule timeout value from 20ms to 1ms,
in order to give caller more chances to check whether IO or non-IO
congestion condition has already been mitigable.

In addition, default interval of periodical discard submission is
kept to 20ms.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h    | 6 ++++--
 fs/f2fs/segment.c | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 0d0e0a01a659..74cbbd84f39b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -407,6 +407,8 @@ struct discard_entry {
 #define DEFAULT_DISCARD_GRANULARITY		16
 /* default maximum discard granularity of ordered discard, unit: block count */
 #define DEFAULT_MAX_ORDERED_DISCARD_GRANULARITY	16
+/* default interval of periodical discard submission */
+#define DEFAULT_DISCARD_INTERVAL	(msecs_to_jiffies(20))
 
 /* max discard pend list number */
 #define MAX_PLIST_NUM		512
@@ -656,8 +658,8 @@ enum {
 
 #define DEFAULT_RETRY_IO_COUNT	8	/* maximum retry read IO or flush count */
 
-/* IO/non-IO congestion wait timeout value, default: 20ms */
-#define	DEFAULT_SCHEDULE_TIMEOUT	(msecs_to_jiffies(20))
+/* IO/non-IO congestion wait timeout value, default: 1ms */
+#define	DEFAULT_SCHEDULE_TIMEOUT	(msecs_to_jiffies(1))
 
 /* timeout value injected, default: 1000ms */
 #define DEFAULT_FAULT_TIMEOUT	(msecs_to_jiffies(1000))
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 58a5d6bc675f..d146c5816912 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3462,7 +3462,7 @@ static unsigned int __issue_discard_cmd_range(struct f2fs_sb_info *sbi,
 			blk_finish_plug(&plug);
 			mutex_unlock(&dcc->cmd_lock);
 			trimmed += __wait_all_discard_cmd(sbi, NULL);
-			f2fs_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
+			f2fs_schedule_timeout(DEFAULT_DISCARD_INTERVAL);
 			goto next;
 		}
 skip:
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
