Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71571918E8
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 18 Aug 2019 20:35:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hzQ16-0006BA-Sv; Sun, 18 Aug 2019 18:35:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>)
 id 1hzQ15-0006B0-SW; Sun, 18 Aug 2019 18:34:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ArFQVqarRBT6JVLyhFl0mU/THpX7OedUDxjXd4T38Dg=; b=cgxEfDA1l5tqwtJE2fs9jzOMPo
 +JbjjL6FQmB5uzDn1chG0ytueTBGvBLQEfLwzkp0rZpEEfftXx2lt3G2C82scsTHrzgF4RS+jqoom
 I5hiCeS+XEtAQguQj06SdjBUN5owtW/XXs73OhoJyrsWbo9I4EwJ3gAUS7D7+mAouxaE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ArFQVqarRBT6JVLyhFl0mU/THpX7OedUDxjXd4T38Dg=; b=BmQmJgHGD9a7YBtT0zZ01qV7RD
 yRnqf4QkI19WEUdJ434ECvkbRMK8jZkD1nmtTckPdy61l6CXcnTRvkEG/nGS8YB6A9ySMrR+g22+8
 0nRm+5YN1+QesiqweM10UkAQHFSP5lP9Vy9tJgS4Pr74EVEWr1Rbr0ZyILVdw+lOXbuQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hzQ12-007yOa-D9; Sun, 18 Aug 2019 18:34:59 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D91862184D;
 Sun, 18 Aug 2019 18:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566153288;
 bh=NoAluoc+Uq1qt0jwwoy3iiCN6uLBPDpdA+kJGNLfpEc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gGZ5UHz+VcRsH4bqNPorYZKMdOjs4yjmQumubPysA2fMTlAuE1QxyfIcxRbYwSVeI
 Qb4pWxTOnTUKPIM2ipvQtTNTl0RqCtrF1ds4J+2Oe4TVNBnOCeRoFiFduU+U2Qjj+q
 RM0RP0rlCS881frkAmEiHevGSBTCsQWY54ANTTN4=
Date: Sun, 18 Aug 2019 20:34:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepa Dinamani <deepa.kernel@gmail.com>
Message-ID: <20190818183446.GA2791@kroah.com>
References: <20190818165817.32634-1-deepa.kernel@gmail.com>
 <20190818165817.32634-4-deepa.kernel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190818165817.32634-4-deepa.kernel@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hzQ12-007yOa-D9
Subject: Re: [f2fs-dev] [PATCH v8 03/20] timestamp_truncate: Replace users
 of timespec64_trunc
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
Cc: arnd@arndb.de, dedekind1@gmail.com, y2038@lists.linaro.org, richard@nod.at,
 adrian.hunter@intel.com, linux-kernel@vger.kernel.org, tj@kernel.org,
 linux-mtd@lists.infradead.org, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-ntfs-dev@lists.sourceforge.net,
 hch@lst.de, jlbec@evilplan.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Aug 18, 2019 at 09:58:00AM -0700, Deepa Dinamani wrote:
> Update the inode timestamp updates to use timestamp_truncate()
> instead of timespec64_trunc().
> 
> The change was mostly generated by the following coccinelle
> script.
> 
> virtual context
> virtual patch
> 
> @r1 depends on patch forall@
> struct inode *inode;
> identifier i_xtime =~ "^i_[acm]time$";
> expression e;
> @@
> 
> inode->i_xtime =
> - timespec64_trunc(
> + timestamp_truncate(
> ...,
> - e);
> + inode);
> 
> Signed-off-by: Deepa Dinamani <deepa.kernel@gmail.com>
> Cc: adrian.hunter@intel.com
> Cc: dedekind1@gmail.com
> Cc: gregkh@linuxfoundation.org
> Cc: hch@lst.de
> Cc: jaegeuk@kernel.org
> Cc: jlbec@evilplan.org
> Cc: richard@nod.at
> Cc: tj@kernel.org
> Cc: yuchao0@huawei.com
> Cc: linux-f2fs-devel@lists.sourceforge.net
> Cc: linux-ntfs-dev@lists.sourceforge.net
> Cc: linux-mtd@lists.infradead.org
> ---
>  fs/attr.c           | 21 ++++++++++++---------
>  fs/configfs/inode.c | 12 ++++++------
>  fs/f2fs/file.c      | 21 ++++++++++++---------
>  fs/kernfs/inode.c   |  7 +++----
>  fs/ntfs/inode.c     | 21 ++++++++++++---------
>  fs/ubifs/file.c     | 21 ++++++++++++---------
>  6 files changed, 57 insertions(+), 46 deletions(-)

For kernfs:
	Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
