Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 239A8D0588A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 19:29:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:References:In-Reply-To:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3a0fKmXByo6of+81onSqB9S2VHontg3Juqj3tVPUT4=; b=ToZyGXHSQRXywW/IkxIb7hUzgw
	exG9BtTnfElhvrnDDuY6e9av9vSPrZkVXiulmUvWuNi1buf1BwESdroPaWPywPMJL9CTZLd8/Q844
	VgUiyERgg72Q79AhSdYXt5v7zhCoiP6DAeAjA56iGZ1gTjnLeBjrLEDv3kZWPK45TL/g=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdul0-00060e-OJ;
	Thu, 08 Jan 2026 18:29:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hirofumi@parknet.co.jp>) id 1vdukx-00060M-L1;
 Thu, 08 Jan 2026 18:29:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VE+eLbPxS+2/NxdS4iC5ykEp/h4Ri6SH4uWUI0CKCww=; b=GcIFeRkUyv9UB1pYR65lPXSCOE
 UOySc0lsol/Nbyut9q3p81qgZ+VABeenSGpPwrAvknP+oiacQjdiYPcPLhvGFnAcoITm7VWSQIFe1
 ZDA1DtCR6RuFyYascnO2bGM44KtbfmoC7NTOs8fV04mTZ85d67FPPVyxE/YihAAZe9T8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VE+eLbPxS+2/NxdS4iC5ykEp/h4Ri6SH4uWUI0CKCww=; b=etBqXz5OELXkxHLmm/C6R6QD3i
 uuYH24+ea5LRhjWGVkZgRwgBCA7s+SP4kiAw//TEI/0DooJpTSoApUXtoBXBmyXbWwKSBfZZ0lF4+
 6oXnlkPs9rbcz+Eb8Uk1PliKEt/gimr6CAAMa/SW+Sr67o04leG5RqgPNBJQsrjz98Bo=;
Received: from mail.parknet.co.jp ([210.171.160.6])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdukw-0004lV-Em; Thu, 08 Jan 2026 18:29:11 +0000
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
 by mail.parknet.co.jp (Postfix) with ESMTPSA id 4677D26F765D;
 Fri,  9 Jan 2026 03:12:33 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=parknet.co.jp;
 s=20250114; t=1767895953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VE+eLbPxS+2/NxdS4iC5ykEp/h4Ri6SH4uWUI0CKCww=;
 b=gca1nAhL0iYeKhrMxVW/YkNVQGsmR2FtA0K2e0pt9zd3L8VZwxpcEfUTVG6wgn+2tFPTSO
 HeW+ni5Q59lRV2kUjNcId9ow+1k5DhIo1N5oAHHp1l0frRz0p+GdCrJ5yDI66gxE8KEOn7
 v8zc7gU5ici9xYmL+L7s3KQ9RND4Zj9v/GNEYNheUomswbwI2MAFPIY0boWLymkQQnV9lD
 55Q1xjqtAMVsY4vr4S+L3pqkV4l+GHZ+5Sx/JiLr+J5yUBW4ypUc8Y8oNHBEL1KgKVh31j
 qSpaEXlZVcdannHzIb1g2WajxumAtmJFSTEQRXXN49o5ilDnu6uppAB9swxKLA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=parknet.co.jp;
 s=20250114-ed25519; t=1767895953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VE+eLbPxS+2/NxdS4iC5ykEp/h4Ri6SH4uWUI0CKCww=;
 b=dpcKqiHv5kPZON+sXPbBLz5lebhV2Omji1CcWNcfUdqkirKgF5cr6kEKLmZbrHERXCyoN2
 F8vLjq1Lz09KhaCQ==
Received: from devron.myhome.or.jp (foobar@devron.myhome.or.jp [192.168.0.3])
 by ibmpc.myhome.or.jp (8.18.1/8.18.1/Debian-7) with ESMTPS id
 608ICUsL013625
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 9 Jan 2026 03:12:31 +0900
Received: from devron.myhome.or.jp (foobar@localhost [127.0.0.1])
 by devron.myhome.or.jp (8.18.1/8.18.1/Debian-7) with ESMTPS id 608ICTic019851
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 9 Jan 2026 03:12:29 +0900
Received: (from hirofumi@localhost)
 by devron.myhome.or.jp (8.18.1/8.18.1/Submit) id 608ICKe4019849;
 Fri, 9 Jan 2026 03:12:20 +0900
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: Jeff Layton <jlayton@kernel.org>
In-Reply-To: <20260108-setlease-6-20-v1-9-ea4dec9b67fa@kernel.org>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
 <20260108-setlease-6-20-v1-9-ea4dec9b67fa@kernel.org>
Date: Fri, 09 Jan 2026 03:12:20 +0900
Message-ID: <875x9c3rej.fsf@mail.parknet.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Jeff Layton <jlayton@kernel.org> writes: > Add the setlease
 file_operation to fat_file_operations and > fat_dir_operations, pointing
 to generic_setlease. A future patch will > change the default behavior to
 reject lease attempts with -EINVAL [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1vdukw-0004lV-Em
Subject: Re: [f2fs-dev] [PATCH 09/24] fat: add setlease file operation
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
 Alexander Aring <alex.aring@gmail.com>, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Sandeep Dhavale <dhavale@google.com>,
 Martin Brandenburg <martin@omnibond.com>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Anders Larsen <al@alarsen.net>, Amir Goldstein <amir73il@gmail.com>,
 jfs-discussion@lists.sourceforge.net, linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ilya Dryomov <idryomov@gmail.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Yue Hu <zbestahu@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, samba-technical@lists.samba.org,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 devel@lists.orangefs.org, Hugh Dickins <hughd@google.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, ntfs3@lists.linux.dev,
 Christoph Hellwig <hch@infradead.org>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 linux-mm@kvack.org, Viacheslav Dubeyko <slava@dubeyko.com>,
 linux-btrfs@vger.kernel.org, Gao Xiang <xiang@kernel.org>,
 linux-ext4@vger.kernel.org, Salah Triki <salah.triki@gmail.com>,
 Carlos Maiolino <cem@kernel.org>, Dominique Martinet <asmadeus@codewreck.org>,
 Shyam Prasad N <sprasad@microsoft.com>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, linux-cifs@vger.kernel.org,
 linux-nfs@vger.kernel.org, Tom Talpey <tom@talpey.com>,
 ocfs2-devel@lists.linux.dev, Bharath SM <bharathsm@microsoft.com>,
 linux-nilfs@vger.kernel.org, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Hans de Goede <hansg@kernel.org>,
 gfs2@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 linux-erofs@lists.ozlabs.org, v9fs@lists.linux.dev,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <sfrench@samba.org>, Chuck Lever <chuck.lever@oracle.com>,
 Hongbo Li <lihongbo22@huawei.com>, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>,
 Trond Myklebust <trondmy@kernel.org>, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jeff Layton <jlayton@kernel.org> writes:

> Add the setlease file_operation to fat_file_operations and
> fat_dir_operations, pointing to generic_setlease.  A future patch will
> change the default behavior to reject lease attempts with -EINVAL when
> there is no setlease file operation defined. Add generic_setlease to
> retain the ability to set leases on this filesystem.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good.

Acked-by: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>

> ---
>  fs/fat/dir.c  | 2 ++
>  fs/fat/file.c | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/fs/fat/dir.c b/fs/fat/dir.c
> index 92b091783966af6a9e6f5ead1a382a98dd92bba0..807bc8b1bc145a9f15765920670c6233f7e87e55 100644
> --- a/fs/fat/dir.c
> +++ b/fs/fat/dir.c
> @@ -16,6 +16,7 @@
>  
>  #include <linux/slab.h>
>  #include <linux/compat.h>
> +#include <linux/filelock.h>
>  #include <linux/uaccess.h>
>  #include <linux/iversion.h>
>  #include "fat.h"
> @@ -876,6 +877,7 @@ const struct file_operations fat_dir_operations = {
>  	.compat_ioctl	= fat_compat_dir_ioctl,
>  #endif
>  	.fsync		= fat_file_fsync,
> +	.setlease	= generic_setlease,
>  };
>  
>  static int fat_get_short_entry(struct inode *dir, loff_t *pos,
> diff --git a/fs/fat/file.c b/fs/fat/file.c
> index 4fc49a614fb8fd64e219db60c6d9e7dd100aea1c..d50a6d8bfaae0c75b2dbe838d108135206d0f123 100644
> --- a/fs/fat/file.c
> +++ b/fs/fat/file.c
> @@ -13,6 +13,7 @@
>  #include <linux/mount.h>
>  #include <linux/blkdev.h>
>  #include <linux/backing-dev.h>
> +#include <linux/filelock.h>
>  #include <linux/fsnotify.h>
>  #include <linux/security.h>
>  #include <linux/falloc.h>
> @@ -212,6 +213,7 @@ const struct file_operations fat_file_operations = {
>  	.splice_read	= filemap_splice_read,
>  	.splice_write	= iter_file_splice_write,
>  	.fallocate	= fat_fallocate,
> +	.setlease	= generic_setlease,
>  };
>  
>  static int fat_cont_expand(struct inode *inode, loff_t size)

-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
