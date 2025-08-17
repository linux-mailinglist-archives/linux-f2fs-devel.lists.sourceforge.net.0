Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D51BCB29252
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 Aug 2025 10:43:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jMA8F2rFC9FVlb6ZR0gTAEDTydnwRloaZn5y+V0xQHA=; b=E5Yhaxq7m5Ls/YyQZx/IJLFJm7
	oWMvwWbQFbENFjM+OKxat/zoYOksqQlW0jCxwMrdS/bJ8xVN75LuBkUouuAaqv9w7D0TEQWnPZPsN
	74GZnrz+q8jd3FAwYj1XTeIAWRWuQVK6h390jy9cYQWhdP0jvHO/ewiLcDyuNMxAZf4Q=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1unYzF-0007SZ-FT;
	Sun, 17 Aug 2025 08:43:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1unYzD-0007SS-EW
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 17 Aug 2025 08:43:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rq4YXS+xac1WFQmsLw/7/5+gnl0xUJ4PHyPQ6ACSu3g=; b=H/FYY/P9IJVdVxW5ytiefod2aa
 kl/0U6ufKpBQabUfQYDXd4xwNpUMHEvZAwE1IeOCj4bj9cNqGlGoI6+ITleaTd1L2cCr+R5G9xsFy
 2d13o46vG+Vx7s/yw84KeTC8NU+X9N0QXRqEMW9rWxHZsTZY2nvu3rPHMnaC6rCNXxPU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Rq4YXS+xac1WFQmsLw/7/5+gnl0xUJ4PHyPQ6ACSu3g=; b=Ag1n0CW++GK0wsfHjlzTKXwjlH
 StX1TLT3dyQ0Yd4i/hDCwAMKaTLKzR/sWavcF6KKi3ryfVxZW7JU5AYSu6iuvcAwt8BvkfY10eV4I
 L+Boc9ypwyNXku7xxwpnR+VqhRk/pjQ4IREnvPc2wEKDWLqvnVlE5W5o//FhI2SLZjeU=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1unYzC-0004NU-U2 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 17 Aug 2025 08:43:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755420199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rq4YXS+xac1WFQmsLw/7/5+gnl0xUJ4PHyPQ6ACSu3g=;
 b=i62xuvbVht9ZUcM61b4B9N/Cle26+AIIPdULlfkloFJWn1qLmFWg68e75sWvHFvCzRMl6n
 zQ6imdpZvH5VdhqLyDvnELQRVzBfaPKLUgNECyDcb3t3FlDIJmgy7SQfn1R2CHVMAWOTiP
 QbAYWDOYeZEVKY3XrYmXkSglsaNOZ0U=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-b9KpmFJaPaGApWYOYIsZxQ-1; Sun, 17 Aug 2025 04:43:18 -0400
X-MC-Unique: b9KpmFJaPaGApWYOYIsZxQ-1
X-Mimecast-MFC-AGG-ID: b9KpmFJaPaGApWYOYIsZxQ_1755420197
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b4716fb2508so2591050a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 17 Aug 2025 01:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755420197; x=1756024997;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rq4YXS+xac1WFQmsLw/7/5+gnl0xUJ4PHyPQ6ACSu3g=;
 b=Jqigt4maR52ng8GXDHii8WsOv/l2EQCVrJkA7xBoUPtRICBdY5bo/eht386dpaW36s
 fQ593PvNv0ah2JGDPLE435dVpjMUMpulw++vsNFBaAbfWVjjteGcojglV8M9B09gG53k
 QKvtWHAF2wCRqSrGdU+Vydx1Un28lCfjG66ONT8CVMSzqM+IBBlb9Ehqkzp3RFlZ0Ned
 mfrJeQll9r7ROd4yatbbUb58nkq5Fi7RtFxxVFngqyUWNd/2mlVfVW09vc8xV+EHGT5K
 R/iYmRbpKaLd3+u6sWE8gSB0rrdANvzpGf2nBmPrGhRbOJLWhwAAz0veiDeiYBHcttje
 TFHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLmQQhw4EMcS36PoHA+TrlEbJz0tez/CinGbO1PNXpY2SwR7r0RNl63ZadQmukKaGIo3sIiZDD7hQcjHTV3m4q@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzNxeEifb/NFTd9tDjOiBW9FbIYmJn5JF+FF7+lX70x8ToZN22l
 B2cQ11F/22zwusv6c8W6UVIquFsaG/4Xl/jD97U3AaJG/PkFiKV83TPxJ9FcOFeWNse2SCcmsyZ
 jZdkyNFD4GAvo1uEgBIoOe39dlYmFitGgc4/HnzIykpKRt0e06KQ2Qo6LKExy8VBTKgrgHkDl10
 y8o7I=
X-Gm-Gg: ASbGnctTjjx/ODxyng7q3wRStOK8n3+ZIw377GRa7a/Vk6dFHUybAYo1Yxk6GKe/Emn
 Zl6/dxB9IFMqCcspHityhqn85dQqVeAs19PpI5O18tNPjeecC11hKZzfd6AiMFSlUv6Qv/QpiIE
 I6euDDvHGo7PmipjVvW7QrzMGy5Rw6ajr6J/A2QUl6Uj46D0urD1sOQe85OIEPic8u99HP/8//2
 rxIM1VIjAxuilV6W7CdJQu7kBkaAREMwnFY1XZQOhK/cJHaPsTfsEhgQ7EAeEJ8/TbAll7sER7X
 3IcAN+Ues/UScgXXuJ5g8r50duPHCfFpNBFQJ48RsnkX/IiUruVCh72n4lZB/UYrXDYcU4ghk9V
 3qy3g
X-Received: by 2002:a17:902:d2ce:b0:235:eb8d:7fff with SMTP id
 d9443c01a7336-2446d8b1f83mr105604735ad.28.1755420196958; 
 Sun, 17 Aug 2025 01:43:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeaLv3g8gcs36btGxPw09l7seNqjMeEa5e2kr7eFsSqwAraKtWBfVi3Ptpl9SpasTZy3uA9Q==
X-Received: by 2002:a17:902:d2ce:b0:235:eb8d:7fff with SMTP id
 d9443c01a7336-2446d8b1f83mr105604595ad.28.1755420196618; 
 Sun, 17 Aug 2025 01:43:16 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446d54fb54sm50570015ad.134.2025.08.17.01.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Aug 2025 01:43:16 -0700 (PDT)
Date: Sun, 17 Aug 2025 16:43:11 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20250817084311.txrzrcgqnm7g7spj@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250816072909.2844349-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250816072909.2844349-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YqQtQTd3bX9KRSUH84PFvDoULj2omBN8LtTYQH4xRBk_1755420197
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Aug 16, 2025 at 03:29:09PM +0800, Chao Yu wrote: >
 w/ below change [1], f2fs will enable lookup_mode=perf by default, it > will
 change f2fs dirent lookup method from linear based lookup to has [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1unYzC-0004NU-U2
Subject: Re: [f2fs-dev] [PATCH v2] f2fs/012: adapt lookup_mode=x mount option
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
From: Zorro Lang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zorro Lang <zlang@redhat.com>
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Aug 16, 2025 at 03:29:09PM +0800, Chao Yu wrote:
> w/ below change [1], f2fs will enable lookup_mode=perf by default, it
> will change f2fs dirent lookup method from linear based lookup to hash
> based lookup.
> 
> So that, f2fs will ignore sb.s_encoding_flags by default, which is not
> compatible w/ f2fs/012 testcase, in where it will control lookup method
> by configuring this flag w/ fsck.f2fs.
> 
> To avoid failure of f2fs/012, let's check whether f2fs has supported
> "lookup_mode=auto" mount option, mount w/ the option if it can,
> otherwise, don't.
> 
> [1] https://lore.kernel.org/linux-f2fs-devel/20250805065228.1473089-1-chullee@google.com
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Cc: Daniel Lee <chullee@google.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - ignore error from _try_scratch_mount "-o lookup_mode=auto"

This version looks good to me, thanks for fixing it.

Reviewed-by: Zorro Lang <zlang@redhat.com>

>  tests/f2fs/012 | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/f2fs/012 b/tests/f2fs/012
> index b3df9a8f..7438d9ce 100755
> --- a/tests/f2fs/012
> +++ b/tests/f2fs/012
> @@ -22,6 +22,15 @@ _require_scratch_nocheck
>  _require_command "$F2FS_IO_PROG" f2fs_io
>  _require_command "$F2FS_INJECT_PROG" inject.f2fs
>  
> +#check whether f2fs supports "lookup_mode=x" mount option
> +mntopt=""
> +_scratch_mkfs -O casefold -C utf8 >> $seqres.full
> +_try_scratch_mount "-o lookup_mode=auto" >> $seqres.full 2>&1
> +if [ $? == 0 ]; then
> +	mntopt="-o lookup_mode=auto"
> +	_scratch_unmount
> +fi
> +
>  check_lookup()
>  {
>  	local nolinear_lookup=$1
> @@ -30,7 +39,7 @@ check_lookup()
>  	local redheart=$dir/$'\u2764\ufe0f'
>  
>  	_scratch_mkfs -O casefold -C utf8 >> $seqres.full
> -	_scratch_mount
> +	_scratch_mount $mntopt
>  
>  	mkdir $dir
>  	$F2FS_IO_PROG setflags casefold $dir >> $seqres.full
> @@ -52,7 +61,7 @@ check_lookup()
>  
>  	$F2FS_INJECT_PROG --dent --mb d_hash --nid $ino --val 0x9a2ea068 $SCRATCH_DEV >> $seqres.full
>  
> -	_scratch_mount
> +	_scratch_mount $mntopt
>  	if [ $nolinear_lookup == "1" ]; then
>  		[ -f $redheart ] && _fail "red heart file should not exist"
>  	else
> -- 
> 2.49.0
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
