Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMP6CUUic2mUsgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 08:24:53 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD8E71ACC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 08:24:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SvNUCvjrtKmBImqyeYs3ustJkBpqjOfMWoo9YTtvh4Y=; b=iiXa+XUMeww8i3K8Qyuecihpya
	D+vMZJ8byG1Crr9F+WbVBAQU3uLLm7Sz7M/8IHWVgcy43XHWuhauEM1d04NoW/OFJ6uSik72NCPdG
	ub+1HNSmK8pzhc8uV8dZ2lMI+6zACQ4p5lhGwDVnuzyEsTCrSpRjqze01EGh7nTe7CQE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vjBXE-0001eK-D7;
	Fri, 23 Jan 2026 07:24:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vjBXC-0001e7-U2
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 07:24:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D5hT19nk1G0CmEcMDf6P+tt6pycdzLu56FhXz3+jIfo=; b=WxAOdo7U3yxIUmsuOMUANxltYB
 fBzZIq93oMTJL8AfNFB8p2FH/rY+Ql73PjbtZr0yhjzWoMUKI2xQC3rXyHewa41h2cdrXJPxjZ0Jz
 Cs3Q/hZfiVdd+UQ00ySFs/9cCkaJRHqoxR+aopExr6UmW5JIit2kB5b5XgpnvLm2bsEU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=D5hT19nk1G0CmEcMDf6P+tt6pycdzLu56FhXz3+jIfo=; b=g8GfBP8OCxy5f8gxQbfIJir/cP
 32ipG0cvZyfdtJNm2KwtUoliIjFQhSi7WNd/CJh7L8E11xNOJ11hVHsqXphwDWk0yxH7YEht7KlYH
 BiJNyAsbW+x3CFCOa80w9I34Cxzx512HmQXx1nBq+FXahAwE+RIr1JKX3XF/Ua99bVkA=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vjBXD-00038j-3J for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 07:24:47 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 06C25227AAE; Fri, 23 Jan 2026 08:24:34 +0100 (CET)
Date: Fri, 23 Jan 2026 08:24:33 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20260123072433.GA27421@lst.de>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-8-hch@lst.de> <20260122214958.GG5910@frogsfrogsfrogs>
 <20260123051556.GC24123@lst.de> <20260123072329.GL5910@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260123072329.GL5910@frogsfrogsfrogs>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jan 22, 2026 at 11:23:29PM -0800, Darrick J. Wong
 wrote: > On Fri, Jan 23, 2026 at 06:15:56AM +0100, Christoph Hellwig wrote:
 > > On Thu, Jan 22, 2026 at 01:49:58PM -0800, Darrick J. Wong wrot [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vjBXD-00038j-3J
Subject: Re: [f2fs-dev] [PATCH 07/11] fs: consolidate fsverity_info lookup
 in buffer.c
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
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:djwong@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	NEURAL_HAM(-0.00)[-0.921];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: CDD8E71ACC
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 11:23:29PM -0800, Darrick J. Wong wrote:
> On Fri, Jan 23, 2026 at 06:15:56AM +0100, Christoph Hellwig wrote:
> > On Thu, Jan 22, 2026 at 01:49:58PM -0800, Darrick J. Wong wrote:
> > > Well this is no longer a weird ext4ism, since f2fs also needs this,
> > > right?  Maybe this comment should read:
> > 
> > f2fs doesn't use buffer heads.  So this is just because ext4 only
> > implements the easy parts of ->read_folio and ->readahead itself and
> > falls back onto the generic code for the rest, which then had to be
> > grow hacky ext4-specific bits like this for it :(
> 
> Yikes.  So I guess we shouldn't genericise the comment to encourage more
> people to do the same thing ext4 did?

I don't think so.  I actually need to send a ping to the ext4 folks
that maybe, maybe they really should handle all reads into the page
cache in their own code so that we can hopefully kill this entirely.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
