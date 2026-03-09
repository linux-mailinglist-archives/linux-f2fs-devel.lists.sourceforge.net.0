Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPqiL/Mwr2kYPgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 21:43:31 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAE6241067
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 21:43:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jb2CLRGD469QHQPSwzKCYNWKu0KAOxax1RJZcrrgjjM=; b=NGYNO3MYmmp6orivqIoRdw0PDe
	zGjLq/iDuiWCO7SUQTqDkbNr2e/CqlM/JBG6byG4GIofRrDhgNzuIuwNHOgg3BorYfCTM9H5XvJJD
	D+c51j8AGnxR8pUpLPLsSTMqX32P/6t5NP9cbYzLhk8FVMb6kZko8HDEajx+dhblV5d0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzhRk-0001ji-A1;
	Mon, 09 Mar 2026 20:43:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vzhRj-0001ja-65
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 20:43:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fi4UVye4gem2axpOsQaO5hKAYC0fKut1CdhkW1Dvc0M=; b=FPdvKkQfdRKMmrJG/dDMHMz7/2
 QnxOD0w98v6BJ4sFRcilUdiBpMmln1Y9V1kxvIP+URVIYTuHFwBx+PqyOi4pP0Iz7JFb7FbeToKdS
 8IdJXchr2xrTplGQeWLkqQnt2u+fkgn5jtsOwunxBVQ1C/Crq5ty2xftR5YrFhseP7ZE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fi4UVye4gem2axpOsQaO5hKAYC0fKut1CdhkW1Dvc0M=; b=HYNLh/C98xREpoc2laOeGB8K8r
 ySQBadF/oA7WoPJAulrCXGZcxv8rm5/+CjOYWFkmM2+4q7rZHShJoQIT2BBSHLJd+aF3uk3h8IWia
 RF5Myk6B9rmQ5pLRJFeyFwusg4WEdhaVN3AUaE4si5CRrXDKms803GZFtkq/rR5QoAFQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzhRi-0005Gb-Lu for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 20:43:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 15D4F60097;
 Mon,  9 Mar 2026 20:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27EB9C2BC87;
 Mon,  9 Mar 2026 20:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773088991;
 bh=LgbkmLMqtuYdFY11z23RJwEuy3ulRqnM9TgZfuz+WJI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pECjVXrpy9OUbNbNVsH0KaVo3LTgKu7FDofzwVvojZhIC+oT6MSC7DHR8ef/by7ob
 6itzmOmMCDtY972OYbTjZloNCOdo12p/r7AZtpteRKJldBv5Y+dkbk0XAiZSauZaWk
 Ry2KCfqFQjZQLW4k7GutSWPCjM9o/zS1hAdjswBVo+dSe9ObPKKDYWs1y1+2WcrNOk
 1f0DEmAI22rCPgKEbpxbYJWLJWj/5Ivx/yvvdTN+kraZXbARq5F3NAo1aTaKxeBiux
 X4cY4t6ohPYFgAmqCeHJEO1LYVn9h3S5DBWKYllkI67xDjgNSpHQLz/IaIjfboBojx
 izjvSIggQsg4Q==
Date: Mon, 9 Mar 2026 13:43:09 -0700
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260309204309.GB2048@quark>
References: <20260302141922.370070-1-hch@lst.de> <20260303223507.GA56397@quark>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260303223507.GA56397@quark>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Mar 03, 2026 at 02:35:07PM -0800, Eric Biggers wrote:
 > On Mon, Mar 02, 2026 at 06:18:05AM -0800, Christoph Hellwig wrote: > >
 Hi all, > > > > this series cleans up various fscrypt APIs to pas [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vzhRi-0005Gb-Lu
Subject: Re: [f2fs-dev] fscrypt API cleanups v3
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
Cc: Christian Brauner <brauner@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 6CAE6241067
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:brauner@kernel.org,m:tytso@mit.edu,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fscrypt@vger.kernel.org,m:adilger.kernel@dilger.ca,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
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
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 02:35:07PM -0800, Eric Biggers wrote:
> On Mon, Mar 02, 2026 at 06:18:05AM -0800, Christoph Hellwig wrote:
> > Hi all,
> > 
> > this series cleans up various fscrypt APIs to pass logical offsets in
> > and lengths in bytes, and on-disk sectors as 512-byte sector units,
> > like most of the VFS and block code.
> > 
> > Changes since v2:
> >  - use the local bio variable in io_submit_init_bio
> >  - use folio instead of io_folio (and actually test the noinline mode,
> >    which should have cought this for the last round)
> >  - add an extra IS_ENABLED(CONFIG_FS_ENCRYPTION) to safeguard
> >    against potentially stupid compilers
> >  - document the byte length needs to be a multiple of the block
> >    size
> >  - case to u64 when passing the byte length
> >  - move a hunk to an earlier patch
> > Changes since v1:
> >  - remove all buffer_head helpers, and do that before the API cleanups
> >    to simplify the series
> >  - fix a bisection hazard
> >  - spelling fixes in the commit logs
> >  - use "file position" to describe the byte offset into an inode
> >  - add another small ext4 cleanup at the end
> 
> This looks good now.  I'll plan to apply this to fscrypt.git#for-next in
> a bit.  Other reviews and acks appreciated.

Applied to https://git.kernel.org/pub/scm/fs/fscrypt/linux.git/log/?h=for-next

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
