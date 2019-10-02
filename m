Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D33EC86E1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Oct 2019 13:02:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iFcOg-0003vc-Ie; Wed, 02 Oct 2019 11:02:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <guaneryu@gmail.com>) id 1iFcOf-0003vQ-8M
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Oct 2019 11:02:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j6o4yPi8TFZlClyYCLPHHBwXitDVfUmizCEZ+a1ceTo=; b=cSMcHLTGBci/S05kFhLmquP0D4
 20/RSAT3ycdzoGHukqWD9WTcaagyxFpBm0i4L4AhHFG8WmOs3YYoUYalfB1FkP2EJp3y5uruY4L84
 +LxTQmCY203SKNfgLQxMYSUoWmhxLXMdl5ZXQq0eorCUA+64iy0eeThPKtnbe5kT7YP4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j6o4yPi8TFZlClyYCLPHHBwXitDVfUmizCEZ+a1ceTo=; b=YVKjCelOZVtNrn1hw1ds/2P7SE
 YUH5Nm0YsjSr9ffT2qFZXr3PbFhENJt6+sp8dfWAVR7o5Bp7tR3KfUDtHheWzdDtgacAR5keaPonO
 TWKHWqI614pP+YQ0hMauviFuPIWZDixYh52odrkfqBrJlcY9MrJbS6QzDKN/G/xyo+pc=;
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iFcOd-00ENS1-6k
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Oct 2019 11:02:17 +0000
Received: by mail-pg1-f196.google.com with SMTP id q7so11629717pgi.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 02 Oct 2019 04:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=j6o4yPi8TFZlClyYCLPHHBwXitDVfUmizCEZ+a1ceTo=;
 b=itG7mWnbepx82cVwNHzqDoi5psu+n6GHUlPPhkhAmRBGVzTxA6oHSF/KuvHFDdWeK3
 eu2ydoFAJFozQlWgUNpmC31IRr/N81vvfRuLzoAuKNjbGZbVToGs/e0ynVL8GONTv06u
 6utHXsnIeg8OfRM+VZNuw786KGkHX2YbjJiQPMcYi8o4g4J4h3xTAqtqQwdFJHMgnleA
 +IM7IvEdaeZyarI9b/5sowyEJlt1yG+eBQVontAK8hb4vteEVBMLgP/U/d4rWlPD42uF
 WPBcf4mylQuwtz2LyiR5cOH4v5qBoOS611PN1OpzYbednrngbJWvN3DLxXh/agSzMeGD
 QxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=j6o4yPi8TFZlClyYCLPHHBwXitDVfUmizCEZ+a1ceTo=;
 b=QBeCVXsEg4uCSlf9pb/qE40n9u5OdkJpG6szClFM2VL8215gSYecaJkcedPdf0dBEt
 jfJ+RACuMSGYg2a5gWP+4TkSj/ncQ1B13WM3BrdMzB8B9Pci38ji2YnWYxFJpKPXKvco
 E8V2KQLIgNfoxPHbgDHlaVHwkfGQJRLFfT1/4SbYX4Gof8YYgHgrHxFd2AOvpbxZsfj2
 fgmIyy5BQ/TAs5GiTuFavscbM4DuN8usivlHfwTZT8oBuIhsQBOhf2D50dkA/vqrdIxu
 NnNW2RZMOAyEJq97AeaC40Z0qaVWa5bXzXS0fErKiQZcNydrR0XeIyBaNWIlmq00+X9+
 Irvg==
X-Gm-Message-State: APjAAAVNLD43eHKkiaSGdWVD06UmI7/PqwpTR8ifhOTF/mFCLRS+9Kg+
 jHgQpAMIPBZ495I2iafU/rA=
X-Google-Smtp-Source: APXvYqyiNBAGa4Ary9vzGlmDT2vxi02JK7mrDeXly6cLc3pyIaMAybPINpr95R1gM7FQsk+eONZo3Q==
X-Received: by 2002:a63:1f23:: with SMTP id f35mr2926384pgf.298.1570014129301; 
 Wed, 02 Oct 2019 04:02:09 -0700 (PDT)
Received: from localhost ([178.128.102.47])
 by smtp.gmail.com with ESMTPSA id l6sm10707315pje.28.2019.10.02.04.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 04:02:08 -0700 (PDT)
Date: Wed, 2 Oct 2019 19:02:02 +0800
From: Eryu Guan <guaneryu@gmail.com>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20191002110200.GA2622@desktop>
References: <20190927100742.9266-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190927100742.9266-1-yuchao0@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.196 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (guaneryu[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iFcOd-00ENS1-6k
Subject: Re: [f2fs-dev] [PATCH] common/rc: generalize _get_filesize()
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

On Fri, Sep 27, 2019 at 06:07:42PM +0800, Chao Yu wrote:
> There are some testcases use below command to get file size, generalize
> it as global function _get_filesize()
> 
> ls -l $1 | $AWK_PROG '{print $5}'
> 
> - adjust common/defrag, generic/275 and generic/315 to use it
> - remove unused _filesize in generic/013
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
>  common/defrag     | 2 +-
>  common/rc         | 5 +++++
>  tests/generic/013 | 5 -----
>  tests/generic/275 | 2 +-
>  tests/generic/315 | 2 +-
>  5 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/common/defrag b/common/defrag
> index 9866d3da..50596f70 100644
> --- a/common/defrag
> +++ b/common/defrag
> @@ -145,7 +145,7 @@ _defrag()
>  	STAT_BEFORE=`stat -c "a: %x m: %y c: %z" $1`
>  
>  	if [ $FSTYP == "f2fs" ]; then
> -		_filesize=`ls -l $1 | $AWK_PROG '{print $5}'`
> +		_filesize=`_get_filesize $1`
>  		$DEFRAG_PROG 0 $_filesize $1 >> $seqres.full 2>&1
>  	else
>  		$DEFRAG_PROG -v $1 >> $seqres.full 2>&1
> diff --git a/common/rc b/common/rc
> index 66c7fd4d..69735ae6 100644
> --- a/common/rc
> +++ b/common/rc
> @@ -165,6 +165,11 @@ if [ ! -z "$REPORT_LIST" ]; then
>  	_assert_report_list
>  fi
>  
> +_get_filesize()
> +{
> +    echo `ls -l $1 | $AWK_PROG '{print $5}'`

Ah, you could update _get_filesize to use "stat -c %s" version then.

Thanks,
Eryu

> +}
> +
>  _mount()
>  {
>      $MOUNT_PROG `_mount_ops_filter $*`
> diff --git a/tests/generic/013 b/tests/generic/013
> index 9e533ee8..bc596102 100755
> --- a/tests/generic/013
> +++ b/tests/generic/013
> @@ -24,11 +24,6 @@ _cleanup()
>      rm -rf $TEST_DIR/fsstress.$$.*
>  }
>  
> -_filesize()
> -{
> -    ls -l $1 | $AWK_PROG '{print "    filesize = " $5}'
> -}
> -
>  # get standard environment, filters and checks
>  . ./common/rc
>  . ./common/filter
> diff --git a/tests/generic/275 b/tests/generic/275
> index a934c19c..adc82856 100755
> --- a/tests/generic/275
> +++ b/tests/generic/275
> @@ -73,7 +73,7 @@ echo "Bytes written until ENOSPC:" >>$seqres.full
>  du $SCRATCH_MNT/tmp1 >>$seqres.full
>  
>  # And at least some of it should succeed.
> -_filesize=`ls -l $SCRATCH_MNT/tmp1 | awk '{print $5}'`
> +_filesize=`_get_filesize $SCRATCH_MNT/tmp1`
>  [ $_filesize -lt $((128 * 1024)) ] && \
>  	_fail "Partial write until enospc failed; wrote $_filesize bytes."
>  
> diff --git a/tests/generic/315 b/tests/generic/315
> index fd49b579..808d7d74 100755
> --- a/tests/generic/315
> +++ b/tests/generic/315
> @@ -52,7 +52,7 @@ $XFS_IO_PROG -f -c 'falloc -k 0 $(($avail_begin/2))' \
>  	$TEST_DIR/testfile.$seq >>$seqres.full 2>&1
>  
>  # Verify the file size, it should keep unchanged as 0 in this case
> -fsize=`ls -l $TEST_DIR/testfile.$seq | awk '{print $5}'`
> +fsize=`_get_filesize $TEST_DIR/testfile.$seq`
>  [ "$fsize" -eq 0 ] || _fail "File size is changed to ($fsize Bytes)"
>  
>  # Truncate the file size back to 0
> -- 
> 2.18.0.rc1
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
