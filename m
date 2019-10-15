Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5835D72A2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Oct 2019 11:55:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iKJYO-0003fQ-4X; Tue, 15 Oct 2019 09:55:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iKJYM-0003f1-Lt
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Oct 2019 09:55:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9EINJMDZVIO+4/TeT44QkSsaJ3SbvfPZiHmKw0UMZ40=; b=PneP+Eo29LgeQmCpulIS15XYQb
 s8ehdLuTrsNvmuzW+tViVt9cTEtLG1/ey0VkHr5Pjjt376QirgpLoC9fS4n+qPDiKY6ZtIb/pbhMT
 EAExP51KKsi6oWM8q8zx4kxWgYcwudRLFee524YLkcN2pzXYgiRsVLG0Hbu4ALP8mCKE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9EINJMDZVIO+4/TeT44QkSsaJ3SbvfPZiHmKw0UMZ40=; b=XYDcH9cCmr6VqJfCZWCD+tzpD9
 oYnU7ZjchJA2272Fv0dsw+dqWFdLm8fGy5tQlHyKeaKvvvHyjTGkkZqM53VI6DYtx44ttSYxran3c
 XD76QwVmXezY29LctsJWmNeUZyupJIbGq5aj5jy9z2z7zFOKvBP5dy6TxbcpZoej7Luw=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iKJYK-001wRn-GN
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Oct 2019 09:55:42 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 1AA6D4119A4F3074B5BC;
 Tue, 15 Oct 2019 17:55:32 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 15 Oct
 2019 17:55:29 +0800
To: Eryu Guan <guaneryu@gmail.com>
References: <20190927100742.9266-1-yuchao0@huawei.com>
 <20191002110200.GA2622@desktop>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <e984d031-cc67-e8db-51f1-64f534622ad0@huawei.com>
Date: Tue, 15 Oct 2019 17:55:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191002110200.GA2622@desktop>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iKJYK-001wRn-GN
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

On 2019/10/2 19:02, Eryu Guan wrote:
> On Fri, Sep 27, 2019 at 06:07:42PM +0800, Chao Yu wrote:
>> There are some testcases use below command to get file size, generalize
>> it as global function _get_filesize()
>>
>> ls -l $1 | $AWK_PROG '{print $5}'
>>
>> - adjust common/defrag, generic/275 and generic/315 to use it
>> - remove unused _filesize in generic/013
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>  common/defrag     | 2 +-
>>  common/rc         | 5 +++++
>>  tests/generic/013 | 5 -----
>>  tests/generic/275 | 2 +-
>>  tests/generic/315 | 2 +-
>>  5 files changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/common/defrag b/common/defrag
>> index 9866d3da..50596f70 100644
>> --- a/common/defrag
>> +++ b/common/defrag
>> @@ -145,7 +145,7 @@ _defrag()
>>  	STAT_BEFORE=`stat -c "a: %x m: %y c: %z" $1`
>>  
>>  	if [ $FSTYP == "f2fs" ]; then
>> -		_filesize=`ls -l $1 | $AWK_PROG '{print $5}'`
>> +		_filesize=`_get_filesize $1`
>>  		$DEFRAG_PROG 0 $_filesize $1 >> $seqres.full 2>&1
>>  	else
>>  		$DEFRAG_PROG -v $1 >> $seqres.full 2>&1
>> diff --git a/common/rc b/common/rc
>> index 66c7fd4d..69735ae6 100644
>> --- a/common/rc
>> +++ b/common/rc
>> @@ -165,6 +165,11 @@ if [ ! -z "$REPORT_LIST" ]; then
>>  	_assert_report_list
>>  fi
>>  
>> +_get_filesize()
>> +{
>> +    echo `ls -l $1 | $AWK_PROG '{print $5}'`
> 
> Ah, you could update _get_filesize to use "stat -c %s" version then.

Copied. :)

Thanks,

> 
> Thanks,
> Eryu
> 
>> +}
>> +
>>  _mount()
>>  {
>>      $MOUNT_PROG `_mount_ops_filter $*`
>> diff --git a/tests/generic/013 b/tests/generic/013
>> index 9e533ee8..bc596102 100755
>> --- a/tests/generic/013
>> +++ b/tests/generic/013
>> @@ -24,11 +24,6 @@ _cleanup()
>>      rm -rf $TEST_DIR/fsstress.$$.*
>>  }
>>  
>> -_filesize()
>> -{
>> -    ls -l $1 | $AWK_PROG '{print "    filesize = " $5}'
>> -}
>> -
>>  # get standard environment, filters and checks
>>  . ./common/rc
>>  . ./common/filter
>> diff --git a/tests/generic/275 b/tests/generic/275
>> index a934c19c..adc82856 100755
>> --- a/tests/generic/275
>> +++ b/tests/generic/275
>> @@ -73,7 +73,7 @@ echo "Bytes written until ENOSPC:" >>$seqres.full
>>  du $SCRATCH_MNT/tmp1 >>$seqres.full
>>  
>>  # And at least some of it should succeed.
>> -_filesize=`ls -l $SCRATCH_MNT/tmp1 | awk '{print $5}'`
>> +_filesize=`_get_filesize $SCRATCH_MNT/tmp1`
>>  [ $_filesize -lt $((128 * 1024)) ] && \
>>  	_fail "Partial write until enospc failed; wrote $_filesize bytes."
>>  
>> diff --git a/tests/generic/315 b/tests/generic/315
>> index fd49b579..808d7d74 100755
>> --- a/tests/generic/315
>> +++ b/tests/generic/315
>> @@ -52,7 +52,7 @@ $XFS_IO_PROG -f -c 'falloc -k 0 $(($avail_begin/2))' \
>>  	$TEST_DIR/testfile.$seq >>$seqres.full 2>&1
>>  
>>  # Verify the file size, it should keep unchanged as 0 in this case
>> -fsize=`ls -l $TEST_DIR/testfile.$seq | awk '{print $5}'`
>> +fsize=`_get_filesize $TEST_DIR/testfile.$seq`
>>  [ "$fsize" -eq 0 ] || _fail "File size is changed to ($fsize Bytes)"
>>  
>>  # Truncate the file size back to 0
>> -- 
>> 2.18.0.rc1
>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
