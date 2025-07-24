Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46965B1125D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Jul 2025 22:30:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7/clAZHyhKIY49Xo3PsW0Hvb+h+uMJL6G0XJvs2QlQ=; b=M50oW8kAmOZXuwbUoj/tThAbSP
	rSklygn51G41SR4Ro2Zc1XznfoEtx4VjJ4wJ7au0kaAPSBQ8gJsiL84WVJdtZo9OTZ4KsXkBNVuGa
	eQ65v8ZpDv+Td7HyCLReKnzxHAek9f03Tnx45PM5Lee69yXDHMktyDldLyD501YtpWn8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uf2Zs-0004Fj-4M;
	Thu, 24 Jul 2025 20:30:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uf2Zq-0004Fa-7x
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 20:30:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tDAaxEZFca9YBlmJISNsJeOQk7hht1P8cP8l0XhYffA=; b=iXhGZLY88l+xpawMetQA/pmneW
 g+EMSVMmxJt18/S42PY4woJowrCj5HXREqtUHTq9mfftUKQO6k+oL6sYPVQDP2AVmVwBik0TnV8Xp
 0xTir1qd+RYaKpJxL5gVkse7eTIKQG6cGC8DjDa1CdApD8cawGISl6XzEOINjycYZjww=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tDAaxEZFca9YBlmJISNsJeOQk7hht1P8cP8l0XhYffA=; b=SPUllx712l6E+ryZQS4JJgorHi
 NMuS8htN5LWyT/7RaokQp/NBfDGwtkJVjHU2UAiq//H6BFakvdLferbuObN9M36wLwaDpEGzZ9FD1
 Abc7MPJo1UdoLw5EmaT2JH1Ea9cgwHHAqGEF4z4/f+0pgVfKnmKpKnk5O5e9hYBsxmNo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uf2Zp-000149-Or for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 20:30:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7690143893;
 Thu, 24 Jul 2025 20:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDF0C4CEF6;
 Thu, 24 Jul 2025 20:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753388995;
 bh=VZmDCd3D1PztjGRSoro8vEYxaEMq+OsxAiIzCVbhvv4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=rb6tVfhtxtUM217biiRFFvUH61OmzuKT+7AUKKwK1U/6tXK1Lxny2dThPlh1rzQaY
 3o34yrXq4KSl76dokN244FSawvlQmyGPYm7laclOpNPj0mlr4fKhH6NBTgU0PabFL9
 IgGNg9tMOeqQTGHzREYeo/IYNVT4Wb+S1eHk3HyLd0F/GINWKwFzK8ewNlR0TYg2QC
 fSodeNc4j+nPyI8zzCAYSh31EJpwgMgyZ06xM2JaehDkkdQbymv/9cNhohz9k5wqT+
 axYvd9waxytq9JrZhoiDWw3FDXl4Io/RUe3O5BLgb0k8q5Z8fwlEvInLpPxTuFYQ4t
 EbAAhmore+wXQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 70D3E383BF4E; Thu, 24 Jul 2025 20:30:14 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175338901299.2519964.7208919270936337472.git-patchwork-notify@kernel.org>
Date: Thu, 24 Jul 2025 20:30:12 +0000
References: <20250718220431.2290301-1-daeho43@gmail.com>
In-Reply-To: <20250718220431.2290301-1-daeho43@gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 18 Jul 2025 15:04:31 -0700 you
 wrote: > From: Daeho Jeong <daehojeong@google.com> > > Otherwise F2FS will
 not do GC in background in low free section. > > Signed-off-by: Daeho Jeong
 <daehojeon [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uf2Zp-000149-Or
Subject: Re: [f2fs-dev] [PATCH] f2fs: ignore valid ratio when free section
 count is low
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
From: patchwork-bot+f2fs--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: patchwork-bot+f2fs@kernel.org
Cc: daehojeong@google.com, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 18 Jul 2025 15:04:31 -0700 you wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Otherwise F2FS will not do GC in background in low free section.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  fs/f2fs/gc.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)

Here is the summary with links:
  - [f2fs-dev] f2fs: ignore valid ratio when free section count is low
    https://git.kernel.org/jaegeuk/f2fs/c/e6d5e789c3b2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
