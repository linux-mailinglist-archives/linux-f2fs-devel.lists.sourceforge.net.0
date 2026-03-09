Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAE0FmU1rmkuAgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 03:50:13 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B12123361C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 03:50:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+FwQMtbXKfLrJjE1ljY/7vXvv+Ljuyh9Gbh7Ec3+fUU=; b=WEW+/+yh2ufNttUhlJrqhHxGOj
	Zrmkc/nZ/T5ezuiC7U43XQrDvFOpBJRhj+CV6LWk3vpoL8+yZhbgXlpKFm2sfs9xYW7bSx2D661pL
	M0efNH65oPv/Uz+BLrsVQSPVmHEVZF4rdAyj6z0PUJ/MFc4qQ9KIwNFufY13DWs++mDo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzQgw-0001mq-L2;
	Mon, 09 Mar 2026 02:49:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vzQgv-0001mj-Kg
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 02:49:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TnQrH7sshRyqlR3AQMUELFfVPugvJu6ghT/fsFtCI8M=; b=BIam2D4hkohGbdFGbHzl0Xso8r
 sNoPGlEu6U5KLBTlln2Fb7jlenXVqIMOVRBnoH37FlW9GhImmR+EqgajIS5sdf4MHPbaJOyr+rK2U
 tP1SmRa5NawQmxtvX7AK8YBAZ2ukRm5h/0TdsS3TYGtaFdqGM8UjHjaA1FoifgLi0fIQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TnQrH7sshRyqlR3AQMUELFfVPugvJu6ghT/fsFtCI8M=; b=hbk3/r9A7nSPTowQqVdHsJHBsg
 DnDin5fgVgfMUUTKQq+DORlDTe5LgUpY1ivKy2MldBDBdfgP4KX9KAgWXGUmS43PCPqFTw7GsPxkU
 DCKCjPaKFWOZ5cg4WPzeK71C2rRrtRM3hhlOCp8/Rf0AiGW5syItIUoUT/ntTFjrphCQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzQgv-0004MV-5h for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 02:49:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 86FE2600AD;
 Mon,  9 Mar 2026 02:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ADCEC116C6;
 Mon,  9 Mar 2026 02:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773024591;
 bh=KunRiZRpKiAcU8qeAYLyCv5F+lGXNF0SOMxOLWjWRMs=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=aM6eCcNs+WcEUo6AYvxn+68+BRWLqAmQuaCLPkzxuKmzJE1e5qYjjEVpYc+HUK4ZO
 jek7+9PiSILKxmX9RzRVmlxsuElvOvTDw2k67s3M/n3hbpzfb4vOtTNqFGUAvkjjom
 ABxAj10evXVLNuOrWVCWru0E8DkUvlAEJij6TEYo0lAda6/WFnLegNCNSN+UdrBFkn
 8RA8xMJMDDBaPUJNssNrYuxIRSonpEPElVaovoa8pOsf5+SEjAGDI/i/no9wCpfhdG
 BanC04JGHj3maq7GCbYroBnjrAthnObQSTg6cy6pAUyqfskc1AnJPj6aSX4G8vtMLv
 AFgVFccVeMK7Q==
Message-ID: <0c0baadd-06f5-4b2a-bae8-2bd93077025d@kernel.org>
Date: Mon, 9 Mar 2026 10:49:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1772680966-29939-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
In-Reply-To: <1772680966-29939-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/5/26 11:22, Zhiguo Niu wrote: > The following steps will
 change previous value of reserve_{blocks,node}, > this dones not match the
 original intention. > > 1.mount -t f2fs -o reserve_root=8192 im [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vzQgv-0004MV-5h
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to preserve previous
 reserve_{blocks, node} value when remount
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 7B12123361C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zhiguo.niu@unisoc.com,m:jaegeuk@kernel.org,m:ke.wang@unisoc.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:Hao_hao.Wang@unisoc.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.983];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Action: no action

On 3/5/26 11:22, Zhiguo Niu wrote:
> The following steps will change previous value of reserve_{blocks,node},
> this dones not match the original intention.
> 
> 1.mount -t f2fs -o reserve_root=8192 imgfile test_mount/
> F2FS-fs (loop56): Mounted with checkpoint version = 1b69f8c7
> mount info:
> /dev/block/loop56 on /data/test_mount type f2fs (xxx,reserve_root=8192,reserve_node=0,resuid=0,resgid=0,xxx)
> 
> 2.mount -t f2fs -o remount,reserve_root=4096 /data/test_mount
> F2FS-fs (loop56): Preserve previous reserve_root=8192
> check mount info: reserve_root change to 4096
> /dev/block/loop56 on /data/test_mount type f2fs (xxx,reserve_root=4096,reserve_node=0,resuid=0,resgid=0,xxx)
> 
> Prior to commit d18535132523 ("f2fs: separate the options parsing and options checking"),
> the value of reserve_{blocks,node} was only set during the first mount, along with
> the corresponding mount option F2FS_MOUNT_RESERVE_{ROOT,NODE} . If the mount option
> F2FS_MOUNT_RESERVE_{ROOT,NODE} was found to have been set during the mount/remount,
> the previously value of reserve_{blocks,node} would also be preserved, as shown in
> the code below.
>              if (test_opt(sbi, RESERVE_ROOT)) {
>                    f2fs_info(sbi, "Preserve previous reserve_root=%u",
>                           F2FS_OPTION(sbi).root_reserved_blocks);
>              } else {
>                    F2FS_OPTION(sbi).root_reserved_blocks = arg;
>                    set_opt(sbi, RESERVE_ROOT);
>              }
> But commit d18535132523 ("f2fs: separate the options parsing and options checking")
> only preserved the previous mount option; it did not preserve the previous value of
> reserve_{blocks,node}. Since value of reserve_{blocks,node} value is assigned
> or not depends on ctx->spec_mask, ctx->spec_mask should be alos handled in
> f2fs_check_opt_consistency.
> 
> This patch will clear the corresponding ctx->spec_mask bits in f2fs_check_opt_consistency
> to preserve the previously values of reserve_{blocks,node} if it already have a value.
> 
> Fixes: d18535132523 ("f2fs: separate the options parsing and options checking")
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
> v2: add more detail info in commit msg suggested by Chao

Thanks Zhiguo, the commit message makes sense to me, and it looks good now.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
