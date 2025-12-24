Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DABCDD106
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Dec 2025 22:00:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:MIME-Version:Date:Message-ID:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aaa6AdqH4WN6+ztXwwZ9u/iwZu9jk6jSdfDGRCBGZjk=; b=cQYPHMb1HEOndRgVSRQRchTmMC
	XxuUQ3mTYjtfKtOfH0uwqhgFsd+L8EP8H3V/7K02g0dLc2HT+VLcOLKTCkadl8BhFIWbc5m1Le+XE
	K1nC+q3nvmPVkbteZmGFgbb3jDUfUsN/MRZeSZCKEcBKXDtWpVs3YPXQB0Do0zm/TWFU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vYVxI-0002JO-6L;
	Wed, 24 Dec 2025 20:59:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <s.shtylyov@auroraos.dev>) id 1vYVxD-0002JE-PW
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Dec 2025 20:59:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Subject:From
 :CC:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g0hKghddLCgFad/maj6Kky1nSM5DGtYesb7rTW2OzOw=; b=ChFKBMXxfbfy7qvk6sRAJ98B32
 2ks4Hbga+UwgTv99ReKZqA7HTFtimZhsf5GGVcrZTxAekb/gw8b49TKV/EIwjkxLmbuHMsTqFquYW
 p3O74nEKB5lUPqPj14wVbtTEKDPPhqGD2t/FoSGLkUMI3kVymgOm3qKkDV8Y6VHwaW1g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Subject:From:CC:To:MIME-Version:
 Date:Message-ID:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=g0hKghddLCgFad/maj6Kky1nSM5DGtYesb7rTW2OzOw=; b=W
 l9XPZfDutK6Vylm97mhLh0/CF3dg8hArUu8HT7ACbN/BXrU2nkdaFTpJWovTF854SrRqE5i6W4gY5
 dxDXWR72EKyeAUxQajbgkSIfJbuCCPK10F4rssGflrMgwO7hHe7ikjAQXVpo3Yxuk2KdYlpRg2S7N
 ioqFUl3Y0OORUbYw=;
Received: from [95.181.193.9] (helo=mail.auroraos.dev)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vYVxC-0000iw-B1 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Dec 2025 20:59:31 +0000
Received: from [192.168.2.104] (213.87.139.250) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Wed, 24 Dec
 2025 23:44:14 +0300
Message-ID: <938c75a4-b825-4341-b208-44de1dc5a7fd@auroraos.dev>
Date: Wed, 24 Dec 2025 23:44:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
X-Originating-IP: [213.87.139.250]
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)
X-Spam-Score: 1.3 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In __is_valid_data_blkaddr(), an *if* statement is used where
 a *switch* statement clearly fits better... Signed-off-by: Sergey Shtylyov
 <s.shtylyov@auroraos.dev> --- This patch is against the dev branch of Jaegeuk
 Kim's f2fs.git repo. 
 Content analysis details:   (1.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1vYVxC-0000iw-B1
Subject: [f2fs-dev] [PATCH] f2fs: use *switch* statement in
 __is_valid_data_blkaddr()
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
From: Sergey Shtylyov via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Cc: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In __is_valid_data_blkaddr(), an *if* statement is used where a *switch*
statement clearly fits better...

Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
---
This patch is against the dev branch of Jaegeuk Kim's f2fs.git repo.

 fs/f2fs/f2fs.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 53cbce96f126..ea2b224150ce 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3680,10 +3680,14 @@ static inline void verify_blkaddr(struct f2fs_sb_info *sbi,
 
 static inline bool __is_valid_data_blkaddr(block_t blkaddr)
 {
-	if (blkaddr == NEW_ADDR || blkaddr == NULL_ADDR ||
-			blkaddr == COMPRESS_ADDR)
+	switch (blkaddr) {
+	case NEW_ADDR:
+	case NULL_ADDR:
+	case COMPRESS_ADDR:
 		return false;
-	return true;
+	default:
+		return true;
+	}
 }
 
 /*
-- 
2.52.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
