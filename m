Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AA144156D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Nov 2021 09:39:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mhSqZ-000250-Lw; Mon, 01 Nov 2021 08:39:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hj514.kim@samsung.com>) id 1mhSqX-00024c-HE
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Nov 2021 08:39:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TrIUMzWOCdbzh+oXYZ4o1j8ckiPGqO30nSSC7qA6BSg=; b=MGz1njn/q2N+kh5oKY89QdBJu6
 WMijpDE1sxZ5ps8rvRy2RfIMwgUzTMLmR0KXemw+CIhPvkmXy/uGXwgfLgKMkq+Dmsc9ThjV5VUhR
 yP0aTamLvkUNgxgKQr7Me/O+3N8XCcTSDdqNNBG4oPPuQ585CTRP5A9SjfB2LcwBny3s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TrIUMzWOCdbzh+oXYZ4o1j8ckiPGqO30nSSC7qA6BSg=; b=K5VmeIb3EqcVK1Z0UxMp7CyS2N
 bdajP50e9oT+4xUzmH4hi+HYQmttqhQY7SWRDBycO1SVFh9Qh7O/+InTcDU/kCVAUqqnEgDsIm0cb
 Ky5m0wUt6zkF4MR1kSVzQmvtLLMB+ffLHIN3K7li3mZSdqEDf9S7g6uLW8UR06Xpdwmk=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mhSqO-0008CR-R5
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Nov 2021 08:39:11 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20211101083855epoutp0295c729a0b4d28d88291027f43b3edaa2~zX1s1--7W1793817938epoutp02N
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  1 Nov 2021 08:38:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20211101083855epoutp0295c729a0b4d28d88291027f43b3edaa2~zX1s1--7W1793817938epoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1635755935;
 bh=TrIUMzWOCdbzh+oXYZ4o1j8ckiPGqO30nSSC7qA6BSg=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=leezz+2YCDkL/wcbofC/tuoIly9e2h+6j04tutvJZab4MK04FmmKQLxnnC6c2cU+X
 H9jxcOVp3YSbZ3oqvVuvtWosh81G+7tPe5fCLv7USarJCO/JHA0AwNzevHhm5sLjRj
 PCsuInSMYSKyzmLGyEuGLrdsxAJl1R4t+pXePt3s=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20211101083854epcas1p146216bfc3ed4c53a35ce5ae5faefc46b~zX1se7q3j0702107021epcas1p1V;
 Mon,  1 Nov 2021 08:38:54 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.38.243]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4HjRJr0jKZz4x9Pt; Mon,  1 Nov
 2021 08:38:52 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 09.94.09592.A97AF716; Mon,  1 Nov 2021 17:38:50 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20211101083850epcas1p3751548ab062341c85e8fa5bfbaaf3f46~zX1oTZpIZ0909609096epcas1p3r;
 Mon,  1 Nov 2021 08:38:50 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20211101083850epsmtrp14b562c32498581db0777e7d359970943~zX1oSZvZu2747327473epsmtrp1m;
 Mon,  1 Nov 2021 08:38:50 +0000 (GMT)
X-AuditID: b6c32a39-be45aa8000002578-09-617fa79a56a1
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 37.75.29871.997AF716; Mon,  1 Nov 2021 17:38:50 +0900 (KST)
Received: from hj514 (unknown [10.253.100.146]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20211101083849epsmtip1447c860dc10d7121118d6f369caa2224~zX1oJLKMQ0498904989epsmtip1b;
 Mon,  1 Nov 2021 08:38:49 +0000 (GMT)
Message-ID: <b51b743463f9f9220a6407d54b406a2c402b931d.camel@samsung.com>
From: Hyeong-Jun Kim <hj514.kim@samsung.com>
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
Date: Mon, 01 Nov 2021 17:38:49 +0900
In-Reply-To: <e1903d27-ff8e-adb2-ac64-5af662b99d1f@kernel.org>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDKsWRmVeSWpSXmKPExsWy7bCmru6s5fWJBq82S1qcnnqWyWJ6x0E2
 iyfrZzFbXFrkbnF51xw2B1aPTas62Tx2L/jM5NG3ZRWjx+dNcgEsUdk2GamJKalFCql5yfkp
 mXnptkrewfHO8aZmBoa6hpYW5koKeYm5qbZKLj4Bum6ZOUBrlRTKEnNKgUIBicXFSvp2NkX5
 pSWpChn5xSW2SqkFKTkFZgV6xYm5xaV56Xp5qSVWhgYGRqZAhQnZGScPv2YseKpT8er7a7YG
 xt/SXYycHBICJhK9Ky4ydjFycQgJ7GCU2Pn9BQtIQkjgE6NE33UniMQ3RompN2YywXTsa30D
 1bGXUeLo8+fMEM4TRok7/zaCVfEKeEic37MIbJSwgLvEo/ftrCA2m4COxIdZKxlBbBEBe4nO
 b0vAbGag+saO72A1LAKqEnPWNzOD2JwCdhKtN3rA4qICahKvVj5ihZgvKHFy5hMWiF55ie1v
 54AdISFwj13i1739zBCnukhs2NTEAmELS7w6voUdwpaSeNnfBmXXSxy/8okVormFUeLx0ldA
 F3EAOfYS7y9ZgJjMApoS63fpQ5QrSuz8PRfqZj6Jd19BbgOp5pXoaBOCKFGW2Hz3MBuELSnx
 dNFfRgjbQ+L+pvuskLBawSxx8MNExgmMCrOQvDMLyTuzEDYvYGRexSiWWlCcm55abFhgCo/h
 5PzcTYzgZKhluYNx+tsPeocYmTgYDzFKcDArifBGXKhJFOJNSaysSi3Kjy8qzUktPsRoCgzg
 icxSosn5wHScVxJvaGJpYGJmZGJhbGlspiTO+0WuMFFIID2xJDU7NbUgtQimj4mDU6qByVRs
 TdqSHRM1D21ebaPj26Zw/UKX5/pHDTYfj3m7F+au/imTO8d+2c7y1y/eTHV/4Rd2/QzrVEbx
 U24Xi91vCBu/CnrEsu6UuNpcT6nlt1XqlO+xBR+OX2N0c5HkkoTUp+f3/7T/v1nUNX9/Xe7e
 aUwSBUrhpWlvFoppT/mu9FvcpiLxW/GLmz/3i7+QO5qz21FOqFLoxffj5WKlXzbECIWta2E/
 53G8+Atjvdq3l3FXjyqctC0QMr15THHfjH1qoRq/jy04efzAyR+Tn7HHqQqJPlNa6cRjdVOv
 5/tp0zf/+P6dP6Jo+WD21EBTn7NbC+8o15xqvLJjH0db4+T6X+bd737rzm+fNNX280kZd2kl
 luKMREMt5qLiRAA2EI7WDwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLLMWRmVeSWpSXmKPExsWy7bCSnO6s5fWJBi1nmSxOTwUS0zsOslk8
 WT+L2eLSIneLy7vmsDmwemxa1cnmsXvBZyaPvi2rGD0+b5ILYInisklJzcksSy3St0vgyjh5
 +DVjwVOdilffX7M1MP6W7mLk5JAQMJHY1/qGEcQWEtjNKPFsjW8XIwdQXFJi3vpyCFNY4vDh
 4i5GLqCKR4wSXZfaWEHKeQU8JM7vWcQCYgsLuEs8et8OFmcT0JH4MGsl2EgRAXuJzm9LwGxm
 oPrGju9gNSwCqhJz1jczg9icAnYSrTd6WCEWbGSWOH5yDTNEg6ZE6/bf7CC2qICaxKuVj6AW
 C0qcnPmEBaJGXmL72znMExgFZyFpmYWkbBaSsgWMzKsYJVMLinPTc4sNCwzzUsv1ihNzi0vz
 0vWS83M3MYJDXEtzB+P2VR/0DjEycTAeYpTgYFYS4Y24UJMoxJuSWFmVWpQfX1Sak1p8iFGa
 g0VJnPdC18l4IYH0xJLU7NTUgtQimCwTB6dUA9O230Iab/8tknae72R6rb750f4r81vY+f/9
 Mt5gJXnfledx2s7W3JKNF2Zs+vy6I7X1b0l71KubG7b3NTUf3C86R7d/V7Jb5KQSnl/LZhVk
 9bxmr7m1bv/6KrGo9dVCHl5GPNmTPx7REfxxX6NsyasPW88smpwSbrCspbtO41XQvDKrR6mK
 57fvknM1sH5b3rjt26ZLafuP+K3m1Pu80aS4tevS9L/FC6LfvWeQMg1SM3vrnengt6Ptg75D
 RememNr8hh6W28HfjOSMtLIZQsKevDnv8+aYgWGQswoHz+flaVV7zKXP9Tb/t6jxurnTZOXe
 W4uuPrTavi9vN2/rphq/ut+6m5X+y1Zb963gjlNiKc5INNRiLipOBAD/GYgF4AIAAA==
X-CMS-MailID: 20211101083850epcas1p3751548ab062341c85e8fa5bfbaaf3f46
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211101054217epcas1p3c695f37ab925f47156bd45e3adb5ed94
References: <CGME20211101054217epcas1p3c695f37ab925f47156bd45e3adb5ed94@epcas1p3.samsung.com>
 <20211101054214.24456-1-hj514.kim@samsung.com>
 <d1929b64-15a3-feaf-5401-1552b2eb2461@kernel.org>
 <9a0360922130485f4252970de4bb535667cc26e9.camel@samsung.com>
 <75c52307-7bfd-2408-d067-26d1fca7bb73@kernel.org>
 <02ffe8465f514102f5278e97bf3854c520fae91d.camel@samsung.com>
 <e1903d27-ff8e-adb2-ac64-5af662b99d1f@kernel.org>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 2021-11-01 at 16:11 +0800,
 Chao Yu wrote: > On 2021/11/1
 15:23, Hyeong-Jun Kim wrote: > > On Mon, 2021-11-01 at 15:12 +0800, Chao
 Yu wrote: > > > On 2021/11/1 15:09, Hyeong-Jun Kim wrote: > > [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.25 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [203.254.224.25 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mhSqO-0008CR-R5
Subject: Re: [f2fs-dev] [PATCH] F2FS: invalidate META_MAPPING before IPU/DIO
 write
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 2021-11-01 at 16:11 +0800, Chao Yu wrote:
> On 2021/11/1 15:23, Hyeong-Jun Kim wrote:
> > On Mon, 2021-11-01 at 15:12 +0800, Chao Yu wrote:
> > > On 2021/11/1 15:09, Hyeong-Jun Kim wrote:
> > > > On Mon, 2021-11-01 at 14:28 +0800, Chao Yu wrote:
> > > > > On 2021/11/1 13:42, Hyeong-Jun Kim wrote:
> > > > > > Encrypted pages during GC are read and cached in
> > > > > > META_MAPPING.
> > > > > > However, due to cached pages in META_MAPPING, there is an
> > > > > > issue
> > > > > > where
> > > > > > newly written pages are lost by IPU or DIO writes.
> > > > > > 
> > > > > > Thread A                              Thread B
> > > > > > - f2fs_gc(): blk 0x10 -> 0x20 (a)
> > > > > >                                          - IPU or DIO write
> > > > > > on
> > > > > > blk
> > > > > > 0x20 (b)
> > > > > > - f2fs_gc(): blk 0x20 -> 0x30 (c)
> > > > > > 
> > > > > > (a) page for blk 0x20 is cached in META_MAPPING and page
> > > > > > for
> > > > > > blk
> > > > > > 0x10
> > > > > >        is invalidated from META_MAPPING.
> > > > > > (b) write new data to blk 0x200 using IPU or DIO, but
> > > > > > outdated
> > > > > > data
> > > > > >        still remains in META_MAPPING.
> > > > > > (c) f2fs_gc() try to move blk from 0x20 to 0x30 using
> > > > > > cached
> > > > > > page
> > > > > > in
> > > > > >        META_MAPPING. In conclusion, the newly written data
> > > > > > in
> > > > > > (b) is
> > > > > > lost.
> > > > > 
> > > > > In c), f2fs_gc() will readahead encrypted block from disk via
> > > > > ra_data_block() anyway,
> > > > > not matter cached encrypted page of meta inode is uptodate or
> > > > > not, so
> > > > > it's safe, right?
> > > > 
> > > > Right,
> > > > However, if DIO write is performed between phase 3 and phase 4
> > > > of
> > > > f2fs_gc(),
> > > > the cached page of meta_mapping will be out-dated, though it
> > > > read
> > > > data
> > > > from
> > > > disk via ra_data_block() in phase 3.
> > > > 
> > > > What do you think?
> > > 
> > > Due to i_gc_rwsem lock coverage, the race condition should not
> > > happen
> > > right now?
> > > 
> > 
> > - Thread A                                       - Thread B
> > /* phase 3 */
> > down_write(i_gc_rwsem)
> > ra_data_block()
> > up_write(i_gc_rwsem)
> >                                                         
> >   f2fs_direct_IO() :
> >                                                         
> >   down_read(i_gc_rwsem)
> >                                                         
> >   __blockdev_direct_IO()
> >                                                             ...
> >                                                           
> >   get_ddata_block_dio_write()
> >                                                             ...
> >                                                           
> >   f2fs_dio_submit_bio()
> >                                                         
> >   up_read(i_gc_rwsem)
> > /* phase 4 */
> > down_write(i_gc_rwsem)
> > move_data_block()
> > up_write(i_gc_rwsem)
> > 
> > It looks, i_gc_rwsem could not protect page update between phase 3
> > and
> > 4.
> > 
> > Am I missing anything?
> 
> It looks you're right, there is a hole in between readahead and
> movepage functions...
> 
> Could you please update the race condition description? and add a tag
> as below to fix
> stable kernel as well:
> 
> Fixes: 6aa58d8ad20a ("f2fs: readahead encrypted block during GC")
> 
> Thanks,
Thank for your comment.
I will send Patch v2 with new description.

Thanks,
> 
> > Thanks
> > 
> > > Thanks,
> > > 
> > > > Thanks,
> > > > > Am I missing anything?
> > > > > 
> > > > > Thanks,
> > > > > 
> > > > > > To address this issue, invalidating pages in META_MAPPING
> > > > > > before
> > > > > > IPU or
> > > > > > DIO write.
> > > > > > 
> > > > > > Signed-off-by: Hyeong-Jun Kim <
> > > > > > hj514.kim@samsung.com
> > > > > > 
> > > > > > 
> > > > > > 
> > > > > > ---
> > > > > >     fs/f2fs/data.c    | 2 ++
> > > > > >     fs/f2fs/segment.c | 3 +++
> > > > > >     2 files changed, 5 insertions(+)
> > > > > > 
> > > > > > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > > > > > index 74e1a350c1d8..9f754aaef558 100644
> > > > > > --- a/fs/f2fs/data.c
> > > > > > +++ b/fs/f2fs/data.c
> > > > > > @@ -1708,6 +1708,8 @@ int f2fs_map_blocks(struct inode
> > > > > > *inode,
> > > > > > struct f2fs_map_blocks *map,
> > > > > >     		 */
> > > > > >     		f2fs_wait_on_block_writeback_range(inod
> > > > > > e,
> > > > > >     						map-
> > > > > > >m_pblk,
> > > > > > map-
> > > > > > > m_len);
> > > > > > 
> > > > > > +		invalidate_mapping_pages(META_MAPPING(sbi),
> > > > > > +						map->m_pblk,
> > > > > > map-
> > > > > > > m_pblk);
> > > > > > 
> > > > > >     
> > > > > >     		if (map->m_multidev_dio) {
> > > > > >     			block_t blk_addr = map->m_pblk;
> > > > > > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > > > > > index 526423fe84ce..f57c55190f9e 100644
> > > > > > --- a/fs/f2fs/segment.c
> > > > > > +++ b/fs/f2fs/segment.c
> > > > > > @@ -3652,6 +3652,9 @@ int f2fs_inplace_write_data(struct
> > > > > > f2fs_io_info *fio)
> > > > > >     		goto drop_bio;
> > > > > >     	}
> > > > > >     
> > > > > > +	invalidate_mapping_pages(META_MAPPING(fio->sbi),
> > > > > > +				fio->new_blkaddr, fio-
> > > > > > > new_blkaddr);
> > > > > > 
> > > > > > +
> > > > > >     	stat_inc_inplace_blocks(fio->sbi);
> > > > > >     
> > > > > >     	if (fio->bio && !(SM_I(sbi)->ipu_policy & (1 <<
> > > > > > F2FS_IPU_NOCACHE)))
> > > > > > 
> > > > > 
> > > > > 
> > > 
> > > 
> 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
