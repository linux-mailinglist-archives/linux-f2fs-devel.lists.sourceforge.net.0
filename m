Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E77D1A111
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 17:02:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qH3D/F7KmVVcCgIJgCjEpZSkskRzVoy3r92hSdb0JQ4=; b=aeRYVRjWKXp/Zdq/ZtEpjuCZOd
	GUN/eNtD7yM3ccL8T+799mXXa7u5t+Acr71Zjw/DmetznXBuGKsSIn1m5w2FhCBeaksVvxuuycZ4B
	/HoUfipdy1c89Qu52M7NWX19tn0/hNG3GvKi+SLJGBYLdsFfwQAYsHqk2pmp0dGuqefs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfgqr-0006QO-A8;
	Tue, 13 Jan 2026 16:02:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vfgqp-0006QG-L6
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 16:02:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uyx3CPNYqWf9Y0ZfpjIu5gZbX9PAdQ476oXXyeXNVsc=; b=k7zi6AsJXbjqvXtcezQ54WevI2
 FQoUP/jCg+73nVLV7yXR02QAPzJWIfbBKxfXFyqpHZW6D5VGnYm5FNW9ccDnww7w5YvDjN5P3oP2s
 fViZyNDvIrkXT6tpXN97xS2LQMQwboEQj2kTZtXs96g75vbCIVNi2iQsIW2keDwAUXFQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uyx3CPNYqWf9Y0ZfpjIu5gZbX9PAdQ476oXXyeXNVsc=; b=E/l5RobSpu6YDI+Pmqj3lsLWMk
 fMVXD4peZzG93D1wmacTxOhcLFxtFb2qSZiGXS0Jm2AoXm94cEkxTczcaiNB10/qa0OnDGR7699EI
 jlYxGvngR2xYvGOlRlDqYTYwWhYwcpENaeyLAORyX8bUnqa3E++lGcsmy+iDowlpet64=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfgqp-0003T7-2o for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 16:02:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 25AA96000A;
 Tue, 13 Jan 2026 16:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C84DCC116C6;
 Tue, 13 Jan 2026 16:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768320143;
 bh=sJ0drImlHmi4eNlw3/9VNDxuss8pVfndyTc8DUdPStU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QYMFv/D7kfTqCnOamWRJJWLSuiy/pNTRNJlG7B/24d9mG8L6I49CIapWbCN6Hhr9q
 uVam4pdO+LwbitPkimVBbCjcS/rlj6tn2RUmPJidX/IIfSOemj1sn1wJffxGd0bsAv
 KwT0TJM8LrSZjMqaxhZXnfBN+aJjR4cK6fKrZ0wIiqV40Pr4kyxZ12dNNHdJbHMR8e
 k1BEf2haHaYdPV6G9u4oUH9cRrmNk23GyrRC9vsGwznkxM36BdbsPsdvFpFa80YVi+
 5G+zUe54ezm5Y0QqVZ4cV4PozoIliY9VUH146N2iJDrC7AlttIRCBcL2cmK2v9QsR3
 /e6w1GcNo3RKQ==
Date: Tue, 13 Jan 2026 08:02:23 -0800
To: Chuck Lever <cel@kernel.org>
Message-ID: <20260113160223.GA15522@frogsfrogsfrogs>
References: <20260112174629.3729358-1-cel@kernel.org>
 <20260112174629.3729358-9-cel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260112174629.3729358-9-cel@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 12, 2026 at 12:46:21PM -0500, Chuck Lever wrote:
 > From: Chuck Lever <chuck.lever@oracle.com> > > Upper layers such as NFSD
 need to query whether a filesystem is > case-sensitive. Populate [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
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
X-Headers-End: 1vfgqp-0003T7-2o
Subject: Re: [f2fs-dev] [PATCH v3 08/16] xfs: Report case sensitivity in
 fileattr_get
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Jan Kara <jack@suse.cz>, pc@manguebit.org, yuezhang.mo@sony.com,
 cem@kernel.org, almaz.alexandrovich@paragon-software.com,
 adilger.kernel@dilger.ca, linux-cifs@vger.kernel.org, vira@web.codeaurora.org,
 sfrench@samba.org, slava@dubeyko.com, linux-ext4@vger.kernel.org,
 linkinjeon@kernel.org, sprasad@microsoft.com, frank.li@vivo.com,
 linux-nfs@vger.kernel.org, ronniesahlberg@gmail.com,
 glaubitz@physik.fu-berlin.de, jaegeuk@kernel.org, hirofumi@mail.parknet.co.jp,
 Christian Brauner <brauner@kernel.org>, Neal Gompa <neal@gompa.dev>,
 tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, senozhatsky@chromium.org,
 Chuck Lever <chuck.lever@oracle.com>, hansg@kernel.org, anna@kernel.org,
 linux-fsdevel@vger.kernel.org, sj1557.seo@samsung.com, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 12, 2026 at 12:46:21PM -0500, Chuck Lever wrote:
> From: Chuck Lever <chuck.lever@oracle.com>
> 
> Upper layers such as NFSD need to query whether a filesystem is
> case-sensitive. Populate the case_insensitive and case_preserving
> fields in xfs_fileattr_get(). XFS always preserves case. XFS is
> case-sensitive by default, but supports ASCII case-insensitive
> lookups when formatted with the ASCIICI feature flag.
> 
> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>

Well as a pure binary statement of xfs' capabilities, this is correct so:
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

[add ngompa]

But the next obvious question I would have as a userspace programmer is
"case insensitive how, exactly?", which was the topic of the previous
revision.  Somewhere out there there's a program / emulation layer that
will want to know the exact transformation when doing a non-memcmp
lookup.  Probably Winderz casefolding has behaved differently every
release since the start of NTFS, etc.

I don't know how to solve that, other than the fs compiles its
case-flattening code into a bpf program and exports that where someone
can read() it and run/analyze/reverse engineer it.  But ugh, Linus is
right that this area is a mess. :/

--D

> ---
>  fs/xfs/xfs_ioctl.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
> index 59eaad774371..97314fcb7732 100644
> --- a/fs/xfs/xfs_ioctl.c
> +++ b/fs/xfs/xfs_ioctl.c
> @@ -516,6 +516,13 @@ xfs_fileattr_get(
>  	xfs_fill_fsxattr(ip, XFS_DATA_FORK, fa);
>  	xfs_iunlock(ip, XFS_ILOCK_SHARED);
>  
> +	/*
> +	 * XFS is case-sensitive by default, but can be formatted with
> +	 * ASCII case-insensitive mode enabled.
> +	 */
> +	fa->case_insensitive = xfs_has_asciici(ip->i_mount);
> +	fa->case_preserving = true;
> +
>  	return 0;
>  }
>  
> -- 
> 2.52.0
> 
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
