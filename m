Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 817861EA042
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jun 2020 10:44:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jfg3s-0008AE-J1; Mon, 01 Jun 2020 08:44:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1jfg3q-00089X-T2
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jun 2020 08:44:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LUeDKl9lu4Ts/3E6O2r0fpaff2XnrGzDNWCZFZrIToY=; b=RrzgWRJZ9JuMDwqZIbsttKu5b1
 05PuF4oYYUDvXhMgplz8briMy/Ss1C7ZchmQUFXFmcP6Zb8UDSkHdRjfkv+jrxykj67R/XwrIiiwE
 HfQVchqmdNom+kWpyrhcA7hr1ab0GzSFGygmYtWKM9mkGIH433fgX8n4WrlH2Wa2EqAk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LUeDKl9lu4Ts/3E6O2r0fpaff2XnrGzDNWCZFZrIToY=; b=PQ8eTfOl5I8/VzCPge8yncXO+y
 8EpbZyHHuaIqc5X6Gybfv5W5S2lOu2ZacDQcodqzz5ho4oDKMoR82UoxL4ka6QFRPM10dbb6BO1Kq
 KTXs6qLTEzhg2S761T05s1Ha3mQtVVIce0g4/xF9pIlGnlbeDrJ2i3YgPRifS6PD0BQ8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jfg3k-006MCS-Td
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jun 2020 08:44:46 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B0D94206E2;
 Mon,  1 Jun 2020 08:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591001068;
 bh=++2cB/ePJhne1YRp0fru1zBYoji5d1nprT5N9O4udpk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wVfow37nJUctQuczEjtuvdKVbO338MPrWmtxn6qzZZHMLNELwOQlIvzJoFUuF/1kq
 q5DWi1Wf0naUXbCdA1uSgSP2CWJRK7dS8k1Y+Djaw8xRkHX+tVonEUHstDVdezlly+
 CKUb/UU3oTLuSzgUFnUcgt1pHUYemwJpSNjNMHJk=
Date: Mon, 1 Jun 2020 10:44:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tao pilgrim <pilgrimtao@gmail.com>
Message-ID: <20200601084426.GB1667318@kroah.com>
References: <20200529141100.37519-1-pilgrimtao@gmail.com>
 <c8412d98-0328-0976-e5f9-5beddc148a35@kernel.dk>
 <CAAWJmAZOQQQeNiTr48OSRRdO2pG+q4c=6gjT55CkWC5FN=HXmA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAWJmAZOQQQeNiTr48OSRRdO2pG+q4c=6gjT55CkWC5FN=HXmA@mail.gmail.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: kernel.dk]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jfg3k-006MCS-Td
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
 deepa.kernel@gmail.com, houtao1@huawei.com, hch@lst.de,
 linux-s390@vger.kernel.org, bvanassche@acm.org, darrick.wong@oracle.com,
 Mark Fasheh <mark@fasheh.com>, satyat@google.com, hch@infradead.org,
 borntraeger@de.ibm.com, gor@linux.ibm.com, chaitanya.kulkarni@wdc.com,
 Josef Bacik <josef@toxicpanda.com>, ming.lei@redhat.com,
 viro@zeniv.linux.org.uk, Muchun Song <songmuchun@bytedance.com>,
 dsterba@suse.com, jaegeuk@kernel.org, jlbec@evilplan.org, sagi@grimberg.me,
 Jens Axboe <axboe@kernel.dk>, balbi@kernel.org, damien.lemoal@wdc.com,
 martin.petersen@oracle.com, joseph.qi@linux.alibaba.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 asml.silence@gmail.com, linux-btrfs@vger.kernel.org, sth@linux.ibm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 01, 2020 at 03:22:01PM +0800, Tao pilgrim wrote:
> On Fri, May 29, 2020 at 10:13 PM Jens Axboe <axboe@kernel.dk> wrote:
> >
> > On 5/29/20 8:11 AM, Kaitao Cheng wrote:
> > > There is a function named ilog2() exist which can replace blksize.
> > > The generated code will be shorter and more efficient on some
> > > architecture, such as arm64. And ilog2() can be optimized according
> > > to different architecture.
> >
> > When you posted this last time, I said:
> >
> > "I like the simplification, but do you have any results to back up
> >  that claim? Is the generated code shorter? Runs faster?"
> >
> 
> Hi  Jens Axboe:
> 
> I did a test on ARM64.
> unsigned int ckt_blksize(int size)
> {
>    return blksize_bits(size);
> }
> unsigned int ckt_ilog2(int size)
> {
>     return ilog2(size);
> }
> 
> When I compiled it into assembly code, I got the following result,
> 
> 0000000000000088 <ckt_blksize>:
>       88: 2a0003e8 mov w8, w0
>       8c: 321d03e0 orr w0, wzr, #0x8
>       90: 11000400 add w0, w0, #0x1
>       94: 7108051f cmp w8, #0x201
>       98: 53017d08 lsr w8, w8, #1
>       9c: 54ffffa8 b.hi 90 <ckt_blksize+0x8>
>       a0: d65f03c0 ret
>       a4: d503201f nop
> 
> 00000000000000a8 <ckt_ilog2>:
>       a8: 320013e8 orr w8, wzr, #0x1f
>       ac: 5ac01009 clz w9, w0
>       b0: 4b090108 sub w8, w8, w9
>       b4: 7100001f cmp w0, #0x0
>       b8: 5a9f1100 csinv w0, w8, wzr, ne
>       bc: d65f03c0 ret
> 
> The generated code of ilog2  is shorter , and  runs faster

But does this code path actually show up anywhere that is actually
measurable as mattering?

If so, please show that benchmark results.

thanks,

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
