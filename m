Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yH1HOwyYg2lnpwMAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Feb 2026 20:03:40 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18880EBD25
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Feb 2026 20:03:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2aTMO8cXWml7hXV+9YGDoPiaZGgyXAh8AK15LpoX5ws=; b=daoiAz2Zu+HtcemY6fcQ3moLCP
	ieAKtR8gMu6WqCzfTafnenDkHdamblgEF38JtVmtgSOiizmI3gDWx56J8OZOZkQt6lIJFUF3zyu0j
	wzUf8BJw00yQQZcRhVZ6fxB6boAHHJpwzk/8azn0cU0Mtu7PWp1ObUtL/2n6iO8mhvxM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vni9u-0002Zx-6j;
	Wed, 04 Feb 2026 19:03:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vni9V-0002Z3-5F
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Feb 2026 19:03:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gcicpRnFZqDQuNdDeucMTRuFSM7KzgHOWhDLEwTr4jg=; b=hFGLihIWXHEdY+BVx5Lv16skkx
 YGcVWf3840BAf7vp4o/UsxjqOadJ6otnda9elYtMzAKpo0vtbymuE8LVZXXYuXRzuIYYqRApE0D7F
 qls4DskbFRu2kokvzUMul9V9BIR9tWQ32Nce50BCH+huagS4azuJIiqptC+uDFXBtprE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gcicpRnFZqDQuNdDeucMTRuFSM7KzgHOWhDLEwTr4jg=; b=GapLIu7X6ImWqoN4vSPAP44fLX
 AW0I1+LUBZH7TZIpUYiAEskDbXJke9caPf6zljogILsOVb4hy0s3pHMeZoO3fNrwoYDh4SMunYMpj
 MezJoWqKUBlONWP+iR7gecWVX9MGTSJB/Kk8w+r/E+M0Kcw/h80aMUSP4jlO7d+Xfezg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vni9U-0000Vu-Gv for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Feb 2026 19:03:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 265E343C37;
 Wed,  4 Feb 2026 19:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF1DC4CEF7;
 Wed,  4 Feb 2026 19:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770231775;
 bh=fvuVHItsYXpPWArU/0i6pDSN5I363ZzcoNvZNPppv2A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iofq7J9ZB5Q1dLAB7Qy2uln0MXvVcL8qlvWkKB9VOYrtveQA4p5R4JTmTGe9Gx4mC
 Ly679d9E5LOL2n1FGUeWmohBZgFgVIkdBvw+55f1to50oLS5fY9G4zPv+d8uBnGhzo
 LmRcgveKUt7s6aE5+Pbkm904SsxtQlB04KUAu9gbIY+U0c0q7pTnP7rUIE6DY7CvT7
 AWNUxuB028+w9gFncQbilhM43+W4aUnf0kqw0ju5I8u+DZUqUGksc3l8vdRI8X2u9n
 YEUuj8GIaw8EwBwmU7aB8JU/OP0avF4KzqkYdpw5Kzh4D/gZTea5d4fWopgA3+BMmk
 oE3OICQWQ9TCg==
Date: Wed, 4 Feb 2026 11:02:18 -0800
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20260204190218.GA2193@sol>
References: <20260202060754.270269-1-hch@lst.de> <20260202211423.GB4838@quark>
 <aYNdmk1EE5etfUYE@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aYNdmk1EE5etfUYE@casper.infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Feb 04, 2026 at 02:54:18PM +0000,
 Matthew Wilcox wrote:
 > On Mon, Feb 02, 2026 at 01:14:23PM -0800, Eric Biggers wrote: > > - Used
 the code formatting from 'git clang-format' in the cases wher [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vni9U-0000Vu-Gv
Subject: Re: [f2fs-dev] fsverity speedup and memory usage optimization v5
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.71 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
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
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 18880EBD25
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 02:54:18PM +0000, Matthew Wilcox wrote:
> On Mon, Feb 02, 2026 at 01:14:23PM -0800, Eric Biggers wrote:
> > - Used the code formatting from 'git clang-format' in the cases where it
> >   looks better than the ad-hoc formatting
> 
> clang-format makes some bad choices.
> 
> >  static int ext4_mpage_readpages(struct inode *inode, struct fsverity_info *vi,
> > -		struct readahead_control *rac, struct folio *folio)
> > +				struct readahead_control *rac,
> > +				struct folio *folio)
> 
> Aligning to the opening bracket is one of them.  If anything changes
> in a subsequent patch (eg function name, whether or not it's static,
> adding a function attribute like __must_check, converting the return
> type from int to bool), you have to eitheer break the formatting or
> needlessly change the lines which have the subsequent arguments.
> 
> Also, you've consumed an extra line in this case.  Just leave the
> two tab indent, it's actually easier to read.

Aligning to the opening bracket is the usual style as agreed on by the
kernel community.  This should also be clear if you look at the existing
style in all the files this patchset touches.  It's not done exclusively
but is the more common way.  clang-format just follows that.

It's 2026.  We generally shouldn't be formatting code manually.  We have
better things to do.

If you're going to insist on ad-hoc formatting of argument lists, you'll
need to be more specific about where and how you want it to be done.  It
certainly doesn't make sense in files that are already using the normal
style exclusively, for example.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
