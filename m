Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cB8FBOgx9Gnv/AEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 01 May 2026 06:54:00 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B57104AA682
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 01 May 2026 06:53:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5b9LbjOrjuBYe/0gVcAE7FwNniQPKDgPK7Lw4QgSUkQ=; b=UxWBiHljQD6DQD2mPq5+YDfJ7C
	GzcLZ757FvVaLC5YMbl0him+tRxjrthiNkL3nEmX0zCiZMmyO4/4kC1VJBaIqhQUspOGCfaKDVDrB
	zMd722P+3H1Cq3kdyK/Zj5A9m8S++AR2XRGwbYxDEHmtt0QG7cOsO+SaTGloYYAzFzJI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wIft0-0000dU-A7;
	Fri, 01 May 2026 04:53:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wIfsy-0000dJ-5C
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 May 2026 04:53:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9fapdAqlrQtuXXykSaxEKEbSxtPICBChljqOt8xVUFw=; b=JWlHQ66FRSuWdg26Gpia33blfe
 UJDcKuur+h2v6wP0IKPzU9QxrHvjuZ1574nSRoPmhbthoGDdA6/jxQUZRhGP2T5N0vf1QkeyfRddg
 uYA4of5j8KU8hT8GGY3gM8gCdeUynXx0X+IhTX6IpJYOEm+vIyirBLgHDqcuV12YItco=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9fapdAqlrQtuXXykSaxEKEbSxtPICBChljqOt8xVUFw=; b=T2ZAFpG4uOaiBZJG0mmJSJPl74
 2OjQMITX5OIANeA0VKWslBtXuNGFksWTMFPZl4nvDxeG25pJpuauJZX6h0zOwB/6K9zQncQbdsGII
 HXSthvNxNrXc5GGYvu684SdS13gkId4cGw34dn5auANFfc4lIJ7jRJCc5F9WC7g6W52E=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wIfsx-00007P-Ky for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 May 2026 04:53:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0C00A60582;
 Fri,  1 May 2026 04:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D19A0C2BCB7;
 Fri,  1 May 2026 04:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777611224;
 bh=MbuJTASI1NMr0qwmJMQcwY2ZaenMiX6xo6i5oAcLOmw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=RwcKVh5vkhuhNmPt+56eQe4YaRxH157iDCwIBQI44xZDpVko4cO8Lnh+jzL2OTIVN
 1kvrCbC9YKaV7bJQKRa/gIBMrUHE2Pjcx3R+N2fWKS2S1Gzewv0lZQV8/7V1HaNBJ1
 45cR2EsE052/mQri2rt1egREHRNWUn/ePhMvlHL7YyAnY307T4vCvMOMDrnglhVZOd
 8DvnAPRMxapteG6OONcB6VXaN3GXethlHSK8k7+xsauI2wW9tHrYyQ0PZsXWwhve3l
 39lJblOtvun7IlcTO9+VCT+rHIwoL+JuimtkF8Ro5ZUR3G+2AsOoZcInpKcBjdxBYq
 hyJ0WfM5QkPcg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 09CD2380AA67; Fri,  1 May 2026 04:53:00 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177761117874.3324081.12076569941435908568.git-patchwork-notify@kernel.org>
Date: Fri, 01 May 2026 04:52:58 +0000
References: <20231030040419.GA43439@sol.localdomain>
In-Reply-To: <20231030040419.GA43439@sol.localdomain>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This pull request was applied to jaegeuk/f2fs.git
 (dev)
 by Linus Torvalds <torvalds@linux-foundation.org>: On Sun, 29 Oct 2023 21:04:19
 -0700 you wrote: > The following changes since commit
 6465e260f48790807eef06b583b38ca9789b6072:
 > > Linux 6.6-rc3 (2023-09-24 14:31:13 -0700) > > are available in the Git
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wIfsx-00007P-Ky
Subject: Re: [f2fs-dev] [GIT PULL] fscrypt updates for 6.7
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
Cc: tytso@mit.edu, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org,
 torvalds@linux-foundation.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: B57104AA682
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:tytso@mit.edu,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fscrypt@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,m:torvalds@linux-foundation.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns]

Hello:

This pull request was applied to jaegeuk/f2fs.git (dev)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Sun, 29 Oct 2023 21:04:19 -0700 you wrote:
> The following changes since commit 6465e260f48790807eef06b583b38ca9789b6072:
> 
>   Linux 6.6-rc3 (2023-09-24 14:31:13 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/fs/fscrypt/linux.git tags/fscrypt-for-linus
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,GIT,PULL] fscrypt updates for 6.7
    https://git.kernel.org/jaegeuk/f2fs/c/9932f00bf40d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
