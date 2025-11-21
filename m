Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A586AC7B978
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Nov 2025 20:52:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MxF59WmVC94ekHWWfmOvhaVMM4faP7EzRMfmAqFTuMg=; b=JEFZA1wZWbLpI8zalozEc3LkYW
	IZ0np494b3qRVHXGc8QROHtctyOCfxg885oUMjy3dP0yYPz+lu+kcYNeyfzhuGJtaNjkMUR1EpQO5
	E/uWfPKPjj41tjd22LQjZYZPQ9V1zxLHQ8I7JUvtI+lyOYBfaKVmVxCnXI8FVjeY8rrY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vMXB2-0004qi-MC;
	Fri, 21 Nov 2025 19:52:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vMXB1-0004qb-IO
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 19:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P/rZyNC4jIKdyCIN0gURHOpJAFoyFBeumXWclaPygqA=; b=HbKWg2dF1ZFeYpPVb/CdAiYUKe
 z7aaQsyFoHd8UhBuJ2Y8OnvmJAC+bDnFlbuIx4C1MKxGDthCd6PGhzzhk6fKQeQujnDtsgrdGyE0Q
 IGEdo0mMZAUdWWI4aWcwVsfID5Z8Mk3HHVCtBJa8krP0HZUvZVopH+yLeTvICUPegJsY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P/rZyNC4jIKdyCIN0gURHOpJAFoyFBeumXWclaPygqA=; b=SJYTF27DAOBwnFqDGrcd/xQeJt
 js2lID1/F5LtAxtQIUX1Mmp9OCH1lgsFzq4W9SNftWNg58ecFyOsQHTzKMrsSBLL+NN9GZyNM+VWT
 0PeNlrzTTmgikbCGS1XA4QFUvuXiV6FzPOTWJvKvymlkHitRcssGqsNGAjdmvYvN0KjA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vMXB1-0008Ri-5E for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 19:52:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 76D2C60145;
 Fri, 21 Nov 2025 19:52:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6357C4CEF1;
 Fri, 21 Nov 2025 19:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763754724;
 bh=xfWX1MWedHrZ+OmxiBiUepfssMh2KX6vp847cJtltI0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aubBZ50KhxASUsH9f7p2KYtdywmckKytFFSSMWN+M5kMVpFoQmf3P4Ll2z6Ii6ahD
 jG2YRwfA3fQkhEJbTys06AsOkQrHf74rUejklOCu09/ZdYUehGJjUhCqugC2yKWJSN
 r07RDzlrwhVteEJ4/URMg+cbxlywBcP2lQBX0HphCs1Rkkn6j9niIQzKe+qY8iJT1l
 xywqK7xYvLZj/JqUhjCAnmxcJADcEfFobBHy1Yl4dt0mLRE01rmnRjqjNm+WYFG7bV
 Wlhx0osTVfe080ht8Bgj+FbxpSeombfsqFW9P4kffbHMO1Z3sBoAvuKiqoS4HxlDdp
 NIX1jQ3UkAK4Q==
Date: Fri, 21 Nov 2025 19:52:02 +0000
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <aSDC4jlaKSaKgbvc@google.com>
References: <20251121032718.1993528-1-jaegeuk@kernel.org>
 <aR_pCGtcc7ASeA77@casper.infradead.org>
 <aR_ultJzXh1rmOKs@google.com>
 <aSB25FFkLaJkbVfT@casper.infradead.org>
 <aSCpKx9ITAJfoSlw@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aSCpKx9ITAJfoSlw@google.com>
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/21, Jaegeuk Kim wrote: > On 11/21,
 Matthew Wilcox wrote:
 > > On Fri, Nov 21, 2025 at 04:46:14AM +0000, Jaegeuk Kim wrote: > > > On
 11/21, Matthew Wilcox wrote: > > > > On Fri, Nov 21, 2025 at 03 [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [172.105.4.254 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vMXB1-0008Ri-5E
Subject: Re: [f2fs-dev] [PATCH] [RFC] mm/fadvise: introduce POSIX_FADV_MLOCK
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/21, Jaegeuk Kim wrote:
> On 11/21, Matthew Wilcox wrote:
> > On Fri, Nov 21, 2025 at 04:46:14AM +0000, Jaegeuk Kim wrote:
> > > On 11/21, Matthew Wilcox wrote:
> > > > On Fri, Nov 21, 2025 at 03:27:18AM +0000, Jaegeuk Kim wrote:
> > > > > This patch introduces a new POSIX_FADV_MLOCK which 1) invalidates the range of
> > > > > cached pages, 2) sets the mapping as inaccessible, 3) POSIX_FADV_WILLNEED loads
> > > > > pages directly to the inaccessible mapping.
> > > > 
> > > > ... what?
> > > > 
> > > > This seems like something which is completely different from mlock().
> > > > So it needs a different name.
> > > > 
> > > > But I don't understand the point of this, whatever it's called.  Need
> > > > more information.
> > > 
> > > So, the sequence that I'd like to optimize is mmap(MAP_POPULATE) followed
> > > by  mlock(). For example, mmap() takes 1 second to load 4GB data, and mlock()
> > > takes 330ms additionally in order to migrate all the pages into inaccessible
> > > map, IIUC.
> > 
> > Oh, so the MLOCK part is right, but the inaccessible() part is wrong.
> > Inaccessible is special weird guest_memfd crap that has all kinds of
> > side-effects that you don't want.
> > 
> > Wouldn't you get the same effect by calling mlock2(MLOCK_ONFAULT) and
> > then calling readahead() for the desired range?
> 
> Oh, thank you. Let me try.

After checking the code and experiment, I don't think that gives what we need.
That flag skips populate_vma_page_range only, but we need to allocate pages
in the inaccessible mapping and fill the pages afterwards.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
