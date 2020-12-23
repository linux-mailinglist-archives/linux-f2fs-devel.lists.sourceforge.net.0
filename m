Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5552B2E20F0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Dec 2020 20:34:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ks9u5-0006qO-RL; Wed, 23 Dec 2020 19:34:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ks9u1-0006q8-8j
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Dec 2020 19:34:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nGcCtgdm9izN2UeaKrnGIYMjo+nxvP5bk+8tem2E0Oc=; b=BMik9Q1os5sKtXgKuP/1DrcGCo
 ujT6ktObdzGPc4WF/AzkscqiiQOBdRFPyQimY6HyMNfl0XfAA8HTVhvkcgPWWrn9zsvekgzhDUoK0
 w/CO/OejM23ktFccKViMTU23orC2l3jhU2tl9+zhpeMbzt0ndE/Ezt0IpgJnOiYGJTO4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nGcCtgdm9izN2UeaKrnGIYMjo+nxvP5bk+8tem2E0Oc=; b=m
 dDiLb8tPKo6WtyituWrvhOKkJITYHomjeXMHE8xhn+rL7y+4w4ETknPRAKi9KnpKCgnebgJ5jg928
 FqNtKIdTRJcoqPvkydQZR1vRmiqSa89eOpupIIhe0g2fDsG4MXlheqKmJoOxq02Pof7zQq8UTLRbE
 ogNeIZuond5cqCQw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ks9tw-008uTT-Ia
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 23 Dec 2020 19:34:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E1E42246B;
 Wed, 23 Dec 2020 19:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608752054;
 bh=rYW80sjUPCELXNBY+oEDjRdMvxG6nvtYOT/sqJeKfbc=;
 h=From:To:Cc:Subject:Date:From;
 b=Q8VUsyJ/uPN24rrE9A1Mvo60OaCM/piqSMvudHFqrt91Wg3gIDSamhy6Xz/N2a5UT
 q6ei3h3mMYQl+LszCAbKUj6wMQyN0eabHpBVOY5PdTYBjDDPxoaKJxZ3hli5lY/w9i
 8DoD6P/ga8I9AgLuFi9sXlYFeUSMpx3Ja3dw5hAw9RxfSUTUKiow67PfOsThOxphjY
 m7+FgYKWttwd2TEeiA9U0PILe9FX8vM5742UWeqCPujbf8srSotTidEOaNK2nngZX5
 a59LVFI1QdSKGJeOG98cXNCJKTyjke2cKcYuQDSU6ZeuFZi2rBKx6UczSkdkymWZz5
 ikkq3Pqz/Jb4g==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 23 Dec 2020 11:34:07 -0800
Message-Id: <20201223193407.1326271-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ks9tw-008uTT-Ia
Subject: [f2fs-dev] [PATCH] f2fs-tools: fix wrong blk_zone_rep_v2 definition
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

If HAVE_BLK_ZONE_REP_V2 id defined, we should set v2.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 include/f2fs_fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index b9dc0b6f480e..ccf1e2b7a548 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1407,7 +1407,7 @@ blk_zone_cond_str(struct blk_zone *blkz)
 /*
  * Handle kernel zone capacity support
  */
-#ifndef HAVE_BLK_ZONE_REP_V2
+#ifdef HAVE_BLK_ZONE_REP_V2
 #define BLK_ZONE_REP_CAPACITY   (1 << 0)
 struct blk_zone_v2 {
 	__u64   start;          /* Zone start sector */
-- 
2.29.2.729.g45daf8777d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
