Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDg3M2L2/mmy0QAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 09 May 2026 10:54:58 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 281B24FED9D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 09 May 2026 10:54:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6h7Qh9p21QxSNqQ/E0A3wFzlNUMBUF5sftjduO2hPfY=; b=KIJHAnNaTtos00eXkrlBMNKu1O
	JiSqGBO0WE3GkTL+SvOqJ4L1u8LKg2jLw3xJq0n3aFnPLCzpDMJ9X3VF1CDSbXQ62RfyQco87UG+P
	id0G8WEV3qz6UFoF87i3slV2t1lkV1UaDpkNXaBSD3ELA4MMYPg4kK0THU9HRyMZ8LuI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wLdSS-0003jI-II;
	Sat, 09 May 2026 08:54:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wLdSQ-0003jC-U3
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 May 2026 08:54:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nNTkpddmGvOtuvoYsNbkmikBpFInvaZbPriGBFgEwZU=; b=d1Jm1kGmRKOmYZzC4Av5pSuQ1r
 /Qs3F3sxvcKLy6rja6Adwtg03RDzekF0GCoCGN3oJmpP3C12Za9TL1Lm2jd922lQqYUS6jSdjomOU
 wHvGO69ixYnxSuAkbp0+ISSVm20njIIHzEN09XJ9AWT7RIoOt6gA883MXi0Ov6ZxNnGs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nNTkpddmGvOtuvoYsNbkmikBpFInvaZbPriGBFgEwZU=; b=ifKntTvZfFG/E4Y87QrK/Fdzv+
 +rbmDu7R5qkh1NVYf5Q0lpCgTbejoIq5upaQw7wis+mo3aX8QAHvyJr7G9LZfz6LsNxn4moVUuZTS
 iWxbVCPFZMqfB7gP95UyFJW9eLmW0wxpaqHw99RDsCxoDmZUIXDMyYwKJswQL3C8OTnY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wLdSP-0007Cs-9E for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 May 2026 08:54:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9B7BE6024D;
 Sat,  9 May 2026 08:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99E5AC2BCB2;
 Sat,  9 May 2026 08:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778316874;
 bh=kACYnYiEPp138gxpFCBVt443jU5FbdAoCxCKB42Pyhw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=t57Giu1krAmBI55Kze9IRY4xhgiKyLaZ0OFnOimJPhUgOEy0WOtDpctEtFMICxfN5
 Q2URHkl9QWJhGE89dAC3UXEkGqYC2MLHVNCbHBQCvTeSTLQo6K075sPWgEOIyKpWGI
 Hl7N2Ygex/qxUAQqH5vaFS/FlVVHP8q7b0foYKyAiCCz9iJOW6US5VKrbIB74HTaLf
 OipADClPXM5Cin6piHrbTIhSsKgaMicwXebjIrk887miLRA7kZy4Hwm+Cn8polxi1O
 oDqSquqgb5no8SjTufy8o8HkfHINGrBntrvFgCAoRZQIPH61xaBhaJMrXJ8Ey9Vye+
 ZhWnvzDglKgWg==
Message-ID: <b31b24d1-f907-499f-bad5-aee5527cacfc@kernel.org>
Date: Sat, 9 May 2026 16:54:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cen Zhang <zzzccc427@gmail.com>, jaegeuk@kernel.org
References: <20260504133552.1902811-1-zzzccc427@gmail.com>
Content-Language: en-US
In-Reply-To: <20260504133552.1902811-1-zzzccc427@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/4/26 21:35,
 Cen Zhang wrote: > create_discard_cmd_control()
 is called from f2fs_build_segment_manager(), > before f2fs_build_node_manager()
 and mount recovery have completed. It > currently start [...] 
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
X-Headers-End: 1wLdSP-0007Cs-9E
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: start discard thread after mount
 recovery
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
Cc: baijiaju1990@gmail.com, linux-kernel@vger.kernel.org,
 quic_stummala@quicinc.com, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 281B24FED9D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,quicinc.com,lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zzzccc427@gmail.com,m:jaegeuk@kernel.org,m:baijiaju1990@gmail.com,m:linux-kernel@vger.kernel.org,m:quic_stummala@quicinc.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim];
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
X-Rspamd-Action: no action

On 5/4/26 21:35, Cen Zhang wrote:
> create_discard_cmd_control() is called from f2fs_build_segment_manager(),
> before f2fs_build_node_manager() and mount recovery have completed.  It
> currently starts the discard thread immediately, so issue_discard_thread()
> can run while f2fs_fill_super() is still initializing mount-time state.
> 
> This is not the failure-unwind case where free_nm stops the discard
> thread before f2fs_destroy_node_manager() frees nm_info.  The window is
> earlier: the thread may run while f2fs_build_node_manager() has published
> sbi->nm_info but init_node_manager() is still initializing it.  After
> commit d6d2b491a82e, issue_discard_thread() may call
> f2fs_available_free_memory() and read fields such as nm_i->ram_thresh.
> 
> The same early-start window also lets the discard thread observe the
> superblock read-only state while mount recovery is still making temporary
> SB_RDONLY transitions.
> 
> Keep the discard command control available early, but start the discard
> thread later in f2fs_fill_super(), after node-manager initialization and
> mount recovery have completed.
> 
> 

Cc: stable@kernel.org

> Fixes: d6d2b491a82e1e411a6766fbfb87c697d8701554 ("f2fs: allow to change discard policy based on cached discard cmds")

Fixes: d6d2b491a82e ("f2fs: allow to change discard policy based on cached discard cmds")

otherwise, ./scripts/checkpatch.pl will complain as below:

ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit d6d2b491a82e ("f2fs: allow to change discard policy based on cached discard cmds")'

Thanks,

> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> ---
>   fs/f2fs/segment.c | 17 ++++-------------
>   fs/f2fs/super.c   | 12 ++++++++++++
>   2 files changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 8390994a8826..deb98f564165 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2302,12 +2302,10 @@ int f2fs_start_discard_thread(struct f2fs_sb_info *sbi)
>   static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
>   {
>   	struct discard_cmd_control *dcc;
> -	int err = 0, i;
> +	int i;
>   
> -	if (SM_I(sbi)->dcc_info) {
> -		dcc = SM_I(sbi)->dcc_info;
> -		goto init_thread;
> -	}
> +	if (SM_I(sbi)->dcc_info)
> +		return 0;
>   
>   	dcc = f2fs_kzalloc(sbi, sizeof(struct discard_cmd_control), GFP_KERNEL);
>   	if (!dcc)
> @@ -2344,14 +2342,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
>   
>   	init_waitqueue_head(&dcc->discard_wait_queue);
>   	SM_I(sbi)->dcc_info = dcc;
> -init_thread:
> -	err = f2fs_start_discard_thread(sbi);
> -	if (err) {
> -		kfree(dcc);
> -		SM_I(sbi)->dcc_info = NULL;
> -	}
> -
> -	return err;
> +	return 0;
>   }
>   
>   static void destroy_discard_cmd_control(struct f2fs_sb_info *sbi)
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 40079fd7886b..8228be53d036 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -5340,6 +5340,15 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>   
>   	f2fs_tuning_parameters(sbi);
>   
> +	/*
> +	 * After POR and mount-time recovery, we can run the discard thread. It
> +	 * reads node-manager memory thresholds and the superblock read-only
> +	 * state, so keep it out of the fill_super() initialization window.
> +	 */
> +	err = f2fs_start_discard_thread(sbi);
> +	if (err)
> +		goto leave_shrinker;
> +
>   	f2fs_notice(sbi, "Mounted with checkpoint version = %llx",
>   		    cur_cp_version(F2FS_CKPT(sbi)));
>   	f2fs_update_time(sbi, CP_TIME);
> @@ -5349,6 +5358,9 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>   	sbi->umount_lock_holder = NULL;
>   	return 0;
>   
> +leave_shrinker:
> +	f2fs_leave_shrinker(sbi);
> +	f2fs_stop_gc_thread(sbi);
>   sync_free_meta:
>   	/* safe to flush all the data */
>   	sync_filesystem(sbi->sb);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
