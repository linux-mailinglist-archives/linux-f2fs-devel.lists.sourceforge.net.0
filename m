Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D91773008
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Aug 2023 22:00:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qT6PB-0005b5-8n;
	Mon, 07 Aug 2023 20:00:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1qT6PA-0005az-9x
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 20:00:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9e7LszUGhb7M+S6HVQiad6awKnZriU9D4uNeuqakDt8=; b=CZ0PFKP2cxu+a0ijLxjaMa66fN
 rxN3C7yvK1dKCTpukeqeVaNlYPf7rMnYkQjZ9irhBiPbLTdiTwajQVi/n7oiTMa79mzAOZq2lwY10
 oCGp82HNtYY7z+w9Qm/FCqTCnRoOtuUawfO6C94xNpSe65NT/hqT4JHFftxZq7GapyC0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9e7LszUGhb7M+S6HVQiad6awKnZriU9D4uNeuqakDt8=; b=A
 DdAz8glhuNfDzlTljyoFoFEnV5KWpP3kCxwhOtz4xM0dWjNtKR0vu+PFjUqO1S/Zn0PWS1aB1AY7w
 oBDbTVTTnuXya2eGvHD41HAHmbCWIbe1mpopwC9eCCMA2NhMVBRGp6jXsGxk/sdboIf4YGhJua+ql
 4tdfsrNBbEHpe4UY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qT6P9-0003CT-M9 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 20:00:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 05B38621BC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  7 Aug 2023 20:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6EA6EC433C9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  7 Aug 2023 20:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691438433;
 bh=LPhPPQs+qoESIqq9evIcyBHP2H/ENrYsherB0XcXxLA=;
 h=Subject:From:Date:To:From;
 b=ThhQXt+i7iyv0D7rKAaOBimW1kCyTN32r8Wk1i/WQosFYQH69zl5lQiglvYAZXoIi
 c6/pSQF7mi+xa1yisg36kLxTSyTcywIsb0F3P4VisbNnOzdLkpqF9YkORCseveXbOv
 iCplCsApLoSlpjm0RXyjgLutxxmKQrO5XrC/zOf8QyIikCpDrW0y1+ZAWz1k1y3UQn
 p+X9zPL6l4VsdZjdbfcV9nd1tX4C6oBN8ksKtXc93Y7cOpM5j8iNub1ICclNLQnEkL
 fDN+obrhZfLP+iHtscS1nLveIcD8G5zm6HEiNi68mTVd7APotnO949ODCZJ8RsGMGy
 ICZt9eeIj3+CA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 4FF78E505D5 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  7 Aug 2023 20:00:33 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <169143843326.8972.11192002160471015008.git-patchwork-summary@kernel.org>
Date: Mon, 07 Aug 2023 20:00:33 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] Revert "f2fs:
 clean up w/ sbi->log_sectors_per_block" Submitter: Jaegeuk Kim
 <jaegeuk@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/ [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qT6P9-0003CT-M9
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

Patch: [f2fs-dev] Revert "f2fs: clean up w/ sbi->log_sectors_per_block"
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=773836
  Lore link: https://lore.kernel.org/r/20230807195219.371131-1-jaegeuk@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
