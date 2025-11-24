Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA5FC82297
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 19:51:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ER+zokLKYEjd/9ZFzroSMuS0QzSm8Cs7l5JHvk8taU=; b=YAWwAEDVHsi85/IfDtlXcMuklR
	w9ImafRDJyt/8eOYnzH4H3MZ7a6GUwnAyDltigHyPSkaXwDmecJzWy6LF1MC8XbaXmM5AjzlbK2U2
	Bg7fReNYu8hKB2zzPBSSaFM/KvbFv/DgumlKEOVc+tS6+Qfcwx4+yCNsOYC2eqej5EWQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNbeU-0003mq-0d;
	Mon, 24 Nov 2025 18:51:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vNbeS-0003mO-3j
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 18:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WECSOkJ2CeFyJl3Wepb/hCaFB3zvZXRNF3eGMr+2DIY=; b=cBcbkV3dDEGFuO+wMcYaHmnZfD
 lydXKDx5I5joxvK356pPStnInLq4Rq1eVMaaYY24/EnWFkDzkXT6+WSZxDj7Pu7J9UiZLpGDnoL7e
 wKhVuPGNu1R3QzBQPZ4QDPJuPFa/COevJjp4V2IzwqY45mz3Rdkqt//HUxXWtx4n08tY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WECSOkJ2CeFyJl3Wepb/hCaFB3zvZXRNF3eGMr+2DIY=; b=dbD8VV/o/nBW3gompm6XyCx4Xi
 F2x5p3VYg4cIH+ixEn0NaDp7Yq04aC5DBc3iz0mgMLZXUfdc3E4wSJGBZWFUli7DHVosSYe5B3hVB
 6q0tZlRZ0D4PO7o4u18y3Vxh/XZLHl5/WgJc4HDWXnOr8ek8cibvsxDC/X9WNt+ZtW2E=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vNbeS-0002g4-EJ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 18:51:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2AE2D42D9F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Nov 2025 18:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A518C4CEF1;
 Mon, 24 Nov 2025 18:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764010254;
 bh=/1gJqD4abMS1sWOKYbQMTYGZchGjFWq4WNl/gDqvVIA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=SsZybSeazFmJYVFAVfKfxKuoMBBdvThOmDWehh/8rrRzcnLsHGx1wyqEJLOv5zfiy
 MPbOyOXunPXSOqx6pcjG7fGqauNPass093r+rEuA4wBjDcKwLOarpnCGnLvJWcZFeB
 7PCsGIDXnwC8sGCxkxRmt4odhTLQVciKOehypPMwc5948upXJBqzMqmGITxW7f20Fg
 rsXws21wt4HTiHb5Vpu3q0XcccKrG1ya3UWQCmSpC7Xf+JlKVZvK9J2SZM01crNcvv
 7l6ZJTo5wUPoPaEk4K5Gh6UHinC4QAeZW6/VhbvX0McQSsFlIX5+jhMw8pmUZJPzbD
 KKYfHE210A6Gw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3471D3A86296; Mon, 24 Nov 2025 18:50:18 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176401021675.42009.13430401093424290304.git-patchwork-notify@kernel.org>
Date: Mon, 24 Nov 2025 18:50:16 +0000
References: <20251111115229.1729729-1-chao@kernel.org>
In-Reply-To: <20251111115229.1729729-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 11 Nov 2025 19:52:28 +0800 you
 wrote: > In f2fs retry logic, we will call f2fs_io_schedule_timeout() to sleep
 as > uninterruptible state (waiting for IO) for a while, however, in several
 > pat [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vNbeS-0002g4-EJ
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: introduce f2fs_schedule_timeout()
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 11 Nov 2025 19:52:28 +0800 you wrote:
> In f2fs retry logic, we will call f2fs_io_schedule_timeout() to sleep as
> uninterruptible state (waiting for IO) for a while, however, in several
> paths below, we are not blocked by IO:
> - f2fs_write_single_data_page() return -EAGAIN due to racing on cp_rwsem.
> - f2fs_quota_write() and __replace_atomic_write_block() failed due to
> no memory.
> - f2fs_flush_device_cache() failed to submit preflush command.
> - __issue_discard_cmd_range() sleeps periodically in between two in batch
> discard submissions.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: introduce f2fs_schedule_timeout()
    (no matching commit)
  - [f2fs-dev,2/2] f2fs: change default schedule timeout value
    https://git.kernel.org/jaegeuk/f2fs/c/2f4c126cc08b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
