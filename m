Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOl2LnX7f2n+0wIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Feb 2026 02:18:45 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B96C7BF9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Feb 2026 02:18:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drBegYCphGiAK91o9AXZ0G7X6UbGtOKBkTcguiKN5Ao=; b=X9U0VBrzbY8TthwjA102Vj2QMC
	DACrTApIdFHX1kKJcXeiXpfAtaMEotWWYKWmqcBdyYrYuHlrktGTSbsnWbnJ+2zgNYnd3TIorAQ1k
	xed7/AdLVLmeyi+6Yuu4afhE5VClJXhnQBx1ZH0jUF6AFyLC122bqCjX3uJTiu/z5GTk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vmiaC-00068p-UQ;
	Mon, 02 Feb 2026 01:18:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dlemoal@kernel.org>) id 1vmia6-000688-UX
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Feb 2026 01:18:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tHde/tB+FLUVGqOuVmcCnb4mA8AVoiT93NRVkW3HDJ8=; b=JCr5W1SySu4i8B8tGC5b3oNVhI
 gOOxvErVZFKRsTYnK5wRDSe/rvUQhKlz0rCizX33glQUvAwLuZol5UncXgGEk2w91K9cyNA3j2/C7
 seHA4FEqwppyxW6lXudQmsCtGfYxoJZQY+fhUOwrHMX2JOYYuSLpcytMa0Z1eayXBQcI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tHde/tB+FLUVGqOuVmcCnb4mA8AVoiT93NRVkW3HDJ8=; b=L1PDtudpgRzAhZ+2NNfCozAFqz
 xLr7O/R5sV8LekQ28GMpekQN7FPiTTKKjQ9hXsx90YU5Jqt1XOPSwCxCmQ0bSVQ15oFdnaIOOlkpN
 nAyma/5/JtUt3VBtX0T0VagS/cuGC0txnIibinXk22YL51zaekonDTKcnyXZZrszU8PI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vmia7-0004gp-87 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Feb 2026 01:18:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8588A60008;
 Mon,  2 Feb 2026 01:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4B29C4CEF7;
 Mon,  2 Feb 2026 01:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769995097;
 bh=NQ1xMB7c3Es2ExT0TQYQoiw7U8dAchJ6SlSC4MTUEjA=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Z5Sx+jI0EnMIp0jwzMFhx/96M9Jut2Mycb0OWPynFngNOQOkzTlPNtuHCyLl8Li0/
 yZrp2mGb5P59k+RmmJ8ApPo1d833H1XdcwO8wG3TrUZeTDm6gpl+zXsMcHimSzPki+
 +14Q8vzUsJ3zy82Ohv9TBnsi5b4xgX/rxTOMsNRQ+F5mv+MQKIDtesbeKteOnAGsSb
 tl1dQhY+2mQisz4ZQilNrnfyESmKe/Jwm2yHnx0r+XNzMdC1TPrbtkO1wuwyjcWfew
 xJ3f/TMeezYd3yeonuviljOUgbF5MLuB0+PiJcdh0O+ukPCpOO+dfgaFGl+eW6azqF
 tKUmHOUur8DxA==
Message-ID: <24bf6e88-1917-4f13-92bf-449b106158a2@kernel.org>
Date: Mon, 2 Feb 2026 10:18:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>
References: <20260201122258.3168119-1-shinichiro.kawasaki@wdc.com>
 <20260201122258.3168119-2-shinichiro.kawasaki@wdc.com>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20260201122258.3168119-2-shinichiro.kawasaki@wdc.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/1/26 21:22, Shin'ichiro Kawasaki wrote: > A lockdep WARN
 is observed recently under the following steps: > > 1) Create a zoned TCMU
 device > 2) Create a f2fs filesystem on the zoned TCMU device a [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vmia7-0004gp-87
Subject: Re: [f2fs-dev] [PATCH for-next 1/1] f2fs: fix lockdep WARN of
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
From: Damien Le Moal via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Damien Le Moal <dlemoal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.21 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shinichiro.kawasaki@wdc.com,m:linux-f2fs-devel@lists.sourceforge.net,m:jaegeuk@kernel.org,m:chao@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[dlemoal@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: E6B96C7BF9
X-Rspamd-Action: no action

On 2/1/26 21:22, Shin'ichiro Kawasaki wrote:
> A lockdep WARN is observed recently under the following steps:
> 
> 1) Create a zoned TCMU device
> 2) Create a f2fs filesystem on the zoned TCMU device and mount it
> 3) Fill the filesystem with files and trigger GC
> 4) Unmout the filesystem
> 5) Remove the zoned TCMU device
> 
> The lockdep WARN indicates that a circular lock depedency formed by four
> contexts, as described below.
> 
> a) TCMU device removal context:
>  - call del_gendisk() to get q->q_usage_counter
>  - call start_flush_work() to get work_completion of wb->dwork
> b) f2fs writeback context:
>  - in wb_workfn(), which holds work_completion of wb->dwork
>  - call f2fs_balance_fs() to get sbi->gc_lock
> c) f2fs vfs_write context:
>  - call f2fs_gc() to get sbi->gc_lock
>  - call f2fs_write_checkpoint() to get sbi->cp_global_sem
> d) f2fs mount context:
>  - call recover_fsync_data() to get sbi->cp_global_sem
>  - call f2fs_check_and_fix_write_pointer() to call blkdev_report_zones()
>    that goes down to blk_mq_alloc_request and get q->q_usage_counter
> 
> To suppress the WARN, cut the dependency d) between sbi->cp_global_sem
> and q->q_usage_counter. For that purpose, move the
> f2fs_check_and_fix_write_pointer() call outside of the critical section
> of sbi->cp_global_sem in f2fs_recovery_fsync_data(). This change is fine
> because the write pointer fix operation only affects the main segments
> and does not interact with the check point metadata. Furthermore,
> conflicts between the write pointer fix operation and data/node flush
> operations remain protected by SBI_POR_DOING.
> 
> Fixes: c426d99127b1 ("f2fs: Check write pointer consistency of open zones")
> Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>

Looks OK to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>


-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
