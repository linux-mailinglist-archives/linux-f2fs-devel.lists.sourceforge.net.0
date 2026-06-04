Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PGHrKOBoIWoAGAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 04 Jun 2026 14:00:32 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA67363FA92
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 04 Jun 2026 14:00:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=XEF1HJRO;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=mSPQARra;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=OImv3je7;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=bWlMIyVA;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7KrJvWV3LixwBOGg5vv+0+A4zYtRR1gaESeuj/HneQ=; b=XEF1HJROhBqvBLEojU1nIaR5hp
	gUSRR++Www31ZCT/ABvKvOYv0buGpYDAkIyoXFiQMfavY7k3Z5RLiNJ/VrQlAnHm4VdEhi18+TDka
	5iyyTqQAmXhbiNcifX6KVIc+pq52u7kK9sLokT0hGTQZzrEy13VUDMENGvmbwsIjyWCY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wV6kG-0004SE-4G;
	Thu, 04 Jun 2026 12:00:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1wV6kF-0004S6-C2
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jun 2026 12:00:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eUGKeM7sI2oL66NeOVj98HdQqnjDqpuEH+7R/CzDGX8=; b=mSPQARrakJ4zQRgaENudrB7T0q
 3K8QRiPdtS5K5SE8jvcxTTSugiq8M2juEnd7TR6qm1P2V+9UidXtjTZZcn2YNDo9xalvQLenVIPsG
 cl7wxy94kKfEMOiNLn71NtVyhUiIuOKO050Xco4bRzp7w0lzgg5n8ZH0J7zfIYTtl4LY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eUGKeM7sI2oL66NeOVj98HdQqnjDqpuEH+7R/CzDGX8=; b=OImv3je7nNHlbXp7CKEt2mlsvj
 0+pmzH18zWAaC3Zi8quE5CpUorm4HmHpmXM+x6vKsfkt0wKLdcfbfEK7fVb3Em8OQyKByFPupfPrl
 Zt9xT354Mhxd7ZMf4Eem32reTjs0RTdCSIOGxirBvukxPonqxi2rm5aZFAliz1yTxwyk=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wV6kD-000131-Hw for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jun 2026 12:00:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A840743E84;
 Thu,  4 Jun 2026 12:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78CC21F00893;
 Thu,  4 Jun 2026 12:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780574412;
 bh=eUGKeM7sI2oL66NeOVj98HdQqnjDqpuEH+7R/CzDGX8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=bWlMIyVAfft41ZQCGzhI+SyhA9T/HLftfr8rJJGYdx5Uaqre8IIqdBMzPHBJBhrpV
 v/fE9puQ+K/giOQZ9M2RFrSBhcMOgGztSfJcwe2y4/6Eb8oun9fL01b0HCnkU7+SNm
 gSS1xffYq9sOdePq6pcGFGR1u0LOmjqTSJ5tNJePAOFySwP85TjKpV09ntzTwTYhC+
 ptUfdeSrDKTbcwsjQ5cWX0issdDT0V8jWDPnxMRlnRe8mOABWSYpvMzxr231lgKtxz
 zRPn9mAgi9NO7O6DZbP+SbH8o7I2pqJ3mQmiKSXYhSF/yk+c5+vaklddgJMcuBtjiK
 6jEpkLP8hKKig==
Date: Thu, 4 Jun 2026 14:00:07 +0200
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <20260604-holen-rundum-ausfechten-2193b39da363@brauner>
References: <20260520123722.405752-1-aalbersh@kernel.org>
 <20260521090705.GA14254@lst.de>
 <gcw7zcg6p4s2egpufwizfig72g6ren7jfmuz5mqskkpb7xepww@e3v35j7bk7dc>
 <ag7uW7KQ5mVyCGEv@nidhogg.toxiclabs.cc>
 <20260522-unbehagen-baumethode-erlesen-811a4065eeac@brauner>
 <20260522120757.GA21041@lst.de>
 <ahVzkf8JoKP-kSC2@nidhogg.toxiclabs.cc>
 <20260528-offiziell-luftleer-misswirtschaft-3503bda2ad70@brauner>
 <fjdfwhwi4aogyiaoijwvw6w4npuu5mbt6ua6fkhwcp5ajlm543@ume2fkxg36cb>
 <aiE_YQc6SGSdWlcE@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aiE_YQc6SGSdWlcE@aalbersh-thinkpadx1carbongen13.rmtcz.csb>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jun 04, 2026 at 11:04:32AM +0200, Andrey Albershteyn
 wrote: > On 2026-05-28 16:50:45, Andrey Albershteyn wrote: > > On 2026-05-28
 14:20:08, Christian Brauner wrote: > > > On Tue, May 26, 2026 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wV6kD-000131-Hw
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
 Carlos Maiolino <cem@kernel.org>, david@fromorbit.com,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aalbersh@redhat.com,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:djwong@kernel.org,m:cem@kernel.org,m:david@fromorbit.com,m:linux-unionfs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[brauner@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[brauner:mid,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA67363FA92

On Thu, Jun 04, 2026 at 11:04:32AM +0200, Andrey Albershteyn wrote:
> On 2026-05-28 16:50:45, Andrey Albershteyn wrote:
> > On 2026-05-28 14:20:08, Christian Brauner wrote:
> > > On Tue, May 26, 2026 at 12:19:43PM +0200, Carlos Maiolino wrote:
> > > > On Fri, May 22, 2026 at 02:07:57PM +0200, Christoph Hellwig wrote:
> > > > > On Fri, May 22, 2026 at 12:03:20PM +0200, Christian Brauner wrote:
> > > > > > > I was expecting this to come through xfs tree too if Eric and Christian
> > > > > > > agree.
> > > > > > 
> > > > > > You may take it through the xfs tree if there are no conflicts with
> > > > > > vfs-7.2.iomap. If there are I want to add the iomap changes into
> > > > > > vfs-7.2.iomap that you can pull in.
> > > > > 
> > > > > Merging the iomap bits through the iomap branch might make sense, given
> > > > > that iomap usually tends to see quite a bit of activity.
> > > > > 
> > > > 
> > > > That sounds good to me. If you want to go ahead and pull in the iomap
> > > > bits, do so, and give me a heads up when you do it so I'll pull your
> > > > branch locally.
> > > 
> > > Great, can the series please be resent based on current vfs-7.2.iomap
> > > then please? Because the iomap changes in this series don't apply
> > > cleanly on vfs-7.2.iomap so we already have merge conflicts...
> > > 
> > 
> > hmm do you mean this branch?
> > https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/log/?h=vfs-7.2.iomap
> > 
> > patches 07..09 seems to apply cleanly. The only conflict I see is in
> > the overlayfs patch 03. This is because [1] (is in -rc5) is missing
> > in vfs-7.2.iomap.
> > 
> > [1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/fs/overlayfs/util.c?h=v7.1-rc5&id=0c8c88b8eb82a2a41bec5f17c076d6312dc40316
> 
> Christian, ping
> 
> Would be nice to have iomap in vfs, so Carlos can pull and test the
> rest

Applied but note IOMAP_F_FSVERITY
changed from (1U << 10) to (1U << 11) since we have another flag
addition this cycle.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
