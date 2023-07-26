Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 307A5762843
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Jul 2023 03:39:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOTVF-0002W6-F1;
	Wed, 26 Jul 2023 01:39:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hughd@google.com>) id 1qOTVD-0002W0-Fe
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 01:39:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:Message-ID:
 In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g4+spZWgq0eS9irqfihzysgfAABYfYXXmt6SNBBeIWA=; b=FIGvox+hmR+y1j0LIKBWozk4tY
 6ZNendpmqwDh9d7DlyRCsXuK1iThL0uw8fvbjlr93GZwuLf4guwd1xWX/9uTkR1fG9gt5l+QM2ySO
 /VhU6gGx2QtZXxMg8Z1gECbJdLrGPrjz0mg4tnk7V/5yH7TMXTKi3HZxzRYaJJFa/gwQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g4+spZWgq0eS9irqfihzysgfAABYfYXXmt6SNBBeIWA=; b=Qt69k72rap7GDcAGlXgqd1judo
 dLT0lnB4M6gQ6K7MwBhnfwuqRO+scwHlvLMGQsGVRaAeWk+xirDlRF6k1EbovYQ+jyVdRKpH9asUD
 abcO81AzJX0QOBLnXUHzEqXpnOLepxh3DxEm7EUjS6UVU3HnX/0lYTxZa8ik3+eGL6Z4=;
Received: from mail-yw1-f180.google.com ([209.85.128.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qOTVD-0004A2-6H for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 01:39:47 +0000
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-583b019f1cbso49680067b3.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Jul 2023 18:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1690335578; x=1690940378;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=g4+spZWgq0eS9irqfihzysgfAABYfYXXmt6SNBBeIWA=;
 b=MZxYT2MdZ0Omg+tGFjNofeHkNy3Qahh2PBaeRGC1CPgAvaobe+CbfQzviGlH2bRGld
 yZXqVlc4rdM7Hn/0uDpIIp7PtuXFyXV1rOEzEcPsa6KfHQ8WsO8NrD1ggf9GGi+atd7F
 nKDBxVEOzhZviRxzmHMsde7z3UqWCZoSc0lNm1akA/R8EHPW9npAKef3Z/pjfCjWQWBN
 xmycegOze/hxSYYenv2HpylIbUfqF9JiHr0gy59wVHZoy8dXEq78uEH7BvhlWGHxnNVM
 Pm/pG6h4Z3mK+EEHLb2xoyIraXRTQQ+dd3MgzFr8XAVX1x101W0eH3RmqvYAcZ2a0tMf
 tMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690335578; x=1690940378;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g4+spZWgq0eS9irqfihzysgfAABYfYXXmt6SNBBeIWA=;
 b=J50A506JprqsVlqyb0VEaPFfyv1E3px8M5xh7G7+CXoWoFIEve2bUcqmXDQzeJ8+al
 YHkdbFdr+tmrw0t6vMCb6WG76qO3KQQ7XVym6iZG9BtIhlQ5el9oLIWD4SK5elfMElth
 Ip3lCratKc3BImMrYELi5180E1sWCWHi9Qu/O1A5lUrWAdk5oT75f0q9cU6lrYaDHo9i
 i7LQiPSjAwP8zvqd34PilYaxD6TF0FDdvmVC0TpRAtN2aHd+svX92NUIf80r+6yzBwaB
 WkY8y7dASI5Fg6Xt0vWvns3E3skJdQSXwMi3aumZqKWJzRK1yvZjhwuGnCQE1tyIUF0T
 gZlw==
X-Gm-Message-State: ABy/qLag93+jgwaOBqmoSiwlPJ4zlGLyHXpbHwA9iMM8aIEGx+Cq4JZt
 XRUXE/yYujWJ1NUaOr3y24Firw==
X-Google-Smtp-Source: APBJJlHxqCs0/k9opPHZr1oFjC/IjLn2NWFjtEyuaFY5bDdVyDOg3sTAz2vkUnxY9z5liUX1UEynKA==
X-Received: by 2002:a81:46c3:0:b0:56d:2189:d87a with SMTP id
 t186-20020a8146c3000000b0056d2189d87amr821699ywa.15.1690335578030; 
 Tue, 25 Jul 2023 18:39:38 -0700 (PDT)
Received: from ripple.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a5b044a000000b00c654cc439fesm3165326ybp.52.2023.07.25.18.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 18:39:37 -0700 (PDT)
Date: Tue, 25 Jul 2023 18:39:25 -0700 (PDT)
X-X-Sender: hugh@ripple.attlocal.net
To: Jeff Layton <jlayton@kernel.org>
In-Reply-To: <20230725-mgctime-v6-3-a794c2b7abca@kernel.org>
Message-ID: <42c5bbe-a7a4-3546-e898-3f33bd71b062@google.com>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
 <20230725-mgctime-v6-3-a794c2b7abca@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 25 Jul 2023, Jeff Layton wrote: > Most filesystems
 that use the pagecache will update the mtime, ctime, > and change attribute
 when a page becomes writeable. Add a page_mkwrite > operation for tmpfs and
 just use it to bump the mtime [...] 
 Content analysis details:   (-15.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
 welcome-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.180 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.180 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
 Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1qOTVD-0004A2-6H
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
From: Hugh Dickins via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Hugh Dickins <hughd@google.com>
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
 Hugh Dickins <hughd@google.com>, Tyler Hicks <code@tyhicks.com>,
 cluster-devel@redhat.com, coda@cs.cmu.edu, linux-mm@kvack.org,
 linux-f2fs-devel@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
 Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>,
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

On Tue, 25 Jul 2023, Jeff Layton wrote:

> Most filesystems that use the pagecache will update the mtime, ctime,
> and change attribute when a page becomes writeable. Add a page_mkwrite
> operation for tmpfs and just use it to bump the mtime, ctime and change
> attribute.
> 
> This fixes xfstest generic/080 on tmpfs.

Huh.  I didn't notice when this one crept into the multigrain series.

I'm inclined to NAK this patch: at the very least, it does not belong
in the series, but should be discussed separately.

Yes, tmpfs does not and never has used page_mkwrite, and gains some
performance advantage from that.  Nobody has ever asked for this
change before, or not that I recall.

Please drop it from the series: and if you feel strongly, or know
strong reasons why tmpfs suddenly needs to use page_mkwrite now,
please argue them separately.  To pass generic/080 is not enough.

Thanks,
Hugh

> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  mm/shmem.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index b154af49d2df..654d9a585820 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -2169,6 +2169,16 @@ static vm_fault_t shmem_fault(struct vm_fault *vmf)
>  	return ret;
>  }
>  
> +static vm_fault_t shmem_page_mkwrite(struct vm_fault *vmf)
> +{
> +	struct vm_area_struct *vma = vmf->vma;
> +	struct inode *inode = file_inode(vma->vm_file);
> +
> +	file_update_time(vma->vm_file);
> +	inode_inc_iversion(inode);
> +	return 0;
> +}
> +
>  unsigned long shmem_get_unmapped_area(struct file *file,
>  				      unsigned long uaddr, unsigned long len,
>  				      unsigned long pgoff, unsigned long flags)
> @@ -4210,6 +4220,7 @@ static const struct super_operations shmem_ops = {
>  
>  static const struct vm_operations_struct shmem_vm_ops = {
>  	.fault		= shmem_fault,
> +	.page_mkwrite	= shmem_page_mkwrite,
>  	.map_pages	= filemap_map_pages,
>  #ifdef CONFIG_NUMA
>  	.set_policy     = shmem_set_policy,
> @@ -4219,6 +4230,7 @@ static const struct vm_operations_struct shmem_vm_ops = {
>  
>  static const struct vm_operations_struct shmem_anon_vm_ops = {
>  	.fault		= shmem_fault,
> +	.page_mkwrite	= shmem_page_mkwrite,
>  	.map_pages	= filemap_map_pages,
>  #ifdef CONFIG_NUMA
>  	.set_policy     = shmem_set_policy,
> 
> -- 
> 2.41.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
