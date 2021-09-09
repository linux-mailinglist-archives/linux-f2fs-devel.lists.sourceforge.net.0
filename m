Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B3640456E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Sep 2021 08:09:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mODFO-0002CJ-AR; Thu, 09 Sep 2021 06:09:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <gregkh@linuxfoundation.org>) id 1mODFL-0002C7-5G
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Sep 2021 06:09:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sWfRyjZXmyfJRMfMpmgdpGcsCK6wIFsAnM4M9HGEZ3U=; b=eXgSMuCxRyEwmdJlDc2/hzZzcE
 iOVV4vlVaPfq+tlurU44zZ3SSgEqnQekw5B9Jj+PbeLtwshr9BEtILa+p/rI7P1ESHG7Hc2mvquCz
 Y/dw0XCVf3rim9SzYBA70+gG0ubjMUth3yTY0MKsVvtC7GqpFuLMhEQ569hOFrpfh2SM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sWfRyjZXmyfJRMfMpmgdpGcsCK6wIFsAnM4M9HGEZ3U=; b=O+togVcEkdbRG45uuG2MXxbgIv
 32V/7B/T54+iuCTnmQAlSiwoaYu8PChFldqd74gWD/aDYIy3PXASR2YouarxRDR30OliONzPUMGoB
 wJyNjSo8GAtSJzaPs3dbkhiVblYFlGKLrJWmD7fgq2/D98NowrNtE7D5b1VwUC3+bGyc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mODFK-00086E-KZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Sep 2021 06:09:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FA5561176;
 Thu,  9 Sep 2021 06:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1631167747;
 bh=yvjgmxybSsnsnCQKpzwUQ53dsvC/6l4aZ3Bu0jatUPw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jkKNBXgL9g++cwgdNYvdwxLOLZokkzBbwl7Xz+tGjFCH4Zrho3tAAv7odaajips+6
 6bvPEorNDfM7OtaO8RiQn2IsMGY5+QOuoAL37ym2If4brKTZev/1N/pj163XMCsH+V
 QhPq1Qd+r6aOhMGFZCDrW1EvAhjVz6dUqYtq1j0E=
Date: Thu, 9 Sep 2021 08:09:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <YTmlAWm7g4NyM/rG@kroah.com>
References: <20210908220020.599899-1-jaegeuk@google.com>
 <YTmaPCd3/cpMyNEe@kroah.com> <YTmbhc7J5ZdVp3vI@google.com>
 <YTmcbNMRaPzQRqmf@kroah.com> <YTme3altl3q5lc8N@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YTme3altl3q5lc8N@google.com>
X-Spam-Score: -6.2 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 @@CONTACT_ADDRESS@@ for details.
 Content preview:  On Wed, Sep 08, 2021 at 10:42:53PM -0700, Jaegeuk Kim wrote:
 > On 09/09, Greg KH wrote: > > On Wed, Sep 08, 2021 at 10:28:37PM -0700,
 Jaegeuk Kim wrote: > > > On 09/09, Greg KH wrote: > > > > On Wed, [...] 
 Content analysis details:   (-6.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linuxfoundation.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1mODFK-00086E-KZ
Subject: Re: [f2fs-dev] [PATCH] f2fs: guarantee to write dirty data when
 enabling checkpoint back
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
Cc: stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Sep 08, 2021 at 10:42:53PM -0700, Jaegeuk Kim wrote:
> On 09/09, Greg KH wrote:
> > On Wed, Sep 08, 2021 at 10:28:37PM -0700, Jaegeuk Kim wrote:
> > > On 09/09, Greg KH wrote:
> > > > On Wed, Sep 08, 2021 at 03:00:20PM -0700, Jaegeuk Kim wrote:
> > > > > From: Jaegeuk Kim <jaegeuk@kernel.org>
> > > > > 
> > > > > commit dddd3d65293a52c2c3850c19b1e5115712e534d8 upstream.
> > > > > 
> > > > > We must flush all the dirty data when enabling checkpoint back. Let's guarantee
> > > > > that first by adding a retry logic on sync_inodes_sb(). In addition to that,
> > > > > this patch adds to flush data in fsync when checkpoint is disabled, which can
> > > > > mitigate the sync_inodes_sb() failures in advance.
> > > > > 
> > > > > Reviewed-by: Chao Yu <chao@kernel.org>
> > > > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > > > ---
> > > > >  fs/f2fs/file.c  |  5 ++---
> > > > >  fs/f2fs/super.c | 11 ++++++++++-
> > > > >  2 files changed, 12 insertions(+), 4 deletions(-)
> > > > 
> > > > What stable kernel(s) are you wanting to have this backported to?
> > > 
> > > 5.10 please.
> > 
> > Why would you want to skip 5.14.y and 5.13.y?  You never want anyone to
> > upgrade stable kernel releases and have a regression.
> 
> I was just looking at the essential kernel version, since the fix is only
> related to checkpoint=disable feature used in android only. Feel free to
> merge it into any stable kernels if you want.

No regressions for any stable releases is key here, Android is just one
user of the kernel...

And in the future, just put a cc: stable in the signed-off-by area when
you submit the patch and it will be handled automatically, like the
documentation states :)

thanks,

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
