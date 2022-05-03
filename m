Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 998FE518ED7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 May 2022 22:31:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nlzAk-000648-HJ; Tue, 03 May 2022 20:31:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nlzAi-00063s-PH
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 20:30:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W89bP8vTvWbz0PYbkvAq4B5s9mtHoGvI3M1NbfgHrpc=; b=lskhXFsXWpkHrgVMZxWHBlsejA
 FlmXrrDYBwufnN3enB7bjGjwa4UdqQMoMgoULm4d5jO373XZiod0bJzUaiabMlXvRC73ucHuH/ngL
 +7ecGt/Us+kqijGO+PWeV6FaU9RSVe/AdE9Bl/L36ylAt9tyQDXF0UxziCbSC1/gWcDg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W89bP8vTvWbz0PYbkvAq4B5s9mtHoGvI3M1NbfgHrpc=; b=A+geRQmj1/iff7lWAb3+B/Dy5G
 9UnRFST9uBK4c6Vi2Ck9IR+CfkWoQ5OI0X18ieJjqI9a0r2xDkkuwmXvbW39bSE72VCAwwTcuomOf
 26d6ZVSgcEkrCrMN/XRzki397RxDd2FplvgC23cSR07eM/Z7HPwL8o1CWeXJxoyfgUUA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nlzAg-0003n7-A9
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 20:30:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B7DC60EE7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  3 May 2022 20:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3540C385B1;
 Tue,  3 May 2022 20:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651609844;
 bh=mVOGOpBYm+Bzhe/7VV0Fmk4EZbmIIpgNhl6/C1CkJlo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fEYQfHh8q/fYnUgf6snM5cXsjOCXkcs50x7ugGNUOG0SaivZSJgrAHBGPF+CyO6wM
 D0+W6cAwprtt8rExly4zdSAKRu5xSgZf6awUjKJlXPmCRMg+FfeDTmibtWqjnajGnM
 eqtj4GLrLSGDqGaQDr8ZbOBnOHOPJWDi1GU3Ku97qG+Revw7GNwxEZD1TdGTd0IikF
 4Lyx+/srcisy9Zp83jt6t1vWhHKpGmlC/9nCrcIUnpemqo5yCetFu85O3Mg182pAsY
 M01K0wth2JG8uAaQBQi5yJ0e52dTkSCgL6BWUoYriNUqu3HJ1HE8vwfH3f8K5gJyyk
 cDrPM3qieTqxg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  3 May 2022 13:30:40 -0700
Message-Id: <20220503203040.365028-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
In-Reply-To: <20220503203040.365028-1-jaegeuk@kernel.org>
References: <20220503203040.365028-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The f2fs_gc uses a bitmap to indicate pinned sections, but
 when disabling chckpoint, we call f2fs_gc() with NULL_SEGNO which selects
 the same dirty segment as a victim all the time, resulting in check [...]
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nlzAg-0003n7-A9
Subject: [f2fs-dev] [PATCH 2/2] f2fs: avoid to select pinned section during
 checkpoint=disable
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

The f2fs_gc uses a bitmap to indicate pinned sections, but when disabling
chckpoint, we call f2fs_gc() with NULL_SEGNO which selects the same dirty
segment as a victim all the time, resulting in checkpoint=disable failure.
Let's pick another one, if we fail to collect it.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/gc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 4d47723523c3..5ba8104e138b 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1838,10 +1838,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
 	if (gc_type == FG_GC)
 		sbi->cur_victim_sec = NULL_SEGNO;
 
-	if (sync)
-		goto stop;
-
-	if (!has_not_enough_free_secs(sbi, sec_freed, 0))
+	if (!has_not_enough_free_secs(sbi, sec_freed, 0) && seg_freed)
 		goto stop;
 
 	if (skipped_round <= MAX_SKIP_GC_COUNT || skipped_round * 2 < round) {
-- 
2.36.0.464.gb9c8b46e94-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
