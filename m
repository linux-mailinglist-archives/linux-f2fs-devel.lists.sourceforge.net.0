Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 682C5B021C9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Jul 2025 18:30:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oai7Yypcfjh1+0rkgdsj4iXhBR1nwTTemKNt3ZZSrco=; b=ELDqjATV61QoQmlVoBKVvQG7bQ
	jcJg0WIbIUwsYMidUKcHvZCwG55AKzTJCAe+m4AxmmIe4AEhkhMjBhx44SDdnJkW7NZDdtr4Ql7KR
	KMnczdRYqjfW48jj3kOPXAcN+ASJRPtk5i48mhRK4nTRKRxv6D9mEBUiowrPZ/xkyImc=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uaGdP-00064c-LZ;
	Fri, 11 Jul 2025 16:30:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1uaGdO-00063K-2z
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Jul 2025 16:30:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hxtpkv92WJELL6CGWRuP8gSmdahCW+UhsyRvE5ReS4A=; b=YC9ZwvwiZw2fFuMy5BckJZ4ZwI
 1I6syq+HqQgFeqiIzyyUcetHfVfmm4s1QeDa8rz+pyAemXnZq81Uk8o5mxUI4igVWppigvrisRl35
 0bGrwnG741A+mwTaFRali34N8oCYqpxLxRs5E9G8F0FVmAA37/IEkHMrVvtDQZ64R/6Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hxtpkv92WJELL6CGWRuP8gSmdahCW+UhsyRvE5ReS4A=; b=Ssv8ZY7IIlIYQD1zkl3DifBgqk
 IhCl+/0sdBHUrzOmufq6tG35qCSwydOmagNEJ399mXnlhKJCDHUzmGJdalNmP8I7owzp7TCuM7UMJ
 lrEactR9QMiGKb6g0y0rwe6ND0xsvUOX/iwxlf3tB2KHqDKWxe8GPLlnUkHkwKnlpVnE=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uaGdI-0006U7-Fv for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Jul 2025 16:29:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C52AFA54F7D;
 Fri, 11 Jul 2025 16:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D273C4CEEF;
 Fri, 11 Jul 2025 16:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752251390;
 bh=ARXXPEvWggOQbL5AW5/qAs8S07zuEFx1XkITdnx9C7E=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=pOlH7JWn9OF4JXsHjXXgypMcgXPieO9WWiBtoHYLbUe+wl6eoCkhtfUw/VpZ/pLgP
 UVD9j2Wp43vIxcIew7ysyG9Ee23mzSJZvFXCx+IIcKzhp25tGO1dw0U+l8v67VYKMN
 dR7yADCQm4SYZCe2E3hUXpgXh3eXzmSzZV7r0hK2feZcob8JCKo9nWSFaIfBJ1cuPL
 zAKXYYAYTI8sOrHn+SSx6o24nJyWjuo6vlYKi/dGzt+69PL7lEAPzQU6mhh61JLMtU
 5xzVUPlVVXgEDw5xoTuDlr76cFPt87D4BoNVA2jpWMuiNDsyIw88Un8Y8eBsI6n3y2
 LPfy0GpTl7taQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 ADC0F383B275; Fri, 11 Jul 2025 16:30:13 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <175225141224.2328592.8724744355283588501.git-patchwork-notify@kernel.org>
Date: Fri, 11 Jul 2025 16:30:12 +0000
References: <20250423170926.76007-2-sandeen@redhat.com>
In-Reply-To: <20250423170926.76007-2-sandeen@redhat.com>
To: Eric Sandeen <sandeen@redhat.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 23 Apr 2025 12:08:45 -0500 you
 wrote: > From: Hongbo Li <lihongbo22@huawei.com> > > Use an array of
 `fs_parameter_spec`
 called f2fs_param_specs to > hold the mount option specifications for th
 [...] Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uaGdI-0006U7-Fv
Subject: Re: [f2fs-dev] [PATCH V3 1/7] f2fs: Add fs parameter specifications
 for mount options
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
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, lihongbo22@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 23 Apr 2025 12:08:45 -0500 you wrote:
> From: Hongbo Li <lihongbo22@huawei.com>
> 
> Use an array of `fs_parameter_spec` called f2fs_param_specs to
> hold the mount option specifications for the new mount api.
> 
> Add constant_table structures for several options to facilitate
> parsing.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,V3,1/7] f2fs: Add fs parameter specifications for mount options
    https://git.kernel.org/jaegeuk/f2fs/c/a3277c98b64f
  - [f2fs-dev,V3,2/7] f2fs: move the option parser into handle_mount_opt
    (no matching commit)
  - [f2fs-dev,V3,3/7] f2fs: Allow sbi to be NULL in f2fs_printk
    https://git.kernel.org/jaegeuk/f2fs/c/405e5e00bfee
  - [f2fs-dev,V3,4/7] f2fs: Add f2fs_fs_context to record the mount options
    (no matching commit)
  - [f2fs-dev,V3,5/7] f2fs: separate the options parsing and options checking
    (no matching commit)
  - [f2fs-dev,V3,6/7] f2fs: introduce fs_context_operation structure
    https://git.kernel.org/jaegeuk/f2fs/c/54e12a4e0209
  - [f2fs-dev,V3,7/7] f2fs: switch to the new mount api
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
