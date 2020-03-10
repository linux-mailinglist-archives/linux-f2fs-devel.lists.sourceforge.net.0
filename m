Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38852180307
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2020 17:18:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jBhal-00071h-Rb; Tue, 10 Mar 2020 16:18:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jBhai-00071Q-Km
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Mar 2020 16:18:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JZEmvk3seR40BN/FCOYVlFxxXpb+Wf0LSycR2/C5nU8=; b=QpgbL2Tb4CLAh3mVNDnUh3/Wob
 KghGSIYhBFySxmOGqOlPGhLnTqbCRvoKZmzP97bgbwPg1hrncECadqHotd6NP9zZ5eYedLfOJ42+E
 g0yyrwAdGW5M+u+tufi0sKIaQc7Hgu2r1PiGorIQTbfjJk9WwOc2c35GYBRnT0PTRvk8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JZEmvk3seR40BN/FCOYVlFxxXpb+Wf0LSycR2/C5nU8=; b=a+7x9J9Saj6kn0wN7WPpZMkkWu
 5Y3bCa0t8Mm5ZDnHwRg11Z+VBahrFBHkHWTIo9cYtf362SsTfeCef0laLMiqG6l6HsdI6R4wx2LGi
 EzWCIZXLk7dhJDEqIAXmtS9uRaTA6tTWFx+pt2Y7kEtJqyjzlDkzCRkBR+Z7dd3ftYe0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jBhae-007m5c-SK
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Mar 2020 16:18:48 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 287A420873;
 Tue, 10 Mar 2020 16:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583857119;
 bh=S1BKfDbjA1iRAn3ZZqZEqHXcCp/sA+icgC/rWITTyl8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AbmLKWbKqzpbhhIUi6xrKsdd4lokgJa/FCeZ1/1F11RdP+MMJbdWChWhw15lfVUZn
 GKP+FFET/eK75dVo8jugvBoGpquwYT3h9ZtuRKMhrOyvLFw6eLKOuwXlXyvnrr3/Qj
 bYJlaEEzuqw5Bsg7pUK2MmY9hblNNDwqtMnVc5jk=
Date: Tue, 10 Mar 2020 09:18:38 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <20200310161838.GB240315@google.com>
References: <20200225102646.43367-1-yuchao0@huawei.com>
 <3525f924-7d65-c005-a7e6-d315cf14aab2@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3525f924-7d65-c005-a7e6-d315cf14aab2@kernel.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jBhae-007m5c-SK
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to check i_compr_blocks correctly
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/10, Chao Yu wrote:
> Hi Jaegeuk,
> 
> On 2020-2-25 18:26, Chao Yu wrote:
> > inode.i_blocks counts based on 512byte sector, we need to convert
> > to 4kb sized block count before comparing to i_compr_blocks.
> > 
> > In addition, add to print message when sanity check on inode
> > compression configs failed.
> > 
> > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > ---
> >  fs/f2fs/inode.c | 23 ++++++++++++++++++++---
> >  1 file changed, 20 insertions(+), 3 deletions(-)
> > 
> > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > index 156cc5ef3044..299611562f7e 100644
> > --- a/fs/f2fs/inode.c
> > +++ b/fs/f2fs/inode.c
> > @@ -291,13 +291,30 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
> >  			fi->i_flags & F2FS_COMPR_FL &&
> >  			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
> >  						i_log_cluster_size)) {
> > -		if (ri->i_compress_algorithm >= COMPRESS_MAX)
> > +		if (ri->i_compress_algorithm >= COMPRESS_MAX) {
> > +			f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported "
> > +				"compress algorithm: %u, run fsck to fix",
> > +				  __func__, inode->i_ino,
> > +				  ri->i_compress_algorithm);
> >  			return false;
> > -		if (le64_to_cpu(ri->i_compr_blocks) > inode->i_blocks)
> > +		}
> > +		if (le64_to_cpu(ri->i_compr_blocks) >
> > +				SECTOR_TO_BLOCK(inode->i_blocks)) {
> > +			f2fs_warn(sbi, "%s: inode (ino=%lx) hash inconsistent "
> 
> This is a typo: hash -> has
> 
> Could you please manually fix this in your tree?

Done.

> 
> Thanks
> 
> > +				"i_compr_blocks:%llu, i_blocks:%llu, run fsck to fix",
> > +				  __func__, inode->i_ino,
> > +				  le64_to_cpu(ri->i_compr_blocks),
> > +				  SECTOR_TO_BLOCK(inode->i_blocks));
> >  			return false;
> > +		}
> >  		if (ri->i_log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
> > -			ri->i_log_cluster_size > MAX_COMPRESS_LOG_SIZE)
> > +			ri->i_log_cluster_size > MAX_COMPRESS_LOG_SIZE) {
> > +			f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported "
> > +				"log cluster size: %u, run fsck to fix",
> > +				  __func__, inode->i_ino,
> > +				  ri->i_log_cluster_size);
> >  			return false;
> > +		}
> >  	}
> > 
> >  	return true;
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
