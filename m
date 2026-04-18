Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDymMdUK5GltPgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Apr 2026 00:51:01 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AF9422874
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Apr 2026 00:51:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WEsOpaM05O+eOzsQApYwRTsnhA2ATvHuYtW31exR8hE=; b=CeT9gSjcLp+IlhHDN8Lhd0U8x+
	pKqerk5i1qsV8bSnsTwEtQjkIMKlI4poqHzUgwK2Pngw4wGhJEm0s5tEaK/nhOJm5jLutheP9/Ek7
	DwYhZu9NAeLg3d+XQ8r/jbml8E4y/S0TjrpAmN/uxtkcpnbJKeqNJwGsC79OkSePdVFI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wEEV2-00024Z-Kd;
	Sat, 18 Apr 2026 22:50:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wEEV0-00024E-HV
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 18 Apr 2026 22:50:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kd6a70d742IYeLHX4GpJhXqhYBFvTOAIhD/mSqz1mgI=; b=VJtyalLD36uAb0jxaVTXUlQhHQ
 T66gu52zAJ91HMATycCGgEQW+CxejyPMlndWfn8jGNKqGynvvl+gziyPQHpcLxKE/liuRsVwa/Z2r
 YvhK6/W2yRNepkHcoeoGlDtB5WcgDL5c7I0c9sGCoBXpjTeE4UHrpOcCmKX4NqBfkRug=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kd6a70d742IYeLHX4GpJhXqhYBFvTOAIhD/mSqz1mgI=; b=l7ph42dkZmoa5w0swoJHpab/te
 P2EvcMXPhGxrpeohDGXhP5zV+VhX7SlWZtkEtA/MrCm9J19fIRJiT8tWtGvZzybM5477gStH69aNb
 sDW5NvWL5XCBRQHAtAcdLnXd4dqkSThjRTde+gLRoFWU0ealqEAxTUqT783Kn/MyMzJA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wEEUz-0006m8-UV for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 18 Apr 2026 22:50:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4BE226013B;
 Sat, 18 Apr 2026 22:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11F7C19424;
 Sat, 18 Apr 2026 22:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776552639;
 bh=jno+LesxmhXMDfdFirsiGBJqQ1+fgGx4Imve8IpFhdQ=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XGzqZq5ASNy9bEhL4AE+Hkhnm+dHIbsOhZr6tDDzHuUfUFEUw3+YtiDefFeBXbFGG
 kyMv998hNZTy7JaVQirXtHBCIbqlizRN4tQc+Y5mBOSAzOrI8lLT//Yh3m1mX3NysQ
 IRhzVjPc+g70Q1XeJGrnmhCGQ0uZElIOFuVNxPbXxJ5qsXw+aN9PSVDDHKMQx5/3G3
 Sq/Zu36YyfO4E7pm7dwbQz6d2qDUQ7GQJHgzoF9kSSF54YPWcQ1Yf7BmkNnrQ5GQhR
 JuClAW7c7z9Y6Tu3OD4+Lc8+/mUyeW16s9uz5/VJmVjGHQV6ZnV5tqyCQJdQ7i3Xh3
 /U1FcnYGj8Irw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 7D051380CEF4; Sat, 18 Apr 2026 22:50:06 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177655260530.555759.715286792001862165.git-patchwork-notify@kernel.org>
Date: Sat, 18 Apr 2026 22:50:05 +0000
References: <20260417175040.3562355-1-chullee@google.com>
In-Reply-To: <20260417175040.3562355-1-chullee@google.com>
To: Daniel Lee <chullee@google.com>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Fri, 17 Apr 2026 10:50:40 -0700 you
 wrote: > Track read folio counts by order in F2FS iostat sysfs and
 tracepoints.
 > > Signed-off-by: Daniel Lee <chullee@google.com> > --- > v2: use array
 size 11 [...] 
 Content analysis details:   (-0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wEEUz-0006m8-UV
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add page-order information for
 large folio reads in iostat
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
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS(0.00)[m:chullee@google.com,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org]
X-Rspamd-Queue-Id: 57AF9422874
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 17 Apr 2026 10:50:40 -0700 you wrote:
> Track read folio counts by order in F2FS iostat sysfs and tracepoints.
> 
> Signed-off-by: Daniel Lee <chullee@google.com>
> ---
> v2: use array size 11 instead of 16
> 
>  fs/f2fs/data.c              |  4 ++++
>  fs/f2fs/f2fs.h              |  3 +++
>  fs/f2fs/iostat.c            | 38 ++++++++++++++++++++++++++++++++++++-
>  fs/f2fs/iostat.h            |  4 ++++
>  include/trace/events/f2fs.h | 21 ++++++++++++++++----
>  5 files changed, 65 insertions(+), 5 deletions(-)

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: add page-order information for large folio reads in iostat
    https://git.kernel.org/jaegeuk/f2fs/c/cb8ff3ead9a3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
