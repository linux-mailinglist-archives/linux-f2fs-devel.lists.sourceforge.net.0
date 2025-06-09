Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A4CAD2833
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Jun 2025 22:56:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtV+L0GOmzeyxc2aPk1oNwlpvJbfQAYo/0wI2S10Oe8=; b=BT4lu4c8oKRpCLmgD0twodHF6I
	W6ENAax47sDu6/Snqbr2oOoiLyLxm1cn+3+RcxoLGTN7cvcmLwJF5wiJlpMlxs1qkcPOkNaPDjZ7d
	T3zZ4fe8Buf+pE017CYyDm24FzY6lT5weLhNckhdZC8fiFdtDQFX8nRrOkQEN4+SZhX8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uOjXA-0005P7-G5;
	Mon, 09 Jun 2025 20:55:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uOjX9-0005P0-3R
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jun 2025 20:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aT/8M79WUcK/Z0tOThqg0qmZonbVyo4Sh1eXNqYogUs=; b=iXDlOucorjrMqwjtzLoE4RMfSX
 p3RG8GEBoX0Va0u53wUrKj+mw6UnZVYEWV+hDhcBVCNgdSqejPBg4YyHcOmxHgAjqke4iqfKBGjKs
 sATosVMW/E3HZVYuxCkRGAwMDQwzoCy6G8vVkbMW0F5qByJjcD6ZgMKgFUhBqbgRIVo8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aT/8M79WUcK/Z0tOThqg0qmZonbVyo4Sh1eXNqYogUs=; b=MaL+b39IEYU/aX2Yy2eRNvN6CT
 nDLgp11CgPvck+MhIlp3NPkiMZg/1tBpbxsC3SV6iGTaoCN1DJDjE/dwOamuDQgxfEkaiT+MHaxuX
 c14GfUlIau9FZpXgCLAxg806yNFp02mnWIg7DgpsyK1ZXPiCdtvW+K7etZ97AHbh+10I=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uOjX8-0004oz-Kb for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Jun 2025 20:55:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6D0625C54AF;
 Mon,  9 Jun 2025 20:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3A3C4CEF0;
 Mon,  9 Jun 2025 20:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749502548;
 bh=FY6gqqH9JmRV7d802KdcakpN34IqV+GwM9Cmr/5iyvE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=JA1BAvXslVN3D4i9BJ9vFhyyQvtsdmXX5tsinuV1jv4qY9rGrDYEpzQDsVqaJVIsn
 13HrFO4Rh/PNzPxeR0LMCkjnsQwyQB/gqssKWC/RIV3rRGfSspplWpEn4s0GFrhOAJ
 2dEc4+f5Y+aE8AEqJ9sr9DDqLu2uk0EjqEgQ2Aifp+9aZzZ3bY1H6fuY4L6wYaaIHQ
 5l0AqEpjmNKk8PazIVzaKNh9VsZ5Du06a2HbcxF6YWP7l68FJ0YYCv2NK49v6XxfET
 Jedhvd0tEpjdCXPKwqwru8HwhG9vpNtyaCkX9j5Unj9W4QR1AcSHdMPhmne+9zZCNl
 98S8DGEwi4YHQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADB8D3822D49; Mon,  9 Jun 2025 20:56:20 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <174950257925.1531626.6267627182271643754.git-patchwork-notify@kernel.org>
Date: Mon, 09 Jun 2025 20:56:19 +0000
References: <20250429114949.41124-4-ryncsn@gmail.com>
In-Reply-To: <20250429114949.41124-4-ryncsn@gmail.com>
To: Kairui Song <ryncsn@gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Andrew Morton <akpm@linux-foundation.org>: On Tue, 29 Apr 2025 19:49:46 +0800
 you wrote: > From: Kairui Song <kasong@tencent.com> > > folio_index is only
 needed for mixed usage of page cache and swap > cache, for pure page cache
 usage, the cal [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uOjX8-0004oz-Kb
Subject: Re: [f2fs-dev] [PATCH v2 3/6] f2fs: drop usage of folio_index
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
Cc: kasong@tencent.com, nphamcs@gmail.com, chrisl@kernel.org, david@redhat.com,
 hughd@google.com, linux-kernel@vger.kernel.org, willy@infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, yosryahmed@google.com,
 linux-mm@kvack.org, hannes@cmpxchg.org, jaegeuk@kernel.org,
 akpm@linux-foundation.org, ying.huang@linux.alibaba.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Andrew Morton <akpm@linux-foundation.org>:

On Tue, 29 Apr 2025 19:49:46 +0800 you wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> folio_index is only needed for mixed usage of page cache and swap
> cache, for pure page cache usage, the caller can just use
> folio->index instead.
> 
> It can't be a swap cache folio here.  Swap mapping may only call into fs
> through `swap_rw` but f2fs does not use that method for swap.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2,3/6] f2fs: drop usage of folio_index
    https://git.kernel.org/jaegeuk/f2fs/c/fe15ec046431

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
