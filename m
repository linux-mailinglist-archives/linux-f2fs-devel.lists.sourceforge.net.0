Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D7CBC8100
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Oct 2025 10:35:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJP5XaAXY9G6ak8t7hIC2JMjD67xXVgI+7spB/TNJsE=; b=jQjxAnCHx4O55O7gY4gESdubvv
	8KXQznZgfkVUgVzR2A5rD4zgEIR8aWAOgPGtjits8Qazhzu3J07BIFHRJP2uNpcksEPSLYorOQzK2
	Qga4dkE7LFOhmJJeEsGCTHt6Wm5GinZ3kZlt3T1LSCuuQY72AGHJ1aKbtYX5IXMKRS8g=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v6m7a-0005XF-0s;
	Thu, 09 Oct 2025 08:35:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v6m7W-0005Vp-I3
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 08:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S3vdUvdA6kZc1It6yMkp01ehyxmEv8fZp1ZqICaBCF4=; b=fDIkgJ+uL/DC5ivZrnwxgRZX8Y
 3vmx8lresHIA2I8z8A0Nf0uv6paPLO3mr91B85J7nkUEEtG/XLlyjy+xQTy5jNmfCMnyLKPzEzUNx
 h8RXY00udl4NyhMW4fK9NsypcDi7e/3Vu2+OUTZmcqHy0O4OYngwGk1yCYKJU2cFAgJg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=S3vdUvdA6kZc1It6yMkp01ehyxmEv8fZp1ZqICaBCF4=; b=SvxLR5OwVFHdvP+3gw0mjmKIvr
 vzB60WtWC1pJZOLuZSz+Yyg+hS0/lWmrmvLAhlSS+a+W1rSQwD3N92o/GKKAVxAxmash1SJBOErNu
 1dqe1hkAYlm1M4EZsCrP0ut7nnURuno12Nb2gQjylfFDO1UxIMbjg8kXfEnwxx+Kzgrg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v6m7V-0002qV-UX for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 08:35:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7DB1C43FAD;
 Thu,  9 Oct 2025 08:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C104FC4CEE7;
 Thu,  9 Oct 2025 08:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759998919;
 bh=0IaEi0uq3l5f2+N98pir3HUxmmcK6n3FtbANj028fXY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=YcIkufyU3AIdB5p+J/F6271VUWMBVI3szwmvzfmUyPBz/xT4Vle+4Puqo0l5+zne4
 O25bSppZi+rukle0LDT28zebDOaPzUOagLYxPSkpHpXFqqJQ2tjQWpEm9K9quV5kQ+
 250tFttQXBus1E0A95Eb6k6LTdmOcGplW8EVabI+Z0q+m0zuo6p5TG0P/iiY85d97v
 Wr4mJK1vcI/4qyR/f3BC2BY8NhcOZIYbkBArR8UqkFf055AV3tZC+nfcNywBiamlnI
 +WDFqdXkUaLyIkJjizuaZ7eG6lhyhq4HdHNsbQl+7Cmd2RIBaJsd+py16duRxtrZU1
 CwqiKUCRxkJhA==
Message-ID: <7cab9cad-c075-452d-8600-bacc2db916b6@kernel.org>
Date: Thu, 9 Oct 2025 16:35:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zorro Lang <zlang@redhat.com>
References: <20250928185240.57862-1-chao@kernel.org>
 <20251001062441.cjh2wd7uleduehey@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
Content-Language: en-US
In-Reply-To: <20251001062441.cjh2wd7uleduehey@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/1/2025 2:24 PM, Zorro Lang wrote: > On Mon, Sep 29,
 2025 at 02:52:40AM +0800,
 Chao Yu wrote: >> Introduce _require_inject_f2fs_command()
 to check whether inject.f2fs >> supports specific metaare [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v6m7V-0002qV-UX
Subject: Re: [f2fs-dev] [PATCH] common/f2fs: introduce
 _require_inject_f2fs_command()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/1/2025 2:24 PM, Zorro Lang wrote:
> On Mon, Sep 29, 2025 at 02:52:40AM +0800, Chao Yu wrote:
>> Introduce _require_inject_f2fs_command() to check whether inject.f2fs
>> supports specific metaarea and member parameters.
>>
>> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   common/f2fs    | 25 +++++++++++++++++++++++++
>>   tests/f2fs/009 |  2 ++
>>   tests/f2fs/012 |  2 ++
>>   tests/f2fs/019 |  2 ++
>>   tests/f2fs/020 |  2 ++
>>   tests/f2fs/022 |  2 ++
>>   6 files changed, 35 insertions(+)
>>
>> diff --git a/common/f2fs b/common/f2fs
> 
> You remind me that there's a common/f2fs file, you can move f2fs specific
> functions to common/f2fs (e.g. _check_f2fs_filesystem) later :)

Okay.

> 
>> index 1b39d8ce..4b01e032 100644
>> --- a/common/f2fs
>> +++ b/common/f2fs
>> @@ -25,3 +25,28 @@ _require_scratch_f2fs_compression()
>>   		_scratch_unmount
>>   	fi
>>   }
>> +
>> +# check that inject.f2fs supports to inject specific field in specific meta area
>> +_require_inject_f2fs_command()
>> +{
>> +	if [ $# -ne 2 ]; then
>> +		echo "Usage: _require_inject_f2fs_command metaarea member" 1>&2
>> +		_exit 1
>> +	fi
>> +	metaarea=$1
>> +	member=$2
>> +
>> +	case $metaarea in
>> +	sb|cp|nat|sit)
>> +		val=0
>> +		;;
>> +	ssa|node|dent)
>> +		;;
>> +	*)
>> +		_notrun "unsupport metaarea: $metaarea"
>> +		;;
>> +	esac
>> +
>> +	$F2FS_INJECT_PROG "--$metaarea" "$val" "-h" | grep "$member:" > /dev/null || \
>> +		_notrun "--$metaarea --mb $member support is missing"
>> +}
>> diff --git a/tests/f2fs/009 b/tests/f2fs/009
>> index 7333d484..465be874 100755
>> --- a/tests/f2fs/009
>> +++ b/tests/f2fs/009
>> @@ -9,10 +9,12 @@
>>   # and expects fsck.f2fs can detect such corruption and do the repair.
>>   #
>>   . ./common/preamble
>> +. ./common/f2fs
> 
> The common/f2fs can be imported by common/config:_source_specific_fs()
> automatically, so we don't need this line at here.

Oh, so we may missed to add such line for f2fs in common/config:_source_specific_fs(),
let me add a separated patch for this, and then we can remove ". ./common/f2fs" for
f2fs/002.

> 
> (Same below)
> 
>>   _begin_fstest auto quick
>>   
>>   _require_scratch
>>   _require_command "$F2FS_INJECT_PROG" inject.f2fs
>> +_require_inject_f2fs_command node i_links
> 
> If the "_require_command $F2FS_INJECT_PROG inject.f2fs" is always required
> before _require_inject_f2fs_command, how about call it at the beginning
> of _require_inject_f2fs_command ?

Yeah, that's better. :)

Thanks,

> 
> (same below)
> 
> Thanks,
> Zorro
> 
>>   _require_command "$(type -P socket)" socket
>>   
>>   _fixed_by_git_commit f2fs-tools 958cd6e \
>> diff --git a/tests/f2fs/012 b/tests/f2fs/012
>> index 7438d9ce..8e156772 100755
>> --- a/tests/f2fs/012
>> +++ b/tests/f2fs/012
>> @@ -12,6 +12,7 @@
>>   # 4.enable linear lookup, expect lookup succeed
>>   #
>>   . ./common/preamble
>> +. ./common/f2fs
>>   _begin_fstest auto quick casefold
>>   
>>   _fixed_by_kernel_commit 91b587ba79e1 \
>> @@ -21,6 +22,7 @@ export LC_ALL=C.UTF-8
>>   _require_scratch_nocheck
>>   _require_command "$F2FS_IO_PROG" f2fs_io
>>   _require_command "$F2FS_INJECT_PROG" inject.f2fs
>> +_require_inject_f2fs_command dent d_hash
>>   
>>   #check whether f2fs supports "lookup_mode=x" mount option
>>   mntopt=""
>> diff --git a/tests/f2fs/019 b/tests/f2fs/019
>> index 2307bd96..f6bb0b52 100755
>> --- a/tests/f2fs/019
>> +++ b/tests/f2fs/019
>> @@ -12,6 +12,7 @@
>>   #    corruption in the file
>>   #
>>   . ./common/preamble
>> +. ./common/f2fs
>>   _begin_fstest auto quick rw
>>   
>>   _fixed_by_kernel_commit 77de19b6867f \
>> @@ -19,6 +20,7 @@ _fixed_by_kernel_commit 77de19b6867f \
>>   
>>   _require_scratch_nocheck
>>   _require_command "$F2FS_INJECT_PROG" inject.f2fs
>> +_require_inject_f2fs_command node addr
>>   
>>   # remove all mkfs options to avoid layout change of on-disk inode
>>   export MKFS_OPTIONS=""
>> diff --git a/tests/f2fs/020 b/tests/f2fs/020
>> index 38bc6582..332848d0 100755
>> --- a/tests/f2fs/020
>> +++ b/tests/f2fs/020
>> @@ -12,6 +12,7 @@
>>   #    corruption in the file
>>   #
>>   . ./common/preamble
>> +. ./common/f2fs
>>   _begin_fstest auto quick rw
>>   
>>   . ./common/attr
>> @@ -21,6 +22,7 @@ _fixed_by_kernel_commit 061cf3a84bde \
>>   
>>   _require_scratch_nocheck
>>   _require_command "$F2FS_INJECT_PROG" inject.f2fs
>> +_require_inject_f2fs_command node i_xattr_nid
>>   _require_attrs user
>>   
>>   # remove all mkfs options to avoid layout change of on-disk inode
>> diff --git a/tests/f2fs/022 b/tests/f2fs/022
>> index ed3b4f2b..f81180e8 100755
>> --- a/tests/f2fs/022
>> +++ b/tests/f2fs/022
>> @@ -11,6 +11,7 @@
>>   # 4. fpunch in foo w/ specified range
>>   #
>>   . ./common/preamble
>> +. ./common/f2fs
>>   _begin_fstest auto quick rw
>>   
>>   . ./common/attr
>> @@ -20,6 +21,7 @@ _fixed_by_kernel_commit xxxxxxxxxxxx \
>>   
>>   _require_scratch_nocheck
>>   _require_command "$F2FS_INJECT_PROG" inject.f2fs
>> +_require_inject_f2fs_command node i_nid
>>   
>>   # remove all mkfs options to avoid layout change of on-disk inode
>>   export MKFS_OPTIONS=""
>> -- 
>> 2.40.1
>>
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
