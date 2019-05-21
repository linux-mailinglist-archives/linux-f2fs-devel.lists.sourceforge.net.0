Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84694244F3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 May 2019 02:11:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hSsNe-0002LT-4G; Tue, 21 May 2019 00:11:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hSsNd-0002LM-0g
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 May 2019 00:11:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9AIO6h7XHmm30YdXnHcMqw6FQsHFqFlTtVMPCUFnOsA=; b=au6owgy/SRRUXyoZROny979z5k
 Oo3OPAX43DABX14cU7dRp+qMxe1y0W3jt5QOqK+LDQgFuz/3gSKzoI69Zes9nUk4kUHh641et4rId
 tyq05WED4mLgmpYMzyYJ3KjJYMR9dNn0Zhs7BkfZsgz+9ee/nOTTXVGlvFk/ep08GRWg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9AIO6h7XHmm30YdXnHcMqw6FQsHFqFlTtVMPCUFnOsA=; b=R9tD2BnlDxLLACqHXhtprUj2ds
 56mzEXXqjWo767vQIqYImy5s7NhBNOLQyNBGRY1ELyZ1vBHWUbsXciUdLm4STFyNgcoucY8/d96ue
 N2ozhvdjTFWu4JC9b6kGSIf6Uy9TQ6TXU9SQWYpyVVr4Mhc1B7Gi1r43aP9c58h+PF/E=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hSsNb-00CRuL-Qg
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 May 2019 00:11:44 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 30C8720863;
 Tue, 21 May 2019 00:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558397498;
 bh=ABPIvcrTzkxAitmW/yo6xTpBqw+1dJkUwceJEUvnxTY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GsAchDxAKlP+dSijQYJKN/OWApaY7QhfYDMtUe1ig7f4gDQHUYXlp9lGHVlrHNoXr
 mgmEWsYPjQhpUJi2sDSh+kQm4vZGB+n20f3vNRm3y0+57m7h7HgmahD8LffRtC8clS
 1gu8uec3AebjCGfsptF+2d4IccZVmrcMAV46CJZc=
Date: Mon, 20 May 2019 17:11:37 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Park Ju Hyung <qkrwngud825@gmail.com>
Message-ID: <20190521001137.GE61195@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190514063623.57162-1-qkrwngud825@gmail.com>
 <20190514063623.57162-3-qkrwngud825@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514063623.57162-3-qkrwngud825@gmail.com>
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
X-Headers-End: 1hSsNb-00CRuL-Qg
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: always assume that the device is
 idle under gc_urgent
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/14, Park Ju Hyung wrote:
> This allows more aggressive discards and balancing job to be done
> under gc_urgent.

Let me merge this first. :)

> 
> Signed-off-by: Park Ju Hyung <qkrwngud825@gmail.com>
> ---
>  fs/f2fs/f2fs.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 533fafca68f4..14c95116cd3d 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2192,6 +2192,9 @@ static inline struct bio *f2fs_bio_alloc(struct f2fs_sb_info *sbi,
>  
>  static inline bool is_idle(struct f2fs_sb_info *sbi, int type)
>  {
> +	if (sbi->gc_mode == GC_URGENT)
> +		return true;
> +
>  	if (get_pages(sbi, F2FS_RD_DATA) || get_pages(sbi, F2FS_RD_NODE) ||
>  		get_pages(sbi, F2FS_RD_META) || get_pages(sbi, F2FS_WB_DATA) ||
>  		get_pages(sbi, F2FS_WB_CP_DATA) ||
> -- 
> 2.21.0
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
