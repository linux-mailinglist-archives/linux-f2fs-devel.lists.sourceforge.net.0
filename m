Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B5D441433
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Nov 2021 08:29:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mhRlN-0002r9-NR; Mon, 01 Nov 2021 07:29:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hj514.kim@samsung.com>) id 1mhRlM-0002qz-LF
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Nov 2021 07:29:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O4SXJpZKPIg5VQ96Yr1zqOjIh9Tms0gkWUtuQiaU7vQ=; b=OkH6xRfM7EIBpsK+qxUddCxC3p
 HwrnM9KltI1ARnucG4nvGmqUPjvgCyvKsbr47FQFbFzoy0GYnSB99ANkFaveoRr/CE5upzyNYZTqZ
 62VuOHt/Rc/qUZPnWKf1OuCjua6l8QwPdoSwnMtPsnrJ0y5e0KHW3WaO88/Vc0CsvOb8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O4SXJpZKPIg5VQ96Yr1zqOjIh9Tms0gkWUtuQiaU7vQ=; b=QtlUK0IBFeZNp8g9odjsTqmtHK
 bl/DiIyEOw2eKU+1PxvxPSABE4gkDLaFNPJBu1HjZ+Dbqz+lLjw0oWN+QPDusSE6Fsh/JYxeaKgRK
 L5s8+dlqp4btlUDo999DgR5qRBYkdr+GW14h47d3ZEQ04QL/HRsrrSoW3I/J2ZNDWvCw=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mhRfW-000281-Nm
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Nov 2021 07:29:47 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20211101072340epoutp044a7559cccada06bf3e42ef4f58e90ff5~zW0AAP9Kh0477404774epoutp04g
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  1 Nov 2021 07:23:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20211101072340epoutp044a7559cccada06bf3e42ef4f58e90ff5~zW0AAP9Kh0477404774epoutp04g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1635751420;
 bh=O4SXJpZKPIg5VQ96Yr1zqOjIh9Tms0gkWUtuQiaU7vQ=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=HVShWjkTAQ0LzMndSWPjRE0Ptx5Jh6gTLCKL9n7Y8IXoYMOmvugs1pI8opksYNXju
 qGTGi3RdCweejT6wKbiG/xn7Wjy5QB+DFSpxySgnZ2/piPLc0m3CsPpDLXIXkvC0p2
 dHaVPHJ2bLtrpRtbS9aZgfoq/4gTfQ/8Or9T1YlM=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20211101072339epcas1p349a4296cf3134a6e142e41da4ad091b7~zWz-qaQNo0306803068epcas1p3s;
 Mon,  1 Nov 2021 07:23:39 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.38.241]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4HjPf04krYz4x9QV; Mon,  1 Nov
 2021 07:23:36 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 19.98.08277.5F59F716; Mon,  1 Nov 2021 16:23:33 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20211101072333epcas1p4026451f7461f3d0b965feb6c1a58c7df~zWz5YtfvG1023010230epcas1p4D;
 Mon,  1 Nov 2021 07:23:32 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20211101072332epsmtrp156deb4aba69e62343ba8db137df1acd2~zWz5YGewI1186111861epsmtrp1I;
 Mon,  1 Nov 2021 07:23:32 +0000 (GMT)
X-AuditID: b6c32a36-1edff70000002055-31-617f95f5d7e6
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 D2.FD.29871.4F59F716; Mon,  1 Nov 2021 16:23:32 +0900 (KST)
Received: from hj514 (unknown [10.253.100.146]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20211101072332epsmtip2f95e1535fd0f8332259d3ea24b838615~zWz5OVlpE3001830018epsmtip2X;
 Mon,  1 Nov 2021 07:23:32 +0000 (GMT)
Message-ID: <02ffe8465f514102f5278e97bf3854c520fae91d.camel@samsung.com>
From: Hyeong-Jun Kim <hj514.kim@samsung.com>
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
Date: Mon, 01 Nov 2021 16:23:32 +0900
In-Reply-To: <75c52307-7bfd-2408-d067-26d1fca7bb73@kernel.org>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNKsWRmVeSWpSXmKPExsWy7bCmvu7XqfWJBmvmClqcnnqWyWJ6x0E2
 iyfrZzFbXFrkbnF51xw2B1aPTas62Tx2L/jM5NG3ZRWjx+dNcgEsUdk2GamJKalFCql5yfkp
 mXnptkrewfHO8aZmBoa6hpYW5koKeYm5qbZKLj4Bum6ZOUBrlRTKEnNKgUIBicXFSvp2NkX5
 pSWpChn5xSW2SqkFKTkFZgV6xYm5xaV56Xp5qSVWhgYGRqZAhQnZGW/3HWIsuKNU8a7tLXMD
 Y49YFyMnh4SAicSuTzPYuxi5OIQEdjBKrHjZBOV8YpRoWP+PEaRKSOAbo8TxWTEwHZ9WvmWB
 KNrLKPH41G9GCOcJo8T37q/MIFW8Ah4SzRdngNnCAu4Sj963s4LYbAI6Eh9mrQSbKiJgL9H5
 bQmYzQxU39jxHaiGg4NFQFXiw2oBkDCngJ3E/7/rWUBsUQE1iVcrH7FCjBeUODnzCQtEq7zE
 9rdzmEFukBB4xC5xddshRohLXSQeNDUyQ9jCEq+Ob2GHsKUkXva3Qdn1EsevfGKFaG4B+mbp
 K0aQIySAjnt/yQLEZBbQlFi/Sx+iXFFi5++5UCfzSbz72sMKUc0r0dEmBFGiLLH57mE2CFtS
 4umiv1DXeEjc33SfFRJUW5kkTh/qYpnAqDALyTuzkLwzC2HzAkbmVYxiqQXFuempxYYFRvAI
 Ts7P3cQIToVaZjsYJ739oHeIkYmD8RCjBAezkghvxIWaRCHelMTKqtSi/Pii0pzU4kOMpsDw
 ncgsJZqcD0zGeSXxhiaWBiZmRiYWxpbGZkrivJ/lChOFBNITS1KzU1MLUotg+pg4OKUamJIU
 gqK/F9VfFOUtKOqUTxXasu1QdPB1tisf9GMmPkpeLntO1OlClOQO96gy/orXPZFFpxoWS64S
 PVT/sctEc1nSAnvRmRUnCrv2hD2S7+UX+Os2L1zv+G4OW0uluwV+Hlvlr65Rv3faJEs6b8GJ
 icX/NvwR0vzJs3+DT+g0t2sek4weu+3rf/J95+ytii8/8Wm1v1GcsGKm3i7FSelaaneZmcyr
 Z24/33GZ9aX1pY1uOgccX5gY/luePi0jXqDN11Az+K7U1SNnrm9hErqxJOxm6q/9syOtizTs
 sjs3ll1wsyw7sYvrcFWUt3xx1oPft5+XM+YLF6TcFJfyCZe5MqVN/vEhzbyIg2U+sXd9lFiK
 MxINtZiLihMBWz15Fw4EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDLMWRmVeSWpSXmKPExsWy7bCSvO6XqfWJBnceWVicnnqWyWJ6x0E2
 iyfrZzFbXFrkbnF51xw2B1aPTas62Tx2L/jM5NG3ZRWjx+dNcgEsUVw2Kak5mWWpRfp2CVwZ
 b/cdYiy4o1Txru0tcwNjj1gXIyeHhICJxKeVb1m6GLk4hAR2M0qc3/GftYuRAyghKTFvfTmE
 KSxx+HAxSLmQwCNGiavPwWxeAQ+J5oszmEFsYQF3iUfv21lBbDYBHYkPs1YygtgiAvYSnd+W
 gNnMQPWNHd/BprMIqEp8WC0AEuYUsJP4/3c91AV7mCQe/z/NDlGvKdG6/TeYLSqgJvFq5SNW
 iL2CEidnPmGBqJGX2P52DvMERsFZSFpmISmbhaRsASPzKkbJ1ILi3PTcYsMCw7zUcr3ixNzi
 0rx0veT83E2M4ADX0tzBuH3VB71DjEwcjIcYJTiYlUR4Iy7UJArxpiRWVqUW5ccXleakFh9i
 lOZgURLnvdB1Ml5IID2xJDU7NbUgtQgmy8TBKdXANF2R89bCmIMhK30MVL70pmZdXthc8H5v
 cvhZ59JtMQF3vl628Ja9fDkj98p97dlX35w4mjVzkVUgr9Wps3ePzOvae+Hb1Xmda783XHuY
 sOKZ7YZLU542Ll929fo233themfMHKdzGbHvuMWXtLWXMW19i1JOuMOe0i+WVW1yTl5L063i
 vh2PclJdF/Cz5IrHzavaPh9F37faGXGbRqgbPL07LUXt/cfcYMVVZ4Vv7Vp9ZlvSuqNf7r7Z
 tstyKstFC7ZwP2lmhzXKtxmnzj1xqdjcQKJperjKD8muq4cZ5hzc7hklHrPr1be0/s87U9zD
 dKdOWu1/QpFJpkb83AHekLVKS2J/r+28wt+mqjpzyQ4lluKMREMt5qLiRACxviKg3wIAAA==
X-CMS-MailID: 20211101072333epcas1p4026451f7461f3d0b965feb6c1a58c7df
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
X-Headers-End: 1mhRfW-000281-Nm
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

On Mon, 2021-11-01 at 15:12 +0800, Chao Yu wrote:
> On 2021/11/1 15:09, Hyeong-Jun Kim wrote:
> > On Mon, 2021-11-01 at 14:28 +0800, Chao Yu wrote:
> > > On 2021/11/1 13:42, Hyeong-Jun Kim wrote:
> > > > Encrypted pages during GC are read and cached in META_MAPPING.
> > > > However, due to cached pages in META_MAPPING, there is an issue
> > > > where
> > > > newly written pages are lost by IPU or DIO writes.
> > > > 
> > > > Thread A                              Thread B
> > > > - f2fs_gc(): blk 0x10 -> 0x20 (a)
> > > >                                         - IPU or DIO write on
> > > > blk
> > > > 0x20 (b)
> > > > - f2fs_gc(): blk 0x20 -> 0x30 (c)
> > > > 
> > > > (a) page for blk 0x20 is cached in META_MAPPING and page for
> > > > blk
> > > > 0x10
> > > >       is invalidated from META_MAPPING.
> > > > (b) write new data to blk 0x200 using IPU or DIO, but outdated
> > > > data
> > > >       still remains in META_MAPPING.
> > > > (c) f2fs_gc() try to move blk from 0x20 to 0x30 using cached
> > > > page
> > > > in
> > > >       META_MAPPING. In conclusion, the newly written data in
> > > > (b) is
> > > > lost.
> > > 
> > > In c), f2fs_gc() will readahead encrypted block from disk via
> > > ra_data_block() anyway,
> > > not matter cached encrypted page of meta inode is uptodate or
> > > not, so
> > > it's safe, right?
> > 
> > Right,
> > However, if DIO write is performed between phase 3 and phase 4 of
> > f2fs_gc(),
> > the cached page of meta_mapping will be out-dated, though it read
> > data
> > from
> > disk via ra_data_block() in phase 3.
> > 
> > What do you think?
> 
> Due to i_gc_rwsem lock coverage, the race condition should not happen
> right now?
> 
- Thread A                                       - Thread B
/* phase 3 */
down_write(i_gc_rwsem)
ra_data_block()
up_write(i_gc_rwsem)
                                                       
 f2fs_direct_IO() : 
                                                       
 down_read(i_gc_rwsem)
                                                       
 __blockdev_direct_IO()
                                                           ...
                                                         
 get_ddata_block_dio_write()
                                                           ...
                                                         
 f2fs_dio_submit_bio()
                                                       
 up_read(i_gc_rwsem)
/* phase 4 */
down_write(i_gc_rwsem)
move_data_block()
up_write(i_gc_rwsem)

It looks, i_gc_rwsem could not protect page update between phase 3 and
4.

Am I missing anything?

Thanks

> Thanks,
> 
> > Thanks,
> > > Am I missing anything?
> > > 
> > > Thanks,
> > > 
> > > > To address this issue, invalidating pages in META_MAPPING
> > > > before
> > > > IPU or
> > > > DIO write.
> > > > 
> > > > Signed-off-by: Hyeong-Jun Kim <
> > > > hj514.kim@samsung.com
> > > > 
> > > > 
> > > > ---
> > > >    fs/f2fs/data.c    | 2 ++
> > > >    fs/f2fs/segment.c | 3 +++
> > > >    2 files changed, 5 insertions(+)
> > > > 
> > > > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > > > index 74e1a350c1d8..9f754aaef558 100644
> > > > --- a/fs/f2fs/data.c
> > > > +++ b/fs/f2fs/data.c
> > > > @@ -1708,6 +1708,8 @@ int f2fs_map_blocks(struct inode *inode,
> > > > struct f2fs_map_blocks *map,
> > > >    		 */
> > > >    		f2fs_wait_on_block_writeback_range(inode,
> > > >    						map->m_pblk,
> > > > map-
> > > > > m_len);
> > > > 
> > > > +		invalidate_mapping_pages(META_MAPPING(sbi),
> > > > +						map->m_pblk,
> > > > map-
> > > > > m_pblk);
> > > > 
> > > >    
> > > >    		if (map->m_multidev_dio) {
> > > >    			block_t blk_addr = map->m_pblk;
> > > > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > > > index 526423fe84ce..f57c55190f9e 100644
> > > > --- a/fs/f2fs/segment.c
> > > > +++ b/fs/f2fs/segment.c
> > > > @@ -3652,6 +3652,9 @@ int f2fs_inplace_write_data(struct
> > > > f2fs_io_info *fio)
> > > >    		goto drop_bio;
> > > >    	}
> > > >    
> > > > +	invalidate_mapping_pages(META_MAPPING(fio->sbi),
> > > > +				fio->new_blkaddr, fio-
> > > > >new_blkaddr);
> > > > +
> > > >    	stat_inc_inplace_blocks(fio->sbi);
> > > >    
> > > >    	if (fio->bio && !(SM_I(sbi)->ipu_policy & (1 <<
> > > > F2FS_IPU_NOCACHE)))
> > > > 
> > > 
> > > 
> 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
