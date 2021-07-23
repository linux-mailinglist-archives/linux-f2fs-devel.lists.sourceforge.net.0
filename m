Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 000B93D33DC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jul 2021 07:01:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m6nIz-0008Lj-Ot; Fri, 23 Jul 2021 05:01:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from
 <BATV+d1a5770da040865e1867+6543+infradead.org+hch@casper.srs.infradead.org>)
 id 1m6nIi-0008LB-Qe
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 05:00:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4qd4HWfR62CNOrkSwzE6Doa+rbZvUu2MnV3xCDp5M6Y=; b=KvktImnNLwYIdklpONgNVRlGuN
 oslUtJZpjylCYQ5HCaab+qIrpHdVN90LDrWMUKbXThojBilNHEMRfSrZImpFS/GmhYTgdwsqftgUa
 0GT8di33aHXbodRyuKKFYzpN3/ZpYK9Y6VE/3GBiU/QvcO8Y/RJcV4hoPJbZEOXhE7nc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4qd4HWfR62CNOrkSwzE6Doa+rbZvUu2MnV3xCDp5M6Y=; b=klUeB3+iDHla7l+52EQt+l8fiS
 RyFGsX5wjd6wBSZFcLmpz466QNpOhZaBfTS/QE4LQsfIfjBpBoVWrfoebSJAjAbuAsyn6xmJ62mCT
 9+WBvCDF017gYM70iUbOf+ZYMJZNRkpKibGcILabnS2/oBv68EhE46P6/31nH7pKb7m0=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m6nId-00HWcU-JN
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Jul 2021 05:00:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4qd4HWfR62CNOrkSwzE6Doa+rbZvUu2MnV3xCDp5M6Y=; b=orkv4g04AUQYr+HMgYoF/k5xSF
 wIdA3/lfQnnkeZqpQRN75Xh2QRWa0OHn2w5cMNuhefHq2T7eT6wphEyIpPkm8ftUuhv6ygSb2R1nu
 bTMqM/sH5ZEWpdDuXPcgLLCbgsntwtmLFQMWWoTp/P4XgG2tgfE/Q75+yuHf/NVtSuo8EB8QXHC52
 q9xKUGz4TBsm/bxZSshhcrfalVECQxd+P7M5la3+x9/Be4KYvOQxdEpzwa65DFJiSZgUM3o+DXzrQ
 B59eYqiOYgmSVhuHk0X8G55Dc6Pbre/XuAwcW5teQg9aT6V2PleCQHnDUsIBuCt+mL8Cw6LdMX2tC
 tzKVwQBA==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1m6nI3-00B0JI-MH; Fri, 23 Jul 2021 05:00:10 +0000
Date: Fri, 23 Jul 2021 06:00:03 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YPpM09DLTB28obqQ@infradead.org>
References: <20210716143919.44373-1-ebiggers@kernel.org>
 <20210716143919.44373-7-ebiggers@kernel.org>
 <YPU+3inGclUtcSpJ@infradead.org> <YPog4SDY3nNC78sK@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPog4SDY3nNC78sK@sol.localdomain>
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
X-Headers-End: 1m6nId-00HWcU-JN
Subject: Re: [f2fs-dev] [PATCH 6/9] f2fs: implement iomap operations
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
Cc: Satya Tangirala <satyaprateek2357@gmail.com>, linux-xfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 Changheun Lee <nanich.lee@samsung.com>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 22, 2021 at 06:52:33PM -0700, Eric Biggers wrote:
> I am trying to do this, but unfortunately I don't see a way to make it work
> correctly in all cases.
> 
> The main problem is that when iomap_dio_rw() returns an error (other than
> -EIOCBQUEUED), there is no way to know whether ->end_io() has been called or
> not.  This is because iomap_dio_rw() can fail either early, before "starting"
> the I/O (in which case ->end_io() won't have been called), or later, after
> "starting" the I/O (in which case ->end_io() will have been called).  Note that
> this can't be worked around by checking whether the iov_iter has been advanced
> or not, since a failure could occur between "starting" the I/O and the iov_iter
> being advanced for the first time.
> 
> Would you be receptive to adding a ->begin_io() callback to struct iomap_dio_ops
> in order to allow filesystems to maintain counters like this?

I think we can triviall fix this by using the slightly lower level
__iomap_dio_rw API.  Incremental patch to my previous one below:

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 4fed90cc1462..11844bd0cb7a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4243,6 +4243,7 @@ static ssize_t f2fs_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 	const loff_t pos = iocb->ki_pos;
 	const size_t count = iov_iter_count(to);
+	struct iomap_dio *dio;
 	ssize_t ret;
 
 	if (count == 0)
@@ -4260,8 +4261,13 @@ static ssize_t f2fs_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	}
 
 	inc_page_count(F2FS_I_SB(inode), F2FS_DIO_READ);
-	ret = iomap_dio_rw(iocb, to, &f2fs_iomap_ops, &f2fs_iomap_dio_ops, 0);
-
+	dio = __iomap_dio_rw(iocb, to, &f2fs_iomap_ops, &f2fs_iomap_dio_ops, 0);
+	if (IS_ERR_OR_NULL(dio)) {
+		dec_page_count(F2FS_I_SB(inode), F2FS_DIO_READ);
+		ret = PTR_ERR_OR_ZERO(dio);
+	} else {
+		ret = iomap_dio_complete(dio);
+	}
 	up_read(&fi->i_gc_rwsem[READ]);
 
 	file_accessed(file);
@@ -4271,8 +4277,6 @@ static ssize_t f2fs_dio_read_iter(struct kiocb *iocb, struct iov_iter *to)
 	else if (ret == -EIOCBQUEUED)
 		f2fs_update_iostat(F2FS_I_SB(inode), APP_DIRECT_READ_IO,
 				   count - iov_iter_count(to));
-	else
-		dec_page_count(F2FS_I_SB(inode), F2FS_DIO_READ);
 out:
 	trace_f2fs_direct_IO_exit(inode, pos, count, READ, ret);
 	return ret;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
