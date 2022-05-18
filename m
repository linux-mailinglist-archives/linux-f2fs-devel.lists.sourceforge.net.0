Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FE452C333
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 May 2022 21:23:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrPGY-0001fR-77; Wed, 18 May 2022 19:23:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nrPGX-0001fL-5V
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 19:23:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZRrfDFz7KwTZ+d6tNCoIj1rebdSQPVoNWaqTlaP+8cw=; b=Y2mPt7SEK6EQOvRTd1RL/q+Jg2
 W2vu7HFGWBEf0NcfCG4ux4uwW19F88CRS+uImU/RrdCKWewfSLIe26fTf6sebRqti+r4n/ZaX/cpw
 J1sTPjgUii0WjxnCXZ+WjHVgbFT/M1sqfdHPSfHb9gL+PkbCeONMqCvQ50AnlOPGWHfY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZRrfDFz7KwTZ+d6tNCoIj1rebdSQPVoNWaqTlaP+8cw=; b=GxtaqyjkYwMyLFnyVWplY/e1Ov
 j2DKLo1sjxDPeK3rEjTWvdW4FtvRpoQzSXAetFpHeLwGAZIN4a0BGtlMAkO4/lx2cRBXhU5hcHCuf
 ZuVsq56MLPAta22thsgdBW7qeYgita1xpUe9Btr2slCn54HjAdNWKvWj8eZVm2MbNOmI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrPGV-007Lm1-IX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 19:23:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2BCE061909;
 Wed, 18 May 2022 19:23:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C923C34100;
 Wed, 18 May 2022 19:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652901797;
 bh=4IkUWqt05H3mspNzpAHNA//Q0t9+x8L7venXN8Yy1AQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q/yMvGVJPqmt1uqdUfqz6l7Row1oRP3Zoc9dBaVlXlzcPlrYGZHdOnFwC/iZXaMF2
 Fcf8wiq4jEfK33r178p3QLU06oHNRQhhQC8YpzBw/QR79cI+dAJ6rr07HKSOqN05g+
 FM5FSfiQ3D4b7duJOsnjqTqfDPArQ97E1cMYCE07cMBi8Y2h+QD9j+lb/zXF0CCEmf
 mhNjjnXVlPje6JstXk9G+/RbmdjOhtFdRsdwt9ZF/nGgvFcP9WSfx8ubz6CjpNXR3K
 xaHPdWWr/gpRlSFB9SA0fZKtW2WGFTt+UcYArDETy1m5ZNAxP3xys1pKQoPloZYpRG
 7lrZPE8Cs0aWg==
Date: Wed, 18 May 2022 12:23:15 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <YoVHo7SXDRsVk8My@sol.localdomain>
References: <20220518172320.333617-1-krisman@collabora.com>
 <20220518172320.333617-7-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220518172320.333617-7-krisman@collabora.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 18, 2022 at 01:23:18PM -0400, Gabriel Krisman
 Bertazi wrote: > If the volume is in strict mode, ext4_ci_compare can report
 a broken > encoding name. This will not trigger on a bad lookup, [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nrPGV-007Lm1-IX
Subject: Re: [f2fs-dev] [PATCH v5 6/8] ext4: Log error when lookup of
 encoded dentry fails
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

On Wed, May 18, 2022 at 01:23:18PM -0400, Gabriel Krisman Bertazi wrote:
> If the volume is in strict mode, ext4_ci_compare can report a broken
> encoding name.  This will not trigger on a bad lookup, which is caught
> earlier, only if the actual disk name is bad.
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> 
> ---
> 
> changes since v4:
>   - Reword error message (Eric)
> 
> Changes since v1:
>   - reword error message "file in directory" -> "filename" (Eric)
> ---
>  fs/ext4/namei.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
> index 98295b03a57c..8fbb35187f72 100644
> --- a/fs/ext4/namei.c
> +++ b/fs/ext4/namei.c
> @@ -1396,6 +1396,9 @@ static bool ext4_match(struct inode *parent,
>  			 * only case where it happens is on a disk
>  			 * corruption or ENOMEM.
>  			 */
> +			if (ret == -EINVAL)
> +				EXT4_ERROR_INODE(parent,
> +					"Directory contains filename that is invalid UTF-8");
>  			return false;
>  		}
>  		return ret;

Reviewed-by: Eric Biggers <ebiggers@google.com>

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
