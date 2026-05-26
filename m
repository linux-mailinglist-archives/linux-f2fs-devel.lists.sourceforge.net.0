Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPKcIv1zFWqdVAcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2026 12:20:45 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8E55D4152
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2026 12:20:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHoinw2ppqoYZhR/UsRq/wuUNfwyX1izA6v8JEjLyQY=; b=nUyPrk3ewImuE795kGiZeOckDe
	rgJjYijKVD6LzQ1R8Ar0yUU5pzbH9ZRSunlPXzkWAG4yQ4hIryeN6+ykFZPCPiiPGF6BuODgVtb41
	Tj5YQeaDyp0akCVEHOn9qD98rnyoExLJxBWonIv69hoSsOvd1SiGeE4gl4VI6vAlZxXo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wRotk-0001SY-F9;
	Tue, 26 May 2026 10:20:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cem@kernel.org>) id 1wRotR-0001Lf-Sc
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 May 2026 10:20:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qWbiUioGQWD1oNqwL1vRZhi7+oCXyyFRIUYuY3v+xgs=; b=m/HXzk1KL9chdKPJHFIrL4J0bj
 dv9wiHF0pt5h4dqVI3bcMsPf3FhkG1JHelqxT72e7NDSR9Y1pV1t9MFW+NiXnt0k9kjxMdjXHOeY2
 z66Ic9SZTV6A0SQAi3SOGuGivWKSGK4iv0VgPjoBlWKGbvyucNNRjuPVggjp0L6o2xtk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qWbiUioGQWD1oNqwL1vRZhi7+oCXyyFRIUYuY3v+xgs=; b=avbSLefSttejYh0r+Q+ndL92+M
 42yixoPDll1OM2xx4QxJQCZPujHc+hbJmQukvZkhfg5paimU3fdatWBeNLVWkr4ZSUKlPTCqwsXVo
 xHhqp0mp/52CfC7b62KCEtVnIVV0JIH/9btpzygosH+0GfVmI6lEdE1S2C2NwDFmCSKo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wRotD-0008Hl-U5 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 May 2026 10:20:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0724C433E3;
 Tue, 26 May 2026 10:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D538B1F00A3C;
 Tue, 26 May 2026 10:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779790789;
 bh=qWbiUioGQWD1oNqwL1vRZhi7+oCXyyFRIUYuY3v+xgs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=cUMA/lAqbZLBRBVHvV8INPx+YT1E98Lmh8jjTZjyuUdXav6fgsed3ODm8/5GTF6JD
 woNd2WKuTr7z6+CeBrbc86JH6Pov4/A5ZQHARinht8ydGy9npfb4Ci3fBh9MYNHd2Q
 +JkYMCR7rM7GdLWkF99iLWWGDeHvCkDjOVtvNUWE3UIYRBSXXPMleSkZ3F19/e2PAq
 pOuh+w7MH3OX0CUNxFnoNS0CIs2s/NAVOepv+iGfH0D+0xX5/2o2q4ktlWxw3Oj/PV
 /RQR9Zl2vf1B02hYABnZpIz1Y00Vfb1oEqjVR1FdKrRPcAAQCfzJP8zVSInk+u7WB2
 Q7D5XFNnYFsgg==
Date: Tue, 26 May 2026 12:19:43 +0200
To: Christoph Hellwig <hch@lst.de>
Message-ID: <ahVzkf8JoKP-kSC2@nidhogg.toxiclabs.cc>
References: <20260520123722.405752-1-aalbersh@kernel.org>
 <20260521090705.GA14254@lst.de>
 <gcw7zcg6p4s2egpufwizfig72g6ren7jfmuz5mqskkpb7xepww@e3v35j7bk7dc>
 <ag7uW7KQ5mVyCGEv@nidhogg.toxiclabs.cc>
 <20260522-unbehagen-baumethode-erlesen-811a4065eeac@brauner>
 <20260522120757.GA21041@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260522120757.GA21041@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, May 22, 2026 at 02:07:57PM +0200, Christoph Hellwig
 wrote: > On Fri, May 22, 2026 at 12:03:20PM +0200, Christian Brauner wrote:
 > > > I was expecting this to come through xfs tree too if Eric [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wRotD-0008Hl-U5
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
 Andrey Albershteyn <aalbersh@redhat.com>, david@fromorbit.com,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:brauner@kernel.org,m:aalbersh@kernel.org,m:djwong@kernel.org,m:aalbersh@redhat.com,m:david@fromorbit.com,m:linux-unionfs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nidhogg.toxiclabs.cc:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 2B8E55D4152
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 02:07:57PM +0200, Christoph Hellwig wrote:
> On Fri, May 22, 2026 at 12:03:20PM +0200, Christian Brauner wrote:
> > > I was expecting this to come through xfs tree too if Eric and Christian
> > > agree.
> > 
> > You may take it through the xfs tree if there are no conflicts with
> > vfs-7.2.iomap. If there are I want to add the iomap changes into
> > vfs-7.2.iomap that you can pull in.
> 
> Merging the iomap bits through the iomap branch might make sense, given
> that iomap usually tends to see quite a bit of activity.
> 

That sounds good to me. If you want to go ahead and pull in the iomap
bits, do so, and give me a heads up when you do it so I'll pull your
branch locally.

Cheers.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
