Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ACFCB0B57
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 09 Dec 2025 18:22:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dgkyzMIGH72CNRLRJJwAUcTuT0oiBZffNLS7QmjPcI=; b=LpaOaxmOBFE4R9vjLWRpxfTHdt
	el9nLQchtDmOp2MAlJeJUcF3+dAnmVmPSm6US65nBrNh5n0F7RLXuUeRF+FUxOvE3ba55CNLrWp1R
	ney7UAFOhrfzT4e6MTakDbmI4QF+uMJFjFPSaiQEx9mIr/c4roYZ7C+qeGb3FDzuBkHk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vT1Ph-0004d1-2R;
	Tue, 09 Dec 2025 17:22:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vT1PQ-0004bg-GN
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Dec 2025 17:21:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q1pcU+kDRpDIxiDaT/25l4+DzxPb40V+5bVi0iEwmi4=; b=lsnA41NDV1cGQl76fWAQNvo3u0
 w68YUxnK9Q8X8+SWWcDV4q2/z9XyuCcfWHqmQSCOpGjE82KWn/wvzXL8E0m+j2TufkZwBMyFj/nc+
 nE8RE8EUYQLHrQHJ5q5xIar5Qku2SePpUYP42AcCPCT4y3MQ2ztxiGrBGMWhDkvISD5g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q1pcU+kDRpDIxiDaT/25l4+DzxPb40V+5bVi0iEwmi4=; b=BNZ/kcaQI9t9BFr+rg5pRz4Ozu
 QQS5z2856fXCi3o4BRCizhFBkp/+uaMwJ4E5D8l7HPCgaKLA9hurVcF11d9ozRyPxWPZGUS43gq9l
 +nIJHfPVJ+kaM47j9tcG7R7jFtlOM8HbCx+ZNfiXKLwcvK0wmiv5yER2o5p9cdooNfbk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vT1PQ-0000zZ-54 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Dec 2025 17:21:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7C7A360178;
 Tue,  9 Dec 2025 17:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DEBC4CEF5;
 Tue,  9 Dec 2025 17:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765300910;
 bh=Zd0VvxmLuYiKbV2JePqY399umXBYCfKNdeZAputHSLA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=A7gK5ucHvEwBNjU3heBXBXpOhoe1l2cQIKNcXCXYBPBhUWs+m7IAs4W6VeZMla8aO
 Yoi0CVMYGFivv1vQHWWNc3EzusjYiqfhU/rkXjiQ2sYksBjzkHrLcTySFgW3/Oh68b
 wog5zc3ISm9w4uFpUrbfCjrcqSY+UD5BJjGaskuv8XHTTzuWkbe/kHYWhA7Hzzwdas
 6f57QW+yvEt/j9gWLUk6NkLGHI1PktctOvPCtWgyYSGonAWxGvOZs2mxKxxDboCS4f
 gb+rV6g+gh/20ndzZdKJ8Hn/6K/mYbTS1ZIOZz5WtnDCtJ4mTUkhOmOKb4T0YfbTKB
 sAVHFJgdfBMsw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 789293808200; Tue,  9 Dec 2025 17:18:46 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176530072529.4018985.10409239168317720126.git-patchwork-notify@kernel.org>
Date: Tue, 09 Dec 2025 17:18:45 +0000
References: <aTc4QJ9A-0qKfBzM@google.com>
In-Reply-To: <aTc4QJ9A-0qKfBzM@google.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This pull request was applied to jaegeuk/f2fs.git
 (dev)
 by Linus Torvalds <torvalds@linux-foundation.org>: On Mon, 8 Dec 2025 20:42:40
 +0000 you wrote: > Hi Linus, > > Could you please consider this pull request?
 > > Thanks, > > The following changes since commit
 d2818517e3486d11c9bd55aca3e14059e4c69886: > [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [172.105.4.254 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vT1PQ-0000zZ-54
Subject: Re: [f2fs-dev] [GIT PULL] f2fs for 6.19-rc1
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
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This pull request was applied to jaegeuk/f2fs.git (dev)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Mon, 8 Dec 2025 20:42:40 +0000 you wrote:
> Hi Linus,
> 
> Could you please consider this pull request?
> 
> Thanks,
> 
> The following changes since commit d2818517e3486d11c9bd55aca3e14059e4c69886:
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,GIT,PULL] f2fs for 6.19-rc1
    https://git.kernel.org/jaegeuk/f2fs/c/cb015814f8b6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
