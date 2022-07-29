Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38825585485
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Jul 2022 19:31:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oHTpe-0007Re-Gp; Fri, 29 Jul 2022 17:31:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <daeho43@gmail.com>) id 1oHTpP-0007RO-6d
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Jul 2022 17:31:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ks2Xaq3aimkHGcY2BTkihJ+k/bcPqBj8oKyRR6HCXEw=; b=Y5vHFv1TT2Lts8OZZmtljwGAaJ
 WTQvwHvQuFoU8h5H0N2kbGYa2zim7RBS7Ef5krEvw3H7I72ZOMNzpEM2TD99Ch7o4ILc360DAHFDv
 xlkZsiUr6WB9Rc9rj4p/aVVE/0b/0JIvDAhPPqYbfrQsSVqB9L/FLSaatYGthp9f/Eic=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ks2Xaq3aimkHGcY2BTkihJ+k/bcPqBj8oKyRR6HCXEw=; b=C9A+JfiptsLjS03ymjjUh8RZb2
 VPQUib2vuHCbbv+tHizYIypVzOEXVjq2xcIkW6Yq76JAbkEmfigp1Sc1gZbtQuct92zWK20auv0+f
 7+F8PTEIUap8lnYuaAA971XWRyAsJDFYquiFJStCgOqKd9uhVOx0rQ9StlvoFymbxgqU=;
Received: from mail-yw1-f174.google.com ([209.85.128.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1oHTpL-000340-JO
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Jul 2022 17:31:09 +0000
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-31f41584236so57994657b3.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 Jul 2022 10:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ks2Xaq3aimkHGcY2BTkihJ+k/bcPqBj8oKyRR6HCXEw=;
 b=qqeytMJyWaGHIOkiwfk0edsMlhdhvGZnezlc7rqmMiLvbbXp8qX+Otc/BkjD4zzKCA
 IZ4coVKJrZFBxmJMeo1PZmk6RTgc1CQ13u1yRbU1Rs+XdEiWemOryygZnzjEAugS6lD4
 s0n1ul7Mhzjon80HMvZ3VkcbAeZoS1/BtbxPXvqSBxzaVWoHLhuYdBsK1o1D5uz4e9rO
 7zprjwooSB7/UXyNzJVR5ZW4fq2C284cPv6JT9q6d1+i/JIiZhOsToFP9tBibisit34c
 zUio5qv40SWeZzEffuKQ4ui3iVeIepzQnATxSuDNBhR/nDFY9yEnFEORVituom0Nsd/E
 yQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ks2Xaq3aimkHGcY2BTkihJ+k/bcPqBj8oKyRR6HCXEw=;
 b=ENZ3/qHZHZxKSmNG+1Nx22y9eHGIkhLLkSlr2xSa6H3uw/11+8s6SSE20aTKJeowqA
 tpjuLAjUc0mFWLgADRae+R/EzHt8yhP5BwtYZt9eA/peFXc0N7O3iDHEDaIZGe0xgxjE
 ZpPN1BXJ5Ra0hqkWbr4/ogEjPS1vT3XcphoUHihuMXaXEqolKP/aR9J/XYTc6z7dNFOt
 QPAEjvCyF0/EXel28fRtaZSeL6eqfBn1AyPwnEdR4SAidtogWOprl46hRT3mKvEObVE/
 7at8aV4zTSL4kdzneL6GzJXveMUaWPuP/4T19TayB9+Y+vw9XYoXYEd5+p80Au/cwvQ0
 rqzA==
X-Gm-Message-State: ACgBeo1HAmSqaVQt0WmAj/qf4NBi6hN1ySRn4Pf8fmAvSSfnE17Hmq8l
 FIHw5GZ8x/SI6x5LWhQvbXpWLxZEbP8jTeiGCbk=
X-Google-Smtp-Source: AA6agR5aHVWeIdVQn7lagAV2GwBcncryimhtMowoxBxSTFyYGC21RHTcj2zWwIR+SG7/hl5QydnPj+0AtQcxRmSzuT0=
X-Received: by 2002:a81:78d:0:b0:2e5:d440:d921 with SMTP id
 135-20020a81078d000000b002e5d440d921mr3861530ywh.251.1659115861813; Fri, 29
 Jul 2022 10:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220718113609.154371-1-yebin10@huawei.com>
 <e82f0d90-7fda-c944-149f-d18491008f3f@kernel.org>
In-Reply-To: <e82f0d90-7fda-c944-149f-d18491008f3f@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 29 Jul 2022 10:30:50 -0700
Message-ID: <CACOAw_xCdz4rO-LGshaZin4CzsE+8MTb_DPe0h+=vJ8KGwXa1A@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Jul 24,
 2022 at 3:21 AM Chao Yu wrote: > > On 2022/7/18
 19:36, Ye Bin wrote: > > There is issue as follows when test f2fs atomic
 write: > > F2FS-fs (loop0): Can't find valid F2FS filesystem [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.174 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1oHTpL-000340-JO
Subject: Re: [f2fs-dev] [PATCH -next RFC] f2fs: fix null-ptr-deref in
 f2fs_get_dnode_of_data
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 Ye Bin <yebin10@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Jul 24, 2022 at 3:21 AM Chao Yu <chao@kernel.org> wrote:
>
> On 2022/7/18 19:36, Ye Bin wrote:
> > There is issue as follows when test f2fs atomic write:
> > F2FS-fs (loop0): Can't find valid F2FS filesystem in 2th superblock
> > F2FS-fs (loop0): invalid crc_offset: 0
> > F2FS-fs (loop0): f2fs_check_nid_range: out-of-range nid=1, run fsck to fix.
> > F2FS-fs (loop0): f2fs_check_nid_range: out-of-range nid=2, run fsck to fix.
> > ==================================================================
> > BUG: KASAN: null-ptr-deref in f2fs_get_dnode_of_data+0xac/0x16d0
> > Read of size 8 at addr 0000000000000028 by task rep/1990
> >
> > CPU: 4 PID: 1990 Comm: rep Not tainted 5.19.0-rc6-next-20220715 #266
> > Call Trace:
> >   <TASK>
> >   dump_stack_lvl+0x6e/0x91
> >   print_report.cold+0x49a/0x6bb
> >   kasan_report+0xa8/0x130
> >   f2fs_get_dnode_of_data+0xac/0x16d0
> >   f2fs_do_write_data_page+0x2a5/0x1030
> >   move_data_page+0x3c5/0xdf0
> >   do_garbage_collect+0x2015/0x36c0
> >   f2fs_gc+0x554/0x1d30
> >   f2fs_balance_fs+0x7f5/0xda0
> >   f2fs_write_single_data_page+0xb66/0xdc0
> >   f2fs_write_cache_pages+0x716/0x1420
> >   f2fs_write_data_pages+0x84f/0x9a0
> >   do_writepages+0x130/0x3a0
> >   filemap_fdatawrite_wbc+0x87/0xa0
> >   file_write_and_wait_range+0x157/0x1c0
> >   f2fs_do_sync_file+0x206/0x12d0
> >   f2fs_sync_file+0x99/0xc0
> >   vfs_fsync_range+0x75/0x140
> >   f2fs_file_write_iter+0xd7b/0x1850
> >   vfs_write+0x645/0x780
> >   ksys_write+0xf1/0x1e0
> >   do_syscall_64+0x3b/0x90
> >   entry_SYSCALL_64_after_hwframe+0x63/0xcd
> >
> > As 3db1de0e582c commit changed atomic write way which new a cow_inode for
> > atomic write file, and also mark cow_inode as FI_ATOMIC_FILE.
> > When f2fs_do_write_data_page write cow_inode will use cow_inode's cow_inode
> > which is NULL. Then will trigger null-ptr-deref.
> > To solve above issue, don't mark cow_inode as FI_ATOMIC_FILE.
> >
> > Fiexes: 3db1de0e582c("f2fs: change the current atomic write way")
> > Signed-off-by: Ye Bin <yebin10@huawei.com>
> > ---
> >   fs/f2fs/file.c | 1 -
> >   1 file changed, 1 deletion(-)
> >
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 466eb00aa516..735802b6b754 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -2062,7 +2062,6 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
> >       spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
> >
> >       set_inode_flag(inode, FI_ATOMIC_FILE);
> > -     set_inode_flag(fi->cow_inode, FI_ATOMIC_FILE);
>
> It needs to remove clear_inode_flag(fi->cow_inode, FI_ATOMIC_FILE) in
> f2fs_abort_atomic_write()?
>
> To Daeho, could you please review this patch? IIUC, cow_inode doesn't
> need to be set as atomic file?
>

Sorry for the late reply, I was OOO.

I think I missed the FG GC case for COW inode. :(
I used the FI_ATOMIC_FILE flag for COW inode in
__get_segment_type_6(). Maybe we need another flag for the COW inode
case in the function, if we remove the flag from the COW inode.
Plus, we need to remove clear_inode_flag(fi->cow_inode,
FI_ATOMIC_FILE) too in f2fs_abort_atomic_write().

Thanks,

> Thanks,
>
> >       clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
> >       f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
> >


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
