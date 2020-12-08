Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E03E32D2036
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Dec 2020 02:39:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmRyI-0001th-CT; Tue, 08 Dec 2020 01:39:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kmRxc-0001oA-1O
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 01:38:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X/leEOFHAAAHbffIzAeZlJ6iIZo3piw6gfT0Y6wMTMI=; b=LF9cjrcqrbP4VUQNdt/m31CbQy
 fzEpSYFbt5M7kZwxyVDZ5c+1vsvuYGTTIRmnIF0GV+ZYXmxxrAUAkhp6de28jLdxt9YPyGxXGxxJh
 RcNycydPEvAWFUxDTpvVd443snr3TNf5BPuIjluhyV1HvE4gRsKwOVrHJGllxejH9YJw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X/leEOFHAAAHbffIzAeZlJ6iIZo3piw6gfT0Y6wMTMI=; b=Jy8ybw1kVbjOCMUwQhy5cNCx3d
 wfVBZCqkL5DXIH9i61/kN7h/xoW2AGAuHxGWyqIwNIhwpuG1A2p11yNyEJU4Q4sG53sh99XHW5qVP
 BFnjfCaNEX8gH/5yG8ReYbuTtYgr3fV1UmjtpjD8kDnvMYOt62zc8UaQLqypdC3ugLeE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmRxX-0061Fx-HE
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 01:38:35 +0000
Date: Mon, 7 Dec 2020 17:38:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607391506;
 bh=Lw8FGkytNI+T844oR3XBUTRIHX4ODzeiQUnB71x5kfY=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=ESw/YMeQDhBxsb80ZI/aOKYpoM+O5YtEZmY6YNhAMmOSt+0AApXrU4Um1fizGx/Sl
 f5q+tDDxUvzPbrwiTg8G4FurPpUscESA3q0OyM+NVmQjie1+CDtt8ornYlKU2B5dbe
 fIu0djyAVWR/RojvlljRFlc+V6wVR0MvMRhxG03y8tgsH9FVzZp1sZWPSKuNos45+Y
 H/vyj+UWVKoJiz/ICiQ2HUn3MMLRBx2feoEJ6iOR1ZiY+tFORh5VMpbuS0zeHDWuVa
 z+sdaOzYdsECvkTwa7Iheaiir9hMb0j6Br3nMFzeOSqi3o93+WjYDQL4U4rn4rRVc0
 KEDbuDGXzE8jg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <X87ZENVuVkTFGdRe@google.com>
References: <20201207120114.25642-1-jack.qiu@huawei.com>
 <20201207120114.25642-3-jack.qiu@huawei.com>
 <X85dFjmqLmo/RsQn@google.com>
 <529dd167-3951-1fb9-a1c3-9ae6cdbc8dfb@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <529dd167-3951-1fb9-a1c3-9ae6cdbc8dfb@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kmRxX-0061Fx-HE
Subject: Re: [f2fs-dev] [PATCH v3 2/3] f2fs: inline: remove redundant
 FI_DATA_EXIST set
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

On 12/08, Chao Yu wrote:
> On 2020/12/8 0:49, Jaegeuk Kim wrote:
> > On 12/07, Jack Qiu wrote:
> > > FI_DATA_EXIST has been set in recover_inline_flags, no need set in
> > > f2fs_recover_inline_data again. Just remove it.
> > > 
> > > Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
> > > ---
> > >   fs/f2fs/inline.c | 1 -
> > >   1 file changed, 1 deletion(-)
> > > 
> > > diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> > > index 0399531efcd3..0a8f7eefca7d 100644
> > > --- a/fs/f2fs/inline.c
> > > +++ b/fs/f2fs/inline.c
> > > @@ -286,7 +286,6 @@ int f2fs_recover_inline_data(struct inode *inode, struct page *npage)
> > >   		memcpy(dst_addr, src_addr, MAX_INLINE_DATA(inode));
> > > 
> > >   		set_inode_flag(inode, FI_INLINE_DATA);
> > > -		set_inode_flag(inode, FI_DATA_EXIST);
> > 
> > Wait, recover_inline_flags() sets this based on on-disk flag, but this tries to
> > recover it back.
> 
> Should this flag only be recovered with the way like __recover_inline_status()?
> otherwise, the data_exist status may be not be consistent with real condition.

Well, we cannot say consistency on this, since user can write zero data. This
can avoid __recover_inline_state() regardless of there-in data which is zero or
not.

> 
> Thanks,
> 
> > 
> > > 
> > >   		set_page_dirty(ipage);
> > >   		f2fs_put_page(ipage, 1);
> > > --
> > > 2.17.1
> > > 
> > > 
> > > 
> > > _______________________________________________
> > > Linux-f2fs-devel mailing list
> > > Linux-f2fs-devel@lists.sourceforge.net
> > > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > 
> > 
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
