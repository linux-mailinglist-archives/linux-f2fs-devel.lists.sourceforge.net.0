Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FA074E253
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Jul 2023 01:51:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qJ0fV-0003se-Uw;
	Mon, 10 Jul 2023 23:51:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dlemoal@kernel.org>) id 1qJ0fD-0003sR-Oo
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Jul 2023 23:51:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AgXV5UxhscyQwCpHdehaxVslXSIfELQ8DCS90tpzBtM=; b=UA99ZgEGL1xKQLnHJ6BCAzYWjL
 wG+qNrKkYmfDmInU01szUUO8ueRWU2BDMsjT6uAVhz+KRUhniKHJkcDDv0QdJnW0HpEZa9o7NoqLO
 jBkUA2ZEqIlFz3CJXUYZrDkOUotj88/EK2PepvdShnfMk/skWJdqIK/LrkxyWVe97w0Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AgXV5UxhscyQwCpHdehaxVslXSIfELQ8DCS90tpzBtM=; b=ULOoXdgfAtEes0Ql2+PPtr8P7Z
 4ZAt9jUyBJiOdvmv7LN0hb9Xhr653XpPmDIbFqZ34+nfzVuQUXueVjin4DhW850t1QdR4jRpgPV/A
 vsrOZCTJj4dLkAZkpoPdKbE1z59gyh8NmJW3PIZbNFE1OFk5fTnoYche3SqGGH45vhS4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qJ0f9-003lk0-Ch for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Jul 2023 23:51:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 01B0861142;
 Mon, 10 Jul 2023 23:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A040AC433C8;
 Mon, 10 Jul 2023 23:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689033081;
 bh=QZ/OgiG2raDoL7ZOlHv/LABbSHSVpJTzkYqGY6uzsN8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EJbwtB1wOXlxPYcI9hm8ktAp3JbWGcoIFQtmpXZ0tsR/qSpGC3Qg+8dSocNerPgTT
 jzVGy4sShIEBIYn8FqyJfybGYCaawjIhKm4kzDdJBCNN9jfiYtZWknwqiOFFY6QRGT
 7nFrfK/LL+9F5CjtcI6rIqi7lwwv5MkJUgPwOihbM2ezJm2FiCIlbCVdM6mdpH2Dc1
 YT4MVjIlOXFPR5QAAQRz+3Osh9ZEHn2yWKUZ4v1zGZcfvAsZMDrcrCpQjJep1O3GdW
 5qehznvUrjBBuwGgLmGUR5zSX0CZzjWR2MKpFHoX8vXuPTD+Zv7LPmqkmASvHunZ70
 i71EGimJYhOeg==
Message-ID: <c0883104-8472-91b1-b9ad-ec3114bd166c@kernel.org>
Date: Tue, 11 Jul 2023 08:51:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, Christoph Hellwig <hch@lst.de>
References: <20230707094028.107898-1-hch@lst.de> <ZKx2jVONy35B0/S1@google.com>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <ZKx2jVONy35B0/S1@google.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/11/23 06:22, Jaegeuk Kim wrote: > Hit a kernel panic
 with single device. > > [ 148.003511] BUG: kernel NULL pointer dereference,
 address: 0000000000000058 > [ 148.005630] #PF: supervisor read acc [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qJ0f9-003lk0-Ch
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't reopen the main block device in
 f2fs_scan_devices
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
Cc: linux-block@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/11/23 06:22, Jaegeuk Kim wrote:
> Hit a kernel panic with single device.
> 
> [  148.003511] BUG: kernel NULL pointer dereference, address: 0000000000000058
> [  148.005630] #PF: supervisor read access in kernel mode
> [  148.008179] #PF: error_code(0x0000) - not-present page
> [  148.010593] PGD 0 P4D 0
> [  148.011867] Oops: 0000 [#1] PREEMPT SMP PTI
> [  148.014619] CPU: 4 PID: 1905 Comm: umount Tainted: G           OE      6.5.0-rc1-custom #19
> [  148.020358] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [  148.024967] RIP: 0010:destroy_device_list+0x18/0x90 [f2fs]
> [  148.027688] Code: 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 55 48 89 e5 41 55 41 54 49 89 fc 53 48 8b 87 40 0b 00 00 <48> 8b 78 58 e8 cf 3e 28 cf 41 83 bc 24 3c 0b 00 00 01 7e 4a 41 bd
> [  148.038517] RSP: 0018:ffffa24e80be3d28 EFLAGS: 00010202
> [  148.040978] RAX: 0000000000000000 RBX: ffff8bd5503bc800 RCX: 0000000080080006
> [  148.044292] RDX: 0000000080080007 RSI: ffffdcfe844da200 RDI: ffff8bd55368d000
> [  148.047688] RBP: ffffa24e80be3d40 R08: ffff8bd553688000 R09: 0000000080080006
> [  148.051317] R10: ffff8bd5580d4e80 R11: ffff8bd57bd00000 R12: ffff8bd55368d000
> [  148.054981] R13: 0000000000000000 R14: ffff8bd55368db18 R15: 0000000000000000
> [  148.058391] FS:  00007fc247124800(0000) GS:ffff8bd57bd00000(0000) knlGS:0000000000000000
> [  148.062549] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  148.065641] CR2: 0000000000000058 CR3: 0000000001120004 CR4: 0000000000370ee0
> [  148.069178] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  148.072651] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [  148.076346] Call Trace:
> [  148.077641]  <TASK>
> [  148.078839]  ? show_regs+0x6a/0x80
> [  148.080475]  ? __die+0x25/0x70
> [  148.082045]  ? page_fault_oops+0x160/0x480
> [  148.084381]  ? check_preempt_wakeup+0x192/0x2f0
> [  148.086840]  ? do_user_addr_fault+0x313/0x680
> [  148.088999]  ? exc_page_fault+0x79/0x180
> [  148.090899]  ? asm_exc_page_fault+0x27/0x30
> [  148.093114]  ? destroy_device_list+0x18/0x90 [f2fs]
> [  148.095448]  f2fs_put_super+0x211/0x410 [f2fs]
> [  148.097871]  ? fscrypt_destroy_keyring+0x110/0x170
> [  148.100313]  generic_shutdown_super+0x84/0x1b0
> [  148.102582]  kill_block_super+0x24/0x50
> [  148.104697]  kill_f2fs_super+0x83/0x100 [f2fs]
> [  148.106974]  deactivate_locked_super+0x35/0xb0
> [  148.109978]  deactivate_super+0x44/0x50
> [  148.112235]  cleanup_mnt+0x105/0x160
> [  148.114407]  __cleanup_mnt+0x12/0x20
> [  148.116680]  task_work_run+0x61/0x90
> [  148.118961]  exit_to_user_mode_prepare+0x18f/0x1a0
> [  148.121812]  syscall_exit_to_user_mode+0x26/0x50
> [  148.124595]  do_syscall_64+0x69/0x90
> [  148.126616]  ? exc_page_fault+0x8a/0x180
> [  148.128742]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> [  148.131521] RIP: 0033:0x7fc246f24a7b
> 
> On 07/07, Christoph Hellwig wrote:
>> f2fs_scan_devices reopens the main device since the very beginning, which
>> has always been useless, and also means that we don't pass the right
>> holder for the reopen, which now leads to a warning as the core super.c
>> holder ops aren't passed in for the reopen.
>>
>> Fixes: 3c62be17d4f5 ("f2fs: support multiple devices")
>> Fixes: 0718afd47f70 ("block: introduce holder ops")
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> ---
>>  fs/f2fs/super.c | 20 ++++++++------------
>>  1 file changed, 8 insertions(+), 12 deletions(-)
>>
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index ca31163da00a55..8d11d4a5ec331d 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -1560,7 +1560,8 @@ static void destroy_device_list(struct f2fs_sb_info *sbi)
>>  {
>>  	int i;
>>  
>> -	for (i = 0; i < sbi->s_ndevs; i++) {
> 
> #ifdef CONFIG_BLK_DEV_ZONED
> 
>> +	kvfree(FDEV(0).blkz_seq);
> 
> #endif

This should not be needed since for the !CONFIG_BLK_DEV_ZONED case,
FDEV(0).blkz_seq should always be NULL. However, what I think may be missing is
"FDEV(0).blkz_seq = NULL;" after the kvfree() call. No ?

> 
>> +	for (i = 1; i < sbi->s_ndevs; i++) {
>>  		blkdev_put(FDEV(i).bdev, sbi->sb->s_type);
>>  #ifdef CONFIG_BLK_DEV_ZONED
>>  		kvfree(FDEV(i).blkz_seq);
>> @@ -4190,16 +4191,12 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
>>  	sbi->aligned_blksize = true;
>>  
>>  	for (i = 0; i < max_devices; i++) {
>> -
>> -		if (i > 0 && !RDEV(i).path[0])
>> +		if (i == 0)
>> +			FDEV(0).bdev = sbi->sb->s_bdev;
>> +		else if (!RDEV(i).path[0])
>>  			break;
>>  
>> -		if (max_devices == 1) {
>> -			/* Single zoned block device mount */
>> -			FDEV(0).bdev =
>> -				blkdev_get_by_dev(sbi->sb->s_bdev->bd_dev, mode,
>> -						  sbi->sb->s_type, NULL);
>> -		} else {
>> +		if (max_devices > 1) {
>>  			/* Multi-device mount */
>>  			memcpy(FDEV(i).path, RDEV(i).path, MAX_PATH_LEN);
>>  			FDEV(i).total_segments =
>> @@ -4215,10 +4212,9 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
>>  				FDEV(i).end_blk = FDEV(i).start_blk +
>>  					(FDEV(i).total_segments <<
>>  					sbi->log_blocks_per_seg) - 1;
>> +				FDEV(i).bdev = blkdev_get_by_path(FDEV(i).path,
>> +					mode, sbi->sb->s_type, NULL);
>>  			}
>> -			FDEV(i).bdev = blkdev_get_by_path(FDEV(i).path, mode,
>> -							  sbi->sb->s_type,
>> -							  NULL);
>>  		}
>>  		if (IS_ERR(FDEV(i).bdev))
>>  			return PTR_ERR(FDEV(i).bdev);
>> -- 
>> 2.39.2

-- 
Damien Le Moal
Western Digital Research



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
