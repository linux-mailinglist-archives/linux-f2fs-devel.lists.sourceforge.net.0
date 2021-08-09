Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C213E410E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Aug 2021 09:47:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mD00i-0000q6-SN; Mon, 09 Aug 2021 07:47:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from
 <BATV+ff0de858b6c5c9366608+6560+infradead.org+hch@casper.srs.infradead.org>)
 id 1mD00g-0000pw-No
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Aug 2021 07:47:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jb846GQsLQ6JzHS8Jls/UR8JEXUrbT6zAPMJ7R/wzS4=; b=kAPFP9X0J4SuUehOC844vx2wWi
 8/zTlVJjZGMjvlPJVZQLyDGNTiLSE2o/Dee8byQm3mqHPm3G7olGbo62K6F3aims2YsFr9EMchluz
 csbB5DXNVjzdV7bGN81kX31/6DwAZlDPmGPV7/Ao4qMrELqf91iMcT399hF/A95zAZls=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jb846GQsLQ6JzHS8Jls/UR8JEXUrbT6zAPMJ7R/wzS4=; b=jaYCB5iB/M3Q4fM0d11XUqv/hH
 1I7qhYjhw+DfCXNLwhMjCZMkN6ABlERZfTom6U24k16RuA7xLNhXqMcZsM/TpcN8p7ZTX1CIFMRNW
 yscuU+QmN80nLxymBn9w8n5cuwXc8LuWJe7LYlGDfDEfMY6ihHEK4x0CKF/ionUzWbMQ=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mD00b-000EAK-VT
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Aug 2021 07:47:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=jb846GQsLQ6JzHS8Jls/UR8JEXUrbT6zAPMJ7R/wzS4=; b=Iq/Cweuh12AVChdQneAHBeYNDK
 C+mKGBK3THrVI0ZBEvS20/P4iemfOJs8bsIyJZ0NasP2w6V6ZuRDkdn5vNZySYC8Z5pPerBkrWwFI
 8mSsCRHYWNNwCQOAyG2c/5z0YGrX3gi6u2FeSJCDXxsgLRkL41Yq2YDq9LKOmkwCRczgoni+xxBBh
 7e4zQBzAdh26izZXi6AUTOEWqZJEWhzwDKnz83gy5NX3gpk+cYYLHQxocYpsvXgY+RUtKg+CYo8tn
 X6eO8dVvU0//0a1aSJPKcu9U21MOyb9m0DjWOeOl17Xvn95zOZAyZ5/IFDjIbhmyleFjXqtv+uTbv
 EobgVvfQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mCzyx-00Alff-UZ; Mon, 09 Aug 2021 07:46:17 +0000
Date: Mon, 9 Aug 2021 08:45:59 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <YRDdN3SEXYIzY7LK@infradead.org>
References: <20210806111857.488705-1-damien.lemoal@wdc.com>
 <20210806111857.488705-4-damien.lemoal@wdc.com>
 <5f2640c5-0712-b822-9ac7-3daa974c0c30@kernel.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5f2640c5-0712-b822-9ac7-3daa974c0c30@kernel.dk>
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
X-Headers-End: 1mD00b-000EAK-VT
Subject: Re: [f2fs-dev] [PATCH v3 3/4] block: rename IOPRIO_BE_NR
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>,
 Paolo Valente <paolo.valente@linaro.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Aug 07, 2021 at 10:16:39AM -0600, Jens Axboe wrote:
> >  /*
> > - * 8 best effort priority levels are supported
> > + * The RT and BE priority classes both support up to 8 priority levels.
> >   */
> > -#define IOPRIO_BE_NR	8
> > +#define IOPRIO_NR_LEVELS	8
> 
> That might not be a good idea, if an application already uses
> IOPRIO_BE_NR...

The constant has not actually been exposed in a uapi header in any
released kernel, so if there is a time to rename it it is now.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
