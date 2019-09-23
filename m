Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBBCBB519
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Sep 2019 15:18:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iCOEy-0001Db-72; Mon, 23 Sep 2019 13:18:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1iCOEx-0001DV-Nb
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Sep 2019 13:18:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NkEOoYFdo9d/uoxWYvOIZ9BDP4nFyFqOUCtve3sJ6J8=; b=e5ZDpsdd6mUCjJRIOTKCzrbIRu
 Z+tK7bSn+YtEZspocFPOcTZig5hHxyD62jbhdn79ohsdpBGnhdUZm5Fj0hFgYb6SHUQhqBUgbcrY5
 gDbWloOlIbllewgvIts6Difebcpi/hySBFzHev84wfC1n7Fe8VCPTBkcU4PNxe3/K+x8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NkEOoYFdo9d/uoxWYvOIZ9BDP4nFyFqOUCtve3sJ6J8=; b=IGImr0E4z8JWraAznNgnLCYyTq
 Wb8CNXSYAlx3SvcOkcvHYtSPnEt41aoqF51RMiGvmYE+Ju+1MFTynkukENXpUlUWh9mZXsGqYTxXZ
 PyQijyB8/lp5vhXzbLJQei6TLNA8ahh/6YaXFd3C9XDrlJKcoUI3GX9pOB3yYbTwd/zo=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iCOEv-005O02-Ub
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Sep 2019 13:18:55 +0000
Received: from callcc.thunk.org (guestnat-104-133-0-98.corp.google.com
 [104.133.0.98] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x8NDIEHw002725
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 09:18:15 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 7F45B420811; Mon, 23 Sep 2019 09:18:14 -0400 (EDT)
Date: Mon, 23 Sep 2019 09:18:14 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Jan Kara <jack@suse.cz>
Message-ID: <20190923131814.GB6005@mit.edu>
References: <20190911093926.pfkkx25mffzeuo32@alap3.anarazel.de>
 <20190911164517.16130-1-rgoldwyn@suse.de>
 <20190911164517.16130-3-rgoldwyn@suse.de>
 <20190923101042.GA25332@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923101042.GA25332@quack2.suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.0 MAY_BE_FORGED          Relay IP's reverse DNS does not resolve to IP
X-Headers-End: 1iCOEv-005O02-Ub
Subject: Re: [f2fs-dev] [PATCH 2/3] ext4: fix inode rwsem regression
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
Cc: Goldwyn Rodrigues <rgoldwyn@suse.de>, david@fromorbit.com,
 linux-f2fs-devel@lists.sourceforge.net, hch@infradead.org,
 Goldwyn Rodrigues <rgoldwyn@suse.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, andres@anarazel.de, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Sep 23, 2019 at 12:10:42PM +0200, Jan Kara wrote:
> On Wed 11-09-19 11:45:16, Goldwyn Rodrigues wrote:
> > From: Goldwyn Rodrigues <rgoldwyn@suse.com>
> > 
> > This is similar to 942491c9e6d6 ("xfs: fix AIM7 regression")
> > Apparently our current rwsem code doesn't like doing the trylock, then
> > lock for real scheme.  So change our read/write methods to just do the
> > trylock for the RWF_NOWAIT case.
> > 
> > Fixes: 728fbc0e10b7 ("ext4: nowait aio support")
> > Signed-off-by: Goldwyn Rodrigues <rgoldwyn@suse.com>
> 
> Thanks for fixing this! The patch looks good to me. You can add:
> 
> Reviewed-by: Jan Kara <jack@suse.cz>
> 
> BTW, I've also added Ted as ext4 maintainer to CC.

Thanks, I've been following along, and once the merge window is over
I'll start going through the patch backlog.

Cheers,

						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
