Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AC5D72A1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Oct 2019 11:55:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iKJY6-0008IM-3w; Tue, 15 Oct 2019 09:55:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1iKJY4-0008I8-N8
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Oct 2019 09:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DsBWDRRK+irMS6v8hoDfSLib1yY/JYQGwhtqJoU2PnM=; b=GC+p4do83diK9jZ9Yy9xbpRrCo
 pLka9N7VNKZBLgf3PnfiSRi98WdPtPo4xVBYsoWhwY8mbBsdQ9hSG2/sbyvy7V3aXsDIjFe0JS21u
 EslH2oof5jp7+oWUHsOupQRMxeB+HYa78DXvEqM6600CkgprhQ3a9HhWJFqAZyGWNpfs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DsBWDRRK+irMS6v8hoDfSLib1yY/JYQGwhtqJoU2PnM=; b=WnR89AvO1b6GaS9ZQnlxCkALLx
 eiTAdgDyeR6ZuvPtKZjwziLZKVuoiAzalmL0GgQWijGynoy662Rcthnb9SEwxnjNrEvcF3hIaAwGe
 uwSvWbfWIbRKH7HWMw2Fn5MUpg2jA7Lye9s61JXOYu7qUbAdFO0kbgxP291YNJ8VjmxI=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iKJY2-001wPa-1U
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Oct 2019 09:55:24 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 4562C3B1048D65315235;
 Tue, 15 Oct 2019 17:55:14 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 15 Oct
 2019 17:55:08 +0800
To: Eryu Guan <guaneryu@gmail.com>
References: <20190927100627.9086-1-yuchao0@huawei.com>
 <20191002105956.GZ2622@desktop>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c4a64d7b-de6a-1bb7-102c-4a6ea1a627d6@huawei.com>
Date: Tue, 15 Oct 2019 17:55:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191002105956.GZ2622@desktop>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iKJY2-001wPa-1U
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

On 2019/10/2 18:59, Eryu Guan wrote:
> On Fri, Sep 27, 2019 at 06:06:26PM +0800, Chao Yu wrote:
>> F2FS supports defragment based on file granularity, adjust test suit
>> to support f2fs.
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>>  common/config |  2 ++
>>  common/defrag | 11 ++++++++++-
>>  2 files changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/common/config b/common/config
>> index 4c86a492..c43be339 100644
>> --- a/common/config
>> +++ b/common/config
>> @@ -176,6 +176,7 @@ export XFS_COPY_PROG="$(type -P xfs_copy)"
>>  export FSTRIM_PROG="$(type -P fstrim)"
>>  export DUMPE2FS_PROG="$(type -P dumpe2fs)"
>>  export RESIZE2FS_PROG="$(type -P resize2fs)"
>> +export F2FS_IO_PROG="$(type -P f2fs_io)"
>>  export FIO_PROG="$(type -P fio)"
>>  export FILEFRAG_PROG="$(type -P filefrag)"
>>  export E4DEFRAG_PROG="$(type -P e4defrag)"
>> @@ -240,6 +241,7 @@ case "$HOSTOS" in
>>  	export MKFS_BTRFS_PROG=$(set_mkfs_prog_path_with_opts btrfs)
>>  	export MKFS_F2FS_PROG=$(set_mkfs_prog_path_with_opts f2fs)
>>  	export DUMP_F2FS_PROG=$(type -P dump.f2fs)
>> +	export F2FS_IO_PROG=$(type -P f2fs_io)
>>  	export BTRFS_UTIL_PROG=$(type -P btrfs)
>>  	export BTRFS_SHOW_SUPER_PROG=$(type -P btrfs-show-super)
>>  	export BTRFS_CONVERT_PROG=$(type -P btrfs-convert)
>> diff --git a/common/defrag b/common/defrag
>> index 2bd739c0..9866d3da 100644
>> --- a/common/defrag
>> +++ b/common/defrag
>> @@ -27,6 +27,9 @@ _require_defrag()
>>  	rm -f $testfile $donorfile 2>&1 > /dev/null
>>  	DEFRAG_PROG="$E4DEFRAG_PROG"
>>  	;;
>> +    f2fs)
>> +	DEFRAG_PROG="$F2FS_IO_PROG defrag_file"
>> +	;;
>>      btrfs)
>>  	DEFRAG_PROG="$BTRFS_UTIL_PROG filesystem defragment"
>>  	;;
>> @@ -140,7 +143,13 @@ _defrag()
>>  
>>  	[ ! -z $csum ] && CSUM_BEFORE=`md5sum $1`
>>  	STAT_BEFORE=`stat -c "a: %x m: %y c: %z" $1`
>> -	$DEFRAG_PROG -v $1 >> $seqres.full 2>&1
>> +
>> +	if [ $FSTYP == "f2fs" ]; then
>> +		_filesize=`ls -l $1 | $AWK_PROG '{print $5}'`

Sorry for later reply.

> 
> Better to declare "filesize" as a local variable here.
> 
> 		local filesize=`stat -c %s $1`

Will update to use below code here:

local filesize=`ls -l $1 | $AWK_PROG '{print $5}'`

Thanks,

> 
> Otherwise looks fine to me.
> 
> But it'd be better to let other f2fs developers review this patchset as
> well.
> 
> Thanks,
> Eryu
> 
>> +		$DEFRAG_PROG 0 $_filesize $1 >> $seqres.full 2>&1
>> +	else
>> +		$DEFRAG_PROG -v $1 >> $seqres.full 2>&1
>> +	fi
>>  
>>  	_scratch_cycle_mount
>>  	STAT_AFTER=`stat -c "a: %x m: %y c: %z" $1`
>> -- 
>> 2.18.0.rc1
>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
