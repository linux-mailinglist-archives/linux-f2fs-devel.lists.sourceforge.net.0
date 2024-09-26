Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 78992987535
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Sep 2024 16:12:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1stpDy-0003BR-OI;
	Thu, 26 Sep 2024 14:12:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1stpDw-0003BJ-Ir
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Sep 2024 14:12:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Lj+/8xAR5PaVy59MnBKM3J07hbpzGvxFdzdZSeN/YVU=; b=PryNDF/VYwCYyhl6QipsrUaqcw
 KP5PtXjoxDW2mvdhnVKYWG0T6aI9zm7qAwKEa05CiwxeNNkW6n4vpzLtZTH74MU7Tqmrn1uzqPxyN
 UdED/iQCGMiHTIzzfUfJRthMlZ0kAXrdewNJ/pDoAaAEybKN0DoixSeyVLyuEtfVxSwQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Lj+/8xAR5PaVy59MnBKM3J07hbpzGvxFdzdZSeN/YVU=; b=G1h+fbjpW3vt+SUsBC0Lbc30/5
 QZlCvMqQU+XvZXNaGLF28XFcgjlMrqpspEFxjuCyYgH8xAMuFqhrR9Ldkq9nyOw/3+7cvQy+pWJOV
 8i2+mPy9RDs7ITWDyVL0NJBhsCOITGPcsslHmF8OPCXu1E9xnFsHb1L/vIYQ0kajmomg=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1stpDu-0007xg-Gi for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Sep 2024 14:12:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Lj+/8xAR5PaVy59MnBKM3J07hbpzGvxFdzdZSeN/YVU=; b=kfoFBXNHfVwMRIGX58SyrymBNC
 YzUHnIoUnLjQhsOFGr/HgSKhf3+vtBej7GIrhPF6uJQZlA9RXMo9hf8uOr744bEBaXKz4VW24DO5Y
 6vV3x411I/LWjg/Qn9Vsl5g3Kv6zIUm2BjY1t8ZjFLgKK3CCmWDhJi7/8ixdd4VZeCJrEwAdsL/8G
 W8rDpaZWebuh5xNSTP5aQ297lauuyCUmyJHNVwSxGeGChNQ4GFB1o4rWC/bHhPdWP8NBAtnTGtktq
 TSOPtw4Bls2gGeycnfp5N2w0L+ArZ9N2tQbrdIlD3Xw0t2udvWW+seTOeiXmGLyZeWypPD2Y92Dod
 D7IeMC0g==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1stpDU-00000006ofk-2nuu; Thu, 26 Sep 2024 14:11:36 +0000
Date: Thu, 26 Sep 2024 15:11:36 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>
Message-ID: <ZvVrmBYTyNL3UDyR@casper.infradead.org>
References: <20240926140121.203821-1-kernel@pankajraghav.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240926140121.203821-1-kernel@pankajraghav.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Sep 26, 2024 at 04:01:21PM +0200,
 Pankaj Raghav (Samsung)
 wrote: > Convert wbc_account_cgroup_owner() to take a folio instead of a
 page, > and convert all callers to pass a folio directly exce [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1stpDu-0007xg-Gi
Subject: Re: [f2fs-dev] [PATCH] fs/writeback: convert
 wbc_account_cgroup_owner to take a folio
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
Cc: Jan Kara <jack@suse.cz>, linux-doc@vger.kernel.org,
 "Darrick J . Wong" <djwong@kernel.org>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Zefan Li <lizefan.x@bytedance.com>,
 cgroups@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 gost.dev@samsung.com, linux-ext4@vger.kernel.org,
 Pankaj Raghav <p.raghav@samsung.com>, Josef Bacik <josef@toxicpanda.com>,
 linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, mcgrof@kernel.org,
 Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 akpm@linux-foundation.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Sep 26, 2024 at 04:01:21PM +0200, Pankaj Raghav (Samsung) wrote:
> Convert wbc_account_cgroup_owner() to take a folio instead of a page,
> and convert all callers to pass a folio directly except f2fs.
> 
> Convert the page to folio for all the callers from f2fs as they were the
> only callers calling wbc_account_cgroup_owner() with a page. As f2fs is
> already in the process of converting to folios, these call sites might
> also soon be calling wbc_account_cgroup_owner() with a folio directly in
> the future.

I was hoping for more from f2fs.  I still don't have an answer from them
whether they're going to support large folios.  There's all kinds of
crud already in these functions like:

        f2fs_set_bio_crypt_ctx(bio, fio->page->mapping->host,
                        page_folio(fio->page)->index, fio, GFP_NOIO);

and this patch is making it worse, not better.  A series of patches
which at least started to spread folios throughout f2fs would be better.
I think that struct f2fs_io_info should have its page converted to
a folio, for example.  Although maybe not; perhaps this structure can
carry data which doesn't belong to a folio that came from the page cache.
It's very hard to tell because f2fs is so mind-numbingly complex and
riddled with stupid abstraction layers.

But I don't know what the f2fs maintainers have planned.  And they won't
tell me despite many times of asking.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
