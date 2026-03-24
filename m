Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AG8OBcPKwmkBmQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 18:32:51 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE0A31A163
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 18:32:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GYKVr0pdPkqxy269OIvdtZleOk39X9nvp9SjQFKQEG0=; b=Q4vSvkgtMlrsswMkSPrTYbu7aE
	wM1JLf4URBrqU0erfjnd0N09Y9elYIYiKFw69v7jxKdQ4oi5NPDCeFVG06HVzEkkiF0ztMOOk+B6b
	9HjkcUzPbDx2FnPQwyXTxoMJeUw1oGXAPP2NHVGmoSF5UALVrASCApDcYN1PLOoNBPB4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w55cX-0003mc-Gg;
	Tue, 24 Mar 2026 17:32:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1w55cW-0003mR-60
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 17:32:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MJAdE6f5uO9tTWBDAYuHACCgS0+i0q1ZmEhKXrWDmQs=; b=jScXaM7L02qmh/msoiM45NxvVh
 olgEA3WiXF2gYQrRfSQh1bURXsYKekZwcapRzta/idNSIBcoP1Jns/lkFNFckj4Ox/06A1t7WcGs3
 4/76S2cPyNyC1UENAMFOQ0hmvLvBqvQr6Ut15vOaBdHeX+7jtyvJ+dsPZAz2oGo6wMG8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MJAdE6f5uO9tTWBDAYuHACCgS0+i0q1ZmEhKXrWDmQs=; b=AjTfOc2okC9quz64a2kEudyZ81
 39zP7OZEb1sT6K+ctkwWn3glDDPT0Bk54CyzWVYLmOoVmV7nTa3BwUJTrZ2WMxUha08c7EaoKkwO0
 EY9x7E7KkNPxtOoUgb7FTbuEZ8lnVlTtA/HEyF2QKIswf//KajMJjct2e/tQfPqVxLrs=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w55cV-0007rO-BW for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 17:32:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 150FE40844;
 Tue, 24 Mar 2026 17:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9439C2BC87;
 Tue, 24 Mar 2026 17:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774373556;
 bh=QmNVbraynBUW332sKPQ+4xqHBDHU2i6gACtMSK8CGOY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=l2gAbuYaP2a+svdebJRM1c8Rb9vBdT9l6P7NbBNt5E18Ppmda6WiM6oYnDWk2lWJz
 3ZBVffY2rzbrjk6N4QlhTevEG8w52xYzrWcOvqlfkCG5RaciADCthdML8ODY8V5Lqe
 ks702qXumEnpKrWjb4IGwHuXXKZnqAPxUp7rS7UxclUF8SR1/bt09XTx0hFxDcf+fk
 VI+VjrqqIWyaoJUTRy+9vAgY5Hua4I00VtYXRvnAhSvCAjlILJ0CxfbAAZVqMzkgy9
 z67P5MuO1Tb9GQlkiUtV2m6EgCYgXI73QtZxIBWCkmAVzRZUCCB49D12yOSjzYbY+/
 F/aOJOKDoLWgg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 02B9E3808203; Tue, 24 Mar 2026 17:32:26 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177437354479.1223048.17658150740894474730.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 17:32:24 +0000
References: <20260316185954.2185806-1-daeho43@gmail.com>
In-Reply-To: <20260316185954.2185806-1-daeho43@gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 16 Mar 2026 11:59:54 -0700 you
 wrote: > From: Daeho Jeong <daehojeong@google.com> > > Suspend can fail if
 kernel threads do not freeze for a while. > f2fs_gc and f2fs_discard threads
 can perfo [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w55cV-0007rO-BW
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix to freeze GC and discard
 threads quickly
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
Cc: daehojeong@google.com, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FREEMAIL_TO(0.00)[gmail.com];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daeho43@gmail.com,m:daehojeong@google.com,m:kernel-team@android.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: CCE0A31A163
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 16 Mar 2026 11:59:54 -0700 you wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Suspend can fail if kernel threads do not freeze for a while.
> f2fs_gc and f2fs_discard threads can perform long-running operations
> that prevent them from reaching a freeze point in a timely manner.
> 
> This patch adds explicit freezing checks in the following locations:
> 1. f2fs_gc: Added a check at the 'retry' label to exit the loop quickly
>    if freezing is requested, especially during heavy GC rounds.
> 2. __issue_discard_cmd: Added a 'suspended' flag to break both inner and
>    outer loops during discard command issuance if freezing is detected
>    after at least one command has been issued.
> 3. __issue_discard_cmd_orderly: Added a similar check for orderly discard
>    to ensure responsiveness.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v3] f2fs: fix to freeze GC and discard threads quickly
    https://git.kernel.org/jaegeuk/f2fs/c/62b45b0ad4cd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
