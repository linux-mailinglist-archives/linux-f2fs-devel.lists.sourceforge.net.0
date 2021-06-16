Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF823A914C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Jun 2021 07:39:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ltOGr-0006ch-UN; Wed, 16 Jun 2021 05:39:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+ae8989e1668f84a74d37+6506+infradead.org+hch@casper.srs.infradead.org>)
 id 1ltOGi-0006cH-Ab
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Jun 2021 05:39:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i6Te121nsbASjm5MP8RDzAtp9SFu5KeY0UqFquXM9wo=; b=lofGr4v+25ylCT+fV2yVSGYFcG
 SrFUyAJu+L079UNzJqxUteWeIHPgUdCUWvSNerjac7nfbhPLrGf0hcQnYOEXgDa2ZdCQ713P4SpX+
 HCzCfPiMlDjcxtl1tQfhlKEYaXsLcBkXGwtEm+p0TEqkGW4BBntbHyo/y/4tO17WCiSw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i6Te121nsbASjm5MP8RDzAtp9SFu5KeY0UqFquXM9wo=; b=kft3lJBReQHiuB93/mkz9IhL7t
 Ijhs9Is7jp9LnkvpzO5+Jq6/wsMIFNPRzANZQq9vwZDuEHqzNyLKAkyoRY9/a6/4YHpHpVVtnnkZL
 /hTvOJM61mvzrCwa9iXDeB1k7mhjSa+OtXruAutDP1VC2Pg7fgTVc8IboqR+Cuywn0rM=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1ltOGd-0008O1-V7
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Jun 2021 05:39:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=i6Te121nsbASjm5MP8RDzAtp9SFu5KeY0UqFquXM9wo=; b=rbOxO1z7VyYAhtsj0d8YPyVLvX
 2b8Vyz7JNNOwBXWgCtSk3tgrMbQ/QC6cxA5fq7aQjdllRezVEGC+SDDNNXGeT3M+Gwx9D4oG/9XHy
 neZSiCMSbujw7lF2Fruj6EygGNzeK2Bd67SXBjir21DbZhpfx+xvP+r6gaomB7iJpgN0qQLLzawb3
 qzKWxtm6Wb1ppZxg00KKTx6FAfwV/m5QKO/Q5FdlgGZEyj08Hs8K/yP7+SUCt8KP4ewHUEW4DzW21
 RKi7y8jkyMOCZ+YwWFHK03dfDmwzKqFTWKwoKH1VJoE4E3zgQ7hE8m0NK0zkgq3je86CxD41eol8e
 iEnX/FOA==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1ltOFt-007e1r-NG; Wed, 16 Jun 2021 05:38:28 +0000
Date: Wed, 16 Jun 2021 06:38:25 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <YMmOUXSKfAWSwRFM@infradead.org>
References: <20210615090844.6045-1-jack@suse.cz>
 <20210615091814.28626-9-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210615091814.28626-9-jack@suse.cz>
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
X-Headers-End: 1ltOGd-0008O1-V7
Subject: Re: [f2fs-dev] [PATCH 09/14] xfs: Convert double locking of
 MMAPLOCK to use VFS helpers
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
Cc: linux-cifs@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-ext4@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Steve French <sfrench@samba.org>, Dave Chinner <david@fromorbit.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 15, 2021 at 11:17:59AM +0200, Jan Kara wrote:
> Convert places in XFS that take MMAPLOCK for two inodes to use helper
> VFS provides for it (filemap_invalidate_down_write_two()). Note that
> this changes lock ordering for MMAPLOCK from inode number based ordering
> to pointer based ordering VFS generally uses.

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
