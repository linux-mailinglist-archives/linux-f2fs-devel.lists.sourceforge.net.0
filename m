Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 808AB5F7E56
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Oct 2022 21:53:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ogtPM-0005Ip-3T;
	Fri, 07 Oct 2022 19:53:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ogtPI-0005Ii-1o
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Oct 2022 19:53:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lZTE9LZFLkUp0pkhzqKbFqLOibYtRgSOCtYS0nAO0EM=; b=J/R+MIWcu2TIXw9jXYmbsm4TLw
 diqmBShx0LH9hxXz69+m272P2pI5tik6TTCfyeLSVqeCAuYp2uxD6BmFa1uuxfAvmwTt67+vzkB4g
 4nK3mze7gaFWaOFzPASTb6+nNc1GPhu/po1bF/QtSHpxnUs5im7O5MkxZ+hjVWQhawLA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lZTE9LZFLkUp0pkhzqKbFqLOibYtRgSOCtYS0nAO0EM=; b=ayMTVIZ6CyHKzjScBDxkkn5arL
 tLrKNc7XdICo7K+PjUn4qqQXGfilEPxEAsHVyFSxW04xcSlcTdyY1fxoi3tZ00vBR6e5xbOf4kDZE
 D8pgFwg5ZcX4gQBnsCdFyn7sAdcP1CigEPV1T59mGCDUHXPLDcJQG2Jq64bsybvGAYjM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ogtPH-00G4Wv-EP for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Oct 2022 19:53:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A26A261DC5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  7 Oct 2022 19:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED060C433C1;
 Fri,  7 Oct 2022 19:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665172387;
 bh=PENtVLSLbiMvy0AAtehW1kggCRKgDaYMKZHZoM9+Vdk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ltORIGbljggxbdAPNQySO1DRrywvHVu7yxodCVDsxWzswzGUZ3xX+2Hn5cEAXTSX8
 qPcqXjS9SO4oWMC4+wBwYelb0QikSeg6vfDTmjQh302+58Mx+igIbQcu7NIBUH7A2R
 gR1ZrvJwne54pxwYe6gQ/+E55y4NDPMG7KiO12svM0QJXBdcVwzA4AeMiWbX9rpXJ/
 wu4Mh6XJzrkrU27B7oNTuFnV0KsYQ5EaaO2t7LMuYvdAl+LGDS/elYYUN7WZiduvL8
 pkderRzlTEwM8MYa91grPf+1roiDsobHXecQBlNF7c7PEcqUpHtEi47QHVdDHS/pX4
 zQp7azdleOmPg==
Date: Fri, 7 Oct 2022 12:53:05 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y0CDoWiaGKHkmnzQ@google.com>
References: <20221006151428.57561-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221006151428.57561-1-chao@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Merged into the original patch. On 10/06, Chao Yu wrote: >
 fs/f2fs/super.c:3886:6: warning: no previous prototype for
 'f2fs_record_stop_reason'
 [-Wmissing-prototypes] > > Signed-off-by: Chao Yu <chao@kernel.org> > ---
 > fs/f2fs/supe [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ogtPH-00G4Wv-EP
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix compile warning
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Merged into the original patch.

On 10/06, Chao Yu wrote:
> fs/f2fs/super.c:3886:6: warning: no previous prototype for 'f2fs_record_stop_reason' [-Wmissing-prototypes]
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index fad333881ea2..2908d41ed462 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3884,7 +3884,7 @@ static void save_stop_reason(struct f2fs_sb_info *sbi, unsigned char reason)
>  	spin_unlock(&sbi->error_lock);
>  }
>  
> -void f2fs_record_stop_reason(struct f2fs_sb_info *sbi)
> +static void f2fs_record_stop_reason(struct f2fs_sb_info *sbi)
>  {
>  	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
>  	int err;
> -- 
> 2.36.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
