Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9159AF8B8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Oct 2024 06:02:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t4BWw-0001Rg-JC;
	Fri, 25 Oct 2024 04:02:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1t4BWu-0001Ra-Kg
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 04:02:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FHQVs/xjpuXyoCEGljLr+hwlf/k6mw4k4tJGGtnlURw=; b=Qtm3hGY7VwZIzg7kP9UQKehzln
 b8YZTxv916P2PJFguvzF2kojbPbIAGozxnYRrce0huABQqwWv8KihmCDZid9w8M/ERJiyXvFUC8AW
 HhtaZiX1sNY55vxNUx5naKqHjTJoMlodPBgLAH2f6xnPB8NnFHyTq6+KcS7vaIVDj5do=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FHQVs/xjpuXyoCEGljLr+hwlf/k6mw4k4tJGGtnlURw=; b=C/3MwcTltLl4dIiJdu0tbBbou2
 QZ5evI7dnrdR+i7jv7DBKb9/2jaBTCvNuFYQajvjCvAxcW3paC/Crv/7/DInN48rgDzrr9IexA6/h
 Z934d7BrjzMmRELDL5KvVlz0c2aKTLApjAdfLutOrHgtYvNYN0kA/ZbTC4DA8kugIMt0=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t4BWt-0002Qo-9M for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Oct 2024 04:02:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729828941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FHQVs/xjpuXyoCEGljLr+hwlf/k6mw4k4tJGGtnlURw=;
 b=X0vOjJuUlVVt6W5TSkp+lUOMyvEKN53i9V9TSlXw86DSloCNcrlBQWgCY4Kz3kGg9zqad6
 jz7eqYM4lm7bKtTI6Vf1wekytZfW0mHBstQeDyLLNUMo621UtqW1DPdMH2C4CVPcUE/3qZ
 iBbhl5YX0OTrvPVXNNqGLAz0P7ozLIg=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-SW-sFJsbO7OAr0eBSRbiJA-1; Fri, 25 Oct 2024 00:02:19 -0400
X-MC-Unique: SW-sFJsbO7OAr0eBSRbiJA-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-20ca1692cb7so17053045ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Oct 2024 21:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729828938; x=1730433738;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FHQVs/xjpuXyoCEGljLr+hwlf/k6mw4k4tJGGtnlURw=;
 b=wAMaWcsR0+I5+aVJxFGdVicuAInA5jSe+nBHBOO3Q9jiSIkeYHa5Uxt+1jcYgCAoGL
 yfyaHrVqOFxV1mKyoPfDTYzzX5pRHHNSRAU50vPGouAPrmQisP53ERFY64DceMHH9JHQ
 yh73cDkx9Z3Kl/uBAC+f6Gg7PrAHxJPfyYyjL3D2OsCse2To/+q7uvfDc3dUTCw1OiGF
 3x5N/es1Q9Y2RDzhe1phv0DfPsTy+ml2pWEDRrJ/P0ff30zagVB1goxVTb1BlokStXRt
 PMtU+sofvKFtXP3JilqXQderKox+7qkqGCAMG4qMTezbEeLdAUHN1rCzDpkoegs0ZKEc
 /qpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFRrv/KaBmsYPjNHRq7FcDSybwkfSF23vMNMnsfyuoHUTp2chCamgP4S92NJAu0yc9oL94aInMMvsgVnfq6hca@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxCM36crLQ2LXPiVNZeY1CqZnwgHitV4PWHQSMqYXNAn/lqpeFg
 nGjyFOR8u6RFhGjArM46M9Wamuc26wRD1gZYIZXqsZXEOl3TBQJH2xJd1w3e35r4Y2MwHJR1upq
 KTuD/eXWltwYudlYDu2wL5Sr0+9kge0LI52y1yWkNraX/JGxOcPcwyamsCb30X0DswITjCyU8UA
 Hocy4kKURJ9Q==
X-Received: by 2002:a17:903:22c1:b0:20b:920e:8fd3 with SMTP id
 d9443c01a7336-20fa9e9ae97mr113660715ad.35.1729828937974; 
 Thu, 24 Oct 2024 21:02:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8xAUx67xoCM2Ay2c5aVQ1YjGOROU3Bjt+t0ZV9mja9aLgaL5EB65gkb5GqNaMvUX5anNfXQ==
X-Received: by 2002:a17:903:22c1:b0:20b:920e:8fd3 with SMTP id
 d9443c01a7336-20fa9e9ae97mr113660605ad.35.1729828937661; 
 Thu, 24 Oct 2024 21:02:17 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bc0864d7sm1829005ad.303.2024.10.24.21.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 21:02:17 -0700 (PDT)
Date: Fri, 25 Oct 2024 12:02:13 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20241025040213.k77l4lticz5bafiq@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20241012011419.4066147-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241012011419.4066147-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Oct 12, 2024 at 09:14:19AM +0800, Chao Yu wrote: >
 The bug related to this regression testcase has been fixed by commit >
 b2c160f4f3cf
 ("f2fs: atomic: fix to forbid dio in atomic_file"), let's [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 -1.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t4BWt-0002Qo-9M
Subject: Re: [f2fs-dev] [PATCH] f2fs/004: add missing
 _fixed_by_kernel_commit line
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>,
 fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Oct 12, 2024 at 09:14:19AM +0800, Chao Yu wrote:
> The bug related to this regression testcase has been fixed by commit
> b2c160f4f3cf ("f2fs: atomic: fix to forbid dio in atomic_file"), let's
> add missing _fixed_by_kernel_commit line for this testcase.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Cc: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  tests/f2fs/004 | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/f2fs/004 b/tests/f2fs/004
> index dd1ed5c1..e08cee11 100755
> --- a/tests/f2fs/004
> +++ b/tests/f2fs/004
> @@ -25,6 +25,9 @@ _cleanup()
>  	rm -r -f $tmp.*
>  }
>  
> +_fixed_by_kernel_commit b2c160f4f3cf \
> +	"f2fs: atomic: fix to forbid dio in atomic_file"

Reviewed-by: Zorro Lang <zlang@redhat.com>

> +
>  _require_scratch
>  _require_odirect
>  _scratch_mkfs >> $seqres.full
> -- 
> 2.40.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
