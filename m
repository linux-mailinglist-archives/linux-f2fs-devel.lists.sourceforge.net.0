Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2F92F27F8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Jan 2021 06:42:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kzCRu-0007LF-M8; Tue, 12 Jan 2021 05:42:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1kzCRt-0007Kz-3m
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jan 2021 05:42:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CGAqWqlaxWjocJQqXZ6l5IvsBY8vVAuCi4hJf+54fOQ=; b=BwLf0hPNhrr3oB2hqlryGGa5Bv
 yJeO0N3gCWzBKTEnPjTTtmBjvx2m8eJIuOKrf39SEblOTPCDoD0EckhYPOOu+5rTMMU6LBc5FQ7x2
 FfuPIjf/K1wozPNg1QCqkRAvw7PK2RIJNcHVEc7Z+ldVmHun/IMOggCLrCiwQKr517Ks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CGAqWqlaxWjocJQqXZ6l5IvsBY8vVAuCi4hJf+54fOQ=; b=NalsSJujKTOcNEUFYYUBWb9ujO
 JzBot6Q4a2LIz4medYk1zAKp8PHkTXQnHZXSTNZ3tDDLtZrFZjhzxIR40GBS6ECoZksZWSCX4qjTa
 NbdSdW8zNSBG7SXUxhQOJqiBbKkOz70kf/ymU056OTiULN9BYrrT32hO2p+PoFVgaEMo=;
Received: from mail104.syd.optusnet.com.au ([211.29.132.246])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1kzCRg-002seT-Rj
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jan 2021 05:42:33 +0000
Received: from dread.disaster.area (pa49-179-167-107.pa.nsw.optusnet.com.au
 [49.179.167.107])
 by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 8C2BE826077;
 Tue, 12 Jan 2021 16:21:15 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1kzC7G-005aGL-IW; Tue, 12 Jan 2021 16:21:14 +1100
Date: Tue, 12 Jan 2021 16:21:14 +1100
From: Dave Chinner <david@fromorbit.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20210112052114.GS331610@dread.disaster.area>
References: <20210109075903.208222-1-ebiggers@kernel.org>
 <20210109075903.208222-5-ebiggers@kernel.org>
 <20210111105201.GB2502@lst.de> <X/ysA8PuJ/+JXQYL@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X/ysA8PuJ/+JXQYL@sol.localdomain>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=Ubgvt5aN c=1 sm=1 tr=0 cx=a_idp_d
 a=+wqVUQIkAh0lLYI+QRsciw==:117 a=+wqVUQIkAh0lLYI+QRsciw==:17
 a=kj9zAlcOel0A:10 a=EmqxpYm9HcoA:10 a=7-415B0cAAAA:8
 a=joOgMYZwUYIHNJ8tGMoA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fromorbit.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Headers-End: 1kzCRg-002seT-Rj
Subject: Re: [f2fs-dev] [PATCH v2 04/12] fat: only specify I_DIRTY_TIME when
 needed in fat_update_time()
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 11, 2021 at 11:50:27AM -0800, Eric Biggers wrote:
> On Mon, Jan 11, 2021 at 11:52:01AM +0100, Christoph Hellwig wrote:
> > On Fri, Jan 08, 2021 at 11:58:55PM -0800, Eric Biggers wrote:
> > > +	if ((flags & S_VERSION) && inode_maybe_inc_iversion(inode, false))
> > > +		dirty_flags |= I_DIRTY_SYNC;
> > 
> > fat does not support i_version updates, so this bit can be skipped.
> 
> Is that really the case?  Any filesystem (including fat) can be mounted with
> "iversion", which causes SB_I_VERSION to be set.

That's a bug. Filesystems taht don't support persistent i_version on
disk need to clear SB_I_VERSION in their mount and remount paths
because the VFS iversion mount option was a complete screwup from
the start.

> A lot of filesystems (including fat) don't store i_version to disk, but it looks
> like it will still get updated in-memory.  Could anything be relying on that?

If they do, then they are broken by definition. i_version as
reported to observers is defined as monotonically increasing with
every change to the inode. i.e. it never goes backwards. Which, of
course, it will do if you crash or even just unmount/mount a
filesystem that doesn't persist it.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
