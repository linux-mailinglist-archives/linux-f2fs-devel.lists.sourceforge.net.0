Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4796C3723
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Mar 2023 17:40:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pef2J-000450-1y;
	Tue, 21 Mar 2023 16:40:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1pef2H-00044t-Nj
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Mar 2023 16:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I3ddbTFOLBAm+V3IqC0lrwcO3NiWbLwDwdrL45by630=; b=XV6YW7vbz+p8DyrBJHrTqjppDW
 WATcsOvAFkPdwl3D5QxX56Y7m1MCJF5BR6OX9/RH2PXGup3jIcJazsAqTEtubv3XrzFB8TdL2wjSZ
 GSwcyg9SfJt2SlcqWjlMWax3fKXBfikPf8OuccQR5ArtgRMO7/fk1m1QLl0Fyqxznvb0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I3ddbTFOLBAm+V3IqC0lrwcO3NiWbLwDwdrL45by630=; b=RrwQckejx63LF0WejB+H4kseXM
 JlVYdqra0m6s0abn7qTpaTVhvagd9AHSZtwlYEPcOFXfbecXx4r4gikGhniR8mYfHmxqCcO02vvdl
 9qThRnVjZ7EzBTkp10uBejM1G9RxelDxgXWSjwDPxzk36h3nL4T2+VWvVDd99JAKU14o=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pef2D-0000hI-LB for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Mar 2023 16:40:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C7C19B818E6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Mar 2023 16:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0AC9C4339C;
 Tue, 21 Mar 2023 16:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679416819;
 bh=GY8DQNujLNBf1HugJ+wTulFJIHywPT3nK3IqkYbjfSw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=nzrHPXhBaxqsdsPmy6zwBKAPQtRp2bM8qij9gEFUdObJHMmj8YOPgHNruZGoH5Ocq
 /aIa4vxUdG45pmfvlzwfRoC7aFY4/7i/16HRK0DdFP+1S7j6KXVMR3hc/jwNZSxvnF
 DIZxC7M4l+Kn0yVeAlJ/5Fh9z0YGj0Uyx67lc7wMqMaRD5SXOuLQPAH04AZsg74ORO
 NA9Noe4iUGokgGChTCD+8iEaxJNQlzEc5Z/bQWOWLBgR+ngz8oytGvAxr5RqD2SGdK
 WnP+k7yHpwy6j2ICq0LbSH2drABVgP0dAYRbZbK8vIPB95pKZHz4fFF/Z7JAQsQdJN
 m+TTE2YA0CZnw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 C8E1AE66C9B; Tue, 21 Mar 2023 16:40:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <167941681881.25004.14989603719608389854.git-patchwork-notify@kernel.org>
Date: Tue, 21 Mar 2023 16:40:18 +0000
References: <20230313201216.924234-1-jaegeuk@kernel.org>
In-Reply-To: <20230313201216.924234-1-jaegeuk@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 13 Mar 2023 13:12:13 -0700 you
 wrote: > This series removes the use of rb_entry based on memory alignment
 which doesn't > look like a right design when considering various
 architectures/compil [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pef2D-0000hI-LB
Subject: Re: [f2fs-dev] [PATCH 0/3] remove shared memory structures
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 13 Mar 2023 13:12:13 -0700 you wrote:
> This series removes the use of rb_entry based on memory alignment which doesn't
> look like a right design when considering various architectures/compilers.
> 
>  v2 from v1:
>   - adjusted Eric's review
>   - refactored gc.c further to clean up
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/3] f2fs: factor out victim_entry usage from general rb_tree use
    https://git.kernel.org/jaegeuk/f2fs/c/e433c7887585
  - [f2fs-dev,2/3] f2fs: factor out discard_cmd usage from general rb_tree use
    https://git.kernel.org/jaegeuk/f2fs/c/7e9775a516ff
  - [f2fs-dev,3/3] f2fs: remove entire rb_entry sharing
    https://git.kernel.org/jaegeuk/f2fs/c/6b40bc364c10

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
