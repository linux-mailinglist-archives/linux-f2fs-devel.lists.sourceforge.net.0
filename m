Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFl8H0DxdmmcZQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 05:44:48 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA9083F17
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 05:44:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KnoguQ0yo94Kj/8UARJ6EZr9XKdP5lusaX70LUDKUU=; b=ajkhpq8hYscNrv8AiTvfKBoCbQ
	KfYpnngEjBDVInmZPeQcFC+jwXyfzTRF7YnkqohswjPoO31DC8C0Plp9KGneQcrRfbiDUroH44HiE
	4nuyZ6gb55DLmReTYrUstvIAq2eybKmszPsuGGLO5iq0bJJaOkxjsgCpcMsiFPg5/Khc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkET0-0001jy-Ov;
	Mon, 26 Jan 2026 04:44:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vkESz-0001js-2o
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 04:44:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fEvz0tC1QpCdCWEL2qYjelf9//kVFRfrE11p6U3rlPw=; b=MDlS9NC/5WkuZve/7Vpw76Vpum
 cPsY+OF2WQufwHCIvXobUwX1UvqN3ZzIJAQaDsKwlZG0AiwlHP2qJii2tTYHC9uH0XCLSt5Y7G9fF
 qSfMjo4AP6DYbUFzkquC4/GSAcSbktjWsmXVsT+5+lJkOaOXEZJIo3+xdsXU7Jl2B/X0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fEvz0tC1QpCdCWEL2qYjelf9//kVFRfrE11p6U3rlPw=; b=brlXwmdk9AalKIXTPIo8ctK/W1
 /U9WtcJOcov260sFDr6BFif0VxjuqW8bVr5C5B3+1SYa4YbNua7MYduiY3GxgjRFUfte69h539jwY
 w51rp3NGmTsJQss3LRCZKspSM1vZPrm6sLErVZPcNmaG43W+rv8a3KeWDfMpls1Ymjf0=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vkESy-0001W6-Jr for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 04:44:45 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id BE26F227A88; Mon, 26 Jan 2026 05:44:32 +0100 (CET)
Date: Mon, 26 Jan 2026 05:44:32 +0100
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20260126044432.GE30803@lst.de>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-12-hch@lst.de> <20260125013104.GA2255@sol>
 <aXaPph6Yi-hzf0J-@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXaPph6Yi-hzf0J-@casper.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Jan 25, 2026 at 09:48:22PM +0000,
 Matthew Wilcox wrote:
 > Is there a reason not to do as DAX did: > +#ifdef CONFIG_FS_VERITY > #define
 S_VERITY (1 << 16) /* Verity file (using fs/verity/) */ > +#else > +#define
 S_VERITY 0 /* Make all the verity checks disappear */ > +#endif > #define
 S_KERNEL_FILE [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vkESy-0001W6-Jr
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:aalbersh@redhat.com,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid]
X-Rspamd-Queue-Id: 2DA9083F17
X-Rspamd-Action: no action

On Sun, Jan 25, 2026 at 09:48:22PM +0000, Matthew Wilcox wrote:
> Is there a reason not to do as DAX did:

> +#ifdef CONFIG_FS_VERITY
>  #define S_VERITY       (1 << 16) /* Verity file (using fs/verity/) */
> +#else
> +#define S_VERITY       0         /* Make all the verity checks disappear */
> +#endif
>  #define S_KERNEL_FILE  (1 << 17) /* File is in use by the kernel (eg. fs/cachefiles) */
>  #define S_ANON_INODE   (1 << 19) /* Inode is an anonymous inode */
> 
> 
> and then we can drop the CONFIG_FS_VERITY check here and in (at leaast)
> three other places

I looked into this, but wasn't entirely sure about all callers.  Also
in at least some places we might need the barrier in fsverity_active,
so my plan was to see how many of the checks should simply be converted
to fsverity_active in a follow on and how much is left after that first.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
