Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3ED3A9156
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Jun 2021 07:40:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ltOHc-0006fX-65; Wed, 16 Jun 2021 05:40:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+ae8989e1668f84a74d37+6506+infradead.org+hch@casper.srs.infradead.org>)
 id 1ltOHb-0006fM-E1
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Jun 2021 05:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xk06EVl9lp5HJyBNJxkI+EUAZw3CkFLgV9O5fKQUSsQ=; b=bNZI4ZQ71s2th5rwMRdADZAASd
 XdHZvnV8fpjq8SGTqgqqjw/fltfRWsyPcnOtf4L438N3b9WS5m6eOFryQF55cGiPeDIvgPWd6R7Tx
 mkg8XbhqNCa9MiA23ebSS8JlC7jsj6v6VSjSLjAPdUbXnEPHzs5U7y35pPcNA/assB2s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xk06EVl9lp5HJyBNJxkI+EUAZw3CkFLgV9O5fKQUSsQ=; b=K8PJYoQZTCep/+9VYHVeAON/OM
 3uvWg4wM1+WP4GtGjqzEwoXNndHFGUtFb2NwqYI7a3h5be/Toc4LDmNA5BhDy4anbNPWhUsYXENL/
 a9AOe7Qp/6Y+UrMe3GlDFybh7x9rcXfdW8yAEWX3YBLCuJYLXzTBaFdw+UyTXSVVtBkA=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1ltOHa-00BkUw-8I
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Jun 2021 05:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Xk06EVl9lp5HJyBNJxkI+EUAZw3CkFLgV9O5fKQUSsQ=; b=e49zW+xtSoJvTBSrAZ30aMVlIu
 2W2x8ol+U4HkkO8pZe/UMYZBMSzfxACSfluW8kQonKmK/JH64nS/ZFnbeC5TSQqlOfrdw7sG7kX7Y
 OX7KDbfl0HM48rIFpWqJjq/W1Ua/Q6lLO8vK06Kef/WdJYe1PbvsAXAYTHDH9tKpyxpEnXLj4r+II
 7Wvlsa8BClOU5KzSSKK0IRGsabUWpkYqV5dHb0dq2NzxFTzzA2hZ+QuO75LJ/Ut4+LaJIhwAyGgvX
 EqNEBvW7ei1f2e1V3mfaVq3MYOk3keHYVR2I+cnKOjJkWJNmG6CvUbvDkGTL4VdLMYmTQjvkYfDWg
 r6KiHf5w==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1ltOGf-007e5R-SF; Wed, 16 Jun 2021 05:39:18 +0000
Date: Wed, 16 Jun 2021 06:39:13 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <YMmOgeU7Ionnk0/D@infradead.org>
References: <20210615090844.6045-1-jack@suse.cz>
 <20210615091814.28626-10-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210615091814.28626-10-jack@suse.cz>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ltOHa-00BkUw-8I
Subject: Re: [f2fs-dev] [PATCH 10/14] zonefs: Convert to using
 invalidate_lock
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
 Miklos Szeredi <miklos@szeredi.hu>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Johannes Thumshirn <jth@kernel.org>, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 15, 2021 at 11:18:00AM +0200, Jan Kara wrote:
> Use invalidate_lock instead of zonefs' private i_mmap_sem. The intended
> purpose is exactly the same.
> 
> CC: Damien Le Moal <damien.lemoal@wdc.com>
> CC: Johannes Thumshirn <jth@kernel.org>
> CC: <linux-fsdevel@vger.kernel.org>
> Acked-by: Damien Le Moal <damien.lemoal@wdc.com>
> Signed-off-by: Jan Kara <jack@suse.cz>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
