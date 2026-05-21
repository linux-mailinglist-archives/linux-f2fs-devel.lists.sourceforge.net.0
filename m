Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGOQC13CDmrXBwYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2026 10:29:17 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCD55A1090
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 May 2026 10:29:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bFF4pRsiWiXRKKxwh+IdkAGrCg7nMBQMWui0W1k+EsI=; b=gIxG0hHVELcn2XdiuwJemdglI5
	d5ld2Nbht/OA7Ez2KTsot+RvoHvFMlT8DoT8DpWFtsdWSc9dcJZhgGeXqAyNPK3up+hHYp/tKUj74
	O8bwwdzucdB96/qhIRXoDrVnkb1Ovfym56W2poz2egnMcC8XEoQ0cAW0p+r8zK+cuv7c=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wPym4-0001FA-4J;
	Thu, 21 May 2026 08:29:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wPym2-0001Et-DL
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 May 2026 08:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wu+0kykA399VXJw5UWaA7tdCksypV+KBAuwE/U9Dt70=; b=nN7VCY8hxHCTJyQ4ZtHgtP776t
 6WfOzi7IEag5j9nruGit1VqbcjxxeD/Q69Zy935Lr6HKX0B1JgtOmF4GulnynJwyUH8xnxOXlVmmT
 GmOJPYX6MuWEW4N+lH/rr99TWeHkXiDGDMw8QWqVyhm/fbsjbBH0aUb7ggrDLFAL/BzY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wu+0kykA399VXJw5UWaA7tdCksypV+KBAuwE/U9Dt70=; b=PqO+23V1mXUVA5NQLQ8y1QQXZA
 KO+5QXJQ4UbfP3NNBRL9WEWO9f8xWgB9Xf29GrflLk0TG/uxFAWN3K9huCPnaCe9bo/xIb8tnP/LR
 x1sVOR3DU0JDFY3JG3+Z6FIfJJ+leZWDuLLNFjwD+8zNkz86zizHpTPA0Sf/2YUTwRzU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wPym1-0003ol-1J for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 May 2026 08:28:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id DA24160172;
 Thu, 21 May 2026 08:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50CB11F00A3B;
 Thu, 21 May 2026 08:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779352131;
 bh=Wu+0kykA399VXJw5UWaA7tdCksypV+KBAuwE/U9Dt70=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=B+bGLX7r3N+n4X88nfCJ/JmbeLDFWXCkrJUAFySYGS3mzLlvdZKHrdvT91tkJKXDb
 i1hBF4UQu7MPePxQUgQA5poclydGCIGFJw1K5yUhG5iSbVGL/QcpniOG38lqzkZ01t
 PMyugch4OPjIO2Nk6Lgouta7Erv6mGwry+7Hxn5+N/msoMb+/ve2bCRCXLZpI7pg+B
 IGIdQthQ/P4h2YGn9zT/PZP8hoND/9TZLP1zKXGBTGBWkvNfBX/qQELj/fHth1VNac
 I6JLrX7wSofdzyHzANAfEWxn6Ib79bqR4CMXD0Fq1hB5JLkdvRdkdXRdyjmxSGw/X/
 YrhEiMmjwJFQQ==
Message-ID: <39c59d05-c998-456a-afae-1eee7379a04c@kernel.org>
Date: Thu, 21 May 2026 16:28:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wenjie Qi <qwjhust@gmail.com>, jaegeuk@kernel.org
References: <20260520095204.1175117-1-qwjhust@gmail.com>
Content-Language: en-US
In-Reply-To: <20260520095204.1175117-1-qwjhust@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/20/26 17:52,
 Wenjie Qi wrote: > From: Wenjie Qi <qiwenjie@xiaomi.com>
 > > f2fs_read_data_large_folio() can keep a read bio across multiple >
 readahead folios. If a later folio hits an error befor [...] 
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
X-Headers-End: 1wPym1-0003ol-1J
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix missing read bio submission on
 large folio error
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
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
X-Rspamd-Queue-Id: BCCD55A1090
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 17:52, Wenjie Qi wrote:
> From: Wenjie Qi <qiwenjie@xiaomi.com>
> 
> f2fs_read_data_large_folio() can keep a read bio across multiple
> readahead folios.  If a later folio hits an error before any of its
> blocks are added to the bio, folio_in_bio is false and the current error
> path returns immediately after ending that folio.
> 
> This can leave the bio accumulated for earlier folios unsubmitted.  Those
> folios then never receive read completion, and readers can wait
> indefinitely on the locked folios.
> 
> Route errors through the common out path so any pending bio is submitted
> before returning.  Stop consuming more readahead folios once an error is
> seen, and only wait on and clear the current folio when it was actually
> added to the bio.
> 

Cc: stable@kernel.org

> Fixes: a5d8b9d94e18 ("f2fs: fix to unlock folio in f2fs_read_data_large_folio()")
> Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

BTW, I can not apply the patch, can you please rebase it to last dev branch?

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
