Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EE483EB93
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Jan 2024 08:05:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rTcko-0005cj-Au;
	Sat, 27 Jan 2024 07:05:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rTckm-0005cd-Ow
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Jan 2024 07:05:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UJhcIChyQ2GOu70fB3AQEEo9cS+cYeR56tueR0auTZ4=; b=N+0hH+Tm2vN6ZwOyAZxFxfJYLw
 qJ67DaxfwhGlqzqOlL0R5rlsLwXUUf8eku7xzKjEkUs+jCkO+UdipB+49kE800nHTA/iBCMh6bGdd
 G9dRj5Qpaz2obir/9xWjqbxuiMyr+v27TY6TWRa6L4fequ6mejh717e/mHxoSNqa7h8I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UJhcIChyQ2GOu70fB3AQEEo9cS+cYeR56tueR0auTZ4=; b=eKxfbljYHgJJhk7anh1RR5KJ9y
 p2l4SgoOaB7mFf1DwHtchhmMlS+urWoacvDE2dPyZ68UW7yzY+sV6pmf4uYreRTee0zNmu6mw+CbZ
 IWlvq1j7H7OwDVsGpAbAPaW2ZYArxI2pYlLOfHDwcgyQhyrNwzy5LS22zQOlsPGvRITk=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rTckl-0000od-0D for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Jan 2024 07:05:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 79264CE3108;
 Sat, 27 Jan 2024 07:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C19C433C7;
 Sat, 27 Jan 2024 07:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706339108;
 bh=ForPykU7IwFx2c1CLmNnFixuMgi+ep01OHJkD8/dsQY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZMIGHA/jRSUgkbd3OAZWX3lax3BmYcyT1+dqFBKGmWyJ3k79Zl7yA74B8UwxNbDC3
 VoQvGbhhzKfhyPh5i+IqL0LUFCFVSiHIGlK+9MvFcps05gPX9KnhhpqX+jadG9Sgz0
 +Hjbwv7JhuqRmsFgIYxdWvkb4QNAkrKQa6F3nRj8nAm8WABWS/yS41Vho3Y0VBWAmf
 r0L1J6LnOsN2lhW0PTYfi/X3T5cWc+M1utSPGC03PJAa9FNL6wl59gxWWPrq6j4kQD
 5zlB91Qwa/RRdv7WqEX5damNjqiaznV9ii9d/wbBFtHBhXXQSENVdWtDS+7CKmWo2O
 9Qk3l5TBid1aw==
Date: Fri, 26 Jan 2024 23:05:06 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <20240127070506.GC11935@sol.localdomain>
References: <Y4ZaBd1r45waieQs@casper.infradead.org>
 <20221130124804.79845-1-frank.li@vivo.com>
 <Y4d0UReDb+EmUJOz@casper.infradead.org>
 <Y5D8wYGpp/95ShTV@bombadil.infradead.org>
 <ZbLI63UHBErD6_L2@casper.infradead.org>
 <ZbLKl25vxw0eTzGE@bombadil.infradead.org>
 <ZbQdkiwEs8o4h807@casper.infradead.org>
 <ZbQk1WqGgwgoMbg3@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZbQk1WqGgwgoMbg3@bombadil.infradead.org>
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 26, 2024 at 01:32:05PM -0800, Luis Chamberlain
 wrote: > On Fri, Jan 26, 2024 at 09:01:06PM +0000, Matthew Wilcox wrote:
 > > On Thu, Jan 25, 2024 at 12:54:47PM -0800, Luis Chamberlain wrote [...]
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rTckl-0000od-0D
Subject: Re: [f2fs-dev] [PATCH] f2fs: Support enhanced hot/cold data
 separation for f2fs
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
Cc: Pankaj Raghav <p.raghav@samsung.com>, Yangtao Li <frank.li@vivo.com>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, vishal.moola@gmail.com,
 linux-mm@kvack.org, Adam Manzanares <a.manzanares@samsung.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-fsdevel@vger.kernel.org,
 Javier =?iso-8859-1?Q?Gonz=E1lez?= <javier.gonz@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 26, 2024 at 01:32:05PM -0800, Luis Chamberlain wrote:
> On Fri, Jan 26, 2024 at 09:01:06PM +0000, Matthew Wilcox wrote:
> > On Thu, Jan 25, 2024 at 12:54:47PM -0800, Luis Chamberlain wrote:
> > > On Thu, Jan 25, 2024 at 08:47:39PM +0000, Matthew Wilcox wrote:
> > > > On Wed, Dec 07, 2022 at 12:51:13PM -0800, Luis Chamberlain wrote:
> > > > > Me and Pankaj are very interested in helping on this front. And so we'll
> > > > > start to organize and talk every week about this to see what is missing.
> > > > > First order of business however will be testing so we'll have to
> > > > > establish a public baseline to ensure we don't regress. For this we intend
> > > > > on using kdevops so that'll be done first.
> > > > > 
> > > > > If folks have patches they want to test in consideration for folio /
> > > > > iomap enhancements feel free to Cc us :)
> > > > > 
> > > > > After we establish a baseline we can move forward with taking on tasks
> > > > > which will help with this conversion.
> > > > 
> > > > So ... it's been a year.  How is this project coming along?  There
> > > > weren't a lot of commits to f2fs in 2023 that were folio related.
> > > 
> > > The review at LSFMM revealed iomap based filesystems were the priority
> > > and so that has been the priority. Once we tackle that and get XFS
> > > support we can revisit which next fs to help out with. Testing has been
> > > a *huge* part of our endeavor, and naturally getting XFS patches up to
> > > what is required has just taken a bit more time. But you can expect
> > > patches for that within a month or so.
> > 
> > Is anyone working on the iomap conversion for f2fs?
> 
> It already has been done for direct IO by Eric as per commit a1e09b03e6f5
> ("f2fs: use iomap for direct I/O"), not clear to me if anyone is working
> on buffered-io. Then f2fs_commit_super() seems to be the last buffer-head
> user, and its not clear what the replacement could be yet.
> 
> Jaegeuk, Eric, have you guys considered this?
> 

Sure, I've *considered* that, along with other requested filesystem
modernization projects such as converting f2fs to use the new mount API and
finishing ext4's conversion to iomap.  But, I haven't had time to work on these
projects, nor to get very involved in f2fs beyond what's needed to maintain the
fscrypt and fsverity support.  I'm not anywhere close to a full-time filesystem
developer.  I did implement the f2fs iomap direct I/O support two years ago
because it made the fscrypt direct I/O support easier.  Note that these types of
changes are fairly disruptive, and there were bugs that resulted from my
patches, despite my best efforts.  It's necessary for someone to get deeply
involved in these types of changes and follow them all the way through.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
