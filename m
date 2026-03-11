Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKmkNrGxsWmXEgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 19:17:21 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2772687CD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 19:17:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zary7BXws6nEDRWJYrWDQ97rIkvoLJRsDguifhNOA/8=; b=e37gc0rZ1GXOy4Ptsz63AHGWuD
	IdRIgEIzoiHvw2NigFcw42gAJxqJ14v1BkWjAHaRha9GkFFFpEVZv5af6lQpN0Z+oeCbE6fbDNfTG
	FNcNbDn7C6yui3u7liO2qPVoezfJ/46sG8jWsQ4zDfmRn8WwngCVJjFNSiTkYXlxL5I0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0O7L-0003WQ-RR;
	Wed, 11 Mar 2026 18:17:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1w0O7K-0003WJ-KM
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 18:17:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F53ieGkcypAHNLr5ut+KV6FeluLBJgUePoI5ScGYQHU=; b=SQOB39CALGJg314OR70yiQViAE
 nnKs0WsFVV1qNu8fYAnt1lmga3POooEvuw06St8RB4vomeyKkT3YltHCv+ev2RNID/CjyD/pFXmrI
 NfwK2iYQxoggF7HvzyUtL+Uj+bVle0DAYO37kejpZcsi2y9HCB3/pI3jhujAR1VJyaHY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F53ieGkcypAHNLr5ut+KV6FeluLBJgUePoI5ScGYQHU=; b=h2AiesOr48TVUEyQqkXX4178if
 ZYR2BURSpiYXWsKuQ85YVtrYwdMMeJlwgmpGCpmlzRIfsbx87Sf8G/EmYnWOq2/57TwnrB3BJ/mbY
 AcgIn7FceVwjubaxn2yqwgnxthyl57c5IQjvxAn90aiNtHC2Jmq5PuV0bK6iLV/EgPXs=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0O7K-0006zb-5W for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 18:17:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D5F2B40866;
 Wed, 11 Mar 2026 18:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800BDC4CEF7;
 Wed, 11 Mar 2026 18:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773253019;
 bh=qFDybt2y5QsbCsGdlncQsn+Q1JrNnLiOjkZ+fCDHSco=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MkUqfaWD/4ZuhbIAbJNM6U9MbRfvGEXWQLu89rC5107BSKcEx2G5FR7upfCDqHPhz
 fZSIzXBmYbSJAOjy/LXoHATVK340JsZ6c3HPYxlJarNHzWThnLd8q/Y4maoTKPjfgz
 faDqFkXHmhjIduQpsGwhLb95wQhpQ0ExdSiNtEuRlM7oV1ca4UF7APcYDXJFCpR8oi
 KiGqQmXv/S3qNpsyQmoLZJ5o3xgVTGDYpAMQjNA2dLvMf1RIUpuZexfk/bfCuPVZ0E
 aKFkUt6zzjRir5p1zyVcTz38GN7k00rab1gzrbSdT8Gv/ji46zjm6WnzH+Bhb8ANKJ
 k1pC27q1MyAgA==
Date: Wed, 11 Mar 2026 18:16:57 +0000
To: Yongpeng Yang <monty_pavel@sina.com>
Message-ID: <abGxmcBNlSgEwh5z@google.com>
References: <20260310093611.2865092-2-monty_pavel@sina.com>
 <20260310093611.2865092-4-monty_pavel@sina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260310093611.2865092-4-monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/10,
 Yongpeng Yang wrote: > From: Yongpeng Yang <yangyongpeng@xiaomi.com>
 > > f2fs_need_dentry_mark() reads nat_entry flags without mutual exclusion
 > with the checkpoint path, which can result i [...] 
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
X-Headers-End: 1w0O7K-0006zb-5W
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix fsck inconsistency caused by
 incorrect nat_entry flag usage
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_TO(0.00)[sina.com];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: EE2772687CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 03/10, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> f2fs_need_dentry_mark() reads nat_entry flags without mutual exclusion
> with the checkpoint path, which can result in an incorrect inode block
> marking state. The scenario is as follows:
> 
> create & write & fsync 'file A'                 write checkpoint
> - f2fs_do_sync_file // inline inode
>  - f2fs_write_inode // inode folio is dirty
>                                                 - f2fs_write_checkpoint
>                                                  - f2fs_flush_merged_writes
>                                                  - f2fs_sync_node_pages
>  - f2fs_fsync_node_pages // no dirty node
>  - f2fs_need_inode_block_update // return true
>  - f2fs_fsync_node_pages // inode dirtied
>   - f2fs_need_dentry_mark //return true
>                                                  - f2fs_flush_nat_entries
>                                                 - f2fs_write_checkpoint end
>   - __write_node_folio // inode with DENT_BIT_SHIFT set
>   SPO, "fsck --dry-run" find inode has already checkpointed but still
>   with DENT_BIT_SHIFT set
> 
> The state observed by f2fs_need_dentry_mark() can differ from the state
> observed in __write_node_folio() after acquiring sbi->node_write. The
> root cause is that the semantics of IS_CHECKPOINTED and
> HAS_FSYNCED_INODE are only guaranteed after the checkpoint write has
> fully completed.
> 
> This patch moves set_dentry_mark() into __write_node_folio() and
> protects it with the sbi->node_write lock.
> 
> Fixes: 88bd02c9472a ("f2fs: fix conditions to remain recovery information in f2fs_sync_file")
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
>  fs/f2fs/node.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 2fbfecaf3f7b..7d3b377cbc17 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1807,7 +1807,9 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted
>  		if (IS_INODE(folio))
>  			set_dentry_mark(folio,
>  				f2fs_need_dentry_mark(sbi, ino_of_node(folio)));
> -	}
> +	} else if (IS_INODE(folio) && is_fsync_dnode(folio))
> +		set_dentry_mark(folio,
> +				f2fs_need_dentry_mark(sbi, ino_of_node(folio)));

Thanks, I applied with some clean-up as below. Could you please review this?

-       if (atomic) {
-               if (!test_opt(sbi, NOBARRIER))
-                       fio.op_flags |= REQ_PREFLUSH | REQ_FUA;
-               if (IS_INODE(folio))
-                       set_dentry_mark(folio,
+       if (atomic && !test_opt(sbi, NOBARRIER))
+               fio.op_flags |= REQ_PREFLUSH | REQ_FUA;
+
+       if (IS_INODE(folio) && (atomic || is_fsync_dnode(folio)))
+               set_dentry_mark(folio,
                                f2fs_need_dentry_mark(sbi, ino_of_node(folio)));
-       }


>  
>  	/* should add to global list before clearing PAGECACHE status */
>  	if (f2fs_in_warm_node_list(folio)) {
> @@ -1948,9 +1950,6 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>  					if (is_inode_flag_set(inode,
>  								FI_DIRTY_INODE))
>  						f2fs_update_inode(inode, folio);
> -					if (!atomic)
> -						set_dentry_mark(folio,
> -							f2fs_need_dentry_mark(sbi, ino));
>  				}
>  				/* may be written by other thread */
>  				if (!folio_test_dirty(folio))
> -- 
> 2.43.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
