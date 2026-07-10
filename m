Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nZMPJxx5UWp5FQMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 Jul 2026 00:58:36 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C713273FAB0
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 Jul 2026 00:58:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=I+pi2Kd5;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=mo6xGhJt;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=Y+82l3ou;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=mQbZWvrM;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=023wf5ebHXckWZx3j475stV7X2Ru9psCZmdS1wDOOek=; b=I+pi2Kd5BzmRXv2pXkK6zahdKH
	h8+tjtiKuv+9y1D3zYzfYqtxQHpTb8gCzORyjhZcHAHPAaM5BexaxX7kt+Pdr4JYyYHKLWicVdgCU
	3/pbEsJJrtOMtR7WH0sWwu8pQ/KTFBSBSu5MxQfzHig/3Eq9fL/bwp9ND8f8+UkWLY18=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wiKAr-0006Vk-Tz;
	Fri, 10 Jul 2026 22:58:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kbusch@kernel.org>) id 1wiKAr-0006Ve-2Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 22:58:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NkeORe+bO7UNqmqDFJw/AxpC9nvY1tbNbvdLo/yNIQE=; b=mo6xGhJtyV96OVGXbmPTxlDc16
 MWEYySgh18dFDBI2LOckxsvW+DtBNsOVmkeiBvDG6PeSyoG+d9TviK/7betTN01RV04nvOb5vEXhL
 aUQNRp9mOFkA78vdhtQ9gvBv4c30+RXrcnc3/QxpHgLMgAtR3bS8yac5udLGQdyCOxJg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NkeORe+bO7UNqmqDFJw/AxpC9nvY1tbNbvdLo/yNIQE=; b=Y+82l3ouAGaDe8kiVJWTnIyagB
 YXYeqejlBnX6tLe8t6X7HB+sNBbPmmloOmYe1nJtZIRBejT5DLjof/DZIpcvJo3Hp0PEtgAkT7JA+
 /DAV0FuJjIuuuuL72QH3HMHovzERkCoKXeAdqcB+dSsP77aofxN3Gb8b77UwMHY1TpOI=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wiKAq-0002Gw-Ja for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Jul 2026 22:58:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4CB4B43B4A;
 Fri, 10 Jul 2026 22:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8CCD1F000E9;
 Fri, 10 Jul 2026 22:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783724294;
 bh=NkeORe+bO7UNqmqDFJw/AxpC9nvY1tbNbvdLo/yNIQE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=mQbZWvrMX0flq/z1MA3Kytgtdx6+fyTYu3dK/X7c4oh70mKhm8ZwVnKRtqylnCqv/
 GTDsEKO+4rGVvyaM2mD1j7XtNnoVYfg9A1AOmzG6sclc+zG56GXVsqzxwRSOtvElVu
 um63FKHXWR3AmeCcw/Yg+9uwD1cWn19jV+QkE0c/Jb38Grx3fOYKsz5qarVCVc0AqL
 9qYipa2T4SbgN4sJp+jr6MSgFwVJ4Qe6zclXuIrbIum7ByL4E36JBYGIEEtdqfat/J
 gjmy1hI2SlX0c3whMXkKadmd4vp3erA/l0Z30LVFBF2+NYTlrMfcq5tegUMtBMSvng
 L9Zd8PjyE7LuA==
Date: Fri, 10 Jul 2026 16:58:12 -0600
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <alF5BHEZ5czyJWaY@kbusch-mbp>
References: <20260710210646.3576365-1-kbusch@meta.com>
 <20260710215328.GE1911@quark>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260710215328.GE1911@quark>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jul 10, 2026 at 05:53:28PM -0400, Eric Biggers wrote:
 > On Fri, Jul 10, 2026 at 02:06:41PM -0700, Keith Busch via Linux-f2fs-devel
 wrote: > > From: Keith Busch <kbusch@kernel.org> > > > > The [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wiKAq-0002Gw-Ja
Subject: Re: [f2fs-dev] [PATCHv2 0/5] direct-io file extended attributes
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
From: Keith Busch via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Keith Busch <kbusch@kernel.org>
Cc: axboe@kernel.dk, linux-xfs@vger.kernel.org, brauner@kernel.org,
 aalbersh@kernel.org, Keith Busch <kbusch@meta.com>, cem@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 tytso@mit.edu, jaegeuk@kernel.org, linux-fsdevel@vger.kernel.org, jack@suse.cz,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
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
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:axboe@kernel.dk,m:linux-xfs@vger.kernel.org,m:brauner@kernel.org,m:aalbersh@kernel.org,m:kbusch@meta.com,m:cem@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:tytso@mit.edu,m:jaegeuk@kernel.org,m:linux-fsdevel@vger.kernel.org,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[kbusch@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kbusch-mbp:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C713273FAB0

On Fri, Jul 10, 2026 at 05:53:28PM -0400, Eric Biggers wrote:
> On Fri, Jul 10, 2026 at 02:06:41PM -0700, Keith Busch via Linux-f2fs-devel wrote:
> > From: Keith Busch <kbusch@kernel.org>
> > 
> > The attributes reported through statx are incomplete for applications to
> > fully know exactly how IO construction is valid or not. The statx call
> > can report minimum memory alignment and total granularity, but it
> > doesn't show the underlying gap boundary requirements or max segments
> > per granule.
> > 
> > This series adds the minimum to the extended file attributes through
> > file_getattr. I hear this is the preferred interface for reporting such
> > things over adding more fields to statx. In order to get everything
> > under a single syscall, some of the attributes are duplicated from
> > statx.
> 
> Okay, in v2 we at least now know that the existing statx UAPI was
> considered.  Could you give a specific real-world example (with the
> actual values of each parameter) where it's not sufficient?  Without
> that there isn't really any way to evaluate this proposal.

Yes, we can consider nvme. This protocol supports two different transfer
modes called PRP and SGL. PRP requires 4k aligned segments, though you
can have an arbitrary 4-byte aligned offset at the start. SGL on the
other hand allows completely arbitrary size and alignments for each
segment.

statx reports information sufficient to know that you can have dword
aligned page offsets for a virtually contiguous buffer, but it doesn't
report PRP's boundary gap requirement, so applications can't tell if the
file follows PRP or SGL rules for direct-io.

And if you have a device using SGL, statx doesn't report the max number
of sub-sector segments you can submit in a single command.

This series provides both limits so user space has the complete picture.

A typical nvme that supports only PRP has a DMA alignment of 4 bytes, a
dio offset alignment of 4k, and a virtual boundary of 4k.

If SGL were supported, there would be no virtual boundary gap, and max
segments is 256.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
