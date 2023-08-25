Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E8C789160
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 26 Aug 2023 00:02:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qZesr-0000zB-QF;
	Fri, 25 Aug 2023 22:02:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1qZesq-0000z4-Sj
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 22:02:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EA93GbJhFaX1RD1S1v1NWvgWKkuCopUaLEmO6z67OS0=; b=TizDDBwpNwcuVP7sJyo6DyDjGm
 xbwlwZP3e65spXYFFbR2641ZfpE0VwV5MeCwF+6AVA4kBjXfyt7Uutd7I9tCcqpOKNSYYm/oiCZ1J
 UwWL5XAURRYIRu3Uq4PwNxLSkA6WBfqddbU+XHI3b3c4vCd46FO3D9F5oNN75l61V2SQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EA93GbJhFaX1RD1S1v1NWvgWKkuCopUaLEmO6z67OS0=; b=Cn7kwPOG9EkuDSZzcp8rHeIwV9
 bHPe6AdmymjotQL8ReM8gBEcTbETcz6zUZ3yrWVAwAutVS/64Yx7tfTW26CNIs7WlCcMTz8hq90Qt
 P7lqbkGTuDMErUwJPaMywrNLQZDtzWwVg6zKp3Gsx7llGv7cn/DBy6mDTYxAklJa4Cts=;
Received: from mail-yw1-f179.google.com ([209.85.128.179])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qZesq-00Fadt-75 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Aug 2023 22:02:25 +0000
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-592976e5b6dso14391257b3.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Aug 2023 15:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20221208.gappssmtp.com; s=20221208; t=1693000938; x=1693605738;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EA93GbJhFaX1RD1S1v1NWvgWKkuCopUaLEmO6z67OS0=;
 b=ktaXkq4J3rc5CNGonZIeoI/OeRx+oKOnC1G25TOn4ge68zI1AgZkWjkhFHK/AcpS7m
 sw7eT5QXO53XE3cNIRa/GQ77o8NsAwzmS7DQF/tGzD52n+Ds4v1K+dyTuw2A8mDXs1oy
 T+uleSe9jyWG3fJKquQLrQlhffLzzHtGH7oISCUeqeQ3CmnMNrdFgeTb0W4XtKfTLxGY
 tvoAyu5H5ZcwsDhyiWBAQdeI8lI+zj0+eikXi50l/VPW/ZJ1xT/HYefl3reHUG9LkYiC
 X5vbfHyODaScOWCHGh5ELz9vnjAre0fXhTNF3jm7FQ7muJXC+8HQix1pQR+f4FrC6wDD
 8Spg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693000938; x=1693605738;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EA93GbJhFaX1RD1S1v1NWvgWKkuCopUaLEmO6z67OS0=;
 b=Vj8jCuxoW79bf/dr/CPxbG8U3uXdh6LbFkQXFhy95M+kVGo3NA/CxqAWL6kZ3ObkFA
 IWL/rMREOzH42M9sk1PayXcyRlZ0G2b4oFoFUncgk2s4/PBlZtfhlFzyyAApiOT6myrS
 s/bTbnntZ01nUTNf9z5gyvvyGxXW9sgkZoK11Ts/o1z526QeBhG+hnXSILU38E6pANox
 kqsToYwaD0VALhe7KGcuwFBSZy6l4pUjUnJylpZNw6tja9dw9B7vswY7IrLsPxQlylnQ
 lXUVNHenSt8v17BwPGSgNHEBoSGnM2taAnTQcs2kFZXdHbpQap+LhzAXqfXBQTj0KdYj
 sE1Q==
X-Gm-Message-State: AOJu0YzzcLNp63TvCS3cv/W7p5zQeY7pB+0tOeJs2kHuO+sL7HDhyUHW
 4+vawoJGYUiaxxIco3YwhG08bOPex0S0pkxAEt8=
X-Google-Smtp-Source: AGHT+IGuXiZpaiaSoWbg0vAVB9MheRguVETxlh6z74Aponrqbg78kQHVeidygYbMeETEncHmOPB93Q==
X-Received: by 2002:a17:90a:bf88:b0:263:5d25:150c with SMTP id
 d8-20020a17090abf8800b002635d25150cmr15563047pjs.29.1693000434105; 
 Fri, 25 Aug 2023 14:53:54 -0700 (PDT)
Received: from dread.disaster.area (pa49-195-66-88.pa.nsw.optusnet.com.au.
 [49.195.66.88]) by smtp.gmail.com with ESMTPSA id
 fz23-20020a17090b025700b0026b4decfe59sm2177778pjb.31.2023.08.25.14.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 14:53:53 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qZekY-006V5n-1X;
 Sat, 26 Aug 2023 07:53:50 +1000
Date: Sat, 26 Aug 2023 07:53:50 +1000
To: Hao Xu <hao.xu@linux.dev>
Message-ID: <ZOki7u/zJGmZtL6g@dread.disaster.area>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
 <20230825135431.1317785-25-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230825135431.1317785-25-hao.xu@linux.dev>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Aug 25, 2023 at 09:54:26PM +0800, Hao Xu wrote: >
 From: Hao Xu <howeyxu@tencent.com> > > This causes xfstests generic/232 hung
 in umount process, waiting for ail > push, so I comment it for no [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.179 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.179 listed in list.dnswl.org]
X-Headers-End: 1qZesq-00Fadt-75
Subject: Re: [f2fs-dev] [PATCH 24/29] xfs: support nowait for
 xfs_buf_read_map()
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 netdev@vger.kernel.org, samba-technical@lists.samba.org,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, bpf@vger.kernel.org,
 Pavel Begunkov <asml.silence@gmail.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Aug 25, 2023 at 09:54:26PM +0800, Hao Xu wrote:
> From: Hao Xu <howeyxu@tencent.com>
> 
> This causes xfstests generic/232 hung in umount process, waiting for ail
> push, so I comment it for now, need some hints from xfs folks.
> Not a real patch.
> 
> Signed-off-by: Hao Xu <howeyxu@tencent.com>
> ---
>  fs/xfs/xfs_buf.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
> index cdad80e1ae25..284962a9f31a 100644
> --- a/fs/xfs/xfs_buf.c
> +++ b/fs/xfs/xfs_buf.c
> @@ -828,6 +828,13 @@ xfs_buf_read_map(
>  	trace_xfs_buf_read(bp, flags, _RET_IP_);
>  
>  	if (!(bp->b_flags & XBF_DONE)) {
> +//		/*
> +//		 * Let's bypass the _xfs_buf_read() for now
> +//		 */
> +//		if (flags & XBF_NOWAIT) {
> +//			xfs_buf_relse(bp);
> +//			return -EAGAIN;
> +//		}

This is *fundamentally broken*, and apart from anything else breaks
readahead.

IF we asked for a read, we cannot instantiate the buffer and then
*not issue any IO on it* and release it. That leaves an
uninitialised buffer in memory, and there's every chance that
something then trips over it and bad things happen.

A buffer like this *must* be errored out and marked stale so that
the next access to it will then re-initialise the buffer state and
trigger any preparatory work that needs to be done for the new
operation.

This comes back to my first comments that XBF_TRYLOCK cannot simpy
be replaced with XBF_NOWAIT semantics...

-Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
