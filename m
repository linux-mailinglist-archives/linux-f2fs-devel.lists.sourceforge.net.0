Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C89C9A5B6A4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Mar 2025 03:24:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1trpI3-00009c-HN;
	Tue, 11 Mar 2025 02:24:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1trpI1-00009U-JH
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 02:24:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2FW6IyYL6I41IdXq1skFiq0W6c8dhXxkqcCQbU2/S08=; b=hEQ0HrEdPiKBQKeJUecoa0FddG
 WjXiGAakfmeX/3+M9SyxZldO0ABWSQnIgMIfszzCrpyoOMj6WiZWJFZ3hUEvOV9ohtGqjL3HZVLhZ
 8CEMMNiCG3XYUy6NhF0wFywDHVb6xvN0021Rw21z6C6gPEBNID9nOhSnpiRBNgkXiYE8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2FW6IyYL6I41IdXq1skFiq0W6c8dhXxkqcCQbU2/S08=; b=cGJ+QiBQcJ3QpcJFQVwDmQUfx0
 WMyE8PSwbawXYRmUBqlxSjCY6vmyHCP4HZIZqroZQR4LpAQTY+bPOlzIoXEPMuGuLLjcDLI4cbtSR
 ZgBtGMjgiKhN9v0f9IQ+GVnxTL7iIFYBPEQFe8VE/lL2RrmQuJuf8Q0YrqQ1b6S/oCCE=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1trpI0-0007ze-M8 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 02:24:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 981C2A46797;
 Tue, 11 Mar 2025 02:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4ACC4CEEC;
 Tue, 11 Mar 2025 02:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741659850;
 bh=YinmwReazkNPB6ZX1QlREEjqhK5fZRJFq+/7acLtv80=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=jAWe3lRlBTVNbQfAP3sN6euajei6scrROlr1u0xiTem0ZELVyNsCYISg2IAe0hu5e
 /rHInoHimL8HU6dBTprbfw3Ue6EHuEsq/oRZ1FgGD9YkHEClA2Nac4Qjit/NKI2yjC
 mwM6Vwnmr4iSGZHxaVT8H3Oj96g5htWbR20EQ+rCr24Kcy9z1Dw8NAaS9A2cKmnEcp
 5kkpOmDQB2UiL5REHB6hl21MjV1vlTqj+6jhNOgSHTh0ghyNwAFNVpqV2U5xa+SxlB
 8lJsOusckNGvjnOSvhAlFEMsyUpmYvNp3r9fCbjYdusNFAuhgm+lNmcwnLu9+CoSwU
 W/nQlFIhmRQWQ==
Message-ID: <689f5126-e8cb-45cb-b620-99b4ea751937@kernel.org>
Date: Tue, 11 Mar 2025 10:24:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@redhat.com>
References: <20250306081809.2397527-1-chao@kernel.org>
 <20250306081809.2397527-4-chao@kernel.org>
 <20250310080006.rkvoxu55fe3qlxmd@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
 <c62943db-6169-462a-95a0-15fb2d5bc079@kernel.org>
 <20250310194818.wki325qreuta26nc@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Content-Language: en-US
In-Reply-To: <20250310194818.wki325qreuta26nc@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/11/25 03:48, Zorro Lang wrote: > On Mon, Mar 10, 2025
 at 05:59:23PM +0800, Chao Yu wrote: >> On 3/10/25 16:00, Zorro Lang wrote:
 >>> On Thu, Mar 06, 2025 at 04:18:09PM +0800, Chao Yu wrote: >>>> [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1trpI0-0007ze-M8
Subject: Re: [f2fs-dev] [PATCH 4/4] f2fs/009: detect and repair nlink
 corruption
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

On 3/11/25 03:48, Zorro Lang wrote:
> On Mon, Mar 10, 2025 at 05:59:23PM +0800, Chao Yu wrote:
>> On 3/10/25 16:00, Zorro Lang wrote:
>>> On Thu, Mar 06, 2025 at 04:18:09PM +0800, Chao Yu wrote:
>>>> This is a regression test to check whether fsck can handle corrupted
>>>> nlinks correctly, it uses inject.f2fs to inject nlinks w/ wrong value,
>>>> and expects fsck.f2fs can detect such corruption and do the repair.
>>>>
>>>> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
>>>> Signed-off-by: Chao Yu <chao@kernel.org>
>>>> ---
>>>
> 
> [snip]
> 
>>>> +	$F2FS_INJECT_PROG --node --mb i_links --nid $ino --val $nlink $SCRATCH_DEV >> $seqres.full
>>>> +	if [ $? != 0 ]; then
>>>> +		exit
>>>> +	fi
>>>> +
>>>> +	export FSCK_OPTIONS="-f"
>>>
>>> You've set below code in _repair_scratch_fs():
>>>
>>>     f2fs)
>>>         fsck -t $FSTYP -f $SCRATCH_DEV
>>>         ;;
>>>
>>> The FSCK_OPTIONS="-f" is useless.
>>>
>>>> +	_repair_scratch_fs >> $seqres.full
>>>> +	if [ $? != 1 ]; then
>>>
>>> What does $?=1 mean? Does $?=1 mean finding corruption and fixed, $?=0 mean no corruption?
>>
>> That's correct.
>>
>>>
>>> If you want to detect there's a corruption, then fix it, then check if it's fixed. How about
>>> calling _check_scratch_fs at first to get the corruption error you expect, then call
>>> _repair_scratch_fs to fix it. Then call _check_scratch_fs to make sure the corruption is
>>> fixed?
>>>
>>> Something likes (just a rough example)
>>>
>>> _check_scratch_fs >>$seqres.full 2>&1 && _fail "can't find corruption"
>>
>> You mean this?
>>
>> export FSCK_OPTIONS="--dry-run"
>> _check_scratch_fs >>$seqres.full 2>&1 || _fail "can't find corruption"
> 
> No,
> 
>>
>> We need to export FSCK_OPTIONS w/ "--dry-run", otherwise _check_scratch_fs
>> will be stuck once it detects corruption.
> 
> If so, you might need to give _check_scratch_fs (and _check_test_fs) a f2fs
> specific handling. Due to _check_scratch_fs aims to do "check" only,
> _repair_scratch_fs aims to do "repair", they have different target. When
> we call _check_scratch_fs, we hope it reports pass or corruption then return,
> neither "repair" nor "stuck". So if I understand correct, you might need:

Thank you for the explanation, now it's clear to me for use of those functions.

> 
> _check_scratch_fs()
> {
> 	case $FSTYP in
> 	...
> 	f2fs)
> 		FSCK_OPTIONS="--dry-run" _check_generic_filesystem $device

It seems not work for me, due to fsck can not accept long parameter
started w/ --? I didn't dig into this now.

fsck -t f2fs --dry-run /dev/vdb
fsck from util-linux 2.40.2

fsck -t f2fs  /dev/vdb -- --dry-run
fsck from util-linux 2.40.2
Info: Dry run
Info: MKFS version
...
Done: 0.071639 secs

So I used this in v2:

+    f2fs)
+        if [ "$FSCK_OPTIONS" == "--dry-run" ]; then
+            fsck -t $FSTYP $device -- $FSCK_OPTIONS >> $seqres.full 2>&1
+        else
+            _check_generic_filesystem $device
+        fi
+        ;;

Any suggestion? What about introducing _check_f2fs_filesystem and reuse
codes in _check_generic_filesystem as much as possible, then replace
fsck w/ $F2FS_FSCK_PROG in order to use --dry-run.

Thanks,

> 		;;
> 	...
> }
> 
> Or you have any better way to do f2fs check :)
> 
> Thanks,
> Zorro
> 
>>
>>> _repair_scratch_fs >> $seqres.full
>>> _check_scratch_fs
>>>
>>>> +		_fail "fsck can not detect and repair zero nlink corruption "$i
>>>> +		exit
>>>> +	fi
>>>> +
>>>> +	export FSCK_OPTIONS=""
>>>> +	_check_scratch_fs >> $seqres.full
>>>
>>> I think _check_scratch_fs outputs nothing if run passed, right?
>>>
>>> _check_scratch_fs calls _check_generic_filesystem for f2fs, the FSCK_OPTIONS
>>> is "null" by default, so above FSCK_OPTIONS="" is useless too.
>>>
>>>> +	if [ $? != 0 ]; then
>>>> +		_fail "fsck hasn't fixed nlink corruption "$i
>>>> +		exit
>>>> +	fi
>>>> +
>>>> +	_scratch_mount >> $seqres.full
>>>
>>> ">> $seqres.full" isn't necessary.
>>
>> Will update according to you comments, thanks a lot.
>>
>> Thanks,
>>
>>>
>>>> +	_scratch_unmount
>>>> +done
>>>> +
>>>> +echo "Silence is golden"
>>>> +
>>>> +status=0
>>>> +exit
>>>> diff --git a/tests/f2fs/009.out b/tests/f2fs/009.out
>>>> new file mode 100644
>>>> index 00000000..7e977155
>>>> --- /dev/null
>>>> +++ b/tests/f2fs/009.out
>>>> @@ -0,0 +1,2 @@
>>>> +QA output created by 009
>>>> +Silence is golden
>>>> -- 
>>>> 2.48.1
>>>>
>>>>
>>>
>>
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
