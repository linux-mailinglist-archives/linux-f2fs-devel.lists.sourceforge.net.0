Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F07032EEF45
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Jan 2021 10:14:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kxnrD-0000Gi-FA; Fri, 08 Jan 2021 09:14:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hch@lst.de>) id 1kxnrB-0000Ga-HY
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Jan 2021 09:14:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TNVL53gg1AV3OPuB+QZ9/yCtpcHPa+FO6bS6M6oBBW4=; b=e3E4n2/QkN9KIu9hRK6QEyRo9o
 arxymf8G93EGxLbsv830jd63VY7Q/sdTDS5NLH/P0WIt5e2Vlb0a6iWvb1BvTD7vVSxr0EnAJuvEa
 pEpHXfiIokd0uMhMUEV9jTttuwoPMdIJWaesm/YddG7kjYTKpFicUoXMC/KFpWS5NvL4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TNVL53gg1AV3OPuB+QZ9/yCtpcHPa+FO6bS6M6oBBW4=; b=jjKYQvSPDr43XFa0bO9YaFfVOP
 bE/pkDCuzNsOmuk5feEbTvaTGhJBORTYICo9ZNLly2/iVSs4Vv7G9sxYEUleQ0l4dmNPOREDx+ZvQ
 LTHZBVIAA0N2JxYJqI5kzHcSjz1B3Zkcqp7e+pEUICdWwWBWMiY+dkA6Aw8yFSvIDXLg=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kxnr3-009Ynv-0I
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Jan 2021 09:14:53 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 63E6767373; Fri,  8 Jan 2021 10:14:37 +0100 (CET)
Date: Fri, 8 Jan 2021 10:14:36 +0100
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20210108091436.GC2587@lst.de>
References: <20210105005452.92521-1-ebiggers@kernel.org>
 <20210105005452.92521-12-ebiggers@kernel.org>
 <20210107140228.GF12990@quack2.suse.cz> <X/eFxSh3ac6EGdYI@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X/eFxSh3ac6EGdYI@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kxnr3-009Ynv-0I
Subject: Re: [f2fs-dev] [PATCH 11/13] fs: add a lazytime_expired method
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
Cc: Jan Kara <jack@suse.cz>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jan 07, 2021 at 02:05:57PM -0800, Eric Biggers wrote:
> The XFS developers might have a different opinion though, as they were the ones
> who requested it originally:
> 
> 	https://lore.kernel.org/r/20200312143445.GA19160@infradead.org
> 	https://lore.kernel.org/r/20200325092057.GA25483@infradead.org
> 	https://lore.kernel.org/r/20200325154759.GY29339@magnolia
> 	https://lore.kernel.org/r/20200312223913.GL10776@dread.disaster.area
> 
> Any thoughts from anyone about whether we should still introduce a separate
> notification for lazytime expiration, vs. just using ->dirty_inode(I_DIRTY_SYNC)
> with I_DIRTY_TIME in i_state?

I still find the way ->dirty_inode is used very confusing, but with this
series and Jan's first patch I think we have a good enough state for now
and don't need to add a method just for XFS.  I still think it might make
sense to eventually revisit how file systems are notified about dirtying.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
