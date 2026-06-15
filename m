Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XLekDZoaMGqmNgUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 17:30:34 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B5A687B22
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 17:30:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=ggjODxDj;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=NDTsuJy8;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=hZW0EUiN;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=Zdv7GaxG;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eO4C2aNqNl7qWEnp3VjfM1ZKNiivSOn5WNRs7X2FU7c=; b=ggjODxDjIkQN2LtiRDrgYVGzjD
	EphrynNmE4LFkAgo+Sry0MeEhjXP5/RvMJhWgXgm8ol0s/yFDJaB9Hq1Gs5zxGKELAaIhVXR/dxU5
	Bq28/4qScFWxX9bQIZuYfJBDSXLBILhz34aK0cb/ujgnRCea0PaO54g+5n7hDtcoLnp4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ9Gf-0008JO-VU;
	Mon, 15 Jun 2026 15:30:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wZ9GY-0008J7-NF
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 15:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AnpkiEHVbIFwPl7cV5ytrwKnzQNDlDPJjewwP6FIOJY=; b=NDTsuJy8T7YAnns1r31SQ3mQwX
 EdAzQrNR2XO2sQz8ZjGHo2wxCZND2oTkDudM3isopVBN0iFCXq36IhG/nH+RPNc1fmpkRpbHv9iTL
 yDt/SKjszQM2aYXsj0ahWXrZlQ0akynYMCqsUtRS8/CMz/3LMfuIYC50k7ZkiIJUVx/Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AnpkiEHVbIFwPl7cV5ytrwKnzQNDlDPJjewwP6FIOJY=; b=hZW0EUiNadNY+2cHYl74BLVYgP
 m+rVZvuEyoejoQOKqZ2oLTZkA/UY/JHca6CoDLybeOnlXABC2yh1hoMNidleBzdJu6E6Kr2lNP5Od
 qGTFZ0UVV5fmdpQlrBPFdBAIIflstBcQmhQi2r0mnWgnD/Prgpq8nl4fc3brRQ1AX2z0=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZ9GX-0002ul-BD for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 15:30:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8A4754057A;
 Mon, 15 Jun 2026 15:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C1251F000E9;
 Mon, 15 Jun 2026 15:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781537416;
 bh=AnpkiEHVbIFwPl7cV5ytrwKnzQNDlDPJjewwP6FIOJY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc;
 b=Zdv7GaxG9sry1PWmQxt2TCtT9QKgQ5Jw3UqLfUlAM+QG8rsbUXbJla0X88s/CAm7g
 cYrE9wpJ6nNuCOHIA8YKNXiU682GMVMqDaKUZ+c1VvTuyZhPxqUyNEz3cf9WR2xfIN
 dSU0z4pqcmabEBJN4cOKeTmTKI5P4/aCYqphgcy+DFN9yd7tsRHnk5eGlow42VH9Qc
 kBLWonPhjuQCw96a5cpfWQcRygV4TVjxmq9+fA1u1mR+x365uxXQlbDkGyzIr5rYZS
 arJUYUeeVju/e5e5XXADWGeDetGZ2+4pmYcbGlsAti/Yl1d3+uKbFuBjFcFI4QmVNA
 b18kFYgJUbYpg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 D0A423811A64; Mon, 15 Jun 2026 15:30:12 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <178153741138.3946007.11156658533151898127.git-patchwork-notify@kernel.org>
Date: Mon, 15 Jun 2026 15:30:11 +0000
References: <20260525061456.231710-1-qiwenjie@xiaomi.com>
In-Reply-To: <20260525061456.231710-1-qiwenjie@xiaomi.com>
To: Wenjie Qi <qwjhust@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 25 May 2026 14:14:56 +0800 you
 wrote: > Compressed data writes are accounted as F2FS_WB_CP_DATA because they
 > write compressed pages through fio->compressed_page. Their end_io path
 > should t [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wZ9GX-0002ul-BD
Subject: Re: [f2fs-dev] [PATCH] f2fs: stop checkpoint on compressed write IO
 error
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
Cc: yuchao0@huawei.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, qiwenjie@xiaomi.com,
 jaegeuk@kernel.org, stable@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
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
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qwjhust@gmail.com,m:yuchao0@huawei.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:qiwenjie@xiaomi.com,m:jaegeuk@kernel.org,m:stable@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 18B5A687B22

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Mon, 25 May 2026 14:14:56 +0800 you wrote:
> Compressed data writes are accounted as F2FS_WB_CP_DATA because they
> write compressed pages through fio->compressed_page.  Their end_io path
> should therefore have the same checkpoint-stop behavior as ordinary
> F2FS_WB_CP_DATA writes.
> 
> However, f2fs_compress_write_end_io() only records -EIO in the inode
> mapping when the bio fails.  The filesystem can keep checkpointing after
> that failure, so a later checkpoint may persist metadata that points to
> compressed data blocks whose writeback failed.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev] f2fs: stop checkpoint on compressed write IO error
    https://git.kernel.org/jaegeuk/f2fs/c/d99bb310a134

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
