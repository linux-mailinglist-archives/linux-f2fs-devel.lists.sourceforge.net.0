Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3389BD72F8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Oct 2019 12:16:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iKJsC-00007z-Rf; Tue, 15 Oct 2019 10:16:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iKJsB-00007R-7S
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Oct 2019 10:16:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:To:References:CC:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aRAU3Mh+NyIe7t1CCz3rPQYPA43BeJR2uaR3LbC64U8=; b=m/2KpZn4zilbL5P6V8NNHLv/mw
 VlRHQ+82RbtPoTfFGWMhkVOLCitGp02C8fPfpIrbKjIH3ahN4Fxv4wWVs9ZvGfHcJn3iLJPJtLS9+
 3lGFMUNu+w8I0H2fad6pf2Vwwz+r6vI/MH41Cf2kDTvoiA0PfieN1RdmIcUsSt5qPHow=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:To:References:CC:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aRAU3Mh+NyIe7t1CCz3rPQYPA43BeJR2uaR3LbC64U8=; b=Td7X8nr8KkgBqm0Zn7QoZDycqc
 OOu68OuFywJlz7Nor7mYJ+hmnEBIqQjbem23CtTaq6YmLFimwrtsJlDrguhFofPB7jBBnmuv4Rtdk
 sJjudhBhaBd0LYcyWytGZao5YIM5GXq/4bTrhSjc8WG54QiTEiA19P2dWc9+M7A50LhA=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iKJs9-009yiR-KO
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Oct 2019 10:16:11 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 91664438C1179D91CE27;
 Tue, 15 Oct 2019 18:16:02 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 15 Oct
 2019 18:15:58 +0800
References: <20191015100938.123519-1-yuchao0@huawei.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <22384b38-7334-ec2c-0bfc-5af14436b374@huawei.com>
Date: Tue, 15 Oct 2019 18:15:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191015100938.123519-1-yuchao0@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iKJs9-009yiR-KO
Subject: Re: [f2fs-dev] [PATCH v2 1/2] common/defrag: support f2fs
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
Cc: guaneryu@gmail.com, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jaegeuk, do you have time to check these two patches which are trying to adjust
defrag/casefold testcase for f2fs?

On 2019/10/15 18:09, Chao Yu wrote:
> F2FS supports defragment based on file granularity, adjust test suit
> to support f2fs.
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
> v2:
> - use local variable in function
>  common/config |  2 ++
>  common/defrag | 11 ++++++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/common/config b/common/config
> index a0d58bde..22592cec 100644
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
> @@ -242,6 +243,7 @@ case "$HOSTOS" in
>  	export MKFS_BTRFS_PROG=$(set_mkfs_prog_path_with_opts btrfs)
>  	export MKFS_F2FS_PROG=$(set_mkfs_prog_path_with_opts f2fs)
>  	export DUMP_F2FS_PROG=$(type -P dump.f2fs)
> +	export F2FS_IO_PROG=$(type -P f2fs_io)
>  	export BTRFS_UTIL_PROG=$(type -P btrfs)
>  	export BTRFS_SHOW_SUPER_PROG=$(type -P btrfs-show-super)
>  	export BTRFS_CONVERT_PROG=$(type -P btrfs-convert)
> diff --git a/common/defrag b/common/defrag
> index 2bd739c0..1381a4dd 100644
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
> +		local filesize=`ls -l $1 | $AWK_PROG '{print $5}'`
> +		$DEFRAG_PROG 0 $filesize $1 >> $seqres.full 2>&1
> +	else
> +		$DEFRAG_PROG -v $1 >> $seqres.full 2>&1
> +	fi
>  
>  	_scratch_cycle_mount
>  	STAT_AFTER=`stat -c "a: %x m: %y c: %z" $1`
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
