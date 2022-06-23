Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3EB558268
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jun 2022 19:14:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o4QOx-0002wM-LH; Thu, 23 Jun 2022 17:13:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1o4QOx-0002wG-5R
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jun 2022 17:13:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1ETc9dlt7qvY3W/o1+oMFXzB90afGcGB/u+rWZvbSdw=; b=YwSZvYZQPJpK9p1XrcG6SaC9Rt
 XPr9tDoe3LKdMv3svyQnY8gEkzcqAgzK4L7zYVbaKRyhe8cyHTxSbfK22NEtCWkiQ9BPGDtMQZnZL
 u9hBD9ClqGaqyTDDqJC96G13Y9t91RDg46y/axNrHQNo2d1YufQWtNrSOG5bL6n3sJuE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1ETc9dlt7qvY3W/o1+oMFXzB90afGcGB/u+rWZvbSdw=; b=ik8TZ/7ZKM+E9mAfnZnILqxgUr
 QfeDbKt9KR3gyVWfYdq77YK9rr5qAJ0zn96zAmrXl1jxbuDX/fW+/an1Ook0I9/dZxWTxbai/W8zP
 5z0Zmgony678he0qaDbbmDhpmMRnUOIauCdEonVhvnueqaNLx9mDlADCy2BSCkedkis4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o4QOs-0003Cu-09
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jun 2022 17:13:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 905DB61D18;
 Thu, 23 Jun 2022 17:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00482C3411B;
 Thu, 23 Jun 2022 17:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656004416;
 bh=rMClqc3zvDXfYMCOvdBp6CeRJmIcRkGT8/7yt5f5Kj4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hy8Xfb3CaW83gPTXBez87TKF6HsLY6Vgm+L3dfAfuvodGOX+OUOmbQ/Ghk1w6n2+M
 2DV+2gMkStrDZHG0tUAgHCir1JmtSae//xHrbJSV2gG+wwa4uN1WE2Ew04+yShP6x+
 Wo8Q7FH6WA50N/wiz6O1C6ye8ptPWUlTYD6uObRVS2xQ/Ze/MF5VWCHOxq6jfKo6l0
 mCqmrUBFwatWgjD3iv0rzwXH1Z/HLaoZYGH27u8U6kOqNS9YP0NtGaBshrq51xY8/4
 F7Nj+Vat3OIy1SzwGsAmMrhnN50t3L35HZyEIHe3J5ItFl3WXqp5QqxgJxdZ26l/2R
 70TYqohWcia9w==
Date: Thu, 23 Jun 2022 10:13:34 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Andreas Dilger <adilger@dilger.ca>
Message-ID: <YrSfPmaWCTOfmQ8H@sol.localdomain>
References: <20220616202141.125079-1-ebiggers@kernel.org>
 <YrSOm2murB4Bc1RQ@magnolia>
 <622BA3BB-03EA-4271-8A2E-2ADAFB574155@dilger.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <622BA3BB-03EA-4271-8A2E-2ADAFB574155@dilger.ca>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jun 23, 2022 at 10:27:19AM -0600,
 Andreas Dilger wrote:
 > On Jun 23, 2022, at 10:02 AM, Darrick J. Wong <djwong@kernel.org> wrote:
 > > > > On Thu, Jun 16, 2022 at 01:21:41PM -0700, Eric Bigger [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o4QOs-0003Cu-09
Subject: Re: [f2fs-dev] [man-pages RFC PATCH] statx.2,
 open.2: document STATX_DIOALIGN
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
Cc: linux-man@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org,
 linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 23, 2022 at 10:27:19AM -0600, Andreas Dilger wrote:
> On Jun 23, 2022, at 10:02 AM, Darrick J. Wong <djwong@kernel.org> wrote:
> > 
> > On Thu, Jun 16, 2022 at 01:21:41PM -0700, Eric Biggers wrote:
> >> From: Eric Biggers <ebiggers@google.com>
> >> 
> >> @@ -244,8 +249,11 @@ STATX_SIZE	Want stx_size
> >> STATX_BLOCKS	Want stx_blocks
> >> STATX_BASIC_STATS	[All of the above]
> >> STATX_BTIME	Want stx_btime
> >> +STATX_ALL	The same as STATX_BASIC_STATS | STATX_BTIME.
> >> +         	This is deprecated and should not be used.
> > 
> > STATX_ALL is deprecated??  I was under the impression that _ALL meant
> > all the known bits for that kernel release, but...
> 
> For userspace STATX_ALL doesn't make sense, and it isn't used by the kernel.
> 
> Firstly, that would be a compile-time value for an application, so it
> may be incorrect for the kernel the code is actually run on (either too
> many or too few bits could be set).
> 
> Secondly, it isn't really useful for an app to request "all attributes"
> if it doesn't know what they all mean, as that potentially adds useless
> overhead.  Better for it to explicitly request the attributes that it
> needs.  If that is fewer than the kernel could return it is irrelevant,
> since the app would ignore them anyway.
> 
> The kernel will already ignore and mask attributes that *it* doesn't
> understand, so requesting more is fine and STATX_ALL doesn't help this.
> 

What Andreas said.  Note, this discussion really should be happening on my
standalone patch that fixes the documentation for STATX_ALL:
https://lore.kernel.org/r/20220614034459.79889-1-ebiggers@kernel.org.  I folded
it into this RFC one only so that it applies cleanly without a prerequisite.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
