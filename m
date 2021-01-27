Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A81B2304F07
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Jan 2021 02:45:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l4Zt8-0000gR-Sz; Wed, 27 Jan 2021 01:44:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1l4Zt7-0000gG-U8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Jan 2021 01:44:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yX2rWUK6PvWdD0i6mM/lXwXTdX5UEd5DKVJRX2z7up4=; b=HA7RJ4vCdAdNrTC7UAKVBIWLDe
 fZ7tggTlG5AOmmi5btWKclzp61CPD8iSBAnFr5CfWJyOVijVecLNnn4DlXa5mdz2v0wLZ70sgH5t9
 3VYoXm5BjIZ3GHgs8ieEmKVHD4RA4onunJ8rBZSQscUWhmSnILsa1AGZGP4XXavLFEOI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yX2rWUK6PvWdD0i6mM/lXwXTdX5UEd5DKVJRX2z7up4=; b=H
 OnVxwPBVe0IQjpGu0HbXGL8E/o49ogNxIZ/yM+MVfPLXpByijiIoMawJsm7zNSf5wm2QazuXJokcG
 Xl7r6tl4R+dFYxIQ30mJ6y0NgvsbEw+lMwpM5YO0oX11VZTu705tvr6fVx+qW4QFEv5gXxxw2/zA5
 apXf8xqv29+zQuOo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l4Zt3-00C0Qu-36
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Jan 2021 01:44:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA88A2054F;
 Wed, 27 Jan 2021 01:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611711878;
 bh=lBJ53K92hVK0EqvlqjcltcmGpAoUSsWhlw7eSkvYepk=;
 h=From:To:Cc:Subject:Date:From;
 b=f76QWS5jEXBltyE8jd6AavYiRTRZn17b4d4jWDQgMP1InELKx+JnuzOcXz48lfSSj
 PgaXhEb85GCQI8a7nK/Tc/5rQQ7oMinj5AbzDJn8KjfsgaYtnKnyF5sEHt0X/bpnWI
 inNsv7NKHuw5aXHUoVrbQ8MtU0ozBVbL2js8eSlS/jZkejqvkMWUxZcl/w+foVGCGv
 lb86fwJiCHNuIVHHN2TL5YGsFhRJTWZSAxFVGQEM+gW8YXDdgwN2WabOV2aUm06R4y
 65ab/9S2eMm6K35NaxwVmP8oFQxJz1zlbY1WYTG5hIk3PbXvBu9IONSqZtvO3+V9gI
 64dBDUN9tOWuA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 26 Jan 2021 17:44:34 -0800
Message-Id: <20210127014434.3431893-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l4Zt3-00C0Qu-36
Subject: [f2fs-dev] [PATCH] f2fs: flush data when enabling checkpoint back
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

During checkpoint=disable period, f2fs bypasses all the synchronous IOs such as
sync and fsync. So, when enabling it back, we must flush all of them in order
to keep the data persistent. Otherwise, suddern power-cut right after enabling
checkpoint will cause data loss.

Fixes: 4354994f097d ("f2fs: checkpoint disabling")
Cc: stable@vger.kernel.org
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/super.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 359cc5a2f8f5..073b51af62c8 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1887,6 +1887,9 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 
 static void f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 {
+	/* we should flush all the data to keep data consistency */
+	sync_inodes_sb(sbi->sb);
+
 	down_write(&sbi->gc_lock);
 	f2fs_dirty_to_prefree(sbi);
 
-- 
2.30.0.280.ga3ce27912f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
