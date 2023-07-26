Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 728BC76338C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Jul 2023 12:26:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qObj6-0001sv-2k;
	Wed, 26 Jul 2023 10:26:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qObj4-0001so-2f
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 10:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8EFNvO/bG6mKtzRHuK9HaQjBAdPfXQelasnzw2LJW8I=; b=U8FmWVKaHj0qxgW7lo8MAhBGdo
 ig05OkEvnDzJYudnvIDKc40FImW7XGb1mvXZCMHd4wJ5vOwoGfLOPesdq1c5QD3zmOuoIGZpelXHx
 oLJGuFlwhQZu/eUSe/eb6QnXRLP7nruOmUIFNNeOwjsHf05WJKbXETKNsXQmJzm0PgL8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8EFNvO/bG6mKtzRHuK9HaQjBAdPfXQelasnzw2LJW8I=; b=RxiT7/+qrfXO6ct8A22gR7KV/V
 bUtWfnE57GEBBQzHRQGFAWWuaJJbcxSo6oH8TXhij4pcBqO7SlH8XyqwvJ5rJitFZR10Sc4W4aQd0
 T7fEMGAiT9rpxVPIcWA5mMVeQP9JRds3zAtHTTpZwVKUHT5gx8CD0BuPGfvqIntdBjtA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qObj3-0008Fx-At for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 10:26:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5AF2261A40;
 Wed, 26 Jul 2023 10:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DDF4C433C7;
 Wed, 26 Jul 2023 10:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690367190;
 bh=5KYTw7QzTyvtxBFV3dygoBH0PeFk0S7OnkeeUk9b43Y=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=ndKso9yUYsbZwpDHng42ep2CAfco3wLs2OV40nFjqGLYD9AEcWQWsW6ETt5eznwfc
 cv1pssJER1sswKXyNjOiTQENkKxQk0VK7z2g3ch3Yi2JD1b11x0Zkl0EFgKozkvsxy
 f1dZ8Uzp9NvZuR0ShQq2ncjDBcvWQLsdpHvv+hCoNZE8CswlcoELNBb87INDiV++T7
 H3FxOmXTcDxptDoUUj0sqZ+IrTepfzb2qKKeU0koRPwfU0de4m8txUllhzV58rHcVD
 p+AU8vMVOdefcjxtH+iRA3W4CG6/XXiQ3a2jG5SNH585qxa35MBMZ5O8U7Wt7Y0BFJ
 4GDCTXheHD02g==
Message-ID: <9b3292b65d3c63c50e671c47ed90304c4a8d1af9.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Hugh Dickins <hughd@google.com>
Date: Wed, 26 Jul 2023 06:26:23 -0400
In-Reply-To: <42c5bbe-a7a4-3546-e898-3f33bd71b062@google.com>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
 <20230725-mgctime-v6-3-a794c2b7abca@kernel.org>
 <42c5bbe-a7a4-3546-e898-3f33bd71b062@google.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 2023-07-25 at 18:39 -0700, Hugh Dickins wrote: > On
 Tue, 25 Jul 2023, Jeff Layton wrote: > > > Most filesystems that use the
 pagecache will update the mtime, ctime, > > and change attribute wh [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qObj3-0008Fx-At
Subject: Re: [f2fs-dev] [PATCH v6 3/7] tmpfs: bump the mtime/ctime/iversion
 when page becomes writeable
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Martin Brandenburg <martin@omnibond.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 linux-xfs@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Dave Chinner <david@fromorbit.com>, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Hans de Goede <hdegoede@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 codalist@coda.cs.cmu.edu, linux-afs@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 linux-cifs@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Andreas Gruenbacher <agruenba@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Tyler Hicks <code@tyhicks.com>, cluster-devel@redhat.com, coda@cs.cmu.edu,
 linux-mm@kvack.org, linux-f2fs-devel@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, Iurii Zaikin <yzaikin@google.com>,
 Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Shyam Prasad N <sprasad@microsoft.com>, ecryptfs@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, ocfs2-devel@lists.linux.dev,
 Anthony Iliopoulos <ailiop@suse.com>, Josef Bacik <josef@toxicpanda.com>,
 Tom Talpey <tom@talpey.com>, Tejun Heo <tj@kernel.org>,
 Yue Hu <huyue2@coolpad.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-mtd@lists.infradead.org, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Gao Xiang <xiang@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jan Harkes <jaharkes@cs.cmu.edu>,
 Christian Brauner <brauner@kernel.org>, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, v9fs@lists.linux.dev,
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 devel@lists.orangefs.org, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, Bob Peterson <rpeterso@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, linux-erofs@lists.ozlabs.org,
 linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, 2023-07-25 at 18:39 -0700, Hugh Dickins wrote:
> On Tue, 25 Jul 2023, Jeff Layton wrote:
> 
> > Most filesystems that use the pagecache will update the mtime, ctime,
> > and change attribute when a page becomes writeable. Add a page_mkwrite
> > operation for tmpfs and just use it to bump the mtime, ctime and change
> > attribute.
> > 
> > This fixes xfstest generic/080 on tmpfs.
> 
> Huh.  I didn't notice when this one crept into the multigrain series.
> 
> I'm inclined to NAK this patch: at the very least, it does not belong
> in the series, but should be discussed separately.
> 
> Yes, tmpfs does not and never has used page_mkwrite, and gains some
> performance advantage from that.  Nobody has ever asked for this
> change before, or not that I recall.
> 
> Please drop it from the series: and if you feel strongly, or know
> strong reasons why tmpfs suddenly needs to use page_mkwrite now,
> please argue them separately.  To pass generic/080 is not enough.
> 
> Thanks,
> Hugh
> 

Dropped.

This was just something I noticed while testing this series. It stood
out since I was particularly watching for timestamp-related test
failures. I don't feel terribly strongly about it.

Thanks!

> > 
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> >  mm/shmem.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/mm/shmem.c b/mm/shmem.c
> > index b154af49d2df..654d9a585820 100644
> > --- a/mm/shmem.c
> > +++ b/mm/shmem.c
> > @@ -2169,6 +2169,16 @@ static vm_fault_t shmem_fault(struct vm_fault *vmf)
> >  	return ret;
> >  }
> >  
> > +static vm_fault_t shmem_page_mkwrite(struct vm_fault *vmf)
> > +{
> > +	struct vm_area_struct *vma = vmf->vma;
> > +	struct inode *inode = file_inode(vma->vm_file);
> > +
> > +	file_update_time(vma->vm_file);
> > +	inode_inc_iversion(inode);
> > +	return 0;
> > +}
> > +
> >  unsigned long shmem_get_unmapped_area(struct file *file,
> >  				      unsigned long uaddr, unsigned long len,
> >  				      unsigned long pgoff, unsigned long flags)
> > @@ -4210,6 +4220,7 @@ static const struct super_operations shmem_ops = {
> >  
> >  static const struct vm_operations_struct shmem_vm_ops = {
> >  	.fault		= shmem_fault,
> > +	.page_mkwrite	= shmem_page_mkwrite,
> >  	.map_pages	= filemap_map_pages,
> >  #ifdef CONFIG_NUMA
> >  	.set_policy     = shmem_set_policy,
> > @@ -4219,6 +4230,7 @@ static const struct vm_operations_struct shmem_vm_ops = {
> >  
> >  static const struct vm_operations_struct shmem_anon_vm_ops = {
> >  	.fault		= shmem_fault,
> > +	.page_mkwrite	= shmem_page_mkwrite,
> >  	.map_pages	= filemap_map_pages,
> >  #ifdef CONFIG_NUMA
> >  	.set_policy     = shmem_set_policy,
> > 
> > -- 
> > 2.41.0

-- 
Jeff Layton <jlayton@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
