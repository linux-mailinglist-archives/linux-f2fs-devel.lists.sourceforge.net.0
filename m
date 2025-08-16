Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5750BB28B50
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 Aug 2025 09:15:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G0mTR4oS+55GdQCdJH8mG0x79DVmgxLL+kdLeevy4+s=; b=QB8CaHJr8hbRvFgnXiW3xCHjjk
	sXebYFUJqkWK3mdC3Gsn5x92FJpQ1rRS+ip0knjlilXyQkjuC8xaiZhaSRArvAenm32G/1W2TcaK0
	ro6w9s93W+PFWdLTUCgXlyZ/4tnEcX5jjEC/H2ovnKeMz/7nL3J/mrzrABKPQ5O4lhhc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1unB8b-000126-9J;
	Sat, 16 Aug 2025 07:15:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1unB8Y-00011x-GU
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 16 Aug 2025 07:15:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ydKG6etmZBbEYByPAQGJQJ7e2AbFvzgScJKTemEh3BY=; b=Hk04cqklqUNHffQEGURsKbudQ5
 t7Q9oV5iOYZ5D7LyEucZGg5d9qPrNDTfDIcxFiamkn5r180qlfZ6D+LTGWxXmY6otv8FTQfITv/vB
 ixf7WQ9Psc9IfKmt5RwNVl5iDeSDYX4zXrU6SYfNPgKLm1nPHYt9o0ltguV4Up0V8YDE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ydKG6etmZBbEYByPAQGJQJ7e2AbFvzgScJKTemEh3BY=; b=A9pYOp70ZBPCuqH3yamwZAtSaf
 5iUePRlF1Ng1/fa+r3WZI0O1eWXGWq+YD66/OeB1Q9xjYmSHgTue2t0HxXcsmYADoTiiK8HE5EGji
 SqQznk7bcn/Vg8CLR1hamr/PnnuX9N+ZFMAFmqvoOZ+qg3/2tbvoelknAsrwWnHY+In4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1unB8X-000380-8E for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 16 Aug 2025 07:15:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 644B65C33B2;
 Sat, 16 Aug 2025 07:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C4F5C4CEEF;
 Sat, 16 Aug 2025 07:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755328527;
 bh=c4tTy3wlTYksBN2LhG3HMKqNg8Ks6PlWm/MwcmEsvYo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=nPtC+dmFc7OBCsVrkeNyoq2hjl3apu1Z3qYsMOoPt3/mpV+oy7+GnW0VvKYNWO/K/
 /9g3lvJJtLg/vz0n39XWpcgrVeTysIUMrhPN8HMX1Ie9gF7ttIP4jVPCl1lyHn4I9B
 X/auQUTCcD4UvgBU2LDauXQEoUHpVGg/i3RybKdxgX9RIUdTKIXJFcBNGMBUuS2WvY
 5sEvJIp37DrfAJJCi1lK+aljEjyIwqZQJgsQUygzKwROGBrSDIQ6LGdrpJjw0eL4hN
 SrDHTj0Td+kl0n4qwyiB6QWBqhr7lgkXGOleOP1UwzkzvNdHGPJp2gVI7k6+rEW6HD
 i3pa5ILgq5eJw==
Message-ID: <d23f7cbf-729d-4be6-87a5-7561cbd95ad0@kernel.org>
Date: Sat, 16 Aug 2025 15:15:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@redhat.com>
References: <20250808065803.17298-1-chao@kernel.org>
 <20250815155408.ja527chpfrjtcuau@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Content-Language: en-US
In-Reply-To: <20250815155408.ja527chpfrjtcuau@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/8/15 23:54, Zorro Lang wrote: > On Fri, Aug 08, 2025
 at 02:58:03PM +0800, Chao Yu wrote: >> w/ below change [1], f2fs will enable
 lookup_mode=perf by default, it >> will change f2fs dirent loo [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1unB8X-000380-8E
Subject: Re: [f2fs-dev] [PATCH] f2fs/012: adapt lookup_mode=x mount option
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
Cc: Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/8/15 23:54, Zorro Lang wrote:
> On Fri, Aug 08, 2025 at 02:58:03PM +0800, Chao Yu wrote:
>> w/ below change [1], f2fs will enable lookup_mode=perf by default, it
>> will change f2fs dirent lookup method from linear based lookup to hash
>> based lookup.
>>
>> So that, f2fs will ignore sb.s_encoding_flags by default, which is not
>> compatible w/ f2fs/012 testcase, in where it will control lookup method
>> by configuring this flag w/ fsck.f2fs.
>>
>> To avoid failure of f2fs/012, let's check whether f2fs has supported
>> "lookup_mode=auto" mount option, mount w/ the option if it can,
>> otherwise, don't.
>>
>> [1] https://lore.kernel.org/linux-f2fs-devel/20250805065228.1473089-1-chullee@google.com
>>
>> Cc: Daniel Lee <chullee@google.com>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
> 
> With this patch, I always get below error:
> 
> f2fs/012 2s ... - output mismatch (see /root/git/xfstests/results//f2fs/012.out.bad)
>      --- tests/f2fs/012.out      2025-07-21 13:33:12.379585206 +0800
>      +++ /root/git/xfstests/results//f2fs/012.out.bad    2025-08-15 23:51:54.156835560 +0800
>      @@ -1,2 +1,4 @@
>       QA output created by 012
>      +mount: /mnt/scratch: wrong fs type, bad option, bad superblock on /dev/sda6, missing codepage or helper program, or other error.
>      +       dmesg(1) may have more information after failed mount system call.
>       Silence is golden
>      ...
>      (Run 'diff -u /root/git/xfstests/tests/f2fs/012.out /root/git/xfstests/results//f2fs/012.out.bad'  to see the entire diff)
> 
> Then test passed without this patch:

Sorry, I thought I've checked the case that kernel doesn't support
lookup_mode=x mount option.

> 
> f2fs/012 2s ...  3s
> Ran: f2fs/012
> Passed all 1 tests
> 
> 
>>   tests/f2fs/012 | 13 +++++++++++--
>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/f2fs/012 b/tests/f2fs/012
>> index b3df9a8f..15fc8f0c 100755
>> --- a/tests/f2fs/012
>> +++ b/tests/f2fs/012
>> @@ -22,6 +22,15 @@ _require_scratch_nocheck
>>   _require_command "$F2FS_IO_PROG" f2fs_io
>>   _require_command "$F2FS_INJECT_PROG" inject.f2fs
>>   
>> +#check whether f2fs supports "lookup_mode=x" mount option
>> +mntopt=""
>> +_scratch_mkfs -O casefold -C utf8 >> $seqres.full
>> +_try_scratch_mount "-o lookup_mode=auto"

We need to ignore the error from _try_scratch_mount ... here, let me fix it.

Thanks,

>> +if [ $? == 0 ]; then
>> +	mntopt="-o lookup_mode=auto"
>> +	_scratch_unmount
>> +fi
>> +
>>   check_lookup()
>>   {
>>   	local nolinear_lookup=$1
>> @@ -30,7 +39,7 @@ check_lookup()
>>   	local redheart=$dir/$'\u2764\ufe0f'
>>   
>>   	_scratch_mkfs -O casefold -C utf8 >> $seqres.full
>> -	_scratch_mount
>> +	_scratch_mount $mntopt
>>   
>>   	mkdir $dir
>>   	$F2FS_IO_PROG setflags casefold $dir >> $seqres.full
>> @@ -52,7 +61,7 @@ check_lookup()
>>   
>>   	$F2FS_INJECT_PROG --dent --mb d_hash --nid $ino --val 0x9a2ea068 $SCRATCH_DEV >> $seqres.full
>>   
>> -	_scratch_mount
>> +	_scratch_mount $mntopt
>>   	if [ $nolinear_lookup == "1" ]; then
>>   		[ -f $redheart ] && _fail "red heart file should not exist"
>>   	else
>> -- 
>> 2.40.1
>>
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
