Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D10BB6DAF1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jul 2019 06:05:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hoK99-0008D1-Ir; Fri, 19 Jul 2019 04:05:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1hoK98-0008Cu-Dz
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jul 2019 04:05:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t2gDgLWdotCFPTeDrawShwxm5/TqR5Gm7tpJIDz/X1o=; b=AnFhgDNms/4D+uMBGiktyEivWC
 WhqVjbA4OMpSxL2qyHMOozpQ0qopAizRU8Ad2AG0dtjpX8Cf6AW7KqwhtBSt8khTCJYvbnEFIIf6b
 xaWRT8BIlgNWidTAY1TnNXAPF4jrRKWZUCT0XBalFycVxcNjJ5fSeLqeiZbNFKe+tGvQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t2gDgLWdotCFPTeDrawShwxm5/TqR5Gm7tpJIDz/X1o=; b=nHHn7ZY0cPum8xnwvA2l1x8Wkv
 Bj1R83YBYROTfIUSdPkHD5zZBHZgKf7fVt/JPkF+osJLPs36MYaowRuuMNxHcwz3/cywjNndIR5kk
 XoKpIAs9icS9COx62HHA+Mctlxu3WQG8TIErIjulzNvcmnag0QdUBW7qPir5tduUFxxI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hoK97-006cZe-85
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jul 2019 04:05:26 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E3B5E218CA;
 Fri, 19 Jul 2019 04:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563509119;
 bh=kTlVAKLl0+iFmqj6xmLlcr3dlE6UW351pmPpSTZw25A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jCn2UPA3rJi0QutSO16criIbxuE5h53c1qd7lZ787j0XhOXnuU5KbRL7Q4UZaZjKY
 arkWMINlJO/tLI9KwPzFfiDP03JwGdrLW1yh7vBtozu3Tgq1J80T8EMyh/RDWnpM19
 pkeENTMGl9ggLKSWv9kmbqedt5oa0El8NoyQaHy8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 19 Jul 2019 00:01:45 -0400
Message-Id: <20190719040246.15945-80-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719040246.15945-1-sashal@kernel.org>
References: <20190719040246.15945-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hoK97-006cZe-85
Subject: [f2fs-dev] [PATCH AUTOSEL 5.1 080/141] f2fs: fix is_idle() check
 for discard type
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Sahitya Tummala <stummala@codeaurora.org>

[ Upstream commit 56659ce838456c6f2315ce8a4bd686ac4b23e9d1 ]

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
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/f2fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f1157d5c62bb..1024550ad11a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2194,7 +2194,7 @@ static inline bool is_idle(struct f2fs_sb_info *sbi, int type)
 		get_pages(sbi, F2FS_DIO_WRITE))
 		return false;
 
-	if (SM_I(sbi) && SM_I(sbi)->dcc_info &&
+	if (type != DISCARD_TIME && SM_I(sbi) && SM_I(sbi)->dcc_info &&
 			atomic_read(&SM_I(sbi)->dcc_info->queued_discard))
 		return false;
 
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
