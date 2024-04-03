Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D41896371
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Apr 2024 06:22:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rrs98-0007yW-94;
	Wed, 03 Apr 2024 04:22:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rrs97-0007yQ-1T
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 04:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VTCABte6jce163I6MLFZNqy3l3LpltEmCHh6LKa62pc=; b=jwcoTnVOHAGMhTdrraWIAnnC33
 xYKJ7Q1lSyGWg6YhnGjwaCtDuQoGnGqbu22vJtEcElT3xD5N4NwSFmTHGQfxKjTufAxgU3EH0o8vT
 CmO8wgaCAvqcJpLHsw3YgwMN7x0G+4u947OiugkFdKAAFOSRvLoP/DAgbxQ0GPWx/RL4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VTCABte6jce163I6MLFZNqy3l3LpltEmCHh6LKa62pc=; b=WKDMMYAl1a5V/xiLVgYAjYVhrq
 nIz+ST//prSDRG3h5Jb5CoIf2n2MLAhSPQEOtILqVD2Qp1nn+7K24rJ4/hjro7195iuqVT/CzPB+c
 pMKp8irtMCQF46CG2aUvgt8uBDhry3jBqzIltW0NJAaNgqmTDCel3v+z6KJmVa3P84ls=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rrs96-0000IU-Eo for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Apr 2024 04:22:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 63BC360DE4;
 Wed,  3 Apr 2024 04:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F81C433F1;
 Wed,  3 Apr 2024 04:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712118154;
 bh=RziLX4KmfrHv88fw3gSwzASvgPajd59CTngrkRmOSnA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YhVw4H90SPZTOe+o9L+rwRKHwnOQVJGOPnyIJJpX/jDX8aq8Uboa1HJcC9afYaeEB
 VvjUDFMW5C3llc/cxvg8AWKe37x/2sDj4tc8YFTpUv0QiuWXwD98OGdj+19O3fVp14
 ZTL0OtusBj/ekHgjv3xDsMGaKjjK+vvbR4DXTB/Es5eyoIy3mKFDNiHQjtAjwrGHJM
 T/5oOF+Ve5RB7l9hR43HckD9ZBIFTYK5t/lbk1BKeItYqBWeGIlcXluTSQmVsOtfaA
 D3jaYXxBcuhm19Qnd7zaMliUfcNoGKGLV76OnKXHkqOPeK5sFH5434b2yM1CHBD46Q
 KosV6AKUOqE8A==
Date: Tue, 2 Apr 2024 21:22:31 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Eugen Hristev <eugen.hristev@collabora.com>
Message-ID: <20240403042231.GH2576@sol.localdomain>
References: <20240402154842.508032-1-eugen.hristev@collabora.com>
 <20240402154842.508032-7-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240402154842.508032-7-eugen.hristev@collabora.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 02, 2024 at 06:48:39PM +0300, Eugen Hristev via
 Linux-f2fs-devel wrote: > From: Gabriel Krisman Bertazi
 <krisman@collabora.com>
 > > If the volume is in strict mode, ext4_ci_compare can rep [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rrs96-0000IU-Eo
Subject: Re: [f2fs-dev] [PATCH v15 6/9] ext4: Log error when lookup of
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
Cc: krisman@suse.de, brauner@kernel.org, kernel@collabora.com, tytso@mit.edu,
 jack@suse.cz, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Apr 02, 2024 at 06:48:39PM +0300, Eugen Hristev via Linux-f2fs-devel wrote:
> From: Gabriel Krisman Bertazi <krisman@collabora.com>
> 
> If the volume is in strict mode, ext4_ci_compare can report a broken
> encoding name.  This will not trigger on a bad lookup, which is caught
> earlier, only if the actual disk name is bad.
> 
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> ---
>  fs/ext4/namei.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
> index 2d0ee232fbe7..3268cf45d9db 100644
> --- a/fs/ext4/namei.c
> +++ b/fs/ext4/namei.c
> @@ -1477,6 +1477,9 @@ static bool ext4_match(struct inode *parent,
>  			 * only case where it happens is on a disk
>  			 * corruption or ENOMEM.
>  			 */
> +			if (ret == -EINVAL)
> +				EXT4_ERROR_INODE(parent,
> +					"Directory contains filename that is invalid UTF-8");
>  			return false;

I'm seeing this error when the volume is *not* in strict mode and a file has a
name that is not valid UTF-8.  That doesn't seem to be working as intended.

    mkfs.ext4 -F -O casefold /dev/vdb
    mount /dev/vdb /mnt
    mkdir /mnt/dir
    chattr +F /mnt/dir
    touch /mnt/dir/$'\xff'

[ 1528.691319] EXT4-fs (vdb): Using encoding defined by superblock: utf8-12.1.0 with flags 0x0
[ 1528.707793] EXT4-fs (vdb): mounted filesystem 0be607cc-0dae-4e7f-a40f-4fe8075e8e50 r/w with ordered data mode. Quota mode: none.
[ 1528.728583] EXT4-fs error (device vdb): ext4_match:1481: inode #13: comm touch: Directory contains filename that is invalid UTF-8
[ 1528.730700] EXT4-fs error (device vdb): ext4_match:1481: inode #13: comm touch: Directory contains filename that is invalid UTF-8
[ 1528.732976] EXT4-fs error (device vdb): ext4_match:1481: inode #13: comm touch: Directory contains filename that is invalid UTF-8
[ 1528.735536] EXT4-fs error (device vdb): ext4_match:1481: inode #13: comm touch: Directory contains filename that is invalid UTF-8


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
