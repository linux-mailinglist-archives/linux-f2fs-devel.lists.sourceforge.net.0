Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE0944141C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Nov 2021 08:23:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mhRf4-0007lS-HB; Mon, 01 Nov 2021 07:23:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hj514.kim@samsung.com>) id 1mhRf2-0007lM-5L
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Nov 2021 07:23:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TyW3QqZtEzvwJqm2WxnJOMHetJvMK0gtzHaqoWgZUFI=; b=EMd38It5fBJxzStfF/FcMqI4zw
 5BB/8SeIVDT5DLVZPn3T2xXwnhAayWo22vHybsu973WQgQpw/FFCprPLGsw5+omb5C6OaOuoZ0hna
 iz+nTSNUdIixTSMWk3PTKnRFJOmlVTroP4AVaxbv58ZGAEoHwT/+NW1hXgX6EzUtAPM0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TyW3QqZtEzvwJqm2WxnJOMHetJvMK0gtzHaqoWgZUFI=; b=EFnorDIFH7HSgzeWdwDGCn6Lbf
 xyjSIj8XE6VI1SHZKzCKEkHThvQcN0d9+mD+zCqEFYqIteAi3Ju6dzhf+Uw+Yk5GlYvXOfJ/rd2ff
 VKUXZbdMbL+ONar7vAVCqPbmTZWy9/B9yJQloT44Bb4Un8p7O2//8gm6YdLXDQn9FqKo=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mhRZC-0000nt-Mv
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Nov 2021 07:23:16 +0000
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20211101070924epoutp03da09adff2494b6e7ba6d3fb5abf9a772~zWnjIykE_2071520715epoutp037
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  1 Nov 2021 07:09:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20211101070924epoutp03da09adff2494b6e7ba6d3fb5abf9a772~zWnjIykE_2071520715epoutp037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1635750564;
 bh=TyW3QqZtEzvwJqm2WxnJOMHetJvMK0gtzHaqoWgZUFI=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=OxliPJK3PA5bjCVBLq6pROoaApwPVS6UPqJWJavAnM9BVBzCqdLVn+v2nQk2E+K+f
 DZOwjMo8Ysf1KOKoUTd/ZLg+vNmj3ZPQeP3IOZrRq8P8Lq6HTMnT+pUBal66LxqGgT
 HupspVHygl5WX2mqDa0t9SrjQOC7XSr8Rjz6J6BU=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20211101070920epcas1p3ae5fab07d5b4be85ec6562ab7018a50f~zWnf29A8Q3106631066epcas1p3y;
 Mon,  1 Nov 2021 07:09:20 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.38.243]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4HjPKV0Wt7z4x9Qh; Mon,  1 Nov
 2021 07:09:18 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 93.E8.21932.B929F716; Mon,  1 Nov 2021 16:09:15 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20211101070915epcas1p316e4271630f27e2ede023623c1d2ecc6~zWnacT2172844328443epcas1p3w;
 Mon,  1 Nov 2021 07:09:15 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20211101070915epsmtrp1fbb31059bca693a032da1cf5de037030~zWnabrwQz0406504065epsmtrp1E;
 Mon,  1 Nov 2021 07:09:15 +0000 (GMT)
X-AuditID: b6c32a38-93fff700000255ac-5e-617f929b6a37
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 CB.81.08738.A929F716; Mon,  1 Nov 2021 16:09:15 +0900 (KST)
Received: from hj514 (unknown [10.253.100.146]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20211101070914epsmtip20af408892b355f1394667e7263f3b421~zWnaSnDmK2079420794epsmtip2_;
 Mon,  1 Nov 2021 07:09:14 +0000 (GMT)
Message-ID: <9a0360922130485f4252970de4bb535667cc26e9.camel@samsung.com>
From: Hyeong-Jun Kim <hj514.kim@samsung.com>
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
Date: Mon, 01 Nov 2021 16:09:14 +0900
In-Reply-To: <d1929b64-15a3-feaf-5401-1552b2eb2461@kernel.org>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFKsWRmVeSWpSXmKPExsWy7bCmnu7sSfWJBv3bJS1OTz3LZDG94yCb
 xZP1s5gtLi1yt7i8aw6bA6vHplWdbB67F3xm8ujbsorR4/MmuQCWqGybjNTElNQihdS85PyU
 zLx0WyXv4HjneFMzA0NdQ0sLcyWFvMTcVFslF58AXbfMHKC1SgpliTmlQKGAxOJiJX07m6L8
 0pJUhYz84hJbpdSClJwCswK94sTc4tK8dL281BIrQwMDI1OgwoTsjPMHl7MXPBCt+PRhL0sD
 41SBLkZODgkBE4n+Y50sXYxcHEICOxglrqw7wQaSEBL4xCjx+XsYROIzo8TpTYdYYDruzZrF
 CpHYxShx9MdsJgjnCaNE74P/YO28Ah4SC6ddYASxhQXcJR69b2cFsdkEdCQ+zFoJFhcRsJfo
 /LYEzGYGqm/s+A5WwyKgKvF6+iWgOAcHp4CdxI8WbpCwqICaxKuVj1ghxgtKnJz5hAWiVV5i
 +9s5zCA3SAjcY5fY8/smM0ivhICLROPyGIijhSVeHd/CDmFLSbzsb4Oy6yWOX/nECtHbwijx
 eOkrRohee4n3lyxATGYBTYn1u/QhyhUldv6eC3Uxn8S7rz2sENW8Eh1tQhAlyhKb7x5mg7Al
 JZ4u+ssIYXtI3N90Hxpshxglvu55wTqBUWEWkm9mIflmFsLmBYzMqxjFUguKc9NTiw0LTODx
 m5yfu4kRnAi1LHYwzn37Qe8QIxMHI9BwDmYlEd6ICzWJQrwpiZVVqUX58UWlOanFhxhNgcE7
 kVlKNDkfmIrzSuINTSwNTMyMTCyMLY3NlMR5P8sVJgoJpCeWpGanphakFsH0MXFwSjUwZR0Q
 n1lsvb7wrCo/0++nF/h0+xSFPpzVfrPl5qnI/cfOy6wpe8Sl1Jkyd/4c7S0SnRlOa96IPl36
 gUvYl9vty5lnPi114bL3ij8Zn3PtveL7VUd0xvWvDX+efXpe9CTZ7k2FZIvdJLNoW9c5MxpO
 V4uzuax5szBvornJRc62Sea3X8R+0s1ZoXLFTTPUxf9QStvj537TiqOKpn+QL3MTvVz2ro+H
 YfmGsPXSfotMWz4XeS9fHDLzutmqf2+kJ2j0On/Lanin7c5/8d/sLR+sl3+rrVOVnssUESla
 +Exx7mHvnfvXt7F7zFo386v1N756o+9vr/An6l6zPOC9zckmcM0HCcVywzlTP7avyznhocRS
 nJFoqMVcVJwIAM96KVQNBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDLMWRmVeSWpSXmKPExsWy7bCSvO7sSfWJBjvbmS1OTz3LZDG94yCb
 xZP1s5gtLi1yt7i8aw6bA6vHplWdbB67F3xm8ujbsorR4/MmuQCWKC6blNSczLLUIn27BK6M
 8weXsxc8EK349GEvSwPjVIEuRk4OCQETiXuzZrGC2EICOxglZj1z7mLkAIpLSsxbXw5hCksc
 PlzcxcgFVPGIUWLvrw42kHJeAQ+JhdMuMILYwgLuEo/et4ONYRPQkfgwayVYXETAXqLz2xIw
 mxmovrHjO1gNi4CqxOvplxhB5nMK2En8aOGGmH+cUWLxy01Q9ZoSrdt/s4PYogJqEq9WPmKF
 2CsocXLmExaIGnmJ7W/nME9gFJyFpGUWkrJZSMoWMDKvYpRMLSjOTc8tNiwwykst1ytOzC0u
 zUvXS87P3cQIDnAtrR2Me1Z90DvEyMTBeIhRgoNZSYQ34kJNohBvSmJlVWpRfnxRaU5q8SFG
 aQ4WJXHeC10n44UE0hNLUrNTUwtSi2CyTBycUg1M884xKdYfSZ13cGd1zMq7hZonxN8/v3lB
 Kl9f8NK9mrjqJZ0F5y/bT5196PeB3KtrC70ycvc5HzgikrkpptLrbX63RBVb+22rjzk/OGdw
 TlrWscR+8617Yite2nquOnCy9eo1LplTr8/mLu9ec+VGS/A+iQCb/LBU/7tMl8UMVsuLGD7Y
 4qXZw7jfXpRduTn2kd1K/elvWHdsPfjp3857pWpfZSR+xbhvL5DQd4o4ZCryiiuv6eqXCVKC
 LzeWCE2YrBASxbZM6NPSld+2fQj6dmBGH9emwuKQVXbxUkYsHPlyLz85Xc1f92Brg5Go06IX
 W2/Z/3QQSrmWbpPo/vm0VOh/+asawUtF9XqvqE1UVmIpzkg01GIuKk4EAAoi413fAgAA
X-CMS-MailID: 20211101070915epcas1p316e4271630f27e2ede023623c1d2ecc6
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211101054217epcas1p3c695f37ab925f47156bd45e3adb5ed94
References: <CGME20211101054217epcas1p3c695f37ab925f47156bd45e3adb5ed94@epcas1p3.samsung.com>
 <20211101054214.24456-1-hj514.kim@samsung.com>
 <d1929b64-15a3-feaf-5401-1552b2eb2461@kernel.org>
X-Headers-End: 1mhRZC-0000nt-Mv
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

On Mon, 2021-11-01 at 14:28 +0800, Chao Yu wrote:
> On 2021/11/1 13:42, Hyeong-Jun Kim wrote:
> > Encrypted pages during GC are read and cached in META_MAPPING.
> > However, due to cached pages in META_MAPPING, there is an issue
> > where
> > newly written pages are lost by IPU or DIO writes.
> > 
> > Thread A                              Thread B
> > - f2fs_gc(): blk 0x10 -> 0x20 (a)
> >                                        - IPU or DIO write on blk
> > 0x20 (b)
> > - f2fs_gc(): blk 0x20 -> 0x30 (c)
> > 
> > (a) page for blk 0x20 is cached in META_MAPPING and page for blk
> > 0x10
> >      is invalidated from META_MAPPING.
> > (b) write new data to blk 0x200 using IPU or DIO, but outdated data
> >      still remains in META_MAPPING.
> > (c) f2fs_gc() try to move blk from 0x20 to 0x30 using cached page
> > in
> >      META_MAPPING. In conclusion, the newly written data in (b) is
> > lost.
> 
> In c), f2fs_gc() will readahead encrypted block from disk via
> ra_data_block() anyway,
> not matter cached encrypted page of meta inode is uptodate or not, so
> it's safe, right?
Right, 
However, if DIO write is performed between phase 3 and phase 4 of
f2fs_gc(),
the cached page of meta_mapping will be out-dated, though it read data
from 
disk via ra_data_block() in phase 3.

What do you think?

Thanks,
> 
> Am I missing anything?
> 
> Thanks,
> 
> > To address this issue, invalidating pages in META_MAPPING before
> > IPU or
> > DIO write.
> > 
> > Signed-off-by: Hyeong-Jun Kim <
> > hj514.kim@samsung.com
> > >
> > ---
> >   fs/f2fs/data.c    | 2 ++
> >   fs/f2fs/segment.c | 3 +++
> >   2 files changed, 5 insertions(+)
> > 
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index 74e1a350c1d8..9f754aaef558 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -1708,6 +1708,8 @@ int f2fs_map_blocks(struct inode *inode,
> > struct f2fs_map_blocks *map,
> >   		 */
> >   		f2fs_wait_on_block_writeback_range(inode,
> >   						map->m_pblk, map-
> > >m_len);
> > +		invalidate_mapping_pages(META_MAPPING(sbi),
> > +						map->m_pblk, map-
> > >m_pblk);
> >   
> >   		if (map->m_multidev_dio) {
> >   			block_t blk_addr = map->m_pblk;
> > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > index 526423fe84ce..f57c55190f9e 100644
> > --- a/fs/f2fs/segment.c
> > +++ b/fs/f2fs/segment.c
> > @@ -3652,6 +3652,9 @@ int f2fs_inplace_write_data(struct
> > f2fs_io_info *fio)
> >   		goto drop_bio;
> >   	}
> >   
> > +	invalidate_mapping_pages(META_MAPPING(fio->sbi),
> > +				fio->new_blkaddr, fio->new_blkaddr);
> > +
> >   	stat_inc_inplace_blocks(fio->sbi);
> >   
> >   	if (fio->bio && !(SM_I(sbi)->ipu_policy & (1 <<
> > F2FS_IPU_NOCACHE)))
> > 
> 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
