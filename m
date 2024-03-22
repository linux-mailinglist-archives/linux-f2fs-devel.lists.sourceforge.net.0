Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A78B886692
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Mar 2024 07:04:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rnY0i-0005OU-HO;
	Fri, 22 Mar 2024 06:04:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1rnY0g-0005ON-Ge
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Mar 2024 06:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VtC/YVu6XzE84dntAhY1j7UFHanWCYhwTekFoRytlZU=; b=A4AaLjp20nNDItNpx1fWBZvoRn
 Wa+D9PrsiBw8kOvNyzWGUfnkHvKZV2+xVjAK+G0yN4DiRonVRnAFPPsbO3Cn7csviqw4P5+yB+4NN
 1ev8Sz2spc1pX3pIRnTDILvbKGoMLg6TiPFgkrcgKD2qpLv0Ku1DcRPgVbe4l6yY5eLk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VtC/YVu6XzE84dntAhY1j7UFHanWCYhwTekFoRytlZU=; b=b
 Yt1B92QuzhRNx7S8il+CW2ZfQs5FTAZAV84qIOiI6AUeefagMSVlLMNUVo72JD3JbGkEozYZGhMgO
 0kftbUSsoJzo3hL8R6dsJd8cSJNcLMwVRAhEO88MD4WVjiPrzv8KYpn+vWJ6aPM5YFYRYDGzEXV9z
 e9fgQFOxub4Rp/JQ=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rnY0f-0001ny-BZ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Mar 2024 06:04:10 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 42M63LJl093516;
 Fri, 22 Mar 2024 14:03:21 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4V1BY828Zkz2Lj488;
 Fri, 22 Mar 2024 14:01:48 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Fri, 22 Mar 2024 14:03:19 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Fri, 22 Mar 2024 14:03:10 +0800
Message-ID: <1711087390-23645-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS01.spreadtrum.com (10.0.1.201) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 42M63LJl093516
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: A length that exceeds the real size of the inode may be
 specified
 from user, although these out-of-range areas are not mapped, but they still
 need to be check in while loop, which is unnecessary. Signed-off-by: Zhiguo
 Niu <zhiguo.niu@unisoc.com> --- fs/f2fs/file.c | 4 +++- 1 file changed, 3
 insertions(+), 1 deletion(-) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1rnY0f-0001ny-BZ
Subject: [f2fs-dev] [PATCH] f2fs: fix to adjust appropirate defragment pg_end
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hongyu.jin@unisoc.com,
 zhiguo.niu@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

A length that exceeds the real size of the inode may be
specified from user, although these out-of-range areas
are not mapped, but they still need to be check in
while loop, which is unnecessary.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/file.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 128e53d..0e7eac6 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2609,7 +2609,9 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 	int err;
 
 	pg_start = range->start >> PAGE_SHIFT;
-	pg_end = (range->start + range->len) >> PAGE_SHIFT;
+	pg_end = min_t(pgoff_t,
+			(range->start + range->len) >> PAGE_SHIFT,
+			DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE));
 
 	f2fs_balance_fs(sbi, true);
 
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
