Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF46C0D073
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Oct 2025 11:55:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKTvBHTM3IB/ONdIOT3Y/AHV2f4WGXphYtz4R8N/0rU=; b=WtwVqxc0gbWvtAPYIaggI6BQ5I
	SYBdCmsV7o0VA08K66uCBX/PXFHxd745wQ6NlXNzWoIi3tpCyM7DHGWX3pRt1ipmDxzGZr/RyYKad
	DAWG9UDPQx/twsRFQc0WUDcaEAfg9fF805Ww9CBEURvV2+8jYS+1uP/wKYedYb0DJT/Q=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDKsm-0007bd-6w;
	Mon, 27 Oct 2025 10:55:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vDKsk-0007bQ-Rt
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 10:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gBJ2MNR5vaqvTm7zqQZzpsObjTB1cFoLkls0yaDEOps=; b=kB7TIRAjtCTiiVgFka/gH/PVGM
 PKwJ4xkFMdpS1NqXaYQ2hIKLkQnCqTvG/BrGMTyjvFLhry5PW7AnLjP1C6vktm1iay1WuZcScGCe3
 YENEPZYsR8Pw4riVz6+QXPUSeZGJ5NcM0JhcELmzfz+t/F10/eWcN4Tem3PjGjQsTemE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gBJ2MNR5vaqvTm7zqQZzpsObjTB1cFoLkls0yaDEOps=; b=VDRVjcFlcKb327p3zAGU6sTHi7
 oEQ//r3F5dWY0KTlJT0gva1jPcvLaucnWhc2U44afeIwnX5E5SmLayqAzvkDAfA2MnPNqmR3piAiF
 shLaphnYaHmj13rMN7tPPOzGx7TDP9r+u3iL17GC2lq1yyyapctdTsxz/2ibBzNi6MiY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vDKsl-0002oW-4Y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 10:55:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A9A3440557;
 Mon, 27 Oct 2025 10:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0A4C4CEF1;
 Mon, 27 Oct 2025 10:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761562517;
 bh=3fwo38ms8nGzEG6hFj5mAdcLcwwXqYE04olV9vcAGWw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=X1i3VFp9/ehOiIEMThFMBK4kV0y2sBGaPPEBW11EW7n7ZZmLM/pI81R279hQroNuU
 VBbFPJy8Jep5oTFNw8YqeIz5zCnRnoumCQ1VJlSBVUqPXRcsKdvVC2gfV3e/3IoZZv
 bqmG/U4Jf/pTL+X8ROU/Pk7GhKpAn1g+73CnNe05GSLtE7SInAGFq1Ql029CXAE3PT
 X8Wg/jZTZYXPR3hI67KFl6EVXBO6S+fbjkqAwLHsfhD477CQ7HMqD8Os8XZaHRs+JP
 4FY1/yzMX/79IXX0YlIUYk9YMpJ320q23QXzSqxZAMLcRoYmku3WiqG/NAH+8UAosO
 /SlsF1pIJ6f4A==
Message-ID: <e1771667-d801-4778-9f95-d6dc722584f0@kernel.org>
Date: Mon, 27 Oct 2025 18:55:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Xiaole He <hexiaole1994@126.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20251023035416.7943-1-hexiaole1994@126.com>
 <20251027092341.5011-1-hexiaole1994@126.com>
Content-Language: en-US
In-Reply-To: <20251027092341.5011-1-hexiaole1994@126.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/27/25 17:23, Xiaole He wrote: > The age extent cache
 uses last_blocks (derived from > allocated_data_blocks) to determine data
 age. However, there's a > conflict between the deletion > marker (l [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vDKsl-0002oW-4Y
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix age extent cache insertion skip
 on counter overflow
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/27/25 17:23, Xiaole He wrote:
> The age extent cache uses last_blocks (derived from
> allocated_data_blocks) to determine data age. However, there's a
> conflict between the deletion
> marker (last_blocks=0) and legitimate last_blocks=0 cases when
> allocated_data_blocks overflows to 0 after reaching ULLONG_MAX.
> 
> In this case, valid extents are incorrectly skipped due to the
> "if (!tei->last_blocks)" check in __update_extent_tree_range().
> 
> This patch fixes the issue by:
> 1. Reserving ULLONG_MAX as an invalid/deletion marker
> 2. Limiting allocated_data_blocks to range [0, ULLONG_MAX-1]
> 3. Using F2FS_EXTENT_AGE_INVALID for deletion scenarios
> 4. Adjusting overflow age calculation from ULLONG_MAX to (ULLONG_MAX-1)
> 
> Reproducer (using a patched kernel with allocated_data_blocks
> initialized to ULLONG_MAX - 3 for quick testing):
> 
> Step 1: Mount and check initial state
>   # dd if=/dev/zero of=/tmp/test.img bs=1M count=100
>   # mkfs.f2fs -f /tmp/test.img
>   # mkdir -p /mnt/f2fs_test
>   # mount -t f2fs -o loop,age_extent_cache /tmp/test.img /mnt/f2fs_test
>   # cat /sys/kernel/debug/f2fs/status | grep -A 4 "Block Age"
>   Allocated Data Blocks: 18446744073709551612 # ULLONG_MAX - 3
>   Inner Struct Count: tree: 1(0), node: 0
> 
> Step 2: Create files and write data to trigger overflow
>   # touch /mnt/f2fs_test/{1,2,3,4}.txt; sync
>   # cat /sys/kernel/debug/f2fs/status | grep -A 4 "Block Age"
>   Allocated Data Blocks: 18446744073709551613 # ULLONG_MAX - 2
>   Inner Struct Count: tree: 5(0), node: 1
> 
>   # dd if=/dev/urandom of=/mnt/f2fs_test/1.txt bs=4K count=1; sync
>   # cat /sys/kernel/debug/f2fs/status | grep -A 4 "Block Age"
>   Allocated Data Blocks: 18446744073709551614 # ULLONG_MAX - 1
>   Inner Struct Count: tree: 5(0), node: 2
> 
>   # dd if=/dev/urandom of=/mnt/f2fs_test/2.txt bs=4K count=1; sync
>   # cat /sys/kernel/debug/f2fs/status | grep -A 4 "Block Age"
>   Allocated Data Blocks: 18446744073709551615 # ULLONG_MAX
>   Inner Struct Count: tree: 5(0), node: 3
> 
>   # dd if=/dev/urandom of=/mnt/f2fs_test/3.txt bs=4K count=1; sync
>   # cat /sys/kernel/debug/f2fs/status | grep -A 4 "Block Age"
>   Allocated Data Blocks: 0 # Counter overflowed!
>   Inner Struct Count: tree: 5(0), node: 4
> 
> Step 3: Trigger the bug - next write should create node but gets skipped
>   # dd if=/dev/urandom of=/mnt/f2fs_test/4.txt bs=4K count=1; sync
>   # cat /sys/kernel/debug/f2fs/status | grep -A 4 "Block Age"
>   Allocated Data Blocks: 1
>   Inner Struct Count: tree: 5(0), node: 4
> 
>   Expected: node: 5 (new extent node for 4.txt)
>   Actual: node: 4 (extent insertion was incorrectly skipped due to
>   last_blocks = allocated_data_blocks = 0 in __get_new_block_age)
> 
> After this fix, the extent node is correctly inserted and node count
> becomes 5 as expected.
> 
> Fixes: 71644dff4811 ("f2fs: add block_age-based extent cache")
> Cc: stable@kernel.org
> Signed-off-by: Xiaole He <hexiaole1994@126.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
