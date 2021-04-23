Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB13536A7B5
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Apr 2021 16:12:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lafV3-0006Us-GD; Sun, 25 Apr 2021 14:12:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1lafSC-00063t-Od
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 25 Apr 2021 14:09:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0RWHCLM3/c6H7Z+k5OkW53M3PGgAByaiGpKPD3i08lU=; b=hq4f/QMaUCennVn5O6HacG99a/
 6X4WHCoMSP8gsfGwXVV7lFvOe5G2VROhVxbNMlnX6qx6fdtV10c2h8+QxakKn5tQpYRrUsd30lwUu
 Oc79p+x7W5q8h39e1Q4R1hYa6eAv101/jun1sdbS5C2WbOvpVFfeFHPNmXhMRduNKITM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0RWHCLM3/c6H7Z+k5OkW53M3PGgAByaiGpKPD3i08lU=; b=lcxqwUililSK53aGboLFY2quOA
 +QA5+dnt7zEXnRP8EtO/w+hqlkgKjaIlKJnnEHb3q3UoElKdGuiiklK6VhLsiTb+/xP/Rd4maJAEA
 Xxw7qmVkBUupSgJ524zGVXQMJPliP5jNh60IXBW4gXFXQaTqv0K7ULS0jM2heSGdBspM=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lafS6-0007QB-BR
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 25 Apr 2021 14:09:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0RWHCLM3/c6H7Z+k5OkW53M3PGgAByaiGpKPD3i08lU=; b=hp8p+Z8DNn1ZurqXmgj2wcS+eL
 rJTz5xXktIyXySN7NXjYlkC3CaxpMHTDnvl0WySOWRASZ/2hQwb3FSRFd+IC7CdooqCKKIQanortM
 M03aHr+F8Y2h/0tKuCSOOisyBXTJ8RJbnT2LTw3CO2+q8wng0SGU1SbYtPMN6dfVL90vHtFcYOTnN
 r39G7yPrxoFM82lg9bY1SzQXwf26JkjX78Y6tOCl739/tP7daK4bgbvDKnWwWwGSJ7VaVSSKajec/
 wSQyinWy5Nir/Utxh+PzZtksMDvn5wT3zIYm3ihveI6NJ9RK1v6Nm5o0Ash0JG/rUQlI5NoZQi+bJ
 F18mbw0A==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1la5aP-002WUO-SQ; Fri, 23 Apr 2021 23:51:55 +0000
Date: Sat, 24 Apr 2021 00:51:49 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20210423235149.GE235567@casper.infradead.org>
References: <20210423171010.12-1-jack@suse.cz>
 <20210423220751.GB63242@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423220751.GB63242@dread.disaster.area>
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
X-Headers-End: 1lafS6-0007QB-BR
Subject: Re: [f2fs-dev] [PATCH 0/12 v4] fs: Hole punch vs page cache filling
 races
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
 Jan Kara <jack@suse.cz>, "Darrick J. Wong" <darrick.wong@oracle.com>,
 Jeff Layton <jlayton@kernel.org>, linux-ext4@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>, Hugh Dickins <hughd@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Miklos Szeredi <miklos@szeredi.hu>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-fsdevel@vger.kernel.org,
 Ted Tso <tytso@mit.edu>, ceph-devel@vger.kernel.org,
 Johannes Thumshirn <jth@kernel.org>, Steve French <sfrench@samba.org>,
 linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Apr 24, 2021 at 08:07:51AM +1000, Dave Chinner wrote:
> I've got to spend time now reconstructing the patchset into a single
> series because the delivery has been spread across three different
> mailing lists and so hit 3 different procmail filters.  I'll comment
> on the patches once I've reconstructed the series and read through
> it as a whole...

$ b4 mbox 20210423171010.12-1-jack@suse.cz
Looking up https://lore.kernel.org/r/20210423171010.12-1-jack%40suse.cz
Grabbing thread from lore.kernel.org/ceph-devel
6 messages in the thread
Saved ./20210423171010.12-1-jack@suse.cz.mbx



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
