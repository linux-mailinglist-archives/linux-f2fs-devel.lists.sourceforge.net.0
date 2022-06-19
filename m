Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 942B8550D63
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jun 2022 00:05:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o333J-0007xn-0N; Sun, 19 Jun 2022 22:05:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1o333H-0007xh-Q1
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jun 2022 22:05:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VUzHtoWfRO1VfAdJbFVc4R7GXC/niBmiaFhGnmrGrT0=; b=YCFFPr3VqgB09Y7njbGCX+MDAF
 25oe6oZaMMk/75Rdi1qbc0lUaIAwttnILQhhg4Mo+QJ3gOJU34p2oNBLyONSGigA3xrVEDD0ssuZV
 YyLlYo6vKmGVQyjds/5s4y/lUMkgbnZEvOvpP/3hXlMbnD42c+XcVJpdgMiHQeI/BP7Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VUzHtoWfRO1VfAdJbFVc4R7GXC/niBmiaFhGnmrGrT0=; b=cAyzzGj4pPP+iJHjkFHBjyhevH
 zBGm1UNSCROIBb0O/AZp6r3fza/useNs4Lxs/JTl5EDbCj3vz6Sc0uvICXqBYub5FcNtHi2yQwSwT
 2pZp26zoVj9xaCSWu4NBksRY1JjQ+5H5vOUlsPpMr6AE9TFryBadC9kTv5prIbW35kpE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o333C-00070m-DV
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jun 2022 22:05:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84C9D612A0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 19 Jun 2022 22:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A1EC34114
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 19 Jun 2022 22:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655676337;
 bh=9/n1iYaXAftqUHZ27qqclI8dyCcP2dos1Kf6P4X/PmE=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=k8vGOiLQvwMAWr+m0bU/CJRwgE1e8ce28FZzhkZhCgod/CkhuYMPEQvbK91MfDc0v
 sOT+U5htNjv6HPEcsv3R0U+J43yYV2FopGzxwdyBpZBklRJjvMZKnIFUz3rCYKI35S
 WKpHjz5dzcGAO6AnpggPaLEW4aPH+aQmZ7jL/gMB274kLLgCRQmPhPtN/W5dlP1ruB
 FfhKokNPNypH45Ff69Y1jc/RK9GcxS5ZK23f8qKi0AhE+q6sUsP2DZM67mcnC8hLRF
 YbudSbuzhqWQ3T1pTi+5i0QuuNzr5IkSWuH7+Ym7EBmzxNX+tR+tE0i9CSDibByf/T
 zha9CjjoasRtg==
Date: Sun, 19 Jun 2022 15:05:35 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <Yq+dr6tzKkPuwck5@google.com>
References: <20220615165610.1074259-1-jaegeuk@kernel.org>
 <20220615165610.1074259-2-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220615165610.1074259-2-jaegeuk@kernel.org>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This adds a write option having O_DIRECT | O_DSYNC.
 Signed-off-by:
 Jaegeuk Kim <jaegeuk@kernel.org> --- Change log from v1: - update man page
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o333C-00070m-DV
Subject: Re: [f2fs-dev] [PATCH 2/2 v2] f2fs_io: add dsync option for write
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

This adds a write option having O_DIRECT | O_DSYNC.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---

  Change log from v1: 
   - update man page

 man/f2fs_io.8           | 3 +++
 tools/f2fs_io/f2fs_io.c | 5 ++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/man/f2fs_io.8 b/man/f2fs_io.8
index 8a2c37489939..af7325add388 100644
--- a/man/f2fs_io.8
+++ b/man/f2fs_io.8
@@ -76,6 +76,9 @@ buffered I/O
 .TP
 .B dio
 direct I/O
+.TP
+.B dsync
+direct I/O with O_DSYNC
 .RE
 .TP
 \fBread\fR \fI[chunk_size in 4kb] [offset in chunk_size] [count] [IO] [print_nbytes] [file_path]\fR
diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 2f0fc7b25d41..e7359836b126 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -508,7 +508,8 @@ static void do_erase(int argc, char **argv, const struct cmd_desc *cmd)
 "  rand          : random numbers\n"			\
 "IO can be\n"						\
 "  buffered      : buffered IO\n"			\
-"  dio           : direct IO\n"				\
+"  dio           : O_DIRECT\n"				\
+"  dsync         : O_DIRECT | O_DSYNC\n"		\
 "  osync         : O_SYNC\n"				\
 "  atomic_commit : atomic write & commit\n"		\
 "  atomic_abort  : atomic write & abort\n"		\
@@ -552,6 +553,8 @@ static void do_write(int argc, char **argv, const struct cmd_desc *cmd)
 
 	if (!strcmp(argv[5], "dio"))
 		flags |= O_DIRECT;
+	else if (!strcmp(argv[5], "dsync"))
+		flags |= O_DIRECT | O_DSYNC;
 	else if (!strcmp(argv[5], "osync"))
 		flags |= O_SYNC;
 	else if (!strcmp(argv[5], "atomic_commit"))
-- 
2.36.1.476.g0c4daa206d-goog




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
