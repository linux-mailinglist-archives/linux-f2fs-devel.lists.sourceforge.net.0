Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 814671EF0BE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Jun 2020 06:56:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jh4Oz-0007HU-72; Fri, 05 Jun 2020 04:56:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jh4Ox-0007HN-DL
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jun 2020 04:56:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O135w+l2+ML7bQSkL/ropNTe6TCdzIn/YZYkolgIAqQ=; b=F9GBHovDlV405gflNU3RpC2+ij
 37UDhMH4/yEGGcty4zftcB2cr1ghKmQbuvVfbt9MHmuUKNcQVLrD0rKkfSErmNiGUQGnkhy2bNwwl
 ZVmQY+bMkAPK/Ntu04tEQ9M0/8PrgYOZcPtzOthy38DYUfaBFpnQHwsSKDzfG7XSc8e0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O135w+l2+ML7bQSkL/ropNTe6TCdzIn/YZYkolgIAqQ=; b=MDqecUkHhYrHlex0/OIzDJkgSG
 F5FxQ90J2i0XXmL1fYSDgKMsFL/MepDmdff8ZaMbO5/mScv+TfgN9XjhUPNXZmooGq0dXgDceiNm0
 14bkOsu/mB04pkMQV+HRWfNAqyf4JerNKl8DNoCwB/aAMo9o1j75qBX+UVQW4odF9BnA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jh4Or-009QZ8-EV
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jun 2020 04:56:19 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F2600207F7;
 Fri,  5 Jun 2020 04:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591332968;
 bh=UPjglgD5SOqBjhMbowpW8Cz2Kx0NPk/iV8V3YF9t36s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uXpABeKRp7RNY6WaAVgA7A7YkBM3hFe94WzoUYKr3hU8wYoWFjrykz05zdVM94rom
 dF17Nk20fAsVzZRI60iSUYVyeecFhjdI167GENvgeqmfbSOMzy5jE8sZGwMkyYFXsV
 kpBcQ6LobhAluc7MFXgyE/F90srm+C02dBrlLmNY=
Date: Thu, 4 Jun 2020 21:56:06 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20200605045606.GR2667@sol.localdomain>
References: <20200505204823.211214-1-ebiggers@kernel.org>
 <20200518180648.GB218254@google.com>
 <20200518183542.GA121709@gmail.com>
 <20200518191016.GA182581@google.com>
 <20200604210646.GA855@sol.localdomain>
 <20200605011535.GA102178@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200605011535.GA102178@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jh4Or-009QZ8-EV
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't return vmalloc() memory from
 f2fs_kmalloc()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 04, 2020 at 06:15:35PM -0700, Jaegeuk Kim wrote:
> > 
> > I went through every remaining caller of f2fs_kmalloc() and f2fs_kzalloc().  I
> > think we're fine, except for possibly the allocation of blkz_seq in
> > init_blkz_info().  How many zones can we expect on a zoned block device?
> 
> In the worst case, it can be 16TB / 2MB = 8M entries.

In that case, I'll make init_blkz_info() use f2fs_kvzalloc() too.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
