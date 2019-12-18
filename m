Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6BC1251A3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Dec 2019 20:16:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ihenn-00016r-M8; Wed, 18 Dec 2019 19:16:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <agruenba@redhat.com>) id 1ihenl-00016a-OM
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 19:16:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8Y2SO2t4Sj44YjHjUzYvcbhq0Hhs8JqsHCivGnp2aZQ=; b=OrUQJFaxcZNUiE55EMjUH39+s/
 /oVF1uI8If/3TxVelg5ltUvkJAnfcNOGeU4+L8W6vCCZ+f6MANjqYA6fQ3FYaFthWts6DASc53pXB
 4x5CqKKmvaEpDUkk9rLmsqNfV4uWpLht0w5hJjTJRbO0B3bwbDc48GluEGmgCdWxbcJI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8Y2SO2t4Sj44YjHjUzYvcbhq0Hhs8JqsHCivGnp2aZQ=; b=X+gE28wLlaDx12Mh7zpHj8w9tR
 pPqH6rqGlOockvL/1wXHjkOXfEL4bOr3C8zwAsL5ICf51hZwSo+AUxT4GIsJA+oxqehkRJsdLKFzh
 FaVm77RO4dFDkZiEo4DW8r5fHcTEaLQ7T0G5/NmuDcoEhCeRbZDqkt3ohGRj8A7Wt71Q=;
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1iheng-006326-4U
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Dec 2019 19:16:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576696550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Y2SO2t4Sj44YjHjUzYvcbhq0Hhs8JqsHCivGnp2aZQ=;
 b=GOtZJSA8RIEa+q5n6qefOfdir0ebWLTEcWfB9cjW8B1G5msXntIR93ocSXVSKepGEuOZiS
 WkCYSWPDFDn3dDdARpgcukMgansrdmcftHAp27WAxu369E/fJYVQm2RIni2zsKd1+O3hed
 PZAepwBDJcBxG8+pZaPfBBRohF7A1uo=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-yhNx6gW9NyGGbpz5Uca9QQ-1; Wed, 18 Dec 2019 14:15:48 -0500
Received: by mail-ot1-f71.google.com with SMTP id s91so1643158otb.14
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Dec 2019 11:15:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BI86kbjNK5OIjHooEHH2J/tEyhoDO3I49BPUrOkTzBA=;
 b=BRCexDsQ6yceEUrflG6fATVB1JpyrqCrpxWlYROFBV5tDuhP46OXPKyDpsjpIOu1Fu
 s5eSIrQaZRRmBxDaWp6dgHSDkRlnTC2No3lFIGGKsSOOfmB1FtcA9ABtxmtH1E2KuLp3
 PsM1/UxFKGzIizO5F6xhGUUtrQV5us+GLQqXBK3tqNMAEx8L356tb36yPmIdAnt5/Bu4
 tCgd+fPub1umDCxGupDIlvWYvb+OcxcJ40Su8QRPRuOoCVMVKazMeqZSYwtbNuBWdap8
 du3E9jwGULDJ9HrWivYeSDLcgCpjAeFhKCBfIWugsQieQ+ZHOquFaR+YETZ8I/IC43iA
 blow==
X-Gm-Message-State: APjAAAUmrUJT+w4/C2assrR6zug+XydsBWkt/O5uy5PGHQZ4TyWU3gXi
 RcpAYlT0ozDZ8RSD968Az06f4ewyvvDlCtEdmckLQ2bR2RXGTyEQKRaGtcsUOWuTRGCUcWOyZoE
 /hILjQBocJ+5zwiyUNecOtE8SWGym2D03MPyelf9oY2DlSKafnz2t6Q==
X-Received: by 2002:aca:dd43:: with SMTP id u64mr1215582oig.101.1576696547955; 
 Wed, 18 Dec 2019 11:15:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqxoq1DKGgFPtnMGhoAJMtcbciDkEMQytNX8AvkNkVK8lsW2C3r+w7lObZV7/fv72rv4hWG2JYKDz2uChLbujCg=
X-Received: by 2002:aca:dd43:: with SMTP id u64mr1215556oig.101.1576696547536; 
 Wed, 18 Dec 2019 11:15:47 -0800 (PST)
MIME-Version: 1.0
References: <20191218130935.32402-1-agruenba@redhat.com>
 <20191218185216.GA7497@magnolia>
In-Reply-To: <20191218185216.GA7497@magnolia>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 18 Dec 2019 20:15:36 +0100
Message-ID: <CAHc6FU7vuiN4iCB3TthLaow+7c41UUS0MYEeiJ5b1iPStT=+sA@mail.gmail.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
X-MC-Unique: yhNx6gW9NyGGbpz5Uca9QQ-1
X-Mimecast-Spam-Score: 0
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iheng-006326-4U
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

On Wed, Dec 18, 2019 at 7:55 PM Darrick J. Wong <darrick.wong@oracle.com> wrote:
> On Wed, Dec 18, 2019 at 02:09:35PM +0100, Andreas Gruenbacher wrote:
> > Hi Darrick,
> >
> > can this fix go in via the xfs tree?
>
> Er, I'd rather not touch five other filesystems via the XFS tree.
> However, a more immediate problem that I think I see is...
>
> > Thanks,
> > Andreas
> >
> > --
> >
> > The check in block_page_mkwrite that is meant to determine whether an
> > offset is within the inode size is off by one.  This bug has been copied
> > into iomap_page_mkwrite and several filesystems (ubifs, ext4, f2fs,
> > ceph).
> >
> > Fix that by introducing a new page_mkwrite_check_truncate helper that
> > checks for truncate and computes the bytes in the page up to EOF.  Use
> > the helper in the above mentioned filesystems.
> >
> > In addition, use the new helper in btrfs as well.
> >
> > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> > Acked-by: David Sterba <dsterba@suse.com> (btrfs part)
> > Acked-by: Richard Weinberger <richard@nod.at> (ubifs part)
> > ---
> >  fs/btrfs/inode.c        | 15 ++++-----------
> >  fs/buffer.c             | 16 +++-------------
> >  fs/ceph/addr.c          |  2 +-
> >  fs/ext4/inode.c         | 14 ++++----------
> >  fs/f2fs/file.c          | 19 +++++++------------
> >  fs/iomap/buffered-io.c  | 18 +++++-------------
> >  fs/ubifs/file.c         |  3 +--
> >  include/linux/pagemap.h | 28 ++++++++++++++++++++++++++++
> >  8 files changed, 53 insertions(+), 62 deletions(-)
> >
> > diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
> > index 56032c518b26..86c6fcd8139d 100644
> > --- a/fs/btrfs/inode.c
> > +++ b/fs/btrfs/inode.c
> > @@ -9016,13 +9016,11 @@ vm_fault_t btrfs_page_mkwrite(struct vm_fault *vmf)
> >       ret = VM_FAULT_NOPAGE; /* make the VM retry the fault */
> >  again:
> >       lock_page(page);
> > -     size = i_size_read(inode);
> >
> > -     if ((page->mapping != inode->i_mapping) ||
> > -         (page_start >= size)) {
> > -             /* page got truncated out from underneath us */
> > +     ret2 = page_mkwrite_check_truncate(page, inode);
> > +     if (ret2 < 0)
> >               goto out_unlock;
>
> ...here we try to return -EFAULT as vm_fault_t.  Notice how btrfs returns
> VM_FAULT_* values directly and never calls block_page_mkwrite_return?  I
> know dsterba acked this, but I cannot see how this is correct?

Well, page_mkwrite_check_truncate can only fail with -EFAULT, in which
case btrfs_page_mkwrite will return VM_FAULT_NOPAGE. It would be
cleaner not to discard page_mkwrite_check_truncate's return value
though.

> > -     }
> > +     zero_start = ret2;
> >       wait_on_page_writeback(page);
> >
> >       lock_extent_bits(io_tree, page_start, page_end, &cached_state);
> > @@ -9043,6 +9041,7 @@ vm_fault_t btrfs_page_mkwrite(struct vm_fault *vmf)
> >               goto again;
> >       }
> >
> > +     size = i_size_read(inode);
> >       if (page->index == ((size - 1) >> PAGE_SHIFT)) {
> >               reserved_space = round_up(size - page_start,
> >                                         fs_info->sectorsize);
> > @@ -9075,12 +9074,6 @@ vm_fault_t btrfs_page_mkwrite(struct vm_fault *vmf)
> >       }
> >       ret2 = 0;
> >
> > -     /* page is wholly or partially inside EOF */
> > -     if (page_start + PAGE_SIZE > size)
> > -             zero_start = offset_in_page(size);
> > -     else
> > -             zero_start = PAGE_SIZE;
> > -
> >       if (zero_start != PAGE_SIZE) {
> >               kaddr = kmap(page);
> >               memset(kaddr + zero_start, 0, PAGE_SIZE - zero_start);
> > diff --git a/fs/buffer.c b/fs/buffer.c
> > index d8c7242426bb..53aabde57ca7 100644
> > --- a/fs/buffer.c
> > +++ b/fs/buffer.c
> > @@ -2499,23 +2499,13 @@ int block_page_mkwrite(struct vm_area_struct *vma, struct vm_fault *vmf,
> >       struct page *page = vmf->page;
> >       struct inode *inode = file_inode(vma->vm_file);
> >       unsigned long end;
> > -     loff_t size;
> >       int ret;
> >
> >       lock_page(page);
> > -     size = i_size_read(inode);
> > -     if ((page->mapping != inode->i_mapping) ||
> > -         (page_offset(page) > size)) {
> > -             /* We overload EFAULT to mean page got truncated */
> > -             ret = -EFAULT;
> > +     ret = page_mkwrite_check_truncate(page, inode);
> > +     if (ret < 0)
> >               goto out_unlock;
> > -     }
> > -
> > -     /* page is wholly or partially inside EOF */
> > -     if (((page->index + 1) << PAGE_SHIFT) > size)
> > -             end = size & ~PAGE_MASK;
> > -     else
> > -             end = PAGE_SIZE;
> > +     end = ret;
> >
> >       ret = __block_write_begin(page, 0, end, get_block);
> >       if (!ret)
> > diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> > index 7ab616601141..ef958aa4adb4 100644
> > --- a/fs/ceph/addr.c
> > +++ b/fs/ceph/addr.c
> > @@ -1575,7 +1575,7 @@ static vm_fault_t ceph_page_mkwrite(struct vm_fault *vmf)
> >       do {
> >               lock_page(page);
> >
> > -             if ((off > size) || (page->mapping != inode->i_mapping)) {
> > +             if (page_mkwrite_check_truncate(page, inode) < 0) {
> >                       unlock_page(page);
> >                       ret = VM_FAULT_NOPAGE;
> >                       break;
> > diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> > index 28f28de0c1b6..51ab1d2cac80 100644
> > --- a/fs/ext4/inode.c
> > +++ b/fs/ext4/inode.c
> > @@ -5871,7 +5871,6 @@ vm_fault_t ext4_page_mkwrite(struct vm_fault *vmf)
> >  {
> >       struct vm_area_struct *vma = vmf->vma;
> >       struct page *page = vmf->page;
> > -     loff_t size;
> >       unsigned long len;
> >       int err;
> >       vm_fault_t ret;
> > @@ -5907,18 +5906,13 @@ vm_fault_t ext4_page_mkwrite(struct vm_fault *vmf)
> >       }
> >
> >       lock_page(page);
> > -     size = i_size_read(inode);
> > -     /* Page got truncated from under us? */
> > -     if (page->mapping != mapping || page_offset(page) > size) {
> > +     err = page_mkwrite_check_truncate(page, inode);
> > +     if (err < 0) {
> >               unlock_page(page);
> > -             ret = VM_FAULT_NOPAGE;
> > -             goto out;
> > +             goto out_ret;
> >       }
> > +     len = err;
> >
> > -     if (page->index == size >> PAGE_SHIFT)
> > -             len = size & ~PAGE_MASK;
> > -     else
> > -             len = PAGE_SIZE;
> >       /*
> >        * Return if we have all the buffers mapped. This avoids the need to do
> >        * journal_start/journal_stop which can block and take a long time
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 85af112e868d..0e77b2e6f873 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -51,7 +51,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
> >       struct inode *inode = file_inode(vmf->vma->vm_file);
> >       struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> >       struct dnode_of_data dn = { .node_changed = false };
> > -     int err;
> > +     int offset, err;
> >
> >       if (unlikely(f2fs_cp_error(sbi))) {
> >               err = -EIO;
> > @@ -70,13 +70,14 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
> >       file_update_time(vmf->vma->vm_file);
> >       down_read(&F2FS_I(inode)->i_mmap_sem);
> >       lock_page(page);
> > -     if (unlikely(page->mapping != inode->i_mapping ||
> > -                     page_offset(page) > i_size_read(inode) ||
> > -                     !PageUptodate(page))) {
> > +     err = -EFAULT;
> > +     if (likely(PageUptodate(page)))
> > +             err = page_mkwrite_check_truncate(page, inode);
> > +     if (unlikely(err < 0)) {
> >               unlock_page(page);
> > -             err = -EFAULT;
> >               goto out_sem;
> >       }
> > +     offset = err;
> >
> >       /* block allocation */
> >       __do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, true);
> > @@ -101,14 +102,8 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
> >       if (PageMappedToDisk(page))
> >               goto out_sem;
> >
> > -     /* page is wholly or partially inside EOF */
> > -     if (((loff_t)(page->index + 1) << PAGE_SHIFT) >
> > -                                             i_size_read(inode)) {
> > -             loff_t offset;
> > -
> > -             offset = i_size_read(inode) & ~PAGE_MASK;
> > +     if (offset != PAGE_SIZE)
> >               zero_user_segment(page, offset, PAGE_SIZE);
> > -     }
> >       set_page_dirty(page);
> >       if (!PageUptodate(page))
> >               SetPageUptodate(page);
> > diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> > index d33c7bc5ee92..1aaf157fd6e9 100644
> > --- a/fs/iomap/buffered-io.c
> > +++ b/fs/iomap/buffered-io.c
> > @@ -1062,24 +1062,16 @@ vm_fault_t iomap_page_mkwrite(struct vm_fault *vmf, const struct iomap_ops *ops)
> >       struct page *page = vmf->page;
> >       struct inode *inode = file_inode(vmf->vma->vm_file);
> >       unsigned long length;
> > -     loff_t offset, size;
> > +     loff_t offset;
> >       ssize_t ret;
> >
> >       lock_page(page);
> > -     size = i_size_read(inode);
> > -     offset = page_offset(page);
> > -     if (page->mapping != inode->i_mapping || offset > size) {
> > -             /* We overload EFAULT to mean page got truncated */
> > -             ret = -EFAULT;
> > +     ret = page_mkwrite_check_truncate(page, inode);
> > +     if (ret < 0)
> >               goto out_unlock;
> > -     }
> > -
> > -     /* page is wholly or partially inside EOF */
> > -     if (offset > size - PAGE_SIZE)
> > -             length = offset_in_page(size);
> > -     else
> > -             length = PAGE_SIZE;
> > +     length = ret;
> >
> > +     offset = page_offset(page);
> >       while (length > 0) {
> >               ret = iomap_apply(inode, offset, length,
> >                               IOMAP_WRITE | IOMAP_FAULT, ops, page,
> > diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> > index cd52585c8f4f..91f7a1f2db0d 100644
> > --- a/fs/ubifs/file.c
> > +++ b/fs/ubifs/file.c
> > @@ -1563,8 +1563,7 @@ static vm_fault_t ubifs_vm_page_mkwrite(struct vm_fault *vmf)
> >       }
> >
> >       lock_page(page);
> > -     if (unlikely(page->mapping != inode->i_mapping ||
> > -                  page_offset(page) > i_size_read(inode))) {
> > +     if (unlikely(page_mkwrite_check_truncate(page, inode) < 0)) {
> >               /* Page got truncated out from underneath us */
> >               goto sigbus;
> >       }
> > diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> > index 37a4d9e32cd3..ccb14b6a16b5 100644
> > --- a/include/linux/pagemap.h
> > +++ b/include/linux/pagemap.h
> > @@ -636,4 +636,32 @@ static inline unsigned long dir_pages(struct inode *inode)
> >                              PAGE_SHIFT;
> >  }
> >
> > +/**
> > + * page_mkwrite_check_truncate - check if page was truncated
> > + * @page: the page to check
> > + * @inode: the inode to check the page against
> > + *
> > + * Returns the number of bytes in the page up to EOF,
> > + * or -EFAULT if the page was truncated.
> > + */
> > +static inline int page_mkwrite_check_truncate(struct page *page,
> > +                                           struct inode *inode)
> > +{
> > +     loff_t size = i_size_read(inode);
> > +     pgoff_t index = size >> PAGE_SHIFT;
> > +     int offset = offset_in_page(size);
> > +
> > +     if (page->mapping != inode->i_mapping)
> > +             return -EFAULT;
> > +
> > +     /* page is wholly inside EOF */
> > +     if (page->index < index)
> > +             return PAGE_SIZE;
> > +     /* page is wholly past EOF */
> > +     if (page->index > index || !offset)
> > +             return -EFAULT;
> > +     /* page is partially inside EOF */
> > +     return offset;
> > +}
> > +
> >  #endif /* _LINUX_PAGEMAP_H */
> > --
> > 2.20.1
> >
>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
