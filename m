Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YG6dDEBHEGrzVgYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 14:08:32 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 465255B3908
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 14:08:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=daOmDTnHRwYiemCOEHt1m7xtE9CpsyONUUCEhIX8k80=; b=GANepLHHxaRq6yLLvp6p9MBYIG
	PBDaDOxE1+vJOqIZliIBJSeihRd7lLzPC5f2Du7PiHCvppxKUn+IUSCu6j7wahh4NzZ4wouISL/Jq
	m8kzZjHJiIBJVRrcYDeiZIwNj1Nk6eli16UIETNcgyEMYQvLnkCBdviyecy+l/IWVmlQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wQOfn-0007FU-SW;
	Fri, 22 May 2026 12:08:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1wQOfn-0007FN-1Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 12:08:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eNQ/HffRfGqu34qOeK7EX9b4MT170ZPwpkS66bXp2gE=; b=AYTJdoW+d3QYwuCSfSL+Dx+G+Y
 8af0LjGXx5yBV6OnDpqq46mlfd7TvRv+SB4u0mr0FLGIvZ/dPjAS93EGU7ZGR9ntoRou6d09Qn6kf
 fRDCqz/Tna42D6wKgp/FXsnB7md0Y+fPLqkvQUZp9nNntzIJIzgY+kOCIahS8uKeIQSc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eNQ/HffRfGqu34qOeK7EX9b4MT170ZPwpkS66bXp2gE=; b=LctjVBDbUgIeOenlUVmVKJNl5g
 Dh8uzUFpifRhtU7DLUOKwTD0icIX/NwWHsx9+pBCh5QrXC5ThrgRAd66xE9kp8DHKTsFNuTE1t2Ki
 a2u/BBLH2zGvyME1WTgC0uKy8GHEOtD0qDz9SxcVkXAjRYBGvx4/8+bEDaJnNm2zJDBw=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wQOfj-0001MZ-M3 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 12:08:14 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id AE61C68CFE; Fri, 22 May 2026 14:07:57 +0200 (CEST)
Date: Fri, 22 May 2026 14:07:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christian Brauner <brauner@kernel.org>
Message-ID: <20260522120757.GA21041@lst.de>
References: <20260520123722.405752-1-aalbersh@kernel.org>
 <20260521090705.GA14254@lst.de>
 <gcw7zcg6p4s2egpufwizfig72g6ren7jfmuz5mqskkpb7xepww@e3v35j7bk7dc>
 <ag7uW7KQ5mVyCGEv@nidhogg.toxiclabs.cc>
 <20260522-unbehagen-baumethode-erlesen-811a4065eeac@brauner>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260522-unbehagen-baumethode-erlesen-811a4065eeac@brauner>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, May 22, 2026 at 12:03:20PM +0200, Christian Brauner
 wrote: > > I was expecting this to come through xfs tree too if Eric and
 Christian > > agree. > > You may take it through the xfs tree if th [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1wQOfj-0001MZ-M3
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
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 Andrey Albershteyn <aalbersh@kernel.org>, djwong@kernel.org,
 Carlos Maiolino <cem@kernel.org>, david@fromorbit.com,
 linux-unionfs@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Andrey Albershteyn <aalbersh@redhat.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:brauner@kernel.org,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:aalbersh@kernel.org,m:djwong@kernel.org,m:cem@kernel.org,m:david@fromorbit.com,m:linux-unionfs@vger.kernel.org,m:hch@lst.de,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:aalbersh@redhat.com,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 465255B3908
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 12:03:20PM +0200, Christian Brauner wrote:
> > I was expecting this to come through xfs tree too if Eric and Christian
> > agree.
> 
> You may take it through the xfs tree if there are no conflicts with
> vfs-7.2.iomap. If there are I want to add the iomap changes into
> vfs-7.2.iomap that you can pull in.

Merging the iomap bits through the iomap branch might make sense, given
that iomap usually tends to see quite a bit of activity.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
