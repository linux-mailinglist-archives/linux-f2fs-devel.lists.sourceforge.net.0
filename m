Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E4ED193B3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 14:59:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvGrffqoK7nBZ/qEj3K9vrKRXVixDQZ+/ovDmXWPRuc=; b=UNpOUX5LjFsmXWyaR3F830LDUc
	BkjEgY2+HKdHzW/FbXGGBNabO1GveEL1OQeOiMRGVnjW2LW0RdveQr/aQqHn9N+MhNnoYgWMX452y
	aNVufb+7dHY+WqYhXg6zI4LAJPgKRl/83NwQ51g87g2TqHgU1q5uid63YOA3yI9C85jg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfevL-0003hU-MK;
	Tue, 13 Jan 2026 13:59:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cel@kernel.org>) id 1vfevK-0003hL-Ch
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 13:59:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=68V9MHBKSN7hgkCrGHCSzUZLgZk6KvJoHSztuC6/ltU=; b=d+XqKG/BRL+i6oNDV2STKAhX7T
 DMPQ+XtiUCaJHB69anXBT1R5z8Q+1EEWu91dS1e7ZlQAmEXxQofNQl1oqOTPPS7E+OJhVMOSFBMQX
 MbRS/G3Rhm4BGZGmG+p94yHYDhFYM0kmtyGpXdFz/mf4sAhrnReWuG82S+dHl0whg3sI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=68V9MHBKSN7hgkCrGHCSzUZLgZk6KvJoHSztuC6/ltU=; b=Img2aGa8Te7O+s3Wx/7Aax24iQ
 YsGDTj98hWpK2c3SVeY9ZT/BsTCfss2ewxRQw6uwUl3FZDkNAEjH9bx2FjHPv/gBgleNnuwQoaghq
 VOXrvtz7Rkce2G3JHPDf0fRxB8FNRQvxFuhZKSejutcg1Lh7QPgGXbDPJjkG7Saf9r9E=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfevJ-00059u-S6 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 13:59:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3346560017;
 Tue, 13 Jan 2026 13:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9631AC116C6;
 Tue, 13 Jan 2026 13:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768312734;
 bh=Mdtt2cEJZpAolbsyohBBtRFFKdaOQF7vilJVbgvlUGo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IHCBTIj9UNV7zFILfsvU9XgyRBUFUE6V1XXitdJsXV4An6QT0u9i2rDGeRj289vt4
 WkiQzfDRs5U6wYFLdweectESwFc4BRcilU+itHS6DCLfB7DAhWRozee85uqhuEjqlF
 Prv9Hfrz6iNh61KNTwvjFiJs3keHSxpck+Gwzx2D8YrMgW+dctCS7kPQk2sR+wY3Ye
 LVdXdKWUHDiQx93VDVxTV8xlHdDI5QYAJcuuO/W8J/CHNXaaxZsTvPy16ArXawSW3w
 k9kverbXLU/aJEA2C9xjImlMARaL5kA/oeRmR1ID5IDE6jpqCg9Q35w4USUFRQJJvu
 tdxB439zhtF1w==
Message-ID: <774aac29-837d-4692-b744-e168d969a221@kernel.org>
Date: Tue, 13 Jan 2026 08:58:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Brauner <brauner@kernel.org>
References: <20260112174629.3729358-1-cel@kernel.org>
 <20260113-vorort-pudding-ef90f426d5cf@brauner>
Content-Language: en-US
Organization: kernel.org
In-Reply-To: <20260113-vorort-pudding-ef90f426d5cf@brauner>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/13/26 4:04 AM, Christian Brauner wrote: > On Mon, Jan
 12, 2026 at 12:46:13PM -0500,
 Chuck Lever wrote: >> From: Chuck Lever <chuck.lever@oracle.com>
 >> >> Following on from >> >> https://lore.ker [...] 
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
X-Headers-End: 1vfevJ-00059u-S6
Subject: Re: [f2fs-dev] [PATCH v3 00/16] Exposing case folding behavior
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
From: Chuck Lever via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chuck Lever <cel@kernel.org>
Cc: Jan Kara <jack@suse.cz>, pc@manguebit.org, yuezhang.mo@sony.com,
 cem@kernel.org, almaz.alexandrovich@paragon-software.com,
 adilger.kernel@dilger.ca, linux-cifs@vger.kernel.org, sfrench@samba.org,
 slava@dubeyko.com, linux-ext4@vger.kernel.org, linkinjeon@kernel.org,
 sprasad@microsoft.com, frank.li@vivo.com, vira@so61, ronniesahlberg@gmail.com,
 glaubitz@physik.fu-berlin.de, jaegeuk@kernel.org, hirofumi@mail.parknet.co.jp,
 linux-nfs@vger.kernel.org, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, Chuck Lever <chuck.lever@oracle.com>,
 hansg@kernel.org, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 sj1557.seo@samsung.com, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/13/26 4:04 AM, Christian Brauner wrote:
> On Mon, Jan 12, 2026 at 12:46:13PM -0500, Chuck Lever wrote:
>> From: Chuck Lever <chuck.lever@oracle.com>
>>
>> Following on from
>>
>> https://lore.kernel.org/linux-nfs/20251021-zypressen-bazillus-545a44af57fd@brauner/T/#m0ba197d75b7921d994cf284f3cef3a62abb11aaa
>>
>> I'm attempting to implement enough support in the Linux VFS to
>> enable file services like NFSD and ksmbd (and user space
>> equivalents) to provide the actual status of case folding support
>> in local file systems. The default behavior for local file systems
>> not explicitly supported in this series is to reflect the usual
>> POSIX behaviors:
>>
>>   case-insensitive = false
>>   case-preserving = true
>>
>> The case-insensitivity and case-preserving booleans can be consumed
>> immediately by NFSD. These two booleans have been part of the NFSv3
>> and NFSv4 protocols for decades, in order to support NFS clients on
>> non-POSIX systems.
>>
>> Support for user space file servers is why this series exposes case
>> folding information via a user-space API. I don't know of any other
>> category of user-space application that requires access to case
>> folding info.
> 
> This all looks good to me.
> Just one question: This reads like you are exposing the new file attr
> bits via userspace but I can only see changes to the kernel internal
> headers not the uapi headers. So are you intentionally not exposing this
> as a new uapi extension to file attr or is this an accident?

The intention is to expose the new bits to user space. IIRC those got
removed from uapi headers when I converted from using statx. I can fix
that up and post a v4.


-- 
Chuck Lever


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
