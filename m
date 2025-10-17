Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FBDBEADE2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Oct 2025 18:50:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMhQ9LNblbShMIDzzIyHPp653DnV8DnNGgvcYLO2fEY=; b=DkIHu2V1mXfKi5FQnhFcTkzg4P
	qaYVNAXxDURS9KxAevTdPB1Tnur3133yIMDKXdxwUPk064HH2Uw2vsXuO/+wZAUxLM0qfzIUrf/mO
	IsvLAJxQEsJmYRLcTpu7gStR/TG1hWe72g/NnKS1YePJuJ81n4+0pVCpVe8L6Zn4AVO4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v9nf0-0001Yh-0n;
	Fri, 17 Oct 2025 16:50:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1v9ney-0001YQ-DE
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Oct 2025 16:50:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9pOpDwR+gViips/mmHk0RvKenHB3drdamk0Sjv95aFE=; b=UHXoSgUB29TTeaezcvgExA5xwf
 w2WFTgKAr2j0KHYI4rhhas+W56SpDwgPz5QMEoFayaAJXyG+XiTA9W2/CQSO6itjq7SdEYK0hiPLE
 RZtRbaIebjOWhzrdiDG+LFsRlks2zJibrwHru1Qaa6C9win1QKfuofKlWg+dKG8jkN+4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9pOpDwR+gViips/mmHk0RvKenHB3drdamk0Sjv95aFE=; b=G+c2OZPqURLcOUoJUj9LkG+1OH
 fuzgtdRuCgF/hFzPCtbDpZNpdGJv/NOR4HmaNGUmjwcNn8CSrggg6qNiAQLbqt5fF+n5RYgIFLE6a
 95CAzFQMY2Phk4hzVynw3nftcCnJedfbu9W4gEcHifRqFrzetsSZAELLAHHFSUCsd06Q=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v9ney-0002os-A4 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Oct 2025 16:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760719820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9pOpDwR+gViips/mmHk0RvKenHB3drdamk0Sjv95aFE=;
 b=QxjWKDoR1RdIxVFVMTWgmpMIwqTwHLwdRqRvudHAcjnUMPcxVS0pV0RmZr/0a5f+fq2Ggh
 YYdVxtE1RfMH6gf5eo6Hzp6598TvkWJF+iz92doJ/R9Lw0j65MGnr0bfvf3ICUd1PvYhR4
 b1DRnFvEI4udgR6WTL3lBt5UbPSlPR8=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-dI1enqVMOqKVyAj9QjiQCw-1; Fri, 17 Oct 2025 12:50:19 -0400
X-MC-Unique: dI1enqVMOqKVyAj9QjiQCw-1
X-Mimecast-MFC-AGG-ID: dI1enqVMOqKVyAj9QjiQCw_1760719818
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-290c2d13a01so14214235ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 17 Oct 2025 09:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760719817; x=1761324617;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9pOpDwR+gViips/mmHk0RvKenHB3drdamk0Sjv95aFE=;
 b=G0vD1l1MY8e47AUr5ScpJfVV+A66kCOQhWhEWEPQj63MO6J7oQV++eCdeYUgN9Ka5T
 cWgwO/8zSB4ZoK5hn29PviPVxsd2Zopt5TVpWBPwN+l8yvGCVMI0pL0ZkCKd1ws3dK7h
 fbPpHGomXgaSFsrKUmIintRNngzakthHI9TCHhojZeEuFKc3NAWNY5JaZU6zibljgkBF
 U86VfWN73XrqOBxkoks0lDZY0lZSX5voCimRcBABOO0wX4iCyYhlIg+iH1DV+5lpt0lk
 wies2ihEsmcYrHOnRJBulsA2O2+HKd/2VD4ajyu3+TfuzXW5cXWasmEtVPEfmwUx3GS2
 +ryQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtwUeODFN4iQGfjIe0P1RMnGLjJaRuMmoX8EX5NINn/0d5lSfYg2y571uVCx469U5MofjmWKqXa+73XbIDlR0i@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxpL46ej0bL2FYp3FCMVN+yuS8yY+RhtEIniyP/j49f3YgyYzBl
 Fo2vLl2pcpxdiCmBhxuDZYP4KxpwQajeWPmp3ixc2VOV6h39ojgAKDj38p487TIag7g3bkwgUQF
 WqFbHpPjT/y7EMLCWjitOR9Ikoi9AmNuJbFCqBI90kIl+gtSDa+lW1ep3KOJb5teo2EVBGZV17a
 +wEVptY0gepsk=
X-Gm-Gg: ASbGncu+pHwBJSdHu8NoJ7HNl/SKCFJX/ixGRj9auuKPw9V3TmoYQMSzyZetD50w239
 dVpuxGMVbSo2rraWWbI6n9DTqyj6zZoXmv8R7y4XM7gBf+zo/sgYhRbKKxDBiFg3z/Dyx8wr+S2
 hldokHZFZ9x0udo5rkwEyBaQSmYwTzMiS3//JhovyHCqezwg6FcipyZgqCvJD27vg8R+Lh6ifZb
 xPPsHsuKamWsbJAX3t6tJ4OnDybXVFjMMIY/pG72t87G6vk7vI3AwAK6y1Ow6JtLK9b1paECqa1
 NRs8mEqzjjK1s/RU2y786yISAF4SYLQ/95ySj6kdU0UmOAKo3/u3hYs77rZ3wmYm//0vv6Je5Q8
 6psV8gLsx0kBtFuObhJcajaBHgOiA5tzChR+t2+c=
X-Received: by 2002:a17:903:3205:b0:267:8b4f:df36 with SMTP id
 d9443c01a7336-29091be7fb3mr106109805ad.29.1760719817240; 
 Fri, 17 Oct 2025 09:50:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5QIga8v7Pg0TkjxYA3oXvINdMbOC55XbYEc/ZbkLjHxG2FwEQDQdwNjh5O2otKPBCKRJL+A==
X-Received: by 2002:a17:903:3205:b0:267:8b4f:df36 with SMTP id
 d9443c01a7336-29091be7fb3mr106109465ad.29.1760719816600; 
 Fri, 17 Oct 2025 09:50:16 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b6a7664ab4dsm260719a12.1.2025.10.17.09.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 09:50:16 -0700 (PDT)
Date: Sat, 18 Oct 2025 00:50:11 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20251017165011.roxu42xkz7zrk6ou@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20251009085043.16910-1-chao@kernel.org>
 <20251009085043.16910-3-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251009085043.16910-3-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9B6XhpowYWpJRvEHUlvIsK7RFtoYKPtBZbVDwDxqk9M_1760719818
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Oct 09, 2025 at 04:50:43PM +0800, Chao Yu wrote: >
 Introduce _require_inject_f2fs_command() to check whether inject.f2fs >
 supports
 specific metaarea and member parameters. > > Meanwhile, let' [...] 
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
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v9ney-0002os-A4
Subject: Re: [f2fs-dev] [PATCH 3/3] common/f2fs: introduce
 _require_inject_f2fs_command()
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

On Thu, Oct 09, 2025 at 04:50:43PM +0800, Chao Yu wrote:
> Introduce _require_inject_f2fs_command() to check whether inject.f2fs
> supports specific metaarea and member parameters.
> 
> Meanwhile, let's check inject.f2fs requirement inside
> _require_inject_f2fs_command() for cleanup.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---

Thanks, this version is good to me,

Reviewed-by: Zorro Lang <zlang@redhat.com>

>  common/f2fs    | 27 +++++++++++++++++++++++++++
>  tests/f2fs/009 |  2 +-
>  tests/f2fs/012 |  2 +-
>  tests/f2fs/019 |  2 +-
>  tests/f2fs/020 |  2 +-
>  tests/f2fs/022 |  2 +-
>  6 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/common/f2fs b/common/f2fs
> index 4d0d688b..82d3102e 100644
> --- a/common/f2fs
> +++ b/common/f2fs
> @@ -69,3 +69,30 @@ _check_f2fs_filesystem()
>  
>      return 0
>  }
> +
> +# check that inject.f2fs supports to inject specific field in specific meta area
> +_require_inject_f2fs_command()
> +{
> +	_require_command "$F2FS_INJECT_PROG" inject.f2fs
> +
> +	if [ $# -ne 2 ]; then
> +		echo "Usage: _require_inject_f2fs_command metaarea member" 1>&2
> +		_exit 1
> +	fi
> +	metaarea=$1
> +	member=$2
> +
> +	case $metaarea in
> +	sb|cp|nat|sit)
> +		val=0
> +		;;
> +	ssa|node|dent)
> +		;;
> +	*)
> +		_notrun "unsupport metaarea: $metaarea"
> +		;;
> +	esac
> +
> +	$F2FS_INJECT_PROG "--$metaarea" "$val" "-h" | grep "$member:" > /dev/null || \
> +		_notrun "--$metaarea --mb $member support is missing"
> +}
> diff --git a/tests/f2fs/009 b/tests/f2fs/009
> index 7333d484..4c179f2d 100755
> --- a/tests/f2fs/009
> +++ b/tests/f2fs/009
> @@ -12,7 +12,7 @@
>  _begin_fstest auto quick
>  
>  _require_scratch
> -_require_command "$F2FS_INJECT_PROG" inject.f2fs
> +_require_inject_f2fs_command node i_links
>  _require_command "$(type -P socket)" socket
>  
>  _fixed_by_git_commit f2fs-tools 958cd6e \
> diff --git a/tests/f2fs/012 b/tests/f2fs/012
> index 7438d9ce..53d54bf6 100755
> --- a/tests/f2fs/012
> +++ b/tests/f2fs/012
> @@ -20,7 +20,7 @@ _fixed_by_kernel_commit 91b587ba79e1 \
>  export LC_ALL=C.UTF-8
>  _require_scratch_nocheck
>  _require_command "$F2FS_IO_PROG" f2fs_io
> -_require_command "$F2FS_INJECT_PROG" inject.f2fs
> +_require_inject_f2fs_command dent d_hash
>  
>  #check whether f2fs supports "lookup_mode=x" mount option
>  mntopt=""
> diff --git a/tests/f2fs/019 b/tests/f2fs/019
> index 2307bd96..a6e6e38c 100755
> --- a/tests/f2fs/019
> +++ b/tests/f2fs/019
> @@ -18,7 +18,7 @@ _fixed_by_kernel_commit 77de19b6867f \
>  	"f2fs: fix to avoid out-of-boundary access in dnode page"
>  
>  _require_scratch_nocheck
> -_require_command "$F2FS_INJECT_PROG" inject.f2fs
> +_require_inject_f2fs_command node addr
>  
>  # remove all mkfs options to avoid layout change of on-disk inode
>  export MKFS_OPTIONS=""
> diff --git a/tests/f2fs/020 b/tests/f2fs/020
> index 38bc6582..a6933134 100755
> --- a/tests/f2fs/020
> +++ b/tests/f2fs/020
> @@ -20,7 +20,7 @@ _fixed_by_kernel_commit 061cf3a84bde \
>  	"f2fs: fix to do sanity check on ino and xnid"
>  
>  _require_scratch_nocheck
> -_require_command "$F2FS_INJECT_PROG" inject.f2fs
> +_require_inject_f2fs_command node i_xattr_nid
>  _require_attrs user
>  
>  # remove all mkfs options to avoid layout change of on-disk inode
> diff --git a/tests/f2fs/022 b/tests/f2fs/022
> index ed3b4f2b..48a8386b 100755
> --- a/tests/f2fs/022
> +++ b/tests/f2fs/022
> @@ -19,7 +19,7 @@ _fixed_by_kernel_commit xxxxxxxxxxxx \
>  	"f2fs: fix to do sanity check on node footer for non inode dnode"
>  
>  _require_scratch_nocheck
> -_require_command "$F2FS_INJECT_PROG" inject.f2fs
> +_require_inject_f2fs_command node i_nid
>  
>  # remove all mkfs options to avoid layout change of on-disk inode
>  export MKFS_OPTIONS=""
> -- 
> 2.40.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
