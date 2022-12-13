Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5599164AEDF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Dec 2022 06:00:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4xP1-0005m9-7b;
	Tue, 13 Dec 2022 05:00:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1p4xOr-0005m1-2e
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Dec 2022 05:00:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M10wOzKwzjMpkSBB166N0fAo1X8kdTzzQRkl4O2hjC8=; b=ky1vo9mcH1qOUdEtMPWKpfkakm
 XSIDrsAwBluTha36EEy5DU9kf6xo3995penIanBUNPXPgU/z/AjxYZgQMd1pomp7D0hgoKOpDOqEC
 Mq8xaTIijfQbevwtmbCj5grE/4G6K6bKyWGxjj2UwJL2k5UKvtnaDRLMIPy2qm+DEZl4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M10wOzKwzjMpkSBB166N0fAo1X8kdTzzQRkl4O2hjC8=; b=j8Frl39AKfxgErikzlWsIkjy8R
 g5yKpJ44/Ahyxd1L/cm1+gDZE7Mb6Rn3yVE0gSeR+buBQPjnF74OHrnoVZrhcH2kyHA69xwkzq6qM
 Gw9hQqwB924DyENgmZJy+Xt1LBB3gxFyS31fh1TpfXlTHhzQzcxh00LLlZMMtUb5XIQ0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4xOp-00FPhq-46 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Dec 2022 05:00:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 31843B810D9;
 Tue, 13 Dec 2022 05:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA7F8C433D2;
 Tue, 13 Dec 2022 05:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670907605;
 bh=bWHTLgFxQc2o39iSKlfIsi3HueJcoojwB6FD6+BZaL4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=UACdc+N63MewVjY1V87dLL3dUoq4j35AW4bq3IwmzddfYe0NAX8dTXtLGXrvkAN3L
 NsOAZnPyfr8JAUj/Vo7+rPZ/q1tz1vMlZ+12mVFjAOMTOYTzt1Ge7gGSi3OQUg/ToU
 y4eko5o2ShNW7a9wl6lMBVHezZU0vQ4NLQ6VZPyu5jbt5MvoQo2aTlvm1V6Vgt3KIX
 TysN2qxL6Ymi4z0bJbJIrwZdLOPWVOqBsT2YwuvQeQeRBrF31DrWFDkN6fZn4VhY8W
 /awKEYGXDmBksT3tH3Crh2I6OVdws60pNX/k+7cAKkyg49mjpSPam5UJTrr2jcSnvp
 cdi2ZNPGvS33g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 BEB28C395EE; Tue, 13 Dec 2022 05:00:04 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <Y5ayAsXkTF3jK13s@sol.localdomain>
References: <Y5ayAsXkTF3jK13s@sol.localdomain>
X-PR-Tracked-List-Id: Linux MTD discussion mailing list
 <linux-mtd.lists.infradead.org>
X-PR-Tracked-Message-Id: <Y5ayAsXkTF3jK13s@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 tags/fscrypt-for-linus
X-PR-Tracked-Commit-Id: 41952551acb405080726aa38a8a7ce317d9de4bb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8129bac60f30936d2339535841db5b66d0520a67
Message-Id: <167090760471.4886.14328396193429514472.pr-tracker-bot@kernel.org>
Date: Tue, 13 Dec 2022 05:00:04 +0000
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Sun, 11 Dec 2022 20:45:54 -0800:
 > https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus
 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/8129bac60f30936d2339535841db5b66d0520a67
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p4xOp-00FPhq-46
Subject: Re: [f2fs-dev] [GIT PULL] fscrypt updates for 6.2
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Sun, 11 Dec 2022 20:45:54 -0800:

> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8129bac60f30936d2339535841db5b66d0520a67

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
