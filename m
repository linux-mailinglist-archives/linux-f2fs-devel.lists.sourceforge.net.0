Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A117F944575
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Aug 2024 09:33:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sZQIz-0006Bt-Cc;
	Thu, 01 Aug 2024 07:32:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <r.smirnov@omp.ru>) id 1sZQIw-0006Bk-7e
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Aug 2024 07:32:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=axE+jbd7RQC5wPWslqcJEBZKojhg7GQ/nt7SfAYBDC8=; b=F5cCDGPeGEQqJI7m41BXsBtIpB
 3pzbtyt4nH10F3fYyDYvEv9HVEJBF2mkG+2bpXA6MbblGn3B+AFXZ5/kgOuHer5qYlLS/Y0UZ64Ae
 5C6BhKcSu6BFahcBlFV/l3BY0Jbm84AbzEURi/J9AGYf43uWLBFzVDoD5Nopyxs+ySQo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=axE+jbd7RQC5wPWslqcJEBZKojhg7GQ/nt7SfAYBDC8=; b=I
 0RayhoV2bisf36LlRmJwJdq/r8sacOPWCFpWXuEtIor4U7Qi9Y+6mSzv3/WnjYQsyxqEevE9H/O4y
 OW+83wMypPdavCuwi6DWtFLOxyk24imvhepkIjJ8wHbGTBhfcJvrexiLF1lX1HHoNtv4LYRzx9by3
 i3nS8xDub+gxUV4A=;
Received: from mx01.omp.ru ([90.154.21.10])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.95) id 1sZQIs-000128-PF
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Aug 2024 07:32:54 +0000
Received: from inp1wst083.omp.ru (81.22.207.138) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 1 Aug
 2024 10:17:19 +0300
From: Roman Smirnov <r.smirnov@omp.ru>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
Date: Thu, 1 Aug 2024 10:17:07 +0300
Message-ID: <20240801071707.8296-1-r.smirnov@omp.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [81.22.207.138]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 08/01/2024 06:59:26
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 186817 [Jul 31 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.4
X-KSE-AntiSpam-Info: Envelope from: r.smirnov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 24 0.3.24
 186c4d603b899ccfd4883d230c53f273b80e467f
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: omp.ru:7.1.1; inp1wst083.omp.ru:7.1.1; 81.22.207.138:7.1.2;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; 127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: ApMailHostAddress: 81.22.207.138
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 08/01/2024 07:03:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 8/1/2024 5:04:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: If invalid data is copied from user space and if GET_SEGNO()
 returns NULL_SEGNO an overflow is possible. Add checks for invalid values.
 Found by Linux Verification Center (linuxtesting.org) with Svace. 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.154.21.10 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.154.21.10 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [90.154.21.10 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1sZQIs-000128-PF
Subject: [f2fs-dev] [PATCH] f2fs: file: add checks to f2fs_ioc_flush_device()
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
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, lvc-project@linuxtesting.org,
 linux-kernel@vger.kernel.org, Karina Yankevich <k.yankevich@omp.ru>,
 linux-f2fs-devel@lists.sourceforge.net, Roman Smirnov <r.smirnov@omp.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If invalid data is copied from user space and if GET_SEGNO()
returns NULL_SEGNO an overflow is possible.

Add checks for invalid values.

Found by Linux Verification Center (linuxtesting.org) with Svace.

Signed-off-by: Roman Smirnov <r.smirnov@omp.ru>
---
 fs/f2fs/file.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 168f08507004..1b9c4fee9db1 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3093,6 +3093,9 @@ static int f2fs_ioc_flush_device(struct file *filp, unsigned long arg)
 		start_segno = dev_start_segno;
 	end_segno = min(start_segno + range.segments, dev_end_segno);
 
+	if (start_segno > F2FS_MAX_SEGMENT - range.segments || end_segno == NULL_SEGNO)
+		return -EINVAL;
+
 	while (start_segno < end_segno) {
 		if (!f2fs_down_write_trylock(&sbi->gc_lock)) {
 			ret = -EBUSY;
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
