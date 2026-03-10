Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHnWOdzmr2nkdAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 10:39:40 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F04248A6A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 10:39:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71kjDQX5qzbj0c66nxNu33SIkMxp3NlCxucyMRvZLMQ=; b=ECiUSTGeR1uR7h29HnFHgX3wRS
	TpNNjzGr4hbDm92YYLhbhMVELiDV+fNfOAwjmVy00hRXvBYD3Y/YK37TFf+N0WA8BMIcYlV2IJrsO
	BX8K2pUDdUla/bqbauHXvLPXoAX0Fh7OtXOwok98tFvgwF4YT52GBAWBupkqZMcjc1TE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vztYp-0006pj-R1;
	Tue, 10 Mar 2026 09:39:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1vztYn-0006pU-6g
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 09:39:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MFo18v8wTczxcBf0vzuXmViSLHFGHwYGHsVDxa1YbWU=; b=gR4+tDhroZdMgQyvhLR5S5PuJU
 o8PCBpFyyLEJAeWSSWiJhjMwgQDGA/yvGYX7jLZGOSxIXYROiHMyBCwiV234ZVQspWN9G9PhE5Fkb
 Aht3WSD5P2ACB3qPTd445xCSiZuPAl7gloqImDO4BAEFJY8C4VyPtiRnLdKHnGeFhKuI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MFo18v8wTczxcBf0vzuXmViSLHFGHwYGHsVDxa1YbWU=; b=IASGg90sIP+H9WFapTxBfpTcc0
 aoyo7l3ka63xNR7tWZg6XQGufvgiC6typqyHmtuxd6r0fZNR+um6j9GLPEd5YnuYecRQ72bvHuRK0
 aIh9K7nwUzNJhuGbSNfw/C9KkmgoDT9pHYkxcZUbBhB+1J/j+/m10himQ6cS/4BQrssE=;
Received: from smtp153-162.sina.com.cn ([61.135.153.162])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vztYm-0002ra-54 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 09:39:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1773135568; bh=MFo18v8wTczxcBf0vzuXmViSLHFGHwYGHsVDxa1YbWU=;
 h=Message-ID:Date:Subject:From;
 b=H/yQqWUskowRkjWMziDJ/cM0Z3iyETPWtounPVLBs5Zn/OICnAnYWaUGT2ZgNvLw3
 thOH6zZolEDpFGUkGdXmKnbNsp1OniKrvugtEaunbgRbCjOWc/EolxjiDbl3WV4mYW
 TpTQ8csyHy9AASHfuEYQa7uxdcS436YdRSjvuQEY=
X-SMAIL-HELO: [10.189.138.37]
Received: from unknown (HELO [10.189.138.37])([114.247.175.249])
 by sina.com (10.54.253.31) with ESMTP
 id 69AFE6C000000DCD; Tue, 10 Mar 2026 17:39:14 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 3486916816112
X-SMAIL-UIID: 77690C375FB04434897338805C96275A-20260310-173914-1
Message-ID: <3f71d134-b6d6-4989-8a70-1dd78cc95c8c@sina.com>
Date: Tue, 10 Mar 2026 17:39:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260306121759.1935322-2-monty_pavel@sina.com>
 <a3b294ae-1012-4e87-a2a8-1ef91754c9b1@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <a3b294ae-1012-4e87-a2a8-1ef91754c9b1@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/9/26 11:45, Chao Yu via Linux-f2fs-devel wrote: > On
 3/6/26 20:18, Yongpeng Yang wrote: >> From: Yongpeng Yang >> >> During fsync, 
 the flow reaches f2fs_fsync_node_pages(), which scans all >> d [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1vztYm-0002ra-54
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix data loss caused by fsync not
 writing any node folio
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 72F04248A6A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sina.com:mid]
X-Rspamd-Action: no action

On 3/9/26 11:45, Chao Yu via Linux-f2fs-devel wrote:
> On 3/6/26 20:18, Yongpeng Yang wrote:
>> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
>>
>> During fsync, the flow reaches f2fs_fsync_node_pages(), which scans all
>> dirty node folios of the node mapping. If there are no dirty node
>> folios, fsync will not write any node folio. The scenario is as follows:
>>
>> create & write & fsync 'file A'                 writeback node folio
>> - f2fs_do_sync_file // inline inode
>>  - f2fs_write_inode // inode folio is dirty
>>
>>                                                 - f2fs_write_node_pages
>>                                                  - f2fs_sync_node_pages
>>  - f2fs_fsync_node_pages // no dirty node folios
>>  sudden poweroff and lost 'file A'
>>
>> The root cause of the data loss is that although the inode folio is
>> written successfully, the corresponding node folio is not written with
>> the FSYNC_BIT_SHIFT mark. As a result, the recovery procedure ignores
>> this file.
>>
>> This patch ensures that fsync writes at least one node folio with the
>> FSYNC_BIT_SHIFT mark for the inode, so that the recovery procedure can
>> properly detect and process it.
> 
> I'm not sure, but I suspect that the problem should has been resolved by
> commit 88bd02c9472a ("f2fs: fix conditions to remain recovery information
> in f2fs_sync_file") has fixed this problem?

f2fs_do_sync_file() checks whether the inode needs to be marked dirty
again and written back, but there is an issue with how
f2fs_need_inode_block_update() accesses the nat_entry flag. My previous
root cause analysis was incorrect, the fix should instead address the
problem in f2fs_need_inode_block_update(). The updated change is
included in this patchset:
https://lore.kernel.org/all/20260310093611.2865092-2-monty_pavel@sina.com/

if (f2fs_need_inode_block_update(sbi, ino)) {
	f2fs_mark_inode_dirty_sync(inode, true);
	f2fs_write_inode(inode, NULL);
	goto sync_nodes;
}

Thanks
Yongpeng,

> 
> Thanks,
> 
>>
>> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
>> ---
>> v2:
>> - Use f2fs_folio_put instead of folio_put to dec folio ref count.
>> ---
>>  fs/f2fs/node.c | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
>> index 2fbfecaf3f7b..e14e5db1e8e6 100644
>> --- a/fs/f2fs/node.c
>> +++ b/fs/f2fs/node.c
>> @@ -1982,6 +1982,22 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>>  		folio_batch_release(&fbatch);
>>  		cond_resched();
>>  	}
>> +	/*
>> +	 * All dirty node folios may be written by other thread, but CP hasn't
>> +	 * been written yet. So, we need to flush one of inode's dnode to
>> +	 * recovery this inode when encounter sudden power off.
>> +	 */
>> +	if (!atomic && nwritten == 0) {
>> +		struct folio *ifolio;
>> +
>> +		ifolio = f2fs_get_inode_folio(sbi, inode->i_ino);
>> +		if (IS_ERR(ifolio))
>> +			return PTR_ERR(ifolio);
>> +		f2fs_folio_wait_writeback(ifolio, NODE, true, true);
>> +		folio_mark_dirty(ifolio);
>> +		f2fs_folio_put(ifolio, true);
>> +		goto retry;
>> +	}
>>  	if (atomic && !marked) {
>>  		f2fs_debug(sbi, "Retry to write fsync mark: ino=%u, idx=%lx",
>>  			   ino, last_folio->index);
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
