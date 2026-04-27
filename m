Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALBpNmYR72mU5QAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Apr 2026 09:33:58 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4124E46E64C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Apr 2026 09:33:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Osv5RgXc5wXbpkT1EfM1h5Wn/mcxLpHi0NUFYX6cJiI=; b=cyQzrub16mfK+FX0dluEHvoRYt
	CBi4olOooYyT00pm186HHTTobdchgCxOvxMv1X54hs5L0jzSLHoacfZEW5jiJ5uDXxAg2UrR9NSbM
	NKZtotg4yxGuRBwcZsmNcq0VzGRoaFVCMU0PvmOOLboo2i7U0YsnBKCX3vF7iV3F5G5w=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wHGTU-0004II-4O;
	Mon, 27 Apr 2026 07:33:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wHGTT-0004IB-4E
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Apr 2026 07:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i8Mr6bXTAEQC4QTsyaEag827ihaPYSvvBABzx2WzVF4=; b=TqMqsC6I/T70oNms0miuiTE5Of
 mAz0Z/VUwylRz8VoMJWJoHrK/8FNaHalEpWCcZRsjDHSBBOWyEmkgUO7x+sT2oQo8takN7ZXyQ/UJ
 MR8KTCkePlSRVyvNim04bALCM3wzj0WoFzq7vpqRjiQODkefwm1A/J05fQfmspfojqio=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i8Mr6bXTAEQC4QTsyaEag827ihaPYSvvBABzx2WzVF4=; b=PT/8DUTfsaM9nVJmAfnPY2nEB9
 Bc2WZcjJALDcwT8rHw+TP8Xcbw8/4JYIUx9tcTUp29PG3YBteJAl0ZBkZObwdIwsgxPoQO5P85eEX
 pIoREw/eZQiF8YqfuHlavWb3cAR1EuCAi6EeQdeVkxP8Jocn9AdloTavgLNV/qWJisKY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wHGTS-0003Xe-Ke for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Apr 2026 07:33:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F3C9E4070D;
 Mon, 27 Apr 2026 07:33:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66CDFC19425;
 Mon, 27 Apr 2026 07:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777275220;
 bh=b9AxYmzdGCg+ofoRv67ylY1tpBSn4LI9sCdEga/D76o=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=lj2iuf7K79RlCP5NRAE8Usvh98vdXuRYGqcI+IDTgvHOtVSvziOuGVxNTPkLZtj0w
 Pz76t+WOb19DykX9PM9jCFyU2zUe53EW1cgKCl7bWcQRVHm3HWr7/Bck7SIf2fcjxH
 MxReklYjcW8CoytX4KmlhwBJnbeCf6ETDRP5jHhb6z2OBVuDPkkLeaP3Z5aK7krQn9
 ZUk0TjdOT3rxxlXEx+u3BW2qznrBrYe49Z49LIXFnS4eEW6XRCljw2YAJ46XT4pIlF
 /rjGSPfBIvRWIJeQ4Q1KIhjD4PoAEkJVhiZ+b3dvnUURMz6usJ82mPSzCFoMUEBo0e
 fCzwbOyz46JJA==
Message-ID: <5340eefd-36ee-48ee-bcfa-e5e991af6f9a@kernel.org>
Date: Mon, 27 Apr 2026 15:33:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: LuK1337 <priv.luk@gmail.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20260313130915.1752881-1-priv.luk@gmail.com>
Content-Language: en-US
In-Reply-To: <20260313130915.1752881-1-priv.luk@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 3/13/26 21:09, LuK1337 wrote: > From: Łukasz Patron <priv.luk@gmail.com>
    > > Fixes: a66d49fd2678 ("dump.f2fs: Dump symlinks as symlinks") > Signed-off-by:
    Łukasz Patron <priv.luk@gmail.com> Reviewed-by: Chao Yu <chao@kernel.org>
    
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wHGTS-0003Xe-Ke
Subject: Re: [f2fs-dev] [PATCH] dump.f2fs: macOS does not support lsetxattr
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
Cc: jaegeuk@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 4124E46E64C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:priv.luk@gmail.com,m:linux-f2fs-devel@lists.sourceforge.net,m:jaegeuk@kernel.org,m:privluk@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
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
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[3];
	HAS_REPLYTO(0.00)[chao@kernel.org]

T24gMy8xMy8yNiAyMTowOSwgTHVLMTMzNyB3cm90ZToKPiBGcm9tOiDFgXVrYXN6IFBhdHJvbiA8
cHJpdi5sdWtAZ21haWwuY29tPgo+IAo+IEZpeGVzOiBhNjZkNDlmZDI2NzggKCJkdW1wLmYyZnM6
IER1bXAgc3ltbGlua3MgYXMgc3ltbGlua3MiKQo+IFNpZ25lZC1vZmYtYnk6IMWBdWthc3ogUGF0
cm9uIDxwcml2Lmx1a0BnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJu
ZWwub3JnPgoKVGhhbmtzLAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
