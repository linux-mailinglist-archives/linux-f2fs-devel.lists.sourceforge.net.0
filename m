Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hg8TJTauL2rWEQUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 09:48:06 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E926844EA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 09:48:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=OyqoCaH1;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=k4GieXLN;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=BRfcP7b0;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=NwdvPNsP;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3quCOMOYm7Dk3eYtezA7Dza1sekxUfuTDfaQ80dm5A=; b=OyqoCaH1Etq2ViAb6058YFpvTh
	K7bUuDUiJ8XRXsF7wvxrZAebbiMa4EOBj2WFrVAzs48FBIdECR6MGIaElVeGfiT9l5MwaaiBH95K0
	54oVjEwpx6Mil/drmJ9LI4qxIIOiUAz9fp8HvyZtZgu+YYRgFP3Gmn+yIn1x/PRJQVCk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ230-00079Q-9b;
	Mon, 15 Jun 2026 07:47:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wZ22y-00079J-6n
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 07:47:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A4PEFDiKVjBjc437nkKrTm0Y46RlKHnQkTSU9vUCLOU=; b=k4GieXLNp2tHtCOQDrvtXcu4sG
 l/hdJICs4osO/A0PdTetAgxmOTs3NHdBUYsqzlp3ina2NxT6TEqoIF9Rust9wdfvTQUJ7C6wtp6Ys
 OH1Tta2pW/wWrF5Wv5ubwz1oB9t6u+/Qn7IFuk4I/m5l5HRO9PIVeHonkCQxp5BudXIw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A4PEFDiKVjBjc437nkKrTm0Y46RlKHnQkTSU9vUCLOU=; b=BRfcP7b0TNzotrXQr3oAaxfEwK
 VrHfuVFc5Ec66dfkpwCUUwFV3kk/3BufHAkmcSrGAf0jA8ys9EyuadI63SE6C3dgoIWtJ0Pv+WI58
 Y0sAmyVhmlQkQ0/qHLKgCjiT4M6cF3ulJDo+SmsxERqkW9i+MPuewxRnBU135dPz+GXU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZ22v-0005R5-K9 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 07:47:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9556B417FD;
 Mon, 15 Jun 2026 07:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EECFE1F000E9;
 Mon, 15 Jun 2026 07:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781509659;
 bh=A4PEFDiKVjBjc437nkKrTm0Y46RlKHnQkTSU9vUCLOU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=NwdvPNsPfviCl6xUVdTG0Enldakh9vlHNj1EYRFYZujA9X1yI78ZKlxVv78tM7sxd
 LDMyUenyWLmSW19VffyN+LErdlxt760c0GOvsJRvd86z5xgthpZcwU97zISdBJZAww
 x+p3rTgU80jjsxMsxX4+7F69+tWlwGamlZ3oovxio239dcvpBENy/FgC2sCrYZ8bry
 Ix7s/d0U6jdTVBhYFxXbSjtiJpEeFPcIJjS/Ymt13vypn3uLZS24J8emfHmYVKpq1G
 lUHGmZgX5EZk1P/eBTd1AM5KRiR6QIKAvl8GCUl4xPkkyaRm8vBfrx5AIQly0Z3Kkv
 nRnNBioYLIWyA==
Message-ID: <899acd73-4247-4a8a-9b3a-58f03d550bca@kernel.org>
Date: Mon, 15 Jun 2026 15:47:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mikhail Lobanov <m.lobanov@rosa.ru>, jaegeuk@kernel.org
References: <20260605103834.14894-1-m.lobanov@rosa.ru>
Content-Language: en-US
In-Reply-To: <20260605103834.14894-1-m.lobanov@rosa.ru>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/5/26 18:38, Mikhail Lobanov wrote: > When updating an
 atomic-write file, f2fs_write_begin() may read the > previously written data
 back from the COW inode: > prepare_atomic_write_begin() locates [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wZ22v-0005R5-K9
Subject: Re: [f2fs-dev] [PATCH] f2fs: read COW data with the original inode
 during atomic write
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
Cc: lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 daehojeong@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
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
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:m.lobanov@rosa.ru,m:jaegeuk@kernel.org,m:lvc-project@linuxtesting.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:daehojeong@google.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rosa.ru:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 83E926844EA

On 6/5/26 18:38, Mikhail Lobanov wrote:
> When updating an atomic-write file, f2fs_write_begin() may read the
> previously written data back from the COW inode:
> prepare_atomic_write_begin() locates the block in the COW inode and sets
> use_cow, and the read bio is then built with the COW inode:
> 
> 	f2fs_submit_page_read(use_cow ? F2FS_I(inode)->cow_inode : inode,
> 			      ...);
> 
> and f2fs_grab_read_bio() decides whether to schedule fs-layer decryption
> (STEP_DECRYPT) for the bio based on that inode via
> fscrypt_inode_uses_fs_layer_crypto().
> 
> However, the folio being filled belongs to the original inode
> (folio->mapping->host == inode), and the data stored in the COW block was
> encrypted (or left as plaintext) using the original inode's context, not
> the COW inode's -- see f2fs_encrypt_one_page(), which keys off
> fio->page->mapping->host.  fscrypt_decrypt_pagecache_blocks() likewise
> operates on folio->mapping->host.
> 
> The COW inode is created as a tmpfile in the parent directory and inherits
> its encryption policy from there.  With test_dummy_encryption the newly
> created COW inode gets the dummy policy and becomes encrypted, while a
> pre-existing regular file -- created before the policy applied, e.g.
> already present in the on-disk image -- stays unencrypted.  The read
> path then sets STEP_DECRYPT based on the encrypted COW inode and calls
> fscrypt_decrypt_pagecache_blocks() on a folio whose host (the unencrypted
> original inode) has a NULL ->i_crypt_info, dereferencing it:
> 
>   Oops: general protection fault, probably for non-canonical address ...
>   KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
>   RIP: 0010:fscrypt_decrypt_pagecache_blocks+0xa0/0x310
>   Workqueue: f2fs_post_read_wq f2fs_post_read_work
>   Call Trace:
>    fscrypt_decrypt_bio+0x1eb/0x340
>    f2fs_post_read_work+0xba/0x140
>    process_one_work+0x91c/0x1a40
>    worker_thread+0x677/0xe90
>    kthread+0x2bc/0x3a0
> 
> The COW inode is only needed to locate the on-disk block, and that block
> address is already resolved into @blkaddr; the data's crypto state belongs
> to the original inode.  Read with the original inode so the post-read
> decryption decision matches the folio's owner.  This also makes the inline
> crypto path use the correct (original inode's) key.
> 
> Fixes: 591fc34e1f98 ("f2fs: use cow inode data when updating atomic write")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mikhail Lobanov <m.lobanov@rosa.ru>

It leaves use_cow as no useful variable in f2fs_write_begin(), can we drop it in
f2fs_write_begin() and prepare_atomic_write_begin()?

Anyway, it's about cleanup, the fix itself looks good to me.

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
