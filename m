Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7832521AE09
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2020 06:25:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtkbF-0002xB-P8; Fri, 10 Jul 2020 04:25:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jtkbE-0002x4-Fq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 04:25:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vg61HQiWdysQZ3KV1R3C5yzvZbuBX27naJIvDrdBW68=; b=ixKgECjdw28xIBkb/MFjWdzULL
 jJUZ/DeYpEd2jc24R74WooM6P1QuZ2k+jhOmDDNdhP9GOVhJSYOcM4kTcDrFDvldc2VMlDn0nfTEc
 ovlIWy5k6oZ22CP/ixpswFbCfsyugo5vjOkaT+aLlID1hEnPRnwER/5GAAYrQTpiW3rU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Vg61HQiWdysQZ3KV1R3C5yzvZbuBX27naJIvDrdBW68=; b=NBBhaHfodyXJ8VfC+PcIMhBlP6
 FJum9cRQfYb1coUe5eK5YT2g8KctxH9GsTboJRgbTKnrlyoWpINQtjJmzd+qc0C6UHaGio2Dd4+Tp
 AcX26h45GQpGXliwYPqhqqsYdKskdgIAEtkVenEVt6Izk1/wd9ZDJ/zvl3+aZk+5t7kg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jtkb5-00Fqaj-AW
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 04:25:24 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF4B12065F;
 Fri, 10 Jul 2020 04:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594355102;
 bh=tItDrONPBRZOV6/5pZezCVdiuHa+wnbdAjHG9PYwyS4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nx7p4ECX+lRZpi5t20WM/dU+Uu9JmJAhYCvWI/UkjC9JptX5GPNrbT7zUFBDWlnDs
 zx8tYbPNL17+uYhePD1UB1gN2C3+nnFKhTYrCpb6umz0GUVmjkVBND6xUY92aDUa8Z
 hYyNjLJcHNMiBeWykn7NE0zdmZAb9zUsCtswgcMw=
Date: Thu, 9 Jul 2020 21:25:02 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: lampahome <pahome.chen@mirlab.org>
Message-ID: <20200710042502.GJ545837@google.com>
References: <CAB3eZftzcywNU-cf7mRWqtj-74VqgzLHC32a6v_CycVcRsiu0A@mail.gmail.com>
 <20200710034114.GG545837@google.com>
 <CAB3eZfv5k7cwFzMAOda7+cgHJzatRRhwyEg-8U9yt8TZ5s0=ww@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAB3eZfv5k7cwFzMAOda7+cgHJzatRRhwyEg-8U9yt8TZ5s0=ww@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtkb5-00Fqaj-AW
Subject: Re: [f2fs-dev] possible to allocate a full segment for a direct IO
 with blocksize 2MB?
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

On 07/10, lampahome wrote:
> > How about using file pinning?
> 
> I mean if IO blocksize or file size is multiple times of segment size
> e.g. segment size = 2MB, and directIO blocksize is always 2MB.
> I hope the 512 sub-blocks(4K blocksize) of each directIO will be in the
> same segment.
> 
> e.g.  segment size = 2MB, I want to create a 2MB file.
> I hope the 512 sub-blocks(4K blocksize) will be in the same segment.
> 
> PIN file before fallocate will let allocated blocks in a whole full
> segment?
> Doc only wrote:
> 
> > However, once F2FS receives ioctl(fd, F2FS_IOC_SET_PIN_FILE) in prior to
> > fallocate(fd, DEFAULT_MODE), it allocates on-disk blocks addressess having
> > zero or random data.

Previously, fallocate doesn't allocate block addressess, but pinned file allows
to allocate them aligned to 2MB-sized segment.

> 
> 
> Or do I misunderstand?
> 
> thanks


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
