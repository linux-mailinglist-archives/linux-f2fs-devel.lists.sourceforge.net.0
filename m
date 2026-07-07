Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lafpFYzRTGrbqAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 07 Jul 2026 12:14:36 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C924071A2A7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 07 Jul 2026 12:14:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=fC45xhl2;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=XuVHzC9r;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=hKfL4GuN;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b="FlYM7d/N";
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vCEGxJwHdF4dG02OQculfkmmL7xw6XFBx1bn89WBEfE=; b=fC45xhl2uMtLuEBWBrTso6iwgl
	3LdeYghvCsoykQmOc+CVB2mWiMx3ertQN5tMG+Led4NGFSBsuc7yJQs9nEFBNO86SdINhVKovlYAu
	SU+XOXqzGOAMzGSVfwiVvLrzVda2wufNWNQkSFoHphQXRDBjjUAdWHI0TuP/8D4i0hWs=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wh2ou-0003EZ-EQ;
	Tue, 07 Jul 2026 10:14:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <asj@kernel.org>) id 1wh2oa-0003EI-U5
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Jul 2026 10:14:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mpXcOEu0WUkg9IXLiaEAgCjFTTJb7gqngOKpzTnr42c=; b=XuVHzC9rcJmoviyUO1eTXfci8b
 jckcnhzgt5SQAwUaiXuzyyzbOs0rSypEbdlBF7DHVsTmGVfMCr/UMbyKeTKQxI+l4oiST985Zv3Za
 9wvW87TLchtf8oniAuZ11Jshe73KdVNE4JokWuOlxnjQlHgjHYIBUGFV5zdWu4/wuqEc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mpXcOEu0WUkg9IXLiaEAgCjFTTJb7gqngOKpzTnr42c=; b=hKfL4GuNqFCZyH/5KxIlGcnVJZ
 5PZjXkL2/F49ld/Ib03TPa7DjlnlQHZKIGRfqXopEX3HbZn/BCG+RQRjupPoMouZGbZxmoqjWStGT
 vm70Dik4aLqMZaeLcZv4oqiJvyP6FjsmB/Wq/L1fXp9fpfoYL9GSeFBWe5acB1YGXCgo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wh2oX-0007bh-LE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 07 Jul 2026 10:14:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id B9F6643617
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  7 Jul 2026 10:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 585171F00A3A;
 Tue,  7 Jul 2026 10:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783419235;
 bh=mpXcOEu0WUkg9IXLiaEAgCjFTTJb7gqngOKpzTnr42c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=FlYM7d/NlZZPzpXaOuTpqg3nnsYG5665sRx8nXJtjRsfvVYYQPhUQgTR8JOCqindS
 /Cqvog2SCJAH9eBgBJCCp7e14RdANaxyesmbUDkq1a5NMuX/inK5NU/GxQ5VA6COA8
 0uhQ0fHGSVtPGk30fKnjYQzJ0iL6cAlB0MCZ6zxRThkRI03/lUlyvqtwMPgmSWf/2R
 ivqat/gqVZItO7fapEV0AeHLExXCXK2v+CuB7yUphwkJgBQtoBCHrqEkt1nztUmcco
 v9TZBy/XNOGB/gN7kzj2npxiXi7DKkPpgBUFcoooh+tW0Y6d0AfQ6RS60HD3Zjl0Z3
 o2jZc6uZ1pIDA==
Message-ID: <af5f0eb1-0197-4952-a37b-0602799929ec@kernel.org>
Date: Tue, 7 Jul 2026 18:13:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Zorro Lang <zlang@kernel.org>,
 fstests@vger.kernel.org
References: <20260706064326.3657995-1-chao@kernel.org>
Content-Language: en-US
In-Reply-To: <20260706064326.3657995-1-chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/7/26 14:43,
 Chao Yu wrote: > f2fs has supported to report
 fserror, this patch adds support for f2fs > in _require_fanotify_ioerrors(),
 so that we can run generic/791 on f2fs. > > Cc: Darrick J. W [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wh2oX-0007bh-LE
Subject: Re: [f2fs-dev] [PATCH v2] common/rc: support f2fs in
 _require_fanotify_ioerrors()
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
From: Anand Suveer Jain via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Anand Suveer Jain <asj@kernel.org>
Cc: jaegeuk@kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:zlang@kernel.org,m:fstests@vger.kernel.org,m:jaegeuk@kernel.org,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[asj@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C924071A2A7

On 6/7/26 14:43, Chao Yu wrote:
> f2fs has supported to report fserror, this patch adds support for f2fs
> in _require_fanotify_ioerrors(), so that we can run generic/791 on f2fs.
> 
> Cc: Darrick J. Wong <djwong@kernel.org>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  common/rc | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/common/rc b/common/rc
> index 494725547..f51ad59f3 100644
> --- a/common/rc
> +++ b/common/rc
> @@ -6257,6 +6257,9 @@ _require_fanotify_ioerrors()
>  		x="$(_get_fs_sysfs_attr $TEST_DEV err_report_sec)"
>  		test -n "$x" && return 0
>  		;;


> +	f2fs)
> +		x="$(cat /sys/fs/f2fs/features/fserror)"
> +		test -n "$x" && return 0

Don't we need to check if /sys/fs/f2fs/features/fserror
is present in the running kernel (there are helpers)
before reading it?



>  	esac
>  
>  	_notrun "$FSTYP does not support fanotify ioerrors"



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
