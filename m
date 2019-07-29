Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2398A78AC1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2019 13:43:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hs44B-0002qP-1Y; Mon, 29 Jul 2019 11:43:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hs448-0002qA-Ig
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 11:43:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yp2ZbXGynzAGBwj9JV8HGioC054rnsjZnhW4A0L8ch8=; b=bbov8XYXi7orPntH/FiXpMJuZM
 6EAbSj1r42dM+UMhtoQleKqwRxIs+Fb2nzPYY4zVsYsNRGiXo3Q6QnbDtyCSVgvQv8lEsQ4AwYee5
 KrjFWDniigblL/YNZ/dRE4/nFxvuaRnmThKTT1E4288fBOnmvolxeSOdf6T22DLCwjyA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yp2ZbXGynzAGBwj9JV8HGioC054rnsjZnhW4A0L8ch8=; b=V24322YfQxr1RgC+yvh4egR4/O
 UF4Cfdm25sVCGglqfVrQzMsA9g2c9oxpGnE3GL6ocgkL7XGPRnUQvd7VyfOL8qD0AymnCLe2M1Gut
 9Q3+LCc01oWkfYv1C5mmbb/OzjWy7EMwlh+jGHBZ+xGmf63uz9mEvuMVOcdSiQULfaWA=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hs445-002vh1-Jq
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 11:43:44 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id B8327F29AD44F7E29E26;
 Mon, 29 Jul 2019 19:43:33 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 29 Jul
 2019 19:43:32 +0800
To: Eryu Guan <guaneryu@gmail.com>
References: <20190723092529.112426-1-yuchao0@huawei.com>
 <20190728095141.GM7943@desktop>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <b010ba0e-e4e3-215b-5e6f-c18b2a873942@huawei.com>
Date: Mon, 29 Jul 2019 19:43:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190728095141.GM7943@desktop>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hs445-002vh1-Jq
Subject: Re: [f2fs-dev] [PATCH 1/3] generic/38[3456]: adjust to check
 prjquota before mount
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
Cc: jaegeuk@kernel.org, chao@kernel.orga, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/7/28 17:51, Eryu Guan wrote:
> On Tue, Jul 23, 2019 at 05:25:27PM +0800, Chao Yu wrote:
>> Move _require_prjquota() to front of _qmount() since we do the
>> check on device directly instead of mountpoint, it can avoid
>> potential failure if filesystem utils needs exclusive open on
>> device.
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> 
> We've done similar changes before
> 
> 23f60ef304d6 ("generic/38[3-6]: require project quota to be enabled on
> SCRATCH_DEV")
> 
> but later it was reverted by
> 
> f722c48d4cd5 ("Revert "generic/38[3-6]: require project quota to be
> enabled on SCRATCH_DEV"")
> 
> Because we use quotactl(2) to check if prjquota is enabled on the given
> device (src/feature -P $dev in _require_prjquota), and quotactl(2)
> requires the given device is a mounted device.

You're right, let's ignore this patch. BTW, in order to fix f2fs failure on
these testcases, I'm trying to let dump.f2fs be able to check superblock on a
mounted device.

Thanks,

> 
> Thanks,
> Eryu
> 
>> ---
>>  tests/generic/383 | 2 +-
>>  tests/generic/384 | 2 +-
>>  tests/generic/385 | 2 +-
>>  tests/generic/386 | 2 +-
>>  4 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/generic/383 b/tests/generic/383
>> index 2c8c5923..cf5ac255 100755
>> --- a/tests/generic/383
>> +++ b/tests/generic/383
>> @@ -39,6 +39,7 @@ _require_xfs_quota_foreign
>>  
>>  _scratch_mkfs >/dev/null 2>&1
>>  _scratch_enable_pquota
>> +_require_prjquota $SCRATCH_DEV
>>  
>>  do_project_test()
>>  {
>> @@ -76,7 +77,6 @@ EOF
>>  # Test project
>>  _qmount_option "usrquota,prjquota"
>>  _qmount
>> -_require_prjquota $SCRATCH_DEV
>>  do_project_test
>>  
>>  # success, all done
>> diff --git a/tests/generic/384 b/tests/generic/384
>> index b7c940d7..2c0cd00b 100755
>> --- a/tests/generic/384
>> +++ b/tests/generic/384
>> @@ -57,10 +57,10 @@ chmod a+rwx $seqres.full	# arbitrary users will write here
>>  _require_scratch
>>  _scratch_mkfs >/dev/null 2>&1
>>  _scratch_enable_pquota
>> +_require_prjquota $SCRATCH_DEV
>>  
>>  _qmount_option "prjquota"
>>  _qmount
>> -_require_prjquota $SCRATCH_DEV
>>  
>>  report_quota()
>>  {
>> diff --git a/tests/generic/385 b/tests/generic/385
>> index 937131a9..56ce6eb0 100755
>> --- a/tests/generic/385
>> +++ b/tests/generic/385
>> @@ -56,9 +56,9 @@ quota_cmd="$XFS_QUOTA_PROG -D $tmp.projects -P $tmp.projid"
>>  
>>  _scratch_mkfs >/dev/null 2>&1
>>  _scratch_enable_pquota
>> +_require_prjquota $SCRATCH_DEV
>>  _qmount_option "prjquota"
>>  _qmount
>> -_require_prjquota $SCRATCH_DEV
>>  
>>  #
>>  # Create the project root
>> diff --git a/tests/generic/386 b/tests/generic/386
>> index 462c5869..e4f7d23b 100755
>> --- a/tests/generic/386
>> +++ b/tests/generic/386
>> @@ -112,10 +112,10 @@ echo $proj_num:$proj_dir > "$my_projects"
>>  
>>  _scratch_mkfs					>> "$seqres.full" 2>&1
>>  _scratch_enable_pquota
>> +_require_prjquota $SCRATCH_DEV
>>  
>>  _qmount_option "prjquota"
>>  _qmount
>> -_require_prjquota $SCRATCH_DEV
>>  
>>  mkdir -p "${proj_dir}"
>>  
>> -- 
>> 2.18.0.rc1
>>
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
