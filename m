Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCdEJ5ebjmkODQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Feb 2026 04:33:43 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AACBF132AC9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Feb 2026 04:33:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SapjBHfrg5TCFwnYfA9rU+rSx7LEzvQ4zrKS14UK/Ik=; b=NVqfw5gAJqA2+wMdSK3MV5+AOw
	n4o+lcLXRym6a2hcrw9WjBMUSdw0UK2l88Rmf2yM7fF37oLVZeCb/bmQuaF7bfuCC1x9CCBWp4mHa
	jkk0Wo1nxJVr/7OsduSl7o5BeaKtyY/llthyoaV33sm+Mn72iIlDr/KiDBDdeq76Ckvw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vqjvx-0003OB-OR;
	Fri, 13 Feb 2026 03:33:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jinbaoliu365@gmail.com>) id 1vqjvw-0003O4-HU
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Feb 2026 03:33:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hRNSm0ELAiGBp+45VRCtpDfHkC9S1iTJTrWWolQu/ys=; b=c+DfI5r/CmSCFgutdKZEJRCxtw
 iLpS3OYqGFQERrRgl5BuH0uMxuA+t7UHU3tmAUlEZSHsk/aKT6OR0SvBO7x4hHRQYCWmmiFOwxw5l
 ReEn+fl9IVkDuZf38sPC8crbpLBgjxfTFpb2YF/XcQAYlLjmIpw4cV33kv8k5bCi6JJo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hRNSm0ELAiGBp+45VRCtpDfHkC9S1iTJTrWWolQu/ys=; b=Ajtdtmkdn7EDWtFATPH2yA6oAv
 kRiVpybp53fSZoQwaNJW0/kVJXBEXKDeHVzbwAsskLW6TJBtA2S2Xf/mBD4AxXxuLFgahRbVI2KJ+
 IYkbtRHdZtBgw2COhmsL+SvVByCR/nmCvud75Eg1nfC97N/LP2gogVEexU7CC2AE/ixk=;
Received: from mail-pg1-f174.google.com ([209.85.215.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vqjvw-0000Yt-1X for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Feb 2026 03:33:32 +0000
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-c6e191c4b8fso154646a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Feb 2026 19:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770953601; x=1771558401; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hRNSm0ELAiGBp+45VRCtpDfHkC9S1iTJTrWWolQu/ys=;
 b=YrzIUqMymIkU+n9LmlOYbnOSS7B6FytkiOt0TVeknR5ICe+OswFW8oeH69WUMPVdUN
 oNUc9XID02ixiz2ODK6sVBad2KJAri6BOOIJjLhalWK+aIAL5K5SFd/dmM66/kjlk8WO
 lAW8GOusefvvSyMdbtcwg57J4Ct2dfCfZD8ze9Vt2POdvoDFKgDHHPWRyqvmIkzJ2pId
 srxGVWSH/nzyDRi8Inu2Ec6CzYYn2bpy2ZV5ektC7pJlHos9w08StA6p5JWETAzZqvKm
 JSFne4M79b+Jju9EtVxNJg7JyPGMwU8WlBJLXLtdfa5cwHgEBoDn3eIcgszAutrSAG3v
 dZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770953601; x=1771558401;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hRNSm0ELAiGBp+45VRCtpDfHkC9S1iTJTrWWolQu/ys=;
 b=LrhPapw6Yo/oI4N8TZjVZFhJmHemLcoYisjyD5U8YuGqM5wyXDOIrlvtif2oI3dfMf
 9MFdgOEuyHwOlE7XmZyQGYzgkOMN6Km7tw7q0pHvQQ4x8Oz57Kh27stgQMDPGE7WS74R
 SHsQRL+Y5Z0LILb8zF5f5iczCChRPqEEwDzbdqgzxcA7nxwLXqx5vRoH9K35q3RT8HE8
 4rpzMCFnbSKke6FSwzjV2JFPFSdTHEJG8wNQfKcgpsOYnuR70z3DSL0Ga2t82hcy3pQv
 ugTVEa0OexvyAn4J8juKMx9kCTCZXN8YgtmhxFZ1b2WDk5PoHvFOwZvIy1oiiDJc03s1
 GEdA==
X-Gm-Message-State: AOJu0YwbQjNXhpC+SYGEnhIqZ7L70bYHMjequOUWqfx2eSXCLX9J/PtZ
 Iy8PkvxqXhkNontHjB3+QBWl/tWPQb3vyYzqInbqAz4FYBSiKYvtrSTA
X-Gm-Gg: AZuq6aI4LGk0TcnOiBORMFZcYgYJNbsAev3k5GZ3jKNFnoxey8nGJ0+9lhGAg0HPJeB
 bK6i7n3uyXHXFjbHfA9BtVmIbL2rkLW1rcL+fz60O6j7lGmPPSw2+WFD9325zqz8v0EQMbabaEK
 p+wtruSIuk6/rzJ8sceUcTJJIfrVPMmtaNgprTSBXsA5zSbYXQviwSYG0Qqeps3Tt4i9KQUoEqT
 km0grxyefCKvlNEwkTdT3LkJWva8Zro9OGkNZDXWmZPIFbd7nkwlL3kDMeMDYY5AgKSCxmgcUqR
 ZrBwSTDpQLWTLObd82Bz1st5Ol4XU+0VltlnL9clNYT1A3xh4gFJ8LNOdWy6gx5nGewsSY87uBF
 AKs+Y0CVVJukXJeQBTAYinz+2beB/5hNBbHLuOnrkAm9JuH+W5E8PLYqXf3tc/PkUxPQxyJ7EUQ
 G8bInPTjyJcMay6zZUL9xRZr2ItrhEftckvDtM5yM+2eZCpDpphgU0s12XyEJ+OcdomL8=
X-Received: by 2002:a17:90b:6c4:b0:352:ccae:fe62 with SMTP id
 98e67ed59e1d1-356aabd96b7mr530109a91.10.1770953601321; 
 Thu, 12 Feb 2026 19:33:21 -0800 (PST)
Received: from ?IPV6:2408:8607:1b00:8:8eec:4bff:fe94:a95d?
 ([2408:8607:1b00:8:8eec:4bff:fe94:a95d])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-824c6a62c48sm757158b3a.29.2026.02.12.19.33.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 19:33:20 -0800 (PST)
Message-ID: <66755767-7690-4dce-9f9b-95e371c38fc6@gmail.com>
Date: Fri, 13 Feb 2026 11:33:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <20260107131543.3492385-1-jinbaoliu365@gmail.com>
 <cac0eba2-8555-40c8-ba3d-6b99eb40f2db@kernel.org>
Content-Language: en-US
From: liujinbao <jinbaoliu365@gmail.com>
In-Reply-To: <cac0eba2-8555-40c8-ba3d-6b99eb40f2db@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/1/9 11:52, Chao Yu wrote: > On 1/7/2026 9:15 PM,
 liujinbao1 wrote: >> From: liujinbao1 >> >> During the f2fs_get_victim process,
 when the f2fs_need_rand_seg is >> enabled in select_policy, [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [jinbaoliu365(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [jinbaoliu365(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.174 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vqjvw-0000Yt-1X
Subject: Re: [f2fs-dev] [PATCH] [PATCH] f2fs:Fix incomplete search range in
 f2fs_get_victim when f2fs_need_rand_seg is enabled
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
Cc: liujinbao1 <liujinbao1@xiaomi.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.51 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:liujinbao1@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jinbaoliu365@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jinbaoliu365@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email]
X-Rspamd-Queue-Id: AACBF132AC9
X-Rspamd-Action: no action

Ck9uIDIwMjYvMS85IDExOjUyLCBDaGFvIFl1IHdyb3RlOgo+IE9uIDEvNy8yMDI2IDk6MTUgUE0s
IGxpdWppbmJhbzEgd3JvdGU6Cj4+IEZyb206IGxpdWppbmJhbzEgPGxpdWppbmJhbzFAeGlhb21p
LmNvbT4KPj4KPj4gRHVyaW5nIHRoZSBmMmZzX2dldF92aWN0aW0gcHJvY2Vzcywgd2hlbiB0aGUg
ZjJmc19uZWVkX3JhbmRfc2VnIGlzIAo+PiBlbmFibGVkIGluIHNlbGVjdF9wb2xpY3ksCj4+IHAt
Pm9mZnNldCBpcyBhIHJhbmRvbSB2YWx1ZSwgYW5kIHRoZSBzZWFyY2ggcmFuZ2UgaXMgZnJvbSBw
LT5vZmZzZXQgCj4+IHRvIE1BSU5fU0VDUy4KPj4gV2hlbiBzZWdubyA+PSBsYXN0X3NlZ21lbnQs
IHRoZSBsb29wIGJyZWFrcyBhbmQgZXhpdHMgZGlyZWN0bHkgCj4+IHdpdGhvdXQgc2VhcmNoaW5n
Cj4+IHRoZSByYW5nZSBmcm9tIDAgdG8gcC0+b2Zmc2V0LlRoaXMgcmVzdWx0cyBpbiBhbiBpbmNv
bXBsZXRlIHNlYXJjaCAKPj4gd2hlbiB0aGUgcmFuZG9tCj4+IG9mZnNldCBpcyBub3QgemVyby4K
Pgo+IFdoYXQgYWJvdXQgdXBkYXRpbmcgc20tPmxhc3RfdmljdGltW3AuZ2NfbW9kZV0gYXMgd2Vs
bCB3aGVuIHAtPm9mZnNldCAKPiBpcyBub3QgemVybwo+IGluIHNlbGVjdF9wb2xpY3koKT8KPgo+
IHNlbGVjdF9wb2xpY3koKQo+IC4uLgo+IMKgwqDCoMKgLyogbGV0J3Mgc2VsZWN0IGJlZ2lubmlu
ZyBob3Qvc21hbGwgc3BhY2UgZmlyc3QuICovCj4gwqDCoMKgwqBpZiAoZjJmc19uZWVkX3JhbmRf
c2VnKHNiaSkpIHsKPiDCoMKgwqDCoMKgwqDCoCBwLT5vZmZzZXQgPSBnZXRfcmFuZG9tX3UzMl9i
ZWxvdyhNQUlOX1NFQ1Moc2JpKSAqCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBTRUdTX1BFUl9TRUMoc2JpKSk7Cj4gwqDCoMKgwqDCoMKgwqAgaWYgKHAt
Pm9mZnNldCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNtLT5sYXN0X3ZpY3RpbVtwLmdjX21v
ZGVdID0gcC0+b2Zmc2V0Owo+IMKgwqDCoMKgfQo+Cj4gVGhlbiB3ZSBjYW4gZXhwZWN0IHAtPm9m
ZnNldCBiZWluZyByZXNldCB0byB6ZXJvLCBhbmQgbGFzdF9zZWdtZW50IAo+IGJlaW5nIHJlc2V0
IHRvCj4gc20tPmxhc3RfdmljdGltW3AuZ2NfbW9kZV0gaW4gYmVsb3cgbG9naWM/Cj4KPiDCoMKg
wqDCoMKgwqDCoCBpZiAoc2Vnbm8gPj0gbGFzdF9zZWdtZW50KSB7Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpZiAoc20tPmxhc3RfdmljdGltW3AuZ2NfbW9kZV0pIHsKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgbGFzdF9zZWdtZW50ID0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzbS0+bGFzdF92aWN0aW1bcC5nY19tb2RlXTsKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc20tPmxhc3RfdmljdGltW3AuZ2NfbW9kZV0gPSAwOwo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwLm9mZnNldCA9IDA7Cj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gwqDCoMKgwqDCoMKgwqAgfQo+Cj4gVGhh
bmtzLAo+Clllc++8jHlvdSBhcmUgcmlnaHQsIHRoYW5rcwo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBs
aXVqaW5iYW8xIDxsaXVqaW5iYW8xQHhpYW9taS5jb20+Cj4+IC0tLQo+PiDCoCBmcy9mMmZzL2dj
LmMgfCAxMCArKysrKystLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2djLmMgYi9mcy9mMmZz
L2djLmMKPj4gaW5kZXggMzg0ZmE3ZTIwODViLi4xMDBiOGZjM2U2NWEgMTAwNjQ0Cj4+IC0tLSBh
L2ZzL2YyZnMvZ2MuYwo+PiArKysgYi9mcy9mMmZzL2djLmMKPj4gQEAgLTc4MSw2ICs3ODEsNyBA
QCBpbnQgZjJmc19nZXRfdmljdGltKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgCj4+IHVuc2ln
bmVkIGludCAqcmVzdWx0LAo+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCB2YWxpZF90aHJlc2hf
cmF0aW8gPSAxMDA7Cj4+IMKgwqDCoMKgwqAgYm9vbCBpc19hdGdjOwo+PiDCoMKgwqDCoMKgIGlu
dCByZXQgPSAwOwo+PiArwqDCoMKgIHVuc2lnbmVkIGludCBvcmlnaW5hbF9vZmZzZXQ7Cj4+IMKg
IMKgwqDCoMKgwqAgbXV0ZXhfbG9jaygmZGlydHlfaS0+c2VnbGlzdF9sb2NrKTsKPj4gwqDCoMKg
wqDCoCBsYXN0X3NlZ21lbnQgPSBNQUlOX1NFQ1Moc2JpKSAqIFNFR1NfUEVSX1NFQyhzYmkpOwo+
PiBAQCAtNzk5LDYgKzgwMCw3IEBAIGludCBmMmZzX2dldF92aWN0aW0oc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpLCAKPj4gdW5zaWduZWQgaW50ICpyZXN1bHQsCj4+IMKgwqDCoMKgwqAgcC5taW5f
c2Vnbm8gPSBOVUxMX1NFR05POwo+PiDCoMKgwqDCoMKgIHAub2xkZXN0X2FnZSA9IDA7Cj4+IMKg
wqDCoMKgwqAgcC5taW5fY29zdCA9IGdldF9tYXhfY29zdChzYmksICZwKTsKPj4gK8KgwqDCoCBv
cmlnaW5hbF9vZmZzZXQgPSBwLm9mZnNldDsKPj4gwqAgwqDCoMKgwqDCoCBpc19hdGdjID0gKHAu
Z2NfbW9kZSA9PSBHQ19BVCB8fCBwLmFsbG9jX21vZGUgPT0gQVRfU1NSKTsKPj4gwqDCoMKgwqDC
oCBuc2VhcmNoZWQgPSAwOwo+PiBAQCAtODU5LDExICs4NjEsMTEgQEAgaW50IGYyZnNfZ2V0X3Zp
Y3RpbShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIAo+PiB1bnNpZ25lZCBpbnQgKnJlc3VsdCwK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwLm9mZnNldCAvIHAub2ZzX3Vu
aXQpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgc2Vnbm8gPSB1bml0X25vICogcC5vZnNfdW5pdDsK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChzZWdubyA+PSBsYXN0X3NlZ21lbnQpIHsKPj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHNtLT5sYXN0X3ZpY3RpbVtwLmdjX21vZGVdKSB7Cj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGFzdF9zZWdtZW50ID0KPj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNtLT5sYXN0X3ZpY3RpbVtwLmdjX21v
ZGVdOwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNtLT5sYXN0X3ZpY3RpbVtw
LmdjX21vZGVdID0gMDsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKG9yaWdpbmFsX29m
ZnNldCAhPSAwKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGFzdF9zZWdt
ZW50ID0gb3JpZ2luYWxfb2Zmc2V0Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHAub2Zmc2V0ID0gMDsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
c20tPmxhc3RfdmljdGltW3AuZ2NfbW9kZV0pCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzbS0+bGFzdF92aWN0aW1bcC5nY19tb2RlXSA9IDA7Cj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIH0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
