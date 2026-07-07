Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K93cDojKTGpTpwEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 07 Jul 2026 11:44:40 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6B4719ED7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 07 Jul 2026 11:44:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=XyXhWg5H;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=O4s4D0+3;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="R/aJrNic";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=YPgbdaEV;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6f1R0PJCpJMOO7oUC8dzPEty+iXk1Bc9NQsKJNoO9s=; b=XyXhWg5HTCjKnWTFQD/ENlSkvD
	lab/2u/LUsu34xuoh/Tj7ipC9PMLe/GYz3XPyXo/9vg4UhJad/RzGIDTbpH/pS+7FVvaI92NVHUtD
	eHNNQqpYtBnr6exFxt5N7xLBKuDvwnR1iA5BXIMae0FNFd2GxAxkEUYWO7HxrFaT3zXQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wh2Lq-0002eA-VK;
	Tue, 07 Jul 2026 09:44:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wh2Lq-0002e4-3L
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Jul 2026 09:44:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PB57BxWlwllznDrR6zlFL6wLD5avrGWOWu0LQzeEDQg=; b=O4s4D0+3ALTKQ6IBJaXTxS3n20
 MSwKptW2V8Yz9NyxiElA7dsWp+H8h+fNgnZd4Y8AqVa72yhmYIwyholOTRux87Xm3jmswGJRbvXZx
 +qidirZjTbY0kDddsNtvG1d7bdL7ogDxStPiD5r2+2bS3bRbIXjdBWPGSQH8Uo+2D5JI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PB57BxWlwllznDrR6zlFL6wLD5avrGWOWu0LQzeEDQg=; b=R/aJrNicdberxmozuhRpG3I01X
 NO+/EDWZhzhlAm9E9SLowiFj3XumSMbh2dNF8c86ovBuiXsOJbBQZXYZNwZtUmEB3dI4fgwXbK8nD
 Hi1vzDjsGRXvSKcuRZge3deFhNjM+KALuivXWI5wRAQkrKogePUGIMNB5m8zlqZgspEI=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wh2Lo-00061K-65 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Jul 2026 09:44:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2E98A424AD;
 Tue,  7 Jul 2026 09:44:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83271F000E9;
 Tue,  7 Jul 2026 09:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783417459;
 bh=PB57BxWlwllznDrR6zlFL6wLD5avrGWOWu0LQzeEDQg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=YPgbdaEVGcrRx3fmEtXe6Yekl8vs0E1Fme+ReyfPRTwWnBqwJO85a4NOi6h7pO/FU
 4RsMJ/uDyCMHILfE57hapOZmZWGCireSHgCaY1q7HjPOJTy5p7/Ae2KAL3ycGF9EMh
 Kfaopuha4IARQdhwvjN0qdIv5KvDzAA+4UKU/bZ3ir5XwTQxqbfknX0Phel0+ancIy
 OtJub6w0OX7VyY7E7y39dZ19cLfm3wCp/vV1J6Z0Hlcd+BRLRZjm5xcoUKFrderXYR
 q7Tsw4djKH4JbAXl2DVCv587uTocfJ/sTN2Ehh3os0T3Uo5q7LmFLTzyWvx+kRAiSo
 +7xLehvLokzgA==
Message-ID: <bdea067e-6159-405b-8eab-ef7eacd623e0@kernel.org>
Date: Tue, 7 Jul 2026 17:44:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Matthew Wilcox <willy@infradead.org>, jaegeuk@kernel.org
References: <20260706095943.2560208-1-chao@kernel.org>
 <20260706095943.2560208-2-chao@kernel.org>
 <aku5T3TYNMDlJMns@casper.infradead.org>
Content-Language: en-US
In-Reply-To: <aku5T3TYNMDlJMns@casper.infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/6/26 22:18, Matthew Wilcox wrote: > On Mon, Jul 06, 2026
 at 05:59:43PM +0800, Chao Yu wrote: >> FGP_NOFS could be removed later, let's
 use memalloc_nofs_{save,restore} >> instead, which is recomm [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wh2Lo-00061K-65
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: quota: use memalloc_nofs_{save,
 restore} instead of FGP_NOFS
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B6B4719ED7

On 7/6/26 22:18, Matthew Wilcox wrote:
> On Mon, Jul 06, 2026 at 05:59:43PM +0800, Chao Yu wrote:
>> FGP_NOFS could be removed later, let's use memalloc_nofs_{save,restore}
>> instead, which is recommended to be used to avoid potential deadlock
>> when memory allocation in f2fs_quota_write() will call into filesystem
>> interface again, e.g. .writepages, evict_inode, shrinker due to
>> complicated lock race condition.
> 
> I think we need to be clear on why we need the memalloc_nofs_save()
> call here.  What problem would it cause if we did call into the
> filesystem to reclaim memory?

Hmm, after taking another look at the code, I suspect below deadlock may
occur w/o NOFS flag?

User Sync (Thread 1)
- f2fs_do_quota_sync
 - f2fs_lock_op
  : down_read(cp_rwsem) [HELD] (1st Read Lock)
 - f2fs_quota_sync_file
  - dquot_writeback_dquots
   - ...
    - f2fs_quota_write
     - f2fs_write_begin
      - f2fs_filemap_get_folio
       - __filemap_get_folio
        - ... (GFP_FS allocation triggers reclaim)
         - try_to_free_pages()
          - shrink_node()
           - shrink_lruvec()
            - shrink_page_list()
             - pageout()  <-- Reclaim decides to write back a dirty F2FS data page
              - f2fs_writepages()
               - f2fs_write_cache_pages()
                - f2fs_write_single_data_page(allow_balance = true)
                 - f2fs_balance_fs(need = true)
                  - f2fs_gc()
                   - f2fs_write_checkpoint()
                    - block_operations()
                     - f2fs_lock_all()
                      : down_write(cp_rwsem) [BLOCKED] (Self-deadlock)

To Jaegeuk, please help to double check this. :)

> 
> I suspect this is the wrong place to insert this call and it should be
> near the lock that causes the problem.  I've attempted a rewrite of the
> memalloc_nofs_save documentation; let me know what you think:
> 
> /**
>  * memalloc_nofs_save - Prevent recursion into the filesystem.
>  *
>  * All memory allocations between calling this function and calling
>  * memalloc_nofs_restore() will be prevented from calling into filesystems
>  * to reclaim memory.  Clean page cache memory can still be reclaimed,
>  * but (for example) inodes will not be.
>  *
>  * The primary reason to do this is that the caller has taken a lock
>  * which would be needed by FS reclaim.  While we could theoretically
>  * call into a different filesystem in this case, it can be a deep call
>  * stack so it is better to avoid all filesystems.
>  *
>  * Filesystems often choose to incorporate a call to this function as part
>  * of starting a journal transaction.  While not a lock in the normal
>  * sense, it has much the same effect as nested journal transactions
>  * are either prohibited or expensive.
>  *
>  * Also call this function if you need to allocate memory while holding
>  * a file folio locked.  High order allocations (such as those requested
>  * by slab) can trigger compaction which will attempt to lock the folio.
>  *
>  * Context: This function is safe to be used from any context.
>  * Return: The saved flags to be passed to memalloc_nofs_restore.
>  */

It makes sense to me, thanks for updating.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
