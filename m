Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF2B9845C3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Sep 2024 14:16:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1st4TJ-00066m-5U;
	Tue, 24 Sep 2024 12:16:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <n.zhandarovich@fintech.ru>) id 1st4TI-00066g-BJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Sep 2024 12:16:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9rY5fpuEyJRnumCdsyQyKeJ+g6IdcaPoDi8eTpTCw2U=; b=RWGxw8s38pDBY7sbLKGu9wXhvM
 BY3jTEFYMxb1d5fdEI7zH5p8PMYBHSzIZ93wEUXGQtxJ9eRDOKsJgoC32wlTz0GCgB7Ifg1hiOYYX
 7TiW9nWGtTTBKim45C3J2q0sf4j3iOJKzhWxr7qDyBaKLQGo8mCMHhUsrPiYhQ8Sag7k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9rY5fpuEyJRnumCdsyQyKeJ+g6IdcaPoDi8eTpTCw2U=; b=i
 GO32PoTa8WC9gx52qQG1OjaaZI5JbnRz1VazO5zBPE6w70KKraTNts8TPiqViTCxIzo51zLaJkhQb
 CD8SQQjyup/PTB9L+aRpRFxf0+3/qQ9a6YjwA6+Qm4ePQISR8yttlSelAr+QezPTw3XhcWeOLkiJT
 47mbeheH1dZmjwjU=;
Received: from exchange.fintech.ru ([195.54.195.159])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.95) id 1st4TG-0007Po-4h
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Sep 2024 12:16:47 +0000
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 24 Sep
 2024 15:04:15 +0300
Received: from localhost (10.0.253.138) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 24 Sep
 2024 15:04:15 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: <stable@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 24 Sep 2024 05:04:10 -0700
Message-ID: <20240924120411.34948-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.0.253.138]
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch addresses an open issue of buffer overflow in f2fs
 function stat_show(). On the off chance that si->sbi->s_flag had one of its
 bits (on the higher end) set to 1, for_each_set_bit() will loo [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1st4TG-0007Po-4h
Subject: [f2fs-dev] [PATCH 6.1 0/1] f2fs: convert to MAX_SBI_FLAG instead of
 32 in stat_show()
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
Cc: lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch addresses an open issue of buffer overflow in
f2fs function stat_show(). On the off chance that si->sbi->s_flag
had one of its bits (on the higher end) set to 1, for_each_set_bit()
will loop more than s_flag[] can afford, leading in turn to
erroneous array access.

The issue in question has been fixed in commit 5bb9c111cd98
("f2fs: convert to MAX_SBI_FLAG instead of 32 in stat_show()") and
cherry-picked for 6.1 stable branch.

Modified patch can now be cleanly applied to linux-6.1.y. All of
the changes made to the patch in order to adapt it are described
at the end of commit message in [PATCH 6.1 1/1] f2fs: convert to
MAX_SBI_FLAG instead of 32 in stat_show().




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
