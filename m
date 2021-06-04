Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8D339C41D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  5 Jun 2021 01:52:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lpJby-0001PF-I6; Fri, 04 Jun 2021 23:52:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1lpJbv-0001P6-UT
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 23:52:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kF6hoq0W1SwX7eEVviEcuWTbiYUifKCtsdyRw6fvtcQ=; b=GFirnrFU4zS9HxnbCbC9Uk2D0Q
 UvpeynvYmAXF42ntc2gR29y2Q3iLlFD0cOq6r2zxeF7NbHqAG28AYKhplF3TH5or/RLdkHafNcUdT
 ljAhu7xlgTzL3G66C91h+pxKx7/+eZFSAXWQA4bpCKAy92udgIv98vBSQZ3DA5956jj4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kF6hoq0W1SwX7eEVviEcuWTbiYUifKCtsdyRw6fvtcQ=; b=Q906QSP+Xgc2NQXP/V4YjaFK5J
 yrSQ84nQSdbXtB/81nYJuuHgxQynf4KZtQVnN2jIogAjX0aY+RZa7nqAiTuLzxl6ovS4rl/y3zjUo
 WIBdzpePserXwLrvWc7RBabZw19wnl7Ny8hdygtQqmNWo+SL2r/q31xYB9lpCRAC+4Aw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lpJbi-00AzED-H7
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Jun 2021 23:52:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EBD6D610A1;
 Fri,  4 Jun 2021 23:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622850721;
 bh=qCjXgnCl9FdZQfRULw5SBfr3fWTQZ1wasT9D3vMby5U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oHTJrLgtTvGCAl9x9HsDbdhvPbSjhalRsvKvmZ3WctEqQUcnUMnCQIqtNjpXOYKtE
 6rCz8Iu8sKftaF45WN+nYXK5qx5IHpRHcDERMoaH7wu1QQyXF5mF5jqkBY1n3N6rKT
 djtaLdX0CTmmmDhz2nmGfhsJgXEHvBmdSAYwmnrW7lgxUyHuDgKH8D0dCydf4arevk
 uBCr8MIqc08u88x+pwq5hLjaLWkOaab6S4qxg1jCfyumgcylE3aoLv2HUHRsS7gPJQ
 De0onxAl6mBnXXTC6LAJ4pI+smQDaLswydbIW/HNVy+SMMNFrxjb+QT0I/y33R++bo
 5xvaFQw8o55GQ==
Date: Fri, 4 Jun 2021 16:51:58 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YLq8nlrxfotXnerU@google.com>
References: <20210526062927.52629-1-yuchao0@huawei.com>
 <YK5NXdyjgB6EFY5Q@google.com>
 <e4c1df88-f1f4-99e0-6f83-fa0f3110d737@kernel.org>
 <YK74cyGYzWZCmZue@google.com>
 <21ec5a95-bdbc-358d-99c7-e75e91228039@huawei.com>
 <ce4d1663-4082-625f-4c3f-858bf03bbb26@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce4d1663-4082-625f-4c3f-858bf03bbb26@kernel.org>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lpJbi-00AzED-H7
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: swap: remove dead codes
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/04, Chao Yu wrote:
> On 2021/5/27 10:12, Chao Yu wrote:
> > On 2021/5/27 9:40, Jaegeuk Kim wrote:
> > > On 05/26, Chao Yu wrote:
> > > > On 2021/5/26 21:30, Jaegeuk Kim wrote:
> > > > > On 05/26, Chao Yu wrote:
> > > > > > After commit af4b6b8edf6a ("f2fs: introduce check_swap_activate=
_fast()"),
> > > > > > we will never run into original logic of check_swap_activate() =
before
> > > > > > f2fs supports non 4k-sized page, so let's delete those dead cod=
es.
> > > > > =

> > > > > Why not keeping this for large page support in future maybe?
> > > > =

> > > > Well, if so, at that time, it would be better to refactor
> > > > check_swap_activate_fast() implementation based on f2fs_map_block()=
 rather
> > > > than refactoring check_swap_activate() implementation based on low =
efficient
> > > > bmap()?
> > > =

> > > Let's first check whether we support large page. Have you quickly tes=
ted it?
> > > If we support it now and current flow is just inefficient, I'd say ke=
eping but
> > > refactoring it later.
> > =

> > Let me check this, but I guess it missed to handle large page in lots o=
f flows,
> > not sure where we may panic at... :(
> =

> I've checked f2fs behavior on 64kb page size in arm64 vm,
> - 'ls -ls' will cause f2fs printing "invalid namelen(0), ino:%u, run fsck
> to fix." each time.
> - after touch a file and umount, fsck reports that image is corrupted.
> =

> F2FS uses PAGE_SIZE and F2FS_BLKSIZE directly in a lot of places, I doubt
> most of places may not consider large page size condition.
> =

> So, thoughts? I guess we have to admit we do not support 64KB page right
> now... :P

Yeah, we need to block the large page support unfortunately. :(

> =

> Thanks,
> =

> > =

> > Thanks,
> > =

> > > =

> > > > =

> > > > Thanks,
> > > > =

> > > > > =

> > > > > > =

> > > > > > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > > > > > ---
> > > > > > =A0=A0 fs/f2fs/data.c | 171 +----------------------------------=
--------------
> > > > > > =A0=A0 1 file changed, 3 insertions(+), 168 deletions(-)
> > > > > > =

> > > > > > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > > > > > index 3058c7e28b11..9c23fde93b76 100644
> > > > > > --- a/fs/f2fs/data.c
> > > > > > +++ b/fs/f2fs/data.c
> > > > > > @@ -3830,67 +3830,7 @@ int f2fs_migrate_page(struct address_spa=
ce *mapping,
> > > > > > =A0=A0 #endif
> > > > > > =A0=A0 #ifdef CONFIG_SWAP
> > > > > > -static int f2fs_is_file_aligned(struct inode *inode)
> > > > > > -{
> > > > > > -=A0=A0=A0 struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> > > > > > -=A0=A0=A0 block_t main_blkaddr =3D SM_I(sbi)->main_blkaddr;
> > > > > > -=A0=A0=A0 block_t cur_lblock;
> > > > > > -=A0=A0=A0 block_t last_lblock;
> > > > > > -=A0=A0=A0 block_t pblock;
> > > > > > -=A0=A0=A0 unsigned long nr_pblocks;
> > > > > > -=A0=A0=A0 unsigned int blocks_per_sec =3D BLKS_PER_SEC(sbi);
> > > > > > -=A0=A0=A0 unsigned int not_aligned =3D 0;
> > > > > > -=A0=A0=A0 int ret =3D 0;
> > > > > > -
> > > > > > -=A0=A0=A0 cur_lblock =3D 0;
> > > > > > -=A0=A0=A0 last_lblock =3D bytes_to_blks(inode, i_size_read(ino=
de));
> > > > > > -
> > > > > > -=A0=A0=A0 while (cur_lblock < last_lblock) {
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 struct f2fs_map_blocks map;
> > > > > > -
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 memset(&map, 0, sizeof(map));
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 map.m_lblk =3D cur_lblock;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 map.m_len =3D last_lblock - cur_lblock;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 map.m_next_pgofs =3D NULL;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 map.m_next_extent =3D NULL;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 map.m_seg_type =3D NO_CHECK_TYPE;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 map.m_may_create =3D false;
> > > > > > -
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 ret =3D f2fs_map_blocks(inode, &map, 0, =
F2FS_GET_BLOCK_FIEMAP);
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 if (ret)
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto out;
> > > > > > -
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 /* hole */
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 if (!(map.m_flags & F2FS_MAP_FLAGS)) {
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_err(sbi, "Swapfile has =
holes\n");
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D -ENOENT;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto out;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > -
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 pblock =3D map.m_pblk;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 nr_pblocks =3D map.m_len;
> > > > > > -
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 if ((pblock - main_blkaddr) & (blocks_pe=
r_sec - 1) ||
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 nr_pblocks & (blocks_per_sec=
 - 1)) {
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (f2fs_is_pinned_file(inod=
e)) {
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 f2fs_err(sbi, "S=
wapfile does not align to section");
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D -EINVAL;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto out;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 not_aligned++;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > -
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 cur_lblock +=3D nr_pblocks;
> > > > > > -=A0=A0=A0 }
> > > > > > -=A0=A0=A0 if (not_aligned)
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 f2fs_warn(sbi, "Swapfile (%u) is not ali=
gn to section: \n"
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "\t1) creat(), 2) ioctl(F2FS=
_IOC_SET_PIN_FILE), 3) fallocate()",
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 not_aligned);
> > > > > > -out:
> > > > > > -=A0=A0=A0 return ret;
> > > > > > -}
> > > > > > -
> > > > > > -static int check_swap_activate_fast(struct swap_info_struct *s=
is,
> > > > > > +static int check_swap_activate(struct swap_info_struct *sis,
> > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct f=
ile *swap_file, sector_t *span)
> > > > > > =A0=A0 {
> > > > > > =A0=A0=A0=A0=A0=A0 struct address_space *mapping =3D swap_file-=
>f_mapping;
> > > > > > @@ -3907,6 +3847,8 @@ static int check_swap_activate_fast(struc=
t swap_info_struct *sis,
> > > > > > =A0=A0=A0=A0=A0=A0 unsigned int not_aligned =3D 0;
> > > > > > =A0=A0=A0=A0=A0=A0 int ret =3D 0;
> > > > > > +=A0=A0=A0 f2fs_bug_on(sbi, PAGE_SIZE !=3D F2FS_BLKSIZE);
> > > > > > +
> > > > > > =A0=A0=A0=A0=A0=A0 /*
> > > > > > =A0=A0=A0=A0=A0=A0=A0 * Map all the blocks into the extent list=
.=A0 This code doesn't try
> > > > > > =A0=A0=A0=A0=A0=A0=A0 * to be very smart.
> > > > > > @@ -3986,113 +3928,6 @@ static int check_swap_activate_fast(str=
uct swap_info_struct *sis,
> > > > > > =A0=A0=A0=A0=A0=A0 return ret;
> > > > > > =A0=A0 }
> > > > > > -/* Copied from generic_swapfile_activate() to check any holes =
*/
> > > > > > -static int check_swap_activate(struct swap_info_struct *sis,
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct file *swa=
p_file, sector_t *span)
> > > > > > -{
> > > > > > -=A0=A0=A0 struct address_space *mapping =3D swap_file->f_mappi=
ng;
> > > > > > -=A0=A0=A0 struct inode *inode =3D mapping->host;
> > > > > > -=A0=A0=A0 struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> > > > > > -=A0=A0=A0 unsigned blocks_per_page;
> > > > > > -=A0=A0=A0 unsigned long page_no;
> > > > > > -=A0=A0=A0 sector_t probe_block;
> > > > > > -=A0=A0=A0 sector_t last_block;
> > > > > > -=A0=A0=A0 sector_t lowest_block =3D -1;
> > > > > > -=A0=A0=A0 sector_t highest_block =3D 0;
> > > > > > -=A0=A0=A0 int nr_extents =3D 0;
> > > > > > -=A0=A0=A0 int ret =3D 0;
> > > > > > -
> > > > > > -=A0=A0=A0 if (PAGE_SIZE =3D=3D F2FS_BLKSIZE)
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 return check_swap_activate_fast(sis, swa=
p_file, span);
> > > > > > -
> > > > > > -=A0=A0=A0 ret =3D f2fs_is_file_aligned(inode);
> > > > > > -=A0=A0=A0 if (ret)
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 goto out;
> > > > > > -
> > > > > > -=A0=A0=A0 blocks_per_page =3D bytes_to_blks(inode, PAGE_SIZE);
> > > > > > -
> > > > > > -=A0=A0=A0 /*
> > > > > > -=A0=A0=A0=A0 * Map all the blocks into the extent list.=A0 Thi=
s code doesn't try
> > > > > > -=A0=A0=A0=A0 * to be very smart.
> > > > > > -=A0=A0=A0=A0 */
> > > > > > -=A0=A0=A0 probe_block =3D 0;
> > > > > > -=A0=A0=A0 page_no =3D 0;
> > > > > > -=A0=A0=A0 last_block =3D bytes_to_blks(inode, i_size_read(inod=
e));
> > > > > > -=A0=A0=A0 while ((probe_block + blocks_per_page) <=3D last_blo=
ck &&
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 page_no < sis->max) {
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 unsigned block_in_page;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 sector_t first_block;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 sector_t block =3D 0;
> > > > > > -
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 cond_resched();
> > > > > > -
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 block =3D probe_block;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 ret =3D bmap(inode, &block);
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 if (ret)
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto out;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 if (!block)
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto bad_bmap;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 first_block =3D block;
> > > > > > -
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 /*
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0 * It must be PAGE_SIZE aligned on-disk
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0 */
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 if (first_block & (blocks_per_page - 1))=
 {
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 probe_block++;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto reprobe;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > -
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 for (block_in_page =3D 1; block_in_page =
< blocks_per_page;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bloc=
k_in_page++) {
> > > > > > -
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 block =3D probe_block + bloc=
k_in_page;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D bmap(inode, &block);
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (ret)
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto out;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!block)
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto bad_bmap;
> > > > > > -
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (block !=3D first_block +=
 block_in_page) {
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Discontiguity=
 */
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 probe_block++;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto reprobe;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > -
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 first_block >>=3D (PAGE_SHIFT - inode->i=
_blkbits);
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 if (page_no) {=A0=A0=A0 /* exclude the h=
eader page */
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (first_block < lowest_blo=
ck)
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 lowest_block =3D=
 first_block;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (first_block > highest_bl=
ock)
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 highest_block =
=3D first_block;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 }
> > > > > > -
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 /*
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0 * We found a PAGE_SIZE-length, PAGE_S=
IZE-aligned run of blocks
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0 */
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 ret =3D add_swap_extent(sis, page_no, 1,=
 first_block);
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 if (ret < 0)
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto out;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 nr_extents +=3D ret;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 page_no++;
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 probe_block +=3D blocks_per_page;
> > > > > > -reprobe:
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 continue;
> > > > > > -=A0=A0=A0 }
> > > > > > -=A0=A0=A0 ret =3D nr_extents;
> > > > > > -=A0=A0=A0 *span =3D 1 + highest_block - lowest_block;
> > > > > > -=A0=A0=A0 if (page_no =3D=3D 0)
> > > > > > -=A0=A0=A0=A0=A0=A0=A0 page_no =3D 1;=A0=A0=A0 /* force Empty m=
essage */
> > > > > > -=A0=A0=A0 sis->max =3D page_no;
> > > > > > -=A0=A0=A0 sis->pages =3D page_no - 1;
> > > > > > -=A0=A0=A0 sis->highest_bit =3D page_no - 1;
> > > > > > -out:
> > > > > > -=A0=A0=A0 return ret;
> > > > > > -bad_bmap:
> > > > > > -=A0=A0=A0 f2fs_err(sbi, "Swapfile has holes\n");
> > > > > > -=A0=A0=A0 return -EINVAL;
> > > > > > -}
> > > > > > -
> > > > > > =A0=A0 static int f2fs_swap_activate(struct swap_info_struct *s=
is, struct file *file,
> > > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sector_t=
 *span)
> > > > > > =A0=A0 {
> > > > > > -- =

> > > > > > 2.29.2
> > > .
> > > =



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
