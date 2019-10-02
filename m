Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33451C86D5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Oct 2019 13:00:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iFcMg-0003pp-Aa; Wed, 02 Oct 2019 11:00:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <guaneryu@gmail.com>) id 1iFcMe-0003pi-Po
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Oct 2019 11:00:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UK3UHjVhJ3ZMTKZOjwjI/XlXGTSgE7uJiyeJAVBdmFs=; b=M3HOE8F6ZRfpTJxxmC/NvylOMh
 FIQi0VhJwWqTCOxND8vDoiuRIwMB+WSXtt1FNjtzMnWk2KNovYPen7Bc8a8GNFFvxYo0kcC+fxqnk
 B1jFqdhCECm3pLW79YOag+VTgMgPImVwOAvNfoT0Msm+PUjcULHzFQRxpM+isakLpiWA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UK3UHjVhJ3ZMTKZOjwjI/XlXGTSgE7uJiyeJAVBdmFs=; b=IRu80h9FUYVzT8nd4wLAqwSFBT
 ks9A/erUTvXqIHaD4R9QTAnttpTzd0l9NbiKrrAaPx/hrh5whgR8hEVjAFbJ9aAC6GjCNj/rERCVF
 fZczlN4LHek1Si5zjV4mrXUuQv9bYcYYSmZehoGFJ0pfdRtBcje9mglEACmDCLuwdnNY=;
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iFcMc-001VHW-P8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Oct 2019 11:00:12 +0000
Received: by mail-pf1-f193.google.com with SMTP id y72so10120734pfb.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 02 Oct 2019 04:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UK3UHjVhJ3ZMTKZOjwjI/XlXGTSgE7uJiyeJAVBdmFs=;
 b=ESJgFTdzV63JDofuBJMEoGr4SgbobyFCryO8qVvFv4Q9HKZBgQ/Q38kBYy1u80+ezT
 9Ds9oqzY4q4Ihet2GyjcSbifQ33M/Rr8GDolIBeTam/yFXcwK89tcvk8Dv7e69BLtFIH
 FrA0sjiKTNY1ioNvwfwUN8KfhHjMntN7CPWNdXtMEf2pBKQ2ox2h5XCDFEyQIEZyFrZu
 MR9anR/5QjwlsR6/ZTIHXd87P579jL8p5h2M3d1GAZvaS3MRmMqetPjMHz+z7OC/YpSH
 mOY9RafiDFz8U4+oFxXdyM+6PBUWCLIYK9nQgqRFVWTocwi7ahaqprBXrzS2IG43Llj8
 ivCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UK3UHjVhJ3ZMTKZOjwjI/XlXGTSgE7uJiyeJAVBdmFs=;
 b=FgPzirOMOCr4VnGZsuORbGC1RtJdEYkYfRc+Dz+/8XPCpMxSOee99JwtQqRWEM7bB7
 9cbxdjLGcdj5EQKxaCNm8tczNvHIgL6rJt6RODnSN6zYO071faWog4ls5rDvLTui+bty
 AZDa2RGGd6xZv5+7Z+zyQvSGc+JvCHqK1EGZON99YRkCTIveXqegeMKGIfApK9U09MRp
 OhIQ77qkpXApA+Q6OZLBESFCWGHoyei2x9x3QdoJzHrtOLawn21C1s8/NaP/zL8m8Kqf
 lBDeUEXrNBs2xbeNRLSGdrCTPLYNOmWVlhZ5GIFpXd4jGnK98bJH5ucdhoSQTSgkgKnT
 iwjg==
X-Gm-Message-State: APjAAAU7zBWRIPwydokgUy9nz7XjVnrFOkdTwJoIXXVnFUcV+qGNqliK
 TllGAd7cyc4bxq1dLJfGE4o=
X-Google-Smtp-Source: APXvYqxMzXMpvvvlopGLf8ICyvVbJ56L6uHQCD9IJROitX7OIo+ljxSoc8ry3SgnpxKV5JPT+zAlSA==
X-Received: by 2002:a62:5a85:: with SMTP id o127mr4078154pfb.212.1570014005072; 
 Wed, 02 Oct 2019 04:00:05 -0700 (PDT)
Received: from localhost ([178.128.102.47])
 by smtp.gmail.com with ESMTPSA id r28sm22102381pfg.62.2019.10.02.04.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 04:00:04 -0700 (PDT)
Date: Wed, 2 Oct 2019 18:59:59 +0800
From: Eryu Guan <guaneryu@gmail.com>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20191002105956.GZ2622@desktop>
References: <20190927100627.9086-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190927100627.9086-1-yuchao0@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (guaneryu[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iFcMc-001VHW-P8
Subject: Re: [f2fs-dev] [PATCH 1/2] common/defrag: support f2fs
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
Cc: fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Sep 27, 2019 at 06:06:26PM +0800, Chao Yu wrote:
> F2FS supports defragment based on file granularity, adjust test suit
> to support f2fs.
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  common/config |  2 ++
>  common/defrag | 11 ++++++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/common/config b/common/config
> index 4c86a492..c43be339 100644
> --- a/common/config
> +++ b/common/config
> @@ -176,6 +176,7 @@ export XFS_COPY_PROG="$(type -P xfs_copy)"
>  export FSTRIM_PROG="$(type -P fstrim)"
>  export DUMPE2FS_PROG="$(type -P dumpe2fs)"
>  export RESIZE2FS_PROG="$(type -P resize2fs)"
> +export F2FS_IO_PROG="$(type -P f2fs_io)"
>  export FIO_PROG="$(type -P fio)"
>  export FILEFRAG_PROG="$(type -P filefrag)"
>  export E4DEFRAG_PROG="$(type -P e4defrag)"
> @@ -240,6 +241,7 @@ case "$HOSTOS" in
>  	export MKFS_BTRFS_PROG=$(set_mkfs_prog_path_with_opts btrfs)
>  	export MKFS_F2FS_PROG=$(set_mkfs_prog_path_with_opts f2fs)
>  	export DUMP_F2FS_PROG=$(type -P dump.f2fs)
> +	export F2FS_IO_PROG=$(type -P f2fs_io)
>  	export BTRFS_UTIL_PROG=$(type -P btrfs)
>  	export BTRFS_SHOW_SUPER_PROG=$(type -P btrfs-show-super)
>  	export BTRFS_CONVERT_PROG=$(type -P btrfs-convert)
> diff --git a/common/defrag b/common/defrag
> index 2bd739c0..9866d3da 100644
> --- a/common/defrag
> +++ b/common/defrag
> @@ -27,6 +27,9 @@ _require_defrag()
>  	rm -f $testfile $donorfile 2>&1 > /dev/null
>  	DEFRAG_PROG="$E4DEFRAG_PROG"
>  	;;
> +    f2fs)
> +	DEFRAG_PROG="$F2FS_IO_PROG defrag_file"
> +	;;
>      btrfs)
>  	DEFRAG_PROG="$BTRFS_UTIL_PROG filesystem defragment"
>  	;;
> @@ -140,7 +143,13 @@ _defrag()
>  
>  	[ ! -z $csum ] && CSUM_BEFORE=`md5sum $1`
>  	STAT_BEFORE=`stat -c "a: %x m: %y c: %z" $1`
> -	$DEFRAG_PROG -v $1 >> $seqres.full 2>&1
> +
> +	if [ $FSTYP == "f2fs" ]; then
> +		_filesize=`ls -l $1 | $AWK_PROG '{print $5}'`

Better to declare "filesize" as a local variable here.

		local filesize=`stat -c %s $1`

Otherwise looks fine to me.

But it'd be better to let other f2fs developers review this patchset as
well.

Thanks,
Eryu

> +		$DEFRAG_PROG 0 $_filesize $1 >> $seqres.full 2>&1
> +	else
> +		$DEFRAG_PROG -v $1 >> $seqres.full 2>&1
> +	fi
>  
>  	_scratch_cycle_mount
>  	STAT_AFTER=`stat -c "a: %x m: %y c: %z" $1`
> -- 
> 2.18.0.rc1
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
