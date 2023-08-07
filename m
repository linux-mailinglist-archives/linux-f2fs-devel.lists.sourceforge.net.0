Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5524D771828
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Aug 2023 04:08:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qSpfG-0005Ad-BB;
	Mon, 07 Aug 2023 02:08:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qSpfE-0005AX-Nz
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 02:08:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6iNu/rZqsq2967/klR5CnER+WTCTsGQW6Fy09F65b4M=; b=CZ5x5SnwYgHAopgAjnE4XsxtzM
 eu/Q55QvT0m6Wy1Uzfqa1R2ZFcwCb1nMHaQNfTIZobQeIYr0k1mGPZNDF3hde3XZvnsvW0kC22hTp
 JwO8+neJZMRwo1JKD+ClKNsBzY+tcNKdM4zc4zSCMf0smKIWRg+XTVK66DQ8mM33gWB0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6iNu/rZqsq2967/klR5CnER+WTCTsGQW6Fy09F65b4M=; b=KkMmGGJsaCHOUE//0nQJ5B9vYV
 Ax8fRN6V3aeHGvRJcZ7g1H+AwDft3x7cDcLLrCp0m2eezL+baG5n3Nsiu+fnUBUWRcNUqN3vyR6/i
 u0lFbvfxQJy/XC5S2B8VOOFNFj2rw+tIa1NpYLWhbSZO1PO4dZhVSdAqdGcnOiEZFKfU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qSpfC-00FWqG-1K for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 02:08:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 72235612EC;
 Mon,  7 Aug 2023 02:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0EEC433C7;
 Mon,  7 Aug 2023 02:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691374079;
 bh=vEzRQjXv1ttsp5vdYXUk/AoSYOpDU/Q7NEu1H1UZQq0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hCsKvEeI+ES1k2p4uCYKudBehFAa7Mta/Px2N9VqjFRT4ZjKOyZpySoAlwJV8n9Os
 aoPng/Jrj6vmPom/o9mwXKXsV1UZOmEezUYtigJhF4Xwq6oUBHk3+kaxlC5bSMt+pr
 7hL9cx2SoxFx1hQ8IKMEXKoUMjfAG3ttwr/I9bEY4FwrVTVhZE3knX70I4Hn/crfU5
 9wFn5+tMFBgikj2pm/gg4bHBYiXJ1EauidipdUexDv3MF8SpCE4dji2F3z6HgHo5g4
 xyrg2u0ZsX1MdofIRKqs1rZn7/Yu5Q46mrfphgZSYBU3Cg48fOAHmrkUKUU6Iau+mN
 w+XOdhDHY/Dyw==
Message-ID: <c3cf952f-7011-a597-57a0-756cbc5b91ce@kernel.org>
Date: Mon, 7 Aug 2023 10:07:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
References: <20230523123521.67656-1-chao@kernel.org>
 <fafcfeosil5yqwn2wcdx33im2mq4xkejw6bx7h2in3ay5h6znj@facx4rrg4p65>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <fafcfeosil5yqwn2wcdx33im2mq4xkejw6bx7h2in3ay5h6znj@facx4rrg4p65>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/8/4 17:43, Shinichiro Kawasaki wrote: > On May 23,
 2023 / 20:35, Chao Yu wrote: >> Use sbi->log_sectors_per_block to clean up
 below calculated one: >> >> unsigned int log_sectors_per_block = s [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qSpfC-00FWqG-1K
Subject: Re: [f2fs-dev] [PATCH] f2fs: clean up w/ sbi->log_sectors_per_block
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
Cc: "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/8/4 17:43, Shinichiro Kawasaki wrote:
> On May 23, 2023 / 20:35, Chao Yu wrote:
>> Use sbi->log_sectors_per_block to clean up below calculated one:
>>
>> unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
> 
> Hello Chao,
> 
> When I ran workloads on f2fs using v6.5-rcX with fixes [1][2] and a zoned block
> devices with 4kb logical block size, I observe mount failure as follows. When
> I revert this commit, the failure goes away.
> 
> [  167.781975][ T1555] F2FS-fs (dm-0): IO Block Size:        4 KB
> [  167.890728][ T1555] F2FS-fs (dm-0): Found nat_bits in checkpoint
> [  171.482588][ T1555] F2FS-fs (dm-0): Zone without valid block has non-zero write pointer. Reset the write pointer: wp[0x1300,0x8]
> [  171.496000][ T1555] F2FS-fs (dm-0): (0) : Unaligned zone reset attempted (block 280000 + 80000)
> [  171.505037][ T1555] F2FS-fs (dm-0): Discard zone failed:  (errno=-5)
> 
> The patch replaced "sbi->log_blocksize - SECTOR_SHIFT" with
> "sbi->log_sectors_per_block". However, I think these two are not equal when the
> device has 4k logical block size. The former uses Linux kernel sector size 512
> byte. The latter use 512b sector size or 4kb sector size depending on the
> device. mkfs.f2fs obtains logical block size via BLKSSZGET ioctl from the device
> and reflects it to the value sbi->log_sector_size_per_block. This causes
> unexpected write pointer calculations in check_zone_write_pointer(). This
> resulted in unexpected zone reset and the mount failure.
> 
> I think this patch needs revert. What do you think?

Hi Shinichiro,

Oh, my bad, I think we need to revert that patch.

Thanks for the report! :)

Thanks,

> 
> [1] https://lkml.kernel.org/linux-f2fs-devel/20230711050101.GA19128@lst.de/
> [2] https://lore.kernel.org/linux-f2fs-devel/20230804091556.2372567-1-shinichiro.kawasaki@wdc.com/


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
