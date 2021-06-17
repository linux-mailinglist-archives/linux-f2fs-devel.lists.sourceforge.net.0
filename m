Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 026F93AAF2D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Jun 2021 10:55:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ltnoW-0000o3-3f; Thu, 17 Jun 2021 08:55:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+2d022fe3f734549d7e41+6507+infradead.org+hch@casper.srs.infradead.org>)
 id 1ltnoU-0000nc-9S
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Jun 2021 08:55:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7kLQp6MYKDk8/sAaxwp980AGLDLmbDndmOr3pBheMP8=; b=BNVNKPaeLkpdCKprdLzCQoyVc7
 ppCMtHgied1LreFfRFXpXwaAepe6nqalemkNkaaAshouqFNJzUGgDf3ZWHd5GFBUXlc2Zy5LI7a9h
 TdPPR4yyyHYJZBqDSoZWUxJ83O1fwH6AwuwzWk742QpAz90kTtZp1YDlhMqKmtBV3Zzg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7kLQp6MYKDk8/sAaxwp980AGLDLmbDndmOr3pBheMP8=; b=AftQGU0VJCrfqxAsW0C/3QG9k4
 Kh38DwgX1Ay3ejDTWuqCYg/pwiJziOcwIF1j5PotpKS2mH5jeA0PhHzMsxU0d/P1Qz0q0twF44Oem
 EjNs7UnwOblCoUGz4oIDzBSjCLKwBTlgpoRvBF7h5XpGigL6IoTyUmEcEdy8hzwMdpSU=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1ltnoQ-00DToN-EM
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Jun 2021 08:55:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7kLQp6MYKDk8/sAaxwp980AGLDLmbDndmOr3pBheMP8=; b=s8gPNuR5E60SDx/0jvFuG+ztKT
 LhkO7ekXck3IFxpaFRh0aXcx68zPSCb9j8qEojrfsBzB458A8Wpo3blG/4i9Fgwvbw3TjTMpCRW59
 VDdK549e9Uj+LlQ4b0QFL2VyktYjZNBGvUW6vlpaztsCzTyyYhazCPnhn1tUZ5f4pnweFZ+zoTfcW
 vi3pQgHb9r1oipRjtDslyHYP3KK6c5uEA0YJ0qhlIfuVzu7oTLsvgGpZktf1hxdc8y2w+1WnpyYtm
 5hFg7oBbDir+o13KteeAI+h/AHOcmJHO7kEJdITTE4WSd+WSgTmHe3mKfyx7gYxOZETR30oq6EHa1
 6BJ7DQog==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1ltnnN-008wOt-0k; Thu, 17 Jun 2021 08:54:45 +0000
Date: Thu, 17 Jun 2021 09:54:41 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <YMsN0beVOAXn0Mx4@infradead.org>
References: <20210615090844.6045-1-jack@suse.cz>
 <20210615091814.28626-7-jack@suse.cz>
 <YMr/eA3Eq2u6yUNw@infradead.org>
 <20210617085319.GD32587@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210617085319.GD32587@quack2.suse.cz>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ltnoQ-00DToN-EM
Subject: Re: [f2fs-dev] [PATCH 07/14] xfs: Refactor xfs_isilocked()
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
Cc: Dave Chinner <david@fromorbit.com>, linux-mm@kvack.org,
 linux-cifs@vger.kernel.org, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>,
 linux-ext4@vger.kernel.org, Eric Sandeen <sandeen@redhat.com>,
 Dave Chinner <dchinner@redhat.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, linux-xfs@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>, Ted Tso <tytso@mit.edu>,
 Miklos Szeredi <miklos@szeredi.hu>, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 linux-fsdevel@vger.kernel.org, Pavel Reichl <preichl@redhat.com>,
 Johannes Thumshirn <jth@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 17, 2021 at 10:53:19AM +0200, Jan Kara wrote:
> On Thu 17-06-21 08:53:28, Christoph Hellwig wrote:
> > On Tue, Jun 15, 2021 at 11:17:57AM +0200, Jan Kara wrote:
> > > From: Pavel Reichl <preichl@redhat.com>
> > > 
> > > Refactor xfs_isilocked() to use newly introduced __xfs_rwsem_islocked().
> > > __xfs_rwsem_islocked() is a helper function which encapsulates checking
> > > state of rw_semaphores hold by inode.
> > 
> > Looks good with the updated commit log:
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> I suppose you mean Reviewed-by, don't you?

Yes:

Reviewed-by: Christoph Hellwig <hch@lst.de>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
