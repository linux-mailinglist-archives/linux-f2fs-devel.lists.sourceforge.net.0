Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMf5GVC6D2qCPAYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 04:07:12 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F555ADDE9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 04:07:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nz3dJNBw01qfPOeYNA8Vum4A/RF04ff6nO+OMCFz+I0=; b=Fyf2ckD0tSYXaIBeFCc9+dYS/Y
	IARwpAwFUsYoso23dhmTakxU+HIWbZA5dExWSxRRjWh/S0Plk969DGBEQ2CsQ6g16Oa0B3SnVNjg1
	v8H/Iw/Q2bnwOv9s26ARZEBCOG9SCyY492q4xw8cgYfpHPHDLLkpmr0makz8+h/wA4BI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wQFHr-0004q7-Ef;
	Fri, 22 May 2026 02:06:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wQFHq-0004px-HY
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 02:06:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=knPovaapjTuiFoAWUIpqfkz2sUYqGeJ9DVY/g4v9D24=; b=WZq+JrSBSigxeO3DkQHnHFFCNQ
 VnLsQOzWI3Rn0IoCdwZf+Ga+PaIeA/1EvS+RwuWUembJ/zy+NBy1/vmdI+3zCGLriI4RY4XWEM0qh
 RysQSMl/cLy1RYppHQD/Ki9Gwh3Bkm5iT3T2N4hCln6VYowcTcGSUbENCXhmQGkPZUa4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=knPovaapjTuiFoAWUIpqfkz2sUYqGeJ9DVY/g4v9D24=; b=QxHM6CUhwR01LTwWN0oYSUJvso
 ckoQ9yd6mVusqlOqILLhFi11MHOB2cTzP2U1twTbEb2CS04UHoJswJMVO/9tF0NYzXpuaneYCkU2O
 jI3/DkqGvxA3kGYBHgzZHCO6Gq1wLxX4SlxCWM5A6Td8+TS96AG8bodNlUI/fk98PZtk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wQFHq-00049a-CS for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 02:06:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id A825D60138;
 Fri, 22 May 2026 02:06:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6199D1F000E9;
 Fri, 22 May 2026 02:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779415603;
 bh=knPovaapjTuiFoAWUIpqfkz2sUYqGeJ9DVY/g4v9D24=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=cn0DKNiCX/B+AgeNdmnyOgzXcfSja9kfVGiETJSyy6g56tH9akiqD2DunRITdulvg
 qEIdHQTjAE9qmBkXUaJmwuAzJrUGXAt4MFPU2/GjTTlFoDTVA+ixjUjrt/Oz6+Vhtv
 8R+6eSEfs99o8wkRYf+MXs53sLi6E2hvukJgWQ0esSvPrPvyY3D/gsOs/08VOaTzDv
 BAlCN6chLZXijVQIvk2MFyuElcw/WUZ0ePo7YEeExQ3QcQcxaou5md2JYMlTiO8RiC
 29RoX4/OGh9CKMAYExLWC+0Nh7F1+O6QiOcBz+qYsUHgUyZO56xnQcmxA49v09OEuZ
 QKaCNkLB6alNg==
Date: Thu, 21 May 2026 21:06:40 -0500
To: Carlos Maiolino <cem@kernel.org>
Message-ID: <20260522020640.GB5937@quark>
References: <20260520123722.405752-1-aalbersh@kernel.org>
 <20260521090705.GA14254@lst.de>
 <gcw7zcg6p4s2egpufwizfig72g6ren7jfmuz5mqskkpb7xepww@e3v35j7bk7dc>
 <ag7uW7KQ5mVyCGEv@nidhogg.toxiclabs.cc>
 <ag7vc9gaHo3XtsBJ@nidhogg.toxiclabs.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ag7vc9gaHo3XtsBJ@nidhogg.toxiclabs.cc>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, May 21, 2026 at 01:42:42PM +0200, Carlos Maiolino
 wrote: > On Thu, May 21, 2026 at 01:38:45PM +0200, Carlos Maiolino wrote:
 > > On Thu, May 21, 2026 at 11:42:13AM +0200, Andrey Albershteyn wro [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wQFHq-00049a-CS
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, brauner@kernel.org,
 Andrey Albershteyn <aalbersh@kernel.org>, miklos@szeredi.hu, djwong@kernel.org,
 Andrey Albershteyn <aalbersh@redhat.com>, amir73il@gmail.com,
 david@fromorbit.com, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cem@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:aalbersh@kernel.org,m:miklos@szeredi.hu,m:djwong@kernel.org,m:aalbersh@redhat.com,m:amir73il@gmail.com,m:david@fromorbit.com,m:linux-unionfs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,szeredi.hu,redhat.com,gmail.com,fromorbit.com,vger.kernel.org,lists.sourceforge.net,lst.de];
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
	HAS_REPLYTO(0.00)[ebiggers@kernel.org]
X-Rspamd-Queue-Id: 08F555ADDE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 01:42:42PM +0200, Carlos Maiolino wrote:
> On Thu, May 21, 2026 at 01:38:45PM +0200, Carlos Maiolino wrote:
> > On Thu, May 21, 2026 at 11:42:13AM +0200, Andrey Albershteyn wrote:
> > > On 2026-05-21 11:07:05, Christoph Hellwig wrote:
> > > > On Wed, May 20, 2026 at 02:36:58PM +0200, Andrey Albershteyn wrote:
> > > > > This series based on v7.1-rc4.
> > > > 
> > > > How are we going to merge this?  It touches at three subsystem trees
> > > > (fsverity, vfs/iomap, xfs) so some coordination will be needed.
> > > 
> > > As most of the patches are xfs, it's probably make sense to go
> > > through xfs tree
> > > 
> > > Carlos, what do you think?
> > 
> > I was expecting this to come through xfs tree too if Eric and Christian
> > agree.
> > FWIW I'm adding Christian to the Cc
> 
> Woops... Also Adding Amir and Miklos to the Cc list due the overlayfs
> patch:

Please go ahead and take it through the XFS tree for 7.2 if you think
it's ready.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
