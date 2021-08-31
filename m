Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 788CA3FCCEA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Aug 2021 20:20:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mL8MV-0001UJ-2o; Tue, 31 Aug 2021 18:19:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1mL8MT-0001Tn-Q9
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Aug 2021 18:19:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GBMWj5WYc4HTgIUMbLNt2NxYYru0lOtxms512T4jCEk=; b=gDUDQcyRtw9uVFvQyxj2y/uhXi
 TIrH84nzn6fKEInjB47AaUxKRnWDiJ7igjLAonAl3Lq4spn5h5xxiifdeOBIf5phFUdGvggNQEBkc
 6OiMhDK15DpBd5aQRe77r5Mne0CrPltrncAQy3OzSIzUqcOgsaU2kdxVMGXM5r1hBSSs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GBMWj5WYc4HTgIUMbLNt2NxYYru0lOtxms512T4jCEk=; b=YtLg4pZiAmp/feBjSvIpmSnAQ9
 tz5nXcu13cWuDBJCNE1dJznuaz8TRk/gqsbYVGZtCRzbWCmA9KAAW7gemWGAUNijEpNR1sYDu8IoP
 9PnzJM4ZkLuS4vXAKb/bgry7CNifXHlRUjC//wOX6shpn52nuyyW8rBvTYNH28tZqMXg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mL8MR-009K4E-K4
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Aug 2021 18:19:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id ADE2061051;
 Tue, 31 Aug 2021 18:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630433971;
 bh=PgM+rDs46+2K+qL4znNPoYRobm/RKsxxaeXjArovSN8=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=SWOFg1QAapkZgOnNA55lnZXl0M1sBb7SznJoScFIfq/GCb5UzGord2w7FpFz+0Iqo
 ErI9bpFhNW8BgCu1y21b9GDjnMI/oG0+gR4ICZ2vsW45Tn8V37mqWYeQsQi9HOo9GH
 +w8voK2ZTzcJco29BILtsx70Sofl/0SQgDm35+vmlA+0o2PYmkYg828wmGqMXIY7TA
 TJ0KWEjWx+TOdnyLRCfQb0yDSfu7N8BWPSlTo/eazDxoxocI6iST60/uxhwuShS1xt
 O4qt69qcDdH/pLAtNrx0qRd30oFL4aZ0zPWL6FNWLmvimhauUEZDQsAi5sRT9iA0ea
 aT1ruYletuzSQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9D47A60A6C;
 Tue, 31 Aug 2021 18:19:31 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <YS0LlXIhvZc4r5Vt@sol.localdomain>
References: <YS0LlXIhvZc4r5Vt@sol.localdomain>
X-PR-Tracked-List-Id: <linux-fsdevel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YS0LlXIhvZc4r5Vt@sol.localdomain>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
 tags/fscrypt-for-linus
X-PR-Tracked-Commit-Id: 38ef66b05cfa3560323344a0b3e09e583f1eb974
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cd358208d703fca446b52f3cf8f23c18f9e7705e
Message-Id: <163043397158.24672.5271221655251796062.pr-tracker-bot@kernel.org>
Date: Tue, 31 Aug 2021 18:19:31 +0000
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Mon, 30 Aug 2021 09:47:17 -0700:
 > https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus
 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/cd358208d703fca446b52f3cf8f23c18f9e7705e
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mL8MR-009K4E-K4
Subject: Re: [f2fs-dev] [GIT PULL] fscrypt updates for 5.15
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

The pull request you sent on Mon, 30 Aug 2021 09:47:17 -0700:

> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cd358208d703fca446b52f3cf8f23c18f9e7705e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
