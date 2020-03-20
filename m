Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C76218D7CD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Mar 2020 19:51:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jFMkB-0007wy-TZ; Fri, 20 Mar 2020 18:51:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jFMkB-0007wr-95
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 18:51:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T7r6jjVcCzy1sWzmSOGv2UMMMVNDT9xVffFewCUrx+c=; b=mWd7GpB/SFAVYkLKNglTXdWVmB
 i/Vniy/4cdXVmhDlvnHKsIupLqpQZjNr6qrXr66ML1yaiwBN2Y8T8FNd4KI/e0Bvf6lsrXtYgGRJT
 KxcHoCo77HV3dr9eREBJQfAt1avrcrQyZUrPquWj7J11y1PpNoWXn3kGwCj1JPB2zyMs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T7r6jjVcCzy1sWzmSOGv2UMMMVNDT9xVffFewCUrx+c=; b=kr+OsEhFgXMXUiV3G0RQc2+iv6
 7nXppHcPZ8dyD5Uq81LsvzTUyuAf41Y4nKmvY4tqr7Z3iQ74Hx+LeAB9auGD0IJEjvIdXpjOFr/Bh
 6WjVAJEpItm5RoLlutIs0NfmThsQ3oqeTIXuXCWSnA4iChDOfK2BIz/ifkAT3mL0me8Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jFMk9-00AVJL-DW
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 18:51:43 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 73FEA20775;
 Fri, 20 Mar 2020 18:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584730295;
 bh=wmxvXevR06nb1QmpGEsop/WZiA63VuWIIHhbvnGv3KA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ATEVLUwSRAGOLrwqGIPQHX0PWH4lr45iE5A/NazJJCfEOZHnreOA2VBhpGjQhk/ki
 4+ZKkX5+P81ra2F1GVplnKnGZnFW5hCuQZ+bwoyYxCCre1aOpfzyewy++fV9Qt8rae
 IkgJ+cgr/UTSzDQK5vzJ04cieWphnrdFa7f7cJlw=
Date: Fri, 20 Mar 2020 11:51:34 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200320185134.GI851@sol.localdomain>
References: <20200320142231.2402-1-willy@infradead.org>
 <20200320142231.2402-23-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320142231.2402-23-willy@infradead.org>
X-Spam-Score: -0.4 (/)
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jFMk9-00AVJL-DW
Subject: Re: [f2fs-dev] [PATCH v9 22/25] f2fs: Convert from readpages to
 readahead
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
Cc: cluster-devel@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 William Kucharski <william.kucharski@oracle.com>, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Mar 20, 2020 at 07:22:28AM -0700, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> 
> Use the new readahead operation in f2fs
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: William Kucharski <william.kucharski@oracle.com>
> ---
>  fs/f2fs/data.c              | 47 +++++++++++++++----------------------
>  include/trace/events/f2fs.h |  6 ++---
>  2 files changed, 22 insertions(+), 31 deletions(-)
> 

Reviewed-by: Eric Biggers <ebiggers@google.com>

> @@ -2210,7 +2204,7 @@ static int f2fs_mpage_readpages(struct address_space *mapping,
>  				ret = f2fs_read_multi_pages(&cc, &bio,
>  							max_nr_pages,
>  							&last_block_in_bio,
> -							is_readahead);
> +							rac);

IMO it would be clearer to write 'rac != NULL' here (and below) since the
argument is actually a bool, but this works too.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
