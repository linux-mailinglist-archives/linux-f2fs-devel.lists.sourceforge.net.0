Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGeOInEDFWroSAcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2026 04:20:33 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D30065CFCDB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 May 2026 04:20:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exGPm+Eml64WVhweJi5ZBMMvpoTkEMwO1xNlzFv6sGs=; b=L74QCX7QWZbFBO2snU80XTiVca
	hEPs4Ug5JDqcdJW65Ec4AoS8VwtBy8rIFWPYBMUmdmkjkBmt7vhdLR7ckiJoU6cJdgogZQXOxHUN6
	ST7XXfomD/jp8Oy+jUExZ9XQuSCOslHeMvX16ja6KaxFeNO7Myx9yk7VdKKKtHwqqlCM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wRhP9-0004GJ-HU;
	Tue, 26 May 2026 02:20:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wRhOf-0004FC-PC
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 May 2026 02:19:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BKpEdmsuhVEwihwghwAM1HMmKXBWA3sbZTpWp49l25M=; b=kjVhbhFbmN0TyNM89kWwd/T+xj
 6SyOUnVNSElN5m40ePJgavU5pEvVTrta4win/tw2cRd0OjsaYJEtIqOeTnpB/PorZd894pdd9FZi0
 eqAt45EBIG9AbGPI/jaW6DjaXgQvFHOPlPgyk9k6BDT3YzCgfCQPOqEN0Chc6p+IIY6Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BKpEdmsuhVEwihwghwAM1HMmKXBWA3sbZTpWp49l25M=; b=FM76k3EBDAJ04hOWgZKkC6ofnb
 xvqMUdGflxEX7kDROtfOPdN5PQDTaU3McOCl5JF8JBOGMiCeKRljRgax9h42k8tqyC0LE9peDBAp/
 4LjzY9HgY8AF+LWTJHkva0/0kIRuIXX34VomGNIDbcJ5ZO0seEHJYnVwIpDuoz60mV/o=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wRhOe-00032b-P9 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 May 2026 02:19:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id BC8284345B;
 Tue, 26 May 2026 02:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1B31F000E9;
 Tue, 26 May 2026 02:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779761991;
 bh=BKpEdmsuhVEwihwghwAM1HMmKXBWA3sbZTpWp49l25M=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=VjCCO9PQJJyT6Wj1Z3TiGcXhxEVRv4p0J4VKlSAyJgv2z34EuC6PGcLoDU6qrAbuX
 2kPSsoVIDoI3O0+NWrUIianeQqlh4lNXaCiZTrrXo8Ie0bV9B+E2cRHmNlCOEj57wm
 V2SbQtwUwTypCQOxqECQ5ksVMcK5LU7J2+UMMhfgviXVm4GwEZjyIQ5yn7MvKDOKQF
 z39ERwh7sK2cwmCFg7MjklvsTiLtyvpvVEdI5psXfWtYQ/0oUJyy2F9fY83yd5RolV
 7ZDu7YaF88yvZD5tSgI2f7UZbQYDaXte/ICdGb+T+FDrjLenAEJiEB67zKB4XC8Lke
 S2IetpFjW7s9g==
Message-ID: <86c2f79d-ee26-4009-8051-82d25abf6d7b@kernel.org>
Date: Tue, 26 May 2026 10:19:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wenjie Qi <qwjhust@gmail.com>, jaegeuk@kernel.org
References: <20260525114621.571845-1-qiwenjie@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20260525114621.571845-1-qiwenjie@xiaomi.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/25/26 19:46,
 Wenjie Qi wrote: > f2fs_recover_orphan_inodes()
 trusts the orphan block entry_count when > replaying orphan inodes from the
 checkpoint pack. A corrupted > entry_count larger than F2F [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wRhOe-00032b-P9
Subject: Re: [f2fs-dev] [PATCH] f2fs: validate orphan inode entry count
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 qiwenjie@xiaomi.com, stable@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qwjhust@gmail.com,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:qiwenjie@xiaomi.com,m:stable@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,xiaomi.com:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: D30065CFCDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/25/26 19:46, Wenjie Qi wrote:
> f2fs_recover_orphan_inodes() trusts the orphan block entry_count when
> replaying orphan inodes from the checkpoint pack.  A corrupted
> entry_count larger than F2FS_ORPHANS_PER_BLOCK makes the recovery loop
> read past the ino[] array and interpret footer or following data as
> inode numbers.
> 
> On a crafted image, mounting an unpatched kernel can drive orphan
> recovery into f2fs_bug_on() and panic the kernel.  Validate entry_count
> before consuming entries so corrupted checkpoint data fails the mount
> with -EFSCORRUPTED and requests fsck instead.
> 
> Fixes: 127e670abfa7 ("f2fs: add checkpoint operations")
> Cc: stable@kernel.org
> Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
> ---
>  fs/f2fs/checkpoint.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index c00a6b6ebcbd..fc72b69ff769 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -943,6 +943,7 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
>  	for (i = 0; i < orphan_blocks; i++) {
>  		struct folio *folio;
>  		struct f2fs_orphan_block *orphan_blk;
> +		unsigned int entry_count;
>  
>  		folio = f2fs_get_meta_folio(sbi, start_blk + i);
>  		if (IS_ERR(folio)) {
> @@ -951,7 +952,17 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
>  		}
>  
>  		orphan_blk = folio_address(folio);
> -		for (j = 0; j < le32_to_cpu(orphan_blk->entry_count); j++) {
> +		entry_count = le32_to_cpu(orphan_blk->entry_count);
> +		if (entry_count > F2FS_ORPHANS_PER_BLOCK) {
> +			f2fs_err(sbi, "invalid orphan inode entry count %u",
> +				 entry_count);
> +			set_sbi_flag(sbi, SBI_NEED_FSCK);

Well, at this stage, I guess there is no chance to persist SBI_NEED_FSCK flag,
what about introduce ERROR_INCONSISTENT_ORPHAN in enum f2fs_error, so that
we can persist the new bit to provide hint to fsck?

Thanks,

> +			err = -EFSCORRUPTED;
> +			f2fs_folio_put(folio, true);
> +			goto out;
> +		}
> +
> +		for (j = 0; j < entry_count; j++) {
>  			nid_t ino = le32_to_cpu(orphan_blk->ino[j]);
>  
>  			err = recover_orphan_inode(sbi, ino);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
