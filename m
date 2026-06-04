Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id paZHFs1qIWqAGAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 04 Jun 2026 14:08:45 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 997AE63FB8B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 04 Jun 2026 14:08:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=BKq3Q7Tc;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=iR0s49vu;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=VqlwNOAr;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=hviMYelb;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+RBNenAc4uSofENuHqOo6jEFCNrMXThMMV9cIf+WX0=; b=BKq3Q7TcR4+RuT3yywkv9ZcHVm
	fX/2lWqFg4sPFzPugqqZrjDMiahcw+0qkDCeo7Qxt0/d+Wvo+dKtOK7TjdIm4FPW3maZLRRq+qCW4
	OTuUZ8AYldoxAjP4y2IdXw43Mpl4Q9Th6eHYHex9Fo9+7NJY/qEtxb5nIbqLuOy1TLZM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wV6sH-00044M-S1;
	Thu, 04 Jun 2026 12:08:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cem@kernel.org>) id 1wV6sF-000444-Lb
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jun 2026 12:08:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dqjWETgw2fdknLUk3DwFQ4twFF3wQf7ZwlKX+xqjr7w=; b=iR0s49vu3HFOJUgGxF/hpMKKt2
 XZJ7JHSrcAi0hqZI6HquwHI8Sb0xTxOC2ifurJkE8PtygrKsTgSs5VkzDfBVXVvYPpu9wTn+bf4rj
 IhbhTME2BD1UDrim2+2nKMql0iRjyFB7VsCDqqet8nakjxnpRELH9fypf3id911lsF5g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dqjWETgw2fdknLUk3DwFQ4twFF3wQf7ZwlKX+xqjr7w=; b=VqlwNOArYXKaNlwIbhGBcb/zij
 wBRe+btUlJk9InZVJvoxchxlZ43fzkU+o+RJmIzPaaaMYJRREdr6l15wbH42ITcDrJc7ZO0vj2E+C
 o3iJglF+UKJABjmogvBhUdYGFcxu20QHg4GP7a3O89kCzhNDgZtBvcgj8r8pQp4R+w0c=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wV6sF-0001hh-A8 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jun 2026 12:08:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 2A936602C5;
 Thu,  4 Jun 2026 12:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB0591F00893;
 Thu,  4 Jun 2026 12:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780574904;
 bh=dqjWETgw2fdknLUk3DwFQ4twFF3wQf7ZwlKX+xqjr7w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=hviMYelbCq1FD1zUQhO+fHm5JXTR/dphxJCOG961fCE36/10DX6upgx+CDnxsr5FX
 E7MQVJW6QmbLnI4404ldzJhbz07IxXLVrtKFK1UfQs37p2h5nMYbL9uvFe+0lXC9zM
 /vSYlIo+hzLFJHw5bjRN9Qeb+00uVswiUz9YmLM5wDKhovt9TToPv3JYsZ4fuW0Amc
 ToaJ3qV8OdYyBWByuFT+ELyEYx8lgP+Ra0oTsmTgYQCW0/pEi3v8y6HbDUpJUfzbOq
 MI1Rxx2X/JgEK8gcgHC3OQ50l4LmIzfEAumH4sEFYuy8J1CBGjjQQucDd6JVnnfWZv
 9Vtsb4RtWox3w==
Date: Thu, 4 Jun 2026 14:08:19 +0200
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <aiFqn8uEq_iR2ae7@nidhogg.toxiclabs.cc>
References: <gcw7zcg6p4s2egpufwizfig72g6ren7jfmuz5mqskkpb7xepww@e3v35j7bk7dc>
 <ag7uW7KQ5mVyCGEv@nidhogg.toxiclabs.cc>
 <20260522-unbehagen-baumethode-erlesen-811a4065eeac@brauner>
 <20260522120757.GA21041@lst.de>
 <ahVzkf8JoKP-kSC2@nidhogg.toxiclabs.cc>
 <20260528-offiziell-luftleer-misswirtschaft-3503bda2ad70@brauner>
 <fjdfwhwi4aogyiaoijwvw6w4npuu5mbt6ua6fkhwcp5ajlm543@ume2fkxg36cb>
 <aiE_YQc6SGSdWlcE@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
 <20260604-holen-rundum-ausfechten-2193b39da363@brauner>
 <yezqqgowgmbn2z42zvha7cfcprym5vnurb33brdmooab6csdks@a76a7v6rtywn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <yezqqgowgmbn2z42zvha7cfcprym5vnurb33brdmooab6csdks@a76a7v6rtywn>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jun 04, 2026 at 02:07:05PM +0200, Andrey Albershteyn
 wrote: > On 2026-06-04 14:00:07, Christian Brauner wrote: > > On Thu, Jun
 04, 2026 at 11:04:32AM +0200, Andrey Albershteyn wrote: > > > On [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wV6sF-0001hh-A8
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
From: Carlos Maiolino via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Carlos Maiolino <cem@kernel.org>
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org,
 Christian Brauner <brauner@kernel.org>,
 Andrey Albershteyn <aalbersh@kernel.org>, djwong@kernel.org,
 david@fromorbit.com, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
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
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aalbersh@redhat.com,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:brauner@kernel.org,m:aalbersh@kernel.org,m:djwong@kernel.org,m:david@fromorbit.com,m:linux-unionfs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[cem@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:from_smtp,nidhogg.toxiclabs.cc:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 997AE63FB8B

On Thu, Jun 04, 2026 at 02:07:05PM +0200, Andrey Albershteyn wrote:
> On 2026-06-04 14:00:07, Christian Brauner wrote:
> > On Thu, Jun 04, 2026 at 11:04:32AM +0200, Andrey Albershteyn wrote:
> > > On 2026-05-28 16:50:45, Andrey Albershteyn wrote:
> > > > On 2026-05-28 14:20:08, Christian Brauner wrote:
> > > > > On Tue, May 26, 2026 at 12:19:43PM +0200, Carlos Maiolino wrote:
> > > > > > On Fri, May 22, 2026 at 02:07:57PM +0200, Christoph Hellwig wrote:
> > > > > > > On Fri, May 22, 2026 at 12:03:20PM +0200, Christian Brauner wrote:
> > > > > > > > > I was expecting this to come through xfs tree too if Eric and Christian
> > > > > > > > > agree.
> > > > > > > > 
> > > > > > > > You may take it through the xfs tree if there are no conflicts with
> > > > > > > > vfs-7.2.iomap. If there are I want to add the iomap changes into
> > > > > > > > vfs-7.2.iomap that you can pull in.
> > > > > > > 
> > > > > > > Merging the iomap bits through the iomap branch might make sense, given
> > > > > > > that iomap usually tends to see quite a bit of activity.
> > > > > > > 
> > > > > > 
> > > > > > That sounds good to me. If you want to go ahead and pull in the iomap
> > > > > > bits, do so, and give me a heads up when you do it so I'll pull your
> > > > > > branch locally.
> > > > > 
> > > > > Great, can the series please be resent based on current vfs-7.2.iomap
> > > > > then please? Because the iomap changes in this series don't apply
> > > > > cleanly on vfs-7.2.iomap so we already have merge conflicts...
> > > > > 
> > > > 
> > > > hmm do you mean this branch?
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/log/?h=vfs-7.2.iomap
> > > > 
> > > > patches 07..09 seems to apply cleanly. The only conflict I see is in
> > > > the overlayfs patch 03. This is because [1] (is in -rc5) is missing
> > > > in vfs-7.2.iomap.
> > > > 
> > > > [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/fs/overlayfs/util.c?h=v7.1-rc5&id=0c8c88b8eb82a2a41bec5f17c076d6312dc40316
> > > 
> > > Christian, ping
> > > 
> > > Would be nice to have iomap in vfs, so Carlos can pull and test the
> > > rest
> > 
> > Applied but note IOMAP_F_FSVERITY
> > changed from (1U << 10) to (1U << 11) since we have another flag
> > addition this cycle.
> 
> Oh I haven't noticed that, thanks!

Thanks Christian. I'll deal with the rest of the series next week!

> 
> -- 
> - Andrey
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
