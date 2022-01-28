Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4E149F7F9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jan 2022 12:10:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nDP9K-0005q0-4C; Fri, 28 Jan 2022 11:10:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <miklos@szeredi.hu>) id 1nDP9H-0005pu-R8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jan 2022 11:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E/VIyc5JpK2Sy5loT9a2HcHWg2TrorJJxRaogeKP25w=; b=DvF9lrTsEYYowgwgkZngtpXt55
 ubMLc32hGlFIM56nag9Rz4KNWAw8SYLjgkszBDl+hCH1L4DFVxRi7tO4SQfK3Y/168xWuzp9R6nu7
 ujb6OMYzxFWxi4tLIRimS8PRt/bLaOVtyGzACoORqXR9GqjT7dA7C3BFW6ZsCYDJMm+Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E/VIyc5JpK2Sy5loT9a2HcHWg2TrorJJxRaogeKP25w=; b=DlyfyLM6kblFBPlrQKJ5XBs3X2
 CuKbqhy9cHna8TU+tVU92jTFr64qieei7Z9icVuOZ2Tzs2TrYpE1NpwEor9WM6kGhYUSmSEhRoPdx
 +5bdHxitSU0WsUvXTJcIKCE84OmGSr2N0Lp6bM9Wd4Zo32qWbTh89QST95Q1CUdruMZg=;
Received: from mail-vk1-f175.google.com ([209.85.221.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nDP9C-0004Jb-L2
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jan 2022 11:10:34 +0000
Received: by mail-vk1-f175.google.com with SMTP id l196so3654740vki.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 28 Jan 2022 03:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E/VIyc5JpK2Sy5loT9a2HcHWg2TrorJJxRaogeKP25w=;
 b=EibPllimp8WZIwxJdUGUIFAlIuZdyznPvrXJ7caP5EDkiBNUVM4ihiUoIfNxC6TVSx
 YE207qfvpl7N/VHWz1SefuMcAFD5mqGieRSegzXNyYGWfyIdkPkwWByrIvqWimbKQ8Un
 /lbUGxvPlDX06Jf/32nPUu5Q90vZSrQ0/ovfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E/VIyc5JpK2Sy5loT9a2HcHWg2TrorJJxRaogeKP25w=;
 b=3oSWhqLa6Sg4fdXbXTbq1xsXaNo44I7vl9pArWw6R0Eg771X1VmAssGKA8jtSzOl5R
 BDkloZl8MngJwI+gVudhSsl3AkERIvSgFPXTM/kKEH85jq4xfxOUsdv1jDDrb+raJMvt
 YEwgDn36Wk7ENvpuhGZUCB7BATYdA2KalK0dJt94FI/bkorGfR/O2pGtXW2DhAHhnNAO
 3QFbgH1LyOIoiImG51Qv7IrnEcN2jRE3n/3KI+zZMKrZ1CEs5PyVroRQ0QJcg9HWKWMk
 s3mapP1OLIiz5hBT11s3VTiUzbRSsNz4kqRrms2ksl5dZRoNRkMSgU0xV4z5eutxr1oF
 tl3g==
X-Gm-Message-State: AOAM532EuE81YlUuG2gRSwgMEAly07cTOkEzzUS8haaU94I282xfhkF6
 7pHz0WS/2KJNmnDDjupSr4uoK9xUtBRydh3NGnyXcw0GOQhSYQ==
X-Google-Smtp-Source: ABdhPJwGf3F8vVWMx/hAPOM/tzuC6mlnTkkNvV3zFtYKADK7sTRpnxjvKNE9DMzHauL+NEVwnl4j38I6/K9jRDhQk7E=
X-Received: by 2002:a67:c390:: with SMTP id s16mr3769368vsj.61.1643362687362; 
 Fri, 28 Jan 2022 01:38:07 -0800 (PST)
MIME-Version: 1.0
References: <164325106958.29787.4865219843242892726.stgit@noble.brown>
 <164325158954.29787.7856652136298668100.stgit@noble.brown>
In-Reply-To: <164325158954.29787.7856652136298668100.stgit@noble.brown>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 28 Jan 2022 10:37:56 +0100
Message-ID: <CAJfpegt-igF8HqsDUcMzfU0jYv8WpofLy0Uv0YnXLzsfx=tkGg@mail.gmail.com>
To: NeilBrown <neilb@suse.de>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 27 Jan 2022 at 03:47,
 NeilBrown <neilb@suse.de> wrote:
 > > inode_congested() reports if the backing-device for the inode is >
 congested.
 Few bdi report congestion any more, only ceph, fuse, an [...] 
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.221.175 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.175 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1nDP9C-0004Jb-L2
Subject: Re: [f2fs-dev] [PATCH 1/9] Remove inode_congested()
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm <linux-mm@kvack.org>, drbd-dev@lists.linbit.com,
 Paolo Valente <paolo.valente@linaro.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Ilya Dryomov <idryomov@gmail.com>, Ext4 <linux-ext4@vger.kernel.org>,
 linux-block@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Linux NFS list <linux-nfs@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jeff Layton <jlayton@kernel.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 27 Jan 2022 at 03:47, NeilBrown <neilb@suse.de> wrote:
>
> inode_congested() reports if the backing-device for the inode is
> congested.  Few bdi report congestion any more, only ceph, fuse, and
> nfs.  Having support just for those is unlikely to be useful.
>
> The places which test inode_congested() or it variants like
> inode_write_congested(), avoid initiating IO if congestion is present.
> We now have to rely on other places in the stack to back off, or abort
> requests - we already do for everything except these 3 filesystems.
>
> So remove inode_congested() and related functions, and remove the call
> sites, assuming that inode_congested() always returns 'false'.

Looks to me this is going to "break" fuse; e.g. readahead path will go
ahead and try to submit more requests, even if the queue is getting
congested.   In this case the readahead submission will eventually
block, which is counterproductive.

I think we should *first* make sure all call sites are substituted
with appropriate mechanisms in the affected filesystems and as a last
step remove the superfluous bdi congestion mechanism.

You are saying that all fs except these three already have such
mechanisms in place, right?  Can you elaborate on that?

Thanks,
Miklos


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
