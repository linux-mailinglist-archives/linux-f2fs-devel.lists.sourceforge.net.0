Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mxPkLbjKwmkBmQQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 18:32:40 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9AD31A0FE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 18:32:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Date:Message-Id:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+CgoDaqpA4+wZMagwYldoplkL3YH5j9Z+oNc3iEfcM=; b=GYhC5rMJoLhAH/nua8WO9qRi6u
	RWpAJ+yeEYjg3eZgzjNFmLfGVXiJ3c/LnE2hXAS2XW2g9bo6wGPSAOJuaFmHHrG43THJpDQBcAw9Z
	Hh4IeOa+fbFhVzfWaZCMtMOSgv8KageB/rnF62+zbVOgoMtG7y8ulXzoo31YacWExId0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w55cH-0003kI-B6;
	Tue, 24 Mar 2026 17:32:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1w55cG-0003kB-Aa
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 17:32:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:
 Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NJwqzbuHXOTbFTvTCmS8xXwajzpvjyE17S+f1mlTs9g=; b=Z4GxNE8L+fk4NKpHTR2IykOqZt
 5RbAlcttG6VLEXS/YvIN4kdUnjPKeQxkfaFzFLhsxNZR79UJrEFw4D1t1Nt+F4Q0zM8hKb+sqrdro
 1mG4GzQe+yxgj0O7SOokGBYBisEJik1mA0m138OSu8CV0lerCqdcAUyF+Rq0Kligyick=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Cc:To:In-Reply-To:References:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NJwqzbuHXOTbFTvTCmS8xXwajzpvjyE17S+f1mlTs9g=; b=k/W7folPs19teLVPdxc2C5ll4q
 6jkp2BZPWvZ/DMMd3WSGoXZL+kAUIJaXYbi0DEqEkd1+R3ab6E5pobQ63CqjHKMiI6g+4UCyOssAa
 J/uLZt6ezTINDF0S6sck9l+4e0gEXGnX+H1+lXsF+efPOnoYVA0S9U/O3Y5GsJ0EL4sI=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w55cF-0007q2-Kv for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 17:32:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 59AEF4446A;
 Tue, 24 Mar 2026 17:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D5BC2BC87;
 Tue, 24 Mar 2026 17:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774373546;
 bh=nVE/fCIGf5wa4kduz8KQXpOSEKCj++KXJVgr1sn/yCc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=U7o23xDFZgF7aqC8zhRde1X0daJzsPBfEtikPt8R8BNTQryux3b/u0yPozBawaRcA
 RVtKBACR/7Uu00aVbxFxuuF5EYe2WP1sPh6iS6oU1MsdOmbzFZIJRD8IohgSkXJK+N
 iLEwjWlWzmELJz2OeucoLnqPZ+PfaqE5B/MtplFiLj5RFJRMAvZWXM+IWgyq9rfQST
 elajWlMSN8iGRmM0M+g/9q3q2hoi8PrjCR2BxCFu2OLwlvx1cEDMzzWV1tn7PgIlYQ
 od8ZvOsCxcrkfLGyK6YwivRBVv1CFlHstzuOipAcH3yB8gkh//YtqlllbTbk095+al
 jBePXzDEgbKjg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3FDE73808203; Tue, 24 Mar 2026 17:32:15 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177437353403.1223048.17520829968628791815.git-patchwork-notify@kernel.org>
Date: Tue, 24 Mar 2026 17:32:14 +0000
References: <20260323112123.786090-1-geoo115@gmail.com>
In-Reply-To: <20260323112123.786090-1-geoo115@gmail.com>
To: George Saad <geoo115@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: This patch was applied to jaegeuk/f2fs.git (dev) by
 Jaegeuk Kim <jaegeuk@kernel.org>: On Mon, 23 Mar 2026 11:21:23 +0000 you
 wrote: > In f2fs_compress_write_end_io(), dec_page_count(sbi, type) can bring
 > the F2FS_WB_CP_DATA counter to zero, unblocking > f2fs_wait_on_all_pages()
 in f2f [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w55cF-0007q2-Kv
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: fix use-after-free of sbi in
 f2fs_compress_write_end_io()
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
From: patchwork-bot+f2fs--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: patchwork-bot+f2fs@kernel.org
Cc: gregkh@linuxfoundation.org, linux-f2fs-devel@lists.sourceforge.net,
 stable@vger.kernel.org, jaegeuk@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geoo115@gmail.com,m:gregkh@linuxfoundation.org,m:linux-f2fs-devel@lists.sourceforge.net,m:stable@vger.kernel.org,m:jaegeuk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim];
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
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org]
X-Rspamd-Queue-Id: 2B9AD31A0FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGVsbG86CgpUaGlzIHBhdGNoIHdhcyBhcHBsaWVkIHRvIGphZWdldWsvZjJmcy5naXQgKGRldikK
YnkgSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz46CgpPbiBNb24sIDIzIE1hciAyMDI2
IDExOjIxOjIzICswMDAwIHlvdSB3cm90ZToKPiBJbiBmMmZzX2NvbXByZXNzX3dyaXRlX2VuZF9p
bygpLCBkZWNfcGFnZV9jb3VudChzYmksIHR5cGUpIGNhbiBicmluZwo+IHRoZSBGMkZTX1dCX0NQ
X0RBVEEgY291bnRlciB0byB6ZXJvLCB1bmJsb2NraW5nCj4gZjJmc193YWl0X29uX2FsbF9wYWdl
cygpIGluIGYyZnNfcHV0X3N1cGVyKCkgb24gYSBjb25jdXJyZW50IHVubW91bnQKPiBDUFUuIFRo
ZSB1bm1vdW50IHBhdGggdGhlbiBwcm9jZWVkcyB0byBjYWxsCj4gZjJmc19kZXN0cm95X3BhZ2Vf
YXJyYXlfY2FjaGUoc2JpKSwgd2hpY2ggZGVzdHJveXMKPiBzYmktPnBhZ2VfYXJyYXlfc2xhYiB2
aWEga21lbV9jYWNoZV9kZXN0cm95KCksIGFuZCBldmVudHVhbGx5Cj4ga2ZyZWUoc2JpKS4gTWVh
bndoaWxlLCB0aGUgYmlvIGNvbXBsZXRpb24gY2FsbGJhY2sgaXMgc3RpbGwgZXhlY3V0aW5nOgo+
IHdoZW4gaXQgcmVhY2hlcyBwYWdlX2FycmF5X2ZyZWUoc2JpLCAuLi4pLCBpdCBkZXJlZmVyZW5j
ZXMKPiBzYmktPnBhZ2VfYXJyYXlfc2xhYiDigJQgYSBkZXN0cm95ZWQgc2xhYiBjYWNoZSDigJQg
dG8gY2FsbAo+IGttZW1fY2FjaGVfZnJlZSgpLCBjYXVzaW5nIGEgdXNlLWFmdGVyLWZyZWUuCj4g
Cj4gWy4uLl0KCkhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5rczoKICAtIFtmMmZzLWRldix2
NF0gZjJmczogZml4IHVzZS1hZnRlci1mcmVlIG9mIHNiaSBpbiBmMmZzX2NvbXByZXNzX3dyaXRl
X2VuZF9pbygpCiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2phZWdldWsvZjJmcy9jLzM5ZDRl
ZTE5YzFlNwoKWW91IGFyZSBhd2Vzb21lLCB0aGFuayB5b3UhCi0tIApEZWV0LWRvb3QtZG90LCBJ
IGFtIGEgYm90LgpodHRwczovL2tvcmcuZG9jcy5rZXJuZWwub3JnL3BhdGNod29yay9wd2JvdC5o
dG1sCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==
