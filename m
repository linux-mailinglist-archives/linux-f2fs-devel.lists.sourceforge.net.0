Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B75C8D3A401
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 11:03:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1FiokCfjLEbjBwaUzvpXf40nrvC+lFgKqgcxsVW0kI=; b=bjCDZhEjo7YbgC2PENSQvg4QQ5
	zcxxYvPS2r/oc9sEh/oDd1llnJgHygKLgLSE4fsijUPMXrrgGt+wiGWjH1czpiFrjND7wutodbV6I
	kuoC/6q0AWTRvcy8qEK24gBRZK8lvm97FReJiJVFc74fDb31Nm3szOZXNtFWvsGqm+qE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhm63-0005Q3-UC;
	Mon, 19 Jan 2026 10:02:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1vhm62-0005Pv-JC
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 10:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+egxvdkfFe0OPAhs6yaN0iB7Lb6LfA+3rTivoFRCGyw=; b=WBTogfIJUESTZECTxsWispBYw/
 wjEaxWeKBf1RdVm4iX0DgqqgG/PT1dQF2ijWkwCCHOcuYyp/atOuyhvQnufdDpT/R/wqd+HYkN4sz
 BLdU+GEJIaLRVaJynaHMY4CeO1/J+RRecRD2i8rL/LvZGidCEyzzEpESuCuvRNM8SvzA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+egxvdkfFe0OPAhs6yaN0iB7Lb6LfA+3rTivoFRCGyw=; b=SJBAtxpZPyr2Zijdg6elhHu4o2
 fE6dYKKlYl+9Ah3jhkkmNVQ6zXbVPwCwYP1Ux22+Y43axMHyQdNKfjYYh59W7H08Xq2y5Pw2s5p9G
 GVNVsJRX8iKisSUKwN4UILmxVcI6VMFbcBkBKcYj9CD6ndsQsMU16kw4jM7hwqGwGbVM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhm62-0002GH-1K for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 10:02:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A88EA431F5;
 Mon, 19 Jan 2026 10:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BAD4C116C6;
 Mon, 19 Jan 2026 10:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768816963;
 bh=R6+7JktKk3jk1q6Wgbu71GPUTrJx4O0fAkPrMYm/Vcw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r5fYjPVd7i+FiuyY+5V1e9j+yvd89tOwa/NfHqyl9kE+9r/pK/fkSMy1yUCff+6K0
 Ho329GpWfGSLhqOqwdk2JSa64n5sQNDX35A1a8ceQoCK2XN8tka1azT1OB14YIUSlI
 uLODq03HIEkqgBNRswNIkTVOo+BsRAhxaT7vrxQlLwoOgO6bEwBYWfAlK15c4KYd5Y
 RZsJ9jp2mGgmaY1DDDwa+eo7o+ERdA7ptn8ue4gKvsvGX/1WORIlJrt3CgArpdwubF
 xNr9usbeiF7lYAh+jqmVPklZkvMg/N5/cNZmTHKX7kXZ3xyQfXmCqzHLFRH5R8BA4C
 TreSJLUGlS1qg==
Date: Mon, 19 Jan 2026 11:02:37 +0100
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260119-davon-krippenkind-78d683621491@brauner>
References: <20260119062250.3998674-1-hch@lst.de>
 <20260119062250.3998674-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260119062250.3998674-4-hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 19, 2026 at 07:22:44AM +0100, Christoph Hellwig
 wrote: > Call into fsverity_file_open from generic_file_open instead of
 requiring
 > the file system to handle it explicitly. > > Signed-off- [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vhm62-0002GH-1K
Subject: Re: [f2fs-dev] [PATCH 3/6] fs,
 fsverity: handle fsverity in generic_file_open
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
From: Christian Brauner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Christian Brauner <brauner@kernel.org>
Cc: Theodore Ts'o <tytso@mit.edu>, fsverity@lists.linux.dev,
 Jan Kara <jack@suse.cz>, Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 19, 2026 at 07:22:44AM +0100, Christoph Hellwig wrote:
> Call into fsverity_file_open from generic_file_open instead of requiring
> the file system to handle it explicitly.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/btrfs/file.c          |  6 ------
>  fs/ext4/file.c           |  4 ----
>  fs/f2fs/file.c           |  4 ----
>  fs/open.c                |  8 +++++++-
>  fs/verity/open.c         | 10 ++++++++--
>  include/linux/fsverity.h | 32 +-------------------------------
>  6 files changed, 16 insertions(+), 48 deletions(-)
> 
> diff --git a/fs/btrfs/file.c b/fs/btrfs/file.c
> index 1abc7ed2990e..4b3a31b2b52e 100644
> --- a/fs/btrfs/file.c
> +++ b/fs/btrfs/file.c
> @@ -3808,16 +3808,10 @@ static loff_t btrfs_file_llseek(struct file *file, loff_t offset, int whence)
>  
>  static int btrfs_file_open(struct inode *inode, struct file *filp)
>  {
> -	int ret;
> -
>  	if (unlikely(btrfs_is_shutdown(inode_to_fs_info(inode))))
>  		return -EIO;
>  
>  	filp->f_mode |= FMODE_NOWAIT | FMODE_CAN_ODIRECT;
> -
> -	ret = fsverity_file_open(inode, filp);
> -	if (ret)
> -		return ret;
>  	return generic_file_open(inode, filp);
>  }
>  
> diff --git a/fs/ext4/file.c b/fs/ext4/file.c
> index 7a8b30932189..a7dc8c10273e 100644
> --- a/fs/ext4/file.c
> +++ b/fs/ext4/file.c
> @@ -906,10 +906,6 @@ static int ext4_file_open(struct inode *inode, struct file *filp)
>  	if (ret)
>  		return ret;
>  
> -	ret = fsverity_file_open(inode, filp);
> -	if (ret)
> -		return ret;
> -
>  	/*
>  	 * Set up the jbd2_inode if we are opening the inode for
>  	 * writing and the journal is present
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index da029fed4e5a..f1510ab657b6 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -624,10 +624,6 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
>  	if (!f2fs_is_compress_backend_ready(inode))
>  		return -EOPNOTSUPP;
>  
> -	err = fsverity_file_open(inode, filp);
> -	if (err)
> -		return err;
> -
>  	filp->f_mode |= FMODE_NOWAIT;
>  	filp->f_mode |= FMODE_CAN_ODIRECT;
>  
> diff --git a/fs/open.c b/fs/open.c
> index f328622061c5..dea93bab8795 100644
> --- a/fs/open.c
> +++ b/fs/open.c
> @@ -10,6 +10,7 @@
>  #include <linux/file.h>
>  #include <linux/fdtable.h>
>  #include <linux/fsnotify.h>
> +#include <linux/fsverity.h>
>  #include <linux/module.h>
>  #include <linux/tty.h>
>  #include <linux/namei.h>
> @@ -1604,10 +1605,15 @@ SYSCALL_DEFINE0(vhangup)
>   * the caller didn't specify O_LARGEFILE.  On 64bit systems we force
>   * on this flag in sys_open.
>   */
> -int generic_file_open(struct inode * inode, struct file * filp)
> +int generic_file_open(struct inode *inode, struct file *filp)
>  {
>  	if (!(filp->f_flags & O_LARGEFILE) && i_size_read(inode) > MAX_NON_LFS)
>  		return -EOVERFLOW;
> +	if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode)) {
> +		if (filp->f_mode & FMODE_WRITE)
> +			return -EPERM;
> +		return fsverity_file_open(inode, filp);
> +	}

This is the only one where I'm not happy about the location.
This hides the ordering requirement between fsverity and fscrypt. It's
easier to miss now. This also really saves very little compared to the
other changes. So I wonder whether it's really that big of a deal to
have the call located in the open routines of the filesystems.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
