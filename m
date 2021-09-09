Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFC64044FB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Sep 2021 07:29:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mOCcL-00041N-Qk; Thu, 09 Sep 2021 05:28:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1mOCcA-00041E-5b
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Sep 2021 05:28:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U30ad2F+EtyUgYP04KMvAw0CSRRYDeqqgpNzyyPl4Ng=; b=lNyqlvPbpmt3FJx5ML0J52qkpS
 ISngy2qS1+F4XOGh5G8d7iWswihKvQsth/CpRklZRPJ2dT5TrDyTy4gaOIDP/NtxjODUVQQRSnFcS
 yT6mytJqORy+sxchCegX0rfmi+uoUwveH39qYVK20vBO7NA1/pIAOGt7H5XKfzBq0RD4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U30ad2F+EtyUgYP04KMvAw0CSRRYDeqqgpNzyyPl4Ng=; b=ZsbJhPB7iSF5/Z8ZnpKZXi6rCr
 ZFDwPZmsZmJHVzJ+1bpUM57TTKkN4a7Tq/NaS7v1YCUUXGeeGveIfkCdFQlXS2NUR6X84euzaVHPJ
 t+MIeBNgMmn96YSdX6oXrAeOU5yd8x4EV25eQTElDCZlcZKvcDz4xOZE1TeOu9Yvla60=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mOCc8-0005gv-SW
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Sep 2021 05:28:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F4D86103E;
 Thu,  9 Sep 2021 05:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631165319;
 bh=JBYEvUU/jP+Gm4/gW+xvo3rz5yQoWysX7uaXBTr4pOU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DvYIK5rnPz6Lk122E3ki56xeVkn56Gl7J8l3A0L+RTlke7pB0xQqudMDpkffCip1F
 4ssZhxrjsqKATZ9bM1/IgdaU2Mlg41EDV+bVlGop0l8gP3zPplrru/k3dJjRlEt1SW
 /Qq1kyVI6HfLegXQSyI2a9RvPidzj5Tx1mcBngb4Rb+dQhdXTruDKlohZc3b3TH5bM
 40mqTcRnixZ9wdXn7mDOZvdy1l2aANpqxcHTjYZxaXVlbjf6mSBH3qUwtihwaVAOul
 qsYKk/C4dkRVCtxP0B82mEL7jvXA8klbpva8PicE319KRyCXc1DDLzZsB7Rxgy+Uz7
 jfdhjhduYfCTQ==
Date: Wed, 8 Sep 2021 22:28:37 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <YTmbhc7J5ZdVp3vI@google.com>
References: <20210908220020.599899-1-jaegeuk@google.com>
 <YTmaPCd3/cpMyNEe@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YTmaPCd3/cpMyNEe@kroah.com>
X-Spam-Score: -6.2 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 @@CONTACT_ADDRESS@@ for details.
 Content preview:  On 09/09, Greg KH wrote: > On Wed, Sep 08, 2021 at 03:00:20PM
 -0700, Jaegeuk Kim wrote: > > From: Jaegeuk Kim <jaegeuk@kernel.org> > >
 > > commit dddd3d65293a52c2c3850c19b1e5115712e534d8 upstream. > > [...] 
 Content analysis details:   (-6.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
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
X-Headers-End: 1mOCc8-0005gv-SW
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

On 09/09, Greg KH wrote:
> On Wed, Sep 08, 2021 at 03:00:20PM -0700, Jaegeuk Kim wrote:
> > From: Jaegeuk Kim <jaegeuk@kernel.org>
> > 
> > commit dddd3d65293a52c2c3850c19b1e5115712e534d8 upstream.
> > 
> > We must flush all the dirty data when enabling checkpoint back. Let's guarantee
> > that first by adding a retry logic on sync_inodes_sb(). In addition to that,
> > this patch adds to flush data in fsync when checkpoint is disabled, which can
> > mitigate the sync_inodes_sb() failures in advance.
> > 
> > Reviewed-by: Chao Yu <chao@kernel.org>
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  fs/f2fs/file.c  |  5 ++---
> >  fs/f2fs/super.c | 11 ++++++++++-
> >  2 files changed, 12 insertions(+), 4 deletions(-)
> 
> What stable kernel(s) are you wanting to have this backported to?

5.10 please.

> 
> thanks,
> 
> greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
