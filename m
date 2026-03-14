Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ccQlAz23tGkLsQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Mar 2026 02:17:49 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDA928B33E
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Mar 2026 02:17:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpnAf7lny8XDnjEEa2XL69/W7KnZP+sSZc9y7Yw7Uwg=; b=PLTcswSk23/wCTut4VIujgYBw/
	Mfb1G20CaFI6gzjOQ0nautvpZxx2e35d6z0Ldiz3ICQCRAm/44/Y7ma/+6FpqLoVhr+aD4QyMgeII
	/J7Gtf4khu07cB36KbSwwfKHypoumH2H5zNRXBcSM8TCF7myMgwAyoFbENUHKUMPa7zA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w1DdE-0006Fk-ST;
	Sat, 14 Mar 2026 01:17:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w1DdD-0006FY-QM
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Mar 2026 01:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YHSEEmv3Ls7bfkkSnUSrC8wm+BJFzIYcn4x9ahOHLZI=; b=XhiK29iNKArwOza3n+s/9fHoV8
 3h5C3TsErcks7Py48J2QFqV9Dix+ogqzwaHOvPiOv0WfUJ+iLAi9vDbDojmnU9GRGoFB2GddsaraW
 GQiyx4y6CdH5xVMM7OaGdHo5qmP4ey04vbasiGXutRX5FKXunKd58qu3AvmU6gMabD4c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YHSEEmv3Ls7bfkkSnUSrC8wm+BJFzIYcn4x9ahOHLZI=; b=aXpiDH68XFE3JNK+pI1Crok5rN
 ms224rjvH3lHFIGgMlkGvJ7qI2r9e65xRMcqgHxq31EwWuRUF2icfChJH5wt+05WOOSen3+Iw843E
 v0PpJiDTLObbj+A66ob6fTzhlwBxPS9RMcuFFHo+cWEk0g4om93EF3zPowM6wtRzFmx4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w1DdD-0007nd-U7 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Mar 2026 01:17:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 508E660008;
 Sat, 14 Mar 2026 01:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58557C19421;
 Sat, 14 Mar 2026 01:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773451046;
 bh=j9hrPKRjkr9StDF99VQKxdPHJoRC2GDA8KM06rgbbwo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=geU4le95+kraL4DCFhfUhqct89haBiiyR14gdH5iO4SLDWpguWDpAa/yGlWzuhDBc
 Qz0rfhEfgmqVlzzaRzcye9EsXnh5F1yZ6+0QuNRkIUDn+ganfNd9ghPe7grBjxcndy
 ku5myGDqC57QUvcOXityAmRuNHnRQv2nF7Jk8kWet7bf0JsByGFnUg3oSHMUdGpNl8
 3tDx07luz6JL+5xIRYP5fjzqhfYWNNg+1IQqTfmrvreO/syPCGNhz84PxghY39UI1F
 bg3jGAy2Imznxwk2nK+jHRnNCJkhAcTy2avrjlyo87Dp6rPJ6IGCijM+ioh0xUxrE2
 Y0199A8Sk7+tA==
Message-ID: <f7ad8b72-d12f-4b0a-9c6c-9d28b14b04c7@kernel.org>
Date: Sat, 14 Mar 2026 09:17:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260308144013.2340225-3-monty_pavel@sina.com>
 <889e7f95-09b8-47f9-af05-48b7ccc05386@sina.com>
Content-Language: en-US
In-Reply-To: <889e7f95-09b8-47f9-af05-48b7ccc05386@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/13 19:19, Yongpeng Yang wrote: > On 3/8/26 22:40, 
 Yongpeng Yang wrote: >> From: Yongpeng Yang <yangyongpeng@xiaomi.com> >>
 >> When f2fs_fiemap() is called with `fileinfo->fi_flags` containin [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w1DdD-0007nd-U7
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix inline data not being written
 to disk in writeback path
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vm:email,xiaomi.com:email]
X-Rspamd-Queue-Id: 5CDA928B33E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026/3/13 19:19, Yongpeng Yang wrote:
> On 3/8/26 22:40, Yongpeng Yang wrote:
>> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
>>
>> When f2fs_fiemap() is called with `fileinfo->fi_flags` containing the
>> FIEMAP_FLAG_SYNC flag, it attempts to write data to disk before
>> retrieving file mappings via filemap_write_and_wait(). However, there is
>> an issue where the file does not get mapped as expected. The following
>> scenario can occur:
>>
>> root@vm:/mnt/f2fs# dd if=/dev/zero of=data.3k bs=3k count=1
>> root@vm:/mnt/f2fs# xfs_io data.3k -c "fiemap -v 0 4096"
>> data.3k:
>>   EXT: FILE-OFFSET      BLOCK-RANGE      TOTAL FLAGS
>>     0: [0..5]:          0..5                 6 0x307
>>
>> The root cause of this issue is that f2fs_write_single_data_page() only
>> calls f2fs_write_inline_data() to copy data from the data folio to the
>> inode folio, and it clears the dirty flag on the data folio. However, it
>> does not mark the data folio as writeback. When
>> __filemap_fdatawait_range() checks for folios with the writeback flag,
>> it returns early, causing f2fs_fiemap() to report that the file has no
>> mapping.
>>
>> To fix this issue, the solution is to call f2fs_sync_node_pages() in
>> f2fs_inline_data_fiemap() when getting fiemap with FIEMAP_FLAG_SYNC
>> flags. This patch ensures that the inode folio is written back and the
>> writeback process completes before proceeding.
>>
>> Fixes: 9ffe0fb5f3bb ("f2fs: handle inline data operations")
>> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
>> ---
>> - Call f2fs_sync_node_pages() in getting fiemap path rather than
>> writeback path.
>> ---
>>   fs/f2fs/checkpoint.c |  1 +
>>   fs/f2fs/inline.c     | 25 +++++++++++++++++++++++++
>>   fs/f2fs/node.c       | 21 ++++++++++++++++-----
>>   3 files changed, 42 insertions(+), 5 deletions(-)
>>
>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>> index 6dd39b7de11a..c85276931c45 100644
>> --- a/fs/f2fs/checkpoint.c
>> +++ b/fs/f2fs/checkpoint.c
>> @@ -1416,6 +1416,7 @@ static int block_operations(struct f2fs_sb_info *sbi)
>>   	struct writeback_control wbc = {
>>   		.sync_mode = WB_SYNC_ALL,
>>   		.nr_to_write = LONG_MAX,
>> +		.range_cyclic = 1,
>>   	};
>>   	int err = 0, cnt = 0;
>>   
>> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
>> index 86d2abbb40ff..ab1e10b0f6a6 100644
>> --- a/fs/f2fs/inline.c
>> +++ b/fs/f2fs/inline.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/fs.h>
>>   #include <linux/f2fs_fs.h>
>>   #include <linux/fiemap.h>
>> +#include <linux/writeback.h>
>>   
>>   #include "f2fs.h"
>>   #include "node.h"
>> @@ -814,6 +815,30 @@ int f2fs_inline_data_fiemap(struct inode *inode,
>>   		goto out;
>>   	}
>>   
>> +	if (fieinfo->fi_flags & FIEMAP_FLAG_SYNC) {
>> +		struct writeback_control iwbc = {
>> +			.sync_mode = WB_SYNC_ALL,
>> +			.range_start = inode->i_ino << PAGE_SHIFT,
>> +			.range_end = inode->i_ino << PAGE_SHIFT,

		.range_start = (loff_t)inode->i_ino << PAGE_SHIFT,
		.range_end = (loff_t)inode->i_ino << PAGE_SHIFT,

To avoid overflow in 32-bit arch.

>> +			.nr_to_write = 1,
>> +			.range_cyclic = 0,
>> +		};
>> +
>> +retry:
>> +		f2fs_folio_wait_writeback(ifolio, NODE, true, true);
>> +		if (folio_test_dirty(ifolio)) {
>> +			f2fs_folio_put(ifolio, true);

Oh, it needs to unlock/lock inode folio, why not calling __write_node_folio() directly?
maybe a wrapped function from f2fs_move_node_folio().

Thanks,

>> +			err = f2fs_sync_node_pages(F2FS_I_SB(inode), &iwbc, true, FS_NODE_IO);
>> +			if (!err) {
>> +				ifolio = f2fs_get_inode_folio(F2FS_I_SB(inode), inode->i_ino);
>> +				if (IS_ERR(ifolio))
>> +					return PTR_ERR(ifolio);
>> +				goto retry;
>> +			}
>> +			return err;
>> +		}
>> +	}
>> +
>>   	ilen = min_t(size_t, MAX_INLINE_DATA(inode), i_size_read(inode));
>>   	if (start >= ilen)
>>   		goto out;
>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
>> index bbfa677ef46f..2fbfecaf3f7b 100644
>> --- a/fs/f2fs/node.c
>> +++ b/fs/f2fs/node.c
>> @@ -2083,7 +2083,8 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
>>   				struct writeback_control *wbc,
>>   				bool do_balance, enum iostat_type io_type)
>>   {
>> -	pgoff_t index;
>> +	pgoff_t index, wbc_index;
>> +	pgoff_t end, wbc_end;
>>   	struct folio_batch fbatch;
>>   	int step = 0;
>>   	int nwritten = 0;
>> @@ -2092,14 +2093,24 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
>>   
>>   	folio_batch_init(&fbatch);
>>   
>> +	wbc_index = 0;
>> +	wbc_end = LONG_MAX;
>> +	if (!wbc->range_cyclic) {
>> +		wbc_index = wbc->range_start >> PAGE_SHIFT;
>> +		wbc_end = wbc->range_end >> PAGE_SHIFT;
>> +	}
>>   next_step:
>> -	index = 0;
>> +	index = wbc_index;
>> +	end = wbc_end;
>>   
>> -	while (!done && (nr_folios = filemap_get_folios_tag(NODE_MAPPING(sbi),
>> -				&index, (pgoff_t)-1, PAGECACHE_TAG_DIRTY,
>> -				&fbatch))) {
>> +	while (!done && (index <= end)) {
>>   		int i;
>>   
>> +		nr_folios = filemap_get_folios_tag(NODE_MAPPING(sbi),
>> +				&index, end, PAGECACHE_TAG_DIRTY,
>> +				&fbatch);
>> +		if (nr_folios == 0)
>> +			break;
>>   		for (i = 0; i < nr_folios; i++) {
>>   			struct folio *folio = fbatch.folios[i];
>>   			bool submitted = false;
> 
> ping
> 
> Thanks
> Yongpeng,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
