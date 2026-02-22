Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LPjButym2kizwMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 22 Feb 2026 22:19:39 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D3A170654
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 22 Feb 2026 22:19:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Cc:Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive
	:List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:References:In-Reply-To:
	Sender:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWIlVoKB7hwINJgUgyRlbMAwFNo235ClMMaJIMwwusQ=; b=aaBIa2/p9LoWDcK49Rh0FD7ZBE
	bc2TIrIgHlH3F7aO01PQZdhT1WqtoXhZZDnFyVbB7UvDl+yUDanRSfXa2iw3qlAlBa6IoVmK17MyY
	BX7N8WYIEDrychOxNSaweqVVZSc6eBudXE4jy54RHQ4DsT3kMRNvPaRsFdwpZ9MHH0HQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vuGrT-0001MB-KX;
	Sun, 22 Feb 2026 21:19:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <pr-tracker-bot@kernel.org>) id 1vuGrR-0001M4-V5
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 22 Feb 2026 21:19:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Date:Message-Id:References:In-Reply-To:From:
 Subject:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cziqwwDSQPgv5zZZ4jPqUhtOtRXtDJs64dxlVFALIzg=; b=SYEcmFYMBi3v0cDJU+3lI/3Cjf
 7rzVc1ybmPSu9xEwHQyunIcEu7MSImRCY5vWqwCESiy55WAATo1vW66k0YIhv+H4z5CP1XE9BH49Z
 Hb6Q4UQIc12E3L2oX5+E1kI6EXbjf8sRkHAjtcGwYCfOiEc8eQ9pbxwUKh1xdfsfhVsg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Date:Message-Id:References:In-Reply-To:From:Subject:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cziqwwDSQPgv5zZZ4jPqUhtOtRXtDJs64dxlVFALIzg=; b=RjG6y6YHgrECF+72fFSP++UWzL
 tB/g1V3kpebetjQh2nifM+GEvYtAAkv+V1nn4m/euMNRq63tJcsrmSr0fABTRybKmzOXdHKBrIVOu
 dN35AbYVRjOg1t/z1KgnZoQCk3Ul8CiXE06YcBpu4rWrHSqOA10655WstzP6avgE3ieU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vuGrR-00015U-7J for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 22 Feb 2026 21:19:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8BFA36001D;
 Sun, 22 Feb 2026 21:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3ADC116D0;
 Sun, 22 Feb 2026 21:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771795158;
 bh=afpqdyAmZQo051wBoQc670asvU5IJJ/hbFwXXRabVII=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=ap9aAScCIeD94C8UFbwfKTip4hEM+lLce+5csLYi/S1ny/4nu+ZfcpJMgm0LLSqeU
 UqEVC4qKeYzuV6vz+pq4lef5yFAjh4ObMhgnxKk/XA4r2kbWpJgCtSKI2GWCvgKMzp
 IrxSFj4gD9m3B8rbcd2TMsekuyLjTQz1AtOIY7lQ3I989NA93ej8gkIQRxSgQJ+ENO
 TnDCCQGTpexewaGaDbN0QbXHsxTCCLvnpBEqd3uhR5b3gxBytXlaUbUxW+5ORufZYW
 4i7MyOq8M1xw4xXUBnxknD38L8JNK5e1hXx9Lu3gTrAnG90DBm9rEpMR9TmiVTMBA/
 3DrFNsk1kiEKg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 402283808200; Sun, 22 Feb 2026 21:19:26 +0000 (UTC)
In-Reply-To: <20260222203843.GD37806@quark>
References: <20260222203843.GD37806@quark>
X-PR-Tracked-List-Id: <linux-f2fs-devel.lists.sourceforge.net>
X-PR-Tracked-Message-Id: <20260222203843.GD37806@quark>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/fs/fsverity/linux.git
 tags/fsverity-for-linus
X-PR-Tracked-Commit-Id: 693680b9add63dbebb2505a553ff52f8c706c8c0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fbf33803618ad4f531f78fe15cf328fe6c7f9978
Message-Id: <177179516477.1502390.5255504502545822685.pr-tracker-bot@kernel.org>
Date: Sun, 22 Feb 2026 21:19:24 +0000
To: Eric Biggers via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The pull request you sent on Sun, 22 Feb 2026 12:38:43 -0800:
 > https://git.kernel.org/pub/scm/fs/fsverity/linux.git tags/fsverity-for-linus
 has been merged into torvalds/linux.git:
 https://git.kernel.org/torvalds/c/fbf33803618ad4f531f78fe15cf328fe6c7f9978
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vuGrR-00015U-7J
Subject: Re: [f2fs-dev] [GIT PULL] fsverity fixes for v7.0-rc1
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
From: pr-tracker-bot--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: pr-tracker-bot@kernel.org
Cc: fsverity@lists.linux.dev, Theodore Ts'o <tytso@mit.edu>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[pr-tracker-bot@kernel.org]
X-Rspamd-Queue-Id: A3D3A170654
X-Rspamd-Action: no action

The pull request you sent on Sun, 22 Feb 2026 12:38:43 -0800:

> https://git.kernel.org/pub/scm/fs/fsverity/linux.git tags/fsverity-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fbf33803618ad4f531f78fe15cf328fe6c7f9978

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
