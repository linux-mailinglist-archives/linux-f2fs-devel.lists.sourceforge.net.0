Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF902A475
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 May 2019 14:49:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hUW6g-0001aN-Bw; Sat, 25 May 2019 12:49:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuehaibing@huawei.com>) id 1hUW6e-0001a4-Ss
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 25 May 2019 12:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZPrUpajwlvm53fCDD9BgwrJmGQ5j/YD3uEkYnOZgnrI=; b=jb5nNrYt/rMWWVNJmQLm/IojY/
 nKkBdogav9UqN1fj9F37th9O1Oknn3Gi+Idh06cRBlDLxkddkywSnE8WImHHAn/rPHKSCwDDJBIBj
 eNr0dqqDeUhZ3mCxWAZaC4aKnS34FcZ7WjgMyGayCyYZ8IlXkX3iwbkNK3DY4l2k48s0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZPrUpajwlvm53fCDD9BgwrJmGQ5j/YD3uEkYnOZgnrI=; b=g
 Wn7Uz0GBBQ42Q8VAsGTWuFBfWqMfiowaiTRKq4WZ32UUbZfavwUh/msFO5yhFs+pA/dz4TRe6o7Vp
 OUfKBd+5/B12i6EG4MQ4zmqcIt6x492WnuOWp8KFhL8CY2Y+KY2tg7kAlRzsjamdUchemXdm9oflF
 yMjY8DEbSF7YW8/4=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hUW6b-00GVph-Ff
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 25 May 2019 12:49:00 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 20B5795D3C1EE8CA680D;
 Sat, 25 May 2019 20:48:50 +0800 (CST)
Received: from localhost (10.177.31.96) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Sat, 25 May 2019
 20:48:40 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <jaegeuk@kernel.org>, <yuchao0@huawei.com>
Date: Sat, 25 May 2019 20:48:09 +0800
Message-ID: <20190525124809.17424-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hUW6b-00GVph-Ff
Subject: [f2fs-dev] [PATCH -next] f2fs: Make sanity_check_curseg static
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
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fix sparse warning:

fs/f2fs/segment.c:4246:5: warning:
 symbol 'sanity_check_curseg' was not declared. Should it be static?

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 1a83115284b9..51f57393ad5b 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4243,7 +4243,7 @@ static int build_dirty_segmap(struct f2fs_sb_info *sbi)
 	return init_victim_secmap(sbi);
 }
 
-int sanity_check_curseg(struct f2fs_sb_info *sbi)
+static int sanity_check_curseg(struct f2fs_sb_info *sbi)
 {
 	int i;
 
-- 
2.17.1




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
