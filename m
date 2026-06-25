Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qSXrNjzUPGr5swgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jun 2026 09:09:48 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 148326C3442
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jun 2026 09:09:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=KFY1KA58;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=MjDYMytv;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=GAJg21RM;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=cjH6ojaf;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ro2mnVnP8Fxy0wkPRj/UYF+Q7bEvZnIhzZv0oBUYDQ=; b=KFY1KA58b1iVEf9IwxaRvGeNpG
	3Sg8qo9G954mWhtLPPeryVvBlI9T5a4UjfFnOHssOuy71FwUhcZb0K7XYtJq8cQ22f/Ldp6EuB2+F
	g4+TE6V/dmaf9KUUiaZ1hL+aW/R8fXuoBTvn4TtnuNOIQH75NWK81KUCvVPAAO3OiWII=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wceDP-0004g0-Ti;
	Thu, 25 Jun 2026 07:09:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wceDO-0004fp-U0
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jun 2026 07:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EhW6mFsXgVvemOLRz8lv4SbjFuzlu7LDeYPY3JKfal8=; b=MjDYMytv0NqzzusA75+P/9NI1d
 w39rdzaaxpqVgIcJy4RJnJo1nLGqqFJXA80oiMuZ5opCCdhYLIqc74wFjhqmKVkJNKmY1Wqp3fdM+
 iHBjcDxVqWqzpoJXIyU8NYXvmnTuDfdFNavWa1jQuvK++qbA4mK0gFtQGvg/iOEf0aiA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EhW6mFsXgVvemOLRz8lv4SbjFuzlu7LDeYPY3JKfal8=; b=GAJg21RMn6sKxs3UeuzPXXt1PR
 K1fFFNDdL+MAMsQ8yvtnyf4bA87iZD8IgYfludI+KBgEjyjsigxW3y4REazvOmwBKmFRLx6nEviaC
 c8J+wYSyOU3tkbHL2Vxl2i5aXvvhB4i4rXhgF0dOArQIXdnY9Jy59hS7qG/w3gQynXIQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wceDN-0003rq-JC for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jun 2026 07:09:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id AF21B401EF;
 Thu, 25 Jun 2026 07:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5326E1F000E9;
 Thu, 25 Jun 2026 07:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782371368;
 bh=EhW6mFsXgVvemOLRz8lv4SbjFuzlu7LDeYPY3JKfal8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=cjH6ojafBp2aj8NQEVOEHdzaslGK9lzr6bbFLd04S8zSFlEqIxRp7La+fOHABIEFX
 iCNoPVxovWg3Qx9TRqivSxeY0c0x5jtE/g7RXC0o3rGiF9KBm61Bn6n34KeAzL7jas
 vDj+Z++Y2HASBoSPjt8G+uONdJjUk9y8Bq/Fatf4JwpoXmDlQTKT7zvjBS61y3mBHy
 FyVDaRHQIOsRm4dvtr0QHzFdp8Yq5BuNVH/ctT3XkeJxGblJrK8CGCma/aBKbs5TX6
 nwjZHOtwJJ0VqZqMX4p8iQ2o0MbZH2+oE2uLeP8hPVPHHag/YYfCSg2zEObO7XYI2I
 rrRxhbyx8m9mA==
Message-ID: <2d9c5628-7f99-47f8-9d51-ac64352af4d9@kernel.org>
Date: Thu, 25 Jun 2026 15:09:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiucheng Xu <jiucheng.xu@amlogic.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260620-origin-dev-v1-1-3b2e639e794c@amlogic.com>
 <dffacd73-ebc2-4f35-9433-d569b48014be@kernel.org>
 <e9f39088-a4c1-4d1f-9a06-9d530e3fab15@amlogic.com>
Content-Language: en-US
In-Reply-To: <e9f39088-a4c1-4d1f-9a06-9d530e3fab15@amlogic.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/22/26 18:40, Jiucheng Xu wrote: > > On 6/22/2026 9:46
 AM, Chao Yu wrote: >> [Some people who received this message don't often
 get email from chao@kernel.org. Learn why this is important at https [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wceDN-0003rq-JC
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix FG GC failure when file in victim
 is pinned
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
Cc: tuan.zhang@amlogic.com, linux-kernel@vger.kernel.org,
 jianxin.pan@amlogic.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jiucheng.xu@amlogic.com,m:jaegeuk@kernel.org,m:tuan.zhang@amlogic.com,m:linux-kernel@vger.kernel.org,m:jianxin.pan@amlogic.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
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
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 148326C3442

T24gNi8yMi8yNiAxODo0MCwgSml1Y2hlbmcgWHUgd3JvdGU6Cj4gCj4gT24gNi8yMi8yMDI2IDk6
NDYgQU0sIENoYW8gWXUgd3JvdGU6Cj4+IFtTb21lIHBlb3BsZSB3aG8gcmVjZWl2ZWQgdGhpcyBt
ZXNzYWdlIGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIGNoYW9Aa2VybmVsLm9yZy4gTGVhcm4g
d2h5IHRoaXMgaXMgaW1wb3J0YW50IGF0IGh0dHBzOi8vYWthLm1zLyBMZWFybkFib3V0U2VuZGVy
SWRlbnRpZmljYXRpb24gXQo+Pgo+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4KPj4gT24gNi8yMC8y
NiAxNzozNCwgSml1Y2hlbmcgWHUgdmlhIEI0IFJlbGF5IHdyb3RlOgo+Pj4gRnJvbTogSml1Y2hl
bmcgWHUgPGppdWNoZW5nLnh1QGFtbG9naWMuY29tPgo+Pj4KPj4+IFdoZW4gY29udGludW91cyB3
cml0ZSBvcGVyYXRpb25zIG9jY3VyIGluIHRoZSBzeXN0ZW0sIEJHIEdDIGZhaWxzIHRvCj4+PiB3
b3JrLiBUaGlzIGxlYWRzIHRvIGxhcmdlIGRpcnR5X3NlZ21lbnRzIGFuZCBzbWFsbCBmcmVlX3Nl
Z21lbnRzLiBJZgo+Pj4gZmFsbG9jYXRlKCkgaXMgcGVyZm9ybWVkIG9uIGEgcGlubmVkIGZpbGUg
d2l0aCB0aGUgYWxsb2NhdGVkIHNwYWNlCj4+PiBleGNlZWRpbmcgdGhlIGZyZWVfc2VnbWVudCwg
RkdfR0MgcmVjbGFtYXRpb24gZmFpbHMuCj4+Pgo+Pj4gVGhlIHJlYXNvbiBpcyB0aGF0IHRoZSBm
aWxlIGNvcnJlc3BvbmRpbmcgdG8gdGhlIGJsb2NrIGluIHRoZSB2aWN0aW0gaXMKPj4+IHBpbm5l
ZCwgY2F1c2luZyBnY19kYXRhX3NlZ21lbnQoKSB0byBmYWlsLiBTaW5jZSB0aGUgY29uZGl0aW9u
IHNlY19mcmVlZAo+Pgo+PiBKaXVjaGVuZywKPj4KPj4gcGlubmVkIGZpbGUgc2hvdWxkIGJlIGFs
aWduZWQgdG8gc2VjdGlvbiBzaXplLCB3aHkgdGhlcmUgaXMgZnJhZ21lbnRlZCBibG9ja3MKPj4g
b2YgcGluZmlsZSBsb2NhdGVzIGluIGRpcnR5IHNlY3Rpb25zPwo+Pgo+Pj4gPCBnY19jb250cm9s
LT5ucl9mcmVlX3NlY3MgaXNuJ3Qgc2F0aXNmaWVkLCBHQyBzdG9wcywgcmVzdWx0aW5nIGluIHRo
ZQo+Pj4gZmFpbHVyZSBvZiBmMmZzX2ZhbGxvY2F0ZSgpIGFsbG9jYXRpb24uCj4+Pgo+Pj4gU2V0
dGluZyBnY19jb250cm9sLT5ucl9mcmVlX3NlY3MgPSAxIG1ha2UgRkcgR0MgY29udGludWUgc2Vh
cmNoaW5nCj4+PiBmb3IgbmV3IHZpY3RpbS4KPj4KPj4gTWF5YmUgd2UgY2FuIHRyeSB0aGlzIGlu
c3RlYWQgb2YgY2hhbmdpbmcgZjJmc19leHBhbmRfaW5vZGVfZGF0YSgpIGxvZ2ljOgo+PiAxLiBj
YWxsIGZnZ2MgdmlhIGlvY3RsIG9yIHRyaWdnZXIgdXJnZW50IGdjIHZpYSBzeXNmcwo+PiAyLiBm
YWxsb2NhdGUgb24gcGluZmlsZSwgZ290byAxKSBpZiBpdCBmYWlsZWQKPj4KPj4gQnV0LCBhbnl3
YXksIEkgc3VzcGVjdCBpdCdzIHJpc2ssIGlmIHRoZXJlIGlzIG5vIG5vcm1hbCBkaXJ0eSBzZWN0
aW9uLAo+PiBGR0dDIHdpbGwgdHJ5IHRvIGNhbGwgZjJmc191bnBpbl9hbGxfc2VjdGlvbnMoKSwg
dGhlbiBtaWdyYXRlIGRpcnR5IHNlY3Rpb24KPj4gd2hpY2ggaGFzIHBpbm5lZCBibG9ja3MsIHRo
YXQgd2lsbCBjYXVzZSBtb3JlIGRhbWFnZS4KPj4KPj4gQ2FuIHlvdSBwbGVhc2UgZmlndXJlIG91
dCB3aHkgcGluZmlsZSBpcyBmcmFnbWVudGVkIGZpcnN0Li4uCj4gCj4gSGkgQ2hhbywKPiAKPiBU
aGFua3MgZm9yIHlvdXIgZmVlZGJhY2suIEkganVzdCBkbyBhIHRlc3QgdG8gc2ltdWxhdGUgdGhl
IEFuZHJvaWQgT1RBIGNyZWF0ZUNvd0ltYWdlIGZhaWxlZCB3aGVuIGRpcnR5X3NlZ21lbnRzIGlz
IHRvbyBsYXJnZS4KPiAKPiBTaW1wbGUgcmVwcm9kdWN0aW9uIHN0ZXBzOgo+IDEuIEluIG15IGNh
c2UsIGRpcnR5X3NlZ21lbnRzPTk2OSwgZnJlZV9zZWdtZW50cz05NiwgZnJlZSBzcGFjZSA9IDEu
N0csIHNlY3Rpb246c2VnbWVudCA9IDE6MQo+IDIuIHRvdWNoIGEuYmluCj4gMy4gZjJmc19pbyBw
aW5maWxlIHNldCBhLmJpbgo+IDQuIGZhbGxvY2F0ZSAtbCAxLjVHIGEuYmluCj4gCj4gQW5kIGYy
ZnNfZmFsbG9jYXRlKCkgcmV0dXJucyAtMTEuCj4gCj4gQWx0aG91Z2ggdGhlIHVyZ2VudCBtb2Rl
IHdvcmsgZmluZSwgYnV0IGl0IGlzIG5vdCB2ZXJ5IGNvbnZlbmllbnQgdG8gY29udHJvbCBzaW5j
ZSBBT1BTIGhhcyBhIGdyZWF0IGRlYWwgb2YgY29kZSB0aGF0IGNhbGxzIGZhbGxvY2F0ZS4KPiAK
PiBJIGhhdmUgdHJpZWQgNSB0aW1lcyB0byBmYWxsb2NhdGUoKSwgYnV0IEdDIGFsd2F5cyBzZWxl
Y3RzIHRoZSBzYW1lIHZpY3RpbSBzZWduby4gU28gSSB0aGluayBpdCBpcyBhbiBpc3N1ZS4KPiAK
PiAKPiBUaGUgdHJhY2U6Cj4gZjJmc19nZXRfdmljdGltOiBkZXYgPSAoMjU0LDApLCB0eXBlID0g
Tm8gVFlQRSwgcG9saWN5ID0gKEZvcmVncm91bmQgR0MsIExGUy1tb2RlLCBHcmVlZHkpLCB2aWN0
aW0gPSA2MjQsIGNvc3QgPSAxOS4uLgo+IAo+IGYyZnNfZ2NfZW5kOiBkZXYgPSAoMjU0LDApLCBy
ZXQgPSAwLCBzZWdfZnJlZWQgPSAwLCBzZWNfZnJlZWQgPSAwLCBub2RlcyA9IDExNywgZGVudHMg
PSAwLCBpbWV0YSA9IDk4LCBmcmVlX3NlYzo1MCwgZnJlZV9zZWc6NTAsIHJzdl9zZWc6NDcsIHBy
ZWZyZWVfc2VnOjQ3Cj4gCj4gCj4gSSBkdW1wIHRoZSBmYWlsZWQgdmljdGltIHNlZ25vLCBibG9j
ayBvZmZzZXQgaW4gc2VnbWVudCBhbmQgcmVsYXRlZCBpbm9kZSBpbm86Cj4gZG9fZ2FyYmFnZV9j
b2xsZWN0OiBpbm89MzM5MDIgc2Vnbm89NjI0IG9mZj0xMzIKPiAKPiBUaGUgZHVtcCBvZiBwaW5m
aWxlIDMzOTAyIGluZm86Cj4gbWFpbl9ibGthZGRywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFsweMKgwqDCoCAyNjAwIDogOTcyOF0KPiBpX2lu
bGluZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFsweMKgwqDCoMKgwqAgNjEgOiA5N10KPiBpbmxpbmUgc2hvd3MgdGhlIGZpbGUg
aXMgcGlubmVkICgweDYwKQo+IGlfYWRkclsweDldwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgWzB4wqDCoCAyZjdiMiA6IDE5NDQ4Ml0KPiBp
X2FkZHJbMHhhXcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFsweMKgwqAgMmY3YjMgOiAxOTQ0ODNdCj4gaV9hZGRyWzB4Yl3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBbMHjCoMKgIDJm
N2I0IDogMTk0NDg0XQo+IC4uLgo+IGlfYWRkclsweDFkXcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBbMHjCoMKgIDJmN2M2IDogMTk0NTAyXQo+
IGlfYWRkclsweDFlXcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBbMHjCoMKgIDQ2NWFmIDogMjg4MTc1XQo+IGlfYWRkclsweDFmXcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBbMHjCoMKgIDQ2
NWIwIDogMjg4MTc2XQo+IC4uLgo+IGlfYWRkclsweDIxXcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBbMHjCoMKgIDQ2NWIyIDogMjg4MTc4XQo+
IGlfYWRkclsweDIyXcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBbMHjCoMKgIDUwNDZkIDogMzI4ODEzXQo+IGlfYWRkclsweDIzXcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBbMHjCoMKgIDUw
NDZlIDogMzI4ODE0XQo+IGlfYWRkclsweDI0XcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBbMHjCoMKgIDUwNWI2IDogMzI5MTQyXQo+IGlfYWRk
clsweDI1XcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBbMHjCoMKgIDUwNWI3IDogMzI5MTQzXQo+IGlfYWRkclsweDI2XcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBbMHjCoMKgIDUwNWI4IDog
MzI5MTQ0XQo+IGlfYWRkclsweDI3XcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBbMHjCoMKgIDUwNjg0IDogMzI5MzQ4XQo+IGlfYWRkclsweDI4
XcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBb
MHjCoMKgIDUwNjg1IDogMzI5MzQ5XQo+IAo+IFRoZSBmaWxlIGlzIGNyZWF0ZWQgYnkgbG9nY2F0
LGFuZCBsb29rcyBsaWtlIGluZGVlZCBmcmFnbWVudGVkLgo+IAo+IENhbGN1bGF0ZSB0aGUgYmxv
Y2sgYWRkcmVzczoKPiA2MjQgKiA1MTIgKyAxMzIgKyA5NzI4KG1haW5fYmxrYWRkcikgPSAzMjkz
NDgKPiAKPiBTbyB0aGUgaV9hZGRyWzB4MjddID0gMzI5MzQ4IGlzIHRoZSBmYWlsZWQgYmxvY2su
Cj4gCj4gUmVnYXJkaW5nICJ3aHkgdGhlIHBpbmZpbGUgaXMgZnJhZ21lbnRlZCIgeW91IHNhaWQs
IHdlIHVzZSB2NS4xNSArIGFuZHJvaWQgVS4gSXMgaXQgdGhhdCB2NS4xNSBsYWNrcyBzb21lIHBh
dGNoZXMgZm9yIHNwZWNpYWwgaGFuZGxpbmcgb2YgcGluZmlsZXM/CgpBaCwgSSB0aGluayB5b3Ug
Y2FuIHVucGluIGxvZyBmaWxlIGNyZWF0ZWQgYnkgbG9nY2F0LCB0aGUgZmxhZyBpcyBhZGRlZApp
biBhb3NwLzEwMTQyNjAgdG8gYXZvaWQgZnJhZ21lbnRhdGlvbiBpbiBmaWxlc3lzdGVtICgpLCBi
dXQgaXQncyBnb25lIGluCmFvc3AvNDNjNmQ3NmEKClRoYW5rcywKCj4gCj4gVGhhbmtzLAo+IAo+
IAo+Pgo+PiBUaGFua3MsCj4+Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSml1Y2hlbmcgWHUgPGpp
dWNoZW5nLnh1QGFtbG9naWMuY29tPgo+Pj4gLS0tCj4+PiDCoCBmcy9mMmZzL2ZpbGUuYyB8IDIg
Ky0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
Pj4KPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4+PiBp
bmRleCA4YWNkZDk0MjcyYTBjZWQ0NDhlMGJhMjE2MzVkNzAyY2ZlYzEwNjgyLi4zZTQ5YTczYmJm
M2ExODRhMzE0ZTk3YmZmOTUwOWE2NmMyN2VhYzAwIDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9m
aWxlLmMKPj4+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jCj4+PiBAQCAtMTg4Myw3ICsxODgzLDcgQEAg
c3RhdGljIGludCBmMmZzX2V4cGFuZF9pbm9kZV9kYXRhKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGxv
ZmZfdCBvZmZzZXQsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLmluaXRfZ2NfdHlwZSA9IEZHX0dDLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC5zaG91bGRfbWlncmF0ZV9ibG9ja3MgPSBmYWxzZSwKPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuZXJyX2djX3NraXBwZWQgPSB0
cnVlLAo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLm5yX2Zy
ZWVfc2VjcyA9IDAgfTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC5ucl9mcmVlX3NlY3MgPSAxIH07Cj4+PiDCoMKgwqDCoMKgIHBnb2ZmX3QgcGdfc3RhcnQs
IHBnX2VuZDsKPj4+IMKgwqDCoMKgwqAgbG9mZl90IG5ld19zaXplOwo+Pj4gwqDCoMKgwqDCoCBs
b2ZmX3Qgb2ZmX2VuZDsKPj4+Cj4+PiAtLS0KPj4+IGJhc2UtY29tbWl0OiBiNTFmNjA2YWEzMjNk
NTUzZDc4NmVkNjgxYTIxM2YxMzRkYzY4OGQ2Cj4+PiBjaGFuZ2UtaWQ6IDIwMjYwNjIwLW9yaWdp
bi1kZXYtOTljZGNjYzgzODAwCj4+Pgo+Pj4gQmVzdCByZWdhcmRzLAo+Pgo+IAoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
