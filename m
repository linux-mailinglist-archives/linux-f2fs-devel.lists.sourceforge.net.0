Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9C9D871E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Oct 2019 06:06:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iKaZU-0004D9-7S; Wed, 16 Oct 2019 04:06:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <david@fromorbit.com>) id 1iKaZS-0004Cx-J6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Oct 2019 04:05:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bDNe/jr/2j/Am2VmTwL+/j1RIfq8vnybCaKKX/wWRfI=; b=MzzEHhq+q7x5xxlHOQpjwgAnOU
 COT1tdsKLtsYx9jHqiAXx4uSbUkXYBn4xAjJa/nuxmLx+cuqU0T2lb38/4P23zl3Lsavr7VjGbNsw
 XlRIJizTCGRHf/9fqqBSdsVPKjWNS/TITI0McYqWAclAIOqriIOKQB7pvI/kkL/GnHAo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bDNe/jr/2j/Am2VmTwL+/j1RIfq8vnybCaKKX/wWRfI=; b=K6P7cYRFi6s1Qa6BUDDwYBTuQu
 bvjtjknCoZqi7KBivnUW2lQJXdmU/9AOjRBplV5u/lilnK8/oV6o4LcbYh8dQF39OauFTME9wWqqX
 6fs8ZNLdph6dnqeNZLgCpOwjd0rXfrIqDY98shXrQ+LL2iUvAaBsIB0AiJwHzcLcg5WQ=;
Received: from mail104.syd.optusnet.com.au ([211.29.132.246])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1iKaZQ-00AzQi-IG
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Oct 2019 04:05:58 +0000
Received: from dread.disaster.area (pa49-181-198-88.pa.nsw.optusnet.com.au
 [49.181.198.88])
 by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 9176B43EEBA;
 Wed, 16 Oct 2019 14:43:26 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.2)
 (envelope-from <david@fromorbit.com>)
 id 1iKaDd-000342-DF; Wed, 16 Oct 2019 14:43:25 +1100
Date: Wed, 16 Oct 2019 14:43:25 +1100
From: Dave Chinner <david@fromorbit.com>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20191016034325.GI15134@dread.disaster.area>
References: <20191016024803.12028-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016024803.12028-1-yuchao0@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.2 cv=FNpr/6gs c=1 sm=1 tr=0
 a=ocld+OpnWJCUTqzFQA3oTA==:117 a=ocld+OpnWJCUTqzFQA3oTA==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=XobE76Q3jBoA:10
 a=i0EeH86SAAAA:8 a=7-415B0cAAAA:8 a=TByWkiWk5-4v4GWVltUA:9
 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iKaZQ-00AzQi-IG
Subject: Re: [f2fs-dev] [PATCH v3] common/rc: generalize _get_filesize()
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
Cc: guaneryu@gmail.com, linux-f2fs-devel@lists.sourceforge.net,
 fstests@vger.kernel.org, darrick.wong@oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Oct 16, 2019 at 10:48:03AM +0800, Chao Yu wrote:
> There are some testcases use below command to get file size, generalize
> it as global function _get_filesize()
> 
> ls -l $1 | $AWK_PROG '{print $5}'
> 
> And in addition, using more simple command "stat -c %s" instead.
> 
> - adjust common/defrag, generic/275 and generic/315 to use it
> - remove unused _filesize in generic/013
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
> v3:
> - avoid unneeded echo command in _get_filesize() pointed out by Darrick.
>  common/defrag     | 2 +-
>  common/rc         | 5 +++++
>  tests/generic/013 | 5 -----
>  tests/generic/275 | 2 +-
>  tests/generic/315 | 2 +-
>  5 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/common/defrag b/common/defrag
> index 1381a4dd..1769013b 100644
> --- a/common/defrag
> +++ b/common/defrag
> @@ -145,7 +145,7 @@ _defrag()
>  	STAT_BEFORE=`stat -c "a: %x m: %y c: %z" $1`
>  
>  	if [ $FSTYP == "f2fs" ]; then
> -		local filesize=`ls -l $1 | $AWK_PROG '{print $5}'`
> +		local filesize=`_get_filesize $1`
>  		$DEFRAG_PROG 0 $filesize $1 >> $seqres.full 2>&1
>  	else
>  		$DEFRAG_PROG -v $1 >> $seqres.full 2>&1
> diff --git a/common/rc b/common/rc
> index cfaabf10..8cdb7a9b 100644
> --- a/common/rc
> +++ b/common/rc
> @@ -165,6 +165,11 @@ if [ ! -z "$REPORT_LIST" ]; then
>  	_assert_report_list
>  fi
>  
> +_get_filesize()
> +{
> +    stat -c %s "$1"
> +}

Also, all these should use _get_filesize():

$ git grep 'stat -c %s'
tests/btrfs/086:echo "bar file size after clone operation: $(stat -c %s $SCRATCH_MNT/bar)"
tests/generic/399:                      total_file_size=$((total_file_size + $(stat -c %s $file)))
tests/generic/399:      total_file_size=$((total_file_size + $(stat -c %s $file)))
tests/xfs/306:size=`stat -c %s $SCRATCH_MNT/file`
$ git grep 'stat -c "%s"'
tests/generic/286:      test $(stat -c "%s" $src) = $(stat -c "%s" $dest) ||
tests/generic/286:      test $(stat -c "%s" $src) = $(stat -c "%s" $dest) ||
tests/generic/286:      test $(stat -c "%s" $src) = $(stat -c "%s" $dest) ||
tests/generic/286:      test $(stat -c "%s" $src) = $(stat -c "%s" $dest) ||
tests/overlay/060:      actual_size=$(stat -c "%s" $target)
tests/xfs/014:  size=`stat -c "%s" $file`
tests/xfs/076:offset=`stat -c "%s" $SCRATCH_MNT/spc`


Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
