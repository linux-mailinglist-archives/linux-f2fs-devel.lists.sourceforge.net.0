Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D2ABAF3B4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 01 Oct 2025 08:25:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJFj5FHIrWrw0m9QrAqltj3Tc034oH2dk1dolfKBckI=; b=mbtWPnHXg3w1cbEeRmHKmHCdiP
	72EDgdJAEr1d2+geIy1HBCcHczsInzQL1UJz2zXl5QcZaEBnE8yC+yfMlJRZsxyVWpXvi/VRNV67J
	eQSajjNypMnzax3o25m376lBp810/0drbj5pwdRZlyx69PaKOS3OZdF9XJPeY3ApuujU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3qGo-00074o-7e;
	Wed, 01 Oct 2025 06:24:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@redhat.com>) id 1v3qGm-00074h-7e
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Oct 2025 06:24:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A+0i3l0iDuYL4y4gHFhoKOCgirARm5a/sSYRjGIchxs=; b=AaVz7cUp5ZoY0ckUWz4SMRZjJo
 Zy/0OcDb5eejcNBN2THuqc0SHHEIyBQqwmxiNUyxkDgpUT/vwcm0IgevhouP+WRmr9LJVz0qExaC0
 fjsxYMkJG03CyQvqv7NNFgzPGYzjFh+9T6soLRWeF9HVMyEUifqeo7pFnRkagehYvkmM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A+0i3l0iDuYL4y4gHFhoKOCgirARm5a/sSYRjGIchxs=; b=Aj7e4E2G4W09r4+R3QW1aQAfNF
 UxkTpYzw64jUxtYY9M3kSmB7wVE6maE8S8T2/5Qgyjdc+GVJslMaC/Tlff9xugEAlzFEu6jwAyT9+
 pMmSfkHK2Fm2QN+/m9xromA2UXWuj/l2dSjS6BvWJoMs5m/3EqaHtkuNmkv1dD3DqgRA=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v3qGl-0006ki-Jo for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Oct 2025 06:24:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759299889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A+0i3l0iDuYL4y4gHFhoKOCgirARm5a/sSYRjGIchxs=;
 b=CfHbaQTr1RR9gMM2lFG9BpCMZmiR9gvp8G8I/neo8vh8l9y3t1sopsMJwJG8mR30SADmnW
 lZ0zm6AV6k9zUg3sK6GnqauCOMNibNrhOm68v/NQPZKz1qDeGMPgyfTgYX/WKOKq0FbmRQ
 ERV4/JaO3xd0PwpMimAIt428fYbxBqw=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-MYwf-FXrMSOmsc52ME08Xw-1; Wed, 01 Oct 2025 02:24:48 -0400
X-MC-Unique: MYwf-FXrMSOmsc52ME08Xw-1
X-Mimecast-MFC-AGG-ID: MYwf-FXrMSOmsc52ME08Xw_1759299887
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7821487d16bso7894194b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Sep 2025 23:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759299887; x=1759904687;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A+0i3l0iDuYL4y4gHFhoKOCgirARm5a/sSYRjGIchxs=;
 b=tY1i5RteGUJraHjfr0Ep2yxWq+rZ6TqIoR2AUE4GhjakP0CIGy3X+ofAsDKcb333KK
 B0nTgsjd0paNjBBz0Ew8Gkut9gUG0RIhlk29QGuVvPGsa+cfO15DNtIOsJSQS6/Lvhki
 w/eS7RZvLc0qQpSksRCrjAiScN6c+C2+vfFMzN/RFWdH25ynA9rVPhqUJa0lFpHxRgy0
 QqM3Fd2DcLvR2480E9/bTYZ7Bmc4eUpXm+ZcJUVDAFtOMtXe4p1tqRN0GNLFVEUymgJv
 7EeYXsYCbGzxpRTVTwRhOUEp5uDVfKGAK0ixSyeRoSk6HAXJ/5xA87aDZGPeOS86jdKD
 YqeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp7uEgEx7AdrGhkVBeF9glfZ1QdPT/YD7nO/stXD+s/MYux3okdSlih3uX6sgs9Y9FjjucI7qjQGATXtGqN7xO@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx0itMmd00HtYgJbwuhzNsLE556shk4JmFRYQPQNeZJzGzw1V4P
 XQlt9iHjL/Yvkj06WE6Qsv70LsOF7bd6ypCQC7ms3NM7wt6m9LkjO9CwwMbMGR1qghs8kWfxPGM
 qYYtHS3RirYQDgDsmXLg7bvrCoq07BTjInwq2d9mDiuEopkA2shQiZJ0T1LvpEg/s/InM86BC12
 odc/4=
X-Gm-Gg: ASbGncthEvj+zvMD6fjO8b5xqXlMJ679SDt5jesAedMfixsqIEshgy7kTyi66phNux7
 CGOsiY0zCGkxetY/n+88sZoKAnr/XEYEW0yyfzxP0JeGFRkeG0wpVPvyECM5TBozmuiDZ5dbAru
 BJ7RFh55o/Y0O8ZV7We9fGNem4qlqpRxmuKPX3VAigt3oXl2awBK4H1mecGPiVqs5+4Xe+oa3za
 PiMSehhw4shQxqZP+iCQy/iA7bHyXSQ0SNniSsslHx6ko8qFTVeWJA+I+2HuEGgw8zbou0z2/1D
 240tPPCUREarThlPMf9FwrK7cxDbeZGM1FjJnU04cja6r67t+ScuH/av16nsUTmw1iy+7jOK220
 AOBaCg+U1qA==
X-Received: by 2002:a05:6a00:3d4b:b0:781:2177:1c9b with SMTP id
 d2e1a72fcca58-78af4160670mr2964932b3a.17.1759299886920; 
 Tue, 30 Sep 2025 23:24:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/f+ttRWlC8JRPXV++DICR2wJGnZzlG+koVtdjKREiAEJg2hgZ8DtqqRlJ3eaT4Ep40zg/Dg==
X-Received: by 2002:a05:6a00:3d4b:b0:781:2177:1c9b with SMTP id
 d2e1a72fcca58-78af4160670mr2964896b3a.17.1759299886360; 
 Tue, 30 Sep 2025 23:24:46 -0700 (PDT)
Received: from dell-per750-06-vm-08.rhts.eng.pek2.redhat.com ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7810238cdd1sm15241810b3a.3.2025.09.30.23.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 23:24:45 -0700 (PDT)
Date: Wed, 1 Oct 2025 14:24:41 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <20251001062441.cjh2wd7uleduehey@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
References: <20250928185240.57862-1-chao@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250928185240.57862-1-chao@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uxnKoCvxua-1qCpI6wGrhHUFpgplYlwwC1N0JkeGs24_1759299887
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Sep 29, 2025 at 02:52:40AM +0800, Chao Yu wrote: >
 Introduce _require_inject_f2fs_command() to check whether inject.f2fs >
 supports
 specific metaarea and member parameters. > > Cc: Jaegeuk Kim [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v3qGl-0006ki-Jo
Subject: Re: [f2fs-dev] [PATCH] common/f2fs: introduce
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

On Mon, Sep 29, 2025 at 02:52:40AM +0800, Chao Yu wrote:
> Introduce _require_inject_f2fs_command() to check whether inject.f2fs
> supports specific metaarea and member parameters.
> 
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  common/f2fs    | 25 +++++++++++++++++++++++++
>  tests/f2fs/009 |  2 ++
>  tests/f2fs/012 |  2 ++
>  tests/f2fs/019 |  2 ++
>  tests/f2fs/020 |  2 ++
>  tests/f2fs/022 |  2 ++
>  6 files changed, 35 insertions(+)
> 
> diff --git a/common/f2fs b/common/f2fs

You remind me that there's a common/f2fs file, you can move f2fs specific
functions to common/f2fs (e.g. _check_f2fs_filesystem) later :)

> index 1b39d8ce..4b01e032 100644
> --- a/common/f2fs
> +++ b/common/f2fs
> @@ -25,3 +25,28 @@ _require_scratch_f2fs_compression()
>  		_scratch_unmount
>  	fi
>  }
> +
> +# check that inject.f2fs supports to inject specific field in specific meta area
> +_require_inject_f2fs_command()
> +{
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
> index 7333d484..465be874 100755
> --- a/tests/f2fs/009
> +++ b/tests/f2fs/009
> @@ -9,10 +9,12 @@
>  # and expects fsck.f2fs can detect such corruption and do the repair.
>  #
>  . ./common/preamble
> +. ./common/f2fs

The common/f2fs can be imported by common/config:_source_specific_fs()
automatically, so we don't need this line at here.

(Same below)

>  _begin_fstest auto quick
>  
>  _require_scratch
>  _require_command "$F2FS_INJECT_PROG" inject.f2fs
> +_require_inject_f2fs_command node i_links

If the "_require_command $F2FS_INJECT_PROG inject.f2fs" is always required
before _require_inject_f2fs_command, how about call it at the beginning
of _require_inject_f2fs_command ?

(same below)

Thanks,
Zorro

>  _require_command "$(type -P socket)" socket
>  
>  _fixed_by_git_commit f2fs-tools 958cd6e \
> diff --git a/tests/f2fs/012 b/tests/f2fs/012
> index 7438d9ce..8e156772 100755
> --- a/tests/f2fs/012
> +++ b/tests/f2fs/012
> @@ -12,6 +12,7 @@
>  # 4.enable linear lookup, expect lookup succeed
>  #
>  . ./common/preamble
> +. ./common/f2fs
>  _begin_fstest auto quick casefold
>  
>  _fixed_by_kernel_commit 91b587ba79e1 \
> @@ -21,6 +22,7 @@ export LC_ALL=C.UTF-8
>  _require_scratch_nocheck
>  _require_command "$F2FS_IO_PROG" f2fs_io
>  _require_command "$F2FS_INJECT_PROG" inject.f2fs
> +_require_inject_f2fs_command dent d_hash
>  
>  #check whether f2fs supports "lookup_mode=x" mount option
>  mntopt=""
> diff --git a/tests/f2fs/019 b/tests/f2fs/019
> index 2307bd96..f6bb0b52 100755
> --- a/tests/f2fs/019
> +++ b/tests/f2fs/019
> @@ -12,6 +12,7 @@
>  #    corruption in the file
>  #
>  . ./common/preamble
> +. ./common/f2fs
>  _begin_fstest auto quick rw
>  
>  _fixed_by_kernel_commit 77de19b6867f \
> @@ -19,6 +20,7 @@ _fixed_by_kernel_commit 77de19b6867f \
>  
>  _require_scratch_nocheck
>  _require_command "$F2FS_INJECT_PROG" inject.f2fs
> +_require_inject_f2fs_command node addr
>  
>  # remove all mkfs options to avoid layout change of on-disk inode
>  export MKFS_OPTIONS=""
> diff --git a/tests/f2fs/020 b/tests/f2fs/020
> index 38bc6582..332848d0 100755
> --- a/tests/f2fs/020
> +++ b/tests/f2fs/020
> @@ -12,6 +12,7 @@
>  #    corruption in the file
>  #
>  . ./common/preamble
> +. ./common/f2fs
>  _begin_fstest auto quick rw
>  
>  . ./common/attr
> @@ -21,6 +22,7 @@ _fixed_by_kernel_commit 061cf3a84bde \
>  
>  _require_scratch_nocheck
>  _require_command "$F2FS_INJECT_PROG" inject.f2fs
> +_require_inject_f2fs_command node i_xattr_nid
>  _require_attrs user
>  
>  # remove all mkfs options to avoid layout change of on-disk inode
> diff --git a/tests/f2fs/022 b/tests/f2fs/022
> index ed3b4f2b..f81180e8 100755
> --- a/tests/f2fs/022
> +++ b/tests/f2fs/022
> @@ -11,6 +11,7 @@
>  # 4. fpunch in foo w/ specified range
>  #
>  . ./common/preamble
> +. ./common/f2fs
>  _begin_fstest auto quick rw
>  
>  . ./common/attr
> @@ -20,6 +21,7 @@ _fixed_by_kernel_commit xxxxxxxxxxxx \
>  
>  _require_scratch_nocheck
>  _require_command "$F2FS_INJECT_PROG" inject.f2fs
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
