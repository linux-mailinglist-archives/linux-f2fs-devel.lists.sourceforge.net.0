Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B68319FD8F7
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 Dec 2024 05:29:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tROSW-0001YJ-6q;
	Sat, 28 Dec 2024 04:29:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1tROSU-0001YD-SR
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Dec 2024 04:29:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7EfW69f1VbR875uQRLJFk3Xl8wJJasMX4yD9gMIjf4E=; b=bM4l0mbDT/+X7ku3/Pr8yPJz0c
 HQf0pWkg74YKvyjOgiyx1ta0REpwq7izRUGIp2UiNRuXsWpZOwoxuOvlGJjBI6bE990P3a2Kovwho
 SR0d6PFv7PfMTBwUurtFa612AEx/qomUHODk+KlBVZp2Y0OxFREDEI3g/ZXrkXPxuQa4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7EfW69f1VbR875uQRLJFk3Xl8wJJasMX4yD9gMIjf4E=; b=VJ3a5OPZD896NUvJogOyxzSNzS
 N3/eF1a0rLroWWyXlTFeTnm/YJa2iDFdjY+SK8+oYbRw3ipZrDvkpZQYjEGxHsInsQq6LpEo0aaXJ
 hQJclleDBSkxzfwCBIst7F6Taid5dNOiBdYrpZmkeT4al2OrIwRGh8DljuXnYWTO3ftY=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tROSU-0007hE-5d for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Dec 2024 04:29:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735360179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7EfW69f1VbR875uQRLJFk3Xl8wJJasMX4yD9gMIjf4E=;
 b=aw40skrhy+7VE4PvdQQ17FN0khdK9ptfe1ei9KGwRdwBx4F8i4aYgEOEWo/z0Mww23SpsU
 1XF5Jiuu5e0nD7Li0QwwxhEXcKIC+yzOVXvW+78J/oLY4YzASWO9QAVeigFV/wjmXJ+qA9
 orLEgdokWGLRIBXSvApVRT/IReKH9Zg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-ZSLFk7ksPjaF57wR9Gltjw-1; Fri, 27 Dec 2024 23:29:38 -0500
X-MC-Unique: ZSLFk7ksPjaF57wR9Gltjw-1
X-Mimecast-MFC-AGG-ID: ZSLFk7ksPjaF57wR9Gltjw
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2ef8c7ef51dso9728770a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 27 Dec 2024 20:29:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735360177; x=1735964977;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7EfW69f1VbR875uQRLJFk3Xl8wJJasMX4yD9gMIjf4E=;
 b=kU0YYFwDi07lKu6jAfiTeDoq7DBIbYDVJUgZMz4U/mP5s3OmBLykBW0zLTi5wCSM4t
 yoROEzRut34D1TPRpbSjGUBdBxUQ7KOhR24g+GAWwq7S52XjLLXPx/WsLRhecyEvYB9i
 KY1QqK/09NCbjNqKOsryNp4xFqTYTLkNhBy294Tmogasw2LFn6bQCbz9trPtvOMIzO9h
 2L7Kme51VklpIjlXz7bKGK/mC0UQfyfq79ej2ED9yQEPe9NMR8W9HuCoL61XPorqCJzL
 H5oKNKm/f0/LetD6+1j4umiu+luf8Rhmf3uXw6Xofz2GYJw4+ges7E1LI6vkYhhrF+3L
 gvmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3loQEzlmQjSWStxRfRCUOkAtVJ0exvkbHhPOR9kwCjnNywApV+S4FXTQslm9xUEv6jQeWCHaTRK/b5rhUWZ14@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzoPJQhNCajF1ByiONcCuAqWvCSNTrFp8jD37m3wezZ+ofPYCm3
 ck34PAPVkQ6YFxLs7Q1tbezxyB9TTKXf/15vMghk+Xbvha/5EDCjBzpJP0rdRW+O17I1wTP+CSR
 rSTWimsdtjbcsh+41GGspaMh3eqWn16VrpBvVGgBoi2A0snK2qCi7/Dvujt2AX8W4kZvGJTvkhf
 RsGLv5ucygsA==
X-Gm-Gg: ASbGncsVBhH06f+4lmVSAJuoZUiV1AOcxr9nMEKXoG9wMxp0FqyaC/z2lGjPXoYZUI3
 0tuvYJyKnxulj+3CAYIKjstNoKfghLZRl07xUD5FfZkqDeYwEFRYYBs8NlTL8qFp30+ly9H/Mxx
 YKEckKdMuqResNqTm1pXSq5lfAGQR2mPSggBu2hm+AbXynF4og7MMRvXh+txDaFOUOCorQ6fY36
 wQCcJJHtitidj1SuXttrJeHNMwNoUl2fQJkFRTEYm7bvBv0YVyFO8hFb/DfEaiUTTNcYquqTovV
 sJhq0AUkHbqoFfMtu+18FA==
X-Received: by 2002:a17:90b:2b83:b0:2ef:9dbc:38d1 with SMTP id
 98e67ed59e1d1-2f4435ad5e6mr45177912a91.5.1735360176841; 
 Fri, 27 Dec 2024 20:29:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1MdxnWOsnF/Nx/tbnW5WGIG+UHcQ1Kyol/UUxYMSG87cGahqG+KdcewPaFgaSIsQRZPlBig==
X-Received: by 2002:a17:90b:2b83:b0:2ef:9dbc:38d1 with SMTP id
 98e67ed59e1d1-2f4435ad5e6mr45177896a91.5.1735360176557; 
 Fri, 27 Dec 2024 20:29:36 -0800 (PST)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc9f7356sm143127715ad.193.2024.12.27.20.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Dec 2024 20:29:36 -0800 (PST)
Date: Sat, 28 Dec 2024 12:29:32 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20241228042932.jvevyhdxmp6sasjx@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20241226133631.9486-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241226133631.9486-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: v3Of2I3j3QpvoqraMSv2iY5zdgbPpyL-mdJEIvkHx20_1735360177
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Dec 26, 2024 at 09:36:30PM +0800, Chao Yu wrote: >
 Then, f2fs/* testcases can use this wrapped common helper instead of > raw
 codes. > > Suggested-by: Zorro Lang <zlang@kernel.org> > Signed-of [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.133.124 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tROSU-0007hE-5d
Subject: Re: [f2fs-dev] [PATCH v4 1/2] common/rc: support f2fs in _mkfs_dev()
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
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Dec 26, 2024 at 09:36:30PM +0800, Chao Yu wrote:
> Then, f2fs/* testcases can use this wrapped common helper instead of
> raw codes.
> 
> Suggested-by: Zorro Lang <zlang@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v4:
> - no updates
>  common/rc | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/common/rc b/common/rc
> index 7b5bc0b4..ecac2de8 100644
> --- a/common/rc
> +++ b/common/rc
> @@ -833,6 +833,9 @@ _try_mkfs_dev()
>      ext2|ext3|ext4)
>  	$MKFS_PROG -t $FSTYP -- -F $MKFS_OPTIONS $*
>  	;;
> +    f2fs)
> +	$MKFS_PROG -t $FSTYP -- -f $MKFS_OPTIONS $*
> +	;;

Oh, that's fine to me if you don't want to use mkfs.f2fs directly.

Reviewed-by: Zorro Lang <zlang@redhat.com>

>      xfs)
>  	$MKFS_PROG -t $FSTYP -- -f $MKFS_OPTIONS $*
>  	;;
> -- 
> 2.40.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
