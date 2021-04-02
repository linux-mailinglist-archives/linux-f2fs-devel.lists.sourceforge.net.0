Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FE63525B0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Apr 2021 05:27:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lSASn-00033s-2i; Fri, 02 Apr 2021 03:27:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1lSASl-00033l-E7
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Apr 2021 03:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rKKeUgsZ/qPEuARXi98KcF5qzCBB9ZXTNIrYTQ6HZ0E=; b=UiAVKag2mvPtcH4YaG5pkHlxvj
 zJzIaKXj1VsROLrb6b3QeiBWKFNJlcpt7D/Lkx8p1xc0pb8cNRh9QtNTGutn/gCICt7XwZjsFVPm2
 sI0VIlkgdkwXUKEUkw6GYhWGPDLjFWG//r+nENdYzxn1T8AvBX7yWWWCoAYiYz2jsLDA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rKKeUgsZ/qPEuARXi98KcF5qzCBB9ZXTNIrYTQ6HZ0E=; b=i3FTBBmHU54qHPmHYbZNfytpZg
 dt86pZYFkd49AsoELQLt8s0QBYKzS8Rw63keXdN6+YTisGpL5VNOGwNgNh3zRD7gO5isOS+IXt3bj
 4QETjAZHWv+GSeJJNR65JTDbFpFyy9YuIoDOJrn0wqm55CClStB+UF1T2sffnEm5Pbjo=;
Received: from [198.145.29.99] (helo=mail.kernel.org)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lSASj-0000l9-3b
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 02 Apr 2021 03:27:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA625610CE;
 Fri,  2 Apr 2021 03:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617334018;
 bh=UGjlJgcdvn75kCLUjie54uE8WR3ubcMaA5ftjG8dwO8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mlbpoPgRJC0fcOh6Q3uGO39nCUt1gS/UuRNBitT+WlRoIwLxBE30kCfvv6rAKSmcF
 +F5AfoyK1v1/UypIGTWcOtVts8sZyYAq37s+aA4qocCrbI1msE03GpeBEhKsGCYIQC
 8HCcekwPUyJXecS6Ku81YBM50yRitompFUSikfbUTqVXAp5ZyJmV98oTSV+Lx5ARy2
 SuzY6KI29RU8i+vYXe29J3726YW1cTDaXPMsQTq+To5PKbPnLMF9kvuo3U+DoPKSWm
 QgoPRNW6bFPTUxc2rt0BvbCJwPN4sQ/avlYu2QbZPBhxVdJXt0L8QZgkYlg2MY/heP
 m3fnQ1ag/vHYg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  1 Apr 2021 20:26:42 -0700
Message-Id: <20210402032642.2537641-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
In-Reply-To: <20210402032642.2537641-1-jaegeuk@kernel.org>
References: <20210402032642.2537641-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lSASj-0000l9-3b
Subject: [f2fs-dev] [PATCH 2/2] resize.f2fs: add force option to rewrite
 broken calculation
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

This patch adds "-f" for resize.f2fs to fix broken resized f2fs.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/main.c   | 6 +++++-
 fsck/resize.c | 5 +++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/fsck/main.c b/fsck/main.c
index be30e0073a5e..64efa8789cd4 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -506,7 +506,7 @@ void f2fs_parse_options(int argc, char *argv[])
 #endif
 	} else if (!strcmp("resize.f2fs", prog)) {
 #ifdef WITH_RESIZE
-		const char *option_string = "d:st:iV";
+		const char *option_string = "d:fst:iV";
 
 		c.func = RESIZE;
 		while ((option = getopt(argc, argv, option_string)) != EOF) {
@@ -522,6 +522,10 @@ void f2fs_parse_options(int argc, char *argv[])
 				MSG(0, "Info: Debug level = %d\n",
 							c.dbg_lv);
 				break;
+			case 'f':
+				c.force = 1;
+				MSG(0, "Info: Force to resize\n");
+				break;
 			case 's':
 				c.safe_resize = 1;
 				break;
diff --git a/fsck/resize.c b/fsck/resize.c
index 46b1cfb218cf..0425498b9760 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -714,8 +714,9 @@ int f2fs_resize(struct f2fs_sb_info *sbi)
 		} else {
 			return f2fs_resize_shrink(sbi);
 		}
-	else if ((c.target_sectors * c.sector_size >>
-			get_sb(log_blocksize)) > get_sb(block_count))
+	else if (((c.target_sectors * c.sector_size >>
+			get_sb(log_blocksize)) > get_sb(block_count)) ||
+			c.force)
 		return f2fs_resize_grow(sbi);
 	else {
 		MSG(0, "Nothing to resize.\n");
-- 
2.31.0.208.g409f899ff0-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
