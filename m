Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4A752449E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 May 2022 07:00:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1np0vj-0007x6-JO; Thu, 12 May 2022 05:00:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1np0vh-0007wh-PN
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 05:00:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OB9WC/36puDCxRirbFROempv2Wzj5a1JoXnc2BOFVFE=; b=JXDFdfnBZQ/5vzcsTFvVpe4OCN
 Feepwc1wA278kyiR2jsjxS/02x1PSHz7BtRuDbZHrZGLvqrsbgjkQmP0BoSo9fdf9PhWT90jn4Wxi
 953C3xnblRyhLeSIs5wp2z9Lly8Wl6eyTNfPBSIAtzlx0O531SOI/aBvpsF37wAJzo/g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OB9WC/36puDCxRirbFROempv2Wzj5a1JoXnc2BOFVFE=; b=Jomx4wy/hfYgJp28++HPRSqBZo
 co7DIyO1trGBfe+N4uq85GNd96wyTPxwJ+L/0pp5QjpQlD4OtBsuwNUU1WXhvFXV+7V4Ji88CVzly
 QxmC/FygixUapDrHNG8WxKGI42GfqsmolidVG+3k7F3weMYiayJF1S8txuU0cjOQJbCQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1np0vZ-009Nuk-9G
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 05:00:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F3C23B826F0;
 Thu, 12 May 2022 04:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B21DC385B8;
 Thu, 12 May 2022 04:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652331581;
 bh=9lGboVgAvwbA5h9yhNnTQKCZmE6NNW1JPa5DBZ6/QQI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WvJ1eRrFmojtIGU59ektCRDFQ1TixHnMOHbRpQemKnQ93NOdZntDAWEzSrc6StSE8
 MlnciQGE06ZtUTLG7HYIzKOYmtHJ0u94z1vFKW1Pl8DdCSU0lEzgaAASHISQ4/NLTn
 jSDI8NLwYSlJ8Mqj25YLe3hsI77YtbXU6WcP8DnQmvK5epRgRosgXLkIA8Eyrgatg+
 c7KHfrbpQQZmkLJpggC3pJy56togQgKPqKFvLD18IRO66fzciJ2d8N9s6h3q8PQKW2
 ovryp3btaSIB36nfbLl3/6ha92/+WTv0nj66IksQc24bQ5Dhy8PUMrYy+EGUOQ84kU
 qe9ZZot7j7Yeg==
Date: Wed, 11 May 2022 21:59:39 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <YnyUOxkr4LaZ9OO5@sol.localdomain>
References: <20220511193146.27526-1-krisman@collabora.com>
 <20220511193146.27526-10-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220511193146.27526-10-krisman@collabora.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 11, 2022 at 03:31:45PM -0400, Gabriel Krisman
 Bertazi wrote: > Instead of a bunch of ifdefs, make the unicode built checks
 part of the > code flow where possible, as requested by Torvalds. [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1np0vZ-009Nuk-9G
Subject: Re: [f2fs-dev] [PATCH v4 09/10] ext4: Move CONFIG_UNICODE defguards
 into the code flow
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
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 jaegeuk@kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 11, 2022 at 03:31:45PM -0400, Gabriel Krisman Bertazi wrote:
> Instead of a bunch of ifdefs, make the unicode built checks part of the
> code flow where possible, as requested by Torvalds.
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> ---
>  fs/ext4/ext4.h  | 39 +++++++++++++++++++--------------------
>  fs/ext4/namei.c | 15 ++++++---------
>  fs/ext4/super.c |  4 +---
>  3 files changed, 26 insertions(+), 32 deletions(-)
> 
> diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
> index 93a28fcb2e22..e3c55a8e23bd 100644
> --- a/fs/ext4/ext4.h
> +++ b/fs/ext4/ext4.h
> @@ -2725,11 +2725,17 @@ extern unsigned ext4_free_clusters_after_init(struct super_block *sb,
>  					      struct ext4_group_desc *gdp);
>  ext4_fsblk_t ext4_inode_to_goal_block(struct inode *);
>  
> -#if IS_ENABLED(CONFIG_UNICODE)
>  extern int ext4_fname_setup_ci_filename(struct inode *dir,
> -					 const struct qstr *iname,
> -					 struct ext4_filename *fname);
> +					const struct qstr *iname,
> +					struct ext4_filename *fname);

I think this function should just have a !CONFIG_UNICODE stub that does nothing,
so that the callers can just call it unconditionally and not have to gate their
call on CONFIG_UNICODE themselves.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
