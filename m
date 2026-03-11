Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LgCGmUssWkBrgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 09:48:37 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB8725FAA3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 09:48:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUCLAyBM6hsbYWZ71yPbIEtaMqlCvlxIg0iTDUxhGXg=; b=Z+KhCe0MaZym4hO67y74lEZYd0
	+gh80ti+XUe/CceM2D4KJOcpMKhSJ3wyG02gQP6MItecG4d5KnEs8FO5O+yOezEvCvLQ158G5VfQw
	XOf8XG1Ow7D5sWuJR/mSn0NuLMfQBRcsSsvlrbRYIVQFzr7xoFzWKEu0wkVNHJbrsgq8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0FF0-0003JO-Sc;
	Wed, 11 Mar 2026 08:48:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w0FEz-0003JH-UD
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 08:48:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CFHhVXj3uj+85WpRhfvQ2K5+IW4UBnep+RCzVVkYMyo=; b=kDJgepimhTYVk75al7NJI5DEp1
 OqMCMoWSEX4dTzU6H0QpDz9TbLg3cFdINpaN1qFzswwNVlDHTg6TtJE/PsDgNbEo4fPtMtE+w4mWb
 rnMhKtvLpDEcPdeCtFS/dx+6H2XrV2aqRjjJzJ8xVyzP4JbNkYP3edLBBszyMRp09m74=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CFHhVXj3uj+85WpRhfvQ2K5+IW4UBnep+RCzVVkYMyo=; b=UaEtNyjadQihZkU7JlhnGzIZQd
 HgGOIDFYZMRM8Fu4HuYLYZW8HV20p2F0fFjIMRyV0GjjpR9NYK7rvtcFPhHQnkCSSlXjE6KXeaL66
 S3DYeuKpH/t3Sg7m45ZOMIGWq4SX+KlwoUkr8rDBVrEfbrWpcyB/CeVpNLDyKHwn/43Y=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0FEz-000638-Gs for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 08:48:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DD1E46013E;
 Wed, 11 Mar 2026 08:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CC58C4CEF7;
 Wed, 11 Mar 2026 08:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773218903;
 bh=lyD4+d3PpvJs0u0gKEum/cK3rf2tA6WXn6Kjd4jBlYU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=e10M1XMDxNGC1a0QEMIL8ScmWB+LvmGzV+y0qVC8JsWtFux8ILFLp2c2tJkC0KWhJ
 dkTuDaRWW6zvKMqukm0CPQK9ihozq9PQWppui2Hk5xjmKvDIkw7C8RiM5SmpDgLwn1
 1wFbhGeEw8N/VaKISdJyByoKitAF0pYu3FyXKNytWka+onkeS1QmNfK7QVa+qRNIBH
 JEkVusXR3jnobmFayuOL2lktN7nqY0p4IIwkzQQMWet1z64QE8kZkcoF22ptupvsfq
 KGiuhqRl9PFxz+35DiCF1DFfoZRHtZD0dhKmK+X1GuVAH8/evmOu0Mdnwo8PxByYgG
 p9A3uJkyZ/PvA==
Message-ID: <1d83a0fd-77bd-43e5-b0a6-ed6dcffdbde8@kernel.org>
Date: Wed, 11 Mar 2026 16:48:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260310093611.2865092-2-monty_pavel@sina.com>
 <20260310093611.2865092-6-monty_pavel@sina.com>
Content-Language: en-US
In-Reply-To: <20260310093611.2865092-6-monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/10/26 17:36, Yongpeng Yang wrote: > From: Yongpeng Yang
 <yangyongpeng@xiaomi.com> > > Data loss can occur when fsync is performed
 on a newly created file > (before any checkpoint has been written [...] 
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w0FEz-000638-Gs
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: fix data loss caused by incorrect
 use of nat_entry flag
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: AFB8725FAA3
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
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,xiaomi.com:email]
X-Rspamd-Action: no action

On 3/10/26 17:36, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> Data loss can occur when fsync is performed on a newly created file
> (before any checkpoint has been written) concurrently with a checkpoint
> operation. The scenario is as follows:
> 
> create & write & fsync 'file A'                 write checkpoint
> - f2fs_do_sync_file // inline inode
>  - f2fs_write_inode // inode folio is dirty
>                                                 - f2fs_write_checkpoint
>                                                  - f2fs_flush_merged_writes
>                                                  - f2fs_sync_node_pages
>                                                  - f2fs_flush_nat_entries
>  - f2fs_fsync_node_pages // no dirty node
>  - f2fs_need_inode_block_update // return false
>  SPO and lost 'file A'
> 
> f2fs_flush_nat_entries() sets the IS_CHECKPOINTED and HAS_LAST_FSYNC
> flags for the nat_entry, but this does not mean that the checkpoint has
> actually completed successfully. However, f2fs_need_inode_block_update()
> checks these flags and incorrectly assumes that the checkpoint has
> finished.
> 
> The root cause is that the semantics of IS_CHECKPOINTED and
> HAS_LAST_FSYNC are only guaranteed after the checkpoint write fully
> completes.
> 
> This patch modifies f2fs_need_inode_block_update() to acquire the
> sbi->node_write lock before reading the nat_entry flags, ensuring that
> once IS_CHECKPOINTED and HAS_LAST_FSYNC are observed to be set, the
> checkpoint operation has already completed.
> 
> Fixes: e05df3b115e7 ("f2fs: add node operations")
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
