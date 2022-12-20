Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 423AD65256C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Dec 2022 18:17:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p7gFF-0000KB-Da;
	Tue, 20 Dec 2022 17:17:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <s.shtylyov@omp.ru>) id 1p7gFA-0000K4-6a
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Dec 2022 17:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-ID:CC:To:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=imbAOY3T7mH/tQi0uczJlXYr4gaLEeUPuGsh7bAYb8w=; b=Jwws2TtmoWTdoBuk920dZ27jfx
 1bHH2rHP/rGdcxLgx2nOd/f/eKZjP6JKOpXsob+i4iXpdd42iwfuuX9f0nxXFO5bVSac/2OhaI7oY
 ozB/vjCgb/a1bLJ5is7PrTc4RRVyadowwXLyGtGtpJwWCJgfUNTIhHQEO8sTnTIUMk0w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:CC:To
 :Subject:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=imbAOY3T7mH/tQi0uczJlXYr4gaLEeUPuGsh7bAYb8w=; b=S
 XCY2tNBLvrNosKbtcYQ8z0CeMH2ZPoi56jdSCu/R9u3pWJfMbnqW+cEI7g8Osl8d+2vfVF/YadgGq
 0sqntn/qjvym7AW9gBD26KdOlOPEyjDx2/2PrLhFjiqhASTuSoKW56wCmwCe57fL1gpngNiPpjbze
 PBqfL8o+0QanOsE8=;
Received: from mx01.omp.ru ([90.154.21.10])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.95) id 1p7gF8-005yeN-EL
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Dec 2022 17:17:31 +0000
Received: from [192.168.1.103] (31.173.87.192) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.986.14; Tue, 20 Dec
 2022 20:17:15 +0300
From: Sergey Shtylyov <s.shtylyov@omp.ru>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
Organization: Open Mobile Platform
Message-ID: <a3e9c819-4fb5-1340-77df-f76332f1fb76@omp.ru>
Date: Tue, 20 Dec 2022 20:17:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [31.173.87.192]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.59, Database issued on: 12/20/2022 17:00:54
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 174313 [Dec 20 2022]
X-KSE-AntiSpam-Info: Version: 5.9.59.0
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 502 502 69dee8ef46717dd3cb3eeb129cb7cc8dab9e30f6
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.87.192 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.87.192 in (user) dbl.spamhaus.org}
X-KSE-AntiSpam-Info: d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 127.0.0.199:7.1.2; omp.ru:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.87.192
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 12/20/2022 17:03:00
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 12/20/2022 2:00:00 PM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In expand_inode_data(),
 the 'new_size' local variable is initialized
 to the result of i_size_read(), however this value isn't ever used, so we
 can drop this initializer... Found by Linux Verification Center
 (linuxtesting.org) with the SVACE static analysis tool. 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1p7gF8-005yeN-EL
Subject: [f2fs-dev] [PATCH] f2fs: file: drop useless initializer in
 expand_inode_data()
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
Cc: lvc-patches@linuxtesting.org, lvc-project@linuxtesting.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In expand_inode_data(), the 'new_size' local variable is initialized to
the result of i_size_read(), however this value isn't ever used,  so we
can drop this initializer...

Found by Linux Verification Center (linuxtesting.org) with the SVACE static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
This patch is against the 'dev' branch of Jaegeuk Kim's F2FS repo...
Reposting with ISP RAS mailing lists CC'ed now...

 fs/f2fs/file.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: f2fs/fs/f2fs/file.c
===================================================================
--- f2fs.orig/fs/f2fs/file.c
+++ f2fs/fs/f2fs/file.c
@@ -1697,7 +1697,7 @@ static int expand_inode_data(struct inod
 			.err_gc_skipped = true,
 			.nr_free_secs = 0 };
 	pgoff_t pg_start, pg_end;
-	loff_t new_size = i_size_read(inode);
+	loff_t new_size;
 	loff_t off_end;
 	block_t expanded = 0;
 	int err;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
