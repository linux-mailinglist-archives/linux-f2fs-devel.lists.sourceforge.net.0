Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C238A7AF6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Apr 2024 05:17:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rwvn5-0003VV-5a;
	Wed, 17 Apr 2024 03:16:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1rwvn2-0003VN-W1
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Apr 2024 03:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nid1SGsDjBVi4vfnINteaorQ2WAwGabIOLIsBWDkZGk=; b=Ap5bp7kcEfTtJF5jHm9MWGRvNq
 +YhHqwpdMd1KOvdVLksz+iJOmPGdxZovtq6FusAYpMF7MLAaerkqYbeqawjTmVwX8n9FH9BYu/4Cp
 3SFWcXMOBrlJO5y29kRtcCF1eXaCd559sQ0p/irSVdaRFrl1lMEMbS2fbAmKb2TghC9w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nid1SGsDjBVi4vfnINteaorQ2WAwGabIOLIsBWDkZGk=; b=W8Cc5uleFnFVAKavjsp8QEy8TT
 1H+S0MvzRDDhIkfDohqkqeeEDBrGqmhb/fQPpnyfPO6Nhjt4vjBZ3EpRiMiIDum8nk8x5OtPPAeQ9
 xJ4Ga1WVMZ8SSiQWfUEVlANr/4FUUi0NJszIoHLeClbN/dBDr7GzB89uzucrvyyQXNKQ=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rwvn2-0007s8-8b for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Apr 2024 03:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713323800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nid1SGsDjBVi4vfnINteaorQ2WAwGabIOLIsBWDkZGk=;
 b=bYfH7va+xjH0duzX39Qf9Hd9ODiA+kiBDZepXMUbs8WY5AaM/iDBOC2GaOqaeIPo1o0OxO
 h4r2zfL/q9rQ8Im1ery5MI6shBbatt7AE818SDwQQUcIp9EIFpIno9S32PYOfMX+SpEaZz
 m9Tg06LUO+vcx0lduThIJ7jOXECrkY8=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-kl_TTEn0OxC6HXbMahOTnQ-1; Tue, 16 Apr 2024 23:16:39 -0400
X-MC-Unique: kl_TTEn0OxC6HXbMahOTnQ-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1e2a1619cfcso3646235ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Apr 2024 20:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713323798; x=1713928598;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nid1SGsDjBVi4vfnINteaorQ2WAwGabIOLIsBWDkZGk=;
 b=pFO2algBvCPXyOl+RbItW1prxHF4cUuogwjg24X/NXzZeZwuoxPGiggaEFlYMhAao7
 zTfToNWHxelJ7IDH8BwbdKarQ/Hm88Rztu/IUWkid9qYr4qrd+5Rqs3WZjmUt3EtHKeM
 r1EdO71HEvBPT9UzOh8tSOqDprG8ueVeb9k42Fjs2bPiNWnhcUx+SrZo+VMVq22xbw3u
 RlTY0nppY8fsPuBZWG50eEucRwW1w5guK/BOT+0/dxRsBU9KDjJk/iXVZefxbCSOzEQQ
 tm8/KgYUN1JIemHlUisNukYs5muS6P9k6JqjVKPedF1EVKBLJP0XLcQqLVLFHSKLnl7G
 1x9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIQawHyKIPu1wmaN9dtV/AXDtqgvh1D2/ppThtX6JkpXfsDkAw7tLv/p6weFmvIMPwWqOo+qlmTdMVzRTmzId3qV4jhfc1qrPTQU6k2comUCcQ4i0fDQ==
X-Gm-Message-State: AOJu0YyAbucm7AEI/VJeb3RmLIMzLq4NtmWN1etx08AC9fGJ1FNzqGLZ
 9JcCrJ60Srt/lizvOxCI3i6ycAM/aawYmx9DdcEW5L41LlypcnNpwPGoO1eGe+L/6l5zBikI/2k
 92KcQT6Aw+3kVjPqQ/OGXSCgM4/uJneKqo6g5setVs2pww5ID+BL5+BYdL70/nGFDAYJ7+vi2Be
 0=
X-Received: by 2002:a17:902:a987:b0:1e5:a3b2:3da9 with SMTP id
 bh7-20020a170902a98700b001e5a3b23da9mr4104683plb.17.1713323797999; 
 Tue, 16 Apr 2024 20:16:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRK6+pU2sdfdG+AF8eD73PL3wQrawl+MN5871gFXL371xA1tmtVwzZlYl3vCik72K7QtIFwA==
X-Received: by 2002:a17:902:a987:b0:1e5:a3b2:3da9 with SMTP id
 bh7-20020a170902a98700b001e5a3b23da9mr4104657plb.17.1713323797495; 
 Tue, 16 Apr 2024 20:16:37 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a170902e88a00b001e3e0a8b32asm10486438plg.45.2024.04.16.20.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 20:16:37 -0700 (PDT)
Date: Wed, 17 Apr 2024 11:16:33 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20240417031633.chckvd5ebnakmp7g@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20240416101650.53078-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240416101650.53078-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 16, 2024 at 06:16:50PM +0800, Chao Yu wrote: >
 Previously, in f2fs, sysfile quota feature has different name: > - "quota"
 in mkfs.f2fs > - and "quota_ino" in dump.f2fs > > Now, it has unif [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.5 RCVD_IN_SORBS_WEB      RBL: SORBS: sender is an abusable web server
 [209.85.214.197 listed in dnsbl.sorbs.net]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rwvn2-0007s8-8b
Subject: Re: [f2fs-dev] [PATCH v2] common/quota: update keywords of quota
 feature in _require_prjquota() for f2fs
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

On Tue, Apr 16, 2024 at 06:16:50PM +0800, Chao Yu wrote:
> Previously, in f2fs, sysfile quota feature has different name:
> - "quota" in mkfs.f2fs
> - and "quota_ino" in dump.f2fs
> 
> Now, it has unified the name to "quota" since commit 92cc5edeb7
> ("f2fs-tools: reuse feature_table to clean up print_sb_state()").
> 
> It needs to update keywords "quota" in _require_prjquota() for f2fs,
> Otherwise, quota testcase will fail as below.
> 
> generic/383 1s ... [not run] quota sysfile not enabled in this device /dev/vdc
> 
> This patch keeps keywords "quota_ino" in _require_prjquota() to
> keep compatibility for old f2fs-tools.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - keep keywords "quota_ino" for compatibility of old f2fs-tools
> suggested by Zorro Lang.

This version looks good to me, thanks

Reviewed-by: Zorro Lang <zlang@redhat.com>

>  common/quota | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/common/quota b/common/quota
> index 6b529bf4..4c1d3dcd 100644
> --- a/common/quota
> +++ b/common/quota
> @@ -145,7 +145,7 @@ _require_prjquota()
>      if [ "$FSTYP" == "f2fs" ]; then
>  	dump.f2fs $_dev 2>&1 | grep -qw project_quota
>  	[ $? -ne 0 ] && _notrun "Project quota not enabled in this device $_dev"
> -	dump.f2fs $_dev 2>&1 | grep -qw quota_ino
> +	dump.f2fs $_dev 2>&1 | grep -Eqw "quota|quota_ino"
>  	[ $? -ne 0 ] && _notrun "quota sysfile not enabled in this device $_dev"
>  	cat /sys/fs/f2fs/features/project_quota | grep -qw supported
>  	[ $? -ne 0 ] && _notrun "Installed kernel does not support project quotas"
> -- 
> 2.40.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
