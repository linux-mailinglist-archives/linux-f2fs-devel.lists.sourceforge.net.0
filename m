Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B00AFF090
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Jul 2025 20:10:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8QcEuDA+Cwa6wCQXPUiFLm4bZ653f1F+5n9sYrLhag=; b=KBQ0fApjzUkbcscXbIq/olkpDB
	hK2tHDyDU18WxwgF6Jtv+BYAagC35BABezaIEttnjzHDGQm3AkofuB6zjlSkb9P6SpplFRdbFkf9B
	zEKrVxtCycB+5VvuQxWkrMa1Qlz08UsuthGaH1udpWX0DEp1S78ZXx4IuXwn74XoyWGo=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZZFJ-0004DH-Ao;
	Wed, 09 Jul 2025 18:10:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uZZFH-0004Cy-C4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 18:10:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WWLEcO7NTATdCiHEj7JnaUX4BwiYRnKOmniFkMW4ozc=; b=hHzXzB0YBoSppYriLVlP3v/slh
 ZXfvkGrobF/cUvkk9ATbq1ggAzM6jWoHOlEWhyVvUhKn+nhrjSHdjd2FFF3dM+F6yB2leir2Uou6f
 vBX1luAuMb99kOvByzO2MxcT9Ylhw5rNaaGH1KeNrwfi4n/D2G9Ip7B/cl+NUVaTbbac=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WWLEcO7NTATdCiHEj7JnaUX4BwiYRnKOmniFkMW4ozc=; b=SBy76MF/G6au3+4Jn1mPbz67UT
 6UtVr5WlzTWpN4ZxT+ZlzsECOpVE3NtWsCany6cByOOYV+sKYVXOVWqvyONs9h7DvTZ0YK4m3jNgl
 kLmLgJD8m4mg9fQ5XuY/J2TqmBYTUGqoaKtyQGUM4vWoV73qDduG+Xmznl+vcAhLHtdY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZZFG-00015W-SI for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 09 Jul 2025 18:10:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7FAA95C6A52;
 Wed,  9 Jul 2025 18:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30E90C4CEEF;
 Wed,  9 Jul 2025 18:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752084604;
 bh=VPulh4P6ISLOw+0LS9hmPcv2Gf3kN/vqdjjmzU80hbk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=LKretA3qVgCzvvPFFissribziz+b9vNXf+no6dJtsc7lKvhZNjNqqhoWp/TFbXJGS
 2qUtja0l6RxJgWqCdPwDRq8LhKhwf7Tj6vAaEqfsFKW2nvGFJv0lFUjpMC/8KCAo8n
 YozBBZIGK1XIwuk9ktONfk8035ZICt1gP3zbR80ddzkGoAQwMqS5Z3UrES3ZH5AaJU
 2ZwI2qbzSxLjc6jcwHH57QE5YNvzD0HHbnI0YIW6LVmfQoWTNibU1iLeJhMmYpLapF
 pM0DEdh3ZzAPd6bRlfEOI87Ppavxu8wcghSEKxsJToQL84At+ptV+EyZPAKq6Wut5v
 cEGW8aBtvEBSA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB48B380DBEE; Wed,  9 Jul 2025 18:10:27 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175208462650.806926.161695644855019722.git-patchwork-notify@kernel.org>
Date: Wed, 09 Jul 2025 18:10:26 +0000
References: <20250627023818.146534-1-chao@kernel.org>
In-Reply-To: <20250627023818.146534-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 27 Jun 2025 10:38:17 +0800 you
 wrote: > This patch adds missing upper boundary check while setting >
 gc_valid_thresh_ratio
 via sysfs. > > Fixes: e791d00bd06c ("f2fs: add valid block ratio not [...]
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
X-Headers-End: 1uZZFG-00015W-SI
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix to check upper boundary for
 gc_valid_thresh_ratio
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
 daehojeong@google.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 27 Jun 2025 10:38:17 +0800 you wrote:
> This patch adds missing upper boundary check while setting
> gc_valid_thresh_ratio via sysfs.
> 
> Fixes: e791d00bd06c ("f2fs: add valid block ratio not to do excessive GC for one time GC")
> Cc: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,1/2] f2fs: fix to check upper boundary for gc_valid_thresh_ratio
    https://git.kernel.org/jaegeuk/f2fs/c/7a96d1d73ce9
  - [f2fs-dev,2/2] f2fs: fix to check upper boundary for gc_no_zoned_gc_percent
    https://git.kernel.org/jaegeuk/f2fs/c/a919ae794ad2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
