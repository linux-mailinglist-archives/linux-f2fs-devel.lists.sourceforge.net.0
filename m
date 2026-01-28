Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEGAA4KFeWnGxQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jan 2026 04:41:54 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E60A9CCE9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jan 2026 04:41:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ViVgnwX01BshlNoKeMMw71Zgm5O6mga4G/7kjKtYma0=; b=HOjwsMuD0MJTn7+dJ0hjiInuoQ
	qAPlfStDHg4pZw7eTxV7/U9VkDG+c//gw4Jaz7VbDzN2ADIc/qgeq6SuLxSZx/amYdopSz+WQ6HVd
	ZFI072KCw91AzreicALHKbszYDWDSG/4YQhRMMcWVc72iAdPsAgu13zII7Wsoi6w5GD8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkwR9-0002tM-KW;
	Wed, 28 Jan 2026 03:41:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vkwR8-0002tG-C4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 03:41:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8WNwQvuQreTemPKSkE9Ofh4ZJaaChEBZ96eOjcAAjpM=; b=amVIgCUQuutyfOnX0xmlA2o62J
 hK2+DNUxwyzqAo1cUlPfSkoXP/tjAawSAM3DDoJYEkaMIfqw0vg6idOQdWvhiaRu3c9++IVI3xMvj
 xELBoFBaOcMOOOEL/Eq/HIEn9ODjdJsfy1dRTSMP87ZEIyf69xU8Aiv/ec+RFXCxAQUQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8WNwQvuQreTemPKSkE9Ofh4ZJaaChEBZ96eOjcAAjpM=; b=GsKHQxf+TWhiso57OhNhXFEKdK
 1Kig46/ztvYKEeX/3VdW40J9pZIej0qn6zfvkBsZ/3UeBqtuYsnTOrMFtU65tTHu551sF+/zVYJGT
 FXJ9+NzFbByRoEjCgoUfEs7stQZBfXdWdLBkH3rmDAJ9etpFD3NUPUChsgvz96K0blTM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vkwR7-0000zR-Tt for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 03:41:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 42F9C6001A;
 Wed, 28 Jan 2026 03:41:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79AE0C4CEF1;
 Wed, 28 Jan 2026 03:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769571695;
 bh=34CW2N/dMbkFR7cyXaksGnhaLHYhfifPNLB5pSoQWJE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dbwCTTNNtA2TKf57Dcgd/gAlPCfwSPJkzXB3I0ZjyGqro2OC4619YEMvb7YfHTNfM
 jbbinV6fx+3o6stxCiyTbER6NlHiabXHM2N0tJsuZYdqiA53a1y3FENrQCJUGd/QWZ
 KJ89SaP7IBuIx1QeDPYdGy+5fanThEWZyeXhXMIviAkumfjCalzL7OWk8+Kq7nV7k8
 dMWmiOE1p5dO7wppx7RgSc1wDvLCR19Nt3jBuW3KtXQCkh4VYhPb5OKtosUKtClEpu
 69vfH/WpL7e3WbzfuH7+Px8no6l4ad0AwmMuuYOe7xaD+Z8U7wSiaMdfA+BI+uODz7
 vqATPSgpMFC4Q==
Date: Tue, 27 Jan 2026 19:41:02 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260128034102.GC2718@sol>
References: <20260126045212.1381843-1-hch@lst.de>
 <20260126045212.1381843-10-hch@lst.de> <20260128032203.GA2718@sol>
 <20260128033242.GA30830@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260128033242.GA30830@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 28, 2026 at 04:32:42AM +0100, Christoph Hellwig
 wrote: > On Tue, Jan 27, 2026 at 07:22:03PM -0800, Eric Biggers wrote: >
 > On Mon, Jan 26, 2026 at 05:50:55AM +0100, Christoph Hellwig wrote [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vkwR7-0000zR-Tt
Subject: Re: [f2fs-dev] [PATCH 09/16] fsverity: constify the vi pointer in
 fsverity_verification_context
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
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.71 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
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
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 3E60A9CCE9
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 04:32:42AM +0100, Christoph Hellwig wrote:
> On Tue, Jan 27, 2026 at 07:22:03PM -0800, Eric Biggers wrote:
> > On Mon, Jan 26, 2026 at 05:50:55AM +0100, Christoph Hellwig wrote:
> > > struct fsverity_info contains information that is only read in the
> > > verification path.  Apply the const qualifier to match various explicitly
> > > passed arguments.
> > > 
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > ---
> > >  fs/verity/verify.c | 15 ++++++++-------
> > >  1 file changed, 8 insertions(+), 7 deletions(-)
> > 
> > Did you consider that fsverity_info::hash_block_verified is written to?
> > It's a pointer to an array, so the 'const' doesn't apply to its
> > contents.  But logically it's still part of the fsverity information.
> 
> Well, it doesn't apply by the type rules.  But if you don't like the
> const here just let me know and I'll drop it.

It just seems that the motivation is a bit weak.  It works only because
hash_block_verified happens to be a dynamic array, and also because the
spinlock that used to be there got removed.  And the very next patch
removes const from the inode, so it kind of feels like we're going in
two different directions.  Maybe just drop this patch for now?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
