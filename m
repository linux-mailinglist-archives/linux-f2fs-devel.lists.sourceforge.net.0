Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +0wzDif2K2qKIgQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2026 14:05:59 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 795F46793CF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2026 14:05:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=l7LGcy31;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b="jAt/y3I6";
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=RUtmAdoQ;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=YD4m2evx;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpmKLUvVuAzT9UBF4WEiQZYI25bASnhPAydqCW6CIsM=; b=l7LGcy319EH9FpPQVZAYx2l5P1
	bJYtFZuHZg6KLfuFYFrg73/GAgkZE+VB+O1+5jfxOvYF1jTkZ+adZOp0MZKyxmg4VXNSw4mDCLEhq
	rgejdNm0Eaac3NH1fgad2CZsFQW9sx2mIC27yDoo96Y0XSSr+zU3RTx5/xjnXQJgVTpY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wY0e0-0004qC-V7;
	Fri, 12 Jun 2026 12:05:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wY0dn-0004p5-OR
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jun 2026 12:05:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dejibYrzWrGiquT95ZjEYZZsNCdXzyS//Zog7ohkdnQ=; b=jAt/y3I6Au9cGVcqz9Soq6q5q4
 8W1Wu/DFD3wo0J35l2GUk+xkN+Fnr7udO+NKeJtG7v+NY1t0qZNp8YMGIfi3UbP0niw0nViXq8nYv
 d1oDXZt1Qb6Y5FJBWwIy68Kg+jkVTfcNuY2GbDXaN868I7psCTM3UVEnpRwBQ8de60gA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dejibYrzWrGiquT95ZjEYZZsNCdXzyS//Zog7ohkdnQ=; b=RUtmAdoQQgtvgDPpPehhZHiHLa
 2Pdg+VHaJ14g3DuxTURAmMB3COr67PC2IN+FMipYEJo+v7WlNIwOYRh5n2aCEGucXHsXy0xpmknd+
 slqJRx43PSFnKY/21b4fPO1lB+0e/Q7n6W1Ffl+GmJffTybep6wzVV4xY+/A9ze4KJb4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wY0dn-0002Ck-Gk for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jun 2026 12:05:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 56CF6600AF;
 Fri, 12 Jun 2026 12:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D491C1F000E9;
 Fri, 12 Jun 2026 12:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781265929;
 bh=dejibYrzWrGiquT95ZjEYZZsNCdXzyS//Zog7ohkdnQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=YD4m2evxZcsLMUOTkbef+vlcbaTbHWd6alqFBTo+FEQQXtpPSrLstsEmgf/IYKpHG
 CeO6h03+/e0INi3LAZDsCUftX0TFPLHA6ZPBsJdzLMvhMx4Wae0YXKfkBRheD6+wGw
 wU+ALLAwZ4BjRMfNRTBamMSBWY2erG2ye47tFYSZ7xhNBQqRpS3oihf6urHmWpeM5V
 BBZmVCjRC+J9gCTQv2RyRWC7vrIaJqB0SYjLjuYV1DJSeixAsOCr80jJ0oiNX7H2iR
 Xp0AtpYxSDf5Uq74GsrlmpNK67CjO76sa6J4IW80FRi8/YVeS0NmNF8sESAyo0Nffg
 VcwTWV0LQsifA==
Message-ID: <acf21183-0505-401e-9a1c-dd91ff147b63@kernel.org>
Date: Fri, 12 Jun 2026 20:05:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bart Van Assche <bvanassche@acm.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <cover.1780003055.git.bvanassche@acm.org>
 <0e18152026cacd1e61fb5fb5483fc1d3c57bdc51.1780003055.git.bvanassche@acm.org>
 <a3431eb2-6224-401b-9aec-1c0abf840143@kernel.org>
 <7d8cd85c-2aa7-48fd-89af-39adabc89d97@acm.org>
Content-Language: en-US
In-Reply-To: <7d8cd85c-2aa7-48fd-89af-39adabc89d97@acm.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/11/26 02:27, Bart Van Assche wrote: > On 6/10/26 5:14
 AM, Chao Yu wrote: >> On 5/29/26 05:20, Bart Van Assche wrote: >>> + /* >>>
 + * SZ_16K restricts the time spent on completing writes to about [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wY0dn-0002Ck-Gk
Subject: Re: [f2fs-dev] [PATCH 4/4] f2fs: Run f2fs_write_end_io()
 asynchronously
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bvanassche@acm.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
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
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 795F46793CF

T24gNi8xMS8yNiAwMjoyNywgQmFydCBWYW4gQXNzY2hlIHdyb3RlOgo+IE9uIDYvMTAvMjYgNTox
NCBBTSwgQ2hhbyBZdSB3cm90ZToKPj4gT24gNS8yOS8yNiAwNToyMCwgQmFydCBWYW4gQXNzY2hl
IHdyb3RlOgo+Pj4gK8KgwqDCoCAvKgo+Pj4gK8KgwqDCoMKgICogU1pfMTZLIHJlc3RyaWN0cyB0
aGUgdGltZSBzcGVudCBvbiBjb21wbGV0aW5nIHdyaXRlcyB0byBhYm91dCAxNTAKPj4+ICvCoMKg
wqDCoCAqIG1pY3Jvc2Vjb25kcyBvbiBhbiBBcm0gQ29ydGV4LUE1MjAgY29yZS4KPj4+ICvCoMKg
wqDCoCAqLwo+Pj4gK8KgwqDCoCBzYmktPm1heF9hdGNfd3JpdGVfYmlvX3NpemUgPSBTWl8xNks7
Cj4+Cj4+IEFjdHVhbGx5LCBJIGRvbid0IHNlZSB0aGlzIHByb2JsZW0gYmVmb3JlLCBjYW4gd2Ug
ZGlzYWJsZSB0aGlzIGJ5IGRlZmF1bHQsIGFuZAo+PiBvbmx5IGVuYWJsZSBmb3IgeW91ciBjYXNl
IHZpYSBzeXNmcz8KPiAKPiBUaGUgbmV3IGJlaGF2aW9yIHNob3VsZCBiZSB0aGUgZGVmYXVsdCBi
ZWNhdXNlIGludGVycnVwdCBoYW5kbGVycyBzaG91bGQKPiBjb21wbGV0ZSBxdWlja2x5Lgo+IAo+
IEYyRlMgaXMgcHJpbWFyaWx5IHVzZWQgb24gQW5kcm9pZCBzeXN0ZW1zLiBPbiBhbiBBbmRyb2lk
IHN5c3RlbSBzcGVuZGluZwo+IHRvbyBtdWNoIHRpbWUgaW4gaW50ZXJydXB0IGNvbnRleHQgY2Fu
IGhhdmUgdGhlIGZvbGxvd2luZyBjb25zZXF1ZW5jZXM6Cj4gKiBVc2VyIGludGVyZmFjZSBzdHV0
dGVyaW5nIGFuZCBmcmFtZSBkcm9wcyAoamFuaykuCj4gKiBBdWRpbyBnbGl0Y2hlcy4KPiAqIEFw
cGxpY2F0aW9uIG5vdCByZXNwb25kaW5nIChBTlIpLgo+ICogQ29ubmVjdGl2aXR5IGRlZ3JhZGF0
aW9uLiBJbnRlcmZhY2VzIGxpa2UgV2ktRmkgYW5kIEJsdWV0b290aCBkZXBlbmQKPiAgwqAgb24g
ZmFzdCBpbnRlcnJ1cHQgaGFuZGxpbmcuCgpCYXJ0LAoKWWVzLCBhZ3JlZWQsIGFuZCBJIGNhbiB1
bmRlcnN0YW5kIHRoYXQuCgpBY3R1YWxseSwgSSdtIHdvcnJ5IGFib3V0IHdoZXRoZXIgdGhlcmUg
aXMgcG90ZW50aWFsIHBlcmZvcm1hbmNlIHJlZ3Jlc3Npb24KY2F1c2VkIGJ5IGVuYWJsaW5nIHRo
aXMgYnkgZGVmYXVsdCwgYWxzbyBhIGxpdHRsZSBiaXQgY29uY2VybiBhYm91dCB0aGUgYWZmZWN0
aW9uCmZvciBQQ3xsYXB0b3Agc2NlbmFyaW8gd2hpY2ggaXMgdXNlZCBieSBpbmRpdmlkdWFsIHVz
ZXIuCgpPbmUgZXhhbXBsZSBpcyBjb21taXQgOTFiNTg3YmE3OWUxICgiZjJmczogSW50cm9kdWNl
IGxpbmVhciBzZWFyY2ggZm9yIGRlbnRyaWVzIiksCmxvdHMgb2YgZm9sbG93aW5nIGV4dHJhIHdv
cmtzIHdlcmUgZG9uZSB0byBmaXggdGhlIHBlcmZvcm1hbmNlIHJlZ3Jlc3Npb24gaXNzdWUgaXQK
Y2F1c2VkLgoKV2hhdCBkbyB5b3UgdGhpbmsgb2Ygc2VwYXJhdGluZyBmdW5jdGlvbmFsaXR5IHBh
dGNoZXMgYW5kIGVuYWJsaW5nIGJ5IGRlZmF1bHQgcGF0aD8KSSB0aGluayB3ZSBjYW4gYXBwbHkg
ZnVuY3Rpb25hbGl0eSBwYXRjaGVzIGZpcnN0LgoKVGhhbmtzLAoKPiAKPj4+ICvCoMKgwqAgQVRU
Ul9MSVNUKG1heF9hdGNfd3JpdGVfYmlvX3NpemUpLAo+Pgo+PiBXZSBuZWVkIHRvIHVwZGF0ZSBE
b2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWZzLWYyZnMgYXMgd2VsbC4KPiAKPiBXaWxs
IGRvLgo+IAo+IFRoYW5rcywKPiAKPiBCYXJ0LgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
