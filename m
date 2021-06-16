Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D31EB3A912A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Jun 2021 07:32:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ltO9t-0006Di-SF; Wed, 16 Jun 2021 05:32:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+ae8989e1668f84a74d37+6506+infradead.org+hch@casper.srs.infradead.org>)
 id 1ltO9r-0006DZ-2x
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Jun 2021 05:32:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t++zkK6+3jhlyv3CdaWkO1s/YSSZiDhwUfUI7hox61M=; b=NEFQy3I8L7uDhV1LQmwwLix/i9
 3g+5a/fD8vU0YYgVnV8f9kD9PZXOdvpocAMQF/rvQ4sS4AdJtFqda+1EUa1zQM9sxVJdYjxvcbXIL
 9xc8NFuDwoE21T3k7ET+djSD2TKpzlEz35kehzXlRr4xT9L7qX8ztPyL6E29Rb/w4txU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t++zkK6+3jhlyv3CdaWkO1s/YSSZiDhwUfUI7hox61M=; b=mGdLAprDRIGTq4yvOtLuPfWLqi
 O7svMOzQHuEdXA+xK+vUpurDrvdEDZu+Bgx2aajNqXw9s3e84zC/oJ+q1PMr18r+Ae00ZegmgTj5v
 HjGpn3wLDLRVMO0KYxnjUwzqbWS9oIAP+Sf3nGlZMGTIloAfE44l0fVrSBoY3to4aYm0=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1ltO9i-0007o8-2F
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Jun 2021 05:32:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=t++zkK6+3jhlyv3CdaWkO1s/YSSZiDhwUfUI7hox61M=; b=L51zmJv2LnWVezREZ5qO4Sb4wj
 hCkTE/m0QqQeN/5fgrUDw/vgFNIIeg8Tim3ewCdoojjCilGOiOR8c57029dd+orJh4t/rmvG+zR/a
 UHO8a7GTTdjaSw/kYKR/waNT0IQxcbOBjD41L++7qEygfR8I4on7v/P+EaeWtR63wtcqY1TO2xSjQ
 9P8FymJ5aMKYu9uPSQ7YvWMS45J/3ptspKhWI6C9d9j4lZ0Xa63qEj+Ap3dUQFJO2ltsaz2mqEU3D
 iiFAOfRtA97vNbBHFBSJkoX95S7mAUqFyCzG8TXG+C1sA44zQbHJcvdjyoMdBgCBcGaMbTYHXu6FM
 EEVq3gEA==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1ltO8n-007dWP-Eq; Wed, 16 Jun 2021 05:31:07 +0000
Date: Wed, 16 Jun 2021 06:31:05 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <YMmMmdWGDQvkggf0@infradead.org>
References: <20210615090844.6045-1-jack@suse.cz>
 <20210615091814.28626-2-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210615091814.28626-2-jack@suse.cz>
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
X-Headers-End: 1ltO9i-0007o8-2F
Subject: Re: [f2fs-dev] [PATCH 02/14] documentation: Sync file_operations
 members with reality
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

On Tue, Jun 15, 2021 at 11:17:52AM +0200, Jan Kara wrote:
> Sync listing of struct file_operations members with the real one in
> fs.h.

Looks fine:

Reviewed-by: Christoph Hellwig <hch@lst.de>

But I wonder if we could just move the locking documentation into the
header itself using kerneldoc annotation to avoid all this syncing..


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
