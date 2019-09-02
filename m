Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61095A5DDE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2019 00:45:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i4v4a-0003A8-Pz; Mon, 02 Sep 2019 22:45:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1i4v4a-00039z-Ai
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Sep 2019 22:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ta8nwrPB5ER+hiLIoJJn9+62whZAyKr+V2dSHo8GZOk=; b=cgf3vpgMzqtgo4AV3wnJJqXkgB
 GfrN3yhqAyqMLRJYFfYPyCBIZOKAwItpVOYUic2MvVtSMDWjma8rMkDT3LqT8CSoR1hKGSD3/ug95
 sg66QtTszG6hjCV3hyl/6NNz8aQj+R3AzVB6qsmfJ+Fcp+mXd2rpJheKgGrfMcTMvrto=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ta8nwrPB5ER+hiLIoJJn9+62whZAyKr+V2dSHo8GZOk=; b=Wf3sUNye+4L6jNj0/0HBI/O3jo
 7x77YR2UDaAtdKLIKtuUdDfKRPlsbqWL3vQNXxdvv3e+VBLe0bgDHlE1jO6sGcFZN6cFltISy9NFH
 xyp1Nr/ZjLWvsbkFFaWjv4oZKrrZqEKPYReI/0A+22BhxbHHuUmUNdVweZjfpY7yn+j0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i4v4Y-007BrL-Jl
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Sep 2019 22:45:20 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C91921670;
 Mon,  2 Sep 2019 22:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567464312;
 bh=2/bvHEUGjbn33I09vQfbYl9alCap/oRpT4fu/HtXKlY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a92Zq78rjLrXUxEqr4so3tayqENEnffKjOJbin05btK9RGC3G1aGWODtNgT4d9Z7y
 PAADYuRD2tMNTncGAR8m/kH9d42J7A3JvQI6jWeml3F2ueYSebjvWRE4WEzbnaroOu
 N+y83siRz1vTmjQqLSuEcMqSUB3Blb/BPGBBcWgo=
Date: Mon, 2 Sep 2019 15:45:11 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Surbhi Palande <f2fsnewbie@gmail.com>
Message-ID: <20190902224511.GB71929@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190823224045.26377-1-csurbhi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190823224045.26377-1-csurbhi@gmail.com>
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
X-Headers-End: 1i4v4Y-007BrL-Jl
Subject: Re: [f2fs-dev] [PATCH] Check all the data segments against all node
 ones.
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
Cc: Surbhi Palande <csurbhi@gmail.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Surbhi,

Applied as "f2fs: check all the data segments against all node ones".

Thanks,

On 08/23, Surbhi Palande wrote:
> As a part of the sanity checking while mounting, distinct segment number
> assignment to data and node segments is verified. Fixing a small bug in
> this verification between node and data segments. We need to check all
> the data segments with all the node segments.
> 
> Signed-off-by: Surbhi Palande <csurbhi@gmail.com>
> ---
>  fs/f2fs/super.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 6b959bb..1ec4d95 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2684,11 +2684,11 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
>  		}
>  	}
>  	for (i = 0; i < NR_CURSEG_NODE_TYPE; i++) {
> -		for (j = i; j < NR_CURSEG_DATA_TYPE; j++) {
> +		for (j = 0; j < NR_CURSEG_DATA_TYPE; j++) {
>  			if (le32_to_cpu(ckpt->cur_node_segno[i]) ==
>  				le32_to_cpu(ckpt->cur_data_segno[j])) {
>  				f2fs_msg(sbi->sb, KERN_ERR,
> -					"Data segment (%u) and Data segment (%u)"
> +					"Node segment (%u) and Data segment (%u)"
>  					" has the same segno: %u", i, j,
>  					le32_to_cpu(ckpt->cur_node_segno[i]));
>  				return 1;
> -- 
> 2.7.4


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
