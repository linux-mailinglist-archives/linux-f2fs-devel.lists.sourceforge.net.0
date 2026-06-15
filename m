Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q/ejFYCuL2rkEQUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 09:49:20 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95319684509
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 09:49:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=BhgKhh+J;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Xjr1hkZG;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=WfzcH3Pi;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=m0KXl6qe;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bEECRu8TQtsMcm/J/RmGgymLv01jgCMVxkw58a79hY=; b=BhgKhh+JrGjkT3B6yiyr7eNMz0
	LuZiJWaSDqsOSzUjRE2ysP/iQ1HjoIp7eq8Ed+FwBJioYiUZ2GLDrq6p+vmLLEyrETnkI6Gj8pCF/
	U8JoeFJlF7/ofUsn0gfHb2QjuiBfpDkeGGlAYaNuH8dhKJ7O8etry2OCA0zPw/tfzrJg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ24F-0007C6-NO;
	Mon, 15 Jun 2026 07:49:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wZ24E-0007Bx-H1
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 07:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gfi3SSV00neQWQKyfC4FDKdat0tZ0INV/4KF5gThayU=; b=Xjr1hkZGL233RhFQPucHcwmQCe
 eSrij9dkRd/kgu1fZn0kmrb7ng5ZRiQe9USp25uV55cWFrt7zHeED2siPHLknUHuJM1TZxS1oDSgO
 ClM2ZVZz4YcyaN6mNsRkjcuxL/4Y4MvMig+PRwgrZvK7M0T6sJIZuwOR7gnVJbVQIEHc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gfi3SSV00neQWQKyfC4FDKdat0tZ0INV/4KF5gThayU=; b=WfzcH3PiP2wLCdLgKgfmGll3nd
 YsraBx9VDeSx/JsHO37q5zcBi8h65YBfody/Tcywzhz8lNT7QY5CWyKHvqEIZcShmL0N16c/9kfL1
 QILerFShA/1uDNmtYaHI/hayEZG1H9DtqT2aLxzNGqWw8UNA8BuOGYxD+tzbrVuf5DRQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZ24A-0005Xm-FJ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 07:49:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 34EC86008A;
 Mon, 15 Jun 2026 07:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E6261F00A3A;
 Mon, 15 Jun 2026 07:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781509740;
 bh=gfi3SSV00neQWQKyfC4FDKdat0tZ0INV/4KF5gThayU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=m0KXl6qenWKYS+AN0RebwUPQcuk8TLMz8x9no/6+PC8UoXtHrbCcLC9M60n8JSjzO
 mq4BUvVh8LYWLxvouMem5r0+PGhiSOf2Tt7jZvUHSB/9IE2LVguys4uTdBAHPAqj8d
 u+3RduM4XvvDNRbclc8bpjkxpO9pnIZ3WQH5F6zO250i70261nBaaGV24b54/C7Roa
 U0Jd76s4p8mN0dIDn1SoxGcOz1/etRfzwSAuZOuHxIcErW3uKzuhxlBCbnkHKCmY7O
 3Ey/2kpvIlPri4329zrFGjlK9PwYR520w1dFSsrMjJQ7sTG51pqx4m5qjWmRe5BNbp
 mP0Q3cpP3VTeA==
Message-ID: <c24a7513-67d8-4890-a762-ae6eebff65de@kernel.org>
Date: Mon, 15 Jun 2026 15:48:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhang Cen <rollkingzzc@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260615071954.4118409-1-rollkingzzc@gmail.com>
Content-Language: en-US
In-Reply-To: <20260615071954.4118409-1-rollkingzzc@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/15/26 15:19, Zhang Cen wrote: > f2fs_acl_count() only
 validates the aggregate ACL xattr length. A > malformed ACL can still place
 ACL_USER or ACL_GROUP in a slot that only > contains struct f2fs_ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wZ24A-0005Xm-FJ
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: validate ACL entry sizes in
 f2fs_acl_from_disk()
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
Cc: zerocling0077@gmail.com, 2045gemini@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rollkingzzc@gmail.com,m:jaegeuk@kernel.org,m:zerocling0077@gmail.com,m:2045gemini@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 95319684509

On 6/15/26 15:19, Zhang Cen wrote:
> f2fs_acl_count() only validates the aggregate ACL xattr length. A
> malformed ACL can still place ACL_USER or ACL_GROUP in a slot that only
> contains struct f2fs_acl_entry_short bytes, and f2fs_acl_from_disk()
> then reads entry->e_id before verifying that a full entry fits.
> 
> Require a short entry before reading e_tag and e_perm, and require a
> full entry before reading e_id for ACL_USER and ACL_GROUP. Return
> -EFSCORRUPTED from these new truncated-entry checks, while keeping the
> pre-existing -EINVAL paths unchanged.
> 
> Validation reproduced this kernel report:
> KASAN slab-out-of-bounds in __f2fs_get_acl+0x6fb/0x7e0
> RIP: 0033:0x7f4b835ea7aa
> The buggy address belongs to the object at ffff888114589960 which belongs
> to the cache kmalloc-8 of size 8
> The buggy address is located 0 bytes to the right of allocated 8-byte
> region [ffff888114589960, ffff888114589968)
> Read of size 4
> Call trace:
>   dump_stack_lvl+0x66/0xa0 (?:?)
>   print_report+0xce/0x630 (?:?)
>   __f2fs_get_acl+0x6fb/0x7e0 (fs/f2fs/acl.c:169)
>   srso_alias_return_thunk+0x5/0xfbef5 (?:?)
>   __virt_addr_valid+0x224/0x430 (?:?)
>   kasan_report+0xe0/0x110 (?:?)
>   __f2fs_get_acl+0x5/0x7e0 (fs/f2fs/acl.c:169)
>   __get_acl+0x281/0x380 (?:?)
>   vfs_get_acl+0x10b/0x190 (?:?)
>   do_get_acl+0x2a/0x410 (?:?)
>   do_get_acl+0x9/0x410 (?:?)
>   do_getxattr+0xe8/0x260 (?:?)
>   filename_getxattr+0xd1/0x140 (?:?)
>   do_getname+0x2d/0x2d0 (?:?)
>   path_getxattrat+0x16c/0x200 (?:?)
>   lock_release+0xc8/0x290 (?:?)
>   cgroup_update_frozen+0x9d/0x320 (?:?)
>   lockdep_hardirqs_on_prepare+0xea/0x1a0 (?:?)
>   trace_hardirqs_on+0x1a/0x170 (?:?)
>   _raw_spin_unlock_irq+0x28/0x50 (?:?)
>   do_syscall_64+0x115/0x6a0 (arch/x86/entry/syscall_64.c:87)
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f (?:?)
> 

Cc: stable@kernel.org

> Fixes: af48b85b8cd3 ("f2fs: add xattr and acl functionalities")
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
