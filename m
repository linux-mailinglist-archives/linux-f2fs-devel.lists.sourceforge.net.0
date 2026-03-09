Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZiVXMG16rmndFAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 08:44:45 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EFB234F46
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 08:44:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+o2cEIAePiUOAlbRfA8RIDCcyLtxahzXcxJUjTFNh00=; b=V/5GEwp75UTbUi2IGW109f+6xa
	gQGxFG8DtNF0B0w0vj9lGIl6hAVzCFjkEieDtc5nkbHBoJqZE7e4iZM9uE9vzMJtMewkj/OEP8T9t
	fYsAt0LkIHbmrY5jqQNoIjhxDYh+eVb4Q39uvb0fHGh/U9Mipk/o+B0oRterOzZ+J8f8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzVI8-0003vb-Dd;
	Mon, 09 Mar 2026 07:44:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zangyangyang66@gmail.com>) id 1vzVHv-0003vL-JQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 07:44:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2vfnD31glG5gUyOKehjGRafZNeUhI9Hh3l5C6SfOQxo=; b=LKriq17vZyS6110msAOxmH+fhZ
 3CMPtB2s9LYTQCd16kLye1Q8By+3X5Rc90wqgAqbLlltilMAk7EFkppQ1mm1k/jDgMScNxn27RXyR
 ByDMkDEAnhuc6T76/FOwv5P4p3rpCT3eWOy/mjM6zPVndYPj/eHGOAFqDMB5bArobQOg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2vfnD31glG5gUyOKehjGRafZNeUhI9Hh3l5C6SfOQxo=; b=by03HhhtdStXnE8Aq7fDDMmjGw
 w3VPczvZWsl8WibW6MzWyCtiMGcp5EMRn402HpLUXpHa2WrAhRM2lIY+3VUubGjWmhiE5JbYqOK1Y
 NueLmf5t45KrqB6Zx52BilqYn3PdrLwt4hks+pdqCFiXVHdzAmY+m/4Z7NDIXiXB9nGY=;
Received: from mail-pj1-f47.google.com ([209.85.216.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vzVHv-0006FQ-40 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 07:44:27 +0000
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-354a18c48b5so10175322a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 09 Mar 2026 00:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773042256; x=1773647056; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2vfnD31glG5gUyOKehjGRafZNeUhI9Hh3l5C6SfOQxo=;
 b=Li1Bf1h2F7JB0/Wox/GcF+camJYObx0efj9wOoOZpXW+9yHZvAwSCVxPi1b6QWJ6qp
 SmlbNfOAOsUaCYom+LemeB/+E8CzOxrnk+HoPzR6ht+uvP3BNrCmN68FA89L67MMFroW
 08sWuP7n2cecXTecv71TaTfUaUbsqkMM1/1MemzF553j/h9CGIgdn6tjv+JR/Oh8B/zL
 lEyjINnN92xCyAu8Qf18lusEZ/HRLO0CJBKJCcuRrQ7sInq+JJQCn5PHkykbZcZt0qZe
 nwjhL9jJ0Xi1xeBWn3Y/ucT0Od5SEIhfXp7TCen2mFHnjh//xZwQzJc4sx1KX27XshdH
 T4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773042256; x=1773647056;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2vfnD31glG5gUyOKehjGRafZNeUhI9Hh3l5C6SfOQxo=;
 b=BhnxgbpUV7q9tYqyQ2L/Xz8JxPiVXrOorWq/lZvsMDgqOchWk2B1h7+KlkuTgiZEuM
 Li5hQl8log+C0Am1HKnpyOv/ReGMnZTvd6GsjeVADJ58OHUriNhhp4FW/i5GRu4UH4VX
 X3Uixaaz5TCQqxt7291WXh5oFyBIoUf63unxDqWWDbs4FbNuQv/MRtmBq/t/4DbQyRCm
 lYBmFejRJEqMYtPM6/sqZYxS28eY9DW0WD+tVjMpcFIOScPs6TbsSZwxHo4IOcM4A09K
 q3z1PMG95mUERGF4lobJ8lxoJeiZSZoDK0YsnPkeUrWvqdZVj14hu2JrNNaG3I07jZaL
 srEw==
X-Gm-Message-State: AOJu0Yyv8ucv5K4dCA61dQ7WJE54GH46RgHXMSX+E4k7dJvtrnnMQc2p
 SkHiwqRRkqDdXQwdmTlCWtxmfAak8UYdnmFm1tobJXvuEOezN54esk4S
X-Gm-Gg: ATEYQzz6DYoy+rXxPK+/yeseBXhMVaM9sxJHWndlje3E+oWQFTl2g7sxkvtX5kD3TVk
 Uk1hsHy4QWkeEOYBWWgPulWNoHg7GbM8OdjU8keLVCTfHiT2CLCFmOjFjCCbLzJsckMqX6FF7SE
 reUpvEs5yvRVqYFE2w7jbfcTy1qK+CayBVTuBq+kfQNMlobQPBgYq2xwvh6h0mIE8UjenF+KeBl
 L+iReBABswS8yhSujCPH0jbMk+JoXxX0r++/8uBHN3d0F+mNaJHixVSSr2zQFrcj276qjNZveKE
 h5leCBIdKJXn5nbLXecVvLQzDLdbXSHJChbZkbfOIP1E6WbcSzTrVGp8FMW49FZQnPuBkU3fV84
 fE297htxoS0zJy5dmLEjw93E9nbuwoYa2WabIxtGU4+YiH+A0KHwFFCZxuFSiBqa5UI7NPVv0AS
 EgJTWWZxiEhRFZxYk8nyE4yRcpFvrgAKZNYdwvNfK3ffephjZK7WW8duOxLXLzvMORyfZSDg==
X-Received: by 2002:a17:902:f603:b0:2ae:87de:443b with SMTP id
 d9443c01a7336-2ae87de4615mr90546485ad.16.1773042256332; 
 Mon, 09 Mar 2026 00:44:16 -0700 (PDT)
Received: from ?IPV6:2408:8607:1b00:8:5f45:b2cf:a4e8:4614?
 ([2408:8607:1b00:8:5f45:b2cf:a4e8:4614])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae83e584aesm102636495ad.3.2026.03.09.00.44.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 00:44:16 -0700 (PDT)
Message-ID: <43ae8f97-f081-4570-9c17-715edaaec82b@gmail.com>
Date: Mon, 9 Mar 2026 15:44:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org, daehojeong@google.com
References: <20260305070426.1890753-1-zangyangyang1@xiaomi.com>
 <bbd1495d-74d0-4f02-a275-26e244ad21b6@kernel.org>
Content-Language: en-US
From: Yangyang Zang <zangyangyang66@gmail.com>
In-Reply-To: <bbd1495d-74d0-4f02-a275-26e244ad21b6@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2026/3/9 14:45, Chao Yu 写道: > On 3/5/26 15:04, Yangyang
    Zang wrote: >> The number of SSA blocks after segment alignment is inconsistent
    with >> get_newsb(segment_count). This could result in [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [zangyangyang66(at)gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [zangyangyang66(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.216.47 listed in wl.mailspike.net]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vzVHv-0006FQ-40
Subject: Re: [f2fs-dev] [PATCH v2 1/2] resize.f2fs: fix to avoid zeroing
 main area blocks in migrate_ssa()
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
Cc: Yangyang Zang <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: B8EFB234F46
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.91 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:daehojeong@google.com,m:zangyangyang1@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[zangyangyang66@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zangyangyang66@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

CuWcqCAyMDI2LzMvOSAxNDo0NSwgQ2hhbyBZdSDlhpnpgZM6Cj4gT24gMy81LzI2IDE1OjA0LCBZ
YW5neWFuZyBaYW5nIHdyb3RlOgo+PiBUaGUgbnVtYmVyIG9mIFNTQSBibG9ja3MgYWZ0ZXIgc2Vn
bWVudCBhbGlnbm1lbnQgaXMgaW5jb25zaXN0ZW50IHdpdGgKPj4gZ2V0X25ld3NiKHNlZ21lbnRf
Y291bnQpLiBUaGlzIGNvdWxkIHJlc3VsdCBpbiBzb21lIFNTQSBibG9ja3Mgbm90IGJlaW5nCj4+
IHplcm9lZCBvdXQgb3IgbWFpbiBhcmVhIGJsb2NrcyBiZWluZyBpbmNvcnJlY3RseSB6ZXJvZWQg
b3V0IGR1cmluZyBTU0EKPj4gbWlncmF0aW9uLiBaZXJvaW5nIG91dCBtYWluIGFyZWEgYmxvY2tz
IGNhbiBjb3JydXB0IHRoZSByb290IGlub2RlLCBsZWFkaW5nCj4+IHRvIGZpbGUgc3lzdGVtIGNv
cnJ1cHRpb24uCj4gWWFuZ3lhbmcsCj4KPiBDb3VsZCB5b3UgcGxlYXNlIHByb3ZpZGUgdGhlIHRl
c3RjYXNlIGZvciB0aGlzIGlzc3VlPwoKVGhpcyBwcm9ibGVtIG9yaWdpbmF0ZWQgZnJvbSBvdXIg
aW50ZXJuYWwgY29kZSB1cGdyYWRlIHRvIEFuZHJvaWQgWCBiZXRhIDEuCgpBZnRlciB0aGUgdXBn
cmFkZSwgYSBsYXJnZSBudW1iZXIgb2YgcGhvbmVzIGV4cGVyaWVuY2VkIGZpbGUgc3lzdGVtIApj
b3JydXB0aW9uCgphbmQgZmFpbGVkIHRvIGJvb3QuIFRoZSBmaXJzdCBib290IG9mIHRoZSBwaG9u
ZSB3aWxsIHBlcmZvcm0gYSByZXNpemUgCm9wZXJhdGlvbi4KCkFmdGVyIHRoZSByZXNpemUsIHRo
ZSBmaWxlIHN5c3RlbSBiZWNvbWVzIGNvcnJ1cHRlZCwgcHJpbnRpbmcgdGhlIApmb2xsb3dpbmcg
bG9nOgoKW8KgIMKgMTEuNzMxMjc4XVvCoCDCoCBUMV0gRjJGUy1mcyAoc2RhMzUpOiBpbnZhbGlk
IGNyY19vZmZzZXQ6IDAKW8KgIMKgMTEuNzQyNzIyXVvCoCDCoCBUMV0gRjJGUy1mcyAoc2RhMzUp
OiBpbmNvbnNpc3RlbnQgbm9kZSBibG9jaywgCm5vZGVfdHlwZToxLCBuaWQ6Mywgbm9kZV9mb290
ZXJbbmlkOjAsaW5vOjAsb2ZzOjAsY3B2ZXI6MCxibGthZGRyOjBdClvCoCDCoDExLjc0MzAxOV1b
wqAgwqAgVDFdIEYyRlMtZnMgKHNkYTM1KTogRmFpbGVkIHRvIHJlYWQgcm9vdCBpbm9kZQoKSSB3
aWxsIHRyeSB0byBjcmVhdGUgYSB0ZXN0IGNhc2UgbmV4dC4KCj4+IEZpeGVzOiBhZDEzNTdjMzQw
MjMgKCJmMmZzLXRvb2xzOiByZXZlcnQgc3VtbWFyeSBlbnRyeSBjb3VudCBmcm9tIDIwNDggdG8g
NTEyIGluIDE2a2IgYmxvY2sgc3VwcG9ydCIpCj4+IFNpZ25lZC1vZmYtYnk6IFlhbmd5YW5nIFph
bmcgPHphbmd5YW5neWFuZzFAeGlhb21pLmNvbT4KPj4gLS0tCj4+IENoYW5nZXMgaW4gdjI6Cj4+
ICAgLSBNb2RpZnkgdGhlIGNvbW1pdCBtZXNzYWdlCj4+IC0tLQo+PiAgIGZzY2svcmVzaXplLmMg
fCAzOCArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgIDEgZmlsZSBj
aGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdp
dCBhL2ZzY2svcmVzaXplLmMgYi9mc2NrL3Jlc2l6ZS5jCj4+IGluZGV4IGU2NTAyODM3YjIwOS4u
NzlkYjdlZWRlNjVjIDEwMDY0NAo+PiAtLS0gYS9mc2NrL3Jlc2l6ZS5jCj4+ICsrKyBiL2ZzY2sv
cmVzaXplLmMKPj4gQEAgLTI1Nyw0OCArMjU3LDQ4IEBAIHN0YXRpYyB2b2lkIG1pZ3JhdGVfc3Nh
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4gICAJc3RydWN0IGYyZnNfc3VwZXJfYmxvY2sg
KnNiID0gRjJGU19SQVdfU1VQRVIoc2JpKTsKPj4gICAJYmxvY2tfdCBvbGRfc3VtX2Jsa2FkZHIg
PSBnZXRfc2Ioc3NhX2Jsa2FkZHIpOwo+PiAgIAlibG9ja190IG5ld19zdW1fYmxrYWRkciA9IGdl
dF9uZXdzYihzc2FfYmxrYWRkcik7Cj4+IC0JdW5zaWduZWQgaW50IGV4cGFuZF9zZWdubyA9IE1B
SU5fU0VHUyhzYmkpIC0gb2Zmc2V0Owo+PiAtCXVuc2lnbmVkIGludCBuZXdfc2VnX3RvdGFsID0g
Z2V0X25ld3NiKHNlZ21lbnRfY291bnQpOwo+PiAtCWludCBuZXdfc2Vnbm87Cj4+ICsJdW5zaWdu
ZWQgaW50IGV4cGFuZF9zdW1fYmxvY2tzID0gTUFJTl9TRUdTKHNiaSkgLSBvZmZzZXQ7Cj4+ICsJ
dW5zaWduZWQgaW50IG5ld19zdW1fYmxvY2tzID0gZ2V0X25ld3NiKG1haW5fYmxrYWRkcikgLSBu
ZXdfc3VtX2Jsa2FkZHI7Cj4gSUlVQywgdGhlIGNvcmUgY2hhbmdlIGlzIGFib3ZlIGxpbmUsIGFs
bCBvdGhlciBjaGFuZ2VzIGFyZSBjbGVhbnVwLCByaWdodD8KClllcy4KCj4gQ2FuIHdlIHNwbGl0
IHRoZSBmaXggYW5kIGNsZWFudXAgaW50byB0d28gcGF0Y2hlcz8gSSBndWVzcyB0aGF0IHdpbGwg
YmUgYmV0dGVyCj4gZm9yIHJldmlldy4KClllcywgYnV0IEkgdGhpbmsgdGhhdCB3b3VsZCBtYWtl
IHRoZSBmaXJzdCBwYXRjaCBoYXJkZXIgdG8gdW5kZXJzdGFuZC4KClRoZSByZWFzb24gZm9yIHRo
aXMgY2hhbmdlIGlzIHRvIG1ha2UgdGhlIGNvZGUgc2VtYW50aWNzIG1vcmUgcmVhc29uYWJsZS4K
CkkgdGhpbmsgYG5ld19zZWdfdG90YWwgPSBnZXRfbmV3c2IobWFpbl9ibGthZGRyKSAtIG5ld19z
dW1fYmxrYWRkcmAgZG9lcyAKbm90IGNvbmZvcm0gdG8KCnRoZSBvcmlnaW5hbCBzZW1hbnRpY3Mg
b2YgYG5ld19zZWdfdG90YWxgLgoKRXZlbiBpZiBpdCBpcyBjaGFuZ2VkIHRvIGBuZXdfc3VtX2Js
b2NrcyA9IGdldF9uZXdzYihtYWluX2Jsa2FkZHIpIC0gCm5ld19zdW1fYmxrYWRkcmAsCgppdCBp
cyBzdGlsbCBpbmNvbnNpc3RlbnQgd2l0aCB0aGUgc2VtYW50aWNzIG9mIGBleHBhbmRfc2Vnbm9g
IGFuZCAKYG5ld19zZWdub2AuCgo+IEFuZCwgaWYgdGhpcyBpcyBhIGJ1ZyBvbmx5IHdoZW4gcGFj
a2VkX3NzYSBmZWF0dXJlIGlzIG9uLCBkbyB3ZSBuZWVkIHRvIGNoZWNrCj4gcGFja2VkX3NzYSBm
ZWF0dXJlIGJlZm9yZSB1cGRhdGluZyBuZXdfc3VtX2Jsb2Nrcz8KCkkgdGhpbmsgaXQncyB1bm5l
Y2Vzc2FyeS4gVGhpcyBidWcgY2FuIGFsc28gYmUgY2F1c2VkIGJ5IG5vdCBlbmFibGluZyAKdGhl
IHBhY2tlZF9zc2EgZmVhdHVyZS4gQmVjYXVzZQoKYWQxMzU3YzM0MDIzICgiZjJmcy10b29sczog
cmV2ZXJ0IHN1bW1hcnkgZW50cnkgY291bnQgZnJvbSAyMDQ4IHRvIDUxMiAKaW4gMTZrYiBibG9j
ayBzdXBwb3J0IikKCmNoYW5nZWQgdGhlIG9yaWdpbmFsIFNTQSBibG9jayB6ZXJvaW5nIGxvZ2lj
LCBpdCBkb2VzIG5vdCBkaXN0aW5ndWlzaCAKd2hldGhlciB0aGUgcGFja2VkX3NzYQoKZmVhdHVy
ZSBpcyBlbmFibGVkIG9yIG5vdC4KCgpUaGFua3MsCgpZYW5neWFuZwo+IFRoYW5rcywKPgo+PiAr
CWludCBuZXdfc3VtX2Jsa29mZjsKPj4gICAJaW50IHJldCA9IDA7Cj4+ICAgCXZvaWQgKnplcm9f
YmxvY2sgPSBjYWxsb2MoRjJGU19TVU1fQkxLU0laRSwgMSk7Cj4+ICAgCUFTU0VSVCh6ZXJvX2Js
b2NrKTsKPj4gICAKPj4gICAJaWYgKG9mZnNldCAmJiBuZXdfc3VtX2Jsa2FkZHIgPD0gKG9sZF9z
dW1fYmxrYWRkciArCj4+ICAgCQkJCW9mZnNldCAvIFNVTVNfUEVSX0JMT0NLKSkgewo+PiAtCQlu
ZXdfc2Vnbm8gPSAwOwo+PiAtCQl3aGlsZSAobmV3X3NlZ25vIDwgbmV3X3NlZ190b3RhbCkgewo+
PiAtCQkJaWYgKG5ld19zZWdubyA8IGV4cGFuZF9zZWdubykKPj4gLQkJCQltb3ZlX3NzYShzYmks
IG5ld19zYiwgb2Zmc2V0KyssIG5ld19zZWdubyk7Cj4+ICsJCW5ld19zdW1fYmxrb2ZmID0gMDsK
Pj4gKwkJd2hpbGUgKG5ld19zdW1fYmxrb2ZmIDwgbmV3X3N1bV9ibG9ja3MpIHsKPj4gKwkJCWlm
IChuZXdfc3VtX2Jsa29mZiA8IGV4cGFuZF9zdW1fYmxvY2tzKQo+PiArCQkJCW1vdmVfc3NhKHNi
aSwgbmV3X3NiLCBvZmZzZXQrKywgbmV3X3N1bV9ibGtvZmYpOwo+PiAgIAkJCWVsc2UgaWYgKGMu
ZmVhdHVyZSAmIEYyRlNfRkVBVFVSRV9QQUNLRURfU1NBKQo+PiAgIAkJCQlyZXQgPSBkZXZfd3Jp
dGVfNGtfYmxvY2soemVyb19ibG9jaywKPj4gLQkJCQkJR0VUX1NVTV9ORVdfQkxLQUREUihuZXdf
c2IsIG5ld19zZWdubyksCj4+IC0JCQkJCUdFVF9TVU1fTkVXX0JMS09GRihuZXdfc2IsIG5ld19z
ZWdubyksCj4+ICsJCQkJCUdFVF9TVU1fTkVXX0JMS0FERFIobmV3X3NiLCBuZXdfc3VtX2Jsa29m
ZiksCj4+ICsJCQkJCUdFVF9TVU1fTkVXX0JMS09GRihuZXdfc2IsIG5ld19zdW1fYmxrb2ZmKSwK
Pj4gICAJCQkJCVdSSVRFX0xJRkVfTk9ORSk7Cj4+ICAgCQkJZWxzZQo+PiAgIAkJCQlyZXQgPSBk
ZXZfd3JpdGVfYmxvY2soemVyb19ibG9jaywKPj4gLQkJCQkJR0VUX1NVTV9ORVdfQkxLQUREUihu
ZXdfc2IsIG5ld19zZWdubyksCj4+ICsJCQkJCUdFVF9TVU1fTkVXX0JMS0FERFIobmV3X3NiLCBu
ZXdfc3VtX2Jsa29mZiksCj4+ICAgCQkJCQlXUklURV9MSUZFX05PTkUpOwo+PiAgIAkJCUFTU0VS
VChyZXQgPj0gMCk7Cj4+IC0JCQluZXdfc2Vnbm8rKzsKPj4gKwkJCW5ld19zdW1fYmxrb2ZmKys7
Cj4+ICAgCQl9Cj4+ICAgCX0gZWxzZSB7Cj4+IC0JCW5ld19zZWdubyA9IG5ld19zZWdfdG90YWwg
LSAxOwo+PiArCQluZXdfc3VtX2Jsa29mZiA9IG5ld19zdW1fYmxvY2tzIC0gMTsKPj4gICAJCW9m
ZnNldCA9IE1BSU5fU0VHUyhzYmkpIC0gMTsKPj4gLQkJd2hpbGUgKG5ld19zZWdubyA+PSAwKSB7
Cj4+IC0JCQlpZiAobmV3X3NlZ25vIDwgZXhwYW5kX3NlZ25vKQo+PiAtCQkJCW1vdmVfc3NhKHNi
aSwgbmV3X3NiLCBvZmZzZXQtLSwgbmV3X3NlZ25vKTsKPj4gKwkJd2hpbGUgKG5ld19zdW1fYmxr
b2ZmID49IDApIHsKPj4gKwkJCWlmIChuZXdfc3VtX2Jsa29mZiA8IGV4cGFuZF9zdW1fYmxvY2tz
KQo+PiArCQkJCW1vdmVfc3NhKHNiaSwgbmV3X3NiLCBvZmZzZXQtLSwgbmV3X3N1bV9ibGtvZmYp
Owo+PiAgIAkJCWVsc2UgaWYgKGMuZmVhdHVyZSAmIEYyRlNfRkVBVFVSRV9QQUNLRURfU1NBKQo+
PiAgIAkJCQlyZXQgPSBkZXZfd3JpdGVfNGtfYmxvY2soemVyb19ibG9jaywKPj4gLQkJCQkJR0VU
X1NVTV9ORVdfQkxLQUREUihuZXdfc2IsIG5ld19zZWdubyksCj4+IC0JCQkJCUdFVF9TVU1fTkVX
X0JMS09GRihuZXdfc2IsIG5ld19zZWdubyksCj4+ICsJCQkJCUdFVF9TVU1fTkVXX0JMS0FERFIo
bmV3X3NiLCBuZXdfc3VtX2Jsa29mZiksCj4+ICsJCQkJCUdFVF9TVU1fTkVXX0JMS09GRihuZXdf
c2IsIG5ld19zdW1fYmxrb2ZmKSwKPj4gICAJCQkJCVdSSVRFX0xJRkVfTk9ORSk7Cj4+ICAgCQkJ
ZWxzZQo+PiAgIAkJCQlyZXQgPSBkZXZfd3JpdGVfYmxvY2soemVyb19ibG9jaywKPj4gLQkJCQkJ
R0VUX1NVTV9ORVdfQkxLQUREUihuZXdfc2IsIG5ld19zZWdubyksCj4+ICsJCQkJCUdFVF9TVU1f
TkVXX0JMS0FERFIobmV3X3NiLCBuZXdfc3VtX2Jsa29mZiksCj4+ICAgCQkJCQlXUklURV9MSUZF
X05PTkUpOwo+PiAgIAkJCUFTU0VSVChyZXQgPj0gMCk7Cj4+IC0JCQluZXdfc2Vnbm8tLTsKPj4g
KwkJCW5ld19zdW1fYmxrb2ZmLS07Cj4+ICAgCQl9Cj4+ICAgCX0KPj4gICAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
