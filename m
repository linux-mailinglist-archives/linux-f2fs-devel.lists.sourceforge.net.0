Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKi6CpApumlvSQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 05:26:56 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5B72B5C55
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 05:26:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J9W1VRVinKqUZIGhw61GtQDis99tv+00xZZDlJfeEFQ=; b=TB66/PRc+XU0qU/Uztm5KsuF81
	J5mPP01dEUxf3lh96k4UPtRsnvAC0nE9Z7Kh5jO+Wa1K6Ixwj9Pw7byV8z9MLBtX49MK50hXCT+to
	KtnInefcsxiWu3YkfjXmyGraicS7KDUOoSHIZTPieQ9zY4ectYEJlZHSIjwwFABfa6zs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w2iUZ-00044v-IG;
	Wed, 18 Mar 2026 04:26:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w2iUX-00044o-GV
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 04:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GbKgiHPE63W9yBgLgt/SvIjnA4kBhyXjutQLlkVRodA=; b=EIFNs4HRdL27GBkgNKFFxr7kf2
 LEYXNUeY7X39vQq5osg0gNT4GGsXnTih5VLLUGurzK3s7Y8RJ2OH+ErsjjCTOAZrMaLTsP6ngLz9Z
 j+hUuo45LnbJilZ6SjMOoWe1oZYzrn2obUSwaK6iCglTqO6iWac0zRvJprH3ZnqFcLaA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GbKgiHPE63W9yBgLgt/SvIjnA4kBhyXjutQLlkVRodA=; b=D4ogcDajgu1RxpJu+gFy2MZ++o
 7RFvvE9UMrl2rx9qvX3bKO4cpkosAW1lEOTkAf9aKwMGQI+v2CGkxyGHAnTv0Dgki1j0PMqcTAHz+
 0YQNz/xESh9TwhS7PAYYF2RvsHSqySMD5o7sq8c+ST3B6zxYw8EoyfDsKUYvTbqQKtYA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w2iUW-0006sb-U2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 04:26:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3D071600C4;
 Wed, 18 Mar 2026 04:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B591C19421;
 Wed, 18 Mar 2026 04:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773807998;
 bh=Uu4rVfWWL/t10e8HLLOtmscWjxmKnMrsFFGS722sG3o=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=d5lC4TkkOeK3mAZSNW9mw50VJ9ZRmQ4htpsJ8niIYCUNkTURHrP5me90lXjylAf+7
 tDfGIMHd6EsDeEr8G7mBF0u3zOi+YQ/CTN3xZ7dGlmi0PzKfzs1cRlvOrMeWfmZFOu
 8rzMYoBsE1Xg1jRKRpSjO5M4JicA7o3jVLNuftP0I1zlGnBQVJeHSB0AHHtbDsWhj/
 WT8i6adD5+FcOt2p6TdT+n2kDoT8eaTW0DHkW18tOhuouoiaD5ovAE2kKhE4WlpyBE
 kGehl3wyAKHdinztkY/rmtw7utcr+PdzRo5R9MxWw0AvNcoDJiQIgeGiKMoAMe0d6U
 W27PrRX3nkJKA==
Message-ID: <a9403dec-f020-4cbe-9944-659e5178e309@kernel.org>
Date: Wed, 18 Mar 2026 12:26:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260317115459.208306-2-monty_pavel@sina.com>
 <20260317115459.208306-6-monty_pavel@sina.com>
Content-Language: en-US
In-Reply-To: <20260317115459.208306-6-monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/17 19:55, Yongpeng Yang wrote: > From: Yongpeng
 Yang <yangyongpeng@xiaomi.com> > > During FGGC node block migration, fsck
 may incorrectly treat the > migrated node block as fsync-written dat [...]
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w2iUW-0006sb-U2
Subject: Re: [f2fs-dev] [PATCH v4 3/4] f2fs: fix fsck inconsistency caused
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim,vm:email]
X-Rspamd-Queue-Id: CA5B72B5C55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026/3/17 19:55, Yongpeng Yang wrote:
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
> 
> This patch move the set/clear of the fsync|dentry marks into
> __write_node_folio to make the logic clearer, and ensures the
> fsync|dentry mark is cleared in FGGC.
> 

Cc: stable@kernel.org

> Fixes: da011cc0da8c ("f2fs: move node pages only in victim section during GC")
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
