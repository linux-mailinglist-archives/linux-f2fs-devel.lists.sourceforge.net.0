Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id g/yeCcbruGkLlwEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Mar 2026 06:51:02 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E50C2A4196
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Mar 2026 06:51:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fGmVAIpXdVg2zTRjTTq8kSkOemK8oj3Oi5Rl8bDx82U=; b=Ib7jogF6sV9RRl6iebPtyWPh1h
	TW6M9hMXATVwE/710OVljSS5mplaRQLuXQUqSmtc/n4aBwEHmsi5D7HX7X75HC+WMErDaYsTABGgl
	J25/rggkGs+K8XRs4AIMaCYCwQxwSUPpxBiG0HedhfDgXNM7PUipEeXcVfOVMyAvY76o=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w2NKF-00049y-RZ;
	Tue, 17 Mar 2026 05:50:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w2NKE-00049h-GS
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Mar 2026 05:50:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=50H3vnwbzDF9RifR1A+9ORcEQjRtbj0hIW+ubrx990Y=; b=IgCrR8yxtM9O16ATWsM7YnUQgM
 vPcwesDNVds1Vets2hENkawizV5s6b0yFQWjHyVva5xdacuoZQyCJvuM8dS1xIIUHtsk9ZGtA6q3E
 RjXOAK/gqZYMQYxLE6pPs4pewDgWZz+yCz43qXcFP9cU3cffHGSpOwoZsrFFJnLeoHcM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=50H3vnwbzDF9RifR1A+9ORcEQjRtbj0hIW+ubrx990Y=; b=j/r7Einf5ZaRn32GT8o6p5qIAB
 PeJnibBNdt7S2I6WZKrvGm2IPdsfqbOnA/Df3Z0Hc3V3jCIVe3sn3Eh5KyhqCCNYukf5tpAJP6V9/
 sRMPl6a+Kl9qteKmlIidyCK8JIUWdxjqrXARVKeJMCvVIktwcvEN8PvjJLGqpvtos+4E=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w2NKE-0001TU-NT for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Mar 2026 05:50:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6BF6C41E40;
 Tue, 17 Mar 2026 02:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F79BC19421;
 Tue, 17 Mar 2026 02:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773713551;
 bh=X0iKuo4g/GQbQ9p6K1rbUMSsh1uuxCz4JLcfDsoQXyU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=VzUY8rpO3GcEHCQ0fANv76j4yJlXbWjsDxZd71DKZ9mD7CJWSVRYzaUZ7plH+itZ5
 nDUczoI96ATVXXKThMM59+gaeMK80dYJD/IoyRX1OrZrVBPt+3vIQnoRNUz0ctaucr
 INnTpAwbVa6sNoKCkTTar8021YV1Q6vamS1m8PqWmNHelUIALRH9ZaTRogvD4tXj4t
 aJFfDoqrJD3Vm1pmL+kL6HYqPJrFmOn/93wheAzsy0Y7udGuc9GwJgsGKh2FoJRSqf
 DQdiXg0j9f6D8RjknxPAJKynFJrXdrPfS0V2BSAbCjZV2OK2m8LDW00QkuNVZuqrn5
 8BV9KHYGvPwDg==
Message-ID: <deec2af1-77ac-4b93-9b82-914035505f29@kernel.org>
Date: Tue, 17 Mar 2026 10:12:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260315181321.4063984-2-monty_pavel@sina.com>
 <20260315181321.4063984-4-monty_pavel@sina.com>
Content-Language: en-US
In-Reply-To: <20260315181321.4063984-4-monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/16 02:14, Yongpeng Yang wrote: > From: Yongpeng
 Yang <yangyongpeng@xiaomi.com> > > During FGGC node block migration, fsck
 may incorrectly treat the > migrated node block as fsync-written dat [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w2NKE-0001TU-NT
Subject: Re: [f2fs-dev] [PATCH v3 2/3] f2fs: fix fsck inconsistency caused
 by FGGC of node block
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim,vm:email]
X-Rspamd-Queue-Id: 2E50C2A4196
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026/3/16 02:14, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> During FGGC node block migration, fsck may incorrectly treat the
> migrated node block as fsync-written data.
> 
> The reproduction scenario:
> root@vm:/mnt/f2fs# seq 1 2048 | xargs -n 1 ./test_sync // write inline inode and sync
> root@vm:/mnt/f2fs# rm -f 1
> root@vm:/mnt/f2fs# sync
> root@vm:/mnt/f2fs# f2fs_io gc_range // move data block in sync mode and not write CP
>    SPO, "fsck --dry-run" find inode has already checkpointed but still
>    with DENT_BIT_SHIFT set
> 
> The root cause is that GC does not clear the dentry mark and fsync mark
> during node block migration, leading fsck to misinterpret them as
> user-issued fsync writes.
> 
> In BGGC mode, node block migration is handled by f2fs_sync_node_pages(),
> which guarantees the dentry and fsync marks are cleared before writing.
> This patch ensures the same mark clearing behavior for FGGC mode node
> block migration.
> 
> Fixes: da011cc0da8c ("f2fs: move node pages only in victim section during GC")
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
>   fs/f2fs/node.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 12b943eae4d9..fe97a54a25b7 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1871,6 +1871,8 @@ int f2fs_write_single_node_folio(struct folio *node_folio, int sync_mode,
>   		goto out_folio;
>   	}
>   
> +	set_fsync_mark(node_folio, 0);
> +	set_dentry_mark(node_folio, 0);

Oh, we will set fsync|dentry mark inside __write_node_folio(), any
conflict w/ reset flow above? IMO, we'd better only set or reset
fsync|dentry mark in same place.

I didn't look into the details, can you please take a look?

Thanks,

Thanks,

>   	if (!__write_node_folio(node_folio, false, NULL,
>   				&wbc, false, FS_GC_NODE_IO, NULL))
>   		err = -EAGAIN;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
