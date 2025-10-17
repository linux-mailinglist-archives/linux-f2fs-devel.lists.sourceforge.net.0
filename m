Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC96DBEA76F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Oct 2025 18:07:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSL4uhd7Z/zT3LEpnxFO9aWXFbBO4Ete+c5bLlNEFI8=; b=cFhJpRI+OAtZY1VKQlyfxNa8NN
	AodOyWWt4b+kckcwP25ov60ts5+h1t5a6EjlWvO/va4idC2fW/LanH3AHroqe31w6yhw2dwq0oLif
	hJjHv6cKMI7q9zHKfGcCEo6eXysGJyfZW4mwGXC28Ev+r4PQp2WMnFEPTlhNNDVS3hhk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v9myv-0002GO-Pz;
	Fri, 17 Oct 2025 16:07:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1v9myt-0002GI-Rr
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Oct 2025 16:07:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wsx3pbSsK+HcNrWvvqpREgf7UisqA0u83Z6j3J2/2fo=; b=Z7CkiqO9G63wWIa37Kq4BI0Mph
 XaXzE/UPdvjOrDgSZdVl4j9o/bsL7N36Dd0st/VtqWXjXHkvwOVdhYbWBuYFNFyosGFwHJl87m7OH
 NzpKoH1ok57q6oqcgdMoFklTpoRSRRCXP5Ulxk8DZiKyHIQ1+DqjVnyX31Y13P54JGL4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wsx3pbSsK+HcNrWvvqpREgf7UisqA0u83Z6j3J2/2fo=; b=Rf/zNJjsIfy8m0mkK69fwN27Fu
 yk+hpv8yOP9lQURAGOdZBwTifAChorf57sCaS4QEvIBAzaQQnh1D1yllKXjhtjWXBT70ib8EXnYh/
 giNCSzg1HnsiA1anqPPaheyhO68o50JVX/ZB5QvZ0InbUjKj9brgijWDsEja4GOz2beg=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v9myt-0000hb-Dk for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Oct 2025 16:07:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760717212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wsx3pbSsK+HcNrWvvqpREgf7UisqA0u83Z6j3J2/2fo=;
 b=hPl7UcB1T7FXPaLFhGcXgYQfUMbX0SMCJEG6bBni7rptr48LEc6VTlCD8cDA+yLLXUaY6v
 TpPH6Khru2+uBdINZpPuv2tow9maLkzWd8eIwrsii/y/rfG/wkSlWRoUeDGZlNbEap45mh
 gN+HItxEj2puqAukfIJmtvgEJyWP75Q=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-g_pvtMoTNm2_d0btQz1dxQ-1; Fri, 17 Oct 2025 12:06:51 -0400
X-MC-Unique: g_pvtMoTNm2_d0btQz1dxQ-1
X-Mimecast-MFC-AGG-ID: g_pvtMoTNm2_d0btQz1dxQ_1760717210
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-78104c8c8ddso1859166b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 17 Oct 2025 09:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760717210; x=1761322010;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wsx3pbSsK+HcNrWvvqpREgf7UisqA0u83Z6j3J2/2fo=;
 b=q0NYPpHowMvbANpS+De+EjIXj5gSN1wtqD7QoOwcgYpVmlRyZWBvyT6pATrTVNIXe6
 rL6Q3BcaPDGH6I6gYejBsezn5G9DIVoRnHvis/xLpuLqLmvhIGljTBWScWhlqD6+a/Za
 UoZZxAeuZDeeeVWrIoVsceivXA4ztRaXqspVsbA1R9mOB0p3Yw+CQVDPd1iAYb46TqWI
 UDodfRIaWVoHhJifH2Os9/UT7Zhhpiv27/AaQE3TVZlIjB1ZnePf/HvGZ6IycnlbKuxo
 ZhWhBbTm/fsh6vP9H4bpdkGgvnoOn27BRf5AVPG4A91UwlFi/GqvgkJW69y7Ns3dW6GB
 44YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXi9uQ2u4JE7+r3dIt/EsP7EjKmePwkt86Fxw5Tf8e1aOUhBY+DeDr/jBTQoNCFAHPd25wAlehbBrCq/OJldxGm@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz1fngesKXJzEHeZ4x2qunpcyi5yRW5isjIkpxw6IDLwJKzjf3l
 KLYnlhvlJauwjrh96kHD9LKcFDejWG70ywvGgYkANe5rzIqB7FiV77BqgSiZdNxeJPiHXXUqn2q
 4WUvrOdlcLMgQVDMZtJueRh8QTTzh4hDVALtSpxQAPfz+R58ly5yvKp/PFcizb2xdZdsilcNx5e
 NIP+o=
X-Gm-Gg: ASbGnctjP+DW5T7nDyXtp32GzgvUVPAI9abzEClSS1Upi9rzw54l36jQ623p3yIwhd+
 XJEXDYGvzUdN2py9ObNmY99xj0KMeUtJIfVsHK3E75BAATpzJupJGdzJAy2tBdxG05uTR1v6vnd
 W+iy1iQiNAiTnlWWJXwn17562xu41qDM+Zrw0RV6HmFnYt0kIepnxoa/emxauYhV6lciZrptAwO
 etj357gwxJS1wF/9YxOHXeshCa0ZNaE6atnt39AnkF7BqYICy6DFxLPSrGD5U0SXIOfU5XAvH+Y
 dv+Y6XQl35NbGAVhVNCTsGiXV2P9Itqmana4yimGeBW268gbmoGTpshMowzXq9+6tnpfkgVS1x0
 rv8LPuphVrYkkzB32BuhOXCSqCRoqydEXtWox7pQ=
X-Received: by 2002:a05:6a00:4288:b0:7a2:2100:1d4b with SMTP id
 d2e1a72fcca58-7a221001d8cmr5574784b3a.14.1760717208322; 
 Fri, 17 Oct 2025 09:06:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpQE+T4KzspXGTUsgyFZ0qbznilbaZBiVlGM3fc3NnYCVdgbimJgFPcqAumz//tVwiJ/2djw==
X-Received: by 2002:a05:6a00:4288:b0:7a2:2100:1d4b with SMTP id
 d2e1a72fcca58-7a221001d8cmr5574751b3a.14.1760717207862; 
 Fri, 17 Oct 2025 09:06:47 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992bb11ca0sm26297274b3a.32.2025.10.17.09.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 09:06:46 -0700 (PDT)
Date: Sat, 18 Oct 2025 00:06:42 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20251017160642.yre5hcy6ogogaeix@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20251009085043.16910-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251009085043.16910-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aDVVddbc8MzjZkfh16BslwU06y3MPNhuA9z7rs5PT0I_1760717210
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Oct 09, 2025 at 04:50:41PM +0800, Chao Yu wrote: >
 Let's source common/f2fs in _source_specific_fs() instead of in each >
 testcase.
 > > Cc: Jaegeuk Kim <jaegeuk@kernel.org> > Signed-off-by: Ch [...] 
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
X-Headers-End: 1v9myt-0000hb-Dk
Subject: Re: [f2fs-dev] [PATCH 1/3] common/config: source common/f2fs in
 _source_specific_fs()
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

On Thu, Oct 09, 2025 at 04:50:41PM +0800, Chao Yu wrote:
> Let's source common/f2fs in _source_specific_fs() instead of in each
> testcase.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---

Make sense to me, thanks for fixing it.

Reviewed-by: Zorro Lang <zlang@redhat.com>

>  common/config  | 1 +
>  tests/f2fs/002 | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/common/config b/common/config
> index 22b52432..1420e35d 100644
> --- a/common/config
> +++ b/common/config
> @@ -509,6 +509,7 @@ _source_specific_fs()
>  		;;
>  	f2fs)
>  		[ "$MKFS_F2FS_PROG" = "" ] && _fatal "mkfs.f2fs not found"
> +		. ./common/f2fs
>  		;;
>  	nfs)
>  		. ./common/nfs
> diff --git a/tests/f2fs/002 b/tests/f2fs/002
> index 74146217..d2f6e413 100755
> --- a/tests/f2fs/002
> +++ b/tests/f2fs/002
> @@ -43,7 +43,6 @@
>  _begin_fstest auto quick rw encrypt compress fiemap
>  
>  . ./common/filter
> -. ./common/f2fs
>  . ./common/encrypt
>  
>  # Prerequisites to create a file that is both encrypted and LZ4-compressed
> -- 
> 2.40.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
