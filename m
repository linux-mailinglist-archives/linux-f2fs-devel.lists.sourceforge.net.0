Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEBF4F878
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 23 Jun 2019 00:12:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1heoEn-0005RN-O0; Sat, 22 Jun 2019 22:11:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1heoEm-0005RC-9M
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Jun 2019 22:11:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1FTOqtF7Qt5reGj9DEKao2Hsw1IOJBZncyW1LRZQ6HA=; b=k5xAS+K8U0BFceq15b7DcrXPqM
 SCE3Qeb7REb2PGuwcIFziXZHH35+Ba45j/V15QlXQgZWC4+VB27ouK52VRkSDSYd5macaPBMycaiF
 OWDhlKOU/nysQOPQpq2+gSrJ+jJR5jUVtZoAyCcSdrHjRuGg8ufKNdwXEFyUOssKH9eY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1FTOqtF7Qt5reGj9DEKao2Hsw1IOJBZncyW1LRZQ6HA=; b=ZFnnCovkdYBD6OkSq1sg9dvkXE
 VtNS92mRwOGTROM2uVWYDyYXO73YQwVfhrfiGSsM+w7X7zFSkk5QUQva07f3mMBC3I7Zb2wtSPgbk
 +yxQ6eesvRli8SN1b50BvBdZ6GBJEzHkQGaHQFdb8Md8gitIXdRnnj2zWD4W8hdF3ehw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1heoEn-005Ol2-IU
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 22 Jun 2019 22:11:58 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D9FA320862;
 Sat, 22 Jun 2019 22:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561241511;
 bh=pWoXCpB1qxcWe85YQz2OZPYh2L7dHQZAU4vlFFwBHyo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M/P6vgSdRCBAMVbjQGvKFCW1dEY9AZV09wQ53yTq0DU408NCkXFSAICQV6jn1+MTG
 fX0UFSeVoTMJO67DFqUgnyjLkmU2YZuH1bOoOyIBdiE+WDzG4OALjrPOL8YO/JCnct
 gcGg+0Aua0/NdNr7VBu6WeJliataKEavETqinIn0=
Date: Sat, 22 Jun 2019 15:11:51 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190622221151.GD19686@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190620205043.64350-1-ebiggers@kernel.org>
 <20190620205043.64350-5-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190620205043.64350-5-ebiggers@kernel.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1heoEn-005Ol2-IU
Subject: Re: [f2fs-dev] [PATCH v5 04/16] fs: uapi: define verity bit for
 FS_IOC_GETFLAGS
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>,
 "Darrick J . Wong" <darrick.wong@oracle.com>, linux-api@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/20, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Add FS_VERITY_FL to the flags for FS_IOC_GETFLAGS, so that applications
> can easily determine whether a file is a verity file at the same time as
> they're checking other file flags.  This flag will be gettable only;
> FS_IOC_SETFLAGS won't allow setting it, since an ioctl must be used
> instead to provide more parameters.
> 
> This flag matches the on-disk bit that was already allocated for ext4.
> 
> Reviewed-by: Theodore Ts'o <tytso@mit.edu>

Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>

> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  include/uapi/linux/fs.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> index 59c71fa8c553a3..df261b7e0587ed 100644
> --- a/include/uapi/linux/fs.h
> +++ b/include/uapi/linux/fs.h
> @@ -306,6 +306,7 @@ struct fscrypt_key {
>  #define FS_TOPDIR_FL			0x00020000 /* Top of directory hierarchies*/
>  #define FS_HUGE_FILE_FL			0x00040000 /* Reserved for ext4 */
>  #define FS_EXTENT_FL			0x00080000 /* Extents */
> +#define FS_VERITY_FL			0x00100000 /* Verity protected inode */
>  #define FS_EA_INODE_FL			0x00200000 /* Inode used for large EA */
>  #define FS_EOFBLOCKS_FL			0x00400000 /* Reserved for ext4 */
>  #define FS_NOCOW_FL			0x00800000 /* Do not cow file */
> -- 
> 2.22.0.410.gd8fdbe21b5-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
