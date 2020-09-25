Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5462794AF
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 26 Sep 2020 01:26:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kLx6e-0007Rl-V7; Fri, 25 Sep 2020 23:26:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kLx6e-0007RY-0b
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Sep 2020 23:26:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s6Kirs9+PBARHHkukKlfSA8L0lM2PGcN5y4Z5SzFfls=; b=aXezTNFueW8uSxl8Ihh0T3X1dw
 WNBzLSrrJrFcyGCeEJWngmLfePFISQ+6+5PJvkZGQdz0EvHPjl3K6kfuA7Hxy8705Da2wmpLJsypU
 QxlrNnK80S+X3B39U+BqkkkIz705+8A2vl048R0hAlSCpEXo/MfrssB67Iu5CcvGlR6A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s6Kirs9+PBARHHkukKlfSA8L0lM2PGcN5y4Z5SzFfls=; b=Li0eOlNDtvx/bbNRryu18BGnS5
 tlZXyepMYg0r3sbzE7wiFKIyYslzT9MjE8n0zb7tqUO9NXcUEMue38HIO34nMIzb6ADat0sF+dzwF
 f3pWf+qx/DdEW1vNHgLQuZW4zRltLckWkNKkmXn0QVc7rgLCFj/b2mXZ8JWvAR62DgjU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kLx6U-0067EW-Ia
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Sep 2020 23:26:23 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2182F20829;
 Fri, 25 Sep 2020 23:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601076369;
 bh=4AJ9+ZfYhoqx/vj7ynSiRMVmmhJmnxNpd/mNTnqzuQs=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=SlPMFvk6n4wT9lkOaffsQQhzJDxhKPVUPX6fSsd/1FaC3w9jaSBcQkzQZTn4rzS47
 qECn8w5hfg7QL3hLaYevm5lyjDZwezmM34UcfO1NiV05wGYQluNGIP0WJfUloueC8J
 j2EsbMQYf9YCpdWz4T0Q1QEjFk/4KhT9vFMQ304U=
Date: Fri, 25 Sep 2020 16:26:08 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, kernel-team@android.com,
 linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20200925232608.GC4136545@google.com>
References: <20200925232256.4136799-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925232256.4136799-1-jaegeuk@kernel.org>
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kLx6U-0067EW-Ia
Subject: Re: [f2fs-dev] [PATCH] f2fs: point man pages for some f2fs utils
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 09/25, Jaegeuk Kim wrote:
> This patch adds some missing contexts related to f2fs-tools in f2fs
> documentation.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  Documentation/filesystems/f2fs.rst | 46 ++++++++++++++++++++++++++++--
>  1 file changed, 44 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
> index 0f37c7443d5c5..2b3aef2f5fa1f 100644
> --- a/Documentation/filesystems/f2fs.rst
> +++ b/Documentation/filesystems/f2fs.rst
> @@ -315,7 +315,7 @@ mkfs.f2fs
>  The mkfs.f2fs is for the use of formatting a partition as the f2fs filesystem,
>  which builds a basic on-disk layout.
>  
> -The options consist of:
> +The quick options consist of:
>  
>  ===============    ===========================================================
>  ``-l [label]``     Give a volume label, up to 512 unicode name.
> @@ -337,6 +337,8 @@ The options consist of:
>                     1 is set by default, which conducts discard.
>  ===============    ===========================================================
>  
> +Note that, please refer manpage of mkfs.f2fs(8) to get full option list.
> +
>  fsck.f2fs
>  ---------
>  The fsck.f2fs is a tool to check the consistency of an f2fs-formatted
> @@ -344,10 +346,12 @@ partition, which examines whether the filesystem metadata and user-made data
>  are cross-referenced correctly or not.
>  Note that, initial version of the tool does not fix any inconsistency.
>  
> -The options consist of::
> +The quick options consist of::
>  
>    -d debug level [default:0]
>  
> +Note that, please refer manpage of fsck.f2fs(8) to get full option list.
> +
>  dump.f2fs
>  ---------
>  The dump.f2fs shows the information of specific inode and dumps SSA and SIT to
> @@ -371,6 +375,44 @@ Examples::
>      # dump.f2fs -s 0~-1 /dev/sdx (SIT dump)
>      # dump.f2fs -a 0~-1 /dev/sdx (SSA dump)
>  
> +Note that, please refer manpage of dump.f2fs(8) to get full option list.
> +
> +sload.f2fs
> +----------
> +The sload.f2fs gives a way to insert files and directories in the exisiting disk
> +image. This tool is useful when building f2fs images given compiled files.
> +
> +Note that, please refer manpage of sload.f2fs(8) to get full option list.
> +
> +resize.f2fs
> +-----------
> +The resize.f2fs can be used when user want to resize the f2fs-formatted disk
> +image, while keeping the stored files and directories.
> +
> +Note that, please refer manpage of resize.f2fs(8) to get full option list.
> +
> +resize.f2fs
> +-----------
> +The resize.f2fs let user resize the f2fs-formatted disk image, while preserving
> +all the files and directories stored in the image.
> +
> +Note that, please refer manpage of resize.f2fs(8) to get full option list.
> +
> +defrag.f2fs
> +-----------
> +The defrag.f2fs can be used to defragmente scattered writtend data as well as
> +filesystem metadata across the disk. This can improve the write speed by giving
> +more free consecutive space.
> +
> +Note that, please refer manpage of defrag.f2fs(8) to get full option list.
> +
> +f2fs_io
> +-------
> +The f2fs_io is a simple tool to issue various filesystem APIs as well as
> +f2fs-specific ones, which is very useful for QA tests.
> +
> +Note that, please refer manpage of f2fs_io(8) to get full option list.
> +
>  Design
>  ======
>  
> -- 
> 2.28.0.681.g6f77f65b4e-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
