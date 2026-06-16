Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WphgFAS6MGq6WgUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 04:50:44 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3682768B8B7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 04:50:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="Xhqvs/r1";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=W2hCFf0a;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=PNOAJ9Df;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=hAi6Lpjd;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i5pS6RVj0fAh33iNJMIpYuZFq/Hov9j/BynFLTkBdoY=; b=Xhqvs/r1BQ0gMNWgpYozgePZM9
	qOx1ZBod4R9KwDWkv9H7ncNAnrXqNRv1H08I9uG5v6iA6RI1P1mfY8XsJd0Ya2QnjNKudawYGYaj6
	+Zs6X/usc5w5ymLQKb6Ucsc6Gn5CMOcr3WSU443ZPv7zQ/QRYilIgWqRNaYbTSHL6SVM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZJss-0004F4-NW;
	Tue, 16 Jun 2026 02:50:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1wZJsr-0004Ek-NJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 02:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=06TBOGi7690R+qkGB7Fu29ajlGGs9bR49GMrF5csLbc=; b=W2hCFf0aRn/tAkuuWlIpm/GdeY
 ldshnTQMxYvWfZvup/zE/uvyyd9eD39HvsozI5fEPtGs5W65Zp+fibceWNfUt3Av4/T+AeV8JBWgx
 zOsVJK5R7TjvCNMxg1UZH3QIMScfd7wTX6kvFBekC76HXjxO4la0VU+KukaL7Q6yf16U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=06TBOGi7690R+qkGB7Fu29ajlGGs9bR49GMrF5csLbc=; b=PNOAJ9Dfqt9fGcKJsCHvULNIFl
 XFpeMAqSQsLrNr3tvNZhLrRglQVC0PAN1tYGHVWBNS36i/9pKvZLjwKnicvli/owHCW6TO4K16HRE
 Tc/DezKvOZco5ZAyiJff4xgfjzUKrQds7hOVPALUDhu2Mxbjdtb/uP226oK90sEhevJw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZJsh-0008QC-Bo for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 02:50:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8C52B402CA;
 Tue, 16 Jun 2026 02:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F8491F000E9;
 Tue, 16 Jun 2026 02:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781578217;
 bh=06TBOGi7690R+qkGB7Fu29ajlGGs9bR49GMrF5csLbc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc;
 b=hAi6LpjdkrdFbwPyaQvi8lzi514RBXWuHtvhJgW34eMRC83Em5O6xAPX5I2LYIBX/
 qM2Qm+gUx2mn8y4eCGl9m0j3ITiR0OvLrmyD2NOmsjeB676VIpJIKNYXE/fBLBwYfc
 1nU+V8AVXNri+kX9x1hcucq/5YGYrdfBIquoagEMD1dV1QxhvRZ6mqPhdoAbq8IBYp
 l1taEz4RBhNDB8rhA8zReNiP1C8ftnS3XLc7iMAcTnTUneKJ8VmHzcJOjBYdAs57zp
 UGRSIV0pJDztmtAS3Swzg5bOEVyHcHCLuQ1o6eqoalyTfjCHGGP7VL0w+GsOA31Tsp
 9c9fXwdz46/Uw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 9392D3839A26; Tue, 16 Jun 2026 02:50:13 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <178157821213.407856.7636242009401767293.git-patchwork-notify@kernel.org>
Date: Tue, 16 Jun 2026 02:50:12 +0000
References: <20260610143735.3169935-1-qiwenjie@xiaomi.com>
In-Reply-To: <20260610143735.3169935-1-qiwenjie@xiaomi.com>
To: Wenjie Qi <qwjhust@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Wed, 10 Jun 2026 22:37:35 +0800 you
 wrote: > F2FS large folios are only enabled for immutable non-compressed
 files.
 > Writable open and writable mmap reject such mappings, but truncate(2) >
 through [...] 
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
X-Headers-End: 1wZJsh-0008QC-Bo
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: reject setattr size changes on
 large folio files
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 qiwenjie@xiaomi.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:qwjhust@gmail.com,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:qiwenjie@xiaomi.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3682768B8B7

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Wed, 10 Jun 2026 22:37:35 +0800 you wrote:
> F2FS large folios are only enabled for immutable non-compressed files.
> Writable open and writable mmap reject such mappings, but truncate(2)
> through f2fs_setattr() misses the same guard.
> 
> If FS_IMMUTABLE_FL is cleared while the inode is still cached, the mapping
> can keep large-folio support and ATTR_SIZE can change i_size. Reject size
> changes in that state.
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,v2] f2fs: reject setattr size changes on large folio files
    https://git.kernel.org/jaegeuk/f2fs/c/831bece2d6e6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
