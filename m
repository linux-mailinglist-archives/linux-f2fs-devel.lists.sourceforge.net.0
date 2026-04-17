Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +INxA1Do4WlgzwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Apr 2026 09:59:12 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE044184DD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Apr 2026 09:59:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJQVt6i6k3XkTd5O2ZA6M4bmThYt9++flRl3FRdDdmc=; b=WPtBWyiI/9GzAtErBGufov4b+L
	/Y2nrmtpuyDbypyVr8hXcOyMMocr9RwS12gyvrZV15K8VdlYqCkryI6Y4u+zSpXNJZtbjCt9MxGBC
	fZgXtFHCeCzcs+vFBJBQ4oc9ozR+Pqj8BhY4ttZWDHDw74tZSVOmjwsIq82OxtOakp7k=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wDe6Q-0000jy-WC;
	Fri, 17 Apr 2026 07:59:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wDe6P-0000jj-EW
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Apr 2026 07:59:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qcd1EgDWssjZ+bgeLXpDDV/gJBQq50ljxTrnek4fR7o=; b=V8YepBzXetuALBhLep63yKfruv
 3n7LD8qSH/iZLxuO5NvJTFQJ8t/mCTtFaV2H0LbkCYaSA2D2GD2afvSGrdyGpWSi4Y7tQzpoXO59A
 XD1vUrnzrv8oINmt37S70WzcxXx1SjRizrIbvDgQrhC7ih7FWyzbFwXFY73i4jIt21H8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qcd1EgDWssjZ+bgeLXpDDV/gJBQq50ljxTrnek4fR7o=; b=UtQaaMuq0CbZm5/mulvfxlYg/w
 GJScbwhRsoXi8pYWtWKfBmjdPxOaFfB1nSlLjJ6fr0RGXtasUmN2Hb3JJfRzMbs1h9ideYqxzCIcH
 L7X/Vi8sS4FjqVkwFXiWu9pZ8t6fxDyc1YTEdaTy6mWoKHOMYLPL5YmpHYHWBRED3OzE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wDe6O-0001lg-TF for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Apr 2026 07:59:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7F01641927;
 Fri, 17 Apr 2026 07:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2E33C19425;
 Fri, 17 Apr 2026 07:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776412730;
 bh=mlhnpdv2cOQqDjf++vqtl0/8msZ/q+97zbd810L3RSU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=TbsYhsWfHetB/Pzx0+1NDgHAUJWsBbiFcm/YssfrmyNDm0XpiAc1kD2XgG1vvXN8A
 +0eQICLsLwg3nmnCjBajG/zcggB41wCTVgjSzf0LMVUao1og93yTjB7JlkN7TxcZnK
 30NzUZwdgfZXYkctQ4wvlNzCwpk2nYIy+5nPoD849Z+LrSvqO5iTLbwkvF1flvg6yi
 6MmL2Ou1UMXWTtm1cEXRQ2ZJIC8u+m4WCWQ5OZK3O5vFDMXePLZxBQRoUrYWr9ZWyE
 PLlqMtzVKo/5xqI0fDJc9Eq3zVJkFr6noE3enANnh2DINxbvhRGo7YDCyAEDlpXRD8
 fhpEfYlRRkp8g==
Message-ID: <06a0e816-21fd-4a5d-9389-4be43ce63d12@kernel.org>
Date: Fri, 17 Apr 2026 15:58:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Wenjie Qi <qwjhust@gmail.com>, jaegeuk@kernel.org
References: <20260417035126.3886702-1-qiwenjie@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20260417035126.3886702-1-qiwenjie@xiaomi.com>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/17/2026 11:51 AM, Wenjie Qi wrote: > From: Wenjie Qi
 <qwjhust@gmail.com> > > From: Wenjie Qi <qiwenjie@xiaomi.com> > > F2FS already
 classifies DATA writes using its existing hot, warm and cold > [...] 
 Content analysis details:   (-0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wDe6O-0001lg-TF
Subject: Re: [f2fs-dev] [RFC PATCH v2] f2fs: map data writes to FDP streams
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
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email];
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
X-Rspamd-Queue-Id: ACE044184DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/17/2026 11:51 AM, Wenjie Qi wrote:
> From: Wenjie Qi <qwjhust@gmail.com>
> 
> From: Wenjie Qi <qiwenjie@xiaomi.com>
> 
> F2FS already classifies DATA writes using its existing hot, warm and cold
> temperature policy, but it only passes that intent down as a write hint.
> That hint alone is not sufficient for NVMe FDP placement, because the
> current NVMe command path consumes `bio->bi_write_stream` rather than
> `bio->bi_write_hint` when selecting a placement ID.
> 
> When the target block device exposes write streams, map the existing F2FS
> DATA temperature classes onto stream IDs and set `bio->bi_write_stream`
> for both buffered and direct writes. If the device exposes no write
> streams, keep the current behavior by leaving the stream unset.
> 
> The stream mapping is evaluated against the target block device of each
> bio, so the existing per-device fallback behavior stays unchanged for
> multi-device filesystems. Existing blkzoned restrictions also remain in
> place.
> 
> The mapping is intentionally small and deterministic:
> 
> - 1 stream: hot, warm and cold all use stream 1
> - 2 streams: hot/warm use 1, cold uses 2
> - 3+ streams: hot uses 1, warm uses 2, cold uses 3
> 
> Signed-off-by: Wenjie Qi <qwjhust@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
