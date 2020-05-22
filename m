Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4C51DF301
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 23 May 2020 01:32:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jcH9q-0008Ik-SW; Fri, 22 May 2020 23:32:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jcH9p-0008IX-8i
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 May 2020 23:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=63aDiV7Zit+24aVtUA8K336Ropbqh2Bq1nxQYiy84FM=; b=jUIETkXhgk/yrnigJkjozfqXcL
 2CB25c7w1wCeFoZq1Z9FTAGLQX3MDkqcDfmfgdL72XeCi7GgMGTD4jLTfY24U7gPyKyJa+lA1M7iu
 WoGG3ySsBFIShC7IiK3/F7HOBporgz/LNj+FqIx11xsGHtUPPeuFQuz10tIQ3beepuAI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=63aDiV7Zit+24aVtUA8K336Ropbqh2Bq1nxQYiy84FM=; b=azg+ZEZ2iUMepA4DRE6FnvK97L
 oo2sA8Va7CRYDGqewq1xxFQd5xxuTTBZc8wdjbiJpUsKReBKnq1XUtNQMtjPvWFc0kjkTuWsNaXil
 9EnXl3Q/7zSgBy5OW2DjPI8pYjWaUOJYBJ49ONtmYTYeVB5/hmQPRK8g1gxDL41TivOs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jcH9m-005z09-Ed
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 May 2020 23:32:53 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E0C27206B6;
 Fri, 22 May 2020 23:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590190364;
 bh=u0mkeekhT7H4kvo0f/18YnuEmDkDZm6GrdqhYSj0Abw=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=UNVy7Q40ku/I6kDg1MJqnO4It3D0bR6jrRy2EglrTzAlteZEk13Lpsu6gfQPk1TEd
 lRH0mEEm5HbDZG16XTF+bCos8E4dPnWChBwjTJjuPikuJjFuTODB/Csya2pBOht59z
 M+WZyLayiKurgB1ZDN3Z5Y7oXlBJAaiUdf1hQ6Lg=
Date: Fri, 22 May 2020 16:32:43 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Message-ID: <20200522233243.GA94020@google.com>
References: <20200522144752.216197-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200522144752.216197-1-jaegeuk@kernel.org>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jcH9m-005z09-Ed
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid inifinite loop to wait for
 flushing node pages at cp_error
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Shutdown test is somtimes hung, since it keeps trying to flush dirty node pages
in an inifinite loop. Let's drop dirty pages at umount in that case.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
v2:
 - fix typos

 fs/f2fs/node.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index e632de10aedab..8c63964a82fd0 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1520,8 +1520,15 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
 
 	trace_f2fs_writepage(page, NODE);
 
-	if (unlikely(f2fs_cp_error(sbi)))
+	if (unlikely(f2fs_cp_error(sbi))) {
+		if (is_sbi_flag_set(sbi, SBI_IS_CLOSE)) {
+			dec_page_count(sbi, F2FS_DIRTY_NODES);
+			up_read(&sbi->node_write);
+			unlock_page(page);
+			return 0;
+		}
 		goto redirty_out;
+	}
 
 	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
 		goto redirty_out;
-- 
2.27.0.rc0.183.gde8f92d652-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
