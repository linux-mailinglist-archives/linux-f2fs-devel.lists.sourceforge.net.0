Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D786D2B05D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jan 2026 04:54:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6mAjOBS31Rw0Ecxy8sUr9wJRtr59YY+t/N7OEDP+hw=; b=dctW0/Me8R5uyF3spi3pFM1yZ0
	jMR9nWj5XZN0MOryF69j0+XHvgCsAj8/Ofp+rKPIc1CJ+q530Lz2nhtYvzsoqvDh/pghiZqz3c0le
	aP6TiEpzhWnkxHCDyO8P4NYRBqNo8Nqlf6SyeiYb2gqwYmIUUDbPtFPjTAIZVkPK0kFg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgauY-0005j3-Oa;
	Fri, 16 Jan 2026 03:54:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vgauX-0005iw-2V
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 03:54:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7XTAq4M9S2Z/gR5rni0fR36fkIA3EIGA1Kt01PRycSQ=; b=fGB1WTIt6iQUyrrPwFuehxMmXX
 r+iNB3dd2Jcqmou46bNDtgIP5JWGnDuUIS0ShdCnF+jiwmHI81S0NTyGTtkIuH38sT7/FphAJoX4U
 UlxsZHqMLBceCZRSvjle3dT2SVpE/0Wu3wcPbmFhyqlooT/VdwN6SoDo6P+UOytZr7DI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7XTAq4M9S2Z/gR5rni0fR36fkIA3EIGA1Kt01PRycSQ=; b=A8bxRyJ8HXTpm3JT0mAUnT8m4L
 eFcPsYjq8jUWhihD/bQzaFICT3ZGmycVUcNVPDparg6aOp+AJpMnBcKmw+e8HZs/tgU6+sfxR47qr
 S5cavh/DxUB85YhDS1rmykmEDVsEUJ7mDhGuvN5cW9JH2pyihQVcLshmytlD+MKZuY6E=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgauW-0002AN-JK for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 03:54:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B242060160
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 16 Jan 2026 03:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69B05C116C6;
 Fri, 16 Jan 2026 03:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768535637;
 bh=tbxGtk7YMdvjraYJegwR+LEYBBSzJAe7DOD2UhtPusU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=j+ePPj+l4JCAncVDuHGG33mkvaaOulwEZGRCmN8+mPOBSqq2pGZtDuV8bmU6t0zHV
 DzlEJppD6czBv4Pt5f2TN9J0LgJFU8Nx/HRKWXbCf2+Sw29nNTHbDZR3jB9KuPSPqO
 cIznGvyUNv243IyBf1WkzN53RdZrP9+cATJpdjtGgIbjFotmDDM+fzBaqKZ4acG6eI
 SQRXjQcAaaVXtHsQ/HzM4yVVnfTwmq+t3B7M9b1+6Ih6FLQ/WjKjd76gmb6GJNEkha
 sACFPc/X9tE3wQdJ2Kr2/Kvm2YADWrhRfCiqfo0Dbt4yn1j49tA65qOxWhazdBPp5p
 KjUqMR8AjPOxA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 78978380AA4C; Fri, 16 Jan 2026 03:50:30 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176853542902.73880.9446565153700505596.git-patchwork-notify@kernel.org>
Date: Fri, 16 Jan 2026 03:50:29 +0000
References: <20260116033816.7399-1-chao@kernel.org>
In-Reply-To: <20260116033816.7399-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 16 Jan 2026 11:38:16 +0800 you
 wrote: > This reverts commit 196c81fdd438f7ac429d5639090a9816abb9760a. > >
 Original patch may cause below deadlock, revert it. > > write remount > -
 write_begin [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vgauW-0002AN-JK
Subject: Re: [f2fs-dev] [PATCH] Revert "f2fs: block cache/dio write during
 f2fs_enable_checkpoint()"
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 stable@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 16 Jan 2026 11:38:16 +0800 you wrote:
> This reverts commit 196c81fdd438f7ac429d5639090a9816abb9760a.
> 
> Original patch may cause below deadlock, revert it.
> 
> write				remount
> - write_begin
>  - lock_page  --- lock A
>  - prepare_write_begin
>   - f2fs_map_lock
> 				- f2fs_enable_checkpoint
> 				 - down_write(cp_enable_rwsem)  --- lock B
> 				 - sync_inode_sb
> 				  - writepages
> 				   - lock_page			--- lock A
>    - down_read(cp_enable_rwsem)  --- lock A
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] Revert "f2fs: block cache/dio write during f2fs_enable_checkpoint()"
    https://git.kernel.org/jaegeuk/f2fs/c/3996b70209f1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
