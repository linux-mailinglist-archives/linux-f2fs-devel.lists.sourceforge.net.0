Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BEEAAAB96
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 May 2025 03:58:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IIxagwjgaOdjCYtHgDGEE3Vok1g+n3MGjBxRlizajvA=; b=M1xegSxTvI51UAYcmHe7aR18Hz
	P94tbERNVk55EPrwsoVT2Rj52aVHioONWgAqEfI6X02BCQLKfU2wIa8pRLDXGmJNgbyld0emTSkFN
	0ZxZH1YmAccmiYNiNXozOIIcpZ9Yzd3yJaHBcvUhReho7jrRtTiNvsLJnfbrjMvOKT6U=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uC7Zo-0002Ec-Ls;
	Tue, 06 May 2025 01:58:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1uC7Zg-0002EQ-Dq
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 May 2025 01:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xMLcPl3iKBUpkeNrh92Lo4eyOS4pTDnll1BJ+NR3yFc=; b=K2l5mYOqEEzdXmDxq5LS6zb+r/
 wu7Tu4O6yfMrLY8bSGZC06af73GXvdk8ArIGUjHD9bSaHo6pafNxPbbxKrK3jc8ZN88GCBtgZmsHO
 JCu3XZrlPrsXbKZfHEAkV+25ej4kXZybkpcvl7yMAiUrvyHtRX1OcbwvpTDqnkKMw9k4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xMLcPl3iKBUpkeNrh92Lo4eyOS4pTDnll1BJ+NR3yFc=; b=mdc1oBO7lUBn3/FFDMXABw/Mwb
 JJwNBwmSMCyGKXLwfdggMN1Vw4BscJCOLNx6Vi9eS+UXZgcgcIDT4hg5vW4/1XK4SoCke8cNYpHfe
 zSlYYlvo/YhUG1cuHuZi3CmVBDIvF+XQZvQH+LO49Gec4B0vEciTbB6pv8vRwzCEZCaE=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uC7ZN-0001eZ-VC for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 May 2025 01:58:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746496674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xMLcPl3iKBUpkeNrh92Lo4eyOS4pTDnll1BJ+NR3yFc=;
 b=AEd5ROCuYOnva7WdXaOQjnBIFD+iLcqE5Xozvg7+2YdJLy1dD1PcISSwKOSjeiS8eTWaou
 ZXAuUUhWZSHD0kh+x/8WJdi+CR9nMjzpbWMcW5sIcq5M/T2odAW2T4tOgMBeRn+5ssDLvU
 JCc+xBhytd6R+iKXkci3hst75lHiguk=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-nhZVtNPmMj2nIJm-HfXC3Q-1; Mon, 05 May 2025 21:57:51 -0400
X-MC-Unique: nhZVtNPmMj2nIJm-HfXC3Q-1
X-Mimecast-MFC-AGG-ID: nhZVtNPmMj2nIJm-HfXC3Q_1746496670
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-3d8f1c1ce45so98834825ab.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 05 May 2025 18:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746496670; x=1747101470;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xMLcPl3iKBUpkeNrh92Lo4eyOS4pTDnll1BJ+NR3yFc=;
 b=LKyoLgVnTln0NntbqHfGjltJ/KEVi6FgYaYF8aGt2dm0LieMJAq1lJ4OToECLA4oLS
 N2zV7fkorXlM6B7HsjtHXbYy32uFOq3T3X0q1NoSXW/pZDmOzrI4ek1zB9XYRHcwzuN1
 JIFeK4JrI2eJhFNGjYtt5bmma7nKhdTd7e6LU5aEswrJazFPBLdSCiE98cUfjzJVIzSz
 jrMco4RCzgoPvSBCYEecc+AUkkdmlZicnXzCuwEnSFHQvDh5fOyrHveF0W1xvo8sJH8i
 yHrSr2lFMQLT5RhzvnBVbcmaOl2KuQRnExteyx/wP9SXlkSv/6Wa0uVsJPoi+FOuMooM
 HnUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5kc1QUJKxQPqQtwWZ8HUgZuR1go7fwXg6ZlnDkGxDGoc2ti2K/VDcrn90TrtRD9SuT1xZA2DYnKJzVi1JWcpm@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxZ2DcTQf9eAD6DxfM3EWIg0lk1FcweTZpnDj9yRvMLVGb4Mmor
 mJVNxfnvuWRCnBskHngVWRrxCp2n7w6g6qtbryd98dScQqFwvXoMJwVcH5aDbhWik5TTWQZscW7
 Ut1F9oaeOgCenVlZ0EYEloBUnNpstdjpSFTGkCo82sCk+ubUVtDuSQydgDQmwstBnocbp2MMka1
 w=
X-Gm-Gg: ASbGnct8IO3bb9ajRWszZYCO67YQnDnORTCr6DtnxhYrH4WT7jazdPFenKJjuvpMjSi
 gjz6D55Q2Ul3swKPs0AM+UqvkASFTVtCWpozvw4zbHdZ0eCXnkzEvPiVKgmFXoMTgmducqVXkWa
 TXR06pw9dZsJp9Wi/khmre99+tUJUb5aA2iMDDqPbGecSzFpH4aq+jnht361eU83SiKazf+P2nK
 bvVGscsr41LznaBxXUHagFWNUGFjPre3wwGMAuCbXMGMXGEUGCrIEF5tlBtCuBmbll3/gTzWC/O
 7zO6q+3vcJnxUJ1UppsIc/2s40y+twkeyiGsfkNh7xLtAhgXbA==
X-Received: by 2002:a05:6e02:3486:b0:3d8:2023:d057 with SMTP id
 e9e14a558f8ab-3da6cde18c2mr16092325ab.11.1746496670316; 
 Mon, 05 May 2025 18:57:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0rAJvKFUUhFhbgbTRiDocZ8gkc3d2s5yO8VLR73Cn1xBSmtzwyXjRkJ3Ch72ghFkrMJrr6Q==
X-Received: by 2002:a05:6e02:3486:b0:3d8:2023:d057 with SMTP id
 e9e14a558f8ab-3da6cde18c2mr16092185ab.11.1746496670048; 
 Mon, 05 May 2025 18:57:50 -0700 (PDT)
Received: from [10.0.0.82] (97-116-169-14.mpls.qwest.net. [97.116.169.14])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4f88aa93f35sm2003005173.126.2025.05.05.18.57.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 18:57:49 -0700 (PDT)
Message-ID: <2102fabb-bde3-4eaa-ad38-18eb79281e0b@redhat.com>
Date: Mon, 5 May 2025 20:57:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250505221419.2672473-1-sashal@kernel.org>
 <20250505221419.2672473-156-sashal@kernel.org>
In-Reply-To: <20250505221419.2672473-156-sashal@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EzWuAK3QiQREp05oeuh0hJdETpqg2ZSsfJdtOqllmm4_1746496670
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This commit is in no way a bugfix and I don't see any reason
 to backport it to stable kernels. Thanks, -Eric On 5/5/25 5:06 PM, Sasha
 Levin wrote: > From: Eric Sandeen <sandeen@redhat.com> > > [ Upstream commit
 9cca49875997a1a7e92800a828a62bacb0f577b9 ] > > Defer the
 readonly-vs-norecovery check until after [...] 
 Content analysis details:   (-1.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uC7ZN-0001eZ-VC
Subject: Re: [f2fs-dev] [PATCH AUTOSEL 6.14 156/642] f2fs: defer readonly
 check vs norecovery
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
From: Eric Sandeen via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Sandeen <sandeen@redhat.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This commit is in no way a bugfix and I don't see any reason to
backport it to stable kernels.

Thanks,
-Eric

On 5/5/25 5:06 PM, Sasha Levin wrote:
> From: Eric Sandeen <sandeen@redhat.com>
> 
> [ Upstream commit 9cca49875997a1a7e92800a828a62bacb0f577b9 ]
> 
> Defer the readonly-vs-norecovery check until after option parsing is done
> so that option parsing does not require an active superblock for the test.
> Add a helpful message, while we're at it.
> 
> (I think could be moved back into parsing after we switch to the new mount
> API if desired, as the fs context will have RO state available.)
> 
> Signed-off-by: Eric Sandeen <sandeen@redhat.com>
> Reviewed-by: Chao Yu <chao@kernel.org>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  fs/f2fs/super.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index b8a0e925a4011..d3b04a589b525 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -728,10 +728,8 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  			set_opt(sbi, DISABLE_ROLL_FORWARD);
>  			break;
>  		case Opt_norecovery:
> -			/* this option mounts f2fs with ro */
> +			/* requires ro mount, checked in f2fs_default_check */
>  			set_opt(sbi, NORECOVERY);
> -			if (!f2fs_readonly(sb))
> -				return -EINVAL;
>  			break;
>  		case Opt_discard:
>  			if (!f2fs_hw_support_discard(sbi)) {
> @@ -1418,6 +1416,12 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
>  		f2fs_err(sbi, "Allow to mount readonly mode only");
>  		return -EROFS;
>  	}
> +
> +	if (test_opt(sbi, NORECOVERY) && !f2fs_readonly(sbi->sb)) {
> +		f2fs_err(sbi, "norecovery requires readonly mount");
> +		return -EINVAL;
> +	}
> +
>  	return 0;
>  }
>  



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
