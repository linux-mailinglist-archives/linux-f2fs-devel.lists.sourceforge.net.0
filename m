Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAhLEUvalGlyIQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Feb 2026 22:14:51 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6271509B5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Feb 2026 22:14:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsP5oruDU3tqVlPUjSR5at17daTGs6asqnZ4Wzhtuhs=; b=HRexPRFiLbh01hw6DFx0MVW0Ga
	Rh49ZCC3wfPLvJ48vO2nD679Z1KEtxHP/+SePd7U0loZUn0G3ONALjD4rbrx6fXKfywLv1Bawi4Gt
	Z24dUyjx51sqnA+s4Eg9W5oJSND6ONmOUeCIm8BGOE8k6k/UOIM7px7Fgrj/CrG2xhEk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vsSPB-0006Gb-9W;
	Tue, 17 Feb 2026 21:14:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vsSP9-0006GV-Ld
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Feb 2026 21:14:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v2Bo7x/MjRBaXVAYls5xWp9PcWy/XpDArRCO/SosFK8=; b=fJ3bQ5A+4kZjHF7V+U66oH7/Lr
 /kasE/iFYgFtZ4xvjBIaI+/8phFLWe9AG5cJhlbbsi97JQO44R0XR+fjpvGfy1eqRqGMV/rRLlrOJ
 biOfB8pZPIcXH7ukm1KBa+HlGkpisygyoVP9JwKfLonrMXmWIa3BXUtnD0fMrDmd5pNo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v2Bo7x/MjRBaXVAYls5xWp9PcWy/XpDArRCO/SosFK8=; b=Q52efmGlNDnQE4R15Q1jRz+i9T
 7Z13ehudNH5xI6MexAzwKCvyFrwOlB2tOhzWNLzmhd/PNsSTgxj3nASCYsDG6lA0uwWK7c8Qjd1Vt
 Um+W9iMDuLMGp52awtTuofdMDNuXASGlUNxM3x0KjdgTChOlYWeA+TSHJh1pSoGvbDNc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vsSP8-0001TM-Td for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Feb 2026 21:14:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9FF4240BCF;
 Tue, 17 Feb 2026 21:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76BD9C4CEF7;
 Tue, 17 Feb 2026 21:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771362876;
 bh=IUmsV+ZW94HXGIdU1vo18SjFXSfXhU6JnfKGHOOTBlE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Sb1sDYwJavRLaCVn88gyrDrXlCl0VDnAf62EpkDuPznZMYdbNVtd73gzpyyfSdJ/a
 WqACZhS/EGrPNEG45ARHMKVSGdP4aeQlnn6gf3sjgM1aEN6XQUPh1tFIPxa/SFcDZV
 zg+JLJ84QRyz9qMMJ6QRwLumUMlXlT/vueB7bcmbanb6s6FW/imJ3kiNi93Qoh9O4T
 yvIJ/cNS+jpX41ID+1Kh3XhScgnFe76gfOndPmsMTOoFu0qovNOVXnWM1GF4epkhvw
 mpLacztvHIMGsbHj6XNwKmeJ8uOk0LCt6hh+EbNCXNDb5hYrgzVZHIt+ZOM+kqd7aN
 rIRQXaYrAalKw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 851203806667; Tue, 17 Feb 2026 21:14:29 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177136286807.643511.1738733092656907396.git-patchwork-notify@kernel.org>
Date: Tue, 17 Feb 2026 21:14:28 +0000
References: <20260128152630.627409-2-hch@lst.de>
In-Reply-To: <20260128152630.627409-2-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Eric Biggers <ebiggers@kernel.org>: On Wed, 28 Jan 2026 16:26:13 +0100 you
 wrote: > Add the check to reject truncates of fsverity files directly to
 > setattr_prepare instead of requiring the file system to handle it. > Besides
 removing [...] 
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
X-Headers-End: 1vsSP8-0001TM-Td
Subject: Re: [f2fs-dev] [PATCH 01/15] fs,
 fsverity: reject size changes on fsverity files in setattr_prepare
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
 djwong@kernel.org, aalbersh@redhat.com, willy@infradead.org,
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
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:jack@suse.cz,m:djwong@kernel.org,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:dsterba@suse.com,m:viro@zeniv.linux.org.uk,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lst.de:email,suse.cz:email]
X-Rspamd-Queue-Id: 9F6271509B5
X-Rspamd-Action: no action

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Eric Biggers <ebiggers@kernel.org>:

On Wed, 28 Jan 2026 16:26:13 +0100 you wrote:
> Add the check to reject truncates of fsverity files directly to
> setattr_prepare instead of requiring the file system to handle it.
> Besides removing boilerplate code, this also fixes the complete lack of
> such check in btrfs.
> 
> Fixes: 146054090b08 ("btrfs: initial fsverity support")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,01/15] fs, fsverity: reject size changes on fsverity files in setattr_prepare
    https://git.kernel.org/jaegeuk/f2fs/c/e9734653c523
  - [f2fs-dev,02/15] fs, fsverity: clear out fsverity_info from common code
    https://git.kernel.org/jaegeuk/f2fs/c/70098d932714
  - [f2fs-dev,03/15] ext4: don't build the fsverity work handler for !CONFIG_FS_VERITY
    https://git.kernel.org/jaegeuk/f2fs/c/fb2661645909
  - [f2fs-dev,04/15] f2fs: don't build the fsverity work handler for !CONFIG_FS_VERITY
    https://git.kernel.org/jaegeuk/f2fs/c/6f9fae2f738c
  - [f2fs-dev,05/15] fsverity: pass struct file to ->write_merkle_tree_block
    (no matching commit)
  - [f2fs-dev,06/15] fsverity: start consolidating pagecache code
    (no matching commit)
  - [f2fs-dev,07/15] fsverity: don't issue readahead for non-ENOENT errors from __filemap_get_folio
    (no matching commit)
  - [f2fs-dev,08/15] fsverity: kick off hash readahead at data I/O submission time
    (no matching commit)
  - [f2fs-dev,09/15] fsverity: deconstify the inode pointer in struct fsverity_info
    https://git.kernel.org/jaegeuk/f2fs/c/7e36e044958d
  - [f2fs-dev,10/15] fsverity: push out fsverity_info lookup
    (no matching commit)
  - [f2fs-dev,11/15] fs: consolidate fsverity_info lookup in buffer.c
    https://git.kernel.org/jaegeuk/f2fs/c/f6ae956dfb34
  - [f2fs-dev,12/15] ext4: consolidate fsverity_info lookup
    (no matching commit)
  - [f2fs-dev,13/15] f2fs: consolidate fsverity_info lookup
    (no matching commit)
  - [f2fs-dev,14/15] btrfs: consolidate fsverity_info lookup
    https://git.kernel.org/jaegeuk/f2fs/c/b0160e4501bb
  - [f2fs-dev,15/15] fsverity: use a hashtable to find the fsverity_info
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
