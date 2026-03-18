Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZCtTALIrumn6SQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 05:36:02 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F35C2B5C77
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 05:36:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mo9gzIPrsPc5KyUJmI9IjDOjAsNwlwidb89BM7VqpEk=; b=ZSsZxzzB3OrfhaM+G9+blYRmJ8
	f4bHGpcRYJ1vtRD5NFyOQ8G+MSpIaoCUzZYvMwibtQ6YqRcGQTAwzWW+fajliZy02bwUA9113/O/T
	5bttJAz9TKoYQzSaFSt6BNC4RKk87YP9fw7OvTvrjA4Al4h9HGVOJt+UgCqcZqenGHB4=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w2idR-0006r4-0S;
	Wed, 18 Mar 2026 04:35:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w2idO-0006qu-W4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 04:35:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6hHO0geJrA05aFP2V5F9q9W9KPWGCPGNvIAyk0R+SPY=; b=HCpBKIAE2mUV+SLZQ2Pf1Gue+S
 aIfe0CV1trtcds7yyoL4Hdah4RrvMg79WOlGMaZhWURyDb+pi2NzzCB19wdIR0fbFNbXL9v8vWChG
 6mOxdBH3YFMlnnGnZ9cHN6U8omZGL2kzKKiqYYaQuzgQ7xi73kw3oJp7drwZ+0unZctA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6hHO0geJrA05aFP2V5F9q9W9KPWGCPGNvIAyk0R+SPY=; b=hZ7eUeWunYqNEUeW3jbNDGE5hM
 M/TPpdAzl0CTeigTwQ/C/2lJaRKlSKhp3CTA8MLPZqOu6FPQP7MDKgtSdVYZkNmogfaF8ZKXTZhwh
 h684fgpYUvHFT4TfEoFhWext4bZOrRKU1y0FxF52FirqhpyoGVNWCak+lobav6C4mXz8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w2idO-0007AH-DV for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 04:35:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0E79C429CD;
 Wed, 18 Mar 2026 04:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D6BEC19421;
 Wed, 18 Mar 2026 04:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773808543;
 bh=mwmTo84F6BXPtkywzmrKQTVDfwg1PR4OYellQqyixsA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=f5CxcNPMely4W9hoyjXvSKjqctfRSFYb81Jx/9uDOW0MdL8OinG7xmRXeHXAR5+ci
 NvcsB4PLAoWoKiXOzfjS0+zHsXIgXoBz1P4VaPtSf9SkhUQGPElybUC6SOMjO/xKMj
 E0mWruHyCi6YD0JUrKe2lu5sUHjNpUjMJfWfnG+OQdArh3cAqhWAAX7/FZVerhT1LS
 Wx3Juq7IISUcpSgd9ivMaZoLfbPmuje8AJW9p3ObjX87xAsv4BpKCtnE6Rt5ZW4hnr
 VJ7293GzQoo3mbJGaAEC2mSc37lM2CCjoS8slZmtB9GOAzVrUUK5+tJfm+lMGapjWO
 MScllnHsVp8jQ==
Message-ID: <21fe73ba-2476-443a-862d-6c415205932b@kernel.org>
Date: Wed, 18 Mar 2026 12:35:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260317115459.208306-2-monty_pavel@sina.com>
 <20260317115459.208306-8-monty_pavel@sina.com>
Content-Language: en-US
In-Reply-To: <20260317115459.208306-8-monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/17 19:56, Yongpeng Yang wrote: > From: Yongpeng
 Yang <yangyongpeng@xiaomi.com> > > When f2fs_fiemap() is called with
 `fileinfo->fi_flags`
 containing the > FIEMAP_FLAG_SYNC flag, it attempts [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w2idO-0007AH-DV
Subject: Re: [f2fs-dev] [PATCH v4 4/4] f2fs: fix inline data not being
 written to disk in writeback path
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
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
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
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim,vm:email]
X-Rspamd-Queue-Id: 0F35C2B5C77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026/3/17 19:56, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> When f2fs_fiemap() is called with `fileinfo->fi_flags` containing the
> FIEMAP_FLAG_SYNC flag, it attempts to write data to disk before
> retrieving file mappings via filemap_write_and_wait(). However, there is
> an issue where the file does not get mapped as expected. The following
> scenario can occur:
> 
> root@vm:/mnt/f2fs# dd if=/dev/zero of=data.3k bs=3k count=1
> root@vm:/mnt/f2fs# xfs_io data.3k -c "fiemap -v 0 4096"
> data.3k:
>   EXT: FILE-OFFSET      BLOCK-RANGE      TOTAL FLAGS
>     0: [0..5]:          0..5                 6 0x307
> 
> The root cause of this issue is that f2fs_write_single_data_page() only
> calls f2fs_write_inline_data() to copy data from the data folio to the
> inode folio, and it clears the dirty flag on the data folio. However, it
> does not mark the data folio as writeback. When
> __filemap_fdatawait_range() checks for folios with the writeback flag,
> it returns early, causing f2fs_fiemap() to report that the file has no
> mapping.
> 
> To fix this issue, the solution is to call
> f2fs_write_single_node_folio() in f2fs_inline_data_fiemap() when
> getting fiemap with FIEMAP_FLAG_SYNC flags. This patch ensures that the
> inode folio is written back and the writeback process completes before
> proceeding.
> 
> Fixes: 9ffe0fb5f3bb ("f2fs: handle inline data operations")
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
> v4:
> - Fix the missing return value check for f2fs_get_inode_folio().
> v3:
> - Call f2fs_write_single_node_folio() instead of f2fs_sync_node_pages()
> v2:
> - Call f2fs_sync_node_pages() in getting fiemap path rather than
> writeback path.
> ---
>   fs/f2fs/inline.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 

Declaration should be relocated into this patch.

+int f2fs_write_single_node_folio(struct folio *node_folio, int sync_mode,
+			bool mark_dirty, enum iostat_type io_type);

Thanks,

> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> index 86d2abbb40ff..62a8a1192a41 100644
> --- a/fs/f2fs/inline.c
> +++ b/fs/f2fs/inline.c
> @@ -814,6 +814,15 @@ int f2fs_inline_data_fiemap(struct inode *inode,
>   		goto out;
>   	}
>   
> +	if (fieinfo->fi_flags & FIEMAP_FLAG_SYNC) {
> +		err = f2fs_write_single_node_folio(ifolio, true, false, FS_NODE_IO);
> +		if (err)
> +			return err;
> +		ifolio = f2fs_get_inode_folio(F2FS_I_SB(inode), inode->i_ino);
> +		if (IS_ERR(ifolio))
> +			return PTR_ERR(ifolio);
> +		f2fs_folio_wait_writeback(ifolio, NODE, true, true);
> +	}
>   	ilen = min_t(size_t, MAX_INLINE_DATA(inode), i_size_read(inode));
>   	if (start >= ilen)
>   		goto out;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
