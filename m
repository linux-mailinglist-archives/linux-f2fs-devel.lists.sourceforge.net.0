Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E5BC5002F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Nov 2025 23:51:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nl3LzE13VFECZthwbJgcoL89xoLL7oOKPMr1kKDRHrs=; b=mLiBsPpmmZA7ih/oNjZQ5IB/Se
	YumPsHgAb+S7ZCQSLXZQ/JYHstnKjaybGGFyjsJBdXVHaXwdoAHCHZAfqz4zRbHZbuk4eSR97iPJ4
	tN9yEEcobWD9Uu40Gvd05iAtFQuelnGZWck8gFtJfUB+7mRzcNH8mFeXrpg6pggEndRk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIxCj-0004eN-TX;
	Tue, 11 Nov 2025 22:51:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vIxCf-0004dy-P2
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:51:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=63LLY5nJKUWRoxLjKyV/YVRNj/QyS2ZNMecTGrQ18qI=; b=YfXc2sgkbX4yi6aRz3uxucd4GW
 flHkNAXUo/1i0QagzKvpMGv27shWlKYB0l8/lRUfKipYBBfwAUDLYfXOHnRsXWpgrxY/Av/mxzA80
 atropK5noHFQzzZzw/nA/tLWmdz5o4ph7T1BcJxPFTtek7FFi1KueNlQUV9hD4WWxJQs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=63LLY5nJKUWRoxLjKyV/YVRNj/QyS2ZNMecTGrQ18qI=; b=OMWZLESWDBU5XQoQNTnJDC1sg/
 J6SJWRqoECdbSY0BgTHkP7qlXXMM8Ly9Wbvdj0st6DUmKxmHp5W/abK1YUxupzdd4jrFRE5wDw6co
 JONYhHrctysG2jirXVFFvMvUkbpuwA681d193JlC8Pl1t7E3ph+YL8RLaYXI1/46TCGQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIxCf-00048Q-A1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 22:51:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0610F40472;
 Tue, 11 Nov 2025 22:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6FBBC19425;
 Tue, 11 Nov 2025 22:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762901458;
 bh=nD71wI0XDv1kv2m82/Iq4eGjVSvOsCDAGUPZWot8Yus=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ny9fwatzQJizAzvfCE0J5IWJhtliyWffvA+iL5AuHxiq16h46NWVoPjk3nn+pFnhm
 FyHMcekOXkTjqmfpBz2FL4nK5YctqIsEItLfKlIrYN4PVJTxXuYD3sxW9PVlodQdPt
 nXi08oOOuCK3MuLBZN4SyR14jSi9IC3f3XJiBUYMZBgTYxGU8BqZIoVwqDbAaXM4cJ
 ww+DNjPXupugpGk9feOH73Eh9BKDrciBFIRp5u2fKMShdPRDOf7ZQrpSujoXt+hv51
 msP4qldA0iEEnrNSp0jdM/UHkdotTF5mwDK1sv/wqSThU3ESn8+ppD1q3O+GVeYXws
 1zwcJXc6T80tA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 33AFC380DBCD; Tue, 11 Nov 2025 22:50:30 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176290142873.3596344.6498894062602696343.git-patchwork-notify@kernel.org>
Date: Tue, 11 Nov 2025 22:50:28 +0000
References: <20251027125543.633506-1-yangyongpeng.storage@gmail.com>
In-Reply-To: <20251027125543.633506-1-yangyongpeng.storage@gmail.com>
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 27 Oct 2025 20:55:43 +0800 you
 wrote: > From: Yongpeng Yang <yangyongpeng@xiaomi.com> > > Change the type
 of the unlock parameter of f2fs_put_page to bool. > All callers should
 consistently pa [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vIxCf-00048Q-A1
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: change the unlock parameter of
 f2fs_put_page to bool
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
Cc: jaegeuk@kernel.org, yangyongpeng@xiaomi.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 27 Oct 2025 20:55:43 +0800 you wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> Change the type of the unlock parameter of f2fs_put_page to bool.
> All callers should consistently pass true or false. No logical change.
> 
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: change the unlock parameter of f2fs_put_page to bool
    https://git.kernel.org/jaegeuk/f2fs/c/096c6cf89318

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
