Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 75SAIsScO2p1aQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 11:00:52 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 242D66BCC1B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 11:00:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=Iy4l6s8z;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=bF1EkwbQ;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=m1s6Uo7k;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=V0v3ckCZ;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIuhvolWLceyEMEgwmDCFRE2/8FYwxcn+h10tb51Fxw=; b=Iy4l6s8zWCJWV2v7zCe2WW3/gi
	nBSy8X06+dJaBLmcxs49XXY8Pp4bgbFKBOjhfSftAe5O2whSHYamUujb8k7itztKnk6TqLQQZ6jFW
	QdnpCx66El1CdVJX2VDdGGuyyj3L9RmwPQ7/jd13nupb75SNV+GVZtMh7k5yITq55ZPI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wcJTK-0003A8-GM;
	Wed, 24 Jun 2026 09:00:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wcJT2-00039j-Ah
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 09:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kfog2XYgdAz2tICEuYPMWdkUUmomPmspfGK5Ice4Jqo=; b=bF1EkwbQyXl0KUh7g0Vc7+8Sqc
 nKf0+nr82EUzorML2fsKig8UuWbDlh5wxTfOwnzda6eISSij9+qtB1yoOMuwEeQgIeVVd57cycN2g
 HoMk+0Nnh8ZB6CBTjY8A0s0GbfITAVhgDApae+l3pAV2sz4Yc42yU2JPU6l9uUi7S1iI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kfog2XYgdAz2tICEuYPMWdkUUmomPmspfGK5Ice4Jqo=; b=m1s6Uo7kZQFgTb5D+3C8x/+mk6
 0wdWVVZxVDbVzG3Pb7cESe3wKjzuD+HJBTphmvGtQvQwmvd5WwXMBMXdX6t02s/UyvaS/F+b3GhWt
 hV0utBumTH3HthcxzkTGAyNpcCIhDmWPwJvf/dkrhWPYj5iKOqhlT6gywVxAWxJoR4kc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wcJSa-0000rN-Q8 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 09:00:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B510B601F6;
 Wed, 24 Jun 2026 08:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B7FB1F00A3A;
 Wed, 24 Jun 2026 08:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782291582;
 bh=Kfog2XYgdAz2tICEuYPMWdkUUmomPmspfGK5Ice4Jqo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc;
 b=V0v3ckCZreTLHBWI2DQ0Ao25Y2i7ybcWseLm5EmwZbWIMxXez49bh7wb4hoL0MemX
 DDnYyi/vw5GJfHrQ/nea3efur8GwSo6hHb3jkbxFbOqy/okRn5cN/85xQjJ6mjDG3E
 rh6X9Vbxc6QDIGD/QQsi37GlKZIbP897GIkoIzpA71qLlbXaqjlGTnepv2FJL+zW3f
 cRxLhJk9v9PQ4c9o/3tHGft0Siobxcj7RlwAiGe5Rd4u0L+GdE27NO8nSq7Ejypayi
 OIT4ZDLC7ChIudE/UAu7X5xDl1AIhiVS7qTcYBgu4jce5ylVUtFOy5H5kQOperMV7o
 XYe4Gn18KEkZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 93A1D39EF964; Wed, 24 Jun 2026 08:59:32 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <178229157126.2577930.6775564706271606889.git-patchwork-notify@kernel.org>
Date: Wed, 24 Jun 2026 08:59:31 +0000
References: <20260520123722.405752-1-aalbersh@kernel.org>
In-Reply-To: <20260520123722.405752-1-aalbersh@kernel.org>
To: Andrey Albershteyn <aalbersh@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello: This series was applied to jaegeuk/f2fs.git (dev) by
 Christian Brauner <brauner@kernel.org>: On Wed, 20 May 2026 14:36:58 +0200
 you wrote: > Hi all, > > This patch series adds fs-verity support for XFS.
 This version stores > merkle tree beyond end of the file, the same way as
 ext4 does it. Th [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wcJSa-0000rN-Q8
Subject: Re: [f2fs-dev] [PATCH v10 00/22] fs-verity support for XFS with
 post EOF merkle tree
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
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org, djwong@kernel.org,
 david@fromorbit.com, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aalbersh@kernel.org,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:djwong@kernel.org,m:david@fromorbit.com,m:linux-unionfs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 242D66BCC1B

Hello:

This series was applied to jaegeuk/f2fs.git (dev)
by Christian Brauner <brauner@kernel.org>:

On Wed, 20 May 2026 14:36:58 +0200 you wrote:
> Hi all,
> 
> This patch series adds fs-verity support for XFS. This version stores
> merkle tree beyond end of the file, the same way as ext4 does it. The
> difference is that verity descriptor is stored at the next aligned 64k
> block after the merkle tree last block. This is done due to sparse
> merkle tree which doesn't store hashes of zero data blocks.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v10,01/22] fsverity: report validation errors through fserror to fsnotify
    (no matching commit)
  - [f2fs-dev,v10,02/22] fsverity: expose ensure_fsverity_info()
    (no matching commit)
  - [f2fs-dev,v10,03/22] ovl: use core fsverity ensure info interface
    (no matching commit)
  - [f2fs-dev,v10,04/22] fsverity: generate and store zero-block hash
    https://git.kernel.org/jaegeuk/f2fs/c/07d09774e2bf
  - [f2fs-dev,v10,05/22] fsverity: pass digest size and hash of the all-zeroes block to ->write
    (no matching commit)
  - [f2fs-dev,v10,06/22] fsverity: hoist pagecache_read from f2fs/ext4 to fsverity
    (no matching commit)
  - [f2fs-dev,v10,07/22] iomap: introduce IOMAP_F_FSVERITY and teach writeback to handle fsverity
    https://git.kernel.org/jaegeuk/f2fs/c/63e242afa466
  - [f2fs-dev,v10,08/22] iomap: teach iomap to read files with fsverity
    https://git.kernel.org/jaegeuk/f2fs/c/1d140731753a
  - [f2fs-dev,v10,09/22] iomap: introduce iomap_fsverity_write() for writing fsverity metadata
    https://git.kernel.org/jaegeuk/f2fs/c/36a36c4cac91
  - [f2fs-dev,v10,10/22] xfs: introduce fsverity on-disk changes
    (no matching commit)
  - [f2fs-dev,v10,11/22] xfs: initialize fs-verity on file open
    (no matching commit)
  - [f2fs-dev,v10,12/22] xfs: don't allow to enable DAX on fs-verity sealed inode
    (no matching commit)
  - [f2fs-dev,v10,13/22] xfs: disable direct read path for fs-verity files
    (no matching commit)
  - [f2fs-dev,v10,14/22] xfs: handle fsverity I/O in write/read path
    (no matching commit)
  - [f2fs-dev,v10,15/22] xfs: use read ioend for fsverity data verification
    (no matching commit)
  - [f2fs-dev,v10,16/22] xfs: add fs-verity support
    (no matching commit)
  - [f2fs-dev,v10,17/22] xfs: remove unwritten extents after preallocations in fsverity metadata
    (no matching commit)
  - [f2fs-dev,v10,18/22] xfs: add fs-verity ioctls
    (no matching commit)
  - [f2fs-dev,v10,19/22] xfs: advertise fs-verity being available on filesystem
    (no matching commit)
  - [f2fs-dev,v10,20/22] xfs: check and repair the verity inode flag state
    (no matching commit)
  - [f2fs-dev,v10,21/22] xfs: introduce health state for corrupted fsverity metadata
    (no matching commit)
  - [f2fs-dev,v10,22/22] xfs: enable ro-compat fs-verity flag
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
