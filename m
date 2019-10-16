Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 736B5D88A5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Oct 2019 08:29:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iKcoA-0001wL-DL; Wed, 16 Oct 2019 06:29:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iKco8-0001w1-1u
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Oct 2019 06:29:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TnVXRldz7foKtb62e82fNbAjxEl0+UW42Pjtj5ncs08=; b=OVUjINJxl+QhPJ+onhyf9VWYM+
 /pjWPxvBvp+1C4rx4yaxt5fpyNB+txQcQzTeHBx/AclNtnYIcBosWBymaxG+FWilH+zqmai6JmEAN
 JOlct5KVoGgVf6gKRZULfEh2/O/oGsquNpQZXcPSVyVuvHLZctBzgTRtK3aVLijYHo/U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TnVXRldz7foKtb62e82fNbAjxEl0+UW42Pjtj5ncs08=; b=YQY9E6quGxXLnFdKYQWV4jPQY0
 k3uSKzCivbgx0VGkY7tE1V78X4T7GtGfvTa3aDwtaiGW6KaYCDmCbD+p12IEHq0/0Amb1e4N04HzF
 eSvpt8QaUZNQO7Ot7k2qURPYEKWwIebKpbiDZy5cqOK26tV+6LIJracTFwbcRUGgOXis=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iKco5-003Os1-QX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Oct 2019 06:29:16 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id D33CE7C5E9284E577120;
 Wed, 16 Oct 2019 14:29:06 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.202) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 16 Oct
 2019 14:29:02 +0800
To: Dave Chinner <david@fromorbit.com>
References: <20191016024803.12028-1-yuchao0@huawei.com>
 <20191016034325.GI15134@dread.disaster.area>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <9774df2c-aa9d-df86-7d14-d67a41ae2e87@huawei.com>
Date: Wed, 16 Oct 2019 14:29:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191016034325.GI15134@dread.disaster.area>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iKco5-003Os1-QX
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

On 2019/10/16 11:43, Dave Chinner wrote:
> On Wed, Oct 16, 2019 at 10:48:03AM +0800, Chao Yu wrote:
>> There are some testcases use below command to get file size, generalize
>> it as global function _get_filesize()
>>
>> ls -l $1 | $AWK_PROG '{print $5}'
>>
>> And in addition, using more simple command "stat -c %s" instead.
>>
>> - adjust common/defrag, generic/275 and generic/315 to use it
>> - remove unused _filesize in generic/013
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>> v3:
>> - avoid unneeded echo command in _get_filesize() pointed out by Darrick.
>>  common/defrag     | 2 +-
>>  common/rc         | 5 +++++
>>  tests/generic/013 | 5 -----
>>  tests/generic/275 | 2 +-
>>  tests/generic/315 | 2 +-
>>  5 files changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/common/defrag b/common/defrag
>> index 1381a4dd..1769013b 100644
>> --- a/common/defrag
>> +++ b/common/defrag
>> @@ -145,7 +145,7 @@ _defrag()
>>  	STAT_BEFORE=`stat -c "a: %x m: %y c: %z" $1`
>>  
>>  	if [ $FSTYP == "f2fs" ]; then
>> -		local filesize=`ls -l $1 | $AWK_PROG '{print $5}'`
>> +		local filesize=`_get_filesize $1`
>>  		$DEFRAG_PROG 0 $filesize $1 >> $seqres.full 2>&1
>>  	else
>>  		$DEFRAG_PROG -v $1 >> $seqres.full 2>&1
>> diff --git a/common/rc b/common/rc
>> index cfaabf10..8cdb7a9b 100644
>> --- a/common/rc
>> +++ b/common/rc
>> @@ -165,6 +165,11 @@ if [ ! -z "$REPORT_LIST" ]; then
>>  	_assert_report_list
>>  fi
>>  
>> +_get_filesize()
>> +{
>> +    stat -c %s "$1"
>> +}
> 
> Also, all these should use _get_filesize():

Oh, correct, I forgot to research with the new command... let me send v4 to
cover below lines.

Thanks for your reminder.

Thanks,

> 
> $ git grep 'stat -c %s'
> tests/btrfs/086:echo "bar file size after clone operation: $(stat -c %s $SCRATCH_MNT/bar)"
> tests/generic/399:                      total_file_size=$((total_file_size + $(stat -c %s $file)))
> tests/generic/399:      total_file_size=$((total_file_size + $(stat -c %s $file)))
> tests/xfs/306:size=`stat -c %s $SCRATCH_MNT/file`
> $ git grep 'stat -c "%s"'
> tests/generic/286:      test $(stat -c "%s" $src) = $(stat -c "%s" $dest) ||
> tests/generic/286:      test $(stat -c "%s" $src) = $(stat -c "%s" $dest) ||
> tests/generic/286:      test $(stat -c "%s" $src) = $(stat -c "%s" $dest) ||
> tests/generic/286:      test $(stat -c "%s" $src) = $(stat -c "%s" $dest) ||
> tests/overlay/060:      actual_size=$(stat -c "%s" $target)
> tests/xfs/014:  size=`stat -c "%s" $file`
> tests/xfs/076:offset=`stat -c "%s" $SCRATCH_MNT/spc`
> 
> 
> Cheers,
> 
> Dave.
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
