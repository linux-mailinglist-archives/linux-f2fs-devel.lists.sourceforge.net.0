Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 326E43D6743
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jul 2021 21:04:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m85uB-0006In-Il; Mon, 26 Jul 2021 19:04:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1m85uA-0006Ih-RK
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Jul 2021 19:04:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XyXEnJieNGh/lesiIeroy7vT5KLcMn16qaH4WUkIdx0=; b=Mw6t0dGmzQeFJNwS3Tqnvfw1aF
 kJDHgVfbi1SqmNlRjkzQU3CwZe/8iawHE6A9VKQR8XKjhMugd+SMpmQrKlL3uB4uha6yaucVFpYS9
 0q6o9uptMe+FO6KhW89Cq+5xrZiuv11NCHdWInr+qVk4GuMf0vae7W3HQRS0SVISAOeU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XyXEnJieNGh/lesiIeroy7vT5KLcMn16qaH4WUkIdx0=; b=TS4lCpkwQedk23+bydt9U+Gex5
 UaYQkpCrApv7bkgZyiplggyFz6vBciolQZhYXvO3yHKKPnaRrdv0GiGWnrAfyDoqi1NwMBNSgyjv4
 wJSdMZ3WZ7PyYJj7WMTtsguKEk9bvgyzzRWQM0mR5anFIipyMvBPtXIVMG3syetVb0lA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m85u0-003Px6-Ob
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Jul 2021 19:04:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C2EE60F5D;
 Mon, 26 Jul 2021 19:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627326266;
 bh=kzsXWrwCi9RWE6Q9bwL1m2kT7wU3EGNRLs3PcijJLeQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p+2KgCyWvbGQIoSDUecB02vvD07XptxRslfwV63L3kKSv0UrbN5oB2xrHAZKdwje7
 WrfowmN1LQaJT+GLZbz4myvuFjQmlNiqvR6SLHKMilU+z2X3fXBJceOqDY55xnjyVx
 6JSCHDc/r9fPie1T6IBnvZcrT3rxzo2rEI7/8kbSky6joTs5gdI3wkMvAc576R/gv2
 47FdGxFnsLzaYoMWpKH/2aFWXJeMxexBkmlW+qn0W7EOI5scsJVneQN2V/CALfbBYj
 H+bawPsyfh+2vyp9Vdweh+ACtV6CAs+TsTg8ou6MqH7gl9LK+YGcGovesWN9Cip0Mi
 Mfg2FcfH2CnfQ==
Date: Mon, 26 Jul 2021 12:04:24 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YP8HOOkA0wlyMYMf@google.com>
References: <20210716143919.44373-1-ebiggers@kernel.org>
 <20210716143919.44373-4-ebiggers@kernel.org>
 <YP2Ew57ptGgYsD1Y@google.com> <YP2Hp5RcZfhKipfG@google.com>
 <YP2m7lSqvenvxYIY@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YP2m7lSqvenvxYIY@sol.localdomain>
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m85u0-003Px6-Ob
Subject: Re: [f2fs-dev] [PATCH 3/9] f2fs: rework write preallocations
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
Cc: Satya Tangirala <satyaprateek2357@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 Changheun Lee <nanich.lee@samsung.com>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/25, Eric Biggers wrote:
> On Sun, Jul 25, 2021 at 08:47:51AM -0700, Jaegeuk Kim wrote:
> > On 07/25, Jaegeuk Kim wrote:
> > > Note that, this patch is failing generic/250.
> > 
> > correction: it's failing in 4.14 and 4.19 after simple cherry-pick, but
> > giving no failure on 5.4, 5.10, and mainline.
> > 
> 
> For me, generic/250 fails on both mainline and f2fs/dev without my changes.
> So it isn't a regression.

fyi; I had to change 250 to pass like this. I'm digging the patch.
https://github.com/jaegeuk/xfstests-f2fs/commit/99c11b6550a2a24f831018d2e019eed86e517d44.

> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
