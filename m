Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHxPBCaHeWnjxQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jan 2026 04:48:54 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFCE9CDCC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jan 2026 04:48:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xRWDLoAxtn+KsxlmCDSWEw6nZN0cD41es3B7TI+LlE=; b=IUGduraUNJN+KDEQj1ObIULw2V
	OH15MMcV+MqD/O/um8jch8e2X6FXV48WecJOpGXZPr4fO1U7Z6kLyR8+6slid5OnsVpXyw6Dull6d
	6Flhb+1hNb9NSjXSN9oOQ03cORpqDcbo0Hkvj1IsOQ2P/O7O66aKenpqk077rJBYgiSw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkwY0-00034G-4A;
	Wed, 28 Jan 2026 03:48:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vkwXy-00034A-UG
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 03:48:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dLiGlREeMT858PQ3Gpz22kWtl8jzsKSpPWko3/4HMVQ=; b=lvTHdJMBR4BaKl4d0LH66Cyg27
 tVCzKali++WPE5hlPTRutY4gbKTceBiQXRM6Qw+XKQHb3NNLAHelrelEEps9gK83G4SLE02LRK1Q5
 wE2PxcizA6y//m40IbHHL43Q8vowmiB+5svzDNRDf6FKJXeoemDY9oVDn/AnJD8oRyk8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dLiGlREeMT858PQ3Gpz22kWtl8jzsKSpPWko3/4HMVQ=; b=klx2nj77mrLIO1XfCg7oTLKMGI
 Cu/7QdpKbAblqZM10A0B70pi4l64C+umKeEvTvOwYi9RU3elPNlWfKX+jKQY+ELr7rvd03uqiqtz8
 mcUNg56RzkmQ11LSEwQ6JexRDkYaQbXe5qr9beEKT5fXwkLyOzRbUV1rzhVIdDfaUlOs=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vkwXy-0001Ls-Fs for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 03:48:50 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id AE668227A8E; Wed, 28 Jan 2026 04:48:38 +0100 (CET)
Date: Wed, 28 Jan 2026 04:48:38 +0100
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20260128034838.GB31178@lst.de>
References: <20260126045212.1381843-1-hch@lst.de>
 <20260126045212.1381843-17-hch@lst.de> <20260128032817.GB2718@sol>
 <20260128033519.GB30830@lst.de> <20260128034405.GD2718@sol>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260128034405.GD2718@sol>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jan 27, 2026 at 07:44:05PM -0800, Eric Biggers wrote:
 > On Wed, Jan 28, 2026 at 04:35:19AM +0100, Christoph Hellwig wrote: > >
 > Is there a reason for this function in particular to be __alway [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vkwXy-0001Ls-Fs
Subject: Re: [f2fs-dev] [PATCH 16/16] fsverity: use a hashtable to find the
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
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.61 / 15.00];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 7EFCE9CDCC
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 07:44:05PM -0800, Eric Biggers wrote:
> On Wed, Jan 28, 2026 at 04:35:19AM +0100, Christoph Hellwig wrote:
> > > Is there a reason for this function in particular to be __always_inline?
> > > fsverity_get_info() is just inline.
> > 
> > Without the __always_inline some gcc versions on sparc fail to inline it,
> > and cause a link failure due to a reference to fsverity_readahead in
> > f2fs_mpage_readpages for non-verity builds.  (reported by the buildbot)
> 
> The relevant code is:
> 
>     vi = f2fs_need_verity(inode, folio->index);              
>     if (vi)                                                  
>             fsverity_readahead(vi, folio, nr_pages); 
> 
> Where:
> 
>     f2fs_need_verity()
>         => fsverity_get_info()
>             => fsverity_active()
> 
> If fsverity_active() needs __always_inline, why don't the other two
> functions in the call chain need it?

I wish I knew.  compiler inlining decisions are a big of black magic.
If you prefer I can use __always_inline for the entire chain.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
