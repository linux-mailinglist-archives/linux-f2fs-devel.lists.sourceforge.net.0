Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 318DC790A34
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  3 Sep 2023 00:56:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qcZX4-0006Gm-Lf;
	Sat, 02 Sep 2023 22:55:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1qcZX3-0006Gg-Mi
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Sep 2023 22:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7dkeKxvnG3MTx4+4E1NLKMTEPXewCC2p0lfaNVq3umM=; b=I1f9ZwTv0JqDEulhSCsqdhdss/
 BJTA4vsTYbs967RcYB35NgD5pggNMmp9+vWds8RRu7RJrwyhlDVTLbZgRrXIa/9TrC2tg8i2WPCZJ
 qJZi/RDI7ULy8iUUZ1GJTiWkxFBR8kSOOjL3dd+1+ZAZX+ygNtxdr8oQO+bqbeEctvhk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7dkeKxvnG3MTx4+4E1NLKMTEPXewCC2p0lfaNVq3umM=; b=jFBkyKuVrSVCR2mZTQfzKEqblx
 m0341vBOy59AT6z+UghYi+3qBmwGdtd7SHifEd62vSAhPx38sponezOKjJKR3lFlQUUEL71dZijYn
 fhmd4+VhEP0wdKZYQSm29cUF08bFubN7NiQ/OlrTYz0NOvm2vmeJFwn3UNNRNwTdESoY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qcZWy-0000jW-Rf for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 Sep 2023 22:55:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5987160EF3;
 Sat,  2 Sep 2023 22:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA3AEC433C7;
 Sat,  2 Sep 2023 22:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693695346;
 bh=w4RQ86thUvRYT0+27KBQvBs+IXLSffwIqALcZMH+WPg=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=sERHQE9fwTHtoXmL4KCRkVzXtKRsgYCE2UQwHCuaACgN4HcpImE5Xi+znKmeViY9x
 gl8MnQ+8kjHnpdxLYZeyCxTbFOwWZ1QupfBFfwyvJHE72CAdL5N2VgR18aqH1SQEmi
 uZg2m4c+cNCDIAarpwQPuzFC9vYiqC05RpcPFJcJqGyst4z+XKkn5qRbsUh/PZ5d7L
 IE9ZNr778cmrHPbB0OGHul3Dn+JFTOKPTm37fbmNjpkMqA19n844mcv56nP2SsO9N5
 8g91sKBrnPpZpOBK037Mv41kB5fs7+KRWkKAd65AyViwCot0+9+7U93UjacO9BaL5Q
 INUIXQedFClAg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 9D982E26D49; Sat,  2 Sep 2023 22:55:46 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <ZPJ7P1J+jbyL6Mve@google.com>
References: <ZPJ7P1J+jbyL6Mve@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZPJ7P1J+jbyL6Mve@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-6-6-rc1
X-PR-Tracked-Commit-Id: 3b7166121402a5062d18dcf4e3bce083fb9e4201
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 92901222f83d988617aee37680cb29e1a743b5e4
Message-Id: <169369534657.28928.8759587724835660824.pr-tracker-bot@kernel.org>
Date: Sat, 02 Sep 2023 22:55:46 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Fri, 1 Sep 2023 17:01:03 -0700:
 > git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-for-6-6-rc1 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/92901222f83d988617aee37680cb29e1a743b5e4
 Content analysis details:   (-5.2 points, 6.0 required)
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qcZWy-0000jW-Rf
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 6.6
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The pull request you sent on Fri, 1 Sep 2023 17:01:03 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6-6-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/92901222f83d988617aee37680cb29e1a743b5e4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
