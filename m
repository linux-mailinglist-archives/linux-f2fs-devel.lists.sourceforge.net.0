Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UhMWJgiyL2qLEgUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 10:04:24 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D00A6684642
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 10:04:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=QXKiX30v;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=CLg9iclm;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=cTIyRygA;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=CtINnXxT;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzYpgNbZr2tIeY+wl4QBXZY8RcXetGoI7rINkG6ORpM=; b=QXKiX30vxPbaKjM9nddSo1sWSQ
	4vvlzOuH+7Fk2+FDltGSLYaEKWDcmr6QfB+gavvKNt433XQWhmkKlpGGZwFv/K5/L00T0Dyv4da9V
	U8Tz/Y3+HAMWux8kzZNf2oOTgWAF/Cn1itnDgiX4WyVJGDMlzd4ZU6zY/47T7C7/i7KY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ2Io-00004r-Sc;
	Mon, 15 Jun 2026 08:04:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wZ2Io-0008WQ-Aq
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 08:04:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A/7HaUKF285OiVVqEwwEggqwl8EHC2WWLW18/9e0IEQ=; b=CLg9iclmZlQILMyzkG32O/FzrH
 ZoJes3jk29F9gks0i1WUdgRfOCUffe77cI6hhK/bUwFNs43r780/BzXbJm6V1Nh+WYOqJGJuiS3SM
 tq+zie8iF0V0EECIWs56jeUqwH1iknroeY9M0vQgBHIO6Zyf51kS6zxND70TdYE0arT8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A/7HaUKF285OiVVqEwwEggqwl8EHC2WWLW18/9e0IEQ=; b=cTIyRygAHJL90oJwSNBV1xOmwv
 kcXWE3qmLwm9a0xPqz8Ci7iXDeDA/pPVeNMj6PxwldQFb6o3I1k+sEPCjB8cVi03Cm+cgMWP/YcSg
 O+l5xFEJFZLv5mM17F1BVmLwgTYtHQKpiQVEAtvWKqQwZTy1lXniIPVcVfu1yReHpDQE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZ2Il-00075N-T1 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 08:04:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B80936008A;
 Mon, 15 Jun 2026 08:04:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455DD1F000E9;
 Mon, 15 Jun 2026 08:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781510641;
 bh=A/7HaUKF285OiVVqEwwEggqwl8EHC2WWLW18/9e0IEQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=CtINnXxTnZlixysPxZSfDYAjvxrBhKeoikkJ9lzdGRq3QfKgz+527hLVpn1WdTuIr
 GOM3/Z8bCde3Zn9F/6sGYbbDmtyeWPEEA09Bf90FskgJc6uHBIxV5EH0FuX5UV/qsL
 6eJqRgOU4Z0IS3E8sKYp1w+xLhOwxnZPdKOHtLiXQB+KD0IAs+DmsNYdPj9b3lMal0
 ytTIefLPzVqplzIIl/YroxPjxzXZJaDYtbAOSgEtyz2EPWdBtsaulNbPyWC7Z1P7Ib
 jbNi8QlFVeesgsKcDOazoy3WOh1VGIh4vprOEZM8NVyssWP8FN/Y3H9Te8/YqA4Z24
 VOlf7w8DQdaEA==
Message-ID: <7a1d2390-8416-4e1d-859e-b4ac73c0894a@kernel.org>
Date: Mon, 15 Jun 2026 16:03:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wenjie Qi <qwjhust@gmail.com>, jaegeuk@kernel.org
References: <20260528140954.3205736-1-qiwenjie@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20260528140954.3205736-1-qiwenjie@xiaomi.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/28/26 22:09,
 Wenjie Qi wrote: > f2fs_do_sync_file() calls
 f2fs_skip_inode_update() before deciding > whether it has to write an inode
 block and continue into the recovery > info/flush path. > > F [...] 
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
X-Headers-End: 1wZ2Il-00075N-T1
Subject: Re: [f2fs-dev] [PATCH] f2fs: skip clean inode update during fsync
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
Cc: qiwenjie@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qwjhust@gmail.com,m:jaegeuk@kernel.org,m:qiwenjie@xiaomi.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D00A6684642

On 5/28/26 22:09, Wenjie Qi wrote:
> f2fs_do_sync_file() calls f2fs_skip_inode_update() before deciding
> whether it has to write an inode block and continue into the recovery
> info/flush path.
> 
> For a full fsync, f2fs_skip_inode_update() currently returns false when
> FI_AUTO_RECOVER is not set.  That makes fsync on an already clean file
> call f2fs_write_inode().  f2fs_write_inode() then returns immediately if
> the in-memory timestamps match the inode block and FI_DIRTY_INODE is not
> set, but f2fs_do_sync_file() still continues through go_write and may end
> at f2fs_issue_flush().
> 
> Avoid that unnecessary path for clean, time-consistent inodes without
> FI_AUTO_RECOVER.  Keep the existing conservative checks for keep-size
> files and non-block-aligned i_size before allowing the skip, and leave the
> FI_AUTO_RECOVER path unchanged.
> 
> On a QEMU/KASAN test VM, repeated fsync() on an existing clean F2FS file
> improved from about 35.7 us/fsync to about 1.13 us/fsync.  The baseline
> issued one flush per fsync, while the patched kernel kept the F2FS flush
> count unchanged over 140000 clean fsync calls.
> 
> Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
> ---
>  fs/f2fs/f2fs.h | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9f24287de4c3..ebd485abecb4 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3668,11 +3668,13 @@ static inline bool f2fs_skip_inode_update(struct inode *inode, int dsync)
>  		spin_unlock(&sbi->inode_lock[DIRTY_META]);
>  		return ret;
>  	}
> -	if (!is_inode_flag_set(inode, FI_AUTO_RECOVER) ||
> -			file_keep_isize(inode) ||
> -			i_size_read(inode) & ~PAGE_MASK)
> +	if (file_keep_isize(inode) || i_size_read(inode) & ~PAGE_MASK)
>  		return false;
>  
> +	if (!is_inode_flag_set(inode, FI_AUTO_RECOVER))
> +		return f2fs_is_time_consistent(inode) &&
> +			!is_inode_flag_set(inode, FI_DIRTY_INODE);

IIUC, without this additional check condition, f2fs_write_inode() will skip to update
inode page as well according to the same check condition, so, do you know why will we
have so many benefits on fsync?

int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc)
{
...
	/*
	 * atime could be updated without dirtying f2fs inode in lazytime mode
	 */
	if (f2fs_is_time_consistent(inode) &&
		!is_inode_flag_set(inode, FI_DIRTY_INODE))
		return 0;

Thanks,

> +
>  	if (!f2fs_is_time_consistent(inode))
>  		return false;
>  



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
