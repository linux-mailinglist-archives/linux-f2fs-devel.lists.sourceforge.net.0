Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A2C83E3FB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jan 2024 22:32:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rTToB-0007Iq-F0;
	Fri, 26 Jan 2024 21:32:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mcgrof@infradead.org>) id 1rTToA-0007Ik-9d
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jan 2024 21:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wP2xVl8JLp8XOMebTnhcra6qLaj2U02CkDsznEmwziE=; b=hJDO67JlwOru5/by9yXNoR/yFI
 w8dyjjEylUE0sesJVQFveaISFpHMXCb1fab3Eyv++AXqmuq87PGmmsR12yU2gN6k7FUb04NPhqUR/
 1kuloxPs5rzqFovTu5DZafLl4+3OHec/+lQn+M6gRzLXKJe4ylws4UlOQnKmYnfCkmto=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wP2xVl8JLp8XOMebTnhcra6qLaj2U02CkDsznEmwziE=; b=Ilz1fTburcsD1/HbXgZg4yUcjz
 q8qN+woDIQC9v29RaqX6TfqegWedzP2B1YWXk0lrEpyjowAxdnZRZoiDzZkr8aVaCLNMCOaBg4y4Q
 tXGjFJErvBZYAYuj9TB7OnmJOLZnw6ucn8BA4Y8E1j8Cs8fJQM4ACptAwRiNC4ML+aNY=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rTTo6-0005ZK-Rk for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jan 2024 21:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=wP2xVl8JLp8XOMebTnhcra6qLaj2U02CkDsznEmwziE=; b=FGYM24Fn+Iz/x4NlIX2hTy5y5U
 H0auvnkk5HhfbmBVyRp0C+FfOq4dPgI3F5Os6p1JDSkEKZrwwSLQkEVQXY1WVKNQ8krGfhCMj9sH3
 4eFvZ0/ZWQdg5jN0WKLY5t+OKTIFjMccd5933cX34wXREJP4KlaQx52Z3V9O+o4+Zygcvrl2AR1ct
 w4ZVz+F0dqIfJr3agbnE3KOp2Wm5Xq59t+zGVbOqkEDG9NqcW7dbLSamFoppg5LohKRfi2WqYlFmu
 tlYDHsGuZGfead2WwW/Op4vijp23jPraeuT6Hp6WE70EeIJB1cbeGCzSp1oWy8ViUw83uOSURLb2V
 Z95d7Dtg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2
 (Red Hat Linux)) id 1rTTnx-00000005TLG-3VbV;
 Fri, 26 Jan 2024 21:32:05 +0000
Date: Fri, 26 Jan 2024 13:32:05 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Wilcox <willy@infradead.org>,
	Eric Biggers <ebiggers@google.com>
Message-ID: <ZbQk1WqGgwgoMbg3@bombadil.infradead.org>
References: <Y4ZaBd1r45waieQs@casper.infradead.org>
 <20221130124804.79845-1-frank.li@vivo.com>
 <Y4d0UReDb+EmUJOz@casper.infradead.org>
 <Y5D8wYGpp/95ShTV@bombadil.infradead.org>
 <ZbLI63UHBErD6_L2@casper.infradead.org>
 <ZbLKl25vxw0eTzGE@bombadil.infradead.org>
 <ZbQdkiwEs8o4h807@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZbQdkiwEs8o4h807@casper.infradead.org>
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 26, 2024 at 09:01:06PM +0000,
 Matthew Wilcox wrote:
 > On Thu, Jan 25, 2024 at 12:54:47PM -0800, Luis Chamberlain wrote: > > On
 Thu, Jan 25, 2024 at 08:47:39PM +0000, Matthew Wilcox wrote: [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rTTo6-0005ZK-Rk
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
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 vishal.moola@gmail.com, linux-mm@kvack.org,
 Adam Manzanares <a.manzanares@samsung.com>,
 Javier =?iso-8859-1?Q?Gonz=E1lez?= <javier.gonz@samsung.com>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jan 26, 2024 at 09:01:06PM +0000, Matthew Wilcox wrote:
> On Thu, Jan 25, 2024 at 12:54:47PM -0800, Luis Chamberlain wrote:
> > On Thu, Jan 25, 2024 at 08:47:39PM +0000, Matthew Wilcox wrote:
> > > On Wed, Dec 07, 2022 at 12:51:13PM -0800, Luis Chamberlain wrote:
> > > > Me and Pankaj are very interested in helping on this front. And so we'll
> > > > start to organize and talk every week about this to see what is missing.
> > > > First order of business however will be testing so we'll have to
> > > > establish a public baseline to ensure we don't regress. For this we intend
> > > > on using kdevops so that'll be done first.
> > > > 
> > > > If folks have patches they want to test in consideration for folio /
> > > > iomap enhancements feel free to Cc us :)
> > > > 
> > > > After we establish a baseline we can move forward with taking on tasks
> > > > which will help with this conversion.
> > > 
> > > So ... it's been a year.  How is this project coming along?  There
> > > weren't a lot of commits to f2fs in 2023 that were folio related.
> > 
> > The review at LSFMM revealed iomap based filesystems were the priority
> > and so that has been the priority. Once we tackle that and get XFS
> > support we can revisit which next fs to help out with. Testing has been
> > a *huge* part of our endeavor, and naturally getting XFS patches up to
> > what is required has just taken a bit more time. But you can expect
> > patches for that within a month or so.
> 
> Is anyone working on the iomap conversion for f2fs?

It already has been done for direct IO by Eric as per commit a1e09b03e6f5
("f2fs: use iomap for direct I/O"), not clear to me if anyone is working
on buffered-io. Then f2fs_commit_super() seems to be the last buffer-head
user, and its not clear what the replacement could be yet.

Jaegeuk, Eric, have you guys considered this?

  Luis


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
