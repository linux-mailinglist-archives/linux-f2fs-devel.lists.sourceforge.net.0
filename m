Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD479299670
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Oct 2020 20:10:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kX7sh-0005Pe-5t; Mon, 26 Oct 2020 19:10:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kX7sf-0005PW-Bt
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 19:10:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RjIEcrOh3c0uZaMjpWWeZ8+EU1c02NwkhxKXwTg4c4Q=; b=mhXlUMewHhNyJLSDNg4eoMdJ67
 DT0qP6QTL1Mtg1EgeLV37m4Bx5TwhI1wcwbiyEcRyye/7m7iZdg8ISUFSzz0Ukuwv/5n++9+HBUw/
 0F1bX5f9Di0WGTDwctJnUl7c3eo1oDolBQ36bT0Sts4FbfD0rFdaTYjX8akBY7k+OsfE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RjIEcrOh3c0uZaMjpWWeZ8+EU1c02NwkhxKXwTg4c4Q=; b=YnpscbrrokbOifIfwhNfOaftp+
 6ak291C35YilotMsI/t5/fjHI5MDiGSqRZrYUYsRpbRcsMHBplt7z3HoRsQ2vPjMRjyqUsrD30ojz
 Z91AjZ+uIy9uRbUlNIz+9aufijmI7gQZQhwy6J+vFmEt7o4Zxltwea18/Ms8NEZ+hIA4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kX7sb-007xIJ-5I
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 19:10:09 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 69779207C4;
 Mon, 26 Oct 2020 19:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603739390;
 bh=2IS64HnRc9y+q8Z5MiJRIZdsBB3GJPhRkgeyWqltGDA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h/LKASGjJkVprsSmMg8GqFQLrl5ou0F3gi1tBM8CJ8irI92i9wmzybBnIh4+62iRH
 Bu1pp8ffjCos+dunaOvrrSjjNUxHbg8l5rihlKx5xvIAbtOFUKlWNNTKXMI8DdDI7j
 Ubi03oOFWXRLPCXdTa5l4POmqywQxrcJfyLL3FcM=
Date: Mon, 26 Oct 2020 12:09:48 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20201026190948.GM858@sol.localdomain>
References: <20201026041656.2785980-1-daeho43@gmail.com>
 <20201026041656.2785980-2-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201026041656.2785980-2-daeho43@gmail.com>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kX7sb-007xIJ-5I
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs: add
 F2FS_IOC_SET_COMPRESS_OPTION ioctl
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
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com,
 Dan Carpenter <dan.carpenter@oracle.com>, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Oct 26, 2020 at 01:16:56PM +0900, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Added a new F2FS_IOC_SET_COMPRESS_OPTION ioctl to change file
> compression option of a file.
> 
> struct f2fs_comp_option {
>     u8 algorithm;         => compression algorithm
>                           => 0:lzo, 1:lz4, 2:zstd, 3:lzorle
>     u8 log_cluster_size;  => log scale cluster size
>                           => 2 ~ 8
> };
> 
> struct f2fs_comp_option option;
> 
> option.algorithm = 1;
> option.log_cluster_size = 7;
> 
> ioctl(fd, F2FS_IOC_SET_COMPRESS_OPTION, &option);
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> Reviewed-by: Eric Biggers <ebiggers@kernel.org>

Likewise, please don't add Reviewed-by until it is explicitly given.

The code looks fine now, but this is still missing any explicit mention of
documentation, tests, or use cases.

> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

It's best not to use Reported-by for fixes that get folded in to a patch, since
Reported-by makes it seems like the patch itself is a bug fix.  I recommend
mentioning folded-in fixes informally in the commit message instead, e.g.
"Folded in fix for build breakage reported by kernel test robot.".

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
