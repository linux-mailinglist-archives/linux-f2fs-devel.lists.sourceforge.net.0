Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4115FF19D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Oct 2022 17:44:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ojMrY-0006RB-Av;
	Fri, 14 Oct 2022 15:44:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1ojMrQ-0006Qv-L8;
 Fri, 14 Oct 2022 15:44:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=At7eVmlyzkDZqcTvPX5Kyt4U2pb4kxBTHPOzo5aV09w=; b=SQuKCTKAIBcLF/mXTcVVGaCxy+
 6X0z7glh0S/o5AXn793AtA0ST7oc2M+4ivjNjtYkOxPVs8gkKM4yjI25FpvEPK1C1s4M60crG8X7e
 6QKGGWreT5A0QbT5mPxNA7aSUPSuu07UEh8CeDWvp/Vx0QBbvhtd8O86lLGrRx/QSCRM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=At7eVmlyzkDZqcTvPX5Kyt4U2pb4kxBTHPOzo5aV09w=; b=BBi9pIUBmkbHUN264eww/QPjML
 yTYDkgvKdEDfMoHTTuMky3XWOukhBUQOVCTtIY3noSt424N4qVeQu38MtelgZgD36eRIlCDKEe9ln
 PtpLkI/OtKUNk683ynnkYaRsi4hlRJLZ0fpDFb0PNcW1fhIR9DHz/ALgM8DulK93SAvo=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ojMrM-003jtn-AJ; Fri, 14 Oct 2022 15:44:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 53335CE268A;
 Fri, 14 Oct 2022 15:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F66C433D6;
 Fri, 14 Oct 2022 15:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665762256;
 bh=a5ohXX2HljiK2lNNucw1xbywST/b4xYjzGhuCnryDTo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BojrB6HSrEMn1FhOgfcP/WBFDRf35mrgRpMiajKBb27i/tgA0yefz/nT4qQzAhWud
 I2BIVssXLeiYN1j+rCLBf8YukEVGRs/Yo7TcK41ggGHF1t8gNqn7JmlWjM9nbQTpay
 Bo6K8LKowNqInWjustkMtzWpwqYUb3dK79HqY6jzscgi+4qSDsEd54sSQ98ZxN9SSg
 WbN6PEb8FHoe6zPwitBWhHa8UGo/t58coOzis1+FRAp3U8lEIgrB9QvPSd9PYSHaIC
 +IEzfryV+tWCKGx95u9xR0HrB9NwDP3GqRC4BFQFgbqBZlGnfqVyboxmulVghVWA3B
 Xo1doKeBNsfuQ==
Date: Fri, 14 Oct 2022 08:44:16 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Hrutvik Kanabar <hrkanabar@gmail.com>
Message-ID: <Y0mD0LcNvu+QTlQ9@magnolia>
References: <20221014084837.1787196-1-hrkanabar@gmail.com>
 <20221014084837.1787196-6-hrkanabar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221014084837.1787196-6-hrkanabar@gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Oct 14, 2022 at 08:48:35AM +0000, Hrutvik Kanabar
 wrote: > From: Hrutvik Kanabar <hrutvik@google.com> > > When
 `DISABLE_FS_CSUM_VERIFICATION`
 is enabled, return truthy value for > `xfs_verify_ [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ojMrM-003jtn-AJ
Subject: Re: [f2fs-dev] [PATCH RFC 5/7] fs/xfs: support
 `DISABLE_FS_CSUM_VERIFICATION` config option
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
Cc: Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Hrutvik Kanabar <hrutvik@google.com>, kasan-dev@googlegroups.com,
 linux-ext4@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 Marco Elver <elver@google.com>, Josef Bacik <josef@toxicpanda.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Anton Altaparmakov <anton@tuxera.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ntfs-dev@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Aleksandr Nogikh <nogikh@google.com>,
 linux-fsdevel@vger.kernel.org, Sungjong Seo <sj1557.seo@samsung.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Oct 14, 2022 at 08:48:35AM +0000, Hrutvik Kanabar wrote:
> From: Hrutvik Kanabar <hrutvik@google.com>
> 
> When `DISABLE_FS_CSUM_VERIFICATION` is enabled, return truthy value for
> `xfs_verify_cksum`, which is the key function implementing checksum
> verification for XFS.
> 
> Signed-off-by: Hrutvik Kanabar <hrutvik@google.com>

NAK, we're not going to break XFS for the sake of automated fuzz tools.

You'll have to adapt your fuzzing tools to rewrite the block header
checksums, like the existing xfs fuzz testing framework does.  See
the xfs_db 'fuzz -d' command and the relevant fstests.

--D

> ---
>  fs/xfs/libxfs/xfs_cksum.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/xfs/libxfs/xfs_cksum.h b/fs/xfs/libxfs/xfs_cksum.h
> index 999a290cfd72..ba55b1afa382 100644
> --- a/fs/xfs/libxfs/xfs_cksum.h
> +++ b/fs/xfs/libxfs/xfs_cksum.h
> @@ -76,7 +76,10 @@ xfs_verify_cksum(char *buffer, size_t length, unsigned long cksum_offset)
>  {
>  	uint32_t crc = xfs_start_cksum_safe(buffer, length, cksum_offset);
>  
> -	return *(__le32 *)(buffer + cksum_offset) == xfs_end_cksum(crc);
> +	if (IS_ENABLED(CONFIG_DISABLE_FS_CSUM_VERIFICATION))
> +		return 1;
> +	else
> +		return *(__le32 *)(buffer + cksum_offset) == xfs_end_cksum(crc);
>  }
>  
>  #endif /* _XFS_CKSUM_H */
> -- 
> 2.38.0.413.g74048e4d9e-goog
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
