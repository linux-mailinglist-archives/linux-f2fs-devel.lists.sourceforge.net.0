Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E651EB584
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Jun 2020 07:52:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jfzqP-0003mO-4Z; Tue, 02 Jun 2020 05:52:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hch@lst.de>) id 1jfzqN-0003mC-P4
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Jun 2020 05:52:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TxwTdu8bN4+HDm05DJeEkpsyJZFqljO0qS2pmAJCmH0=; b=i/6i59jJK9zF5EQ9TQUFm6YVXq
 oQgWrXLqwMKigWSIDtywKsNOUvS+b43f2lw0qyXkR6d8LjdZ4sb/irwdxWu5hq8CkDkkYH24Z77TV
 WPHTaHqWu2konz1l0mTLYYdrouaeWM6VzF/pvH2HQs/yQTxsEJSozXIF5Gl0vSAScKC4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TxwTdu8bN4+HDm05DJeEkpsyJZFqljO0qS2pmAJCmH0=; b=BBmkLItcoZslMlOMU4oyfi7TmC
 PH1YIuHDO1NGa9ueFELBj4uXUbQ5+kVVJq3f2hEBWag06BbSKUVvlhuUb6r5vjaDmn5TB/JvZQpML
 FBvdZsN5FFkf3Ea2ZvM09E5Z/4bBAGyWTNka37xhPnrZDfZIF2J2zULG/hMn+NrDQ/c0=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jfzqL-00273J-2O
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Jun 2020 05:52:11 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id B383A68BEB; Tue,  2 Jun 2020 07:51:52 +0200 (CEST)
Date: Tue, 2 Jun 2020 07:51:52 +0200
From: Christoph Hellwig <hch@lst.de>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20200602055152.GA11620@lst.de>
References: <20200529141100.37519-1-pilgrimtao@gmail.com>
 <c8412d98-0328-0976-e5f9-5beddc148a35@kernel.dk>
 <CAAWJmAZOQQQeNiTr48OSRRdO2pG+q4c=6gjT55CkWC5FN=HXmA@mail.gmail.com>
 <20200601084426.GB1667318@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200601084426.GB1667318@kroah.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [213.95.11.211 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1jfzqL-00273J-2O
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
 linux-s390@vger.kernel.org, Tao pilgrim <pilgrimtao@gmail.com>,
 darrick.wong@oracle.com, Mark Fasheh <mark@fasheh.com>, satyat@google.com,
 hch@infradead.org, borntraeger@de.ibm.com, gor@linux.ibm.com,
 chaitanya.kulkarni@wdc.com, Josef Bacik <josef@toxicpanda.com>,
 ming.lei@redhat.com, dsterba@suse.com, viro@zeniv.linux.org.uk,
 Muchun Song <songmuchun@bytedance.com>, sagi@grimberg.me, jaegeuk@kernel.org,
 jlbec@evilplan.org, bvanassche@acm.org, Jens Axboe <axboe@kernel.dk>,
 balbi@kernel.org, damien.lemoal@wdc.com, martin.petersen@oracle.com,
 joseph.qi@linux.alibaba.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel@vger.kernel.org, asml.silence@gmail.com,
 linux-btrfs@vger.kernel.org, sth@linux.ibm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 01, 2020 at 10:44:26AM +0200, Greg KH wrote:
> But does this code path actually show up anywhere that is actually
> measurable as mattering?
> 
> If so, please show that benchmark results.

I think the requests are starting to be a bit unreasonable.  Tao is
replacing a reimplementation of a standard function with that standard
function / compiler builtin.  We don't put such a high burden on that.

And once the proper existing fields are used where possible as shown
in my reply just replacing the rest seems totally obvious - quite
contrary I think keeping a reimplementation would need a high bar.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
