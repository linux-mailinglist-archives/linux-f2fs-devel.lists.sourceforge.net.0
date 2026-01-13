Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF07D1777D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 10:05:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOSYzFKH2sjSweOzhe5aNc9rF2iwFhr3Z29rUbzXj/E=; b=Hnih+Xw51pXM49S7zhCjcS/vOW
	Gnw+xR63bUGs224GK7x7duWemC/OehnderDNQt+Daxo0tbin0H5+GZdUhRt8IA1vVbbt54pfaGUKe
	sBkKjhpCusVmytN2D8KgAhiqEiM7rrhLyXzg9ATYs6AxGwc4/4+rxP6ZnDiYq56N9Gog=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfaKu-0008Sh-09;
	Tue, 13 Jan 2026 09:05:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1vfaKt-0008Sb-92
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 09:05:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J8/jE9LuwZtzyvnPKHLVRMDZj7l4EPMxamKF5qFLzhw=; b=l488QeIOVAzvV0CiYIoPnjh3Ca
 0au7gcsWL12zCjC+pFdtG5OHbfNVNPlzl36msgShuHSF0QVdIWbnMTK59X6O2HlXsH7im7iTCVHjL
 O8BETyiaJSDxSBQxK3+TArHJBMmsZTJdm3YEZ+obClPylc39ho0nCvgz4XB/ojgDBnBw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J8/jE9LuwZtzyvnPKHLVRMDZj7l4EPMxamKF5qFLzhw=; b=ANPOWfMzYjCIIVpTHltiyuf0mI
 s13EF/+JTNmGi3jRyXgQukBgQ3R2Xs03peCdLWAMmhT0iiiukXWUQyryLr4iaVwjFOZp7ujSxgpuu
 WXw9gwNluPRhRR1zfjMkwORKGmuT4L41tjLRv0uwL/wagYwMzBjkyigmRIrcLs+u1frQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfaKs-0005Wv-3b for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 09:05:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C261C43FFE;
 Tue, 13 Jan 2026 09:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590E3C116C6;
 Tue, 13 Jan 2026 09:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768295104;
 bh=JI/qrCCxv4pysbre1tzQVlevGeAvi+n57KXP24R0MJ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CnYA8E2Gu31DQPhrYzsWX1t22ob14451gLqFOUSl/SinV1rCBAzfiU2sahsoSGqOJ
 VBY02ntXi5Q5SDRV6HiepZptbFX8F8AdQP9xqgFf93/WwlkU+hWr0R4I5VjLMPKGGh
 U63jcqRtJja7FTR60WIPOokx5BkhnvnMPEzZ6j/MWTva/UYy8Ec6zsUGcxVJ8qBV3d
 J0Pn7u7oEcRus23vOvWhgT6/IhNmgT+6zo1fnbZqkL3DArx+SuMnTVPWXLBOzp6o8n
 DGLZDjd1epIDdLleBOrWoaUzY0JtB4p/+CMsY57fIDfjqu7TMsTaI0xiwXgeHkL3Uq
 h5R7PZE9FG1xQ==
Date: Tue, 13 Jan 2026 10:04:56 +0100
To: Chuck Lever <cel@kernel.org>
Message-ID: <20260113-vorort-pudding-ef90f426d5cf@brauner>
References: <20260112174629.3729358-1-cel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260112174629.3729358-1-cel@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 12, 2026 at 12:46:13PM -0500, Chuck Lever wrote:
 > From: Chuck Lever <chuck.lever@oracle.com> > > Following on from > >
 https://lore.kernel.org/linux-nfs/20251021-zypressen-bazillus-545a44
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vfaKs-0005Wv-3b
Subject: Re: [f2fs-dev] [PATCH v3 00/16] Exposing case folding behavior
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
From: Christian Brauner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>, pc@manguebit.org, yuezhang.mo@sony.com,
 cem@kernel.org, almaz.alexandrovich@paragon-software.com,
 adilger.kernel@dilger.ca, linux-cifs@vger.kernel.org, sfrench@samba.org,
 slava@dubeyko.com, linux-ext4@vger.kernel.org, linkinjeon@kernel.org,
 sprasad@microsoft.com, frank.li@vivo.com, vira@so61, ronniesahlberg@gmail.com,
 glaubitz@physik.fu-berlin.de, jaegeuk@kernel.org, hirofumi@mail.parknet.co.jp,
 linux-nfs@vger.kernel.org, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, Chuck Lever <chuck.lever@oracle.com>,
 hansg@kernel.org, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 sj1557.seo@samsung.com, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 12, 2026 at 12:46:13PM -0500, Chuck Lever wrote:
> From: Chuck Lever <chuck.lever@oracle.com>
> 
> Following on from
> 
> https://lore.kernel.org/linux-nfs/20251021-zypressen-bazillus-545a44af57fd@brauner/T/#m0ba197d75b7921d994cf284f3cef3a62abb11aaa
> 
> I'm attempting to implement enough support in the Linux VFS to
> enable file services like NFSD and ksmbd (and user space
> equivalents) to provide the actual status of case folding support
> in local file systems. The default behavior for local file systems
> not explicitly supported in this series is to reflect the usual
> POSIX behaviors:
> 
>   case-insensitive = false
>   case-preserving = true
> 
> The case-insensitivity and case-preserving booleans can be consumed
> immediately by NFSD. These two booleans have been part of the NFSv3
> and NFSv4 protocols for decades, in order to support NFS clients on
> non-POSIX systems.
> 
> Support for user space file servers is why this series exposes case
> folding information via a user-space API. I don't know of any other
> category of user-space application that requires access to case
> folding info.

This all looks good to me.
Just one question: This reads like you are exposing the new file attr
bits via userspace but I can only see changes to the kernel internal
headers not the uapi headers. So are you intentionally not exposing this
as a new uapi extension to file attr or is this an accident?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
