Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIdAMxkzGGpwfggAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2026 14:20:41 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B8C5F1FDD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2026 14:20:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TjZBtamQd/1H5PdYQiT0FBsAJwTayJ1J5DUnlfxcCgI=; b=R3VDJFZNZ/ZrjzcCNoyneLXt5G
	N3LsZ/ZOpEL4zwhKKtnhhCLtIe9IlwS5ES0ONbY8+NHjtZodEPQy2WBOvv7p4+YaSPBYmvho8I8pG
	ldsiIOyylIe42b0gTfjk/vNhy+ERixL0qmBYthKilrIrfMg3DDI9aaMVe5PeqWLl+R3Q=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSZit-0002JP-Po;
	Thu, 28 May 2026 12:20:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1wSZis-0002JA-B0
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 May 2026 12:20:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VKwY9ioZhVoPUqtTyA0BwlFjGKc+POdWjVXqGmhMxaQ=; b=VHe7fYeLj5Kw7rM/VYBi0P/wB6
 xt5APRWpI/cmGrLnInyzzjNeHbqX+O5vhii4T1pv/JJbtUjA2UlSxfRux9uQ/nXpy7qbuAK5M8cPU
 fGwoHXywuY6+9KJnSE5xHWJAq3bJ2G4XEWx49cPLgGoqk0F0NqbapG7Ry70cRnME1BY0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VKwY9ioZhVoPUqtTyA0BwlFjGKc+POdWjVXqGmhMxaQ=; b=NN0GBsfhPGmu9XNqtRhflWIWaV
 MGJF425LntxxnXMO4j+CkTPIiQX1pEljGUrAZThPYj4FN4zM7UQcWLGUGw0upNtWGNn7JxRGzRV8/
 pJRrZbm94JcsLQLc7BBD5w8eE4rsbRpS+W94ZnK4i+tB8zmuDAIR2OAmXw2uXUG2IRfI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wSZir-0006Rl-5Z for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 May 2026 12:20:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 5D559601E4;
 Thu, 28 May 2026 12:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9937F1F00A3A;
 Thu, 28 May 2026 12:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779970814;
 bh=VKwY9ioZhVoPUqtTyA0BwlFjGKc+POdWjVXqGmhMxaQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Y7HGiqwAUe1nf03HOJRK6Iaw755bslZammK1+0efrRGASVM6Ws69wszEvqTmNRgm8
 gnzzpdYOH706bywHqbKXllSClMMYk+jGuvHGtklya9XlCeVKCLEzxPEF5//Ru4tSZh
 SQrQd3bOLYpqaWM/X3vsFncLmhfGWnK0R3q2LtIF/Klss5lyJ4Zw5osf4I3wOSeaSH
 qLlSc+y4JQFjgXhLOOtkxCZD7efPEhYbMSaPhkdOpo1L2mhlKOx4i+ml9UfuLbNFdh
 5eqKj2tWGIQ18hH0H+u3gk8kdqHBaj53qmnIgqfoIMY9CJZi7W+nAkNjMxcj8U4Yrd
 xS5kNLPeHFY/Q==
Date: Thu, 28 May 2026 14:20:08 +0200
To: Carlos Maiolino <cem@kernel.org>
Message-ID: <20260528-offiziell-luftleer-misswirtschaft-3503bda2ad70@brauner>
References: <20260520123722.405752-1-aalbersh@kernel.org>
 <20260521090705.GA14254@lst.de>
 <gcw7zcg6p4s2egpufwizfig72g6ren7jfmuz5mqskkpb7xepww@e3v35j7bk7dc>
 <ag7uW7KQ5mVyCGEv@nidhogg.toxiclabs.cc>
 <20260522-unbehagen-baumethode-erlesen-811a4065eeac@brauner>
 <20260522120757.GA21041@lst.de>
 <ahVzkf8JoKP-kSC2@nidhogg.toxiclabs.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ahVzkf8JoKP-kSC2@nidhogg.toxiclabs.cc>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, May 26, 2026 at 12:19:43PM +0200, Carlos Maiolino
 wrote: > On Fri, May 22, 2026 at 02:07:57PM +0200, Christoph Hellwig wrote:
 > > On Fri, May 22, 2026 at 12:03:20PM +0200, Christian Brauner wr [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wSZir-0006Rl-5Z
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
From: Christian Brauner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Christian Brauner <brauner@kernel.org>
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org,
 Andrey Albershteyn <aalbersh@kernel.org>, djwong@kernel.org,
 Andrey Albershteyn <aalbersh@redhat.com>, david@fromorbit.com,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cem@kernel.org,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:djwong@kernel.org,m:aalbersh@redhat.com,m:david@fromorbit.com,m:linux-unionfs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[14];
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
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[brauner@kernel.org]
X-Rspamd-Queue-Id: 64B8C5F1FDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 12:19:43PM +0200, Carlos Maiolino wrote:
> On Fri, May 22, 2026 at 02:07:57PM +0200, Christoph Hellwig wrote:
> > On Fri, May 22, 2026 at 12:03:20PM +0200, Christian Brauner wrote:
> > > > I was expecting this to come through xfs tree too if Eric and Christian
> > > > agree.
> > > 
> > > You may take it through the xfs tree if there are no conflicts with
> > > vfs-7.2.iomap. If there are I want to add the iomap changes into
> > > vfs-7.2.iomap that you can pull in.
> > 
> > Merging the iomap bits through the iomap branch might make sense, given
> > that iomap usually tends to see quite a bit of activity.
> > 
> 
> That sounds good to me. If you want to go ahead and pull in the iomap
> bits, do so, and give me a heads up when you do it so I'll pull your
> branch locally.

Great, can the series please be resent based on current vfs-7.2.iomap
then please? Because the iomap changes in this series don't apply
cleanly on vfs-7.2.iomap so we already have merge conflicts...


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
