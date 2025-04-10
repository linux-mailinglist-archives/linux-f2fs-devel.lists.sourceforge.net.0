Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDD8A84703
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Apr 2025 16:56:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u2tKY-0003GF-W4;
	Thu, 10 Apr 2025 14:56:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u2tKT-0003G5-Or
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 14:56:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W4P0sINdi5Egbix5JnshAhpO7aUthxKcWn+g3OqXwqw=; b=HmXygyJRM5UzblHedeDLVeaKZZ
 wQAf7u6lWLdMS6ntDg1F4pxWCKCcmojCtRoSu25lR7pLcRXZjA7YEgx68PnBqqYqNZ9okbM8+N7y8
 wiN6DEAEzn03I8LcCmEj249X+BP9qTXJ3pXkpc4RZ4QBQfs4YvrQFfiZNkoD8eWk/dJI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W4P0sINdi5Egbix5JnshAhpO7aUthxKcWn+g3OqXwqw=; b=ZMDWNDiz/BQKZ+QVmXje2fSVQv
 D9riqZyWBZ4wpEdqFWmDpcbSpmuT/wup+hdHa4dPkCj7hi9vgBjRQ+B8tekbigd4i7DUMzvyfv3A9
 v23Z6GxMgtGXe0wUHGSD1hJCmHlnLQaNVGWSegOcy21HNmzsZrKK/rAH+PBReIByd2Tg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u2tKD-0001JE-G2 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Apr 2025 14:56:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 175955C58A0;
 Thu, 10 Apr 2025 14:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB4EC4CEDD;
 Thu, 10 Apr 2025 14:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744296971;
 bh=0NsMhDcrgp+cIgKlL3QAgubMLROzxtZCvy1JwbvY8So=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=n6UU60IUaI4fSUPL/1FhudQI2TVsFCGdnLOEgi8SCfdujEm7/HoyOdMePoLnb0f0e
 BCGTH2lFuU106kHejxaJFHGUdjvmGPU+GNKwhygQTow5wB7n1R+60tLVZm90DNgWl/
 oQEMV014fpqrKzeeQKpqIvPjBMYo88pSaLybD+NDyGPwSdHLd9Xq7w+HoQdWEr0gz0
 IKRaium5Ll/1E1XWhGSTk9waJLys+f7+l4m0f43y9/jxHfVZPImteUmFioretsDpGt
 D0d+zykL9gJyeKklxdlPmx6ADjsim0+CiQsT0PL8AYI2jKIma3ZaZsRCEHyEr2G2sH
 Pxj5W1g8Nmusw==
Message-ID: <b5a8a872-5d62-424d-8af4-fb9a4a29385e@kernel.org>
Date: Thu, 10 Apr 2025 22:56:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Juhyung Park <qkrwngud825@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
References: <CAD14+f3D6iPOBxEgkZxxTsXCfwRKb9ph68JtUk3H9cn8ovLt9w@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAD14+f3D6iPOBxEgkZxxTsXCfwRKb9ph68JtUk3H9cn8ovLt9w@mail.gmail.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/4/10 16:32, Juhyung Park wrote: > Hi everyone. > >
 Besides salvaging @uplinkr's data [1], I figured it's important for us >
 to understand why resize corrupts data in the first place. Yes, I feel the
 same with you. 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: arter97.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u2tKD-0001JE-G2
Subject: Re: [f2fs-dev] Reproducing resize corruption
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
Cc: uplinkr@airmail.cc
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/4/10 16:32, Juhyung Park wrote:
> Hi everyone.
> 
> Besides salvaging @uplinkr's data [1], I figured it's important for us
> to understand why resize corrupts data in the first place.

Yes, I feel the same with you.

> 
> I took some time today to have my laptop's 1.8TiB f2fs partition
> resized slightly and managed to reproduce the data corruption.
> 
> I'm not necessarily sure whether this would be the same symptoms as
> @uplinkr's, but it's probably likely.

Thanks for the quick reproducing, and good catch!

> 
> Here's what I did:
> 1. Remounted to checkpoint=disable
> 2. Create a dm-snapshot of the current root device
> 3. Mount snapshot to replay the log
> 4. Unmount
> 5. Resize sector 487248896 to 486539264

@uplinkr's case is expanding partition, not the same w/ shrink one.

> # ./resize.f2fs -d 3 -s -i /dev/mapper/snap -t 486539264

Also, I didn't see large_nat_bitmap flag in his fsck.log.

> 
> Latest f2fs-tools was used:
> 33c5b9539af2 f2fs_io: add fragread command to evaluate fragmented
> buffer for reads
> 
> This reproduced the mount and fsck failure.
> 
> Mount log:
> [442431.020594] F2FS-fs (dm-2): invalid crc_offset: 0
> [442431.130055] F2FS-fs (dm-2): SIT is corrupted node# 13615201 vs 13616290
> [442431.139684] F2FS-fs (dm-2): Failed to initialize F2FS segment manager (-117)

I tried:

a) resize.f2fs -d 3 -s -i img -t $sectors
b) resize.f2fs -d 3 -s img -t $sectors

Only a) can reproduce the bug, we need to revert -i support for resize
first.

Thanks,

> 
> debugfs & resize log:
> https://arter97.com/.f2fs-20250410/
> 
> The fsck log was way too large, 8.21GiB without "-d" flag and it
> contained many sensitive data, so I'm not uploading it for now.
> 
>  From looking at the dm stats, the fsck also wrote 2138 MiB to the
> snapshot device.
> 
> Chao, can we start from here?
> Thanks.
> 
> [1] https://lore.kernel.org/linux-f2fs-devel/608f23ce-56ef-4faf-bee1-3aa89786ed41@kernel.org/T/#mc628f8f3ca6c73178ffa1716f927755527856d4b



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
