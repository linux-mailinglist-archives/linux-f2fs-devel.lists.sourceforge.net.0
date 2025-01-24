Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 672A5A1B016
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jan 2025 06:50:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tbCaU-0005SO-BP;
	Fri, 24 Jan 2025 05:50:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <huangjianan@xiaomi.com>) id 1tbCaT-0005SI-6E
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Jan 2025 05:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nwn6uAe8yJDakh+ZfOfwxNaIB6ALmLYAneoh77MCOt8=; b=CmW4sG4FulTyt0x312p7uOQ9ae
 vINAw99SQ72XYRmSfeAF8UHFqo62lm9ZvwkCTRzY+ZdGaqnvZYQlJo5MM95lZhWhbQoWNGn5SFvwk
 m75CK1hBzZxh07wsWDSzL+87qS5CBV1rwKAB5lDGPeg3E1Ug2it8XviyjFgwXoyUJn5s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Nwn6uAe8yJDakh+ZfOfwxNaIB6ALmLYAneoh77MCOt8=; b=F7Ly2MG/zsmAyI86sTEM/fQG8B
 tZ1h5ujKjRwKAq1N/y9Xgo7EBYA3YzfLV9MKcdXQpBOYdfBsyYvUSZlFHBvJgwdVVWkBNSzB078OY
 9axb1rBgrHdaXJY92gbDn+0Rai5/BfIcDgF77q7PNVyt0DMttITcJMggfpb27p3oPC3w=;
Received: from outboundhk.mxmail.xiaomi.com ([118.143.206.90])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1tbCaR-0004zY-9e for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Jan 2025 05:50:36 +0000
X-CSE-ConnectionGUID: tWjibYiOTk6aLPbsSBex1A==
X-CSE-MsgGUID: x5hi7014RHmgbTzcvvlo9A==
X-IronPort-AV: E=Sophos;i="6.13,230,1732550400"; d="scan'208";a="105606596"
To: Chao Yu <chao@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "jaegeuk@kernel.org"
 <jaegeuk@kernel.org>
Thread-Topic: [External Mail]Re: [PATCH v2] f2fs: fix inconsistent dirty state
 of atomic file
Thread-Index: AQHbbgJh6eh2bS+9J025FCjnEEUdb7Mk25GAgAAKAYA=
Date: Fri, 24 Jan 2025 05:50:22 +0000
Message-ID: <1f2255ed-64db-4989-918a-0a38362e8eb1@xiaomi.com>
References: <20250123071417.253019-1-huangjianan@xiaomi.com>
 <20250124015042.273336-1-huangjianan@xiaomi.com>
 <a9b641d6-b442-4e31-9da2-a6ce4dc6f7c4@kernel.org>
In-Reply-To: <a9b641d6-b442-4e31-9da2-a6ce4dc6f7c4@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.8.166]
Content-ID: <05D2CFE304C1104996506DF00515FFAB@xiaomi.com>
MIME-Version: 1.0
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/1/24 13:14, Chao Yu wrote: > > On 1/24/25 09:50,
 Jianan
 Huang wrote: >> When testing the atomic write fix patches, the f2fs_bug_on
 was >> triggered as below: >> >> [ cut here ]---- [...] 
 Content analysis details:   (0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [118.143.206.90 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [118.143.206.90 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [118.143.206.90 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.9 SPF_HELO_SOFTFAIL      SPF: HELO does not match SPF record (softfail)
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tbCaR-0004zY-9e
Subject: Re: [f2fs-dev] [External Mail]Re: [PATCH v2] f2fs: fix inconsistent
 dirty state of atomic file
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
From: Huang Jianan via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Huang Jianan <huangjianan@xiaomi.com>
Cc: "daehojeong@google.com" <daehojeong@google.com>,
 "jnhuang95@gmail.com" <jnhuang95@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?546L6L6J?= <wanghui33@xiaomi.com>,
 =?utf-8?B?5L+e5Lic5paM?= <yudongbin@xiaomi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/1/24 13:14, Chao Yu wrote:
> 
> On 1/24/25 09:50, Jianan Huang wrote:
>> When testing the atomic write fix patches, the f2fs_bug_on was
>> triggered as below:
>>
>> ------------[ cut here ]------------
>> kernel BUG at fs/f2fs/inode.c:935!
>> Oops: invalid opcode: 0000 [#1] PREEMPT SMP PTI
>> CPU: 3 UID: 0 PID: 257 Comm: bash Not tainted 6.13.0-rc1-00033-gc283a70d3497 #5
>> RIP: 0010:f2fs_evict_inode+0x50f/0x520
>> Call Trace:
>>   <TASK>
>>   ? __die_body+0x65/0xb0
>>   ? die+0x9f/0xc0
>>   ? do_trap+0xa1/0x170
>>   ? f2fs_evict_inode+0x50f/0x520
>>   ? f2fs_evict_inode+0x50f/0x520
>>   ? handle_invalid_op+0x65/0x80
>>   ? f2fs_evict_inode+0x50f/0x520
>>   ? exc_invalid_op+0x39/0x50
>>   ? asm_exc_invalid_op+0x1a/0x20
>>   ? __pfx_f2fs_get_dquots+0x10/0x10
>>   ? f2fs_evict_inode+0x50f/0x520
>>   ? f2fs_evict_inode+0x2e5/0x520
>>   evict+0x186/0x2f0
>>   prune_icache_sb+0x75/0xb0
>>   super_cache_scan+0x1a8/0x200
>>   do_shrink_slab+0x163/0x320
>>   shrink_slab+0x2fc/0x470
>>   drop_slab+0x82/0xf0
>>   drop_caches_sysctl_handler+0x4e/0xb0
>>   proc_sys_call_handler+0x183/0x280
>>   vfs_write+0x36d/0x450
>>   ksys_write+0x68/0xd0
>>   do_syscall_64+0xc8/0x1a0
>>   ? arch_exit_to_user_mode_prepare+0x11/0x60
>>   ? irqentry_exit_to_user_mode+0x7e/0xa0
>>
>> The root cause is: f2fs uses FI_ATOMIC_DIRTIED to indicate dirty
>> atomic files during commit. If the inode is dirtied during commit,
>> such as by f2fs_i_pino_write, the vfs inode keeps clean and the
>> f2fs inode is set to FI_DIRTY_INODE. The FI_DIRTY_INODE flag cann't
>> be cleared by write_inode later due to the clean vfs inode. Finally,
>> f2fs_bug_on is triggered due to this inconsistent state when evict.
>>
>> To reproduce this situation:
>> - fd = open("/mnt/test.db", O_WRONLY)
>> - ioctl(fd, F2FS_IOC_START_ATOMIC_WRITE)
>> - mv /mnt/test.db /mnt/test1.db
>> - ioctl(fd, F2FS_IOC_COMMIT_ATOMIC_WRITE)
>> - echo 3 > /proc/sys/vm/drop_caches
>>
>> To fix this problem, clear FI_DIRTY_INODE after commit, then
>> f2fs_mark_inode_dirty_sync will ensure a consistent dirty state.
>>
>> Fixes: fccaa81de87e ("f2fs: prevent atomic file from being dirtied before commit")
>> Signed-off-by: Yunlei He <heyunlei@xiaomi.com>
>> Signed-off-by: Jianan Huang <huangjianan@xiaomi.com>
>> ---
>> Changes since v1:
>> - Add comments suggested by Chao.
>> - Add missing stat reduction.
>>
>>   fs/f2fs/segment.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index dc1b47f9269a..de1597110f76 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -201,6 +201,15 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
>>        clear_inode_flag(inode, FI_ATOMIC_FILE);
>>        if (is_inode_flag_set(inode, FI_ATOMIC_DIRTIED)) {
>>                clear_inode_flag(inode, FI_ATOMIC_DIRTIED);
>> +             /*
>> +              * The vfs inode keeps clean during commit, but the f2fs inode
>> +              * doesn't. So clear the dirty state after commit and let
>> +              * f2fs_mark_inode_dirty_sync ensure a consistent dirty state.
>> +              */
>> +             if (is_inode_flag_set(inode, FI_DIRTY_INODE)) {
>> +                     clear_inode_flag(inode, FI_DIRTY_INODE);
>> +                     stat_dec_dirty_inode(F2FS_I_SB(inode), DIRTY_META);
>> +             }
> 
> How about calling f2fs_inode_synced() directly?

It looks more clear, I will update it in v3.

Thanks,

> 
>>                f2fs_mark_inode_dirty_sync(inode, true);
>>        }
>>        stat_dec_atomic_inode(inode);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
