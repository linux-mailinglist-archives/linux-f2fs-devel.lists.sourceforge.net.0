Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JoMiML5qI2obtgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 06 Jun 2026 02:33:02 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5FC64C047
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 06 Jun 2026 02:33:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=W6KumCVn;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=jGwHwgJv;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=hhuug4Xy;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=AkoQvq4B;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPVPRxzsQsowPkmltQiFqhYUkoxjDWXBZC5+XUofXrw=; b=W6KumCVnvHoeQCt8xmX/Ntmhph
	5DXszlIU6XRWu8/009QZup1oWxCyoaYFdjRHNo06deMNhXQvY8ns3N2qdwLL5y/d4VYW8VzQD7fBV
	1G6e0x1W9RJLDJgdfNxmzQrXaJ+B84+bMHucPl+ytf9OdrH5Ton0OttcjrYnNMCuguTA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wVey1-0005P9-VB;
	Sat, 06 Jun 2026 00:32:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wVey0-0005P3-Mr
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 06 Jun 2026 00:32:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5zuZa+y8C4pOL20xk/8SVshbqVXoS7fTVVqM+ginZmg=; b=jGwHwgJvV6mD3epMwVyN+ikRLX
 +xDwUGWEQJ1HhR9Us+NFjElhzWpog9TglpPeN6ylCdtVigR6A0Ze9cDw5tBc4YMpOmFBphdS2LB1q
 zTQYrEweePcJCdSgAdNyFbWdJ14g7rJBaP4scPgu3tNwzUTyCHbvJBL3M45c7WFcytFc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5zuZa+y8C4pOL20xk/8SVshbqVXoS7fTVVqM+ginZmg=; b=hhuug4Xyf5BTaG/bCjym+9ZhCm
 e3Z6U4gv8X3IibviztWKvgA9S6PVPdtGM4jTz7foE/7WzvjWI67mrTicPB4B3ltk6SQLaN438r9T4
 wrgElZqLd5YTTBcRlUTRrZya9bRQVkqfOWpspndICEpC9I95d5OLkrDfuDDjdBUACS/8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wVexz-0000Pn-EJ for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 06 Jun 2026 00:32:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 39FD8600AE;
 Sat,  6 Jun 2026 00:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F611F00893;
 Sat,  6 Jun 2026 00:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780705961;
 bh=5zuZa+y8C4pOL20xk/8SVshbqVXoS7fTVVqM+ginZmg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=AkoQvq4B13quYGScJqkAwm8RnHOTpaxZTQFoh7AHFBX5LwloiT1c61ZVzWU1AeUdc
 H8pH3QQaNy+xJFvN5zX0JkcFUtzxMex8CxTr4Z6TZHUcljETyIuQ78M9BK0yatiFKK
 XpdwKyrz5YfHtENQUxhKym3Bqvm7Eu0ck/j7dvMo4aupKmKNOrzcD+qG/jLdxhneTq
 uNZmaP/cydmHJ+IXJFqiuWOTq2KYqZy5co8yqDpac1AKOig2xtofSK7/00qtfDpz5a
 s/P70KfY12T8mL/TtPf6PYT4uzusfPInAmQrmNcHRCvtlwYxjCxmX0d9sHROt1znI/
 /DuVffkMHAdbg==
Date: Sat, 6 Jun 2026 00:32:40 +0000
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20260606003240.GB2312230@google.com>
References: <20260605212504.1080138-1-daeho43@gmail.com>
 <20260605221027.GA2312230@google.com>
 <CACOAw_xrMij0pXjFkS4gY0kt5buvfZ0gmzbcP+zx4-ox7n+_3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_xrMij0pXjFkS4gY0kt5buvfZ0gmzbcP+zx4-ox7n+_3Q@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jun 05, 2026 at 04:51:34PM -0700, Daeho Jeong wrote:
 > - Access Control: The F2FS_IOC_EXCLUDE_DEV_ALIAS ioctl strictly > requires
 CAP_SYS_ADMIN. Unprivileged users cannot trigger this > transi [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wVexz-0000Pn-EJ
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: support dynamic include/exclude for
 device aliasing
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:daeho43@gmail.com,m:daehojeong@google.com,m:kernel-team@android.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4E5FC64C047

On Fri, Jun 05, 2026 at 04:51:34PM -0700, Daeho Jeong wrote:
> - Access Control: The F2FS_IOC_EXCLUDE_DEV_ALIAS ioctl strictly
> requires CAP_SYS_ADMIN. Unprivileged users cannot trigger this
> transition.

No, it doesn't.

How much of this been reviewed by a human?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
