Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE1550E7A7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Apr 2022 20:00:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nj308-00035r-VV; Mon, 25 Apr 2022 17:59:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1nj307-00035i-Lm
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Apr 2022 17:59:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oi3JTYXS0N7sEtIzNsVu7C8F1UI/Nd34dnADIWEU7ys=; b=O3jurHdPAN6is7sg6RRrTZopz4
 nQq1E0HTduWjwQUodeJwIg3lENw/Ww2u+fl3rd/Wr7Hzs5nU/kozccZ//THflaql5fwuNGOIuyh1c
 x8PiE1tQva7LFG+E6E7dSRePZyyACsCe8a+tovOvo1msqpyxblidkMms/0WJdQ3hUFTk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oi3JTYXS0N7sEtIzNsVu7C8F1UI/Nd34dnADIWEU7ys=; b=H0mon78o76zRDe+Lt4BCvSxB+L
 O176Kd99Kmr0lUPJEj/CEraQKCFLwrNFS/Qwf8ltT3osnq5vIkK01pzxaxy3ohPwBtU0SJ+/WpGsx
 /sbDOKuyOwCHUT+1hqYVNmIvvVreJpk8Az38igrvMVMmCAa0iiFFm7V7UQwtPe0YgjC0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nj307-009vgY-Qq
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Apr 2022 17:59:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6E72F61626;
 Mon, 25 Apr 2022 17:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3042C385A4;
 Mon, 25 Apr 2022 17:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650909589;
 bh=CMsi/XNPu5s69QtgKwOQHpzQ+ml8kfcgdzDF2vVjX+k=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=GNX11SRn9NE+uGSn6prin2vKZlR7tNap1d7PfxBFhXzubyJs9z8CMvqg9MYbnt/Y3
 /lOefT0rQPFo2NMMGGXoKemLBemsLIuVwYqyGtmEPcKyX/O1W/Oox/YYkabP5jMQyD
 E9+FF2p3OYkq0RSKnLPMHZP/PTxoDG7PbRQFFSgkL7pbLatHpfuoJ0YazPyB63yaBA
 CJbhFZpq3ua0Eyj/kS/vOro9jV8JT5zEGJr/QqyFEi+AMUFumr7Ja/5um3103/etLk
 sBepqhU0wtUJIFG5GJkFkzTs6+BYgGY61rTDPYBuG2oZz7AYfJlqgQW/N9jBE6iuJZ
 remoG4mnfGihQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 B98BCE6D402; Mon, 25 Apr 2022 17:59:49 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <YmbSOkjjP5ekfcGk@google.com>
References: <YmbSOkjjP5ekfcGk@google.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YmbSOkjjP5ekfcGk@google.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-fix-5.18
X-PR-Tracked-Commit-Id: 4d8ec91208196e0e19195f1e7d6be9de5873f242
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d615b5416f8a1afeb82d13b238f8152c572d59c0
Message-Id: <165090958975.5171.9135856472795292094.pr-tracker-bot@kernel.org>
Date: Mon, 25 Apr 2022 17:59:49 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Mon, 25 Apr 2022 09:54:18 -0700:
 > git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 tags/f2fs-fix-5.18 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/d615b5416f8a1afeb82d13b238f8152c572d59c0
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nj307-009vgY-Qq
Subject: Re: [f2fs-dev] [GIT PULL] f2fs fix for 5.18
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

The pull request you sent on Mon, 25 Apr 2022 09:54:18 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-fix-5.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d615b5416f8a1afeb82d13b238f8152c572d59c0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
