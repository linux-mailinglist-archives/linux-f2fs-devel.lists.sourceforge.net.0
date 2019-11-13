Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D3590FB98D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Nov 2019 21:19:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iUz6x-0003lE-4G; Wed, 13 Nov 2019 20:19:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iUz6v-0003l7-T3
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 20:19:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IqqDglIqbH0f23TGm05un5wUaOzP5wwZvPsZuKXzHKY=; b=AL32/zQRE31yQJRKdT6icvdXw2
 Hj8YeoXFs5H5I4VbD4ixLow7ElSdcITCkVeeRRQJpHHrDP2NK8/DlShZDj8kCWj2BOElBRb1DGyws
 /r0iXRNdEBKdmsCUIaGdj2KWPy/Qsa/iTEtYfsKXGdx1ptjCXXw1UTkSHCBebnp3Nglg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IqqDglIqbH0f23TGm05un5wUaOzP5wwZvPsZuKXzHKY=; b=cRmx6QaoLQVOwaLA0NM6b+XK2q
 QKKAwEM8j+SIjV/AetwuOxqStEtBazmwTtNTGySx2AuHuw44p86ssTdRM2ow1ByEyqb2m3bu8YCpD
 FPIPNb/fu+DGB/dKoeOEdCdFLyEnBlSCyDr6TRooPZ1SMG5/A5ffJ3Sd7OSWDTKWGzWI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iUz6t-00FXSB-VU
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 20:19:29 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EABCB206EF;
 Wed, 13 Nov 2019 20:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573676355;
 bh=j4gN5NwjBXBqoaj2hP3JnJYtyUSYX8bUB1lxuJirsFQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d1SPOgo+YLlhI7eIc/HM7xo3j4m7eFhYIqoqJtwFcO7Ik8PFl+TXKyqaozsEFO2N2
 2Ow+eQ9wJFntacwFDb7yOVvjpEYYbhwI67BOSydN8S8WikS/zHAy5YlYefGXZ2P2fG
 rwWMrauVIkErWIYMVi4KW1naelLhv8hKz3JdfOOs=
Date: Wed, 13 Nov 2019 12:19:12 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <20191113201911.GF221701@gmail.com>
Mail-Followup-To: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20191030221915.229858-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030221915.229858-1-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.6 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iUz6t-00FXSB-VU
Subject: Re: [f2fs-dev] [PATCH] docs: fs-verity: document first supported
 kernel version
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
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Oct 30, 2019 at 03:19:15PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> I had meant to replace these TODOs with the actual version when applying
> the patches, but forgot to do so.  Do it now.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  Documentation/filesystems/fsverity.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/filesystems/fsverity.rst b/Documentation/filesystems/fsverity.rst
> index 3355377a2439..a95536b6443c 100644
> --- a/Documentation/filesystems/fsverity.rst
> +++ b/Documentation/filesystems/fsverity.rst
> @@ -406,7 +406,7 @@ pages have been read into the pagecache.  (See `Verifying data`_.)
>  ext4
>  ----
>  
> -ext4 supports fs-verity since Linux TODO and e2fsprogs v1.45.2.
> +ext4 supports fs-verity since Linux v5.4 and e2fsprogs v1.45.2.
>  
>  To create verity files on an ext4 filesystem, the filesystem must have
>  been formatted with ``-O verity`` or had ``tune2fs -O verity`` run on
> @@ -442,7 +442,7 @@ also only supports extent-based files.
>  f2fs
>  ----
>  
> -f2fs supports fs-verity since Linux TODO and f2fs-tools v1.11.0.
> +f2fs supports fs-verity since Linux v5.4 and f2fs-tools v1.11.0.
>  
>  To create verity files on an f2fs filesystem, the filesystem must have
>  been formatted with ``-O verity``.
> -- 
> 2.23.0
> 

Applied to fscrypt.git#fsverity for 5.5.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
