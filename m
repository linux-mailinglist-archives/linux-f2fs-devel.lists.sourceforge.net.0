Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5C2244F20
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Aug 2020 22:18:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k6gA4-0001pN-IG; Fri, 14 Aug 2020 20:18:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1k6gA2-0001p0-P4
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Aug 2020 20:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p8VZbZS8tsi00YeLYmeD5ocaepl6hm3WlPz+DfKME74=; b=my1W15vY3o9poaJgXGszTPAa2a
 UynjkBo4SfhwHILAkbpgL3u1rALr5B9B2w+yGJunb2DWS2912cM0pUvYcGUn7IY1aNYJVYp/1KfN4
 UtwkHWy8jm0KwYVPtwH43Ag8yfFNcaoEfB8OADVx+pQOBTglSwesdvRvBLVnIdkqw9Ao=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=p8VZbZS8tsi00YeLYmeD5ocaepl6hm3WlPz+DfKME74=; b=N
 RGKzINbAFHc9bX15DWTb22R6JqeEex0TTk9xRMWSnbskezVM8AJe+Ukd5AaUV8Gr2IPJmhjKGxXad
 go/cfJo/wUGY2gpFIUpSf0jy7yIf/SY3fZ4P85yCM7oUfyKxx0jjwwGDR9SobChe4kRAdbb9AkQr5
 uECbURHxoRSjDIOU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k6gA0-00Eb3P-FM
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Aug 2020 20:18:46 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 040CB20768;
 Fri, 14 Aug 2020 20:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597436319;
 bh=+soq6aV/lmdoPXjl4JUTFrG7kceykgdlEzogFdQ1PbY=;
 h=From:To:Cc:Subject:Date:From;
 b=AyVsOxXr/WNZywWSF0GM+MzvvR//HgkPi2DvkcolHll51CHjAcw8A9+Zbc1fOr7BU
 t3LEl4hnr83O2fUMEiHe7Ye+jMn89IF19iwNdI+rkc+NqG5ata3XDw8BrR0EnEFpyz
 casYnqPQyxTyZfGhHRRueKivypKvnFLBQP95Jpbk=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 14 Aug 2020 13:18:38 -0700
Message-Id: <20200814201838.729542-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
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
X-Headers-End: 1k6gA0-00Eb3P-FM
Subject: [f2fs-dev] [PATCH] f2fs_io: add OSYNC option
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

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index abb655a..70a077a 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -424,6 +424,7 @@ static void do_fallocate(int argc, char **argv, const struct cmd_desc *cmd)
 "IO can be\n"						\
 "  buffered : buffered IO\n"				\
 "  dio      : direct IO\n"				\
+"  osync    : O_SYNC\n"					\
 
 static void do_write(int argc, char **argv, const struct cmd_desc *cmd)
 {
@@ -460,6 +461,8 @@ static void do_write(int argc, char **argv, const struct cmd_desc *cmd)
 
 	if (!strcmp(argv[5], "dio"))
 		flags |= O_DIRECT;
+	else if (!strcmp(argv[5], "osync"))
+		flags |= O_SYNC;
 	else if (strcmp(argv[5], "buffered"))
 		die("Wrong IO type");
 
-- 
2.28.0.220.ged08abb693-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
