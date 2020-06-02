Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F08181EB5B2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Jun 2020 08:13:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jg0At-0000jU-47; Tue, 02 Jun 2020 06:13:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1jg0Ar-0000jD-K8
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Jun 2020 06:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l5E5NZTNMXL9LVD1enMFcScM41pW5CGE0GCl7dWtLug=; b=YxqFMWapUlWMLDVhyuXrrD7lZC
 m/Ybuf7p+GzmehFkBGN1fgkj1xKp/Z4bcmdfQHAWE7eEbh6oPXGflIO3WLZio9hqFhUWcldeQ2P5J
 pW8pz8YeS6EPOl04ZRpJDtGBLPm8Lgepvn/v/no+NcYfpvofzLAM3EDv1LI3yepIuzmU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l5E5NZTNMXL9LVD1enMFcScM41pW5CGE0GCl7dWtLug=; b=AK0BL0//FZ3koonq8EIJB42KGX
 U78o0lCbm57deBlvjJoS/9udPGBZIrD2cWPUah6Sw8CEqisHWo3ve0Gl/TgVldLSQZuUKgcN2P3jR
 oZDmXM8/zZhLXAXVtBAdIuLzkmBajONA6CyiOk8yoAPjDtHIdQaQr/X0V5bdlv0wcUSk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jg0Ao-0062hG-SW
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Jun 2020 06:13:21 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A38F5206A2;
 Tue,  2 Jun 2020 06:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591078388;
 bh=rRykBBWnGs96WxsrQLDxmACWOa/UFVBVpsVgwWsmVXk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1Hjjl6n79wTkMOGwUGwEfwwZ3SrDwiog0vc+onIjwGGuMKSzKjJvPZlMTPoeBSV3T
 s00gQNv4yH6M7lX9kvpeFeAHUFFI/guixhK0D6JH5aXOm+zA8naHv9mb1MQJ2Wi8AE
 gcQr/P3/ruI6VfcDbwA53bx45o8NZmrvKj7Cj1H8=
Date: Tue, 2 Jun 2020 08:13:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200602061305.GA2258861@kroah.com>
References: <20200529141100.37519-1-pilgrimtao@gmail.com>
 <c8412d98-0328-0976-e5f9-5beddc148a35@kernel.dk>
 <CAAWJmAZOQQQeNiTr48OSRRdO2pG+q4c=6gjT55CkWC5FN=HXmA@mail.gmail.com>
 <20200601084426.GB1667318@kroah.com>
 <20200602055152.GA11620@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200602055152.GA11620@lst.de>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jg0Ao-0062hG-SW
Subject: Re: [f2fs-dev] [PATCH v2] blkdev: Replace blksize_bits() with
 ilog2()
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
Cc: hoeppner@linux.ibm.com, heiko.carstens@de.ibm.com,
 linux-nvme@lists.infradead.org, dhowells@redhat.com, clm@fb.com,
 deepa.kernel@gmail.com, houtao1@huawei.com, linux-s390@vger.kernel.org,
 Tao pilgrim <pilgrimtao@gmail.com>, darrick.wong@oracle.com,
 Mark Fasheh <mark@fasheh.com>, satyat@google.com, hch@infradead.org,
 borntraeger@de.ibm.com, gor@linux.ibm.com, chaitanya.kulkarni@wdc.com,
 Josef Bacik <josef@toxicpanda.com>, ming.lei@redhat.com, dsterba@suse.com,
 viro@zeniv.linux.org.uk, Muchun Song <songmuchun@bytedance.com>,
 sagi@grimberg.me, jaegeuk@kernel.org, jlbec@evilplan.org, bvanassche@acm.org,
 Jens Axboe <axboe@kernel.dk>, balbi@kernel.org, damien.lemoal@wdc.com,
 martin.petersen@oracle.com, joseph.qi@linux.alibaba.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 asml.silence@gmail.com, linux-btrfs@vger.kernel.org, sth@linux.ibm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 02, 2020 at 07:51:52AM +0200, Christoph Hellwig wrote:
> On Mon, Jun 01, 2020 at 10:44:26AM +0200, Greg KH wrote:
> > But does this code path actually show up anywhere that is actually
> > measurable as mattering?
> > 
> > If so, please show that benchmark results.
> 
> I think the requests are starting to be a bit unreasonable.  Tao is
> replacing a reimplementation of a standard function with that standard
> function / compiler builtin.  We don't put such a high burden on that.

That's fine, but to say it is "faster" usually means we want to see it
actually going faster somehow :)

> And once the proper existing fields are used where possible as shown
> in my reply just replacing the rest seems totally obvious - quite
> contrary I think keeping a reimplementation would need a high bar.

Your patch makes sense, I was not objecting to that.

thanks,

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
