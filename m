Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HXntECRwL2reAQUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 05:23:16 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 865DC68305F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 05:23:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=TKVFP8W1;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=WIbTAU9Z;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=cCptEnK3;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=NaDH5e4F;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WeFaF+W8URzecJ9ye7VRMdcdS5k9BKo8xgVewcsWmZQ=; b=TKVFP8W11s0OauEKX5duujNBkD
	PO+aUueMh/SIppZOKciZ6Xvcf69ru7WshGa2FtYvIweoJsBgmNDYgdG1Ru3nbzBXVTlJc8LXWsgce
	rhjZZb6kL3MmYo21tolOyrwv5qFI2BeoF2/yROXZiZNqwFVRiOEMCiMR9nQ7AvgNLG/E=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wYxun-00027z-7v;
	Mon, 15 Jun 2026 03:23:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wYxul-00027s-KO
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 03:23:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SfPVj0aEgdaDeOEHqtnKRb087JFANu3x7EzZ4cr9AKk=; b=WIbTAU9ZDN6noKvIg6I3JqsvEl
 rETrTVyB69pTgrpNK4py3XVqgqPVHNBuSdJZ6cnqE6WxyivGYDVkf10JpTplITJC4V+NBAC6UHIaC
 syhQLzgNsXYnc2sfhYrFFLrEUUbbHVLujACywSAFpt0MO41eWEInFtKiWb33wgXh9vwo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SfPVj0aEgdaDeOEHqtnKRb087JFANu3x7EzZ4cr9AKk=; b=cCptEnK3igEzrQ8H9TYfeHTqxu
 8yCYc8fvk82hv4Iq+ox7WXejojn41THljrprZTv5VFYXzfNwEGlruB2msxUJOp0Xm8PGdMpHmvghR
 M2N5vxlTY566TsPgdvxX0Y+Ow/g3IDB4xZNft6BUuUOIe+h3z9GC+XJfFlXv2p9cP17s=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wYxuk-00006k-Ta for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 03:23:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id DB49D43F1C;
 Mon, 15 Jun 2026 03:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF2D1F000E9;
 Mon, 15 Jun 2026 03:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781493776;
 bh=SfPVj0aEgdaDeOEHqtnKRb087JFANu3x7EzZ4cr9AKk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=NaDH5e4FHQlddFsxZi8k0Pgwu6CzFFH/eLFX4sMPEzlcWEUFpuVkkk5VPWgzVL6Kx
 aqYzx28JWTrLOImRZuycjP05hKlnC8DY9nUa38+WL/Ux1f5i5jv4qF847U1LsbgkX4
 hoBFAv6UZUwUuZkiCzIw+LCdHWfVEKAsPJntMf4dwlX0ezEd4Gy7MMLEXjKpQdY5mI
 5s59IVAfr+P3S64kqqzPyHoqvJzTXyWNeq+4ErVehBUMnomJLTFCI+s9HXuQ3t48Vj
 FY4mE1ROUp0kyPGUvTshvUPeBePml9KurjfaRcCVBxaYIbI33VAtU1No4d+JPoe0nR
 UD2hYUTdeG3FA==
Message-ID: <b4a22755-9b8f-4670-a227-95c492f20475@kernel.org>
Date: Mon, 15 Jun 2026 11:22:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhang Cen <rollkingzzc@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260613110526.1347194-1-rollkingzzc@gmail.com>
Content-Language: en-US
In-Reply-To: <20260613110526.1347194-1-rollkingzzc@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/13/26 19:05, Zhang Cen wrote: > f2fs_acl_count() only
 validates the aggregate ACL xattr length. A > malformed ACL can still place
 ACL_USER or ACL_GROUP in a slot that only > contains struct f2fs_ [...] 
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
X-Headers-End: 1wYxuk-00006k-Ta
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: validate ACL entry sizes in
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rollkingzzc@gmail.com,m:jaegeuk@kernel.org,m:zerocling0077@gmail.com,m:2045gemini@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 865DC68305F

On 6/13/26 19:05, Zhang Cen wrote:
> f2fs_acl_count() only validates the aggregate ACL xattr length. A
> malformed ACL can still place ACL_USER or ACL_GROUP in a slot that only
> contains struct f2fs_acl_entry_short bytes, and f2fs_acl_from_disk()
> then reads entry->e_id before verifying that a full entry fits.
> 
> Require a short entry before reading e_tag and e_perm, and require a
> full entry before reading e_id for ACL_USER and ACL_GROUP. Return
> -EFSCORRUPTED for malformed on-disk ACL blobs so corrupted ACL xattrs
> are reported as filesystem corruption instead of generic invalid
> arguments.
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
> Fixes: af48b85b8cd3 ("f2fs: add xattr and acl functionalities")
> 
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>
> ---
> Changes in v2:
> - Wrap the new ACL entry-size checks in unlikely().
> - Return -EFSCORRUPTED for malformed on-disk ACL blobs.
> 
>  fs/f2fs/acl.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/acl.c b/fs/f2fs/acl.c
> index fa8d81a30fb91..e62ce979be0b7 100644
> --- a/fs/f2fs/acl.c
> +++ b/fs/f2fs/acl.c
> @@ -53,14 +53,14 @@ static struct posix_acl *f2fs_acl_from_disk(const char *value, size_t size)
>  	const char *end = value + size;
>  
>  	if (size < sizeof(struct f2fs_acl_header))
> -		return ERR_PTR(-EINVAL);
> +		return ERR_PTR(-EFSCORRUPTED);

The change is not related to this patch, right? I suspect you only give the
hint to let LLM to replace EINVAL w/ EFSCORRUPTED in f2fs_acl_from_disk(),
rather than replacing in newly added lines.

>  
>  	if (hdr->a_version != cpu_to_le32(F2FS_ACL_VERSION))
> -		return ERR_PTR(-EINVAL);
> +		return ERR_PTR(-EFSCORRUPTED);

Ditto,

>  
>  	count = f2fs_acl_count(size);
>  	if (count < 0)
> -		return ERR_PTR(-EINVAL);
> +		return ERR_PTR(-EFSCORRUPTED);

Ditto,

>  	if (count == 0)
>  		return NULL;
>  
> @@ -70,7 +70,8 @@ static struct posix_acl *f2fs_acl_from_disk(const char *value, size_t size)
>  
>  	for (i = 0; i < count; i++) {
>  
> -		if ((char *)entry > end)
> +		if (unlikely((char *)entry +
> +			     sizeof(struct f2fs_acl_entry_short) > end))
>  			goto fail;
>  
>  		acl->a_entries[i].e_tag  = le16_to_cpu(entry->e_tag);
> @@ -86,6 +87,9 @@ static struct posix_acl *f2fs_acl_from_disk(const char *value, size_t size)
>  			break;
>  
>  		case ACL_USER:
> +			if (unlikely((char *)entry +
> +				     sizeof(struct f2fs_acl_entry) > end))
> +				goto fail;
>  			acl->a_entries[i].e_uid =
>  				make_kuid(&init_user_ns,
>  						le32_to_cpu(entry->e_id));
> @@ -93,6 +97,9 @@ static struct posix_acl *f2fs_acl_from_disk(const char *value, size_t size)
>  					sizeof(struct f2fs_acl_entry));
>  			break;
>  		case ACL_GROUP:
> +			if (unlikely((char *)entry +
> +				     sizeof(struct f2fs_acl_entry) > end))
> +				goto fail;
>  			acl->a_entries[i].e_gid =
>  				make_kgid(&init_user_ns,
>  						le32_to_cpu(entry->e_id));
> @@ -108,7 +115,7 @@ static struct posix_acl *f2fs_acl_from_disk(const char *value, size_t size)
>  	return acl;
>  fail:
>  	posix_acl_release(acl);
> -	return ERR_PTR(-EINVAL);
> +	return ERR_PTR(-EFSCORRUPTED);

Ditto,

Thanks,

>  }
>  
>  static void *f2fs_acl_to_disk(struct f2fs_sb_info *sbi,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
