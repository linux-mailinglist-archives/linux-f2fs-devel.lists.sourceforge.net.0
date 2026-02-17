Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCGPO0/alGl7IQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Feb 2026 22:14:55 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 917D31509D6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Feb 2026 22:14:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uDWu+qJYdikKBTC1JEoaQkDzi16VLEdDqvxFKo5Ld8I=; b=I7NLAw/y2M4pUsvIi/tlvrqJMF
	pypC6j1Sm67eb4ls4jRsu9J8M+jYHziMxGLE383erHHMBHMcwEiGhkg8UHq1y+OlEF26rPOapH/hU
	Yzi6IGPzwd293J+dxl6V169XbEuagEJ9hh/Dh9joJUuzI1Hl2ueXEUXrOXEmYH+IXWjs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vsSPF-0004Ju-Gw;
	Tue, 17 Feb 2026 21:14:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vsSPD-0004JV-G0
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Feb 2026 21:14:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3sBi0yyU5EUFw2ZL1lx8mOIR36OdDRX00ACXGiwE4y8=; b=SbCZQYV6CrSFqbzOYA2CYxv5Sw
 8z8TG+FLa4Ak9SxzmX4AK3JgbbTrRqmsExdTQ5qxyrcKTLj+CV/xkb1Mmgyl7nTm4/9j0GM6NmPdB
 NCwqXHXHFidsnFMegSNrUA4dB905uxm9U3DGKrxvbWvZmWKB4MYZOsO7VMRQaOXbXYVw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3sBi0yyU5EUFw2ZL1lx8mOIR36OdDRX00ACXGiwE4y8=; b=SVhs2isAFJ0qSldQErrtinkvgm
 meCnGYmBCDc7PdhZESpwDiEvzGHRSWjIfZmEm0Q+DcGpvIhkfUBfJAAqHCrh5DN/LkvLLMmhmAlBj
 XRuP9KDGNS0LUHd+m9IVSXnGZC1POgOqvStx0tOZf/qhFmWbdzapUHCRYcZEm5+e88iQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vsSPD-0001TY-HJ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Feb 2026 21:14:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BFE5D6185A;
 Tue, 17 Feb 2026 21:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7486AC2BC86;
 Tue, 17 Feb 2026 21:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771362880;
 bh=5PKRA6JisViHy/Wt+cxaLmoaEMt0eP0saSrcTq0zDDI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=nYDLMu4EsZ+ybxrnDEGJ0hhXnV3XzXDcAUNSHNW9WD1vmFRw7eK7sqfsOKZchNkdQ
 iWsJ/BLiHUb1zxwbZEL53A4ROd5F5RqRP9DFRpxoPZxC1FyR+kM5x1EwCQVgd0y0uo
 tspuUfkt+BOs6dctpP9v3K+aCf6rjdPBDyjEQQT9bBrqPfcwCo5B1KQWUmvdM4Lp0c
 zidBp52jkgRn1EPdGPglSWNzNvdbSO+PMCdsh2+ny+JiD15l1swPfNY04ev2WRqD5o
 BZwhk4buxzsV5HQ2f8JLto9W73xXwKDf1PPvdYpP9zuTIMFL0ZPl1XwUKdMii+xqQM
 82YR0p6MUHM2A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 84FE23806667; Tue, 17 Feb 2026 21:14:33 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177136287232.643511.13012047389860653614.git-patchwork-notify@kernel.org>
Date: Tue, 17 Feb 2026 21:14:32 +0000
References: <20260202060754.270269-2-hch@lst.de>
In-Reply-To: <20260202060754.270269-2-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Eric Biggers <ebiggers@kernel.org>: On Mon, 2 Feb 2026 07:06:30 +0100 you
 wrote: > Issuing more reads on errors is not a good idea, especially when
 the > most common error here is -ENOMEM. > > Signed-off-by: Christoph Hellwig
 <hch@lst.d [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vsSPD-0001TY-HJ
Subject: Re: [f2fs-dev] [PATCH 01/11] fsverity: don't issue readahead for
 non-ENOENT errors from __filemap_get_folio
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
Cc: fsverity@lists.linux.dev, brauner@kernel.org, tytso@mit.edu, jack@suse.cz,
 aalbersh@redhat.com, willy@infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org, dsterba@suse.com,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:jack@suse.cz,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:dsterba@suse.com,m:viro@zeniv.linux.org.uk,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lst.de:email]
X-Rspamd-Queue-Id: 917D31509D6
X-Rspamd-Action: no action

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Eric Biggers <ebiggers@kernel.org>:

On Mon,  2 Feb 2026 07:06:30 +0100 you wrote:
> Issuing more reads on errors is not a good idea, especially when the
> most common error here is -ENOMEM.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/verity/pagecache.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Here is the summary with links:
  - [f2fs-dev,01/11] fsverity: don't issue readahead for non-ENOENT errors from __filemap_get_folio
    https://git.kernel.org/jaegeuk/f2fs/c/23eec9fd64b2
  - [f2fs-dev,02/11] readahead: push invalidate_lock out of page_cache_ra_unbounded
    (no matching commit)
  - [f2fs-dev,03/11] ext4: move ->read_folio and ->readahead to readahead.c
    (no matching commit)
  - [f2fs-dev,04/11] fsverity: kick off hash readahead at data I/O submission time
    (no matching commit)
  - [f2fs-dev,05/11] fsverity: deconstify the inode pointer in struct fsverity_info
    https://git.kernel.org/jaegeuk/f2fs/c/7e36e044958d
  - [f2fs-dev,06/11] fsverity: push out fsverity_info lookup
    (no matching commit)
  - [f2fs-dev,07/11] fs: consolidate fsverity_info lookup in buffer.c
    https://git.kernel.org/jaegeuk/f2fs/c/f6ae956dfb34
  - [f2fs-dev,08/11] ext4: consolidate fsverity_info lookup
    (no matching commit)
  - [f2fs-dev,09/11] f2fs: consolidate fsverity_info lookup
    (no matching commit)
  - [f2fs-dev,10/11] btrfs: consolidate fsverity_info lookup
    https://git.kernel.org/jaegeuk/f2fs/c/b0160e4501bb
  - [f2fs-dev,11/11] fsverity: use a hashtable to find the fsverity_info
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
