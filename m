Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2FF8A6673
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Apr 2024 10:50:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rweW4-0000d6-GG;
	Tue, 16 Apr 2024 08:50:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1rweW3-0000d0-Hx
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Apr 2024 08:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q8RD2gvEXUGgZfQHIzAcpv1uGMzDLpBLeVk35oktMnw=; b=MgVzLoeuFBQh9VbMYfugcr3+71
 IiB71kShCnD1PrKM1A6HKsabjC3u+QfR8hRf78xK3IHvA6zX+HbPKu37szmkTFeZlXsUF05tolPje
 2EbzhqhJXX+uD1RZw0JJLqEVNO7nCaDlEL7mTtvtNfwa5gymXHR8v6pVG7Gt1l2tTwLY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q8RD2gvEXUGgZfQHIzAcpv1uGMzDLpBLeVk35oktMnw=; b=L2fkSwtg8vJbb9XhGJnWyBLcpl
 3ZQXrn7dqROpDmXGWag2b+Rr6UgwXJ6tAwTDpHDtBT9ejPAwSWNqPfTQTd6h6b1BlF45dAIou5yCG
 qpdZQ9RVA5PbG463de3dsG+DS1hAuA/ZKTVNqA9i8kF9G0GGe6a5CC/DDkVZevZzytKU=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rweW3-0002ZW-3G for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Apr 2024 08:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713257404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q8RD2gvEXUGgZfQHIzAcpv1uGMzDLpBLeVk35oktMnw=;
 b=Y3shKqRUiVi2hDmqlsKRMGmIR2keJhONLCCt3MubK3xcT/eEpjhv67QLYQpNTMjXJn+UlY
 LaC6d26zUibFptE+VhJHKTAPU7Tl8Y3cAX/+IlbpnGHE0k1jkadp7o8kC76UaC/uumldV0
 rk1F3oDyLvjNmYFBxKTqnNoEe+Xs4zU=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-TER6FsguNr6RImKUEHn5Tg-1; Tue, 16 Apr 2024 04:50:03 -0400
X-MC-Unique: TER6FsguNr6RImKUEHn5Tg-1
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-3c5f316d1ffso4817577b6e.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Apr 2024 01:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713257402; x=1713862202;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q8RD2gvEXUGgZfQHIzAcpv1uGMzDLpBLeVk35oktMnw=;
 b=tM6WuiDt1XQX0l0Cxr7ugLs6enOT/I0cUVcAGhOY+ZyXefMvkp+ipzw1hkku9qUPSx
 xhXjaTycSbJuZvs5iFoxialRm8Bi2fDNY091gRVn840gqGIrdDJEF31aPtfth2JT9CM3
 Q+8tvUJIEKuSFtdeMx97srrH6tQ5ho01Bkrg3oqYXGKfAfuyItRgqXRCx/u8bVTAzn+S
 /XEhHG7nnLq/1wOY+ZAOK6S84o10UxHRyMCRyfv8ZBP4gYgw6VQ2CTcTJiZdgnZUGJ/V
 7pGuP2z8nNkY2na+bwsmMuG+uvG7LTc6sDm936HtV0oK6zZEyhiGDGt5xO7jQ4K8Eo96
 NnOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoasJx/rZGqNcpfpS6zBjiS7Jr3ArSOiquycci5TiGWf4IE2PgkWqW6BHEDJSD9UTbAYi52HZHQmdbJo0BUH4ZTfm78XBl+zrj84J+QHVS0/M6LW6Vhw==
X-Gm-Message-State: AOJu0YyHpz/KXSFFtaS2j6+bWOuo/jV61q2dNxQytQ3DTjq4j8hf2BVr
 p0vFTZgHN2zMjA1z5avTF7oxKbdJXzH4jsNsxfPpKpvo5hhWrQ4jAK1m5e5n8E+uSFiOSCtkFCV
 aNaajpK/hRLcCSrABfXJA97tbQnZHZopMWUWkNYlBPYjHZp7OqAGBMsMPsln6K13NcEjVlnSlLT
 g=
X-Received: by 2002:a05:6808:60c:b0:3c7:539:6d8b with SMTP id
 y12-20020a056808060c00b003c705396d8bmr8292308oih.30.1713257402582; 
 Tue, 16 Apr 2024 01:50:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD+NZXeFBRK/CkYLLjU5Een2fNjTAeT8LZ83PkekgAxytpKPK6wuNEn2YWXmxcL8r1pAVueg==
X-Received: by 2002:a05:6808:60c:b0:3c7:539:6d8b with SMTP id
 y12-20020a056808060c00b003c705396d8bmr8292290oih.30.1713257402100; 
 Tue, 16 Apr 2024 01:50:02 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 bn19-20020a056a00325300b006ed0b798f1fsm8537485pfb.119.2024.04.16.01.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 01:50:01 -0700 (PDT)
Date: Tue, 16 Apr 2024 16:49:57 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20240416084957.gyavejnhja6mofvo@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20240416071819.5004-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240416071819.5004-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -2.0 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 16, 2024 at 03:18:19PM +0800, Chao Yu wrote: >
 Previously, in f2fs, sysfile quota feature has different name: > - "quota"
 in mkfs.f2fs > - and "quota_ino" in dump.f2fs > > Now, it has unif [...] 
 Content analysis details:   (-2.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rweW3-0002ZW-3G
Subject: Re: [f2fs-dev] [PATCH] common/quota: fix keywords of quota feature
 in _require_prjquota() for f2fs
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Apr 16, 2024 at 03:18:19PM +0800, Chao Yu wrote:
> Previously, in f2fs, sysfile quota feature has different name:
> - "quota" in mkfs.f2fs
> - and "quota_ino" in dump.f2fs
> 
> Now, it has unified the name to "quota" since commit 92cc5edeb7
> ("f2fs-tools: reuse feature_table to clean up print_sb_state()").
> 
> It needs to fix keywords in _require_prjquota() for f2fs, Otherwise,
> quota testcase will fail.
> 
> generic/383 1s ... [not run] quota sysfile not enabled in this device /dev/vdc
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  common/quota | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/common/quota b/common/quota
> index 6b529bf4..cfe3276f 100644
> --- a/common/quota
> +++ b/common/quota
> @@ -145,7 +145,7 @@ _require_prjquota()
>      if [ "$FSTYP" == "f2fs" ]; then
>  	dump.f2fs $_dev 2>&1 | grep -qw project_quota
>  	[ $? -ne 0 ] && _notrun "Project quota not enabled in this device $_dev"
> -	dump.f2fs $_dev 2>&1 | grep -qw quota_ino
> +	dump.f2fs $_dev 2>&1 | grep -qw quota

This will _notrun on old f2fs-tools, due to `grep -w quota` doesn't match
old "quota_ino". So how about grep -Eqw "quota|quota_ino", or any better idea
you have.

Thanks,
Zorro

>  	[ $? -ne 0 ] && _notrun "quota sysfile not enabled in this device $_dev"
>  	cat /sys/fs/f2fs/features/project_quota | grep -qw supported
>  	[ $? -ne 0 ] && _notrun "Installed kernel does not support project quotas"
> -- 
> 2.40.1
> 
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
