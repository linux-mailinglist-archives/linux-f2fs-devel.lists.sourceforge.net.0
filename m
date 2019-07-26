Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AFED576005
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jul 2019 09:43:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hqutD-0006Ar-8r; Fri, 26 Jul 2019 07:43:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hqutC-0006Al-Kl
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Jul 2019 07:43:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=olsqJs+2cUiMs7y9c6ISTcueQJVp76Q5V5pe6xoamDI=; b=IjnAM9NargIcMPBfarM1ApP5NZ
 JPJJuUVeuA0HwE6VUoDC0aOpC4yzil6BrKSBQWpPsMHKs0ei//vflGuCWZEqcM9HFkgAkw8yC8OIH
 nJlUqs6PsVivI1e4c8pL3fI6THOV91Wyn5ZzyJUeF/L1dHX8NG2g4Q5YgxqbTiZmRlbE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=olsqJs+2cUiMs7y9c6ISTcueQJVp76Q5V5pe6xoamDI=; b=H
 1NZU4kcTNiblRYmWZd52CAOK5MaAo3yJKtz4QDF7NyYD5WweN46yEPiKXZeEWSZreF2+fnVOPiahN
 Y0VP1z34U/YYt0Zx6/t4Tml4Fp5CnGXKIHgqpg+3A0vmVdb5GpwjvP2aV6dIZ+GPnsDoUlN7LZtsh
 SnkgA6a/iHX/3k6M=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hqutA-0031Gj-1k
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Jul 2019 07:43:42 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 5AE36A10F49F44F065CE;
 Fri, 26 Jul 2019 15:43:29 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Fri, 26 Jul 2019 15:43:19 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 26 Jul 2019 15:43:17 +0800
Message-ID: <20190726074317.4416-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hqutA-0031Gj-1k
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid call kvfree under spinlock
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

vfree() don't wish to be called from interrupt context, move it
out of spin_lock_irqsave() coverage.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/f2fs.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 29da1ea3e160..529b32f81c6b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1643,6 +1643,7 @@ static inline void clear_ckpt_flags(struct f2fs_sb_info *sbi, unsigned int f)
 static inline void disable_nat_bits(struct f2fs_sb_info *sbi, bool lock)
 {
 	unsigned long flags;
+	unsigned char *nat_bits;
 
 	/*
 	 * In order to re-enable nat_bits we need to call fsck.f2fs by
@@ -1653,10 +1654,12 @@ static inline void disable_nat_bits(struct f2fs_sb_info *sbi, bool lock)
 	if (lock)
 		spin_lock_irqsave(&sbi->cp_lock, flags);
 	__clear_ckpt_flags(F2FS_CKPT(sbi), CP_NAT_BITS_FLAG);
-	kvfree(NM_I(sbi)->nat_bits);
+	nat_bits = NM_I(sbi)->nat_bits;
 	NM_I(sbi)->nat_bits = NULL;
 	if (lock)
 		spin_unlock_irqrestore(&sbi->cp_lock, flags);
+
+	kvfree(nat_bits);
 }
 
 static inline bool enabled_nat_bits(struct f2fs_sb_info *sbi,
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
