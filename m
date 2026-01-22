Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGCPH7+3cmlKowAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 00:50:23 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA886E992
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 00:50:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vy2HOWX2XrGa/u10G2ZYGAlZdMWMrRLKZNCorRZa9Q=; b=XAzvK007ZBKQkHqCvXK/ZBvYqJ
	3QVjpvelhiNL/PwBH7jFkGltny7vK7F4oKlssZSNnfQ3SSck8Ekwa3ijk5GEVfiqpAODTedi1hap7
	O9XSrixx6gbk9qeMxfUuqp7WQsgYz+Jar4CjVwbINP0J/HCsUf7ydZ2fONV5NG1WO7Ro=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vj4RM-0002Uf-Mj;
	Thu, 22 Jan 2026 23:50:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vj4RL-0002UY-Bd
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 23:50:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=io963Mgc9DRy1bg478fVydX09czxNwxzXnn1NINWTEw=; b=e3v1dFOQw2fkrcjHPxpkv9RewH
 VygtGs3DcTZ9pXIrrjfyQMk9xuL4fdoCWEibUDlKMtfj0z0Hz+10PKLXUgni+WPTKbqSRCi/LkRkW
 pu5BDF6t1s08aeqVoA5LQcT/9GJlN7HN7tb8jmt3No5OTCiAgm9KoNZHF2xyvwglpOcQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=io963Mgc9DRy1bg478fVydX09czxNwxzXnn1NINWTEw=; b=l/B1MtU0iud2MVBZfs4YhfVOh5
 zoWeOxZf2DmxrUnJz4W4vDA1LPLcg0Vx4q4OeqPVaBVF//efxdrot+wQ29r15D8MMynJwSb/3zY/6
 qzKejrsnLMoc/Tdv5TPo+VHorfTaZNBpGZp+zrE3lJYo2oiyifKi2NbPrRjpJss8XWhw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vj4RK-0002Nk-Ri for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 23:50:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 19A366001A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Jan 2026 23:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5558C116C6;
 Thu, 22 Jan 2026 23:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769125808;
 bh=DMNFC2K4o9O+DFphTZZkXNN6q57DzJVuOy8CzSeEpZI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=OkMpSKPnB3lGzDf8/0I+VL0RKh6/N+NCEpRt0gFyoFEqwhboPl6Qz5vl6uUASGUTm
 dty2+Pqj1Jl6dAYxyolYcXefcC1RTvWMyToOoSu7pTwOv+n3gD2RnhMMSe0Zno2jxq
 nj1K9c3+ERC3Z1lUs7IteOv1dEbSEDLUGaC56w5298vRgZIvBrHU1NRleboEinfnUa
 jwqvqXLHxWwqJHQ2v3IrvxOSqaVVEOSkRoTx6F7P06cjm5xsXsrvHmpMhvlFTqI+Dq
 e+YS85P2Ed2tsFrJko6jJhWw3H7CkpdR6TSY9sMO66WD23S8ri/PiDexloe+TATrU/
 cvxYllmhz/ybA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 4EBC53808200; Thu, 22 Jan 2026 23:50:06 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <176912580510.2327822.13394016907615058829.git-patchwork-notify@kernel.org>
Date: Thu, 22 Jan 2026 23:50:05 +0000
References: <20260120091215.62608-1-chao@kernel.org>
In-Reply-To: <20260120091215.62608-1-chao@kernel.org>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Tue, 20 Jan 2026 17:12:14 +0800 you
 wrote: > This patch introduces sbi->nr_pages[F2FS_SKIPPED_WRITE] to record
 any > skipped write during data flush in f2fs_enable_checkpoint(). > > So
 in the loop [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vj4RK-0002Nk-Ri
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: check skipped write in
 f2fs_enable_checkpoint()
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-0.985];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org]
X-Rspamd-Queue-Id: 0EA886E992
X-Rspamd-Action: no action

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Tue, 20 Jan 2026 17:12:14 +0800 you wrote:
> This patch introduces sbi->nr_pages[F2FS_SKIPPED_WRITE] to record any
> skipped write during data flush in f2fs_enable_checkpoint().
> 
> So in the loop of data flush, if there is any skipped write in previous
> flush, let's retry sync_inode_sb(), otherwise, all dirty data written
> before f2fs_enable_checkpoint() should have been persisted, then break
> the retry loop.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2,1/2] f2fs: check skipped write in f2fs_enable_checkpoint()
    https://git.kernel.org/jaegeuk/f2fs/c/254ef6c7e1af
  - [f2fs-dev,v2,2/2] f2fs: introduce FAULT_SKIP_WRITE
    https://git.kernel.org/jaegeuk/f2fs/c/a848dbd97957

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
