Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMv7EDc8nWkGNwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Feb 2026 06:50:47 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D807A182336
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Feb 2026 06:50:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsBi6TEpw48sB4fD9RhGAlH4ZRLR5wSOs+P1injuUmw=; b=i69Ja4avFbZAb5mRNTc598O/gZ
	5Oqe9E6wBDNBb6E11nQWHD+YqDnKQHjqRBjOyBIPLfDdiqUGlGiPMM5qYag2IzgmRAC39DaMSPFI0
	eJ1wvFS1qaSlIN7SVcA0AMbSws+konUNCw/nxzBDoBnnltcR7dAuEK3CTsUblLpqHXrg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vulJd-0007UQ-Of;
	Tue, 24 Feb 2026 05:50:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vulJc-0007UE-MD
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Feb 2026 05:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uHgyNFCWv6VDdJj18WLxBrvr3wvre81Tz6FYHe104QQ=; b=IWUvsKwjyzV1J7gHFKVinIS2ob
 REzh8jDOOWF3z7oAU4+O92SCdG4//YNE2wCvh6Skkj6aIaUvjPh7rvNQshC8Sn0SEKKiKNWrJ71hG
 b15V7pauByYKDu7gTDwbNpvyBr2vG14+5TkORX6ELtYTxjs3riDmRirLxMowd8YMCr/s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uHgyNFCWv6VDdJj18WLxBrvr3wvre81Tz6FYHe104QQ=; b=ezZTVwrQdH46Ybbm/rXqgxMt5u
 wgCPPtEQeFMZ8gVieV5jx7v7qocBjvjlpqmcIL89dEVIj/qqEPPMibFtZTL7Y8MgXxJrb8Qn9z4p8
 Qs2vSba28CoSUcRsMvxNfVBtuMcnm/etfTDX8cLPT0/AT060jVabCsCg1VohBcTG443w=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vulJd-0005AF-2l for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Feb 2026 05:50:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1AD2A600AE;
 Tue, 24 Feb 2026 03:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B299C116D0;
 Tue, 24 Feb 2026 03:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771905343;
 bh=O+MIarzvf6kjqxVQyd3WMBAO83/rjG8t85W7MzgUUDA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ikEl1rCcdZ7BbDDefOVqu2uHJiOoTzsFGVam4q+7g20QoxFgDbjLwqudI7rDf4sJ6
 bHEzFpIM+SZByrQlr6GBZOyg2AwXPDErGmypBoJuxKZr+vKbbXg1mFjS0acwCTcUPD
 LH9rbWjopDGSNBnAwluuh37WTYKqwBqp71ziJzyz5S9vvXWnnG0J4BWov1YQnJUkXV
 Qx0YeqNzyAYh7qWD3lUg16TCxxBm2q7InD5WKZSZ8a9YT5dsFXtvvPISQYmt0fwEMX
 F0gpb4dwQBlj7H0tTxeGB5Gghvtfexp7fk+y3WRIgp+BceSiPKCiPGdvLH7t5uCbPq
 FsDBeGL7c6qkg==
Date: Tue, 24 Feb 2026 03:55:41 +0000
To: Nanzhe Zhao <nzzhao@126.com>
Message-ID: <aZ0hPcllsNzYn03k@google.com>
References: <20260109024716.12047-1-chao@kernel.org>
 <CAGsJ_4wjXMXk4YKsYebmtTa5dKVO21b91ieY=foYULWS+DyroQ@mail.gmail.com>
 <2cdd4281-7e37-4dd0-91b1-1ab16ef772aa@kernel.org>
 <CAGsJ_4weE5T1uBA1-JoJdbZY4E91eN_OL3hMdqixLcoKSrmuzw@mail.gmail.com>
 <8c13ca69-a08a-41c7-bbef-0a79a5f44f93@kernel.org>
 <83419982-77ba-4dac-880e-bf59669a006f@126.com>
 <aXKuTRfZXE4z0j1_@google.com>
 <43f34976.480b.19be98c144d.Coremail.nzzhao@126.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43f34976.480b.19be98c144d.Coremail.nzzhao@126.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/23,
 Nanzhe Zhao wrote: > Hi Kim: > At 2026-01-23 07:10:05, 
 "Jaegeuk Kim" <jaegeuk@kernel.org> wrote: > > > > >Yes, I was hitting some
 issues when I convert the mapping while inode is alive. > >S [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vulJd-0005AF-2l
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to prevent clearing immutable for
 large folio supported inode
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Barry Song <21cnbao@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nzzhao@126.com,m:21cnbao@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[126.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org]
X-Rspamd-Queue-Id: D807A182336
X-Rspamd-Action: no action

On 01/23, Nanzhe Zhao wrote:
> Hi Kim:
> At 2026-01-23 07:10:05, "Jaegeuk Kim" <jaegeuk@kernel.org> wrote:
> 
> >
> >Yes, I was hitting some issues when I convert the mapping while inode is alive.
> >So, for now, we should set it in f2fs_iget() only.
> >
> 
> What about using mapping_set_xxx functions in f2fs_new_inode  then?

How can we guarantee this will be a read-only file?

> It maybe be a bit odd to me that we create a immutable file but we can
> only get large folios for this inode  when the inode is evicted and get
> by f2fs_iget again, not get large folios by the first place.
> 
> Thanks,
> Nanzhe Zhao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
