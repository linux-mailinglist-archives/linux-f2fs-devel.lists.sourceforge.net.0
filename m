Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9973D61CB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jul 2021 18:14:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m83FJ-00032Y-MY; Mon, 26 Jul 2021 16:14:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1m83FI-00032S-LW
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Jul 2021 16:14:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qkXX1dTV5tryy1iz57pWTH8vxQh5h9WUoXGgmMaR/fU=; b=gW8GnK8nGgs0XdvwhEoYngudH+
 8U/sxCttSIfl81zKzp7ENdWljknUgNkRZ9B0qS7iUkenZ3hw4wraeJRtueccrrvw7N8oB7yoCDk5k
 r4YFK9fQwjk9O6wma4MCuFXK/GDXgn/643HTpqPaRwZrapLEjQle558m2jAx78JFFx3I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qkXX1dTV5tryy1iz57pWTH8vxQh5h9WUoXGgmMaR/fU=; b=U
 m8TQV2+fYbY64T4FaQlAD4/FO8nb4GD+2RnMls4h4iCaD2+0JeJrkdugbueT95ZQq3g0qk4uRLDwX
 49rRFsLtvLfgx5FdNgGQ0WwKyRPXcMEbX0H09UxfMY7gMt/MDdqjVAhxM+NDK/8p3ppEFv4J9WzLI
 JGlXsWnp2NcEPf9Y=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m83F7-003IM3-Kp
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Jul 2021 16:14:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50D5F604AC;
 Mon, 26 Jul 2021 16:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627316043;
 bh=tv3iEgitgc75A0bg23isqSqMFGNrby9uKXpFxgZ/wQ0=;
 h=From:To:Cc:Subject:Date:From;
 b=utJLbSCklriQ95YuJeTxtNPqCtLoCJ6D1KUkkDK2z45T4Sy/65l8Zl6aPQvwueHJd
 J2jKif7/gwuCrkXdZe2z4y1p+8FyQp/rYJRuy/ucaKIWgmiirjMwkQz3UgUm7xHmEC
 vFml30psnBaWCZ2xQpdxoIr3WCoB2vvHM4YDZZ3rPeELWygJxkdjWzOagbiclQzYd5
 hWQVvLiZYePNVb/5qO5gEsCn0GTIbkPcDN93Srd+juawUkUSvmJ/suBYcKzviN4AdO
 E007aB+rODfQkt8mWpkUO7AbjDkYzi4N4OmkP38qo3NElg5brrFw9rrHmPx+3o3UlS
 SbwRVAsVvmBog==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 26 Jul 2021 09:13:57 -0700
Message-Id: <20210726161357.105332-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
MIME-Version: 1.0
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m83F7-003IM3-Kp
Subject: [f2fs-dev] [PATCH] f2fs: do not submit NEW_ADDR to read node block
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

After the below patch, give cp is errored, we drop dirty node pages. This
can give NEW_ADDR to read node pages. Don't do WARN_ON() which gives
generic/475 failure.

Fixes: 28607bf3aa6f ("f2fs: drop dirty node pages when cp is in error status")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/node.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index c945a9730f3c..5840b82ce311 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1330,7 +1330,8 @@ static int read_node_page(struct page *page, int op_flags)
 	if (err)
 		return err;
 
-	if (unlikely(ni.blk_addr == NULL_ADDR) ||
+	/* NEW_ADDR can be seen, after cp_error drops some dirty node pages */
+	if (unlikely(ni.blk_addr == NULL_ADDR || ni.blk_addr == NEW_ADDR) ||
 			is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN)) {
 		ClearPageUptodate(page);
 		return -ENOENT;
-- 
2.32.0.432.gabb21c7263-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
