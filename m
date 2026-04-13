Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cH/EFGXS3GmcWQkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Apr 2026 13:24:21 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E3C3EB3F8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Apr 2026 13:24:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDS/7zaJYxwpEa33NN/4QwPu8a1us1EMMQGB3rtE1qs=; b=PjR12XJVk75kaZU3tuEEGdeSQl
	aKdKio0BGA1ionaVOOPXFOVD8O1IHiYdPgLXfvroUZZXEEKlMXYmdnZh7G5Ik0jSUwnlIWhMQUThC
	ZL+QdBzv07gpIz5Ei5ZGMjt+NQU7ucjplPoc3cqtgR7cpwl5u4a5bI+1jAsI/raW/RCc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wCFOb-00050Q-BS;
	Mon, 13 Apr 2026 11:24:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wCFOZ-00050J-7r
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Apr 2026 11:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bEBYhYJPNX1en596PJ65OXganit68QkuwI/Xwg15914=; b=Ju8OZXKI1SXpgY2NsC/9lVFBvF
 Fcq5dQ1jJqeGTi4stcGDvZuyz3zVN4v6qDgDzJAKBQFo+GxSPUQlp6l1Ul7zsTDyxYEkP0FFOQ/Ce
 fUSUGMEl3AnmRq9ETqpP/z2gQLdQW+le5UOxdFMZQoyOi0QiH9UYFwDsfdnwk+wsqkFA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bEBYhYJPNX1en596PJ65OXganit68QkuwI/Xwg15914=; b=PMwjbMG5FKRfWDMqYsSAeXkxs9
 OhozMmlEpO71kTrCHP6TTG+aHRkhD6SoCb0dPb86wWbCIWP21wPqxJ+m7pW8jmjTkEC0sMUa4MtM/
 p+VP5Abeekior3WAJM/m4A1z28VhEFfnYXdZZSDoNP/r5oZFYIqDVVwyYFcFr6iBxwaw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wCFOY-0003EY-Qd for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Apr 2026 11:23:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 54155408D2;
 Mon, 13 Apr 2026 11:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23CACC116C6;
 Mon, 13 Apr 2026 11:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776079428;
 bh=k40RQpCwrRnxHC9qiekndDrsWXyZfL6OGK0uWcAp7nY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=kLmmS7C+SJFkpsO+zZwo6ATHMA7FZmICdvEcxpGL/R7FnnDi0q9GIFTm1USZ+CU9A
 Vizt/6w+py10hbKAXuOvr5avS4etS48UMTiIjIt6PonNs1199JcNKQoefbPLHgMLZQ
 73YR2YZTcZSDk18aBNH2HPmhIVhxr7eaJt++k90zTy8ZOy3zL7/i2wduLFOkaHkPgu
 rCp8+EwwD84kl2jXCsJXWVMdgD5Z3p9Zbi8wI6f5LQmA4CQJFry1u66EYUs/xH2hsV
 GEZ65vSp8Jww+RsBSpQ3VdS40jOxSPPb3zpFTAh3iALelfNBybBOVFVHCRQHm4qmPw
 c8Ix6ktztqp3w==
Message-ID: <6e33b6f1-7d05-4edd-87f9-28a2a98a6b27@kernel.org>
Date: Mon, 13 Apr 2026 19:23:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260403144015.221811-3-monty_pavel@sina.com>
Content-Language: en-US
In-Reply-To: <20260403144015.221811-3-monty_pavel@sina.com>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/3/2026 10:40 PM, Yongpeng Yang wrote: > From: Yongpeng
 Yang <yangyongpeng@xiaomi.com> > > f2fs_destroy_extent_node() does not set
 FI_NO_EXTENT before clearing > extent nodes. When called from f2f [...] 
 Content analysis details:   (-0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wCFOY-0003EY-Qd
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix node_cnt race between extent node
 destroy and writeback
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>, stable@vger.kernel.org,
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
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
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
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: 82E3C3EB3F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/2026 10:40 PM, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> f2fs_destroy_extent_node() does not set FI_NO_EXTENT before clearing
> extent nodes. When called from f2fs_drop_inode() with I_SYNC set,
> concurrent kworker writeback can insert new extent nodes into the same
> extent tree, racing with the destroy and triggering f2fs_bug_on() in
> __destroy_extent_node(). The scenario is as follows:
> 
> drop inode                            writeback
>   - iput
>    - f2fs_drop_inode  // I_SYNC set
>     - f2fs_destroy_extent_node
>      - __destroy_extent_node
>       - while (node_cnt) {
>          write_lock(&et->lock)
>          __free_extent_tree
>          write_unlock(&et->lock)
>                                         - __writeback_single_inode
>                                          - f2fs_outplace_write_data
>                                           - f2fs_update_read_extent_cache
>                                            - __update_extent_tree_range
>                                             // FI_NO_EXTENT not set,
>                                             // insert new extent node
>         } // node_cnt == 0, exit while
>       - f2fs_bug_on(node_cnt)  // node_cnt > 0
> 
> Additionally, __update_extent_tree_range() only checks FI_NO_EXTENT for
> EX_READ type, leaving EX_BLOCK_AGE updates completely unprotected.
> 
> This patch set FI_NO_EXTENT under et->lock in __destroy_extent_node(),
> consistent with other callers (__update_extent_tree_range and
> __drop_extent_tree) and check FI_NO_EXTENT for both EX_READ and
> EX_BLOCK_AGE tree.
> 
> Fixes: 3fc5d5a182f6 ("f2fs: fix to shrink read extent node in batches")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
