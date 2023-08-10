Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E25907773D6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Aug 2023 11:11:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qU1hH-0000T5-SK;
	Thu, 10 Aug 2023 09:11:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1qU1hG-0000Sy-11
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Aug 2023 09:11:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eqBylSiH3ft3C0/TDYUYjgtODf0JpoAch8yY9bEWVts=; b=gsA154My3gyER4GGgYUxAf1VXk
 Kh2niGY1sDCIBIxOpC5M5mr4gcBUsMnZQJL+EPZo7IUxO6OrNvYyaDzdEcG7uiYw/wVLwSZvvhkcR
 bFcSplHtg/43tEWFow9O07BHPdni2EKUmUnsf1IDZ5LQoV8JqDGpXYQduF7YVcnytUO8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eqBylSiH3ft3C0/TDYUYjgtODf0JpoAch8yY9bEWVts=; b=A
 Ab21SmRsSZJgVrlcGeemODDnsYIis2IV0DJT4ifAIRoLMjSDzr0AFzw6Jp0o9Z71Xp0OjJyWjKSN7
 v85CJCqgpbVnujta4VOg5N3+cWV2vqrCpLA9GlpW4jPA9GLLKFJLOi5kAik6+k3MWsChVmz+3sOPw
 QpePLKDp/o5Zza6g=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qU1hB-001NSp-CM for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Aug 2023 09:11:10 +0000
Received: from SHSQR01.spreadtrum.com (localhost [127.0.0.2] (may be forged))
 by SHSQR01.spreadtrum.com with ESMTP id 37A8fCoe008357
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Aug 2023 16:41:12 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 37A8eUDM002273;
 Thu, 10 Aug 2023 16:40:30 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4RM0gq6Mh1z2PN3Fg;
 Thu, 10 Aug 2023 16:38:31 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Thu, 10 Aug 2023 16:40:28 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Thu, 10 Aug 2023 16:40:00 +0800
Message-ID: <1691656800-21616-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 37A8eUDM002273
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The sending interval of discard and GC should also consider
 direct write requests;
 filesystem is not idle if there is direct write. Signed-off-by:
 Zhiguo Niu <zhiguo.niu@unisoc.com> --- fs/f2fs/file.c | 1 + 1 file changed,
 1 insertion(+) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1qU1hB-001NSp-CM
Subject: [f2fs-dev] [PATCH] f2fs: should update REQ_TIME for direct write
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
Cc: zhiguo.niu@unisoc.com, niuzhiguo84@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The sending interval of discard and GC should also
consider direct write requests; filesystem is not
idle if there is direct write.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/file.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5ac53d2627d2..713a2d98728a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4537,6 +4537,7 @@ static int f2fs_dio_write_end_io(struct kiocb *iocb, ssize_t size, int error,
 	dec_page_count(sbi, F2FS_DIO_WRITE);
 	if (error)
 		return error;
+	f2fs_update_time(sbi, REQ_TIME);
 	f2fs_update_iostat(sbi, NULL, APP_DIRECT_IO, size);
 	return 0;
 }
-- 
2.37.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
