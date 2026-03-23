Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMe6CpMkwWmTQwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 12:31:31 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5562C2F13D6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 12:31:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JPwRrmK6EhM5SeuXDtJbcPdDIGrBiDFwPHfXdp+PR70=; b=hls2N8/mTgTH5IFufsORbJNQA6
	kz5XQ22SbN5FJmXKwrIwyLd9mWqzKt6AZPm60JU6UBqAlxuhj/KkV9Y0xbte52gmuHI6pzdWnz8cJ
	1egKDbX4wwliT7hFNh1Zj4ZWnHoF3bFAy2jTQn2EK/FuxjlImqsmTz7qqjBtbGKcaUTI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w4dVF-0007sw-OF;
	Mon, 23 Mar 2026 11:31:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w4dUn-0007r9-Mi
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 11:30:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UzhS2LMBgeTTEv74a9dAaJegNG7pTSUEmGwCdpLs7IY=; b=f8Sb5htAjK7s4G/10PD/mk/EQK
 oAuIAB/LNFsOJI+SteSmQ/JgHhKthsbGIRagxP9aGllBGsuz+0luGnrvblxBMHCGxmt1Ge2UsqTXD
 YbRpwZoH+It9aezmclw05wxfAsfUKgRaqs++6yhdkizpuTp5MgqCZvz2bYAHQkmSVF1M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UzhS2LMBgeTTEv74a9dAaJegNG7pTSUEmGwCdpLs7IY=; b=S6KLEVXJvPaMO8+/yPEkWpSN7n
 qQ6nc28NCHtkF/6B3+0J76MNMGGHjWg/ZwlaVdKb6F1DeihJVeYuXfZwR59JZA6JNiJmQXDpJ0bqS
 +LZWvUhCLSHwVR9QnHo+2jTBS9KN+ygG5MRNOkOYFBYtLMUEkInol1is6G1uwQhKBPfM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w4dUn-0001Y0-S3 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 11:30:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2E65F60051;
 Mon, 23 Mar 2026 11:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8D8C2BC87;
 Mon, 23 Mar 2026 11:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774265451;
 bh=GVqRiVt4osew0umooFSc4o0FjQ98ZlGWz4FE2h8vSdU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=rFNlnfqdQbCuBiYbm7N3zKwMzDDZeG0hgAbV0i9MkiyRV78p6jjzdJKXjwZVOf/N9
 PsQqvAMeY8gIc+lmIz2qmR+ZTg1CRe8Rm7Et5xVHgtRgrcerIG2PjbjE2mq9TgKzO+
 Ln+CL+lyOpbv6sIj2JKKQCyxHAl6TUdK+6I4FC50NAEchECLeWFZzjwkHgWsYV0mfj
 /HxvTyV5q28bTE67l9jIolmzceKuU9qwEtbMOdYKuHHP1+UIG7ol2psEbulbTjFA2a
 M7Am5N6GcuwSlPHb7FpOXC6q9qpkLOq/0Kb7qMyxRywIB0x/JbScIh1hwtJ/bOLGRe
 FDQAxJidbcrmw==
Message-ID: <f1c0344d-ac65-4e16-85dd-70697d8836a1@kernel.org>
Date: Mon, 23 Mar 2026 19:30:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: George Saad <geoo115@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
References: <2026032354-country-saddlebag-5331@gregkh>
 <20260323112123.786090-1-geoo115@gmail.com>
Content-Language: en-US
In-Reply-To: <20260323112123.786090-1-geoo115@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/23/26 19:21,
 George Saad wrote: > In f2fs_compress_write_end_io(), 
 dec_page_count(sbi, type) can bring > the F2FS_WB_CP_DATA counter to zero,
 unblocking > f2fs_wait_on_all_pages() in f2fs_put_sup [...] 
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
X-Headers-End: 1w4dUn-0001Y0-S3
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geoo115@gmail.com,m:gregkh@linuxfoundation.org,m:jaegeuk@kernel.org,m:stable@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim];
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
X-Rspamd-Queue-Id: 5562C2F13D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMy8yMy8yNiAxOToyMSwgR2VvcmdlIFNhYWQgd3JvdGU6Cj4gSW4gZjJmc19jb21wcmVzc193
cml0ZV9lbmRfaW8oKSwgZGVjX3BhZ2VfY291bnQoc2JpLCB0eXBlKSBjYW4gYnJpbmcKPiB0aGUg
RjJGU19XQl9DUF9EQVRBIGNvdW50ZXIgdG8gemVybywgdW5ibG9ja2luZwo+IGYyZnNfd2FpdF9v
bl9hbGxfcGFnZXMoKSBpbiBmMmZzX3B1dF9zdXBlcigpIG9uIGEgY29uY3VycmVudCB1bm1vdW50
Cj4gQ1BVLiBUaGUgdW5tb3VudCBwYXRoIHRoZW4gcHJvY2VlZHMgdG8gY2FsbAo+IGYyZnNfZGVz
dHJveV9wYWdlX2FycmF5X2NhY2hlKHNiaSksIHdoaWNoIGRlc3Ryb3lzCj4gc2JpLT5wYWdlX2Fy
cmF5X3NsYWIgdmlhIGttZW1fY2FjaGVfZGVzdHJveSgpLCBhbmQgZXZlbnR1YWxseQo+IGtmcmVl
KHNiaSkuIE1lYW53aGlsZSwgdGhlIGJpbyBjb21wbGV0aW9uIGNhbGxiYWNrIGlzIHN0aWxsIGV4
ZWN1dGluZzoKPiB3aGVuIGl0IHJlYWNoZXMgcGFnZV9hcnJheV9mcmVlKHNiaSwgLi4uKSwgaXQg
ZGVyZWZlcmVuY2VzCj4gc2JpLT5wYWdlX2FycmF5X3NsYWIg4oCUIGEgZGVzdHJveWVkIHNsYWIg
Y2FjaGUg4oCUIHRvIGNhbGwKPiBrbWVtX2NhY2hlX2ZyZWUoKSwgY2F1c2luZyBhIHVzZS1hZnRl
ci1mcmVlLgo+IAo+IFRoaXMgaXMgdGhlIHNhbWUgY2xhc3Mgb2YgYnVnIGFzIENWRS0yMDI2LTIz
MjM0ICh3aGljaCBmaXhlZCB0aGUKPiBlcXVpdmFsZW50IHJhY2UgaW4gZjJmc193cml0ZV9lbmRf
aW8oKSBpbiBkYXRhLmMpLCBidXQgaW4gdGhlCj4gY29tcHJlc3NlZCB3cml0ZWJhY2sgY29tcGxl
dGlvbiBwYXRoIHRoYXQgd2FzIG5vdCBjb3ZlcmVkIGJ5IHRoYXQgZml4Lgo+IAo+IEZpeCB0aGlz
IGJ5IG1vdmluZyBkZWNfcGFnZV9jb3VudCgpIHRvIGFmdGVyIHBhZ2VfYXJyYXlfZnJlZSgpLCBz
bwo+IHRoYXQgYWxsIHNiaSBhY2Nlc3NlcyBjb21wbGV0ZSBiZWZvcmUgdGhlIGNvdW50ZXIgZGVj
cmVtZW50IHRoYXQgY2FuCj4gdW5ibG9jayB1bm1vdW50LiBGb3Igbm9uLWxhc3QgZm9saW9zICh3
aGVyZSBhdG9taWNfZGVjX3JldHVybiBvbgo+IGNpYy0+cGVuZGluZ19wYWdlcyBpcyBub256ZXJv
KSwgZGVjX3BhZ2VfY291bnQgaXMgY2FsbGVkIGltbWVkaWF0ZWx5Cj4gYmVmb3JlIHJldHVybmlu
ZyDigJQgcGFnZV9hcnJheV9mcmVlIGlzIG5vdCByZWFjaGVkIG9uIHRoaXMgcGF0aCwgc28KPiB0
aGVyZSBpcyBubyBwb3N0LWRlY3JlbWVudCBzYmkgYWNjZXNzLiBGb3IgdGhlIGxhc3QgZm9saW8s
Cj4gcGFnZV9hcnJheV9mcmVlIHJ1bnMgd2hpbGUgdGhlIEYyRlNfV0JfQ1BfREFUQSBjb3VudGVy
IGlzIHN0aWxsCj4gbm9uemVybyAodGhpcyBmb2xpbyBoYXMgbm90IHlldCBkZWNyZW1lbnRlZCBp
dCksIGtlZXBpbmcgc2JpIGFsaXZlLAo+IGFuZCBkZWNfcGFnZV9jb3VudCBydW5zIGFzIHRoZSBm
aW5hbCBvcGVyYXRpb24uCj4gCj4gRml4ZXM6IDRjOGZmNzA5NWJlZiAoImYyZnM6IHN1cHBvcnQg
ZGF0YSBjb21wcmVzc2lvbiIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQt
b2ZmLWJ5OiBHZW9yZ2UgU2FhZCA8Z2VvbzExNUBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogQ2hh
byBZdSA8Y2hhb0BrZXJuZWwub3JnPgoKVGhhbmtzLAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
