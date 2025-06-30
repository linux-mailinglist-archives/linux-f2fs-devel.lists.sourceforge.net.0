Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BF2AED2FB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Jun 2025 05:41:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVjV6YevcX/F7cEPqbQlxwh/t0SGHMV76HDKJs9wmT0=; b=NPEQ+u8woqB2t035gnRFH19MR2
	l2cGNiK8JcMkXbcWxRxwnK6GMe4DC6AEdjrmZSUDc7S+Hj3LfuCiqFb2h3E5VXrFIYh+8CQk78eI3
	NhwfDIh8RZ9v7cjP2DpiMmpG0LMbSAcdPMyPNPto9atRx/epWrdmAW1RDB0AljrXIY1A=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uW5Ow-0000W7-7a;
	Mon, 30 Jun 2025 03:41:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uW5Ov-0000W0-FI
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 03:41:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RAzXtkJdiQRB2L/6Yvgtn5i+vseWAD0+YoNQRRvU2LI=; b=Qot2gTJRFmPGV7NF8Rw3Yjb8M7
 9DbG4YpU+KIpSgIClXgS8AJGwdjDwLgkIshuExfpV9UjLt2uO/zlokEDgJxKuAM+SJwWrHdlqKmJ0
 ExnEpO4aNUVhjNOCU9QF81LTcTKe9O1jpP++mkmLrmYTFcEWmxK9XrESazZSylae80j8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RAzXtkJdiQRB2L/6Yvgtn5i+vseWAD0+YoNQRRvU2LI=; b=eqHdpCv+65i+Hux8mPJdwreZBF
 GwS7RM8mGrMfbwbL9LIM3oQ3h4YElW19+P/eA3QlNFekC9glg3rUZQjv7eX/MyJPOKTNiOpCrLUQz
 GIxtfaPCVrKvT4XcoODsoGMbIA9iRcyCj8JB9qQ26XGiUxT9tTNwmOn+lQZBtsh5Co9M=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uW5Ou-0007Kl-TN for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 03:41:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E5E5861148;
 Mon, 30 Jun 2025 03:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67393C4CEEB;
 Mon, 30 Jun 2025 03:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751254902;
 bh=csJVVF3ysLWf9LBqtyneSoacKYIJeT/DH5w1ddjGNfw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=PA03pMVew+3YX65tpjwgdFfIs6mL2WK9aPsq9RPuVkwvgHu83XjRiqZqINItjcdAa
 VVlJ3m1UGMwmHv3Iqi+yuBzU6awpY2k78GEbVYo31DxWrqII4yGhNzvUajXerucFTP
 GRlLR+eUdilde3McF+gCFR3KGHqBmsGcQX4q2hgUpGtlXsX1Bp9jbLnF4GdkjSt4RH
 lWfCPcdcNHwdVRuwcey+b5QSmfmQ/2eceMS8Psim6QGelsi/nLcdZUwYd01pISFKbi
 HyqC85lQ2cSZdEeVmMtIIFkFZI9Hy+0Yj5B6+0wBMJxscVoVn+JP9GpynXtHCeQtWa
 yVyANUYeHXE9A==
Message-ID: <3c0d3d19-58b2-4702-b42b-1df7985def74@kernel.org>
Date: Mon, 30 Jun 2025 11:41:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>, linux-f2fs-devel@lists.sourceforge.net
References: <4a227a94-6e8e-4ab3-a6f4-fdebc6419764@kernel.org>
 <20250630025023.3876706-1-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20250630025023.3876706-1-wangzijie1@honor.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/30/25 10:50, wangzijie wrote: >> On 6/24/25 11:59,
 wangzijie
 wrote: >>> To prevent scattered pin block generation, don't allow non-section
 aligned truncation >>> to smaller or equal size on pinne [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uW5Ou-0007Kl-TN
Subject: Re: [f2fs-dev] [PATCH v4 2/2] f2fs: don't allow unaligned
 truncation to smaller/equal size on pinned file
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, feng.han@honor.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/30/25 10:50, wangzijie wrote:
>> On 6/24/25 11:59, wangzijie wrote:
>>> To prevent scattered pin block generation, don't allow non-section aligned truncation
>>> to smaller or equal size on pinned file. But for truncation to larger size, after
>>> commit 3fdd89b452c2("f2fs: prevent writing without fallocate() for pinned files"),
>>> we only support overwrite IO to pinned file, so we don't need to consider
>>> attr->ia_size > i_size case.
>>
>> Zijie, can you take a look generic/494? suspect that it is caused by this change.
>>
>> generic/494 3s ... - output mismatch (see /share/git/fstests/results//generic/494.out.bad)
>>    --- tests/generic/494.out   2025-01-12 21:57:40.279440664 +0800
>>    +++ /share/git/fstests/results//generic/494.out.bad 2025-06-30 10:01:37.000000000 +0800
>>    @@ -2,7 +2,7 @@
>>     Format and mount
>>     Initialize file
>>     Try to truncate
>>    -ftruncate: Text file busy
>>    +ftruncate: Invalid argument
>>     Try to punch hole
>>     fallocate: Text file busy
>>    ...
>>    (Run 'diff -u /share/git/fstests/tests/generic/494.out /share/git/fstests/results//generic/494.out.bad'  to see the entire diff)
>> Ran: generic/494
>> Failures: generic/494
>> Failed 1 of 1 tests
>>
>> Thanks,
> 
> Hi, Chao
> generic/494 swapon file and try to ftruncate.
> 
> Before this change
> swap_acticate:
> set_inode_flag(inode, FI_PIN_FILE)
> 
> ftruncate:
> setattr_prepare
> -inode_newsize_ok
> --return -ETXTBSY for SWAPFILE
> 
> After this change:
> swap_acticate:
> set_inode_flag(inode, FI_PIN_FILE)
> 
> ftruncate: 
> prevent unaligned truncation before setattr_prepare()
> return -EINVAL
> 
> Sorry for this. Maybe I should apply this check after setattr_prepare()? Or do

Check after setattr_prepare() looks fine to me, in addition, can you please add
more comments for the reason why we relocate code there?

Thanks,

> you have some suggestions?
> 
> 
>>>
>>> Signed-off-by: wangzijie <wangzijie1@honor.com>
>>> ---
>>> v4:
>>> - convert sbi first and apply change
>>> ---
>>>  fs/f2fs/file.c | 11 +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>> index 209f43653..4809f0fd6 100644
>>> --- a/fs/f2fs/file.c
>>> +++ b/fs/f2fs/file.c
>>> @@ -1048,6 +1048,17 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
>>>  			!IS_ALIGNED(attr->ia_size,
>>>  			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
>>>  			return -EINVAL;
>>> +		/*
>>> +		 * To prevent scattered pin block generation, we don't allow
>>> +		 * smaller/equal size unaligned truncation for pinned file.
>>> +		 * We only support overwrite IO to pinned file, so don't
>>> +		 * care about larger size truncation.
>>> +		 */
>>> +		if (f2fs_is_pinned_file(inode) &&
>>> +			attr->ia_size <= i_size_read(inode) &&
>>> +			!IS_ALIGNED(attr->ia_size,
>>> +			F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
>>> +			return -EINVAL;
>>>  	}
>>>  
>>>  	err = setattr_prepare(idmap, dentry, attr);
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
