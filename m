Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GegA5AltGlhiAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 15:56:16 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CAC285639
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 15:56:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dby4yiXT5+k3Sj7m69VnkF4He2NGfaCBzVLirBWWBSs=; b=PDlqjhbYVVOU3ZbFz0r3k3+Ebg
	nfQ1UTHcL+Vw4J6rf5e0nAV5iE7DxmmU53mNSU7UDDw949EntYLMJfmu1oASE7jah+TS57iuMxbcq
	Rk0T/CHh8rMeNshSXIv2OMHCkXZsZgEkVa5ZnB9bDZuQJCrRDN/uRjFxVmXDmQaqNZOY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w13vp-0005aZ-6V;
	Fri, 13 Mar 2026 14:56:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1w13vo-0005aT-1R
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 14:56:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=foPxZaH8+x0Jr6Nf9FkeluUSSUKac+3kBLmpVolmnao=; b=KhG450rYP7Heu1/mDltW/WWgOS
 iXYdB/BJkTs5wwMHgapZVTVQrgTHDAy1HKBpLkOy+QsxoXmNiTUyC9atEB/zF0j4paQd4CX577zOp
 QHkKDN0939u7uUig43xRCYzEZTZlDB5Z4hdnMm+Py7K4goPFLfC0hQWKISBQcsDGmnAs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=foPxZaH8+x0Jr6Nf9FkeluUSSUKac+3kBLmpVolmnao=; b=bqA3UvptLoyWP/c91sjertueYi
 b6f99JpbuJnnRvSU70BwLZ9wRK8KbiDIEqpGGxGqJhkGefE9SYxFu907t8z5Q6u0mwnyA+yz/2uGY
 1VOhS/qyXaZRDe9Ku5rkq4ax1mlKztYv4/beKNY2+mSTbNHiz7Ux374ygWmKxKj126vg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w13vn-0002Av-G2 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 14:56:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9A51161851;
 Fri, 13 Mar 2026 14:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45E4FC19421;
 Fri, 13 Mar 2026 14:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773413752;
 bh=1SJdVb46rEOXp0TNCRzNQH20hOu3F1a8jHEpr/61pdg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=STCiPlE7YCJ6EP08/0/rI3sm0hiVo8h5O7hPvhYrwE3F9gUgh6x4qYOG+oseUMFcp
 0fco+B87d09Raz+TTKdqXsLyYzKcXAdDlu7u6dynGTXapE5MiKaRnCLZNtHfy4iPVf
 YrFUa2ViLJHx3lj6THIzfxNRTHyc59xkPpq2G4OYaS7/FpXFsareyepu+TXhtqXV1t
 +IWXOamdz1kto1W1vQdKKch43W+DgpLtRQt/JCOlpjqXu2nAG9q2e5bg95X1VbUZkm
 zFHSXzhBhfLcoSN9hVcPH55Kp/YFTYgSIxZnb4g0wcPn5Iu25E8YXr01CGvzb/Z3K7
 vTjplDCeoUGQQ==
Date: Fri, 13 Mar 2026 07:55:51 -0700
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <20260313145551.GN1770774@frogsfrogsfrogs>
References: <20260309192355.176980-1-aalbersh@kernel.org>
 <20260309192355.176980-20-aalbersh@kernel.org>
 <20260310012914.GG1105363@frogsfrogsfrogs>
 <ymisdrze3ohdnxa4inqfwp4riaz4qk5nmtil33adn5ukhngq7v@f3tcv3hbzobz>
 <20260312145250.GE6069@frogsfrogsfrogs>
 <dz3va7indkh4to2pingopyndck737qvyxvlfomkqqothzj4pdk@wu26ba5stnf6>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dz3va7indkh4to2pingopyndck737qvyxvlfomkqqothzj4pdk@wu26ba5stnf6>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Mar 13, 2026 at 12:17:15PM +0100, Andrey Albershteyn
 wrote: > On 2026-03-12 07:52:50, Darrick J. Wong wrote: > > On Thu, Mar 12,
 2026 at 02:50:57PM +0100, Andrey Albershteyn wrote: > > > On 20 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w13vn-0002Av-G2
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
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:aalbersh@redhat.com,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
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
X-Rspamd-Queue-Id: 33CAC285639
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 12:17:15PM +0100, Andrey Albershteyn wrote:
> On 2026-03-12 07:52:50, Darrick J. Wong wrote:
> > On Thu, Mar 12, 2026 at 02:50:57PM +0100, Andrey Albershteyn wrote:
> > > On 2026-03-09 18:29:14, Darrick J. Wong wrote:
> > > > > XFS preallocates spaces during writes. In normal I/O this space, if
> > > > > unused, is removed by truncate. For files with fsverity, XFS does not
> > > > > use truncate as fsverity metadata is stored past EOF.
> > > > > 
> > > > > After we're done with writing fsverity metadata iterate over extents in
> > > > > that region and remove any unwritten ones. These would be preallocation
> > > > > leftovers in the merkle tree holes and past fsverity descriptor.
> > > > > 
> > > > > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > > > > ---
> > > 
> > > > There's an upper limit on the number of blocks you can unmap/free in a
> > > > single transaction.  Maybe move the xfs_trans_{alloc,commit} into the
> > > > loop body?
> > > > 
> > > > Oh wait, you skip the written extents.  Ok, so maybe just roll it after
> > > > you've done a bunmapi.
> > > 
> > > I see, I will add a rolling transaction. Btw, why skipping the
> > > written extents let's us use rolling here?
> > 
> > Hrmm.  At first I thought: why can't xfs_fsverity_cancel_unwritten
> > allocate (and commit) the transaction inside the loop body?  Then I
> > thought "well, it's only conditionally unmapping things, and it's sort
> > of a pain to allocate a transaction only then to find out if you
> > actually want to run one".
> > 
> > OTOH there could be billions of extents in the data fork, so holding the
> > ILOCK for that many transactions isn't a good thing because tr_write
> > only preallocates space for a certain number of transaction rolls.
> > fsverity already holds IOLOCK_EXCL so there can't be any other programs
> > using the file.
> > 
> > So now I arrive back at "The transaction allocation and commit/cancel
> > should be inside the loop body, since crashing midway through wouldn't
> > result in user-visible changes to the file data".
> > 
> > > > Do you need to purge the cow fork too?
> > > 
> > > hmm, what case are you thinking about here? The fsverity is written
> > > in past EOF region, I don't see how COW extent could be left there.
> > > Can they somehow be left mapped for blocks past i_size?
> > 
> > I was talking about speculative cow fork preallocations below i_size.
> > They'll eventually get purged by blockgc, but you could give the space
> > back once you've committed enabling the fsverity file flag.
> 
> hmm, if they're purged by blockgc, then why to do it here? I'm

Since you've made the file read-only by turning on fsverity, I think
it's appropriate to return the COW fork preallocations to the free space
pool.  Granted, you're correct that blockgc will eventually call
xfs_reflink_cancel_cow_range for you either due to timeout or because
something hit ENOSPC and kicked blockgc.  So I guess its not a
requirement to land this series; I was just surprised not to see
xfs_reflink_cancel_cow_range done explicitly here.

> iterating and removing unwritten extents here only because
> xfs_inode_free_eofblocks() will skip fsverity inodes, the check in
> xfs_can_free_eofblocks():
> 
> 	if (IS_VERITY(VFS_I(ip)))
> 		return false;
> 
> The skipping is done to not remove all the fsverity metadata
> extents. With preallocations enabled there could be unwritten
> extents left in the metadata.

<nod> Cleaning out the unwritten extents from the data fork when
enabling fsverity makes sense to me and is totally fine.

> Am I missing something?

Nah, but we might be talking past each other a bit at this point. :/

--D


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
