Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJ3dJlZ+uWmxHAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Mar 2026 17:16:22 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B60922ADC3F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Mar 2026 17:16:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6IUgyhiYsWgbi3hwLCZ+IYvXfPx2I04C4weSN989ZQs=; b=TVyzwGBVM0H+6ZqWtXWC+ZrErT
	iiTbxoiaZ2hz6LgmVNCzMRPWEjvet/g5kZljgPIOG8Vdnt3Pnhq6H//xSbjXtVlVRVG1Ra5HRsaDb
	5tJyZpblRSpzUcxAb9oF/V7+IpRH/a8WdhQQJ90cfG+BKBd9hRdQXg/q81ykSjj/dxWo=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w2X5W-0000Y6-CH;
	Tue, 17 Mar 2026 16:16:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1w2X5U-0000Xy-Nv
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Mar 2026 16:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AR9kW3QbdohaBY4ze/UrL6stEjh4bZsfksLMqIHC/vQ=; b=MANq2mXHIjGZ8l9YwWtsZDw+gj
 N226ji3b7rSgf5Q55GLxpV1BwJc4ayOBG11lVITN1Hfk+kFg3pD5JJB2oVvPUOsblzZgZPfIvQd/O
 v8SRsW0dZaZMxcXF+7dU3LjV+4yvdHIeFuyI3vYDPEiBMdfb9HWTJUsGbjJ/UwOJsPuo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AR9kW3QbdohaBY4ze/UrL6stEjh4bZsfksLMqIHC/vQ=; b=ErO53+1R5sPZTR8O11FDHPFHgt
 QgXf+m0S+B0Po6V1V4p0QjhtVmpcpM4tCRgDvlyQ9qVYGXSfSi3QyY4NKIDPT4Usuc/DylLIKRNfN
 BCRh8L1Ulg+FvvMR6VpLQ3F4Ku/i+qAeShTimcdeCaAoThuwbwqqQ7qjE+la4VCZrxGs=;
Received: from mail-vs1-f47.google.com ([209.85.217.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w2X5U-00007b-6t for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Mar 2026 16:16:08 +0000
Received: by mail-vs1-f47.google.com with SMTP id
 ada2fe7eead31-5ffc879c1aeso3736964137.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Mar 2026 09:16:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773764162; cv=none;
 d=google.com; s=arc-20240605;
 b=C6Wm9JfMdNDb1Oc2p5xTS5JY7SdxkeLZajAxOevbJHMtVpdtPbR5Ei8SZotOUih2A7
 YH+iUeE28QiefdyhLF+quGPk3WEJoklY1bijCio4k0opfLCH4QuMFEKikES5VsTpbhPL
 u9fHmqll9dyuq0voIU8mBjovTHNlf5wVc004Q6c2XS6axTGAcOzkOC0GTtYlOew00tj3
 SGkqNE9Va1MfXByWV6/ZrLV21fEZB2XiorgUlqCJzTjJj7CFS/AXpwBvMl9zpR48v+M1
 /U51ZCHCm/P5D6kfyhZk+Dc8cfNn0OuobdlDFjGjbZ0MnHwYXmGwVkj7KjEwgg8fD/S6
 ZqJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=AR9kW3QbdohaBY4ze/UrL6stEjh4bZsfksLMqIHC/vQ=;
 fh=/19vVKN+tUr5B7RbPsAdEqefXxAAw50ApslSHeBYQmg=;
 b=QYumIGGfpipERh42LnusNnQw55onoIYevJbl7LPhH8eeYJdMA2zARAMKElBqZwIoGB
 /wG3ymDK1LH5KnbRZEuSRyjVKV3pQ1sORZPhA8kg/hQIx7wJEgVwsCXVcNmPFsCeWvZg
 aFQ2o5+jpZxhtLXkB3boRVm6YEFxErrxP8vJjI98UYvpA9277+1XiJXpIHee28jukes6
 +E8ZvmviATL8RxqukHPmj+sslPo/O2QdlkLoZLJ0BSdQhOzc7yerKALlee2SONf9WXxU
 Vi1CKG0uA3HCsBcxQS+ZfLTA339lYDs9b1JJFGMQBuGxcwpx58sDVOUEtUA195RMIsjD
 4TcA==; darn=lists.sourceforge.net
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773764162; x=1774368962; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AR9kW3QbdohaBY4ze/UrL6stEjh4bZsfksLMqIHC/vQ=;
 b=OdSBiqipVCREOZnOf84FIe3hKB/MrPWz+VpThNktuEtBO6LRzD0oxfKMH1FqxN6o4s
 NH82HeDe5E/cojecuk07KIs2Cb9BT61LgQeOob1JvABtzUKi3uvbEH6m4enRSkERCJxr
 ozquGDirUOTRxBxrf7kK8WIzpzj8EktxQ9llvu5x1lTqJh1OE/4F72rNRHHzpCW9DwS9
 u4d9gQndC/o7Ujo+BgIiHdh8qvN1ni9uZyMi0WWihSEKn4lmyWr3JMJqLKFkjP7O+ven
 gXxnfkdpFdcjiap4eTIWWVJZcsEDzIm+WeTYDbUlAEeAysdhcVldDf5WobFf/W2JtHVh
 mQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773764162; x=1774368962;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AR9kW3QbdohaBY4ze/UrL6stEjh4bZsfksLMqIHC/vQ=;
 b=f7He2w4eIsoBqyrtYZgZp7/eOuz6ail8rTpqEg3PXVDbR4Ycz9LhPOpzpWL56qjW+Q
 z8fbdkck3puIqD7at6fol9IetVuXbHramU3Osx6EU5WKNwG7xw5E+1jGFfm+6w6Wjplm
 xsmaP9321VGvKAlIOmXAiNklJcHPzJMLlf4Gl8OpgOaEEkrUmk14NF/jImcs30GsRwSw
 +zDibl/vGYLdDOlpamw3KngyIfGwauVs8B1aU6iHWf9KSYn5ZyK9bTft4HtJ4fnx5UJt
 qf9u1IF4SPMSzsSPahSpxb/TgfgFQBB6OrlElBLQ7DwZxWq7WAXM44fVfMNWzy9wLkcH
 B7cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVQstWi7xziEHmmFQUk8v5/zosRHQcmZ2o7pM5akbPXukulgYDbg/Xj7PpSLdJZdxlwDfUtxFC5sjAkhtZAda2@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzSnwizvivIyc1AU4DZxJPPBE+hengbJVX+hhEviICA/YsDhhoJ
 lcHVouF+piqhyIrlhDBEd83dfnsk5foxtiIuPWDwue4JvYdV2+qTSJ4kTsEdmBo8uxKyMUTw07x
 inW7m3oh8IrAFnVmYqpjwFPl/sjL3ftH1VCeY
X-Gm-Gg: ATEYQzycdXAEaEa88XgukbYixS/cpeAuIdYlTbIfM+BoI1U/WUL5VvCR06hilS9zT+R
 bMc/AFHdvcRRrUzcgLD12xZIFr5kx4GhYUphHR8yNCKijNCa2sxYdU4SkIYDllnyNlMMIqNa4ky
 N8H7mHctzjQ3xILKpNt97IS68s2HvgzX8F7XhFTDwhXagnSd9Rv9h8Q3jAJutRazPL80aHcxqLp
 iN+SYzvjA9+yupqauZIDFUZ9u4eWEnojVIcObGpQuPPwFX6RHeCj6OWzAcb79KSh1rXqvYqiIvF
 /N5iPBNAiaYSiRfOlOiD+zML0ZdsXI+g9zqxVRVEs44vY66zygCx4XSU32cClaoE6BDkFA==
X-Received: by 2002:a05:6102:b0e:b0:5ff:b684:f7c5 with SMTP id
 ada2fe7eead31-6027d0b0e91mr197115137.8.1773764162157; Tue, 17 Mar 2026
 09:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260316185954.2185806-1-daeho43@gmail.com>
 <db5de842-0833-4041-9263-2496da738567@kernel.org>
In-Reply-To: <db5de842-0833-4041-9263-2496da738567@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 17 Mar 2026 09:15:48 -0700
X-Gm-Features: AaiRm513oUvJh0413Aj_Rd_D5BBd1u3AbTRwROslfcYO14D2lP0Re3iuVIcbziU
Message-ID: <CACOAw_xXUqdrYt10PBJPj7JofHCkRobevnDhwW80puDnXiTW4Q@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Mar 16,
 2026 at 6:56 PM Chao Yu wrote: > > On 2026/3/17
 02:59, Daeho Jeong wrote: > > From: Daeho Jeong > > > > Suspend can fail
 if kernel threads do not freeze for a while. > > f2fs_gc an [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 ARC_SIGNED             Message has a ARC signature
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.47 listed in wl.mailspike.net]
X-Headers-End: 1w2X5U-00007b-6t
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix to freeze GC and discard
 threads quickly
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:daehojeong@google.com,m:kernel-team@android.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: B60922ADC3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgNjo1NuKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI2LzMvMTcgMDI6NTksIERhZWhvIEplb25nIHdyb3RlOgo+ID4g
RnJvbTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+Cj4gPiBTdXNwZW5k
IGNhbiBmYWlsIGlmIGtlcm5lbCB0aHJlYWRzIGRvIG5vdCBmcmVlemUgZm9yIGEgd2hpbGUuCj4g
PiBmMmZzX2djIGFuZCBmMmZzX2Rpc2NhcmQgdGhyZWFkcyBjYW4gcGVyZm9ybSBsb25nLXJ1bm5p
bmcgb3BlcmF0aW9ucwo+ID4gdGhhdCBwcmV2ZW50IHRoZW0gZnJvbSByZWFjaGluZyBhIGZyZWV6
ZSBwb2ludCBpbiBhIHRpbWVseSBtYW5uZXIuCj4gPgo+ID4gVGhpcyBwYXRjaCBhZGRzIGV4cGxp
Y2l0IGZyZWV6aW5nIGNoZWNrcyBpbiB0aGUgZm9sbG93aW5nIGxvY2F0aW9uczoKPiA+IDEuIGYy
ZnNfZ2M6IEFkZGVkIGEgY2hlY2sgYXQgdGhlICdyZXRyeScgbGFiZWwgdG8gZXhpdCB0aGUgbG9v
cCBxdWlja2x5Cj4gPiAgICAgaWYgZnJlZXppbmcgaXMgcmVxdWVzdGVkLCBlc3BlY2lhbGx5IGR1
cmluZyBoZWF2eSBHQyByb3VuZHMuCj4gPiAyLiBfX2lzc3VlX2Rpc2NhcmRfY21kOiBBZGRlZCBh
ICdzdXNwZW5kZWQnIGZsYWcgdG8gYnJlYWsgYm90aCBpbm5lciBhbmQKPiA+ICAgICBvdXRlciBs
b29wcyBkdXJpbmcgZGlzY2FyZCBjb21tYW5kIGlzc3VhbmNlIGlmIGZyZWV6aW5nIGlzIGRldGVj
dGVkCj4gPiAgICAgYWZ0ZXIgYXQgbGVhc3Qgb25lIGNvbW1hbmQgaGFzIGJlZW4gaXNzdWVkLgo+
ID4gMy4gX19pc3N1ZV9kaXNjYXJkX2NtZF9vcmRlcmx5OiBBZGRlZCBhIHNpbWlsYXIgY2hlY2sg
Zm9yIG9yZGVybHkgZGlzY2FyZAo+ID4gICAgIHRvIGVuc3VyZSByZXNwb25zaXZlbmVzcy4KPiA+
Cj4gPiBUaGVzZSBjaGVja3MgZW5zdXJlIHRoYXQgdGhlIHRocmVhZHMgcmVsZWFzZSBsb2NrcyBz
YWZlbHkgYW5kIGVudGVyIHRoZQo+ID4gZnJvemVuIHN0YXRlLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPiAtLS0KPiA+IHYzOiBy
ZW1vdmVkIHVubmVjZXNzYXJ5IHN1c3BlbmRlZCBjaGVjawo+ID4gdjI6IGFkZCBmcmVlemluZyBj
aGVjayBpbiBkb19nYXJiYWdlX2NvbGxlY3QoKQo+ID4gLS0tCj4gPiAgIGZzL2YyZnMvZ2MuYyAg
ICAgIHwgMTAgKysrKysrKysrKwo+ID4gICBmcy9mMmZzL3NlZ21lbnQuYyB8IDEyICsrKysrKysr
KysrLQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9nYy5jIGIvZnMvZjJmcy9nYy5jCj4gPiBp
bmRleCAyNDY0OTZmYmU1ZTUuLjIzMDVmMTZjYmFiYiAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMv
Z2MuYwo+ID4gKysrIGIvZnMvZjJmcy9nYy5jCj4gPiBAQCAtMTg4OSwxMiArMTg4OSwxOCBAQCBz
dGF0aWMgaW50IGRvX2dhcmJhZ2VfY29sbGVjdChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzYmktPm5leHRfdmljdGltX3NlZ1tnY190
eXBlXSA9Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChjdXJfc2Vn
bm8gKyAxIDwgc2VjX2VuZF9zZWdubykgPwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjdXJfc2Vnbm8gKyAxIDogTlVMTF9TRUdOTzsKPiA+ICsKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICBpZiAodW5saWtlbHkoZnJlZXppbmcoY3VycmVudCkpKSB7Cj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBmb2xpb19wdXRfcmVmcyhzdW1fZm9saW8sIDIpOwo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBzdG9wOwo+Cj4gRG8gd2UgbmVl
ZCB0byByZXR1cm4gRUJVU1kgb3Igc29tZXRoaW5nIGxpa2UgdGhhdCB0byBpbmRpY2F0ZSBHQyB3
YXMKPiBpbnRlcnJ1cHRlZD8KCkluIHRoZSBjYXNlIG9mIGRvX2dhcmJhZ2VfY29sbGVjdCgpLCBp
dCBpcyBvcmlnaW5hbGx5IGRlc2lnbmVkIHRvIHN0b3AgYmVmb3JlCmNsZWFuaW5nIHRoZSBlbnRp
cmUgc2VjdGlvbiBkZXBlbmRpbmcgb24gdGhlIG1pZ3JhdGlvbl93aW5kb3cgc2l6ZSBvcgp6b25l
ZCBHQyBvcGVyYXRpb25zLCBhbmQgaXQgcmV0dXJucyB0aGUgY291bnQgb2Ygc2VnbWVudHMgcmVj
bGFpbWVkIHVudGlsCnRoYXQgcG9pbnQuIFRoZXJlZm9yZSwgcmV0dXJuaW5nIHRoZSBzZWdtZW50
IGNvdW50IHJlY2xhaW1lZCB1cCB0byB0aGUKbW9tZW50IG9mIHN1c3BlbnNpb24gc2VlbXMgbW9y
ZSBjb25zaXN0ZW50IHdpdGggdGhlIGV4aXN0aW5nIGJlaGF2aW9yLgpJZiB3ZSByZXR1cm4gYW4g
ZXJyb3IgaW5zdGVhZCwgdGhlIGNhbGxlciBtaWdodCBtaXNzIHRoZSBjb3VudCBvZiBzZWdtZW50
cwp0aGF0IHdlcmUgYWN0dWFsbHkgcmVjbGFpbWVkLgoKPgo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIH0KPiA+ICAgICAgICAgICAgICAgfQo+ID4gICBuZXh0X2Jsb2NrOgo+ID4gICAgICAgICAg
ICAgICBmb2xpb19wdXRfcmVmcyhzdW1fZm9saW8sIDIpOwo+ID4gICAgICAgICAgICAgICBzZWdu
byA9IGJsb2NrX2VuZF9zZWdubzsKPiA+ICAgICAgIH0KPiA+Cj4gPiArc3RvcDoKPiA+ICAgICAg
IGlmIChzdWJtaXR0ZWQpCj4gPiAgICAgICAgICAgICAgIGYyZnNfc3VibWl0X21lcmdlZF93cml0
ZShzYmksIGRhdGFfdHlwZSk7Cj4gPgo+ID4gQEAgLTE5NjgsNiArMTk3NCwxMCBAQCBpbnQgZjJm
c19nYyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBmMmZzX2djX2NvbnRyb2wgKmdj
X2NvbnRyb2wpCj4gPiAgICAgICAgICAgICAgIGdvdG8gc3RvcDsKPiA+ICAgICAgIH0KPiA+ICAg
cmV0cnk6Cj4gPiArICAgICBpZiAodW5saWtlbHkoZnJlZXppbmcoY3VycmVudCkpKSB7Cj4gPiAr
ICAgICAgICAgICAgIHJldCA9IDA7Cj4KPiBEaXR0by4KCkZvciBmMmZzX2djKCksIGlmIHdlIHJl
dHVybiAtRUJVU1ksIHRoZSBjYWxsZXIgbWlnaHQgcGVyY2VpdmUgaXQgYXMgYQpzaXR1YXRpb24g
d2hlcmUgbm8gbW9yZSB2aWN0aW1zCmNhbiBiZSBzZWxlY3RlZC4gVGhpcyBjb3VsZCBsZWFkIHRv
IGFuIGlzc3VlIHdoZXJlIHRoZSBpZGxlIHRpbWUgaXMKaW5jb3JyZWN0bHkgZXh0ZW5kZWQgdW5k
ZXIgdGhlCiJubyBHQyIgY29uZGl0aW9uLgoKPgo+IFRoYW5rcywKPgo+ID4gKyAgICAgICAgICAg
ICBnb3RvIHN0b3A7Cj4gPiArICAgICB9Cj4gPiAgICAgICByZXQgPSBfX2dldF92aWN0aW0oc2Jp
LCAmc2Vnbm8sIGdjX3R5cGUsIGdjX2NvbnRyb2wtPm9uZV90aW1lKTsKPiA+ICAgICAgIGlmIChy
ZXQpIHsKPiA+ICAgICAgICAgICAgICAgLyogYWxsb3cgdG8gc2VhcmNoIHZpY3RpbSBmcm9tIHNl
Y3Rpb25zIGhhcyBwaW5uZWQgZGF0YSAqLwo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVu
dC5jIGIvZnMvZjJmcy9zZWdtZW50LmMKPiA+IGluZGV4IGU5YjZkNzc0Yjk4NS4uMGM0ZmI0Mjcw
MTg1IDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJmcy9zZWdtZW50LmMKPiA+ICsrKyBiL2ZzL2YyZnMv
c2VnbWVudC5jCj4gPiBAQCAtMTYwNiw2ICsxNjA2LDkgQEAgc3RhdGljIHZvaWQgX19pc3N1ZV9k
aXNjYXJkX2NtZF9vcmRlcmx5KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+ICAgICAgICAg
ICAgICAgaWYgKGRjLT5zdGF0ZSAhPSBEX1BSRVApCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
Z290byBuZXh0Owo+ID4KPiA+ICsgICAgICAgICAgICAgaWYgKCppc3N1ZWQgPiAwICYmIHVubGlr
ZWx5KGZyZWV6aW5nKGN1cnJlbnQpKSkKPiA+ICsgICAgICAgICAgICAgICAgICAgICBicmVhazsK
PiA+ICsKPiA+ICAgICAgICAgICAgICAgaWYgKGRwb2xpY3ktPmlvX2F3YXJlICYmICFpc19pZGxl
KHNiaSwgRElTQ0FSRF9USU1FKSkgewo+ID4gICAgICAgICAgICAgICAgICAgICAgIGlvX2ludGVy
cnVwdGVkID0gdHJ1ZTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+IEBAIC0x
NjQ1LDYgKzE2NDgsNyBAQCBzdGF0aWMgaW50IF9faXNzdWVfZGlzY2FyZF9jbWQoc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpLAo+ID4gICAgICAgc3RydWN0IGJsa19wbHVnIHBsdWc7Cj4gPiAgICAg
ICBpbnQgaSwgaXNzdWVkOwo+ID4gICAgICAgYm9vbCBpb19pbnRlcnJ1cHRlZCA9IGZhbHNlOwo+
ID4gKyAgICAgYm9vbCBzdXNwZW5kZWQgPSBmYWxzZTsKPiA+Cj4gPiAgICAgICBpZiAoZHBvbGlj
eS0+dGltZW91dCkKPiA+ICAgICAgICAgICAgICAgZjJmc191cGRhdGVfdGltZShzYmksIFVNT1VO
VF9ESVNDQVJEX1RJTUVPVVQpOwo+ID4gQEAgLTE2NzUsNiArMTY3OSwxMSBAQCBzdGF0aWMgaW50
IF9faXNzdWVfZGlzY2FyZF9jbWQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4gICAgICAg
ICAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoZGMsIHRtcCwgcGVuZF9saXN0LCBsaXN0
KSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgZjJmc19idWdfb24oc2JpLCBkYy0+c3RhdGUg
IT0gRF9QUkVQKTsKPiA+Cj4gPiArICAgICAgICAgICAgICAgICAgICAgaWYgKGlzc3VlZCA+IDAg
JiYgdW5saWtlbHkoZnJlZXppbmcoY3VycmVudCkpKSB7Cj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdXNwZW5kZWQgPSB0cnVlOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgYnJlYWs7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgfQo+ID4gKwo+ID4gICAgICAg
ICAgICAgICAgICAgICAgIGlmIChkcG9saWN5LT50aW1lb3V0ICYmCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBmMmZzX3RpbWVfb3ZlcihzYmksIFVNT1VOVF9ESVNDQVJEX1RJTUVP
VVQpKQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiBAQCAtMTY5
NCw3ICsxNzAzLDggQEAgc3RhdGljIGludCBfX2lzc3VlX2Rpc2NhcmRfY21kKHN0cnVjdCBmMmZz
X3NiX2luZm8gKnNiaSwKPiA+ICAgbmV4dDoKPiA+ICAgICAgICAgICAgICAgbXV0ZXhfdW5sb2Nr
KCZkY2MtPmNtZF9sb2NrKTsKPiA+Cj4gPiAtICAgICAgICAgICAgIGlmIChpc3N1ZWQgPj0gZHBv
bGljeS0+bWF4X3JlcXVlc3RzIHx8IGlvX2ludGVycnVwdGVkKQo+ID4gKyAgICAgICAgICAgICBp
ZiAoaXNzdWVkID49IGRwb2xpY3ktPm1heF9yZXF1ZXN0cyB8fCBpb19pbnRlcnJ1cHRlZCB8fAo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdXNwZW5kZWQpCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiAgICAgICB9Cj4gPgo+CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
