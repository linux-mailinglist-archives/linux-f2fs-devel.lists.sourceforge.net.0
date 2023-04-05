Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA3D6D8535
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 19:51:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pk7Hc-0005II-Pu;
	Wed, 05 Apr 2023 17:50:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pk7Hc-0005IC-63
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 17:50:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MRgvihe+1WyDTvsHn4M9QlfVv6sYj8QTdUgqotsbYXo=; b=TdB597+Pr7EWixOPPQEFo3NDdH
 5cFYQWNk4olZvQVvV2+aUj/s2X3TExpkQXj0fXXI2lFyXk6+imG5qN2QJ8Pa1uTK955oR9GmzH86u
 gbpellBjo0I0PsxoW9qq+OXWm7Nl9uaD0CqyilJBIeDi+535sd5VOOKdNFO6g4dNUwd4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MRgvihe+1WyDTvsHn4M9QlfVv6sYj8QTdUgqotsbYXo=; b=gGpGMB4OeXx3xyv5ZspRHOxzu0
 kpUeDXKtV+/nh1y2TWnFIDV+bsjthtuzBrWZebPfNQDxhvt9VsDe1qAncQ4CIFzMYyCcNX3aW3mR5
 3F30urRLnmNLfB8zRw1AUPBGf9l7+/zbHJ8J4JJ++H1TzTh1E9QFmFCv47Wv/DLiQNQE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pk7Ha-00GBrN-Mh for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 17:50:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4D5D663D5B;
 Wed,  5 Apr 2023 17:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66EE0C433D2;
 Wed,  5 Apr 2023 17:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680717048;
 bh=8RyRFaPwlCx6/LOIIjBet5SjJyIkLiaizKSwCarmDik=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N5ckeWaOWk8DYRS/vHEJFODUdFDterIWk0v6dwVPSI9Eqo5M3E9e4grJyjnLkrviz
 dmFQfemBW4Yipr4UCkQqWu/G0jjSFPpIfLv1Je78AwwHLIERp0PH1/vRe80YL6RRYZ
 JHue6126dFHFUdI0jGeczDDfabiD0M1vLyQEPVfbHZX3zYTjLfOHFds9uxGxs3TRQA
 4MnoQS7XV3DutZNo5CjWayJ9Vw8uMHLtIdvQkc3cGo0pogH7TUG6lTRLj5yrPGYu4M
 tKZPz4nQeJIMNPgpgrINAMfcVgJNK3JNCa+gggxvfOkDxw9yi9kDdMaMWz6bTaOSji
 hhrgnfYs6HsxA==
Date: Wed, 5 Apr 2023 17:50:46 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <ZC209lS6vrEGqDhx@gmail.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-6-aalbersh@redhat.com>
 <ZCxCnC2lM9N9qtCc@infradead.org>
 <20230405103642.ykmgjgb7yi7htphf@aalbersh.remote.csb>
 <ZC2X5YlHMxzZQzhx@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZC2X5YlHMxzZQzhx@infradead.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 05, 2023 at 08:46:45AM -0700, Christoph Hellwig
 wrote: > On Wed, Apr 05, 2023 at 12:36:42PM +0200, Andrey Albershteyn wrote:
 > > Hi Christoph, > > > > On Tue, Apr 04, 2023 at 08:30:36AM -0 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pk7Ha-00GBrN-Mh
Subject: Re: [f2fs-dev] [PATCH v2 05/23] fsverity: make
 fsverity_verify_folio() accept folio's offset and size
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
Cc: fsverity@lists.linux.dev, cluster-devel@redhat.com,
 linux-ext4@vger.kernel.org, agruenba@redhat.com, djwong@kernel.org,
 Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 dchinner@redhat.com, rpeterso@redhat.com, xiang@kernel.org, jth@kernel.org,
 linux-erofs@lists.ozlabs.org, damien.lemoal@opensource.wdc.com,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 05, 2023 at 08:46:45AM -0700, Christoph Hellwig wrote:
> On Wed, Apr 05, 2023 at 12:36:42PM +0200, Andrey Albershteyn wrote:
> > Hi Christoph,
> > 
> > On Tue, Apr 04, 2023 at 08:30:36AM -0700, Christoph Hellwig wrote:
> > > On Tue, Apr 04, 2023 at 04:53:01PM +0200, Andrey Albershteyn wrote:
> > > > Not the whole folio always need to be verified by fs-verity (e.g.
> > > > with 1k blocks). Use passed folio's offset and size.
> > > 
> > > Why can't those callers just call fsverity_verify_blocks directly?
> > > 
> > 
> > They can. Calling _verify_folio with explicit offset; size appeared
> > more clear to me. But I'm ok with dropping this patch to have full
> > folio verify function.
> 
> Well, there is no point in a wrapper if it has the exact same signature
> and functionality as the functionality being wrapped.
> 
> That being said, right now fsverity_verify_folio, so it might make sense
> to either rename it, or rename fsverity_verify_blocks to
> fsverity_verify_folio.  But that's really a question for Eric.

I thought it would be confusing for fsverity_verify_folio() to not actually
verify a whole folio.  So, for now we have:

    fsverity_verify_page: verify a whole page
    fsverity_verify_folio: verify a whole folio
    fsverity_verify_blocks: verify a range of blocks in a folio

IMO that makes sense.  Note: fsverity_verify_folio() is currently unused, but
ext4 might use it.

So, just use fsverity_verify_blocks().

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
