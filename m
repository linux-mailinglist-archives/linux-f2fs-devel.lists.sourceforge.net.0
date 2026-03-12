Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id pR15AzgTsmm3IQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 02:13:28 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 450AB26BDCD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 02:13:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ujoNX4IuoXEHd8e7ThPamnLIaxg2x3MFaGaO1IPkb0=; b=WS2SxdeQI5qwL4kLCE+VVSQeAU
	bIHHnaeVLe8L6FtCavX74KHXCstroSnZFWSGwifkJLvqjjWeoeksbVDdA4HSSc3ayjcrvX3sartZW
	7mThaNNcvBFIwwfZWSW1lg3BiYNViRHqqupMhnhSeMxur5UBtj4zX4gkdogtiuOxhqx4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0Uc7-0007RN-3I;
	Thu, 12 Mar 2026 01:13:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w0Uc5-0007RH-Ub
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 01:13:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CK3akoI9z3KTrQ1qVmfL5iip1aDE4eXb3u60Hm6+CB4=; b=ZnTKgKVo/TIS7lZrgYMotlHQWy
 z9TIrioTXuMvs6kXSj5VZ/acXSm+qLW7gPYrUPWaNNGCy6GXWqdbfbII6BwmjHCo5Wzt9GdeDZY9A
 rymbyvIRI3ixKonY0GjqktAAXs94H63Q7z3hQIRMP58Iyyp+w97nxsHFsBtbj7KgOygw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CK3akoI9z3KTrQ1qVmfL5iip1aDE4eXb3u60Hm6+CB4=; b=HwxHEnnYFNUqogjCiQLi0PXwRd
 WoWTraQGNoCadpG/MWbp6v/g7odK2OmJ+m1+kuiaf7cMC77rk0kTkH2DtwHZLkCLCA47D97DSLBrO
 XwCLWi/WOb6JtFdOLdF9bN2NDu4/W2dV7Xpyig8ERUqofbHrV6sxFEY5jKP+o04ChWsY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0Uc5-00031x-EZ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 01:13:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0137143A58;
 Thu, 12 Mar 2026 01:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF89C4CEF7;
 Thu, 12 Mar 2026 01:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773277990;
 bh=OSkbqFssrRnULIx0HyNUyhdKujZNRCjx+I0j9eZK27U=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=aY1jMcutCQbzBRtIakXQaQTXnNghtsprf3v3aOm/3Pey/JI7n2/FPaZSED+xa6F0M
 8DyjS6h1h0scgMEZ+W6BilcbLKGWZHcRZcRr4cRErA7XpG1uIbgbhEeZXggCSx3fhT
 6p2okWlbWdTyklttr7vpamxGdXwym0LKxMvbjMuQnDva683llDPn5ssx24p6RjDJN7
 chpfdPa3R1JjLxLngZPLaSccf7OoRP361R/VKYHBd7TQnZCtv6wvdpZ2nU6VY8Tt0K
 h7kA3ZHLXNUMNvLvLXqTYum3wyDR3pjEyCi3OQUOPBFpaRf6X3S+l0a3lkqnzd3pOg
 DNG9ex+bEqeaQ==
Message-ID: <66ba0348-3ee8-47da-a431-7eb360126762@kernel.org>
Date: Thu, 12 Mar 2026 09:13:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, Yongpeng Yang <monty_pavel@sina.com>
References: <20260310093611.2865092-2-monty_pavel@sina.com>
 <20260310093611.2865092-4-monty_pavel@sina.com> <abGxmcBNlSgEwh5z@google.com>
Content-Language: en-US
In-Reply-To: <abGxmcBNlSgEwh5z@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/12 02:16, Jaegeuk Kim wrote: > On 03/10, Yongpeng
 Yang wrote: >> From: Yongpeng Yang <yangyongpeng@xiaomi.com> >> >>
 f2fs_need_dentry_mark()
 reads nat_entry flags without mutual exclusion >> [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w0Uc5-00031x-EZ
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix fsck inconsistency caused by
 incorrect nat_entry flag usage
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
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:monty_pavel@sina.com,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,sina.com];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email]
X-Rspamd-Queue-Id: 450AB26BDCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026/3/12 02:16, Jaegeuk Kim wrote:
> On 03/10, Yongpeng Yang wrote:
>> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
>>
>> f2fs_need_dentry_mark() reads nat_entry flags without mutual exclusion
>> with the checkpoint path, which can result in an incorrect inode block
>> marking state. The scenario is as follows:
>>
>> create & write & fsync 'file A'                 write checkpoint
>> - f2fs_do_sync_file // inline inode
>>   - f2fs_write_inode // inode folio is dirty
>>                                                  - f2fs_write_checkpoint
>>                                                   - f2fs_flush_merged_writes
>>                                                   - f2fs_sync_node_pages
>>   - f2fs_fsync_node_pages // no dirty node
>>   - f2fs_need_inode_block_update // return true
>>   - f2fs_fsync_node_pages // inode dirtied
>>    - f2fs_need_dentry_mark //return true
>>                                                   - f2fs_flush_nat_entries
>>                                                  - f2fs_write_checkpoint end
>>    - __write_node_folio // inode with DENT_BIT_SHIFT set
>>    SPO, "fsck --dry-run" find inode has already checkpointed but still
>>    with DENT_BIT_SHIFT set
>>
>> The state observed by f2fs_need_dentry_mark() can differ from the state
>> observed in __write_node_folio() after acquiring sbi->node_write. The
>> root cause is that the semantics of IS_CHECKPOINTED and
>> HAS_FSYNCED_INODE are only guaranteed after the checkpoint write has
>> fully completed.
>>
>> This patch moves set_dentry_mark() into __write_node_folio() and
>> protects it with the sbi->node_write lock.
>>
>> Fixes: 88bd02c9472a ("f2fs: fix conditions to remain recovery information in f2fs_sync_file")
>> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
>> ---
>>   fs/f2fs/node.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
>> index 2fbfecaf3f7b..7d3b377cbc17 100644
>> --- a/fs/f2fs/node.c
>> +++ b/fs/f2fs/node.c
>> @@ -1807,7 +1807,9 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted
>>   		if (IS_INODE(folio))
>>   			set_dentry_mark(folio,
>>   				f2fs_need_dentry_mark(sbi, ino_of_node(folio)));
>> -	}
>> +	} else if (IS_INODE(folio) && is_fsync_dnode(folio))
>> +		set_dentry_mark(folio,
>> +				f2fs_need_dentry_mark(sbi, ino_of_node(folio)));
> 
> Thanks, I applied with some clean-up as below. Could you please review this?
> 
> -       if (atomic) {
> -               if (!test_opt(sbi, NOBARRIER))
> -                       fio.op_flags |= REQ_PREFLUSH | REQ_FUA;
> -               if (IS_INODE(folio))
> -                       set_dentry_mark(folio,
> +       if (atomic && !test_opt(sbi, NOBARRIER))
> +               fio.op_flags |= REQ_PREFLUSH | REQ_FUA;
> +
> +       if (IS_INODE(folio) && (atomic || is_fsync_dnode(folio)))
> +               set_dentry_mark(folio,
>                                  f2fs_need_dentry_mark(sbi, ino_of_node(folio)));
> -       }

Looks good.

Thanks,

> 
> 
>>   
>>   	/* should add to global list before clearing PAGECACHE status */
>>   	if (f2fs_in_warm_node_list(folio)) {
>> @@ -1948,9 +1950,6 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>>   					if (is_inode_flag_set(inode,
>>   								FI_DIRTY_INODE))
>>   						f2fs_update_inode(inode, folio);
>> -					if (!atomic)
>> -						set_dentry_mark(folio,
>> -							f2fs_need_dentry_mark(sbi, ino));
>>   				}
>>   				/* may be written by other thread */
>>   				if (!folio_test_dirty(folio))
>> -- 
>> 2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
