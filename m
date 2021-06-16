Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 608BF3A913A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Jun 2021 07:35:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ltODE-0006Ug-Bb; Wed, 16 Jun 2021 05:35:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+ae8989e1668f84a74d37+6506+infradead.org+hch@casper.srs.infradead.org>)
 id 1ltODC-0006UZ-TV
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Jun 2021 05:35:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7WM3/Dl0NMSgUE40lDfACWPmQcemQr14B5cKG1DML9I=; b=jXRzY1yyD3HqGXzfnb91KeFQ7o
 DBLajGeuGroscr5/cfG6ldZlgcXmiM5AcJX+89QwpE6RsMlsQtwM/qyC+HJGRVQzj3ekTCJd8c/55
 CffTbxy5vkbGj4LLlY9MtBnnU9dnjwiXebkYWyG8Bf7nduklJhrsxw7T4sHsoKy/QGcw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7WM3/Dl0NMSgUE40lDfACWPmQcemQr14B5cKG1DML9I=; b=U4Bh49ijOlb7ANguRPTgmFhkS8
 TMZKJ7t9Q7EPUlRpQ94jtRcaWpbwMsVmzyRj4j1sA5kIYW/13fnh/Z7NfYohDEj2CYOheitJylw83
 oKMbq0qdBV9VHDo0NI6mRAOVZbbBOm2hwfu6KGPbg6Zv6QYfmmSag9K9iGN54OktpAnY=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1ltODC-00Bk8b-W2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Jun 2021 05:35:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7WM3/Dl0NMSgUE40lDfACWPmQcemQr14B5cKG1DML9I=; b=PMuF+TdHs0agnUqrOQZCxPj6T+
 lVwXYf9rLAbSwsG85Ls5HxfIuoGQuZlm2QLmcdi9ZtRz4aX6NT6JGu9D8Nyc/TT/AsEg3ID7X3nGw
 9VfY5SBlnnrUf/EBA5kFXdr+qGVdZqkDYVMVKk1vI/OQQWuxIwYBiI7GgK2Z4/xX2UySlnfSfgAsb
 Li3RgEp5YQzf8SO9YERFrETk6zGL7h5xz8lVuhXtERykXe9W0C8HbUJKTQRMRCK1foHibkO1RQLYd
 PHBubU9QiolCcmrKOoAWyHLiGSCbgv+CJbR5XsrRDEkJ6Y/HODyfpMrVR6AdO1tD5yyGFKtQb80nc
 /4X6sKOQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1ltOC9-007djU-26; Wed, 16 Jun 2021 05:34:39 +0000
Date: Wed, 16 Jun 2021 06:34:33 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <YMmNafE6x/kUbRqL@infradead.org>
References: <20210615090844.6045-1-jack@suse.cz>
 <20210615091814.28626-4-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210615091814.28626-4-jack@suse.cz>
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
X-Headers-End: 1ltODC-00Bk8b-W2
Subject: Re: [f2fs-dev] [PATCH 04/14] mm: Add functions to lock
 invalidate_lock for two mappings
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
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J . Wong" <djwong@kernel.org>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Johannes Thumshirn <jth@kernel.org>,
 linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 15, 2021 at 11:17:54AM +0200, Jan Kara wrote:
> Some operations such as reflinking blocks among files will need to lock
> invalidate_lock for two mappings. Add helper functions to do that.
> 
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> Signed-off-by: Jan Kara <jack@suse.cz>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
