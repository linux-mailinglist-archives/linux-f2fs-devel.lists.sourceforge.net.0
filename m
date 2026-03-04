Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNgZGI/zp2nImwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 09:55:43 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0411FD004
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 09:55:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oefsJmWzun5AHNzGrI4P2I6W2yc4x5Unmx2EzbHwB/s=; b=cR3abF/4JL2Jv+l8o3sXZ8sLcg
	iyoOawlQ6/eYQU+nGm5Bzri+JQh/Tqpf0j4a4wcxB5NN01JN0LQ+4LXgj/XQw5C0Gr3lOWd4dJMGM
	uIb2tiRTaTZic2/+ujOv6dJJygFPRcDEwqa7AT+GvTMODDMIpLYJ3jdMWwOb2F2ShxDM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxi11-0003sy-9Y;
	Wed, 04 Mar 2026 08:55:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vxi0u-0003sG-13
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 08:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZgvOQp9V11OLUC4jjXQF4tPyLSwFsBmTaSyFXOrMM68=; b=hWoJWIIrj2U1uqzY5Y0ZIeVmIv
 ajfmOkgms1w5D1V9o5ImcpYb/BsRw3MA8lwZC2tUvwgl7IYj2+AYpH3tlgoKSDA7Cr782+G2XL05s
 EBmCJwEg0iz1IfCN7jQI2UdLxRhIeccHaWcX1KdJbSLdb6gVVRyC1OHyPm0GR0RS6t0g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZgvOQp9V11OLUC4jjXQF4tPyLSwFsBmTaSyFXOrMM68=; b=Cko1ILAUt9Aehy7Vl0tQ2/zUXd
 onGUT+5DAoFn0r5uqKUrO+exihB8CiakGNDSxdNSEuXFSlfv92zpjy4IUn1ww7tjq47zhcB+Dr/1r
 GMf7oID1o3UVKm8P5p4DzAr5IUvnwiSmj61KhmvnkorbUwu5N8f8SLGyqNNqbPP2Ool4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxi0u-0005Xd-3I for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 08:55:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5A9EF600AD;
 Wed,  4 Mar 2026 08:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31508C19423;
 Wed,  4 Mar 2026 08:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772614522;
 bh=HqKZV8r+WbZc2mVhdkJQIs86V27AYaKGayXetUA8yL4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=nZBNM9Nt+oC3jjp/vR8l9A8hVY5UA6qfK8CfjmlXdYZbC+sfmWRPmb2dj6SXEg/pF
 iWb+so9z1IE6eRGE2yUNTTw0lK/hAHIlGLL1rjpcka3MxLtstppJ7uvxslbFOPnLSw
 Rli7Dub17IhuwoIJ3nf4+KBi5l1F9fu/gQ61WBL4ZeoeF1zEtRP+EGo8QVSdfLPOs+
 /HgsccAQ034eyN9lUPFItJ+yNhEg/71+x3x0wv68x2m9fQOE5dZRAALLThoJHPe1ua
 RydTX1lxLw+tksihYdFaJBP8U9MM5u8CISCi7ZtuTBjdQuhHgyL4lfOdBWLnGsH/C8
 YZu+z4BUFK8jw==
Message-ID: <da969409-ce10-46fe-8620-b0dfb0cea201@kernel.org>
Date: Wed, 4 Mar 2026 16:55:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260218125237.3340441-1-shinichiro.kawasaki@wdc.com>
 <20260218125237.3340441-2-shinichiro.kawasaki@wdc.com>
 <aZ0aVDSWpRRqFwl9@google.com> <aZ1C-Cdrwoxp0VCJ@shinmob>
 <aaH_XCGbYOt6dpba@google.com> <aae5x_9gpi7utuf0@shinmob>
Content-Language: en-US
In-Reply-To: <aae5x_9gpi7utuf0@shinmob>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/4 12:57, Shinichiro Kawasaki wrote: > On Feb 27,
 2026 / 20:32, Jaegeuk Kim wrote: >> On 02/24, Shinichiro Kawasaki wrote:
 >>> On Feb 24, 2026 / 03:26, Jaegeuk Kim wrote: >>>> On 02/18, Shin' [...]
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
X-Headers-End: 1vxi0u-0005Xd-3I
Subject: Re: [f2fs-dev] [PATCH v2 1/1] f2fs: fix lockdep WARN of
 sbi->cp_global_sem and q->q_usage_counter
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
Cc: Damien Le Moal <dlemoal@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 7C0411FD004
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS(0.00)[m:shinichiro.kawasaki@wdc.com,m:jaegeuk@kernel.org,m:dlemoal@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Action: no action

On 2026/3/4 12:57, Shinichiro Kawasaki wrote:
> On Feb 27, 2026 / 20:32, Jaegeuk Kim wrote:
>> On 02/24, Shinichiro Kawasaki wrote:
>>> On Feb 24, 2026 / 03:26, Jaegeuk Kim wrote:
>>>> On 02/18, Shin'ichiro Kawasaki wrote:
>>>>> From: Shin'ichiro Kawasaki via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
>>>>>
>>>>> A lockdep WARN is observed recently under the following steps:
>>>>>
>>>>> 1) Create a zoned TCMU device
>>>>> 2) Create a f2fs filesystem on the zoned TCMU device and mount it
>>>>> 3) Fill the filesystem with files and trigger GC
>>>>> 4) Unmout the filesystem
>>>>> 5) Remove the zoned TCMU device
>>>>>
>>>>> The lockdep WARN indicates that a circular lock depedency formed by four
>>>>> contexts, as described below.
>>>>>
>>>>> a) TCMU device removal context:
>>>>>   - call del_gendisk() to get q->q_usage_counter
>>>>>   - call start_flush_work() to get work_completion of wb->dwork
>>>>> b) f2fs writeback context:
>>>>>   - in wb_workfn(), which holds work_completion of wb->dwork
>>>>>   - call f2fs_balance_fs() to get sbi->gc_lock
>>>>> c) f2fs vfs_write context:
>>>>>   - call f2fs_gc() to get sbi->gc_lock
>>>>>   - call f2fs_write_checkpoint() to get sbi->cp_global_sem
>>>>> d) f2fs mount context:
>>>>>   - call recover_fsync_data() to get sbi->cp_global_sem
>>>>>   - call f2fs_check_and_fix_write_pointer() to call blkdev_report_zones()
>>>>>     that goes down to blk_mq_alloc_request and get q->q_usage_counter
>>>>>
>>>>> To suppress the WARN, cut the dependency d) between sbi->cp_global_sem
>>>>> and q->q_usage_counter. For that purpose, move the
>>>>> f2fs_check_and_fix_write_pointer() call outside of the critical section
>>>>> of sbi->cp_global_sem in f2fs_recovery_fsync_data(). This change is fine
>>>>> because the write pointer fix operation only affects the main segments
>>>>> and does not interact with the check point metadata. Furthermore,
>>>>> conflicts between the write pointer fix operation and data/node flush
>>>>> operations remain protected by SBI_POR_DOING.
>>>>>
>>>>> Fixes: c426d99127b1 ("f2fs: Check write pointer consistency of open zones")
>>>>> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
>>>>> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
>>>>> ---
>>>>>   fs/f2fs/recovery.c | 4 ++--
>>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
>>>>> index a26071f2b0bc..87fd6cd436fe 100644
>>>>> --- a/fs/f2fs/recovery.c
>>>>> +++ b/fs/f2fs/recovery.c
>>>>> @@ -922,6 +922,8 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
>>>>>   		truncate_inode_pages_final(META_MAPPING(sbi));
>>>>>   	}
>>>>>   
>>>>> +	f2fs_up_write_trace(&sbi->cp_global_sem, &lc);
>>>>> +
>>>>>   	/*
>>>>>   	 * If fsync data succeeds or there is no fsync data to recover,
>>>>>   	 * and the f2fs is not read only, check and fix zoned block devices'
>>>>> @@ -933,8 +935,6 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
>>>>>   	if (!err)
>>>>>   		clear_sbi_flag(sbi, SBI_POR_DOING);
>>>>>   
>>>>> -	f2fs_up_write_trace(&sbi->cp_global_sem, &lc);
>>>>> -
>>>>
>>>> This was a guard to prevent checkpoint during f2fs_check_and_fix_write_pointer()
>>>> where it changes the checkpoint as well?
>>>
>>> I checked f2fs_check_and_fix_write_pointer() again, and it does not look
>>> changing the checkpoint to me. FYI, here I show the rough function call chain
>>> from f2fs_check_and_fix_write_pointer() as below. I guess this call chain does
>>> not change the checkpoint, but if I misunderstand anything, please let me know.
>>>
>>>   f2fs_check_and_fix_write_pointer()
>>>    fix_curseg_write_pointer()
>>>     do_fix_curseg_write_pointer()
>>>      blkdev_report_zones()
>>>       report_one_zone_cb()
>>>      f2fs_allocate_new_section()
>>>       __allocate_new_segment()
>>>        new_curseg()
>>
>> E.g., curseg.
>>
> 
> Thanks, I looked in do_checkpoint() in fs/f2fs/checkpoing.c, and found it refers
> to cursegs. Then, this patch will allow recording the cursegs in parallel of
> f2fs_check_and_fix_write_pointer(), and it will results in inconsistent curseg
> values in checkpoints. Not good. Let me drop this patch.
> 
> I will seek out other ways to avoid the lockdep. I have no idea how to do that
> at this moment, though.

Shinichiro,

IMO, this looks like a false alarm of lockdep, what do you think of this fix?

https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?h=bugfix/syzbot&id=3b19564b95e9ba9803ef30e90eace0977b9d140d

---
  fs/f2fs/f2fs.h  | 3 +++
  fs/f2fs/super.c | 3 +++
  2 files changed, 6 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index bb34e864d0ef..5b400e99f332 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2042,6 +2042,9 @@ struct f2fs_sb_info {
         spinlock_t iostat_lat_lock;
         struct iostat_lat_info *iostat_io_lat;
  #endif
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+       struct lock_class_key cp_global_sem_key;
+#endif
  };

  /* Definitions to access f2fs_sb_info */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 8774c60b4be4..9e85f31fa828 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4948,6 +4948,9 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
         init_f2fs_rwsem_trace(&sbi->gc_lock, sbi, LOCK_NAME_GC_LOCK);
         mutex_init(&sbi->writepages);
         init_f2fs_rwsem_trace(&sbi->cp_global_sem, sbi, LOCK_NAME_CP_GLOBAL);
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+       lockdep_set_class(&sbi->cp_global_sem, &sbi->cp_global_sem_key);
+#endif
         init_f2fs_rwsem_trace(&sbi->node_write, sbi, LOCK_NAME_NODE_WRITE);
         init_f2fs_rwsem_trace(&sbi->node_change, sbi, LOCK_NAME_NODE_CHANGE);
         spin_lock_init(&sbi->stat_lock);
-- 
2.49.0




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
