Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 939F11C21F3
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  2 May 2020 02:29:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jUg2C-0006S5-Dr; Sat, 02 May 2020 00:29:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jUg2A-0006Rf-J4
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 02 May 2020 00:29:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kHejNeY9+CQJCMOAMQ2e2KhxlHpQ7bwOkZZ285lwxPQ=; b=h2ltzozFabGZM+oA4bHJpfAWuq
 wR4QHyYX/hMf8rzzXrSCH8bkAJtSjK/SHdcXMMn/dIgXJt3uY3rVjFHvrumYmf89rLmy5wmzl8CaK
 LEoRrap+LMaS/NL3BHFqQHQQRDzRFiYB3NkeZkeitWVT5twPhKZcDLlLdWM0gZNxcIxI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kHejNeY9+CQJCMOAMQ2e2KhxlHpQ7bwOkZZ285lwxPQ=; b=kWQkhgDePnofg4rxxcUliakVnN
 ktoyp9rXrdhD/Bm65gX/AD2GAzKraW0mUxPk4wowqpwmfPARWblWAduidbFae/89mOUkt252M9j5I
 RvNaRYMRsLW2z8C12NnM9ynOQPvzKLOQO6hB3Ft1f+WVRCNS+RVRNEJ1y/lYJ5/vw/7E=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jUg23-0050K6-Nj
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 02 May 2020 00:29:34 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EAD2C21775;
 Sat,  2 May 2020 00:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588379362;
 bh=Cc6hPmM4wgScuEozFc3sHLGkqwGiwUrUVH6RhcYb9a4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mUvc8qLSjiB++PJ2vOnwcNm6PTBATiSI7skpDGFY7FETCnR1RkJ9mJImmmtm7yDRU
 I/Q21hEjztxPbsf0Lg8Y0A8M6UsV0ZWqEIxJlZc5xp/0EHaVucQqaFIZ14BJl+2idW
 cdgOP8MINDRn9yF0T3Kb9WymG4ePKPyupY5piaA4=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri,  1 May 2020 17:29:19 -0700
Message-Id: <20200502002920.76569-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200502002920.76569-1-jaegeuk@kernel.org>
References: <20200502002920.76569-1-jaegeuk@kernel.org>
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
X-Headers-End: 1jUg23-0050K6-Nj
Subject: [f2fs-dev] [PATCH 2/3] f2fs_io: don't give garbage data in upper
 32bits
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
 tools/f2fs_io/f2fs_io.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index c84b6ab..9be99f0 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -192,7 +192,7 @@ static void do_set_verity(int argc, char **argv, const struct cmd_desc *cmd)
 
 static void do_getflags(int argc, char **argv, const struct cmd_desc *cmd)
 {
-	long flag;
+	long flag = 0;
 	int ret, fd;
 	int exist = 0;
 
@@ -239,7 +239,7 @@ static void do_getflags(int argc, char **argv, const struct cmd_desc *cmd)
 
 static void do_setflags(int argc, char **argv, const struct cmd_desc *cmd)
 {
-	long flag;
+	long flag = 0;
 	int ret, fd;
 
 	if (argc != 3) {
-- 
2.26.2.526.g744177e7f7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
