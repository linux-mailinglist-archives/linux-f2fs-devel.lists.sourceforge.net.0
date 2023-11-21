Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7707F251A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Nov 2023 06:12:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r5J3v-0000PG-7z;
	Tue, 21 Nov 2023 05:12:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1r5J3u-0000P9-J4
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Nov 2023 05:12:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6uSNTF4gBA2mBMIlInFqz++irtP7bRP60ummCQhH030=; b=nFw6Jxjs0646NHIoA5x2bo3AF1
 t7h/PXIbDHKY1tIHpG1JxLNSW3MKSR9AP9pzn9j1INIbAz3ShSihRDJ54KaaLpBx/g9o7/6FQ8O8o
 WLF9bSulF4OImijBIHmldctqBjSnrKcYokmEpDMhY1MmB3u1Bf58BRYEIiMchp7lHaZM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6uSNTF4gBA2mBMIlInFqz++irtP7bRP60ummCQhH030=; b=b2CkeDM6HXwOBnBmFTa3YqdKa5
 SsWuVIzPrY2QeYyf3TC8vPwJc7GWPQpF8kzuQCWLr7WH8RxymquRXD5akw+KQFREEbz0NvSpjfnQA
 VJ1A/BOBMEIdc1iifsAmjUdKMmiuYqHKqsD+zjt9p1s0mCmfutG6XtZ9t8jENkEVdKXc=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r5J3s-00084g-7w for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Nov 2023 05:12:38 +0000
Received: from cwcc.thunk.org (pool-173-48-82-21.bstnma.fios.verizon.net
 [173.48.82.21]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 3AL5CFRR025396
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Nov 2023 00:12:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1700543538; bh=6uSNTF4gBA2mBMIlInFqz++irtP7bRP60ummCQhH030=;
 h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
 b=Um42NUhanFatTa+1jqPuCLUYty2ATWUCBuWm8YpeFYYKfK5UUs0HKRpVD4imsmJNV
 x7JOR/FgtbjoZsfqxykX2b3XgR32OWQ5PINc9aUIuzmXLZG0Irnb0SYI51LeD9enjy
 UrJBL3wN0yyOoFm2B4ttvmgRnqk5rEp1xeJyacx0igObUTwOALdAuqQhgTJ1P8Qrqj
 qiG0W2d9z+yVrsAhmyEw3XAbftuTPO/mdMxN8aKpTkUi7/BKVT44zqjPRR7/5l8qUh
 GzZ87cv+wdd4RYxhZVvVE7MqT2Mr+yDtLALuqxJhLZroOVEeSrg7ZGMd1hiECK7acM
 Uanm2L3MmZy/A==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 2024415C02B0; Tue, 21 Nov 2023 00:12:15 -0500 (EST)
Date: Tue, 21 Nov 2023 00:12:15 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20231121051215.GA335601@mit.edu>
References: <20230816050803.15660-1-krisman@suse.de>
 <20231025-selektiert-leibarzt-5d0070d85d93@brauner>
 <655a9634.630a0220.d50d7.5063SMTPIN_ADDED_BROKEN@mx.google.com>
 <20231120-nihilismus-verehren-f2b932b799e0@brauner>
 <CAHk-=whTCWwfmSzv3uVLN286_WZ6coN-GNw=4DWja7NZzp5ytg@mail.gmail.com>
 <20231121020254.GB291888@mit.edu>
 <CAHk-=whb80quGmmgVcsq51cXw9dQ9EfNMi9otL9eh34jVZaD2g@mail.gmail.com>
 <CAHk-=wh+o0Zkzn=mtF6nB1b-EEcod-y4+ZWtAe7=Mi1v7RjUpg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wh+o0Zkzn=mtF6nB1b-EEcod-y4+ZWtAe7=Mi1v7RjUpg@mail.gmail.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 20, 2023 at 07:03:13PM -0800,
 Linus Torvalds wrote: > On Mon, 20 Nov 2023 at 18:29,
 Linus Torvalds > <torvalds@linux-foundation.org>
 wrote: > > > > It's a bit complicated, yes. But no, doi [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [18.9.28.11 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r5J3s-00084g-7w
Subject: Re: [f2fs-dev] [PATCH v6 0/9] Support negative dentries on
 case-insensitive ext4 and f2fs
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
Cc: Gabriel Krisman Bertazi <krisman@suse.de>,
 Christian Brauner <brauner@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 ebiggers@kernel.org, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 20, 2023 at 07:03:13PM -0800, Linus Torvalds wrote:
> On Mon, 20 Nov 2023 at 18:29, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > It's a bit complicated, yes. But no, doing things one unicode
> > character at a time is just bad bad bad.
> 
> Put another way: the _point_ of UTF-8 is that ASCII is still ASCII.
> It's literally why UTF-8 doesn't suck.
> 
> So you can still compare ASCII strings as-is.
> 
> No, that doesn't help people who are really using other locales, and
> are actively using complicated characters.
> 
> But it very much does mean that you can compare "Bad" and "bad" and
> never ever look at any unicode translation ever.

Yeah, agreed, that would be a nice optimization.  However, in the
unfortunate case where (a) it's non-ASCII, and (b) the input string is
non-normalized and/or differs in case, we end up scanning some portion
of the two strings twice; once doing the strcmp, and once doing the
Unicode slow path.

That being said, given that even in the case where we're dealing with
non-ASCII strings, in the fairly common case where the program is
doing a readdir() followed by a open() or stat(), the filename will be
byte-identical and so a strcmp() will suffice.

So I agree that it's a nice optimization.  It'd be interesting how
much such an optimization would actually show up in various
benchmarks.  It'd have to be something that was really metadata-heavy,
or else the filenamea lookups would get drowned out.

   	    	      	      	    	- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
