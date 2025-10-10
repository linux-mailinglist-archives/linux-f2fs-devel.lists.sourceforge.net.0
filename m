Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 99500BCBE45
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Oct 2025 09:17:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ds4vt39IfxuWIzPr9LRB12SAM32f4E50AqNSeR4xlqM=; b=aOC7tQCyae1SZIMaKsMWef7m51
	CeY1pixDeNHpCC1NpO5V2rVpzOl5npoAOi7aViv4yz0ZFBhr6AKO1RrNZmHKUVTIUWX4mCsUZcAQ+
	3K+thG3HdBa7eMDI7NzVNabmF59c7CUSvEU4IhjFB7s+ZYaybRi6/PHMSTSpxWrhiLdQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v77NC-0000XT-MS;
	Fri, 10 Oct 2025 07:17:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v77NC-0000XM-2k
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Oct 2025 07:17:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1r+bYr3Nh5+AN3kLHq80oceJReMazDKa9XPiU5ZvphM=; b=IsE8qngY2O3ljobE+9yh8NS4al
 nTkMX3YPeaBPOF1E9bbmUqbbKSMlh4F/vCV3ZzoLq8RNJn3ozXy/v65Qt9anUgU0W/nycPNquENJn
 QsHiu6AI7NiZzlI6iKW1b/V7nhJgzb/gVnFt8nSYsigbiGNVl1yT3qVQaOzdvBZSPC9I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1r+bYr3Nh5+AN3kLHq80oceJReMazDKa9XPiU5ZvphM=; b=GlHYaBU6x+rG/KURPkY6OtsbDu
 AM7DXomDHE5sBsQGNVOoNuIwk4QUO56xzgkgtv0vWVndU95C5COrsB5HZDEQ0xm7yO6phneRg67s8
 qsf3V1CzPOuS7Tr3/L/9Lt2JLI/m5mbwCmqWvuiB3gzc1AaI0SZPThCwWjrj9JvlafT8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v77NB-0002DH-HD for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Oct 2025 07:17:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D49F1624ED;
 Fri, 10 Oct 2025 07:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5740C4CEF1;
 Fri, 10 Oct 2025 07:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760080619;
 bh=24BbNjNVutb9XroUJnO513uTN9EY6uyhqOlpfNkxgs4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=sC/eSXYB7kb3NMGJwEbSJbdLv9+sz7xUfd2SmQvfw1CIcGw/6XTBkvDmNnOFHvlub
 QiB3/1UxnAJm7gWje46w/Sv+sLG/bZh4FEmpo601ewl8/kIMRNaaTIdgcvzFiMu31C
 /gocLTo/BtPsLRmpQWSq1unGMJDqeAAejgbRYLnl29f/32deMzbVMe0L4DHYajYORw
 azgAQPrCEmor7ApXRXSIjf+EQ4XV4/g2u7gYxqB9qPTLmDkNVaXtelkN6C6B7PuAMi
 vZc5DIs+ClRBOkDvBZbBAukMCnXfr2orGbnL0OfI/5MYk8e5aqBpJL2KwGvOQLorS/
 sUv67sGOjPZQA==
Message-ID: <1d8031b5-34c5-4d2f-8a70-b5055621380a@kernel.org>
Date: Fri, 10 Oct 2025 15:16:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "HONG, Yun" <yhong@link.cuhk.edu.hk>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <TYCP286MB3686D500C8AF350E0BE8B4F2C11BA@TYCP286MB3686.JPNP286.PROD.OUTLOOK.COM>
Content-Language: en-US
In-Reply-To: <TYCP286MB3686D500C8AF350E0BE8B4F2C11BA@TYCP286MB3686.JPNP286.PROD.OUTLOOK.COM>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Hong, On 9/29/25 19:43, HONG, Yun wrote: > Hi, > > I would
 like to kindly report a crash I encountered,
 identified as "WARNING in f2fs_init_xattr_caches".
 This issue can be reproduced with a Syzlang reprodu [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v77NB-0002DH-HD
Subject: Re: [f2fs-dev] [Crash Report] WARNING in f2fs_init_xattr_caches
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Hong,

On 9/29/25 19:43, HONG, Yun wrote:
> Hi,
> 
> I would like to kindly report a crash I encountered, identified as "WARNING in f2fs_init_xattr_caches". This issue can be reproduced with a Syzlang reproducer on the mainline version downloaded from https://www.kernel.org/
> For your convenience, I have included a sample crash report, the configuration file, and a reproduction program as attachments.

Thank you for the report!

I tried attached repro.syz & config.txt, however, I can not reproduce the bug.

If you can reproduce this bug, could you please help to reproduce w/ debug
patch as below? and dump full log once it reproduces.

From: Chao Yu <chao@kernel.org>
Subject: [PATCH] f2fs: add debug log

---
 fs/f2fs/xattr.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 58632a2b6613..81f591a45b41 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -845,10 +845,18 @@ int f2fs_init_xattr_caches(struct f2fs_sb_info *sbi)
 	if (!sbi->inline_xattr_slab)
 		return -ENOMEM;

+	printk("%s: slab_name: %s, %u:%u, %p\n", __func__, slab_name,
+				MAJOR(dev), MINOR(dev), sbi->inline_xattr_slab);
+
 	return 0;
 }

 void f2fs_destroy_xattr_caches(struct f2fs_sb_info *sbi)
 {
+	dev_t dev = sbi->sb->s_bdev->bd_dev;
+
+	printk("%s: %u:%u %p\n", __func__, MAJOR(dev), MINOR(dev),
+						sbi->inline_xattr_slab);
+
 	kmem_cache_destroy(sbi->inline_xattr_slab);
 }
-- 
2.49.0

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
