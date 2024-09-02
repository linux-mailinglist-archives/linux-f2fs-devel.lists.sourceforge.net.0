Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9025C968EB2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Sep 2024 22:06:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slDJC-0004aa-E5;
	Mon, 02 Sep 2024 20:05:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1slDJB-0004aN-Ci
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Sep 2024 20:05:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zdnZZn8OmtVGHQANRCcG3h4gbTYm46JDAbnL9tQ6Las=; b=GaQJvkqSnWiVQi6amOmPuUTDS0
 /HpYE4r9+03Rjpix6HK9mcLuZ6rXT2BQ1MVTmGqRbaDCAndKL2nHRTpyAcDuduNdRgzwzt6zAMQdu
 pY6ixw8hFwVt93ShABxsrpNaSYe8xL6tnmYqsdIK6zOOIQ2K7zrob23zMEwSQwmXe+lE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zdnZZn8OmtVGHQANRCcG3h4gbTYm46JDAbnL9tQ6Las=; b=P6nHs6twDcBbCvFeqmLohsiNeC
 5UTwp3N5lA43Ewkx2J5OSrCVsZsn83wOBuU29KzKJ4RR8z4vkI1iTjWeW7V+eSO3QQwqYzOGvXNaN
 tQ3tGXdjTzOp2BTbNb5hAtIcSe9Yd0Np6TdM+t3r038xXDbUpQb2JVe4sYjx1SfnMyxk=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slDJA-0001sQ-9j for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Sep 2024 20:05:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725307541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zdnZZn8OmtVGHQANRCcG3h4gbTYm46JDAbnL9tQ6Las=;
 b=h9otyIsIs9yldB+rQ66lK7Pdvc/CQJs3rGu9SBhIyW36YAD7+f+CWpLlCb03dd5QU7mgxu
 UOXZM/kgQpjzRqSRiBBQ6prRMJY7rfkcEmDOJuoAE5r4Thpvs7UiBqyINc8sIhYkncf3nf
 6VQ8+NNiAf/62dMaBhgrEZKC5SzEKrc=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-XUiKyZfSNGi2XsiIrIZgMg-1; Mon, 02 Sep 2024 16:05:37 -0400
X-MC-Unique: XUiKyZfSNGi2XsiIrIZgMg-1
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-7cf58491fe9so2858655a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 02 Sep 2024 13:05:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725307536; x=1725912336;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zdnZZn8OmtVGHQANRCcG3h4gbTYm46JDAbnL9tQ6Las=;
 b=iHKAD11n+/9jGB6iuNkjOvBQW3p923+3PImwv4sN8836VV+e02GevC0hywiaqwxMdl
 +0v65q2K6sNSHighEvKq9iPe9JLMy+Eb8X6uWP7kA5NRUWyAacdIhDUT2G6p2aPYCqCM
 a5+tU8KChqB3C2dMIcDcPjsTy0xnNt9ndj8VPpB9SoQBzL8HUjHEHA1x1aE/Oxn0mgGd
 cnzeSofLK3ZvyJO7XyLrqiEoIVk0moGoT0c0h5LWyypYAafL5RQV3XyKjU6to51ScbwJ
 w86INK8yLOzKqy5KAWFUcLEi7jiolDinBNXXaHDPLJAAI9eDlv8XmAdTpRvnO6bi1Wku
 A2zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXirNzLfw6MrGauqcPWQHNmdzm6FlqgPa7D+l3DtO1/8mRGb3CODmIdX7kJ7H9rxL7OKOxVp9rAlVSmXQj5Q3BG@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy51qqdUOtPI/aIeQjAAv4GEpCAJavv8izuA9iBsvettJNt+M5V
 2Q91nM0+E6/q0sEPF8zSvI+RAP4TXRzg0h4eamX0KXe0zqB2I6PIwEyzEVISGIYjvMDlieF1LPY
 MsYQBsTWq36Tk5rU3KAL2a/fMU2SYVE0zDzhxjreDZzo3YTaRxZawr/FQWEGQiBdVZiQUJdoCn+
 JRtYlH95fWVA==
X-Received: by 2002:a17:902:da8b:b0:1fc:6b8b:4918 with SMTP id
 d9443c01a7336-2054c249eabmr89623535ad.41.1725307536727; 
 Mon, 02 Sep 2024 13:05:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE1hwuCAytS5BkE/btE6UQBX3WApVBDL8QAA3lb/hVqCTsBdHjaKLFxbNMFNQWDrw6xuaEGQ==
X-Received: by 2002:a17:902:da8b:b0:1fc:6b8b:4918 with SMTP id
 d9443c01a7336-2054c249eabmr89623105ad.41.1725307536106; 
 Mon, 02 Sep 2024 13:05:36 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20563c5707csm26212485ad.139.2024.09.02.13.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 13:05:35 -0700 (PDT)
Date: Tue, 3 Sep 2024 04:05:31 +0800
From: Zorro Lang <zlang@redhat.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <20240902200531.p2ulurifnyy7g4y7@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20240902101844.4042983-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240902101844.4042983-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Sep 02, 2024 at 06:18:44PM +0800, Chao Yu wrote: >
 The bug related to this regression testcase has been fixed by commit >
 b40a2b003709
 ("f2fs: use meta inode for GC of atomic file"), let's > a [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1slDJA-0001sQ-9j
Subject: Re: [f2fs-dev] [PATCH] f2fs/003: add missing
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

On Mon, Sep 02, 2024 at 06:18:44PM +0800, Chao Yu wrote:
> The bug related to this regression testcase has been fixed by commit
> b40a2b003709 ("f2fs: use meta inode for GC of atomic file"), let's
> add missing _fixed_by_kernel_commit line for this testcase.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Cc: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---

Thanks for the update.

Reviewed-by: Zorro Lang <zlang@redhat.com>

>  tests/f2fs/003 | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/f2fs/003 b/tests/f2fs/003
> index 62821ed7..fbb08a3e 100755
> --- a/tests/f2fs/003
> +++ b/tests/f2fs/003
> @@ -25,6 +25,9 @@ _cleanup()
>  	rm -r -f $tmp.*
>  }
>  
> +_fixed_by_kernel_commit b40a2b003709 \
> +	"f2fs: use meta inode for GC of atomic file"
> +
>  _require_scratch
>  _require_xfs_io_command "fpunch"
>  
> -- 
> 2.40.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
