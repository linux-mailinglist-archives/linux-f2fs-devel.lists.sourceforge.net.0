Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 302F4C29D4B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 03 Nov 2025 02:53:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDeRSqm3UBB/rMMdzMV80iJvI/PYnirGjmsbhsANdm8=; b=HOMkotGr3szAYDzfcUARQtd0EW
	ghIzPIoNxkkG3RZkh8myh5VfPn6j8bj2UPyQMaXFAVq/LN/TO/0vkUoKGd+ZhERGUYUhv8/FF07nl
	2pYlrAvWWIHPDpJIbj0qqhC1PthzJTWDYxE4Y3PRLoiCJEZ9a8IuHNs+VKATZc3WqFM4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vFjlb-0004jl-28;
	Mon, 03 Nov 2025 01:53:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vFjlZ-0004jW-Ds
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 01:53:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W4xSR1ZuLya6P/TmGmxLeL+q0rBRXDkIKQ4xxndWoaY=; b=dqHkJ2Zd66vpJaeTT6vwBuxU6l
 bnM3VeOmPO72Gp6+Zf6PNUSp+ARa2WNNXUVo+p0rjt4KIon6G06x5YZcFphSE9KJXlaDmZmKPJemA
 1V6ncknbYkjtFPsJMs08EqbsqLadoz600c/th4QWM+X6kyKoQ9U+obH4nGurDeZ3aFjk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W4xSR1ZuLya6P/TmGmxLeL+q0rBRXDkIKQ4xxndWoaY=; b=MnaIw5AON6ECR1Bc6inMaEhbUX
 hoFyEzJeHVSgB2U+1hREREi+xAGPkEo11aojwX+MXJ5/ubMUIv8Sqd16wIqxwY3Kawu3S1YdNC0iD
 55OYcnI0yW4urauLfvGzgAj+s0orQ0Li8QXDyurGBQC6z+tT311dBY38oO8oZnfmVQ80=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vFjlZ-0007cc-Kp for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 01:53:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E9C6160233;
 Mon,  3 Nov 2025 01:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66183C4CEF7;
 Mon,  3 Nov 2025 01:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762134822;
 bh=lNa5OqdXIHwW+gcJnZqYyTQZxgVka1Qit/FyXIF6UA8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=goaNOkeTVRFMRKjROGrMklriX3CJ2aucoQ79lXz+fWQ5fhrp4LwGvLvJeXmvQDPOE
 jog1lFJdp7AjFWNCGFbkWirHNZEmV1NEoBoQ6AtsDK/B8LCkGrO5qcf7gTbcOU3OYB
 G0R7FocRlJTLhRoe6/sjZv5mEKlUsinwTkYkvj5zcT9J6wyGPkwHc6sELQCh1ABlbm
 K+AxNHxwr+J5XySXHns7lSTEsQiZ0S+H4U9wlpCWSoQeioMsRS8Dz/gadPQGqOTnFB
 NswxgFIYC4vrhkzAWWxcymXoHOd3Cy3rghwyGsIhR+vWZuUalFuNdxeu3Sz0xy4LrS
 kiSCoOhr5NO+g==
Message-ID: <207c9423-c776-4be1-a440-a3674d06416c@kernel.org>
Date: Mon, 3 Nov 2025 09:53:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@redhat.com>
References: <20251020023108.327728-1-chao@kernel.org>
 <20251020023108.327728-2-chao@kernel.org>
 <20251101114453.g6fxupmriauxtroc@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Content-Language: en-US
In-Reply-To: <20251101114453.g6fxupmriauxtroc@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/1/25 19:44, Zorro Lang wrote: > On Mon, Oct 20, 2025
 at 10:31:08AM +0800, Chao Yu wrote: >> f2fs/022 will report failure as below:
 >> >> f2fs/022 - output mismatch (see /share/git/fstests/result [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vFjlZ-0007cc-Kp
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs/022: fix to run testcase correctly
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/1/25 19:44, Zorro Lang wrote:
> On Mon, Oct 20, 2025 at 10:31:08AM +0800, Chao Yu wrote:
>> f2fs/022 will report failure as below:
>>
>> f2fs/022       - output mismatch (see /share/git/fstests/results//f2fs/022.out.bad)
>>     --- tests/f2fs/022.out      2025-10-20 10:18:47.075968669 +0800
>>     +++ /share/git/fstests/results//f2fs/022.out.bad    2025-10-20 10:25:20.000000000 +0800
>>     @@ -1,2 +1,5 @@
>>      QA output created by 022
>>     +wrote 8388608/8388608 bytes at offset 0
>>     +8 MiB, 2048 ops; 0.0018 sec (4.300 GiB/sec and 1127132.6362 ops/sec)
>>     +fallocate: Operation not supported
>>      Silence is golden
>>     ...
>>     (Run 'diff -u /share/git/fstests/tests/f2fs/022.out /share/git/fstests/results//f2fs/022.out.bad'  to see the entire diff)
>>
>> HINT: You _MAY_ be missing kernel fix:
>>       xxxxxxxxxxxx f2fs: fix to do sanity check on node footer for non inode dnode
>>
>> Fix this testcase as below:
>>
>> - fix a typo "$SCARTCH_MNT"
>> - fix to update output to "fallocate: Structure needs cleaning"
>> - relocate output of "$XFS_IO_PROG $foo_path -c "pwrite 0 8M"" to
>> $seqres.full
>>
>> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>  tests/f2fs/022     | 8 +++-----
>>  tests/f2fs/022.out | 2 +-
>>  2 files changed, 4 insertions(+), 6 deletions(-)
>>
>> diff --git a/tests/f2fs/022 b/tests/f2fs/022
>> index f6d77c96..728ef4e8 100755
>> --- a/tests/f2fs/022
>> +++ b/tests/f2fs/022
>> @@ -24,15 +24,15 @@ _require_inject_f2fs_command node i_nid
>>  # remove all mkfs options to avoid layout change of on-disk inode
>>  export MKFS_OPTIONS=""
>>  
>> -foo_path=$SCARTCH_MNT/foo
>> -bar_path=$SCARTCH_MNT/bar
>> +foo_path=$SCRATCH_MNT/foo
>> +bar_path=$SCRATCH_MNT/bar
> 
> Hahaha, I took long time to find out what these 2 lines try to change:) Thanks
> for fixing this.

Haha, Seems I rebased v2 to a problematic codebase when I sync-up code from
different git repo. It took me some time to find the root cause of 022
failure. :/

Anyway, thanks for the review. :)

Thanks,

> 
> Reviewed-by: Zorro Lang <zlang@redhat.com>
> 
>>  
>>  _scratch_mkfs >> $seqres.full
>>  _scratch_mount
>>  
>>  touch $foo_path
>>  touch $bar_path
>> -$XFS_IO_PROG $foo_path -c "pwrite 0 8M"
>> +$XFS_IO_PROG $foo_path -c "pwrite 0 8M" >> $seqres.full
>>  sync
>>  foo_ino=`stat -c '%i' $foo_path`
>>  bar_ino=`stat -c '%i' $bar_path`
>> @@ -48,7 +48,5 @@ _scratch_mount
>>  $XFS_IO_PROG $foo_path -c "fpunch 6984k 4k"
>>  _scratch_unmount
>>  
>> -echo "Silence is golden"
>> -
>>  status=0
>>  exit
>> diff --git a/tests/f2fs/022.out b/tests/f2fs/022.out
>> index 394c6a7c..5307e3d7 100644
>> --- a/tests/f2fs/022.out
>> +++ b/tests/f2fs/022.out
>> @@ -1,2 +1,2 @@
>>  QA output created by 022
>> -Silence is golden
>> +fallocate: Structure needs cleaning
>> -- 
>> 2.49.0
>>
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
