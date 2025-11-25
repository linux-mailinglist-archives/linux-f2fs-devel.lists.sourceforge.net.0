Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEC9C82F91
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Nov 2025 02:05:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I/95ONEh8A68Ai9KcGcP0x78GQYaxWCnKogtVQ+GEcs=; b=XmZlk5SJoAqLsu0/GJZuwMbBGX
	uxZusKuOEB3cOhqVegH2JV8YnW0QBM8SlkMaAks8SCuAVdwmD0uB2gsd9a756I+itqdtCLyQGJ+Om
	kHEFTxAX/V8zPmPkISKyrBFpWoyTeCBoxwDvHtAWiuUZ7b3WMRhh+iaQe11DbF2LJgAg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNhUT-00056r-5P;
	Tue, 25 Nov 2025 01:05:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vNhUR-00056l-V4
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 01:05:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=avP1Ham+0qnP9AybYOvmOA1rteF3KjJhT0f3vlDLY7k=; b=QXDtsNHY32SdYON6RWY9vMKQnC
 AJdTylU4zLCIL9CrXWMSPKrhBbi+nOL7joBwlBLVvhmSubTzutNxqkeYIW/jXMTlOsJJTMQtNbx0P
 yyRC9wnSyO3cbOI7OdPYwGiz7CDTbzrERm9hKGiGivKgtMKYf5Tf8XRWo41CyMoAJ5Fk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=avP1Ham+0qnP9AybYOvmOA1rteF3KjJhT0f3vlDLY7k=; b=Kb6+DMkAbaS/AtYwYpp0u6r7Km
 9VMH5QkF7w122A5EXSukFpXIN0cc/zZ7OcddLJ34ziZoWAtcioJr2pQB1KSXbaKlT3BcDateCt+Z+
 +2lQBF1FNXjdP2dtdMD9/OaqI3xtRCuRHsM/I3zwZX85zSDOYB4GnC7ttd+jqK9/OWB0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vNhUR-0001C8-8o for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Nov 2025 01:05:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 88C0B60010;
 Tue, 25 Nov 2025 01:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11756C4CEF1;
 Tue, 25 Nov 2025 01:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764032696;
 bh=VuDsmo0Ra1r1fxcO69EYqzMwIN4jGcI7/K3Q44VQVdc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=FNa4FGUoyjpiPEt5rjEQcyVx81Xahtmpz2N3TqJ6mjR6h6thEncZ2bjpz0tt++5Lr
 YAb2UCeEWcaIBMc0+0P7ic09FRHjRrlpa/yu5URnERsgsWF+v5tDIq7SxGYjBgACrb
 YY9VVVz/6Z/jYKUISaVL0Bd6b+80gwam+7Z69BD3R8fZgCIlgQKeW7+gPEYXhJG1lI
 uUzmzwEdrp6xpxDIup22/Gz+PChGfEwNkBZVPHkgHUj7vTG72kbLaD7+E7UiWLJYwb
 jgcVMIhtW0R1umvbLNn6zzkKFkirUEKgcMToobn7+BoD+ECakxipxkgmckTMLvM0sQ
 BlfelJK44sHNg==
Message-ID: <091cb1f3-c12f-44f1-8897-0f6745b5bb6f@kernel.org>
Date: Tue, 25 Nov 2025 09:04:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Xiaole He <hexiaole1994@126.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20251119060045.52471-1-hexiaole1994@126.com>
Content-Language: en-US
In-Reply-To: <20251119060045.52471-1-hexiaole1994@126.com>
X-Spam-Score: 0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/19/2025 2:00 PM,
 Xiaole He wrote: > The code was checking
 for a non-existent macro `HDIO_GETGIO` instead of > `HDIO_GETGEO`, which
 caused the ioctl() call to never be executed. > This resulted i [...] 
 Content analysis details:   (0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [172.105.4.254 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vNhUR-0001C8-8o
Subject: Re: [f2fs-dev] [PATCH v1] mkfs.f2fs: fix incorrect start_sector
 detection due to typo in HDIO_GETGEO macro check
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
Cc: jaegeuk@kernel.org, shengyong1@xiaomi.com, daehojeong@google.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/19/2025 2:00 PM, Xiaole He wrote:
> The code was checking for a non-existent macro `HDIO_GETGIO` instead of
> `HDIO_GETGEO`, which caused the ioctl() call to never be executed.
> This resulted in start_sector always being set to 0, even when the
> partition actually starts at a different sector (e.g., 2048).
> 
> This bug affects:
> - lib/libf2fs.c: get_device_info() function (lines 967, 1076)
> - tools/fibmap.c: stat_bdev() function (lines 91, 108)
> 
> Reproducer:
> 1. Create a partition starting at sector 2048:
>     # parted -s /dev/sdb mklabel gpt
>     # parted -s /dev/sdb mkpart primary 2048s 32GiB
> 
> 2. Verify the partition start sector:
>     # cat /sys/block/sdb/sdb1/start
>     2048
> 
> 3. Format with f2fs-tools (before fix) and verify incorrect calculation:
>     # mkfs.f2fs /dev/sdb1
>     # Info: zone aligned segment0 blkaddr: 512
> 
>     The calculation happens in
>     mkfs/f2fs_format.c:f2fs_prepare_super_block():
> 
>     With default values:
>     - blk_size_bytes = 4096
>     - c.blks_per_seg = 512
>     - c.segs_per_sec = 1
>     - c.secs_per_zone = 1
>     - zone_size_bytes = blk_size_bytes * c.secs_per_zone
>                         * c.segs_per_sec * c.blks_per_seg
>                       = 4096 * 1 * 1 * 512 = 2,097,152 bytes (2MB)
>     - alignment_bytes = zone_size_bytes (for non-zoned or single device)
> 
>     With c.start_sector = 0 (bug case):
>     - zone_align_start_offset
>         = ((c.start_sector * DEFAULT_SECTOR_SIZE +
>            2 * F2FS_BLKSIZE + alignment_bytes - 1) /
>            alignment_bytes * alignment_bytes) -
>            (c.start_sector * DEFAULT_SECTOR_SIZE)
>         = ((0 * 512 + 2 * 4096 + 2,097,152 - 1) /
>            2,097,152 * 2,097,152) - (0 * 512)
>         = ((8,192 + 2,097,152 - 1) / 2,097,152 * 2,097,152) - 0
>         = 2,097,152 - 0 = 2,097,152 bytes (2MB)
>     - segment0_blkaddr = zone_align_start_offset / blk_size_bytes
>         = 2,097,152 / 4,096 = 512 blocks
> 
>     This matches the output "segment0 blkaddr: 512".
> 
>     With c.start_sector = 2048 (correct case):
>     - zone_align_start_offset
>         = ((2048 * 512 + 2 * 4096 + 2,097,152 - 1) /
>            2,097,152 * 2,097,152) - (2048 * 512)
>         = ((1,048,576 + 8,192 + 2,097,152 - 1) /
>            2,097,152 * 2,097,152) - 1,048,576
>         = 2,097,152 - 1,048,576 = 1,048,576 bytes (1MB)
>     - segment0_blkaddr = zone_align_start_offset / blk_size_bytes
>         = 1,048,576 / 4,096 = 256 blocks
> 
> 4. Confirm the bug with gdb:
>     So the correct output should be "segment0 blkaddr: 256", not 512.
> 
>     # gdb --args mkfs.f2fs /dev/sdb1
>     (gdb) b lib/libf2fs.c:1075
>     (gdb) run
>     1075                    if (i == 0) {
>     (gdb) l
>     1075                    if (i == 0) {
>     1076    #ifdef HDIO_GETGIO
>     1077                            if (ioctl(fd, HDIO_GETGEO, &geom) < 0)
>     1078                                    c.start_sector = 0;
>     1079                            else
>     1080                                    c.start_sector = geom.start;
>     1081    #else
>     1082                            c.start_sector = 0;
>     1083    #endif
>     1084                    }
>     (gdb) n
>     1082                            c.start_sector = 0;
>     # At line 1076: #ifdef HDIO_GETGIO (bug - this macro doesn't exist)
>     # The ioctl() call at line 1077 is skipped, and execution goes
>     # directly to line 1082, setting c.start_sector = 0
> 
> After fix:
>     mkfs.f2fs output:
>     Info: zone aligned segment0 blkaddr: 256
> 
>     gdb output:
>     (gdb) p c.start_sector
>     $1 = 2048
> 
>     The ioctl() correctly retrieves the partition start sector (2048),
>     and zone_align_start_offset is calculated correctly, resulting in
>     segment0_blkaddr = 256.
> 
> Fixes: 43bb7b6c99fa ("f2fs-tools: build binaries in Mac")
> Signed-off-by: Xiaole He <hexiaole1994@126.com>

Nice catch and analysis!

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
