Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PFrO27EDmqiCAYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2026 10:38:06 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFF45A1324
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2026 10:38:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b760DdWL27SVIHPMK8LXqQDOia9R3TQFWPkSTGXSOD8=; b=luUShlcNBNt7JZ/31r2Hrpi+if
	opnpdK7Oq/1rM41oVD4J38XlmNE40Ttd99sesu09w9cf2SPX3FVzMzkGg3mGQ2Eutt6/HuV9j3VXM
	KuP3eCw9aW8iEJYJwJD34l1hmWpIpTBdZuH847XnJm3DZ7q8AYTLsSf6SMxvbEyO/RGo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wPyut-0004Jh-8c;
	Thu, 21 May 2026 08:38:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wPyur-0004J9-G8
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 May 2026 08:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sd5RTXvTLQ9SqMPOh7uhxmuPIMpEc4mL9L56Win7b+Y=; b=lKWaHMns1brn+MKY0s6/IxPDva
 YnT8krLzQGtMY/HUjtC+q6oN5v6XqxcPCOROznLYFw+7fQps1Wv3DTgynktxb3RNMCHK8BWdh3AFT
 6L8csEohDGNbx3U87BbO2oQkvhWmY4vcsu5ESv8gSU0APSTmKj0Pru+7AjWX6TS5My5w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sd5RTXvTLQ9SqMPOh7uhxmuPIMpEc4mL9L56Win7b+Y=; b=dii5GieYiUh/VQ1LdU0f3wOudy
 VeLIJd5JceES9t1nx3SMWo93DpSklyYVT+Gfg7RnT5pZEdUWK+4U6CNmKjK2u1pbksb/P20rt71eP
 hPbL4NyyLpDY1os/sE4paoAhWSqmAjgbyYLG7WH000zXwgNEWKsFnVdHZ/nNF4fVvPiQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wPyun-0005Ar-2O for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 May 2026 08:38:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3B714439D5;
 Thu, 21 May 2026 08:37:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9161F00ADF;
 Thu, 21 May 2026 08:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779352676;
 bh=sd5RTXvTLQ9SqMPOh7uhxmuPIMpEc4mL9L56Win7b+Y=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=R4e+RtM8yVl9oIrsU50DiXVeFGM1h0yEVW/XfmJuqtn/vPxwi6I+IXTXrIxmT4yJ9
 XKbCG0NAZme4lb/y9IMUSqDinNoiOMdvwkIVSL1mDCvF3D5MTj6AMNkOxluNkyo3pq
 oErE4Gq3jc+2ttfsME22aee4u2629V/VNVOQ7Ava8MGycA5NyerkmJK8XzU0XGU72H
 aQYQ1mD5p/kh+qkoT2cptM55C0zmucGM2QcRmXomhKuqvu2q5btG3jeHuENFe7/9pV
 KREDdVZyyP9+5Q+k0OdofKp3wvObhjX8TGvu/RTXEOOYkjGy6fSQPUkpvhqgSUhHOG
 rvcy5k6styZ+g==
Message-ID: <a36697b3-60d5-4677-87b3-52a6f954fa39@kernel.org>
Date: Thu, 21 May 2026 16:37:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wenjie Qi <qwjhust@gmail.com>, jaegeuk@kernel.org
References: <20260521031618.1734199-1-qiwenjie@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20260521031618.1734199-1-qiwenjie@xiaomi.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/21/26 11:16, Wenjie Qi wrote: > F2FS_COMPRESS_INO() uses
 NM_I(sbi)->max_nid as the synthetic inode > number for the compressed page
 cache inode. That inode only exists when > the compress_cache m [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wPyun-0005Ar-2O
Subject: Re: [f2fs-dev] [PATCH] f2fs: validate compress cache inode only
 when enabled
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qwjhust@gmail.com,m:jaegeuk@kernel.org,m:qiwenjie@xiaomi.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: CEFF45A1324
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/21/26 11:16, Wenjie Qi wrote:
> F2FS_COMPRESS_INO() uses NM_I(sbi)->max_nid as the synthetic inode
> number for the compressed page cache inode. That inode only exists when
> the compress_cache mount option is enabled.
> 
> When compress_cache is disabled, max_nid is outside the valid inode
> range. A corrupted directory entry that points to ino == max_nid should
> therefore be rejected by f2fs_check_nid_range(). However, is_meta_ino()
> currently treats F2FS_COMPRESS_INO() as a meta inode unconditionally,
> so f2fs_iget() bypasses do_read_inode() and its nid range check, and
> instantiates a fake internal inode instead.
> 
> Gate the compressed cache inode case on COMPRESS_CACHE, matching
> f2fs_init_compress_inode(). With compress_cache disabled, ino ==
> max_nid now follows the normal inode path and is rejected as an
> out-of-range nid.
> 

Cc: stable@kernel.org

> Fixes: 6ce19aff0b8c ("f2fs: compress: add compress_inode to cache compressed blocks")
> Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
