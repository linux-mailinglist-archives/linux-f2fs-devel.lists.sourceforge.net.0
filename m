Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFB8C27CDD
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 01 Nov 2025 12:41:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQ9Zz8vsPpitujtqsY9Q6SUc59qLzXTx2HIijEOdZgE=; b=GVK/hve8YIvjZsxWbJL+cnEkJD
	9VQA2mIpCLyHxaLQo3NgKMxeZOgHUveSMiZxzgjnJl76qmyC0To9xQi9S0hO7mFKNRwvrEY63DM8N
	u5Tapec+n/Zr14M8Vu0/L3P115UTj8vlO9jQw9Cqhvapu3QwOYOTPVliMGx5+jwEE/iE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vF9yX-0004y7-3Q;
	Sat, 01 Nov 2025 11:40:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1vF9yV-0004xu-B1
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Nov 2025 11:40:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gRPzHhBnGQKZg8AlnPA2nk5Y2FBH4BbPy+XMSkasbro=; b=KktM4EzvgBWeVGIytXuvXG9q/p
 rcf6WxXNc2Pd/0fM40/BImS9V7w0thQ01rskhFxkYSX+ygbjKjYYEkQE8A93sCun3LuTeOxTl91c6
 o8R8u1P96t9hTFkwUaeYzgIjUX0UWWX0t3uM36zDeuPjRPruwsJ0qVyR0q5v81NKdhWI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gRPzHhBnGQKZg8AlnPA2nk5Y2FBH4BbPy+XMSkasbro=; b=WM+lxHd4x0mp9Q2rENpU3ErXlZ
 eFopwMmKjBmFvoj98IfSljTunoh9s3thrNzex+NoJ2PqDsj4f4HZqgqOuHMUxbh459Lt2Y0aplUi3
 XskHRVWC7m0F8Qsb2Tex14szSuh0wN+vqg4tBmfej0fpIkACYNSrJsFL5+0P8O2aV7zk=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vF9yV-0005eO-MK for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Nov 2025 11:40:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761997245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gRPzHhBnGQKZg8AlnPA2nk5Y2FBH4BbPy+XMSkasbro=;
 b=A0zR/nWrmDqe/ddDseg1wC9E9BcKlu2DUvfs+VtZjXhbG8b0NJL50XUbyLCEVe67rqnQN3
 8aVBWZGeR6l2tVN3Jgz+Z1mkwvHHidAmlR7RzUNBxmDV+yFRDtnbHlnlwm61HC9nlzR0Rl
 Wdu92++L0CW2L99rd2KOLBrfFlHCfEI=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-6Do72c3AMtmc2nIDBeYANA-1; Sat, 01 Nov 2025 07:40:42 -0400
X-MC-Unique: 6Do72c3AMtmc2nIDBeYANA-1
X-Mimecast-MFC-AGG-ID: 6Do72c3AMtmc2nIDBeYANA_1761997242
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-340bc4ef67fso810698a91.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 01 Nov 2025 04:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761997242; x=1762602042;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gRPzHhBnGQKZg8AlnPA2nk5Y2FBH4BbPy+XMSkasbro=;
 b=Ztt87iB/OUPZHSqRU/e622xG0Wg9juGzFa891iosE2MX4Hwze9V8mrQlZZQGg8GWvP
 9o4XE6xCgMXp125Dz6HHA/aMCQdKVfvEiVqR2MirTsh8puPEnwKs5VvZnOnhWuDBIctf
 ZXiNA7uEFP0nFVQ0Q5ZgVmV3zRdz8G2o/6+IEJPc7xShqlo6/QCTkSyZSNnWTXGFAA+g
 /q/LasaWW+4BwZVs+uWgvNhPFVootakxZ49r1W+L+umAha2UWZNhRrRDDRxe73KOctAB
 moOCGeP/aW3sQrcq+80fX8uzYmgHFRCHh5wlQUw+MxaNmQttN4R9e09GTL4ZqKdFq8DB
 Co0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUyeXRFZzdgTCFyfWWU9Tx/m1UuclGsJbD2KZoe/6lT/Ail2gaZuxP+af9aIVUJb+Lq1VvBkpmg2Fj2UExdVBT@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyaDaLe4GOudmHSx9t5msJXAcCUbvMg+EUStR4Z5zhssu6O2ATF
 bPWms/3y4pqStYD4nxNLGOI2s/qMWptrMJVT2MPLjGl/QcILYyFnNtQCy9ikh4NQ9v1u9h+I378
 5YmEbGxFvuJMRcyHxN0IswtoP3wMFSDTheVqpUUgXO/c4zCmWwc0EPx7gKojsP3Zce+adhhlttM
 ld5LE=
X-Gm-Gg: ASbGncsntyEyBuKFHfP2XQiJUA6I76i/CLxqyMfezzLAts6ECsLJ+0YDiF5woleO/G/
 VP+ICRFx2QCy58SVagv6TsWIjbVj+vlpTa5zLBaYUgsBfgMzTuMkPOmfYjenyDVrFD9qSFmdMFB
 5QA4xCEwBt5xdlMlAFD6jVchLMX1futIcgd09B9qH264PDp0rHyn/bNu6xEW0Tc4SRiB3eCtMab
 W3SJMJnRVyYSKdvK87Ey4vs/bOjyMvULqIVgskpkZ77VSS16vs3HFiW+35y9/iVjwqqxac6AF+I
 x2uUEYTjThLMt3C5vthVDwnch3vLulmAgz2nPbkdap+ZLMinQTzRqERom3av+iWUmlI3ok/cFrW
 1kBrbbN5cz1+l+ovy0ZNdVajqd0c770wMK0n0MAQ=
X-Received: by 2002:a17:90b:17c2:b0:32b:a2b9:b200 with SMTP id
 98e67ed59e1d1-34082fdaa04mr7826976a91.13.1761997241724; 
 Sat, 01 Nov 2025 04:40:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGqKIGEb6+Us34rq8MtYPffmKqhLlbsN8qhKbPlV8qfPWJA9jiCJfThCl3/qBYWgtcgB4n4A==
X-Received: by 2002:a17:90b:17c2:b0:32b:a2b9:b200 with SMTP id
 98e67ed59e1d1-34082fdaa04mr7826963a91.13.1761997241239; 
 Sat, 01 Nov 2025 04:40:41 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b93bf265180sm4910840a12.33.2025.11.01.04.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Nov 2025 04:40:40 -0700 (PDT)
Date: Sat, 1 Nov 2025 19:40:35 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20251101114035.zk6vy5z7mrxmtnys@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20251020023108.327728-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251020023108.327728-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FxT9NidG1ZCugX0_mEN5heplX6--TR2FOj-Wjy5bC18_1761997242
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Oct 20, 2025 at 10:31:07AM +0800, Chao Yu wrote: >
 The bugs related to f2fs/02[1-2] regression testcases have been fixed > by
 below commits: > > - 930a9a6ee8e7 ("f2fs: fix to avoid NULL pointe [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vF9yV-0005eO-MK
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: add commit id to
 _fixed_by_kernel_commit for f2fs/02[1-2]
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

On Mon, Oct 20, 2025 at 10:31:07AM +0800, Chao Yu wrote:
> The bugs related to f2fs/02[1-2] regression testcases have been fixed
> by below commits:
> 
> - 930a9a6ee8e7 ("f2fs: fix to avoid NULL pointer dereference in
> f2fs_check_quota_consistency()")
> 
> - c18ecd99e0c7 ("f2fs: fix to do sanity check on node footer for non
> inode dnode")
> 
> Let's add commit id to _fixed_by_kernel_commit in f2fs/02[1-2].
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---

Good to me,

Reviewed-by: Zorro Lang <zlang@redhat.com>

>  tests/f2fs/021 | 2 +-
>  tests/f2fs/022 | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/f2fs/021 b/tests/f2fs/021
> index 96fc97c4..0cacb138 100755
> --- a/tests/f2fs/021
> +++ b/tests/f2fs/021
> @@ -10,7 +10,7 @@
>  . ./common/preamble
>  _begin_fstest auto quick mount quota remount
>  
> -_fixed_by_kernel_commit xxxxxxxxxxxx \
> +_fixed_by_kernel_commit 930a9a6ee8e7 \
>  	"f2fs: fix to avoid NULL pointer dereference in f2fs_check_quota_consistency()"
>  
>  _require_scratch
> diff --git a/tests/f2fs/022 b/tests/f2fs/022
> index 48a8386b..f6d77c96 100755
> --- a/tests/f2fs/022
> +++ b/tests/f2fs/022
> @@ -15,7 +15,7 @@ _begin_fstest auto quick rw
>  
>  . ./common/attr
>  
> -_fixed_by_kernel_commit xxxxxxxxxxxx \
> +_fixed_by_kernel_commit c18ecd99e0c7 \
>  	"f2fs: fix to do sanity check on node footer for non inode dnode"
>  
>  _require_scratch_nocheck
> -- 
> 2.49.0
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
