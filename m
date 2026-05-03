Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cI/CBqMZ92n5bwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 03 May 2026 11:47:15 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 488064B512F
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 03 May 2026 11:47:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONqXet2XAvGbHX5cAya+totTverk70/FfADZn9u3Xrs=; b=XnPsKIMAHZjaMjHrH9r1eVsRsp
	6svB0e3u31e1HetKv5VLUhZ6vQp+etD4kxoCw5TmtB/T1e36oXbXO+B2+bilwD0CsxUyECkHHTYfc
	UhMqmlhynFWNJktMiX4mmTYhRiZgz/eqwt/FRvrZQb5912YBCMZLmqOhda+ATeD/KNcI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wJTPi-0001TT-9h;
	Sun, 03 May 2026 09:47:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wJTPh-0001TN-3I
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 May 2026 09:47:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uAPQNqx2P/nOJFN3y+WbiABtrJ/iUV32YAIDWSwpyyM=; b=SnczQBwrA980l6oBcpMcZJv04i
 ZqvNhXO0z8/w0vVmQcB552Q1V3gyk6HVEwL/XbYLXt5qTslf0go+Z1iB20vUMaXvy/+u4tUcG/Apn
 eULZL/xdUTpQr0vy3vKj6yLTgxXk84WQFi9RSy1CTpYSdqbdnaSVjSuht294C2BOcxjA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uAPQNqx2P/nOJFN3y+WbiABtrJ/iUV32YAIDWSwpyyM=; b=SbwrLyflUc5Y+oUgvRmvUH1U7g
 +74XdIqXrxoRIiIii5SaaK+h6NA48P1IgbpIHXBBtw7e8NqQ4uvgNIHNcOsPStYxjfUbxZwhqF1gt
 F20loXmTtn9lElo6dHqVp7Ln93/lH3tyggm93u2/g8N5HHl5NlYLD79TCmaLNCdWb+Dk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wJTPg-000423-V1 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 May 2026 09:47:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4B5A760052;
 Sun,  3 May 2026 09:46:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 394BCC2BCB4;
 Sun,  3 May 2026 09:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777801610;
 bh=mCe1FlnmnUjohQTntNZEx42H9cLeeMfqdNdggNwpMQc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=M3l6QTq5MvpmGvEd6FCx74j2SCJAFnIZJ5oONS4prWRIB34Q11fBlpUiHuLr6JYGC
 iJL/h1xLZCibmyLsAUwOK7Lk8/dTprEaRINp01JTP7D7b91sq4Qf2hUxVIoS41L5w5
 pUxmcrX569XcHm8GX3l4Hfzh3VhP6PuyCAp2+rTBQVuBDwHCWgp9OjaAC2C6p0dXuI
 i+tOBVuTTyBa/jaINtK3eTtZagpEt5c+SF6BZYTz4VCrtSrc2VmrLRlAEjQPIakE72
 3ezlwNPDv+0nq9Z6dnGBkKhC73eim1xbYQASDVSOcYnS/wbKLgAsaog+z5itDuy1qR
 LpBvDNEWbEE6A==
Message-ID: <2ba0b3ad-615e-43c8-a165-af631607a4c3@kernel.org>
Date: Sun, 3 May 2026 17:46:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cen Zhang <zzzccc427@gmail.com>, jaegeuk@kernel.org
References: <20260503045820.973718-1-zzzccc427@gmail.com>
Content-Language: en-US
In-Reply-To: <20260503045820.973718-1-zzzccc427@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/3/26 12:58,
 Cen Zhang wrote: > The discard command control
 is built while the segment manager is > constructed, before the node manager
 is built and before mount recovery > has completed. Startin [...] 
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
X-Headers-End: 1wJTPg-000423-V1
Subject: Re: [f2fs-dev] [PATCH] f2fs: start discard thread after mount
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
X-Rspamd-Queue-Id: 488064B512F
X-Rspamd-Action: no action
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
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zzzccc427@gmail.com,m:jaegeuk@kernel.org,m:baijiaju1990@gmail.com,m:linux-kernel@vger.kernel.org,m:quic_stummala@quicinc.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,quicinc.com,lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns];
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

On 5/3/26 12:58, Cen Zhang wrote:
> The discard command control is built while the segment manager is
> constructed, before the node manager is built and before mount recovery
> has completed. Starting the discard thread from that constructor lets the
> background thread run while f2fs_fill_super() is still publishing and
> initializing mount-time state.
> 
> After commit d6d2b491a82e ("f2fs: allow to change discard policy based
> on cached discard cmds"), issue_discard_thread() may consult node-manager
> memory thresholds through f2fs_available_free_memory(). It can therefore
> observe sbi->nm_info while f2fs_build_node_manager() is publishing and
> initializing it. The same early-start window also lets the thread test
> the superblock read-only state while recovery paths still make temporary
> SB_RDONLY transitions.

Not sure I understood you correctly, do you mean this?

- f2fs_fill_super
  - f2fs_build_segment_manager
   - create discard thread
  - f2fs_build_node_manager
   - allocate memory sbi->nm_info
...
  - f2fs_destroy_node_manager
				- issue_discard_thread
		                 - f2fs_available_free_memory()
   - free sbi->nm_info
                                   - UAF: access sbi->nm_info->ram_thresh

Thanks,

> 
> Keep create_discard_cmd_control() limited to allocating and publishing
> the command-control object, which recovery can use to queue discard
> commands. Start the discard thread later in f2fs_fill_super(), after POR,
> recovery, checkpoint option handling, and discard tuning have completed.
> If starting the thread fails, unwind the shrinker and any GC thread that
> may already have been started before continuing through the existing
> mount-failure cleanup path.
> 
> Fixes: d6d2b491a82e1e411a6766fbfb87c697d8701554 ("f2fs: allow to change discard policy based on cached discard cmds")
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> ---
>   fs/f2fs/segment.c | 17 ++++-------------
>   fs/f2fs/super.c   | 12 ++++++++++++
>   2 files changed, 16 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 8390994a8..deb98f564 100644
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
> index 40079fd78..8228be53d 100644
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
