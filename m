Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37034632DA0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Nov 2022 21:07:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oxD4V-0004gZ-73;
	Mon, 21 Nov 2022 20:07:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <akpm@linux-foundation.org>) id 1oxD4R-0004gS-9z
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Nov 2022 20:07:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uZReaScaLIpKyiz5HiuhJzPI9e/ZmSUHTeBduh0wRKU=; b=Q+RImqrm8LWHjkCatLT1Bp24tT
 3E0hb4bwHgC5th7xuKQE886mYMPY8qCCkprX8bejEpu+TRuvp7gp2mG8txw9kQy5Bs5S1XjpWoaaW
 VdWg5xLDzsF/WexEsxjA+GVjjxD0a3Ia4974lqNh4ZSy5qoD+ejhMusUTsPmxsUjZSYo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uZReaScaLIpKyiz5HiuhJzPI9e/ZmSUHTeBduh0wRKU=; b=MAiDdREybeJplY4oT66rx0H/ak
 YGJx1cwr3mzXm3FOojqQ3ehZtbjAyatHJXCl4Pf1LRKlhGBwDlc71UMIvH61rTk/In906QzrQjjLJ
 Jz6/+rjEZfqH8sCoZ3HkufVpYYQYkChiinGuGZZ+YOhjNPiT+/6RR/SCy++cfmfqv5HU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oxD4J-0001Nj-9y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Nov 2022 20:07:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E0503B815D5;
 Mon, 21 Nov 2022 19:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35382C433C1;
 Mon, 21 Nov 2022 19:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1669060121;
 bh=uPYHTP2Ipj1sjrcHIm6CYiJh1FA0Hkn6zRTUosyzZhU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TrV/2DjxF1rutFbntPYYC9ONN0Uda6FFTBfJlApXphenB+VGOZ5iLxlUIkzmv7s7E
 lZr0pL2iT2j274d6+x2nxXaHGy3/wnUtCl/KUrmLKCxa2ewYEAXooKMndVypDUcvl2
 63Fx/Kosh/hLvBUeAm4T/PKzCJLBd/aiTg8bd+CI=
Date: Mon, 21 Nov 2022 11:48:40 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Alexander Potapenko <glider@google.com>
Message-Id: <20221121114840.c407626c13706ff993efabe3@linux-foundation.org>
In-Reply-To: <20221121112134.407362-1-glider@google.com>
References: <20221121112134.407362-1-glider@google.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon,
 21 Nov 2022 12:21:30 +0100 Alexander Potapenko <glider@google.com>
 wrote: > When aops->write_begin() does not initialize fsdata, KMSAN reports
 > an error passing the latter to aops->write_end(). > > Fix this by
 unconditionally initializing fsdata. > > ... > 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1oxD4J-0001Nj-9y
Subject: Re: [f2fs-dev] [PATCH 1/5] fs: ext4: initialize fsdata in
 pagecache_write()
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
Cc: tytso@mit.edu, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 adilger.kernel@dilger.ca, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org,
 syzbot+9767be679ef5016b6082@syzkaller.appspotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 21 Nov 2022 12:21:30 +0100 Alexander Potapenko <glider@google.com> wrote:

> When aops->write_begin() does not initialize fsdata, KMSAN reports
> an error passing the latter to aops->write_end().
> 
> Fix this by unconditionally initializing fsdata.
> 
> ...
>

I'm assuming that this is not-a-bug, and that these changes are purely
workarounds for a KMSAN shortcoming?

If true, this important info should be included in each changelog,
please.

If false, please provide a full description of the end-user visible
effects of the bug.

Also, it would be helpful to describe why it is not considered
practical to teach KMSAN to handle this?

> --- a/fs/ext4/verity.c
> +++ b/fs/ext4/verity.c
> @@ -79,7 +79,7 @@ static int pagecache_write(struct inode *inode, const void *buf, size_t count,
>  		size_t n = min_t(size_t, count,
>  				 PAGE_SIZE - offset_in_page(pos));
>  		struct page *page;
> -		void *fsdata;
> +		void *fsdata = NULL;
>  		int res;
>  
>  		res = aops->write_begin(NULL, mapping, pos, n, &page, &fsdata);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
