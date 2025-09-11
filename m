Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5D9B529A5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Sep 2025 09:13:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWFN6VbeZ95s5NTcEXDGb3Yalmulefx2KBRZDVGWYFg=; b=dYaciu2tFyXHVKxC6PbcI9nAbn
	vY7pjS4oU3Qb0g1WlZr3dMgEygRNOmnu4hQani3iYmzzJr5vhrfEySUMnUTuVixy6+gdUqD/oua5U
	oawP1KTrzLMVpdPKx/VtPd074MQtkTsV68GgiCXx/XKDT+xAcNwP4PQlo0LQXDUmMs4g=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uwbUH-0001zC-Ru;
	Thu, 11 Sep 2025 07:12:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1uwbU9-0001yx-36
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Sep 2025 07:12:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XOFayJC+PaTyeYE+oOlYMFS/9p9GqfLdhmodvRmn3SY=; b=fZzA2wc2YX926bHYsjxPsF2aep
 PepALNiWNd4awhs+NS29zwIK6OwjXfYfieGkWaQGEcQF8RGQuITD49sw66DARPIeb3JhnvLFrjCy7
 qoq98PvkGqC9+wb8G4oEZXsL2ASXCrnghSUzl44Azyme6xTFW18akHq1Ew5gv3E+5VhQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XOFayJC+PaTyeYE+oOlYMFS/9p9GqfLdhmodvRmn3SY=; b=Q+b5Vxt9gHQ5X3a0cA2Rj23+c4
 INY/K3Uthu2zWTh7LVyn/wTuv0R5A8DkN2sL9M24/r+Mg+veQqga9do786+goLrUlfeX94OO+xwqL
 AbooPbIe6WZyT9FbcUinsSFnXJCzQ4f7ktOBypEApC0ysAjEfzfzoENnikkPrN6b1cYs=;
Received: from mta22.hihonor.com ([81.70.192.198])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uwbU7-0005F9-VH for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Sep 2025 07:12:49 +0000
dkim-signature: v=1; a=rsa-sha256; d=honor.com; s=dkim;
 c=relaxed/relaxed; q=dns/txt; h=To:From;
 bh=XOFayJC+PaTyeYE+oOlYMFS/9p9GqfLdhmodvRmn3SY=;
 b=g5/UuQQBomgKxgCsmze2dlhfNE2jwKOUGT9hZWsLCHTPJOmET3bjShuhEuy0iWNYC0gL8oM2g
 tvgDWGoEFx8BF6DUTKL5gkowtUuTvpwQid26CSwi7rrXDb8GAMf4/MDqJLC4QYCXPFDMGSuFQD2
 31iorsFx4NRCaQ3dynvszQc=
Received: from w012.hihonor.com (unknown [10.68.27.189])
 by mta22.hihonor.com (SkyGuard) with ESMTPS id 4cMpGr6XyLzYlZK3;
 Thu, 11 Sep 2025 14:55:32 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w012.hihonor.com
 (10.68.27.189) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 11 Sep
 2025 14:55:50 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 11 Sep
 2025 14:55:50 +0800
From: wangzijie <wangzijie1@honor.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Thu, 11 Sep 2025 14:55:49 +0800
Message-ID: <20250911065549.2929967-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ad627632-298e-428b-9cfa-a5b5b50c147e@kernel.org>
References: <ad627632-298e-428b-9cfa-a5b5b50c147e@kernel.org>
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w001.hihonor.com (10.68.25.235) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > On 9/10/25 21:58, wangzijie wrote: > > When the data layout
 is like this: > > dnode1: dnode2: > > [0] A [0] NEW_ADDR > > [1] A+1 [1]
 0x0 > > ... .... > > [1016] A+1016 > > [1017] B (B!=A+1017) [1017 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [81.70.192.198 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uwbU7-0005F9-VH
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix wrong extent_info data for
 precache extents
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
Cc: jaegeuk@kernel.org, wangzijie1@honor.com, linux-kernel@vger.kernel.org,
 feng.han@honor.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> On 9/10/25 21:58, wangzijie wrote:
> > When the data layout is like this:
> > dnode1:                     dnode2:
> > [0]      A                  [0]    NEW_ADDR
> > [1]      A+1                [1]    0x0
> > ...                         ....
> > [1016]   A+1016
> > [1017]   B (B!=A+1017)      [1017] 0x0
> > 
> > We can build this kind of layout by following steps(with i_extra_isize:36):
> > ./f2fs_io write 1 0 1881 rand dsync testfile
> > ./f2fs_io write 1 1881 1 rand buffered testfile
> > ./f2fs_io fallocate 0 7708672 4096 testfile
> > 
> > And when we map first data block in dnode2, we will get wrong extent_info data:
> > map->m_len = 1
> > ofs = start_pgofs - map->m_lblk = 1882 - 1881 = 1
> > 
> > ei.fofs = start_pgofs = 1882
> > ei.len = map->m_len - ofs = 1 - 1 = 0
> 
> Hi Zijie,
> 
> I tried to reproduce w/ below steps:
> 
> f2fs_io write 1 0 1881 rand dsync testfile
> f2fs_io write 1 1881 1 rand buffered testfile
> f2fs_io fallocate 0 7708672 4096 testfile
> umount
> mount
> f2fs_io precache_extents testfile
> 
>          f2fs_io-921     [013] .....  1049.855817: f2fs_lookup_start: dev = (253,16), pino = 3, name:testfile, flags:65537
>          f2fs_io-921     [013] .....  1049.855870: f2fs_submit_read_bio: dev = (253,16)/(253,16), rw = READ(), DATA, sector = 139280, size = 4096
>          f2fs_io-921     [013] .....  1049.856116: f2fs_submit_folio_bio: dev = (253,16), ino = 1, folio_index = 0x5, oldaddr = 0x5553, newaddr = 0x5553, rw = READ(), type = HOT_NODE
>          f2fs_io-921     [013] .....  1049.856147: f2fs_submit_read_bio: dev = (253,16)/(253,16), rw = READ(), NODE, sector = 174744, size = 4096
>          f2fs_io-921     [013] .....  1049.856273: f2fs_iget: dev = (253,16), ino = 5, pino = 3, i_mode = 0x81ed, i_size = 7712768, i_nlink = 1, i_blocks = 15080, i_advise = 0x0
>          f2fs_io-921     [013] .....  1049.856305: f2fs_lookup_end: dev = (253,16), pino = 3, name:testfile, ino:5, err:0
>          f2fs_io-921     [013] .....  1049.856316: f2fs_lookup_extent_tree_start: dev = (253,16), ino = 5, pgofs = 0, type = Read
>          f2fs_io-921     [013] .....  1049.856317: f2fs_lookup_read_extent_tree_end: dev = (253,16), ino = 5, pgofs = 0, read_ext_info(fofs: 0, len: 512, blk: 1055744)
>          f2fs_io-921     [013] .....  1049.856317: f2fs_map_blocks: dev = (253,16), ino = 5, file offset = 0, start blkaddr = 0x101c00, len = 0x200, flags = 2, seg_type = 8, may_create = 0, multidevice = 0, flag = 6, err = 0
>          f2fs_io-921     [013] .....  1049.856318: f2fs_lookup_extent_tree_start: dev = (253,16), ino = 5, pgofs = 512, type = Read
>          f2fs_io-921     [013] .....  1049.856318: f2fs_lookup_read_extent_tree_end: dev = (253,16), ino = 5, pgofs = 512, read_ext_info(fofs: 0, len: 0, blk: 0)
>          f2fs_io-921     [013] .....  1049.856323: f2fs_update_read_extent_tree_range: dev = (253,16), ino = 5, pgofs = 512, len = 352, blkaddr = 18432, c_len = 0
>          f2fs_io-921     [013] .....  1049.856328: f2fs_submit_folio_bio: dev = (253,16), ino = 1, folio_index = 0x6, oldaddr = 0x5556, newaddr = 0x5556, rw = READ(), type = HOT_NODE
>          f2fs_io-921     [013] .....  1049.856329: f2fs_submit_read_bio: dev = (253,16)/(253,16), rw = READ(), NODE, sector = 174768, size = 4096
>          f2fs_io-921     [021] .....  1049.856968: f2fs_update_read_extent_tree_range: dev = (253,16), ino = 5, pgofs = 864, len = 160, blkaddr = 18784, c_len = 0
>          f2fs_io-921     [021] .....  1049.857002: f2fs_map_blocks: dev = (253,16), ino = 5, file offset = 512, start blkaddr = 0x4800, len = 0x200, flags = 2, seg_type = 8, may_create = 0, multidevice = 0, flag = 6, err = 0
>          f2fs_io-921     [021] .....  1049.857003: f2fs_lookup_extent_tree_start: dev = (253,16), ino = 5, pgofs = 1025, type = Read
>          f2fs_io-921     [021] .....  1049.857004: f2fs_lookup_read_extent_tree_end: dev = (253,16), ino = 5, pgofs = 1025, read_ext_info(fofs: 0, len: 0, blk: 0)
>          f2fs_io-921     [021] .....  1049.857010: f2fs_update_read_extent_tree_range: dev = (253,16), ino = 5, pgofs = 1025, len = 511, blkaddr = 19457, c_len = 0
>          f2fs_io-921     [021] .....  1049.857011: f2fs_map_blocks: dev = (253,16), ino = 5, file offset = 1025, start blkaddr = 0x4c01, len = 0x1ff, flags = 2, seg_type = 8, may_create = 0, multidevice = 0, flag = 6, err = 0
>          f2fs_io-921     [021] .....  1049.857012: f2fs_lookup_extent_tree_start: dev = (253,16), ino = 5, pgofs = 1537, type = Read
>          f2fs_io-921     [021] .....  1049.857012: f2fs_lookup_read_extent_tree_end: dev = (253,16), ino = 5, pgofs = 1537, read_ext_info(fofs: 0, len: 0, blk: 0)
>          f2fs_io-921     [021] .....  1049.857016: f2fs_update_read_extent_tree_range: dev = (253,16), ino = 5, pgofs = 1537, len = 344, blkaddr = 20993, c_len = 0
>          f2fs_io-921     [021] .....  1049.857016: f2fs_map_blocks: dev = (253,16), ino = 5, file offset = 1537, start blkaddr = 0x5201, len = 0x158, flags = 2, seg_type = 8, may_create = 0, multidevice = 0, flag = 6, err = 0
>          f2fs_io-921     [021] .....  1049.857017: f2fs_lookup_extent_tree_start: dev = (253,16), ino = 5, pgofs = 1882, type = Read
>          f2fs_io-921     [021] .....  1049.857017: f2fs_lookup_read_extent_tree_end: dev = (253,16), ino = 5, pgofs = 1882, read_ext_info(fofs: 0, len: 0, blk: 0)
>          f2fs_io-921     [021] .....  1049.857024: f2fs_submit_folio_bio: dev = (253,16), ino = 1, folio_index = 0x7, oldaddr = 0x5555, newaddr = 0x5555, rw = READ(), type = HOT_NODE
>          f2fs_io-921     [021] .....  1049.857026: f2fs_submit_read_bio: dev = (253,16)/(253,16), rw = READ(), NODE, sector = 174760, size = 4096
>          f2fs_io-921     [021] .....  1049.857156: f2fs_map_blocks: dev = (253,16), ino = 5, file offset = 1882, start blkaddr = 0x5201, len = 0x0, flags = 0, seg_type = 8, may_create = 0, multidevice = 0, flag = 6, err = 0
> 
> It seems f2fs_update_read_extent_tree_range() won't insert a zero-sized extent?
> Or am I missing something?
> 
> Thanks,

Hi, Chao
I test it again with below steps:

./f2fs_io write 1 0 1881 rand dsync testfile
./f2fs_io fallocate 0 7708672 4096 testfile
./f2fs_io write 1 1881 1 rand buffered testfile
fsync testfile
umount
mount
./f2fs_io precache_extents testfile

         f2fs_io-8749    [003] .....    86.759281: f2fs_lookup_start: dev = (254,57), pino = 45485, name:testfile, flags:257
         f2fs_io-8749    [003] .....    86.759954: f2fs_iget: dev = (254,57), ino = 501391, pino = 45485, i_mode = 0x81ed, i_size = 7712768, i_nlink = 1, i_blocks = 15080, i_advise = 0x0
         f2fs_io-8749    [003] .....    86.759968: f2fs_lookup_end: dev = (254,57), pino = 45485, name:testfile, ino:501391, err:0
         f2fs_io-8749    [003] .....    86.760000: f2fs_lookup_extent_tree_start: dev = (254,57), ino = 501391, pgofs = 0, type = Read
         f2fs_io-8749    [003] .....    86.760020: f2fs_lookup_read_extent_tree_end: dev = (254,57), ino = 501391, pgofs = 0, read_ext_info(fofs: 0, len: 1881, blk: 3164707)
         f2fs_io-8749    [003] .....    86.760020: f2fs_map_blocks: dev = (254,57), ino = 501391, file offset = 0, start blkaddr = 0x304a23, len = 0x759, flags = 2, seg_type = 8, may_create = 0, multidevice = 0, flag = 6, err = 0
         f2fs_io-8749    [003] .....    86.760021: f2fs_lookup_extent_tree_start: dev = (254,57), ino = 501391, pgofs = 1881, type = Read
         f2fs_io-8749    [003] .....    86.760022: f2fs_lookup_read_extent_tree_end: dev = (254,57), ino = 501391, pgofs = 1881, read_ext_info(fofs: 0, len: 0, blk: 0)
         f2fs_io-8749    [005] .....    86.760162: f2fs_update_read_extent_tree_range: dev = (254,57), ino = 501391, pgofs = 1881, len = 1, blkaddr = 2688335, c_len = 0
    *****f2fs_io-8749    [005] .....    86.760324: f2fs_update_read_extent_tree_range: dev = (254,57), ino = 501391, pgofs = 1882, len = 0, blkaddr = 2688336, c_len = 0  ******
         f2fs_io-8749    [005] .....    86.760326: f2fs_map_blocks: dev = (254,57), ino = 501391, file offset = 1881, start blkaddr = 0x29054f, len = 0x1, flags = 2, seg_type = 8, may_create = 0, multidevice = 0, flag = 6, err = 0


inode:
i_ext: fofs:0 blkaddr:304a23 len:759
i_addr[0x9]     [0x  304a23 : 3164707]
....
i_addr[0x368]   [0x  304d82 : 3165570]

dnode1:
[0]    [0x  304d83 : 3165571]
[1016] [0x  30517b : 3166587]
...
[1017] [0x  29054f : 2688335]

dnode2:
[0]  	NEW_ADDR
[1]     [0x       0 : 0]
...




> > 
> > Fix it by skipping updating this kind of extent info.
> > 
> > Signed-off-by: wangzijie <wangzijie1@honor.com>
> > ---
> >  fs/f2fs/data.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index 7961e0ddf..b8bb71852 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -1649,6 +1649,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
> >  
> >  		switch (flag) {
> >  		case F2FS_GET_BLOCK_PRECACHE:
> > +			if (__is_valid_data_blkaddr(map->m_pblk) &&
> > +				start_pgofs - map->m_lblk == map->m_len)
> > +				map->m_flags &= ~F2FS_MAP_MAPPED;
> >  			goto sync_out;
> >  		case F2FS_GET_BLOCK_BMAP:
> >  			map->m_pblk = 0;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
