Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F9E1251C3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Dec 2019 20:24:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ihevW-00027C-Ee; Wed, 18 Dec 2019 19:24:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <darrick.wong@oracle.com>) id 1ihevV-000271-Ow
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 19:24:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tnpSkD3PyQg3qyuFNzFdGihBE+SRwrl1WHntdclf1So=; b=DEBmmJPPtl3Hu0zPRGcKyFpQE1
 NLJ1KyJAdIDv8S6gyehqYGqSX1RsP/WNdw7aOVX4MFK3unxxW08U2tow/6UMsW3fR8jZEzrEyRXC3
 HBRzaZIQYBvVWYeVK4P2yQd83pRkJQvA9bvsK7G8jgIw0ROI+O9dKp6tPJk/yj/o9jgI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tnpSkD3PyQg3qyuFNzFdGihBE+SRwrl1WHntdclf1So=; b=BboGw3E5nMDcaurO5leF54y7OW
 qHoLREn78lODRTOGukdNViwLdgrOu+PQ1FFxbXrUaReHYpz6YkPaEYZqMPkA5+D7xTQ7YnwMSD9rg
 zioiwtxbWSWClieLqz8KVrJ5yaWNpq7bZxE75RnpFgkJjxp9B19w7rG7x7ChyTirBuS4=;
Received: from aserp2120.oracle.com ([141.146.126.78])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ihevS-008zpU-09
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 19:24:05 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBIJJJCH111940;
 Wed, 18 Dec 2019 19:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=tnpSkD3PyQg3qyuFNzFdGihBE+SRwrl1WHntdclf1So=;
 b=bQbgh15Gu3DrbNQyfISBQ0I7Kgucxj4BTQ8Ap+lP6uWTFZc0lF4+svBD9FWNQfGBmuxI
 HrT8zom004Ud0YaXW5BBuU0gLcuJCsCuUKZwSOI3/hP9MP3ZuPIn9o/BTKJN7b2T3asa
 /vVVhtXgpkYMsN4s8wBnrEgdRYcqCp4OoTRnXMZ+kgkwir2YFfyfe1MHzQ9FeFI5irPH
 HvJohIJg1BmIIOe3CW0FDyDaTNcLwZGTdl40ADmcXAXqTGeMoi8dCHDcrbO134RroVPC
 eNE+LkufaIYI3bHVt6lBM1oRkkHFK7ahrYgIBOWGWBcH1GZQlzmi7f9OG4Q/Rfrh68fa Jg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2wvqpqfq24-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Dec 2019 19:23:39 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBIJJFGF108432;
 Wed, 18 Dec 2019 19:23:39 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2wyp4y0082-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Dec 2019 19:23:38 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xBIJNYnO020087;
 Wed, 18 Dec 2019 19:23:34 GMT
Received: from localhost (/67.169.218.210)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 18 Dec 2019 11:23:34 -0800
Date: Wed, 18 Dec 2019 11:23:31 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20191218192331.GA7473@magnolia>
References: <20191218130935.32402-1-agruenba@redhat.com>
 <20191218185216.GA7497@magnolia>
 <CAHc6FU7vuiN4iCB3TthLaow+7c41UUS0MYEeiJ5b1iPStT=+sA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHc6FU7vuiN4iCB3TthLaow+7c41UUS0MYEeiJ5b1iPStT=+sA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9475
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912180150
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9475
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912180150
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: nod.at]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ihevS-008zpU-09
Subject: Re: [f2fs-dev] [PATCH v3] fs: Fix page_mkwrite off-by-one errors
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
Cc: Jan Kara <jack@suse.cz>, Adrian Hunter <adrian.hunter@intel.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Sage Weil <sage@redhat.com>, Richard Weinberger <richard@nod.at>,
 Christoph Hellwig <hch@infradead.org>, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4 <linux-ext4@vger.kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 Ceph Development <ceph-devel@vger.kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Artem Bityutskiy <dedekind1@gmail.com>, Jeff Layton <jlayton@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Dec 18, 2019 at 08:15:36PM +0100, Andreas Gruenbacher wrote:
> On Wed, Dec 18, 2019 at 7:55 PM Darrick J. Wong <darrick.wong@oracle.com> wrote:
> > On Wed, Dec 18, 2019 at 02:09:35PM +0100, Andreas Gruenbacher wrote:
> > > Hi Darrick,
> > >
> > > can this fix go in via the xfs tree?
> >
> > Er, I'd rather not touch five other filesystems via the XFS tree.
> > However, a more immediate problem that I think I see is...
> >
> > > Thanks,
> > > Andreas
> > >
> > > --
> > >
> > > The check in block_page_mkwrite that is meant to determine whether an
> > > offset is within the inode size is off by one.  This bug has been copied
> > > into iomap_page_mkwrite and several filesystems (ubifs, ext4, f2fs,
> > > ceph).
> > >
> > > Fix that by introducing a new page_mkwrite_check_truncate helper that
> > > checks for truncate and computes the bytes in the page up to EOF.  Use
> > > the helper in the above mentioned filesystems.
> > >
> > > In addition, use the new helper in btrfs as well.
> > >
> > > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> > > Acked-by: David Sterba <dsterba@suse.com> (btrfs part)
> > > Acked-by: Richard Weinberger <richard@nod.at> (ubifs part)
> > > ---
> > >  fs/btrfs/inode.c        | 15 ++++-----------
> > >  fs/buffer.c             | 16 +++-------------
> > >  fs/ceph/addr.c          |  2 +-
> > >  fs/ext4/inode.c         | 14 ++++----------
> > >  fs/f2fs/file.c          | 19 +++++++------------
> > >  fs/iomap/buffered-io.c  | 18 +++++-------------
> > >  fs/ubifs/file.c         |  3 +--
> > >  include/linux/pagemap.h | 28 ++++++++++++++++++++++++++++
> > >  8 files changed, 53 insertions(+), 62 deletions(-)
> > >
> > > diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
> > > index 56032c518b26..86c6fcd8139d 100644
> > > --- a/fs/btrfs/inode.c
> > > +++ b/fs/btrfs/inode.c
> > > @@ -9016,13 +9016,11 @@ vm_fault_t btrfs_page_mkwrite(struct vm_fault *vmf)
> > >       ret = VM_FAULT_NOPAGE; /* make the VM retry the fault */
> > >  again:
> > >       lock_page(page);
> > > -     size = i_size_read(inode);
> > >
> > > -     if ((page->mapping != inode->i_mapping) ||
> > > -         (page_start >= size)) {
> > > -             /* page got truncated out from underneath us */
> > > +     ret2 = page_mkwrite_check_truncate(page, inode);
> > > +     if (ret2 < 0)
> > >               goto out_unlock;
> >
> > ...here we try to return -EFAULT as vm_fault_t.  Notice how btrfs returns
> > VM_FAULT_* values directly and never calls block_page_mkwrite_return?  I
> > know dsterba acked this, but I cannot see how this is correct?
> 
> Well, page_mkwrite_check_truncate can only fail with -EFAULT, in which
> case btrfs_page_mkwrite will return VM_FAULT_NOPAGE. It would be
> cleaner not to discard page_mkwrite_check_truncate's return value
> though.

*OH*, because we're stuffing the value in ret2, not ret.  Ok, that makes
more sense.  Er, I guess I don't mind pushing via iomap tree, but could
we get some acks from Ted and any of the ceph maintainers?

--D

> > > -     }
> > > +     zero_start = ret2;
> > >       wait_on_page_writeback(page);
> > >
> > >       lock_extent_bits(io_tree, page_start, page_end, &cached_state);
> > > @@ -9043,6 +9041,7 @@ vm_fault_t btrfs_page_mkwrite(struct vm_fault *vmf)
> > >               goto again;
> > >       }
> > >
> > > +     size = i_size_read(inode);
> > >       if (page->index == ((size - 1) >> PAGE_SHIFT)) {
> > >               reserved_space = round_up(size - page_start,
> > >                                         fs_info->sectorsize);
> > > @@ -9075,12 +9074,6 @@ vm_fault_t btrfs_page_mkwrite(struct vm_fault *vmf)
> > >       }
> > >       ret2 = 0;
> > >
> > > -     /* page is wholly or partially inside EOF */
> > > -     if (page_start + PAGE_SIZE > size)
> > > -             zero_start = offset_in_page(size);
> > > -     else
> > > -             zero_start = PAGE_SIZE;
> > > -
> > >       if (zero_start != PAGE_SIZE) {
> > >               kaddr = kmap(page);
> > >               memset(kaddr + zero_start, 0, PAGE_SIZE - zero_start);
> > > diff --git a/fs/buffer.c b/fs/buffer.c
> > > index d8c7242426bb..53aabde57ca7 100644
> > > --- a/fs/buffer.c
> > > +++ b/fs/buffer.c
> > > @@ -2499,23 +2499,13 @@ int block_page_mkwrite(struct vm_area_struct *vma, struct vm_fault *vmf,
> > >       struct page *page = vmf->page;
> > >       struct inode *inode = file_inode(vma->vm_file);
> > >       unsigned long end;
> > > -     loff_t size;
> > >       int ret;
> > >
> > >       lock_page(page);
> > > -     size = i_size_read(inode);
> > > -     if ((page->mapping != inode->i_mapping) ||
> > > -         (page_offset(page) > size)) {
> > > -             /* We overload EFAULT to mean page got truncated */
> > > -             ret = -EFAULT;
> > > +     ret = page_mkwrite_check_truncate(page, inode);
> > > +     if (ret < 0)
> > >               goto out_unlock;
> > > -     }
> > > -
> > > -     /* page is wholly or partially inside EOF */
> > > -     if (((page->index + 1) << PAGE_SHIFT) > size)
> > > -             end = size & ~PAGE_MASK;
> > > -     else
> > > -             end = PAGE_SIZE;
> > > +     end = ret;
> > >
> > >       ret = __block_write_begin(page, 0, end, get_block);
> > >       if (!ret)
> > > diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> > > index 7ab616601141..ef958aa4adb4 100644
> > > --- a/fs/ceph/addr.c
> > > +++ b/fs/ceph/addr.c
> > > @@ -1575,7 +1575,7 @@ static vm_fault_t ceph_page_mkwrite(struct vm_fault *vmf)
> > >       do {
> > >               lock_page(page);
> > >
> > > -             if ((off > size) || (page->mapping != inode->i_mapping)) {
> > > +             if (page_mkwrite_check_truncate(page, inode) < 0) {
> > >                       unlock_page(page);
> > >                       ret = VM_FAULT_NOPAGE;
> > >                       break;
> > > diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> > > index 28f28de0c1b6..51ab1d2cac80 100644
> > > --- a/fs/ext4/inode.c
> > > +++ b/fs/ext4/inode.c
> > > @@ -5871,7 +5871,6 @@ vm_fault_t ext4_page_mkwrite(struct vm_fault *vmf)
> > >  {
> > >       struct vm_area_struct *vma = vmf->vma;
> > >       struct page *page = vmf->page;
> > > -     loff_t size;
> > >       unsigned long len;
> > >       int err;
> > >       vm_fault_t ret;
> > > @@ -5907,18 +5906,13 @@ vm_fault_t ext4_page_mkwrite(struct vm_fault *vmf)
> > >       }
> > >
> > >       lock_page(page);
> > > -     size = i_size_read(inode);
> > > -     /* Page got truncated from under us? */
> > > -     if (page->mapping != mapping || page_offset(page) > size) {
> > > +     err = page_mkwrite_check_truncate(page, inode);
> > > +     if (err < 0) {
> > >               unlock_page(page);
> > > -             ret = VM_FAULT_NOPAGE;
> > > -             goto out;
> > > +             goto out_ret;
> > >       }
> > > +     len = err;
> > >
> > > -     if (page->index == size >> PAGE_SHIFT)
> > > -             len = size & ~PAGE_MASK;
> > > -     else
> > > -             len = PAGE_SIZE;
> > >       /*
> > >        * Return if we have all the buffers mapped. This avoids the need to do
> > >        * journal_start/journal_stop which can block and take a long time
> > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > > index 85af112e868d..0e77b2e6f873 100644
> > > --- a/fs/f2fs/file.c
> > > +++ b/fs/f2fs/file.c
> > > @@ -51,7 +51,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
> > >       struct inode *inode = file_inode(vmf->vma->vm_file);
> > >       struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> > >       struct dnode_of_data dn = { .node_changed = false };
> > > -     int err;
> > > +     int offset, err;
> > >
> > >       if (unlikely(f2fs_cp_error(sbi))) {
> > >               err = -EIO;
> > > @@ -70,13 +70,14 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
> > >       file_update_time(vmf->vma->vm_file);
> > >       down_read(&F2FS_I(inode)->i_mmap_sem);
> > >       lock_page(page);
> > > -     if (unlikely(page->mapping != inode->i_mapping ||
> > > -                     page_offset(page) > i_size_read(inode) ||
> > > -                     !PageUptodate(page))) {
> > > +     err = -EFAULT;
> > > +     if (likely(PageUptodate(page)))
> > > +             err = page_mkwrite_check_truncate(page, inode);
> > > +     if (unlikely(err < 0)) {
> > >               unlock_page(page);
> > > -             err = -EFAULT;
> > >               goto out_sem;
> > >       }
> > > +     offset = err;
> > >
> > >       /* block allocation */
> > >       __do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, true);
> > > @@ -101,14 +102,8 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
> > >       if (PageMappedToDisk(page))
> > >               goto out_sem;
> > >
> > > -     /* page is wholly or partially inside EOF */
> > > -     if (((loff_t)(page->index + 1) << PAGE_SHIFT) >
> > > -                                             i_size_read(inode)) {
> > > -             loff_t offset;
> > > -
> > > -             offset = i_size_read(inode) & ~PAGE_MASK;
> > > +     if (offset != PAGE_SIZE)
> > >               zero_user_segment(page, offset, PAGE_SIZE);
> > > -     }
> > >       set_page_dirty(page);
> > >       if (!PageUptodate(page))
> > >               SetPageUptodate(page);
> > > diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> > > index d33c7bc5ee92..1aaf157fd6e9 100644
> > > --- a/fs/iomap/buffered-io.c
> > > +++ b/fs/iomap/buffered-io.c
> > > @@ -1062,24 +1062,16 @@ vm_fault_t iomap_page_mkwrite(struct vm_fault *vmf, const struct iomap_ops *ops)
> > >       struct page *page = vmf->page;
> > >       struct inode *inode = file_inode(vmf->vma->vm_file);
> > >       unsigned long length;
> > > -     loff_t offset, size;
> > > +     loff_t offset;
> > >       ssize_t ret;
> > >
> > >       lock_page(page);
> > > -     size = i_size_read(inode);
> > > -     offset = page_offset(page);
> > > -     if (page->mapping != inode->i_mapping || offset > size) {
> > > -             /* We overload EFAULT to mean page got truncated */
> > > -             ret = -EFAULT;
> > > +     ret = page_mkwrite_check_truncate(page, inode);
> > > +     if (ret < 0)
> > >               goto out_unlock;
> > > -     }
> > > -
> > > -     /* page is wholly or partially inside EOF */
> > > -     if (offset > size - PAGE_SIZE)
> > > -             length = offset_in_page(size);
> > > -     else
> > > -             length = PAGE_SIZE;
> > > +     length = ret;
> > >
> > > +     offset = page_offset(page);
> > >       while (length > 0) {
> > >               ret = iomap_apply(inode, offset, length,
> > >                               IOMAP_WRITE | IOMAP_FAULT, ops, page,
> > > diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> > > index cd52585c8f4f..91f7a1f2db0d 100644
> > > --- a/fs/ubifs/file.c
> > > +++ b/fs/ubifs/file.c
> > > @@ -1563,8 +1563,7 @@ static vm_fault_t ubifs_vm_page_mkwrite(struct vm_fault *vmf)
> > >       }
> > >
> > >       lock_page(page);
> > > -     if (unlikely(page->mapping != inode->i_mapping ||
> > > -                  page_offset(page) > i_size_read(inode))) {
> > > +     if (unlikely(page_mkwrite_check_truncate(page, inode) < 0)) {
> > >               /* Page got truncated out from underneath us */
> > >               goto sigbus;
> > >       }
> > > diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> > > index 37a4d9e32cd3..ccb14b6a16b5 100644
> > > --- a/include/linux/pagemap.h
> > > +++ b/include/linux/pagemap.h
> > > @@ -636,4 +636,32 @@ static inline unsigned long dir_pages(struct inode *inode)
> > >                              PAGE_SHIFT;
> > >  }
> > >
> > > +/**
> > > + * page_mkwrite_check_truncate - check if page was truncated
> > > + * @page: the page to check
> > > + * @inode: the inode to check the page against
> > > + *
> > > + * Returns the number of bytes in the page up to EOF,
> > > + * or -EFAULT if the page was truncated.
> > > + */
> > > +static inline int page_mkwrite_check_truncate(struct page *page,
> > > +                                           struct inode *inode)
> > > +{
> > > +     loff_t size = i_size_read(inode);
> > > +     pgoff_t index = size >> PAGE_SHIFT;
> > > +     int offset = offset_in_page(size);
> > > +
> > > +     if (page->mapping != inode->i_mapping)
> > > +             return -EFAULT;
> > > +
> > > +     /* page is wholly inside EOF */
> > > +     if (page->index < index)
> > > +             return PAGE_SIZE;
> > > +     /* page is wholly past EOF */
> > > +     if (page->index > index || !offset)
> > > +             return -EFAULT;
> > > +     /* page is partially inside EOF */
> > > +     return offset;
> > > +}
> > > +
> > >  #endif /* _LINUX_PAGEMAP_H */
> > > --
> > > 2.20.1
> > >
> >
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
