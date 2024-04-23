Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8BE8AF5BB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Apr 2024 19:40:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzK8S-0003tY-Fc;
	Tue, 23 Apr 2024 17:40:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1rzK8C-0003tD-Ra
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Apr 2024 17:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PWhwhPCOT/ACtATt1Taxdnij/M9AwSvO5YxEFj9h/6c=; b=Uix6tL5IZAI1eO8XCqHOyZUMuU
 hsvchUo0GHH9gRciz+HJPrphCNrOLeJWM7JrGY4ZAokos84ngIiM58DbVj+lrxcdmfYVa3cAreKGd
 f6FBJ88YfQIjrfH+uZkUNb03lmQ2AYzAEbYxfzazHmXP4Cr4hGmQZk7lzP0Mehuph78w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PWhwhPCOT/ACtATt1Taxdnij/M9AwSvO5YxEFj9h/6c=; b=Y
 DohUhSdXyIX49rxv1BNA6kxFgJ2U0A7NDHsRmKwqEONSy0wyG1ix95pWFkYr11Py8GWRt2Son/Uv+
 rvIkV80iPt+UW3HYKTXbfKz9KHb2pRQyKsgATROXozBbTpXRr/eE+xqDQH3eKxjQQQXXD/IEsaYXB
 YiIE7GuB5EkSAao4=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rzK8B-0004VD-TE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Apr 2024 17:40:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A72A1CE1292
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 23 Apr 2024 17:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB04FC116B1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 23 Apr 2024 17:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713894028;
 bh=zQ+yPtY65sEm8nwl4J0bK/hkNk5qPDl+o8IysesT5iE=;
 h=Subject:From:Date:To:From;
 b=a2Sut3al945nOzuejKoxl3P64E4Fp5AukVkbdpUeAWyai+AJqsd4WksTVFo2l9IqN
 WqqGbps/55CW7hpBNqwkjOw48QW6MCK1NktGjSJYoI5OS1S/pUVrHWXiEJiOD2LIuz
 odb7/H45dqpJOBLZckV+HRTxiTtoVyVguDgy3jOfBg7O1SI8VTLw5WyKT0vKuNfgT3
 loVZjKIp5q1S+oUHPc8L8nIbiAka+5NC3e7GGcvtjGTFTsBrLBb8biC6MNDsWgPoQZ
 Me7hCmesYGqkVQl+9m79cbiOQ3C5Ooj3rYoDXmw7ypGOYE8lqgx7ZAwC10DuZQw0My
 ujdTP6GXmTg/g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B9929C433E9 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 23 Apr 2024 17:40:28 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171389402869.11756.16914371826630287318.git-patchwork-summary@kernel.org>
Date: Tue, 23 Apr 2024 17:40:28 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Series: [f2fs-dev,v2,1/4] f2fs:
 convert f2fs_mpage_readpages() to use folio Submitter: Chao Yu
 <chao@kernel.org>
 Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=846491
 Lore link: htt [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rzK8B-0004VD-TE
Subject: [f2fs-dev] Patchwork summary for: f2fs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

The following patches were marked "accepted", because they were applied to
jaegeuk/f2fs.git (dev):

Series: [f2fs-dev,v2,1/4] f2fs: convert f2fs_mpage_readpages() to use folio
  Submitter: Chao Yu <chao@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=846491
  Lore link: https://lore.kernel.org/r/20240422062417.2421616-1-chao@kernel.org
    Patches: [f2fs-dev,v2,1/4] f2fs: convert f2fs_mpage_readpages() to use folio
             [f2fs-dev,v2,3/4] f2fs: convert f2fs_read_inline_data() to use folio
             [f2fs-dev,v2,4/4] f2fs: convert f2fs__page tracepoint class to use folio

Series: [f2fs-dev,1/2] f2fs: fix comment in sanity_check_raw_super()
  Submitter: Chao Yu <chao@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=844949
  Lore link: https://lore.kernel.org/r/20240416072108.5819-1-chao@kernel.org
    Patches: [f2fs-dev,1/2] f2fs: fix comment in sanity_check_raw_super()
             [f2fs-dev,2/2] f2fs: remove unnecessary block size check in init_f2fs_fs()


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
