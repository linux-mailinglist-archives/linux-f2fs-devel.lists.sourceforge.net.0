Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OF5PFSZQ6Wl2XgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Apr 2026 00:48:06 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD4C44B55A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Apr 2026 00:48:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BxqltEJs0gm1wtxcpkG/fh52CONCtZaKb55/ZD2LmY4=; b=OsMpoF6vZSKZ2dHKTe+P3z51nT
	WfcHsngiYLNacnDjxHMNrfHjXumKH14eLxaB2r3g8lp54xjOG1vg8P+1JKXsgIYRRawAEAUDpY/Vs
	+dmmRbWVE0aFPqyMevLLBDqOxEY6ShQ5eGMApWcA/SOwhqQ2e8zGa5W7R8a//YwPwgYk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wFgMO-000088-Gv;
	Wed, 22 Apr 2026 22:47:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wFgLz-00007h-UE
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Apr 2026 22:47:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KdFdsfzsmu4HYAp9ILDq8/RKpitpPX4p/71EoAyr4C0=; b=fZZU2cIEwQU2t1oqtb3KcUnrWc
 TX642xTOsH4hR1M+WJqP2Ds9fJK0umoC+25kKTJ+C9SYsFA9807Ff1PwjXRSojHHvh1ZoScxNZ9EX
 1pyV5lsyWw94Kwn6N9AwRJ06uP/rO859/0swZ5PngmTJByV+w4SWnSSiaxVV+aDibpa4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KdFdsfzsmu4HYAp9ILDq8/RKpitpPX4p/71EoAyr4C0=; b=KHie1SsKFB1LssO5EBEABtKUy3
 wwYGz3LhPse2YM21LQjkk7kN+A5OEwaTaXTbP3lMhlUHGmOKokoqXOuNeNY21lE4tYJohPrMnglK/
 wfSfj9GczrFHxYs1MbwBxMLaBoJNPcoDb8i3QHnERPrSX9mIkRjgpK0uvIEbEqocby9w=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wFgLz-00049k-IL for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Apr 2026 22:47:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D83D161334;
 Wed, 22 Apr 2026 22:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37BCAC2BCB3;
 Wed, 22 Apr 2026 22:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776898040;
 bh=xywk3FuWWC6fImVY9XXhdwDp4KDD7unC169c5GRX1tI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=taLQSnF3g6HjJbm8te8XI4HVGp9e1gYWYDyyEz4BDMSY9RcVw0NXVW7XxNrL52qCk
 XPKErDIJA4sab4tLjf0mKkrAvi/TtZ3wBs3wdurJAhtObSlzCASr1OLS6myyQJTU1m
 7klnFauuVwF7QP/L63MRpWBDs69K6V4heEuT0ERt8G6EQ8ttNsdGztrZJly83cpNYu
 LYk/WSAJXazmI45BAAZnCCGTQ7h9+ITYX2SKoPiujjo0/H5GJcvptdWUTVFCrvYEBW
 m9I8VcfQRYVtcp1nirJ+jBJUduExqrJUPrsdhuZz3a4BeSBwXE/BUyb8VWEywliUcI
 9SG/FhHW9jycg==
Date: Wed, 22 Apr 2026 15:46:04 -0700
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <20260422224604.GA2226@sol>
References: <20260420114714.1621982-1-aalbersh@kernel.org>
 <20260420114714.1621982-4-aalbersh@kernel.org>
 <20260421214457.GC37143@quark>
 <gpmgtg2wkoo4vozzaaouhdp2df6zlifwi6gy4jvq7xc22zo7om@t3f2bl374nlr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <gpmgtg2wkoo4vozzaaouhdp2df6zlifwi6gy4jvq7xc22zo7om@t3f2bl374nlr>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 22, 2026 at 11:59:11AM +0200, Andrey Albershteyn
 wrote: > > The 'if (!fsverity_active(inode) && IS_VERITY(inode)) {' condition
 > > should stay > > Why? With recent changes, the fsverity_ac [...] 
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wFgLz-00049k-IL
Subject: Re: [f2fs-dev] [PATCH v8 03/22] ovl: use core fsverity ensure info
 interface
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
Cc: fsverity@lists.linux.dev, Andrey Albershteyn <aalbersh@kernel.org>,
 djwong@kernel.org, Amir Goldstein <amir73il@gmail.com>,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, hch@lst.de, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aalbersh@redhat.com,m:fsverity@lists.linux.dev,m:aalbersh@kernel.org,m:djwong@kernel.org,m:amir73il@gmail.com,m:linux-unionfs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,gmail.com,vger.kernel.org,lists.sourceforge.net,lst.de];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: ABD4C44B55A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 11:59:11AM +0200, Andrey Albershteyn wrote:
> > The 'if (!fsverity_active(inode) && IS_VERITY(inode)) {' condition
> > should stay
> 
> Why? With recent changes, the fsverity_active() now checks for
> IS_VERITY() instead of verity_descriptor.
> 

Okay, I forgot that that had changed.  Looks like the kerneldoc never
got updated, though.  It still says "This checks whether the inode's
verity info has been set."

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
