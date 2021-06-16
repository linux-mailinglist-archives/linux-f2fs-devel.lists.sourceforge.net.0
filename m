Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEB53A9146
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Jun 2021 07:37:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ltOFQ-0006yx-Ac; Wed, 16 Jun 2021 05:37:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from
 <BATV+ae8989e1668f84a74d37+6506+infradead.org+hch@casper.srs.infradead.org>)
 id 1ltOFO-0006yq-9A
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Jun 2021 05:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XWnWDvKJzRqZbbua9HZlINwmc4WRunOl2lkBSeIoZuY=; b=N1mAWYxHSv8QR1yyUzDDH+Z3V6
 lNm7vwduBaXety5x2YHIgWx8X1/O5SDO0Guri+GucaUIfU0BCddU1hqMXGu/wuNrYT8N02cepHs/U
 oQp5l17YwpzrUi6CLtzpV6RwVH43Suucl01Epeyw/kvSNyISfs4at6CN4abDukRefi/Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XWnWDvKJzRqZbbua9HZlINwmc4WRunOl2lkBSeIoZuY=; b=UYF4QsMezCjweT+msxep7nEMaU
 lo+1yZj6uQP36oDxPh35ct4RHqsMF4whWYhfDh8N3kIrGJ5eYk4OQcNO6VM3p7qWLfXOEwp2PoWLD
 5x4LBqKEzvQE+nnSkJG2OUd4AAwqrMIJ/5EYSlPR5dHmjYLYEBg88kA7TrjnZm8dWjds=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1ltOFO-00BkHa-QX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Jun 2021 05:37:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=XWnWDvKJzRqZbbua9HZlINwmc4WRunOl2lkBSeIoZuY=; b=ahOIfpzE7hV8/mxMQnmQhY4hHQ
 vG9uO31rLRo5gypfUe2hhoZnyQUQFUkp1djqBZ5GTRSkbWp0FWpEkDBekWLoaxQCTDR2tYRJgLVzf
 SQXOHNmdHH6pOkB9YDa7i3NKcdcYLJMLbY9Q19m6k+cIj9UUYs46aq+Up/6M9MJ3Va+5292BL6sx0
 8Ha71Mr+CDDM0VeY+qwiz56e9Bzcyrl8zVnwQBemy0d4xWqTwm6WEKAdZtdUvLAx0v0rJy4hPEWg4
 x3nJ0CTUpjMIjnfTKsIdFNCm53lmpASkZEDVTWyB1FgxWDywo0RpQO8Fu9DVOzJmeJuYUABuwl6xm
 +W0YgeQg==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1ltOEi-007dwi-Jh; Wed, 16 Jun 2021 05:37:14 +0000
Date: Wed, 16 Jun 2021 06:37:12 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <YMmOCK4wHc9lerEc@infradead.org>
References: <20210615090844.6045-1-jack@suse.cz>
 <20210615091814.28626-7-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210615091814.28626-7-jack@suse.cz>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ltOFO-00BkHa-QX
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

On Tue, Jun 15, 2021 at 11:17:57AM +0200, Jan Kara wrote:
> From: Pavel Reichl <preichl@redhat.com>
> 
> Refactor xfs_isilocked() to use newly introduced __xfs_rwsem_islocked().
> __xfs_rwsem_islocked() is a helper function which encapsulates checking
> state of rw_semaphores hold by inode.

__xfs_rwsem_islocked doesn't seem to actually existing in any tree I
checked yet?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
