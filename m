Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPONClzTsmktQAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 15:53:16 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 296FD273AE3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 15:53:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s34H1QZBezW+0hCSGuwC1rfNip5H7O3daSY0lkf/yOw=; b=bPJ89IeH6REgmSssHyCWKIUof5
	zTh7oo1hv/PeK0zBJbcQbt1Tv53KhbMrVnZu7rXd2JXorqfamtRjDeuDTKmhhE1cTZeaxBgZlFdG6
	h8pApx8srDK5HWn0CPcJy5zy9ie2EBVg+iSti8OzPdENGBUWn9Y4jyPTLqAQwhAKLCzQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0hPH-0005vX-8f;
	Thu, 12 Mar 2026 14:52:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1w0hPF-0005vR-T9
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 14:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+qeScn+AKCwlpxV8Ziy3AF61erksBNWISbaeZJjkdVk=; b=gbTm/YMX0P1fF7X1zO4oZ4Wy1E
 pivlK6Qkz7DeXljZXWwy35ye5iK5tDmtCiJ6qjgAjKm3eSJAuAhb0F+Bqs4teLgs/ZBcuKQicY4qe
 SoAxHYKJTudS7z+QG2oycI6FqOp39NsxSe/pF0aPIpeR2fxHXm9PEB0yGqzts/ANnx2U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+qeScn+AKCwlpxV8Ziy3AF61erksBNWISbaeZJjkdVk=; b=BLnKybgPFA89lAmgBikYIcxmjc
 DzxDfDYEezq5jQgUMIBKI28gZ8AUc9yZik2a7GSfa5erWAiZUm411qZFwAKdQJlYYVZRphQJq6qfm
 cKTPY7H+SNeVPWPCT734y+zXRFEqX9RgmUeuYlvWDaqg3Lg9hMHzca6d0AjlQ2XT/7+A=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0hPF-0003E5-9d for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 14:52:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5F13661336;
 Thu, 12 Mar 2026 14:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DFF9C4CEF7;
 Thu, 12 Mar 2026 14:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773327171;
 bh=XXRoLW5PPkxCND8B4ImdToPWiFZE9WfidZSxqoOee0k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tGWdX1gGMIAsB7zM1mPWjtb1RZFPGD3vDnjI+sBmpir8tSsen2/ic68Ma9EBUNSw5
 P+Vdq92Iaf48by8SLyoH3yj/bwZySOXGsJcDkGbOUFDgCYWdtzozCJViroaLJW0M8n
 Y3easI+nkr/V2Zqk/TEWbbJ+fscjhQWlnm8i0KCgUGCHqe0cn35/Yl9C82vpHfx003
 yvq7h7bYqJdedFbW0c/Jul45OK8xK6KGZzXb+ZUkObYdrIZf085O5CBSrZCbrhVbJG
 NayUE0HtiaTpJrxbqIPjKJdvKLSyuJ8Dl6tMoWYpkh5g9WNlQ/pr3Bcdml9Oz/0JEh
 XlI/nhSbvPdiQ==
Date: Thu, 12 Mar 2026 07:52:50 -0700
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <20260312145250.GE6069@frogsfrogsfrogs>
References: <20260309192355.176980-1-aalbersh@kernel.org>
 <20260309192355.176980-20-aalbersh@kernel.org>
 <20260310012914.GG1105363@frogsfrogsfrogs>
 <ymisdrze3ohdnxa4inqfwp4riaz4qk5nmtil33adn5ukhngq7v@f3tcv3hbzobz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ymisdrze3ohdnxa4inqfwp4riaz4qk5nmtil33adn5ukhngq7v@f3tcv3hbzobz>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Mar 12, 2026 at 02:50:57PM +0100, Andrey Albershteyn
 wrote: > On 2026-03-09 18:29:14, Darrick J. Wong wrote: > > > XFS preallocates
 spaces during writes. In normal I/O this space, if > > > unu [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w0hPF-0003E5-9d
Subject: Re: [f2fs-dev] [PATCH v4 19/25] xfs: remove unwritten extents after
 preallocations in fsverity metadata
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org,
 Andrey Albershteyn <aalbersh@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, hch@lst.de,
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aalbersh@redhat.com,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
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
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 296FD273AE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 02:50:57PM +0100, Andrey Albershteyn wrote:
> On 2026-03-09 18:29:14, Darrick J. Wong wrote:
> > > XFS preallocates spaces during writes. In normal I/O this space, if
> > > unused, is removed by truncate. For files with fsverity, XFS does not
> > > use truncate as fsverity metadata is stored past EOF.
> > > 
> > > After we're done with writing fsverity metadata iterate over extents in
> > > that region and remove any unwritten ones. These would be preallocation
> > > leftovers in the merkle tree holes and past fsverity descriptor.
> > > 
> > > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > > ---
> 
> > There's an upper limit on the number of blocks you can unmap/free in a
> > single transaction.  Maybe move the xfs_trans_{alloc,commit} into the
> > loop body?
> > 
> > Oh wait, you skip the written extents.  Ok, so maybe just roll it after
> > you've done a bunmapi.
> 
> I see, I will add a rolling transaction. Btw, why skipping the
> written extents let's us use rolling here?

Hrmm.  At first I thought: why can't xfs_fsverity_cancel_unwritten
allocate (and commit) the transaction inside the loop body?  Then I
thought "well, it's only conditionally unmapping things, and it's sort
of a pain to allocate a transaction only then to find out if you
actually want to run one".

OTOH there could be billions of extents in the data fork, so holding the
ILOCK for that many transactions isn't a good thing because tr_write
only preallocates space for a certain number of transaction rolls.
fsverity already holds IOLOCK_EXCL so there can't be any other programs
using the file.

So now I arrive back at "The transaction allocation and commit/cancel
should be inside the loop body, since crashing midway through wouldn't
result in user-visible changes to the file data".

> > Do you need to purge the cow fork too?
> 
> hmm, what case are you thinking about here? The fsverity is written
> in past EOF region, I don't see how COW extent could be left there.
> Can they somehow be left mapped for blocks past i_size?

I was talking about speculative cow fork preallocations below i_size.
They'll eventually get purged by blockgc, but you could give the space
back once you've committed enabling the fsverity file flag.

--D


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
