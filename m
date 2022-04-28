Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19823513E4A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Apr 2022 00:07:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nkCI2-0004D3-UX; Thu, 28 Apr 2022 22:07:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mcgrof@infradead.org>) id 1nkCI1-0004Cw-Ox
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Apr 2022 22:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9v/jwR+R8u87FL4qORMMhnuwU+FONow5gj9ZK60JlpI=; b=k9SSt4iIy0mMMVIdwM1jFvzWzA
 yN3XGFWh9hmVSZ78z9YulQ8z44Hog5JH3HWdeay8SDt3YdjD477ASpOzlJzo9EnWJiCbfz/mfh6jJ
 3ZbxUh41R99qUDiKs+8hA/kCbUbb8lUCe/UPDYKeoyJHixiO7MDkB1MhZQ38w1prcX1w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9v/jwR+R8u87FL4qORMMhnuwU+FONow5gj9ZK60JlpI=; b=EFu48fKNyyV0hzHbYBei69TZJ+
 s0v14Nd+825PUzod0+J+97/XQPYaKThKK5xKgpR4Q91v80tDVIlNb6T+SxxUAZRucn+OMb4e32nWS
 1ipJ30y2WH0DDiMSWJnQfZD4fTl34z8z6a9hsDaf9IPPnU6+QwR1V38rkMfcXb4rIBFg=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nkCHy-0005Ys-Cj
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Apr 2022 22:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9v/jwR+R8u87FL4qORMMhnuwU+FONow5gj9ZK60JlpI=; b=s7tZJeCHXPydeNyzQuN8NsfxgP
 eu4k6UGhsVLB00xCdra8ScX0cG22vl4diUOaGh9FKdX7ZbDm54F7Sz0V6dDshrJNi6/wT9TaTLE7L
 4lziHtohweA2A/pEGRkEQA/vjgE7pbVRnrWniCsX9yEkpQ2hMs2CWXd+7aGj4ahpDbzBv+jVDj0ap
 JdQw0FhqNuU0KC9UTqrHuy4JXz7tHdwXRx/xwjjzvCWyXUc2CceR12Gm2rzyMoXNmRGC7jZDfM/Sd
 fASKdOUqjIoKv+PaYoM25kjeVCygCtv96ptD2wNPrJ0lPiZpRzZ7Jn+O1gxO1aN3k4eGnAkBe8P/F
 +J/VDTRA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1nkCHX-008hOx-BO; Thu, 28 Apr 2022 22:06:39 +0000
Date: Thu, 28 Apr 2022 15:06:39 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Message-ID: <YmsP7wQAyDx9g8gy@bombadil.infradead.org>
References: <20220427160255.300418-1-p.raghav@samsung.com>
 <CGME20220427160313eucas1p1feecf74ec15c8c3d9250444710fd1676@eucas1p1.samsung.com>
 <20220427160255.300418-17-p.raghav@samsung.com>
 <2ffc46c7-945f-ba26-90db-737fccd74fdf@opensource.wdc.com>
 <YmrQFu9EbMmrL2Ys@bombadil.infradead.org>
 <ce56cb7d-f184-aad1-4935-5f622e7afe5d@opensource.wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce56cb7d-f184-aad1-4935-5f622e7afe5d@opensource.wdc.com>
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Apr 29, 2022 at 06:43:58AM +0900,
 Damien Le Moal wrote:
 > On 4/29/22 02:34, Luis Chamberlain wrote: > > One step at a time. > > Yes,
 in general, I agree. But in this case, that will create ker [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1nkCHy-0005Ys-Cj
Subject: Re: [f2fs-dev] [PATCH 16/16] dm-zoned: ensure only power of 2 zone
 sizes are allowed
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
Cc: jiangbo.365@bytedance.com, linux-nvme@lists.infradead.org, clm@fb.com,
 dm-devel@redhat.com, hch@lst.de, agk@redhat.com, naohiro.aota@wdc.com,
 sagi@grimberg.me, gost.dev@samsung.com, jonathan.derrick@linux.dev,
 Pankaj Raghav <p.raghav@samsung.com>, kch@nvidia.com, snitzer@kernel.org,
 josef@toxicpanda.com, linux-block@vger.kernel.org, dsterba@suse.com,
 kbusch@kernel.org, jaegeuk@kernel.org, matias.bjorling@wdc.com,
 bvanassche@acm.org, axboe@kernel.dk, johannes.thumshirn@wdc.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Apr 29, 2022 at 06:43:58AM +0900, Damien Le Moal wrote:
> On 4/29/22 02:34, Luis Chamberlain wrote:
> > One step at a time.
> 
> Yes, in general, I agree. But in this case, that will create kernel
> versions that end up having partial support for zoned drives. Not ideal to
> say the least. So if the patches are not that big, I would rather like to
> see everything go into a single release.

This would have delayed the patches more, and I see no rush for npo2 to
use dm-zoned really. Just as with f2fs, we can take priorities at a
time.

  Luis


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
