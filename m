Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DE9BE4E3F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Oct 2025 19:40:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:To:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OxWzB7VA2rkdxlNveCLuNsVNxL+mrXPccbenztAlFRg=; b=Lht1u5InHz+XE0+WaJfAydCCFf
	hTxYF9qpZzk8HLZtVW+rF3WtBx1BWXPItrgT8UFRbOF0J1nBFheeMsh+JyrDacy44CC3+32Ea6cRL
	jMKAbMcJgK+A3sWxlHRPf8Y1mCcmt+i1pS8Y6G1QFDlLyEBgwrgbsmWOWT7jwguDj9jk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v9RxB-0005dg-GV;
	Thu, 16 Oct 2025 17:39:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1v9RxA-0005dZ-7g
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Oct 2025 17:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CG2ubJ9Wlb+vJQAd4ZW7Avo24ai9Zo9K7kupHv37EZA=; b=Kk0CpypVXmEl2CgiO5kQfqOsX+
 17Lig/8AGzuBeZQ9GmeXgylQcKgVfrs0kDDsq+xQ383UivS+/k8tOpyyXm303i46OT7tQ7eMOom7G
 cZ5vCR1JMxW2iHmJCqymv5fR/pkCwo6elNBtdPQHDQ9mSrGTzz6omjM1gV5ot0GiS+RU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=CG2ubJ9Wlb+vJQAd4ZW7Avo24ai9Zo9K7kupHv37EZA=; b=J
 l7fANXV33GBYTM1OOruw6CnDCJXI221w/DUSPP/EoJ1PiRonUdgHxYcLBcmQKQYxMPu11MLK9mGC6
 min+SUtlHqo2SoM0a8N4M03Pe/XsnRAcyGNX+DL6Xpl1lNozFeLQx4eBa7bndFQeI0QftjxrceLGB
 PgbiMDrvokLErC7s=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v9Rx9-0007M2-NA for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Oct 2025 17:39:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5761143D4A;
 Thu, 16 Oct 2025 17:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1331CC4CEF1;
 Thu, 16 Oct 2025 17:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760636381;
 bh=eOq2qhTSMPD2ObFUJ67WfeOoa0dy5B3akOcSy4XfLeU=;
 h=Date:From:To:Cc:Subject:From;
 b=ZNbbHMAqqaHwVE8NGCSk5qWFMMJYCSSSwtuBrgETyhIkitAXW48z1nFJXGwPmHoMS
 Zag2hnp1byMgU4pHXHjgV/yykoR/VXuiaw+ADlIvjboxDloqo91GlPkq/2iOg5cdD8
 WQSdtfE4aBroHzji/bPOGSr6JvDexK/KJZLdsX/WpEzQOUPgfYtcpU08nXpmj8rAC6
 QqEilivsYurOYM3R1IYJq1lQAs9V/fQvxokrlUFedGdd8AiLGaJlWrm1oN5I2slTGf
 KRnYbTSS61kRqaeI3HsvLtbZnCu43fS5Sg1PhApJ2PLR8QS8X0Rrdk5aJSS5/QxYZF
 JsHqsq1gEPx6g==
Date: Thu, 16 Oct 2025 17:39:39 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <aPEt2-u8J16L9Xnk@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Could you please consider this pull request? The
 following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787: 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v9Rx9-0007M2-NA
Subject: [f2fs-dev] [GIT PULL] f2fs fix for 6.18-rc2
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Linus,

Could you please consider this pull request?

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-fix-6.18-rc2

for you to fetch changes up to 9d5c4f5c7a2c7677e1b3942772122b032c265aae:

  f2fs: fix wrong block mapping for multi-devices (2025-10-13 23:55:44 +0000)

----------------------------------------------------------------
f2fs-fix-6.18-rc2

This includes two urgent fixes:
1) iput() added by bc986b1d756482a causes soft lockup [1].
2) fix a wrong block address map on multiple devices.

[1] https://lore.kernel.org/oe-lkp/202509301450.138b448f-lkp@intel.com

----------------------------------------------------------------
Jaegeuk Kim (1):
      f2fs: fix wrong block mapping for multi-devices

Mateusz Guzik (1):
      f2fs: don't call iput() from f2fs_drop_inode()

 fs/f2fs/data.c  | 2 +-
 fs/f2fs/super.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
