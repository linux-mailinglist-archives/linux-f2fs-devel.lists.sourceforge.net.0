Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4603C524526
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 May 2022 07:49:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1np1hA-00015c-1w; Thu, 12 May 2022 05:49:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1np1h9-00015S-5G
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 05:49:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=blKQp9NbxeOpm5rI37NawX7u+i6HxnVTrdJj3E2/UGc=; b=TTesk3XuHTM5KBe1JdNZzs1B41
 KsJqCjLLgRtEoEfyiKeons6pRLTHmeTfTmUqpkiPIEkVWca+j8CCNrr+lb6Nx3xAdnKjGuRpqpOzU
 JnY3wHZd+n8rfOYgQcNBVQBBfbPpFbIgWBxfdQHnf8qB2ECWetgEkGuLsFA1jx8timEU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=blKQp9NbxeOpm5rI37NawX7u+i6HxnVTrdJj3E2/UGc=; b=ZX2ry1AHZqkkgy3HH9loR0pPiJ
 ZlYkUB37mtDty7IQktp9+iO0bmfryCpZdTkkeMoz+3Qv1j1UhzYUAtsIytaeG5XdXN/2ExNlHBXqr
 IoPGvBuyndqFsCcdtpD+5a4qcZo2L0EG9fAop/eUStDHs5EaBQ76742X9/TDNdv4feQA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1np1h6-0007mm-VU
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 05:49:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F372361CEF;
 Thu, 12 May 2022 05:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E30C34100;
 Thu, 12 May 2022 05:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652334534;
 bh=d08puB5fh8hsuQ35H3WmEybfW309kt4JfYm4wR3DdCI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FQ49KXR5PTPy0h8HyvgwYK4024ceZHItRofouxcJ+5L8lFGZxOGyONCFg0DYXie9y
 IGbGmEaZVViRdK5Tu93KLwmIiIoK7qie1PmNm7IsuyIJeMGN+23c2w79lwV/GCvTfQ
 DubIYXKytnaAgtL+tKFlqzHlo+taC3uBpCrGfepRjxEc4KwUnxeUx9Zk6FlOXXV/Ni
 igZE33iAYb0vHdHld1BJ7HiIYFEsRh+mLd0puAEkg1nTyHZUvWuvPh/usab+vUCEcd
 mMEVah3l9TlotcamEY1okYWpY3EYpPXcPpMjvRQ9DTeMgw36icUSRjxYJtYeWMBqc3
 oo2+cgbmXiZ2g==
Date: Wed, 11 May 2022 22:48:52 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <YnyfxNBxFy0LZfJ7@sol.localdomain>
References: <20220511193146.27526-1-krisman@collabora.com>
 <20220511193146.27526-7-krisman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220511193146.27526-7-krisman@collabora.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 11, 2022 at 03:31:42PM -0400, Gabriel Krisman
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
X-Headers-End: 1np1h6-0007mm-VU
Subject: Re: [f2fs-dev] [PATCH v4 06/10] ext4: Log error when lookup of
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

On Wed, May 11, 2022 at 03:31:42PM -0400, Gabriel Krisman Bertazi wrote:
> If the volume is in strict mode, ext4_ci_compare can report a broken
> encoding name.  This will not trigger on a bad lookup, which is caught
> earlier, only if the actual disk name is bad.
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> 
> ---
> 
> Changes since v1:
>   - reword error message "file in directory" -> "filename" (Eric)
> ---
>  fs/ext4/namei.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
> index cebbcabf0ff0..708811525411 100644
> --- a/fs/ext4/namei.c
> +++ b/fs/ext4/namei.c
> @@ -1458,6 +1458,9 @@ static bool ext4_match(struct inode *parent,
>  			 * only case where it happens is on a disk
>  			 * corruption or ENOMEM.
>  			 */
> +			if (ret == -EINVAL)
> +				EXT4_ERROR_INODE(parent,
> +						 "Bad encoded filename");

This message is still quite vague; perhaps it should be more specific about what
a "bad" filename is?  Maybe something like: "Directory contains filename that is
not valid UTF-8" (or whatever the encoding being enforced is).

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
