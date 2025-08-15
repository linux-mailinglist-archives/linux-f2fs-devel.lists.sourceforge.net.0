Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E65F8B28373
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Aug 2025 18:01:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5Z9HR/MyVdqudxQkGH/ZF0Ag4DojN8i1GbjYlD3v7I=; b=jyX93PqCLjilUkvl2eLfI1hD+G
	hKsMripDtAQXH3H1rnD8sdJcP27WMm8CXp2JD0LsKx30ToiH+FTKI9rRL8kJi/WVs1GxgDulXW0Ui
	apuLlVtpf2ZY/hAZhRLprrZ1U+MjjZ5AlPH9D9yBdB4GjyhzNouySbruUkKeaJTnTYKE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umws5-0000BE-PR;
	Fri, 15 Aug 2025 16:01:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1umws3-0000B8-FJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 16:01:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t7zIJViFMTGRPSXqeocdaNgcPuKIfHn7AqwZgs3KNqw=; b=LDzIKqnLfXfDoogJzDduI3Em0W
 Bu11PeEZKtOtZHj2DM08l/AM/Ie8+fKvQe5e9O5dAlnV4Q3LVbHakmimNyb89NVeIOJooOoK+/fFi
 09gSLZAdhsc290gAJCLLTPlQwRsfVhGdVNc8I2DJgyjjNkuDFQFjDOJj6JaSfoUC/XiA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t7zIJViFMTGRPSXqeocdaNgcPuKIfHn7AqwZgs3KNqw=; b=DiPhFLXwjNESC154AyZev/wnjb
 Vv+2BAdj3Gz5AbmXrQ3VJTOhS1bWi4KL+BdEbCMDN5lFIyO9v1QPf6iy5/78rqCyxHXPogN/BPvNx
 bN57S9I25VyrQYTWRa2ifvR+Sd/n3DH4rLjKFpttzJsmb7Yp4RTOkspwt3IjoZTzarFQ=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umws1-0007TW-H7 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 16:01:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755273687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t7zIJViFMTGRPSXqeocdaNgcPuKIfHn7AqwZgs3KNqw=;
 b=S8S8g5Juzlf8uYkjh1BS+VH4L5ZMyM/8FDWqD6fJefI/5rxjhI41I1MlG5MB8kKjsespZm
 Sal1feRN4j30D5IMJGXjEPNacGqXG8EIcpYJ+bbweqRhsBnhdsVGoUX/Mx6jDVhm5ti3Og
 sjafnaN7eMNUtyEYYDrpklZv2gd+KO4=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-K_WhLfAmNvKwKasjKedXzg-1; Fri, 15 Aug 2025 12:01:25 -0400
X-MC-Unique: K_WhLfAmNvKwKasjKedXzg-1
X-Mimecast-MFC-AGG-ID: K_WhLfAmNvKwKasjKedXzg_1755273684
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b47174b2582so3192657a12.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 Aug 2025 09:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755273684; x=1755878484;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t7zIJViFMTGRPSXqeocdaNgcPuKIfHn7AqwZgs3KNqw=;
 b=VwM64zhaP8z5sN21AqBM/4Emyoc3k7o7TmJDjJBu7egV4zsYgIqss0XJXShaxwpjii
 VE32GLGc480t+4Wh7AL9Ltr9EAKYBwIB9G1Y1OfvLaYsAosLr+4kvvKmnNzS4+DXM50j
 xzMes9K7HzPH0NRUFDfRJ1q4/Avc5I+XVJHDcLn7NivugfMtSxjrVspJN7C0yQqQYnG9
 owPtmy3puYIuYHNMmBtr6Fhp1HjuFXxp+QRHZjKspFgUOi8zRWa40PpywAzOBTN+OyAD
 iTHY9xccVXwNBVXzNYCcvE2QF6PxKZfLZ823K5ZDxWEBB8MyAEhTFXe0TnHB7PSZV3r+
 wUFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9/rmHUdcwnb6m7E8O6P1WJT+u4OSd5aM8oeBX2LpbBTv2eGNa4BAd+FtDK6idRIyCIEu9xa6P0vucmXRIvsCd@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy5rXMFzm8fpuS1mjTzBQQAVZBWhGpdT0dSr+Szuvk6b+O7QAWF
 I5SDraT/xO4N5LyVgNqMy4Z+UgsijZtmJ4W0nuNIbU2i+PAtdhL9TUDhAsPUSvHTInYr/6MK3BR
 sW5DoujWRJw/EMQhEXWWDMw6q88Dio41UMnJh3zLWyOxm9NKbfwQRoL+8Ii7xYj0Q/SHcNEAGp/
 hVaGk=
X-Gm-Gg: ASbGncuOPDQJktict68zk2FCDf5H/rtD5ic0Zi49qCMQVmXMNHWau0r0JvubOZ8ZXUp
 86f6my3urb+0vU8ZeMciiBJ19UmwdsSL/kwiAmKVQpLg8wNo/VcJRMrQ4mRa7L2dVfuhqNA79Qt
 h9C/kgyoAkUjUAaPmBeb4rmtNqINzc0uLoqOAVnYv8U7+dWsVNgY2H/tpQ7QKenIryUITBx80Ua
 LbVkXUs4g7azyH4rqqgr9OYMrAZVRmufgLWgUcoiGegvxoZySHOvTgi1AnfZNIQW2Pv4WJukvav
 Q98AIYu/PSOo2jsiHyV/FPXZ0SynL8p4PFRZHv6qStmuIQEYo35xlrbbNzSQWdSZP4T7TgWrfkr
 7TMND
X-Received: by 2002:a05:6a20:258d:b0:1f5:9024:3254 with SMTP id
 adf61e73a8af0-240d2d7d6f3mr4811308637.6.1755273684077; 
 Fri, 15 Aug 2025 09:01:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgMp3e1XTigPaS6kNWf5YAQFA3G8AVx4PdH4JCXzN4E1mdijRlost0gaz+hwyPzL6CfnTXaw==
X-Received: by 2002:a05:6a20:258d:b0:1f5:9024:3254 with SMTP id
 adf61e73a8af0-240d2d7d6f3mr4811223637.6.1755273683475; 
 Fri, 15 Aug 2025 09:01:23 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e4556670csm1404704b3a.79.2025.08.15.09.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 09:01:23 -0700 (PDT)
Date: Sat, 16 Aug 2025 00:01:18 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20250815160118.ht3ymxihqqr2rhk2@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250804114016.2734919-1-chao@kernel.org>
 <20250804114016.2734919-2-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250804114016.2734919-2-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UFtFA1g4nlsW6aXw_rY0OnzzvKBa3Oi8iDCoXL1aE4A_1755273684
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 04, 2025 at 07:40:15PM +0800, Chao Yu wrote: >
 As f2fs changes to use new mount APIs, let's add a new testcase > to check
 mount result for all f2fs supported special mount options > and th [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1umws1-0007TW-H7
Subject: Re: [f2fs-dev] [PATCH v3 2/3] f2fs/016: test special mount options
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

On Mon, Aug 04, 2025 at 07:40:15PM +0800, Chao Yu wrote:
> As f2fs changes to use new mount APIs, let's add a new testcase
> to check mount result for all f2fs supported special mount options
> and their combinations, in order to detect any inconsistency during
> mount.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---

This version is good to me,

Reviewed-by: Zorro Lang <zlang@redhat.com>

>  tests/f2fs/016     | 50 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/f2fs/016.out | 33 ++++++++++++++++++++++++++++++
>  2 files changed, 83 insertions(+)
>  create mode 100755 tests/f2fs/016
>  create mode 100644 tests/f2fs/016.out
> 
> diff --git a/tests/f2fs/016 b/tests/f2fs/016
> new file mode 100755
> index 00000000..800f75fc
> --- /dev/null
> +++ b/tests/f2fs/016
> @@ -0,0 +1,50 @@
> +#! /bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
> +#
> +# FS QA Test No. f2fs/016
> +#
> +# This testcase tries to check stability of mount result
> +# w/ f2fs special mount options and their combination.
> +#
> +. ./common/preamble
> +_begin_fstest auto quick mount
> +_require_kernel_config CONFIG_F2FS_FS_COMPRESSION
> +_require_kernel_config CONFIG_F2FS_FS_LZO
> +_require_kernel_config CONFIG_F2FS_FS_LZORLE
> +_require_kernel_config CONFIG_F2FS_FS_LZ4
> +_require_kernel_config CONFIG_F2FS_FS_LZ4HC
> +_require_kernel_config CONFIG_F2FS_FS_ZSTD
> +
> +options=(
> +#	mount_option			mkfs_option
> +	"inline_xattr_size=400"		"extra_attr,flexible_inline_xattr"\
> +	"compress_algorithm=lzo"	"extra_attr,compression"	\
> +	"compress_algorithm=lz4"	"extra_attr,compression"	\
> +	"compress_algorithm=zstd"	"extra_attr,compression"	\
> +	"compress_algorithm=lzo-rle"	"extra_attr,compression"	\
> +	"compress_algorithm=lz4:3"	"extra_attr,compression"	\
> +	"compress_algorithm=zstd:1"	"extra_attr,compression"	\
> +	"compress_log_size=8"		"extra_attr,compression"	\
> +	"compress_extension=so"		"extra_attr,compression"	\
> +	"nocompress_extension=so"	"extra_attr,compression"	\
> +	"nocompress_extension=*"	"extra_attr,compression"	\
> +	"compress_extension=so,nocompress_extension=so"			\
> +					"extra_attr,compression"	\
> +	"compress_chksum"		"extra_attr,compression"	\
> +	"compress_mode=fs"		"extra_attr,compression"	\
> +	"compress_mode=user"		"extra_attr,compression"	\
> +	"compress_cache"		"extra_attr,compression"	\
> +)
> +
> +for ((i=0;i<${#options[@]};i=i+2))
> +do
> +	echo "Option#$i: ${options[$i]} : ${options[$((i+1))]}"
> +	_scratch_mkfs "-O ${options[$((i+1))]}" >> $seqres.full || _fail "mkfs failed"
> +	_try_scratch_mount "-o ${options[$i]}" >> $seqres.full 2>&1
> +	echo $?
> +	_scratch_unmount >> $seqres.full 2>&1
> +done
> +
> +status=0
> +exit
> diff --git a/tests/f2fs/016.out b/tests/f2fs/016.out
> new file mode 100644
> index 00000000..a8c96972
> --- /dev/null
> +++ b/tests/f2fs/016.out
> @@ -0,0 +1,33 @@
> +QA output created by 016
> +Option#0: inline_xattr_size=400 : extra_attr,flexible_inline_xattr
> +0
> +Option#2: compress_algorithm=lzo : extra_attr,compression
> +0
> +Option#4: compress_algorithm=lz4 : extra_attr,compression
> +0
> +Option#6: compress_algorithm=zstd : extra_attr,compression
> +0
> +Option#8: compress_algorithm=lzo-rle : extra_attr,compression
> +0
> +Option#10: compress_algorithm=lz4:3 : extra_attr,compression
> +0
> +Option#12: compress_algorithm=zstd:1 : extra_attr,compression
> +0
> +Option#14: compress_log_size=8 : extra_attr,compression
> +0
> +Option#16: compress_extension=so : extra_attr,compression
> +0
> +Option#18: nocompress_extension=so : extra_attr,compression
> +0
> +Option#20: nocompress_extension=* : extra_attr,compression
> +32
> +Option#22: compress_extension=so,nocompress_extension=so : extra_attr,compression
> +32
> +Option#24: compress_chksum : extra_attr,compression
> +0
> +Option#26: compress_mode=fs : extra_attr,compression
> +0
> +Option#28: compress_mode=user : extra_attr,compression
> +0
> +Option#30: compress_cache : extra_attr,compression
> +0
> -- 
> 2.49.0
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
