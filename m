Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E59D26D713B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 02:25:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjqyA-0007cJ-14;
	Wed, 05 Apr 2023 00:25:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1pjqy9-0007cD-2U
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 00:25:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CiwVxtHqh7PtMKcIrbTly4vzLJ3BWefIHUj9tJBpUIs=; b=QduLzef8trv2dOAh9i/lPNIxsI
 rcg+cTPCeXxZk1BGsTJFpf68Z3xJCfa7wSvKG6B4+WCOEs/CJIh519LP2DeNAJcgMQVxl9/4ZZCHa
 UBPe5Dw/VcygpEvYSF4XPhTfokC6pFuD23nrCJPoVGFzVplkIztBtefzkSmS2rT60haE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CiwVxtHqh7PtMKcIrbTly4vzLJ3BWefIHUj9tJBpUIs=; b=CzZIbrPKBKm9TpeX5njms5gx3n
 vRe9o5b5fMi+Lsf+lNaZNCwAbPeSM70n1habB6YttjSnyQhQW5sxrBgEoKF9XBmKf6o6NJwnUWpt/
 cpdrnuKRKL0p19kxkym1/wuYHVZqwnG37X6sLdKBodBIkk+v/DCvhx6LlE3h1kHM6vrw=;
Received: from mail-vs1-f46.google.com ([209.85.217.46])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pjqy7-00FVqp-J8 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 00:25:44 +0000
Received: by mail-vs1-f46.google.com with SMTP id i10so30030427vss.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Apr 2023 17:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20210112.gappssmtp.com; s=20210112; t=1680654337;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CiwVxtHqh7PtMKcIrbTly4vzLJ3BWefIHUj9tJBpUIs=;
 b=l6r86/ce9IsFgOsq7ESN4gNSClZQP/sjX+D2xE89cFM1t8dRy9wftUcOkA4pXYnHNE
 O9IYna7Za4iqCg6Z63nRspLxVspobB7fFTqClYVHxkNvi5uOPxp/vKueX7OQEXLyhZJQ
 Uv9/iasViZSObsUjc2syUdWAAtgYFBCM8UFV+EUoBJ/OQ3Hnm0STb1AWHiNWvofj5VFq
 u9RCAtimWWpVRQiIWnN977Kosedzs8LozVXTwXC2MxyWN9zC2BezQIZSLuflcpJ9WEhv
 FVU26R66Mns0H5Ts9KSm87ggDueHfuLgrMbrZcaOqFvliRDAadjJfnf5Skk1r3b33i3W
 rAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680654337;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CiwVxtHqh7PtMKcIrbTly4vzLJ3BWefIHUj9tJBpUIs=;
 b=nzNiO5XtKrqDCCoCyfstLM2bburQGaYjfsNWqdefaP+rCd5+J7QNCaWsBwkQmOh+nx
 wQ+yuWQVIpXFEsohvlPzMs7wX0HKTdokvISEkalVHQ8zpmVN5OdA5BaMT3pVDPu6DEU6
 Tyaysn8wT5UaOVuM35ft8QqnRndeZHsWNzTfRV94kw6tztxg79WYg7M1w98rD3HHTXf0
 NN2/hXi6ily4Syxyjwo9wilJEudMjxpIAb7Wzzrqpb+QVZ8tZeds3QBe3VlH3eovxYTN
 Ejt/Huhf/RnZdz0mBunETDhjotOEIiF+yWlNwPnt8yd4iETx6DNk1AjuWyiQmH2Wsh1I
 OEqw==
X-Gm-Message-State: AAQBX9d80YkGoGcbVmFD3z842Q4Jspsmpb8X+6x7LEJTxymSgIlcwtvl
 7nfaTjH9l4DgqgmtPkBlr1O3HUXm/UsaaKiVBcc=
X-Google-Smtp-Source: AKy350boc1NJttMEXbPWdN9rfQR7KWvZb/0IvD3DuAJJ+io4CZz0OVS7AP+iey99+szOCn0Wgij/bQ==
X-Received: by 2002:a62:6454:0:b0:626:7c43:7cb8 with SMTP id
 y81-20020a626454000000b006267c437cb8mr3631280pfb.20.1680652596758; 
 Tue, 04 Apr 2023 16:56:36 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-91-157.pa.nsw.optusnet.com.au.
 [49.181.91.157]) by smtp.gmail.com with ESMTPSA id
 a18-20020a656412000000b005136b93f8e9sm8146027pgv.14.2023.04.04.16.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 16:56:36 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1pjqVt-00H7ij-6l; Wed, 05 Apr 2023 09:56:33 +1000
Date: Wed, 5 Apr 2023 09:56:33 +1000
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20230404235633.GN3223426@dread.disaster.area>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-17-aalbersh@redhat.com>
 <20230404224123.GD1893@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230404224123.GD1893@sol.localdomain>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 04, 2023 at 03:41:23PM -0700, Eric Biggers wrote:
 > Hi Andrey, > > On Tue, Apr 04, 2023 at 04:53:12PM +0200, Andrey Albershteyn
 wrote: > > Add flag to mark inodes which have fs-verity enab [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.46 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.217.46 listed in list.dnswl.org]
X-Headers-End: 1pjqy7-00FVqp-J8
Subject: Re: [f2fs-dev] [PATCH v2 16/23] xfs: add inode on-disk VERITY flag
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
From: Dave Chinner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Dave Chinner <david@fromorbit.com>
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, agruenba@redhat.com, djwong@kernel.org,
 Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, hch@infradead.org,
 cluster-devel@redhat.com, dchinner@redhat.com, rpeterso@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 damien.lemoal@opensource.wdc.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Apr 04, 2023 at 03:41:23PM -0700, Eric Biggers wrote:
> Hi Andrey,
> 
> On Tue, Apr 04, 2023 at 04:53:12PM +0200, Andrey Albershteyn wrote:
> > Add flag to mark inodes which have fs-verity enabled on them (i.e.
> > descriptor exist and tree is built).
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > ---
> >  fs/ioctl.c                 | 4 ++++
> >  fs/xfs/libxfs/xfs_format.h | 4 +++-
> >  fs/xfs/xfs_inode.c         | 2 ++
> >  fs/xfs/xfs_iops.c          | 2 ++
> >  include/uapi/linux/fs.h    | 1 +
> >  5 files changed, 12 insertions(+), 1 deletion(-)
> [...]
> > diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> > index b7b56871029c..5172a2eb902c 100644
> > --- a/include/uapi/linux/fs.h
> > +++ b/include/uapi/linux/fs.h
> > @@ -140,6 +140,7 @@ struct fsxattr {
> >  #define FS_XFLAG_FILESTREAM	0x00004000	/* use filestream allocator */
> >  #define FS_XFLAG_DAX		0x00008000	/* use DAX for IO */
> >  #define FS_XFLAG_COWEXTSIZE	0x00010000	/* CoW extent size allocator hint */
> > +#define FS_XFLAG_VERITY		0x00020000	/* fs-verity sealed inode */
> >  #define FS_XFLAG_HASATTR	0x80000000	/* no DIFLAG for this	*/
> >  
> 
> I don't think "xfs: add inode on-disk VERITY flag" is an accurate description of
> a patch that involves adding something to the UAPI.

Well it does that, but it also adds the UAPI for querying the
on-disk flag via the FS_IOC_FSGETXATTR interface as well.  It
probably should be split up into two patches.

> Should the other filesystems support this new flag too?

I think they should get it automatically now that it has been
defined for FS_IOC_FSGETXATTR and added to the generic fileattr flag
fill functions in fs/ioctl.c.

> I'd also like all ways of getting the verity flag to continue to be mentioned in
> Documentation/filesystems/fsverity.rst.  The existing methods (FS_IOC_GETFLAGS
> and statx) are already mentioned there.

*nod*

-Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
