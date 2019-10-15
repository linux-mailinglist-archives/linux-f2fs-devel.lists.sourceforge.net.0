Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49377D7EC0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Oct 2019 20:19:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iKRPv-000582-VU; Tue, 15 Oct 2019 18:19:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <darrick.wong@oracle.com>) id 1iKRPt-00057u-TR
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Oct 2019 18:19:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I0qZeod/yPxxOXr7KUmvzCbrF/zMxFtkwEBsC4flSq4=; b=l67/G9LTMjfDgo6/8abs83NFd0
 ZvL1BdOnXiUZ2LoxkwhoqQ5+rhKTIqOqRD/81sOb95ki5RJfDbVlp//4hQR7oK8AXXTXBpMW4BE3X
 k9hP8kLzKRTVyxzZYSTvtvOGRAlnZf4/T1yaIYObzpL06Hn5qF2oywkXdS6tEfl8MapY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I0qZeod/yPxxOXr7KUmvzCbrF/zMxFtkwEBsC4flSq4=; b=bkGiUYqcQKH9RpPvzD9qghEIZe
 5DMFq6U+Teff/+QeHXcx12prDEhFJIc4FzeFR+dhNKV7FVyKFlfD3e+r4TSaQMFOoAP788JX4VNVO
 aNf6Rx08dnrVitxXpPi0ACGCYfEix3eo5FgjAN6e094obkL1vjsp9kSPNil0hzhsN16o=;
Received: from aserp2120.oracle.com ([141.146.126.78])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iKRPq-002YJU-3r
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Oct 2019 18:19:29 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9FIJE6I105171;
 Tue, 15 Oct 2019 18:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=I0qZeod/yPxxOXr7KUmvzCbrF/zMxFtkwEBsC4flSq4=;
 b=QKSxp1W1H/h9/RtrQiy8VUClv+4U7S1o88zk/7unfMnKGnLb9VkTk7io5RgZkbsgsg+w
 dTp9ILO4ccAbhUFJy66jH2VKTBgZEk/BiwuMg5/kYQEIrGY1wqzWemzd17zoYp5bezhF
 qPDD3d3zazg6P8xzQs6xDwV5ksmpjCHeSrxsJDQh5DaaG+fZh+luy4pjgEeOGT363E8r
 Q2Atzy6CZFYHFn/MNpORHrEFeS5z3f7bXYGHVRmVEPWlSHKCqm8SWZX/hoM5N52fb3Ae
 vLkFzCEdLnydHnsUz/+e/9QDp3hVlWo/VpG3QQK6/p49tB87OKJgF+SdRVQmM74XJrsU bg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2vk6sqhy4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Oct 2019 18:19:14 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9FIIrFf155135;
 Tue, 15 Oct 2019 18:19:14 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2vnf7rpjcm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Oct 2019 18:19:11 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x9FIHpiU021215;
 Tue, 15 Oct 2019 18:17:51 GMT
Received: from localhost (/67.169.218.210)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 15 Oct 2019 18:17:51 +0000
Date: Tue, 15 Oct 2019 11:17:50 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20191015181750.GK13097@magnolia>
References: <20191015101149.127599-1-yuchao0@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191015101149.127599-1-yuchao0@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9411
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=952
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1910150155
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9411
 signatures=668684
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1910150155
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iKRPq-002YJU-3r
Subject: Re: [f2fs-dev] [PATCH v2] common/rc: generalize _get_filesize()
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

On Tue, Oct 15, 2019 at 06:11:49PM +0800, Chao Yu wrote:
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
> v2:
> - As suggested by Eryu, let's use "stat -c %s" instead of original
> complicated one.
> 
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
> index cfaabf10..bd388a4c 100644
> --- a/common/rc
> +++ b/common/rc
> @@ -165,6 +165,11 @@ if [ ! -z "$REPORT_LIST" ]; then
>  	_assert_report_list
>  fi
>  
> +_get_filesize()
> +{
> +    echo `stat -c %s $1`

Why bother enclosing this in backticks?  Wouldn't this also work?

_get_filesize()
{
	stat -c %s "$1"
}

--D

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
