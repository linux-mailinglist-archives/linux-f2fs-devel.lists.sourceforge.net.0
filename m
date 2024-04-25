Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E7A8B255D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Apr 2024 17:40:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s01DG-00012w-9W;
	Thu, 25 Apr 2024 15:40:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1s01DF-00012m-9u
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Apr 2024 15:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/KllIuZT9Kims/2mN4DeVbp1vKSlvJWAb+TAl2ntRr8=; b=EwjADwuh7/IlXLRYwhbJWEsRd2
 4xYNNZDpsjE+NbAanEMqn0A2eKxbP9/ZH3ZNkGkJz6sYvqvjiOeTZJLxx0IF9kej1DeNnE48cG56A
 Rr4R+UBWruOYlhUj2KCkg55KyGrLB1/VB4Bp8wbLiPPauxqXl9OdXJoj1RzKI6lEY5CE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/KllIuZT9Kims/2mN4DeVbp1vKSlvJWAb+TAl2ntRr8=; b=I
 dm05H9qdjlJZr2H1pusy8ZvtY+N4uta/dmi5aL1QBeUBdJP7VYL3/DaTUBPzlsJgEsWTboZ39EyQl
 0aOE+/wVhaZlCjNZfQYYjTWKsf1nDS02gcsFizGqVWjNHfHUcWEpNBdftpj6u3siK1SDZL4cl0sCw
 cYwL6upZTdJAEkIU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s01DE-0005gn-Ul for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Apr 2024 15:40:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0A95A61E8D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Apr 2024 15:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7483C32783
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Apr 2024 15:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714059630;
 bh=AlB1v1t8VtpB3BhDTfYgaKf0o111mMrPTGI5UgyxPoY=;
 h=Subject:From:Date:To:From;
 b=fx2hKFkHT6I8FY0IjSVUC7z2ljnzCIx9wjRJytVD0jmLMVwh+g/7ULR3QkxhtyqYn
 0Pvutakums76Ms/HczFYGTpImXSa8oE/veWjKkMCsZOMxmTze19c+7e0YQAgpgJjpY
 tRDmY3jm3+chBPRkIKvRT2Ap962jo0RXfvMQMUEGWZ1iLQ3QoTwN+8qlbFU/hEoruF
 SD6YUJFgIqThN5bS4wXvuhRFBVF4oDnFO9yqzKzzMOzjgCqNaCR/AA4KhFec1u+W2u
 TVmg5NWmEpWFKGJAGR0FipR6YAcopb8b7NmRtRCFb5ZgCzRVsi4nW+u/BZHBPZw6UV
 Qswu0BfvooG3Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 BCD67C43140 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Apr 2024 15:40:30 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171405963076.10966.13262518300282759105.git-patchwork-summary@kernel.org>
Date: Thu, 25 Apr 2024 15:40:30 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: fix
 false alarm on invalid block address Submitter: Jaegeuk Kim
 <jaegeuk@kernel.org>
 Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kernel.org/project [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s01DE-0005gn-Ul
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

Patch: [f2fs-dev] f2fs: fix false alarm on invalid block address
  Submitter: Jaegeuk Kim <jaegeuk@kernel.org>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=847558
  Lore link: https://lore.kernel.org/r/20240424173548.1515606-1-jaegeuk@kernel.org

Patch: [f2fs-dev] f2fs: use helper to print zone condition
  Submitter: Wu Bo <bo.wu@vivo.com>
  Committer: Jaegeuk Kim <jaegeuk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/f2fs/list/?series=846991
  Lore link: https://lore.kernel.org/r/20240423112759.4081008-1-bo.wu@vivo.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
