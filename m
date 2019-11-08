Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05273F405F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2019 07:30:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iSxnL-0001NJ-B8; Fri, 08 Nov 2019 06:30:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+829b58a2b74f0bf5023d+5920+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1iSxnJ-0001N8-MM
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 06:30:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aWZaf3HqZ/JVjp4vj9bwLFYZc9GevfueJy1hq0/ses8=; b=RjlweJAvLsKkzoRZneb5RJL0tp
 HOmlnxVZ6g5dFYNOi6z+JSPdo/Q0aqi+sgEdkuuhFB6Qr3HM9XoHE1YBNZTPe/KsnkSDJpNsSg83H
 YZpsAkg5n6+ITF8Pbrmtj0lja0skx5cjzv/GrlYsmT137ysfF37FtGfTWykMxLQqT254=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aWZaf3HqZ/JVjp4vj9bwLFYZc9GevfueJy1hq0/ses8=; b=M55pCfraCCpWYhq1RS7mJAsPj2
 bM6+FW42n1mWiPvs1XckqMAMn+ppqpsbjnTNucB6dxrdYWFbkrMyDMXOMi1sMzDwkyWrfDKWhetNn
 HWIRCFuLjR5P6JJKuEjM9JIQCdMYVd4JUobjsZcVSnwQG606ZWVgTJmo46f5BoMYToUU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iSxnI-0063c0-GW
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 06:30:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aWZaf3HqZ/JVjp4vj9bwLFYZc9GevfueJy1hq0/ses8=; b=gKGF4Jqb9v0nWfPZ304FSdNXn
 5fO4s8QsanogCFw02yqxmezv1coqymvpUJckO9tsrpmbDwHTRJcM3616iGH6Qa4/US2tpM4kfn/Ht
 b0Oadl6dRWz+CZ4OHbuhkRjLJbugl5CRZiYBQtFnf4tSv+IC/qupsA0VjdhJyp6WqDadYgoG2H5YP
 H8WQ8H5GUzON1m4OcBW4GofUzO7zNE/jnasUPvVedIvpDbRjFEwaLjW1kO3wCm8BHdVwBaF1HXfuo
 Op2iuzEAJ62tKbgqMUqJcSkg7bVo5S9q8c7B5nV79GN13jUk0wc7k69rL5RZn5fIoG5xW/6OnoP/f
 VobS2Iq9Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iSxn7-0004jy-91; Fri, 08 Nov 2019 06:30:41 +0000
Date: Thu, 7 Nov 2019 22:30:41 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Message-ID: <20191108063041.GB12413@infradead.org>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
 <20191108015702.233102-5-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191108015702.233102-5-damien.lemoal@wdc.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.3 (/)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iSxnI-0063c0-GW
Subject: Re: [f2fs-dev] [dm-devel] [PATCH 4/9] block: Remove partition
 support for zoned block devices
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
Cc: Jens Axboe <axboe@kernel.dk>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Mike Snitzer <snitzer@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, dm-devel@redhat.com, linux-scsi@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

Note that this has a conflict with my series that cleans up the area
around rescan_partitions, but that series will only get simpler after
this patch is merged.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
