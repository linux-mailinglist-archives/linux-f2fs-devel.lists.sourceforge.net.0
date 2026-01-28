Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFgnC2mKemkE7gEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jan 2026 23:15:05 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB90A9724
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jan 2026 23:15:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORA0q+QTtrvaHtLTNt/vuS6nfUnHt7iUFZwND5beQvU=; b=DgirocEVblKN2KFj5INyaYM+Gu
	HnqxWVulOkWRlvKjhrpOemkVqSGEWVWmIxLRPiVQMOLALxMxbVS+33V8s7hqNdJKjc9KcIdI01ZDS
	h7Kr0C5xtZe/quwzdeAkJGpTuNmlj4mQi9Ytj6z5ouXn6zkkRAwPbPjo4rVhnaX3dQnI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vlDoL-0000bY-EQ;
	Wed, 28 Jan 2026 22:14:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vlDoK-0000bS-1V
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 22:14:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FLyJYted8TLcWVoZYFNxR6fzatHs+U7RFueAINe9KBI=; b=HtHTVsfp0xE2hFCRZsJ5sn2oK9
 0bRfPh/BNg+V0fXRo7HJWnKqurvm+kTY9ffO1rd/lHFY89qUavFRluODBk/cfKF44wE9qcYahbk1f
 OoSwupozEBzkF0e5m5gN/Hw0Rm4XcSjKi7iAQIeYObTvPpsJArs7xVHkzj8p1B1ekquo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FLyJYted8TLcWVoZYFNxR6fzatHs+U7RFueAINe9KBI=; b=R5JVeZdq6KV6Jg++ORnedmUF3G
 zbnt665Te88nVsvIIOn+EP3KcyOaSW7quDn+CIjEtBhXEEquyZQxnIAjfc1+ZsitSWO+jz1aV/6ks
 oW22xg29kaQQa9s6cLRwMokUrVw7GuAoM9YuJzdR0uMYgYbjHRkBBhED9cTdPUKtgmvg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vlDoJ-0004zT-Ka for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 22:14:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 064186001A;
 Wed, 28 Jan 2026 22:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF25C4CEF1;
 Wed, 28 Jan 2026 22:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769638485;
 bh=74NOxbKqGkEgjNrHB91dvQmAkyTNGiv+n72fcNGKqZY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g6V+2AmGSx+O4xRcfzdNK367XLC6Zd1kGT9QPvZRs642jJUgA3AMa1pI1xMIBSBG3
 l+R+OdGNtO35Yov9kFCv05zeeG4fFH3W1L9CJpg+79lorbczT4eHx+1oZlDSO3ZC4F
 7lDNpTmb6whN9LQPIVYFn7DAqwG3+qvzJV/eBZZdAqCh9Hqm64b8BJIF2JY6klONmw
 0J5SzHz2OYjPOQrBnHWRWU1iA17VZOQW8mKbREoWMggJgLTebM/cmrUO8VX3MRd/IW
 XPyabvb/HQw/RRTsLjV0aeme/1rI65VVQnnVgp2JOlGnsS0EIBdmDMLkPvxVYHXkgz
 Md+xlyZQrnDkQ==
Date: Wed, 28 Jan 2026 14:14:43 -0800
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20260128221443.GA2024@quark>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-12-hch@lst.de> <20260125013104.GA2255@sol>
 <aXaPph6Yi-hzf0J-@casper.infradead.org>
 <20260126044432.GE30803@lst.de> <20260126201206.GA30838@quark>
 <aXqB7Wlfx62bAjqF@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXqB7Wlfx62bAjqF@casper.infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 28, 2026 at 09:38:53PM +0000,
 Matthew Wilcox wrote:
 > On Mon, Jan 26, 2026 at 12:12:06PM -0800, Eric Biggers wrote: > > When
 CONFIG_FS_VERITY=n, there can still be inodes that have fsverit [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vlDoJ-0004zT-Ka
Subject: Re: [f2fs-dev] [PATCH 11/11] fsverity: use a hashtable to find the
 fsverity_info
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
X-Rspamd-Queue-Id: 6FB90A9724
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 09:38:53PM +0000, Matthew Wilcox wrote:
> On Mon, Jan 26, 2026 at 12:12:06PM -0800, Eric Biggers wrote:
> > When CONFIG_FS_VERITY=n, there can still be inodes that have fsverity
> > enabled, since they might have already been present on the filesystem.
> > The S_VERITY flag and the corresponding IS_VERITY() macro are being used
> > to identify such inodes and handle them appropriately.  
> > 
> > Consider fsverity_file_open() for example:
> > 
> > static inline int fsverity_file_open(struct inode *inode, struct file *filp)
> > {
> > 	if (IS_VERITY(inode))
> > 		return __fsverity_file_open(inode, filp);
> > 	return 0;
> > }
> > 
> > When CONFIG_FS_VERITY=n, __fsverity_file_open() resolves to the stub:
> > 
> > static inline int __fsverity_file_open(struct inode *inode, struct file *filp)
> > {
> > 	return -EOPNOTSUPP;
> > }
> > 
> > So the result is that on a kernel that doesn't have fsverity support
> > enabled, trying to open an fsverity file fails with EOPNOTSUPP.
> 
> ... why?  If the user has built a kernel without VERITY support enabled,
> they're no longer allowed to open files with verity metadata?  I can't
> see the harm in allowing them to read these files, they're just not
> protected against these files being corrupted.

Reading could be allowed, in principle.  But open and truncate would
still need to deny writes, and the code to do that uses IS_VERITY().  So
it still wouldn't allow S_VERITY to be defined to 0, unless these checks
were updated to use the filesystem-specific flags as I mentioned.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
