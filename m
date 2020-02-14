Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 424D215F63F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Feb 2020 19:59:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j2gB8-0006HK-2P; Fri, 14 Feb 2020 18:59:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1j2gB7-0006Gv-64
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Feb 2020 18:59:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8W6hpucn3SvzTmC7Sqi6v3hWEqyWffzlARR/rNdJy9g=; b=Xd5XBrSglJEg5nMc+XR1QGhcq3
 3zKAKsaCRGItzVY4B9ahY8vcAmwY+VR9K90fAVHlGAY8V2lvOJ/h/u8MAi3+et7PW+QpOKbPW8vpl
 ymwf1pR6ulTEztICz3MmrLRkF3C3JVSFvmgKqNStPgRAM9xkH3oQU82NSdec4T4KJeSU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8W6hpucn3SvzTmC7Sqi6v3hWEqyWffzlARR/rNdJy9g=; b=DusL17TMzmqm77OUMwML5foqjb
 K9L/hpe8ZV/lRA3Kra+eC9u7oH8zJtdmWpqWP7ZUZ+FMED2MKIFqcWH/Mlpz8VCaDRc2e7S97hNNA
 sYNgQR8uL8e4fQilMBqH6XF8L8VJR90ijsbtPYt4JZVVCDbW7HExbnYxBaJBXkUj7QWg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j2gB6-0042yQ-5R
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Feb 2020 18:59:05 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 755A62168B;
 Fri, 14 Feb 2020 18:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581706738;
 bh=3g/vPR1HVaaTZ+7nebbZDxLTqe8TuTFwsIwIOwOIBlE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iYPOmT0wjyai78N5uGcYj3LSCbfJuabxCruqDX3QyxlmUJDnL/qJyCIIxiiERDQxy
 R1dKCHmBs4Rl5fcrRhwNe325fijbinZJbL8n9y1cm7uxEFLEZT0EydFb10kaLuhOW2
 PbDINOUs1vq5SCJdg72sdVsL03AG4VmGDzXbqISo=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 14 Feb 2020 10:58:55 -0800
Message-Id: <20200214185855.217360-3-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200214185855.217360-1-jaegeuk@kernel.org>
References: <20200214185855.217360-1-jaegeuk@kernel.org>
MIME-Version: 1.0
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
X-Headers-End: 1j2gB6-0042yQ-5R
Subject: [f2fs-dev] [PATCH 3/3] f2fs: skip migration only when BG_GC is
 called
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

FG_GC needs to move entire section more quickly.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/gc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index bbf4db3f6bb4..1676eebc8c8b 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1203,7 +1203,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 
 		if (get_valid_blocks(sbi, segno, false) == 0)
 			goto freed;
-		if (__is_large_section(sbi) &&
+		if (gc_type == BG_GC && __is_large_section(sbi) &&
 				migrated >= sbi->migration_granularity)
 			goto skip;
 		if (!PageUptodate(sum_page) || unlikely(f2fs_cp_error(sbi)))
-- 
2.25.0.265.gbab2e86ba0-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
