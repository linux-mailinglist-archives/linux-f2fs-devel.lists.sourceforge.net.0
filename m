Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDBTCjzx9WmVQgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 02 May 2026 14:42:36 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7784B1F64
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 02 May 2026 14:42:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y3E7JfW2L/4Vx8JIJvXCYvgnp8Sl3eaphex5SXRQZjo=; b=Di7S/GKCRF+jLBRGiku6WpuPv4
	l7sXjGy7pPDOq9jPZfLPhP+lmEuHLEfz9yqeEU7nLR2zlflu/55n1F1X+Q7gHKfecYlGmF1TqJPda
	4UtYd9Sq8IvNGFCjWAB9J4xIxYWDuadp5v3lGG0WB8iVdMCSRzC7DIyihlLKkO4VDPyI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wJ9fq-0006pO-8s;
	Sat, 02 May 2026 12:42:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ruipengqi3@gmail.com>) id 1wJ9fd-0006p4-9g
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 May 2026 12:42:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MLJ2RJkBCgsAX/0kSFHltXvZ52HXQ2CM6/lwTXhqGWI=; b=RUyRsGHI4dZYubXNW6e9moMb0u
 EtvE5yQ/o3s/yiB+VZeECKF40NjHre3PBfr+aj2FQ4uSrtMOnIoeZNoIxMwsiysedxwJeEXXkF5aU
 ulqxM1AphRu6hS5v9r9/zAjZ58JNNhtApBQNnWeKHQZGeLtQBbj9nJVfCr4fq6e4exLM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MLJ2RJkBCgsAX/0kSFHltXvZ52HXQ2CM6/lwTXhqGWI=; b=ECej6vrlCnloHi9xmTyMMw1dL0
 c7Qfiy0QuNPg7Vbo6Qh3FCdyH9CGYmTt9JhIdKsCyRN8gzzOL9+02FAs1+s/XNRbxJ3FYyD+DALPQ
 MJADxfidTx+wNUg12hRf8TOeDMhO2H4Wslc+cQUV2n/G61EgO9SVF1odzoyRZbLmLvG8=;
Received: from mail-pj1-f49.google.com ([209.85.216.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wJ9fc-0003oY-8b for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 May 2026 12:42:09 +0000
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-35fb166b0c6so1864431a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 02 May 2026 05:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777725717; x=1778330517; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MLJ2RJkBCgsAX/0kSFHltXvZ52HXQ2CM6/lwTXhqGWI=;
 b=ORUfHHdqa0CLL5BJ5xvMOSjSLY/6V9RZEcVM4frMQ0mFY04W/CFbNs4Kg6fQEATAKf
 cA+vd4dufl73GJ7iLnp8e7jzfwG2gwggRzmBf/Qn+cFqQCobw18e0hyQTZICYEkzxk1F
 At7RY7EH1c2kiik3eCmfcSTVFUBImBGTV9M57pCsNuUVMzPIuOaO0U63iIebvt7fXo8m
 LTtkNJt3imD+wJXfJkcCiHx6jsUEaB+O6veO2UFluFRzAx2uHGOPjsRDnOGdZnEIesBa
 zQw7UTCC4K1x9xaL4PDb2sAf03c8+UB1lv4o2BalpV/mj60DVANpoLeTf4/MQmBAGnCE
 4f7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777725717; x=1778330517;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MLJ2RJkBCgsAX/0kSFHltXvZ52HXQ2CM6/lwTXhqGWI=;
 b=ZMxpqtJAw9y9jIFH4drgxTUKbIKsClwExHGOtuJpHX9wQCl4cx8puFRdhCM2y4praF
 XqFl30ARBE/2/e4a7Jl35ko+jX3Ibx6bcjM+4Xg9NRL6YyYXUjweSQv0U9zwKfzVgDmR
 FFKTySR1nEAC7Tt4JIzoAN7lKIDNd9mmBBLnGvMH3M1KbK3vQv61w6TD8PuFRGo84aaM
 xuLi2QGq4n1tWNe88cSX8XaWikuYgCKZXcdobcNjKi0vfVbx/q44IG9FHvBi8nxZq0oo
 Y69GRvzjTEDqwL/R1M5mRjlnvk2zOnBQwmdgg1RK7cOQhLwoqbhwoyreA/5A7zWK8pjd
 H1Lw==
X-Gm-Message-State: AOJu0YxY1wvi8ETrWkrjgttDNzQ3TkueU+P9crSGhN6pOyQaTruYV0e5
 oGqswUJmLAa9R/ziq86YA/y9OQwSWKkBtYdj1AnsU/8F1nqQRcmnmjvx
X-Gm-Gg: AeBDiev8ikcm1zGJsS+gKll1aoG+ZtwzMRyRIl14xWfNgJJA/oD4v8MJms70SNRbqeX
 rinM5ahnSum6YKAUFp68e8f8ikayCqUKMKK8CynLXyZDS0nX+dFDKI9GealtgpPRc951uxViVQ0
 3qclhtfttgnM0SQbX0ryGwKATZhboFAGwbDUJ810SajRC0gpBn/XRC7vxebY4FQkGz9djWu2meI
 IkIMSJ2iy1OsbQWxLaSko2oVcssL9kGnd5eDtNnAHetCd5GxLscQVCaQWw4eUtzwdP3uGK5bhes
 QJsEKTBdvp30PxOS10AfQoquc6YQkJ0MFnU8QfnqS5uq1ZK1269VLwCZWts5926okgaBFA5BF0W
 CfZ2C+W09lipcK4fq5X24Y29LGgDxWk2M0xIIsrdRqEbj90rpUSymI5IwHcRDfWfg+tKpE/78Ou
 IqiVb8IpLbQSLKYwh5CrBs3ZmtVutclqbDN/G6/8lgR5DqZGqE
X-Received: by 2002:a17:90b:54cc:b0:35f:c6bf:2bba with SMTP id
 98e67ed59e1d1-364c49a1ccemr9960980a91.11.1777725717362; 
 Sat, 02 May 2026 05:41:57 -0700 (PDT)
Received: from [10.121.80.58] ([210.184.73.204])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b9caaba933sm49220705ad.28.2026.05.02.05.41.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 May 2026 05:41:56 -0700 (PDT)
Message-ID: <531732db-4113-4a58-bff1-6a59f3c630b3@gmail.com>
Date: Sat, 2 May 2026 20:41:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <20260426093239.165767-1-ruipengqi3@gmail.com>
 <d799ebe3-cbdb-4abf-8667-8ef8b112b48a@kernel.org>
 <70254f4c-80ce-4c53-ba60-be023d0cd6fc@gmail.com>
 <90abfbae-f999-4dad-9d71-d452a98d5ad8@kernel.org>
Content-Language: en-US
From: Ruipeng Qi <ruipengqi3@gmail.com>
In-Reply-To: <90abfbae-f999-4dad-9d71-d452a98d5ad8@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/4/29 15:59, Chao Yu wrote: > On 4/29/26 11:39,
 Ruipeng
 Qi wrote: >> >> On 2026/4/27 16:38, Chao Yu wrote: >>> On 4/26/26 17:32,
 ruipengqi wrote: >>>> From: Ruipeng Qi >>>> >>>> When the f2f [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ruipengqi3(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [ruipengqi3(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.49 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wJ9fc-0003oY-8b
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix potential deadlock in
 f2fs_balance_fs()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 6D7784B1F64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.91 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[ruipengqi3@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruipengqi3@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns]

Ck9uIDIwMjYvNC8yOSAxNTo1OSwgQ2hhbyBZdSB3cm90ZToKPiBPbiA0LzI5LzI2IDExOjM5LCBS
dWlwZW5nIFFpIHdyb3RlOgo+Pgo+PiBPbiAyMDI2LzQvMjcgMTY6MzgsIENoYW8gWXUgd3JvdGU6
Cj4+PiBPbiA0LzI2LzI2IDE3OjMyLCBydWlwZW5ncWkgd3JvdGU6Cj4+Pj4gRnJvbTogUnVpcGVu
ZyBRaSA8cnVpcGVuZ3FpM0BnbWFpbC5jb20+Cj4+Pj4KPj4+PiBXaGVuIHRoZSBmMmZzIGZpbGVz
eXN0ZW0gc3BhY2UgaXMgbmVhcmx5IGV4aGF1c3RlZCwgd2UgZW5jb3VudGVyIAo+Pj4+IGRlYWRs
b2NrCj4+Pj4gaXNzdWVzIGFzIGJlbG93Ogo+Pj4+Cj4+Pj4gSU5GTzogdGFzayBBOjE4OTAgYmxv
Y2tlZCBmb3IgbW9yZSB0aGFuIDEyMCBzZWNvbmRzLgo+Pj4+IMKgwqDCoMKgwqDCoCBUYWludGVk
OiBHwqDCoMKgwqDCoMKgwqDCoMKgwqAgT8KgwqDCoMKgwqDCoCA2LjEyLjQxLWczZmUwN2RkZjA1
YWIgIzEKPj4+PiAiZWNobyAwID4gL3Byb2Mvc3lzL2tlcm5lbC9odW5nX3Rhc2tfdGltZW91dF9z
ZWNzIiBkaXNhYmxlcyB0aGlzIAo+Pj4+IG1lc3NhZ2UuCj4+Pj4gdGFzazpBwqDCoMKgIHN0YXRl
OkQgc3RhY2s6MMKgwqDCoMKgIHBpZDoxODkwwqAgdGdpZDoxNjI2wqAgcHBpZDoxMTUzIAo+Pj4+
IGZsYWdzOjB4MDAwMDAyMDQKPj4+PiBDYWxsIHRyYWNlOgo+Pj4+IMKgIF9fc3dpdGNoX3RvKzB4
ZjQvMHgxNTgKPj4+PiDCoCBfX3NjaGVkdWxlKzB4MjdjLzB4OTA4Cj4+Pj4gwqAgc2NoZWR1bGUr
MHgzYy8weDExOAo+Pj4+IMKgIGlvX3NjaGVkdWxlKzB4NDQvMHg2OAo+Pj4+IMKgIGZvbGlvX3dh
aXRfYml0X2NvbW1vbisweDE3NC8weDM3MAo+Pj4+IMKgIGZvbGlvX3dhaXRfYml0KzB4MjAvMHgz
OAo+Pj4+IMKgIGZvbGlvX3dhaXRfd3JpdGViYWNrKzB4NTQvMHhjOAo+Pj4+IMKgIHRydW5jYXRl
X2lub2RlX3BhcnRpYWxfZm9saW8rMHg3MC8weDFlMAo+Pj4+IMKgIHRydW5jYXRlX2lub2RlX3Bh
Z2VzX3JhbmdlKzB4MWIwLzB4NDUwCj4+Pj4gwqAgdHJ1bmNhdGVfcGFnZWNhY2hlKzB4NTQvMHg4
OAo+Pj4+IMKgIGYyZnNfZmlsZV93cml0ZV9pdGVyKzB4M2U4LzB4YjgwCj4+Pj4gwqAgZG9faXRl
cl9yZWFkdl93cml0ZXYrMHhmMC8weDFlMAo+Pj4+IMKgIHZmc193cml0ZXYrMHgxMzgvMHgyYzgK
Pj4+PiDCoCBkb193cml0ZXYrMHg4OC8weDEzMAo+Pj4+IMKgIF9fYXJtNjRfc3lzX3dyaXRldisw
eDI4LzB4NDAKPj4+PiDCoCBpbnZva2Vfc3lzY2FsbCsweDUwLzB4MTIwCj4+Pj4gwqAgZWwwX3N2
Y19jb21tb24uY29uc3Rwcm9wLjArMHhjOC8weGYwCj4+Pj4gwqAgZG9fZWwwX3N2YysweDI0LzB4
MzgKPj4+PiDCoCBlbDBfc3ZjKzB4MzAvMHhmOAo+Pj4+IMKgIGVsMHRfNjRfc3luY19oYW5kbGVy
KzB4MTIwLzB4MTMwCj4+Pj4gwqAgZWwwdF82NF9zeW5jKzB4MTkwLzB4MTk4Cj4+Pj4KPj4+PiBJ
TkZPOiB0YXNrIGt3b3JrZXIvdTg6MTE6MjY4MDg1MyBibG9ja2VkIGZvciBtb3JlIHRoYW4gMTIw
IHNlY29uZHMuCj4+Pj4gwqDCoMKgwqDCoMKgIFRhaW50ZWQ6IEfCoMKgwqDCoMKgwqDCoMKgwqDC
oCBPwqDCoMKgwqDCoMKgIDYuMTIuNDEtZzNmZTA3ZGRmMDVhYiAjMQo+Pj4+ICJlY2hvIDAgPiAv
cHJvYy9zeXMva2VybmVsL2h1bmdfdGFza190aW1lb3V0X3NlY3MiIGRpc2FibGVzIHRoaXMgCj4+
Pj4gbWVzc2FnZS4KPj4+PiB0YXNrOmt3b3JrZXIvdTg6MTHCoMKgIHN0YXRlOkQgc3RhY2s6MMKg
wqDCoMKgIHBpZDoyNjgwODUzIHRnaWQ6MjY4MDg1MyAKPj4+PiBwcGlkOjLCoMKgwqDCoMKgIGZs
YWdzOjB4MDAwMDAyMDgKPj4+PiBXb3JrcXVldWU6IHdyaXRlYmFjayB3Yl93b3JrZm4gKGZsdXNo
LTI1NDowKQo+Pj4+IENhbGwgdHJhY2U6Cj4+Pj4gwqAgX19zd2l0Y2hfdG8rMHhmNC8weDE1OAo+
Pj4+IMKgIF9fc2NoZWR1bGUrMHgyN2MvMHg5MDgKPj4+PiDCoCBzY2hlZHVsZSsweDNjLzB4MTE4
Cj4+Pj4gwqAgaW9fc2NoZWR1bGUrMHg0NC8weDY4Cj4+Pj4gwqAgZm9saW9fd2FpdF9iaXRfY29t
bW9uKzB4MTc0LzB4MzcwCj4+Pj4gwqAgX19maWxlbWFwX2dldF9mb2xpbysweDIxNC8weDM0OAo+
Pj4+IMKgIHBhZ2VjYWNoZV9nZXRfcGFnZSsweDIwLzB4NzAKPj4+PiDCoCBmMmZzX2dldF9yZWFk
X2RhdGFfcGFnZSsweDE1MC8weDNlOAo+Pj4+IMKgIGYyZnNfZ2V0X2xvY2tfZGF0YV9wYWdlKzB4
MmMvMHgxNjAKPj4+PiDCoCBtb3ZlX2RhdGFfcGFnZSsweDUwLzB4NDc4Cj4+Pj4gwqAgZG9fZ2Fy
YmFnZV9jb2xsZWN0KzB4ZDM4LzB4MTUyOAo+Pj4+IMKgIGYyZnNfZ2MrMHgyNDAvMHg3ZTAKPj4+
PiDCoCBmMmZzX2JhbGFuY2VfZnMrMHgxYTAvMHgyMDgKPj4+PiDCoCBmMmZzX3dyaXRlX3Npbmds
ZV9kYXRhX3BhZ2UrMHg2ZTQvMHg3MzAgLy8weGZmZmZmZTBkNmNhMDgzMDAKPj4+PiDCoCBmMmZz
X3dyaXRlX2NhY2hlX3BhZ2VzKzB4Mzc4LzB4OWIwCj4+Pj4gwqAgZjJmc193cml0ZV9kYXRhX3Bh
Z2VzKzB4MmU0LzB4Mzg4Cj4+Pj4gwqAgZG9fd3JpdGVwYWdlcysweDhjLzB4MmM4Cj4+Pj4gwqAg
X193cml0ZWJhY2tfc2luZ2xlX2lub2RlKzB4NGMvMHg0OTgKPj4+PiDCoCB3cml0ZWJhY2tfc2Jf
aW5vZGVzKzB4MjM0LzB4NGE4Cj4+Pj4gwqAgX193cml0ZWJhY2tfaW5vZGVzX3diKzB4NTgvMHgx
MTgKPj4+PiDCoCB3Yl93cml0ZWJhY2srMHgyZjgvMHgzYzAKPj4+PiDCoCB3Yl93b3JrZm4rMHgy
YzQvMHg1MDgKPj4+PiDCoCBwcm9jZXNzX29uZV93b3JrKzB4MTgwLzB4NDA4Cj4+Pj4gwqAgd29y
a2VyX3RocmVhZCsweDI1OC8weDM2OAo+Pj4+IMKgIGt0aHJlYWQrMHgxMTgvMHgxMjgKPj4+PiDC
oCByZXRfZnJvbV9mb3JrKzB4MTAvMHgyMDAKPj4+Pgo+Pj4+IElORk86IHRhc2sga3dvcmtlci91
ODo4OjI2NDEyOTcgYmxvY2tlZCBmb3IgbW9yZSB0aGFuIDEyMCBzZWNvbmRzLgo+Pj4+IMKgwqDC
oMKgwqDCoCBUYWludGVkOiBHwqDCoMKgwqDCoMKgwqDCoMKgwqAgT8KgwqDCoMKgwqDCoCA2LjEy
LjQxLWczZmUwN2RkZjA1YWIgIzEKPj4+PiAiZWNobyAwID4gL3Byb2Mvc3lzL2tlcm5lbC9odW5n
X3Rhc2tfdGltZW91dF9zZWNzIiBkaXNhYmxlcyB0aGlzIAo+Pj4+IG1lc3NhZ2UuCj4+Pj4gdGFz
azprd29ya2VyL3U4OjjCoMKgwqAgc3RhdGU6RCBzdGFjazowwqDCoMKgwqAgcGlkOjI2NDEyOTcg
dGdpZDoyNjQxMjk3IAo+Pj4+IHBwaWQ6MsKgwqDCoMKgwqAgZmxhZ3M6MHgwMDAwMDIwOAo+Pj4+
IFdvcmtxdWV1ZTogd3JpdGViYWNrIHdiX3dvcmtmbiAoZmx1c2gtMjU0OjApCj4+Pj4gQ2FsbCB0
cmFjZToKPj4+PiDCoCBfX3N3aXRjaF90bysweGY0LzB4MTU4Cj4+Pj4gwqAgX19zY2hlZHVsZSsw
eDI3Yy8weDkwOAo+Pj4+IMKgIHJ0X211dGV4X3NjaGVkdWxlKzB4MzAvMHg2MAo+Pj4+IMKgIF9f
cnRfbXV0ZXhfc2xvd2xvY2tfbG9ja2VkLmNvbnN0cHJvcC4wKzB4NDYwLzB4OGE4Cj4+Pj4gwqAg
cndiYXNlX3dyaXRlX2xvY2srMHgyNGMvMHgzNzgKPj4+PiDCoCBkb3duX3dyaXRlKzB4MWMvMHgz
MAo+Pj4+IMKgIGYyZnNfYmFsYW5jZV9mcysweDE4NC8weDIwOAo+Pj4+IMKgIGYyZnNfd3JpdGVf
aW5vZGUrMHhmNC8weDMyOAo+Pj4+IMKgIF9fd3JpdGViYWNrX3NpbmdsZV9pbm9kZSsweDM3MC8w
eDQ5OAo+Pj4+IMKgIHdyaXRlYmFja19zYl9pbm9kZXMrMHgyMzQvMHg0YTgKPj4+PiDCoCBfX3dy
aXRlYmFja19pbm9kZXNfd2IrMHg1OC8weDExOAo+Pj4+IMKgIHdiX3dyaXRlYmFjaysweDJmOC8w
eDNjMAo+Pj4+IMKgIHdiX3dvcmtmbisweDJjNC8weDUwOAo+Pj4+IMKgIHByb2Nlc3Nfb25lX3dv
cmsrMHgxODAvMHg0MDgKPj4+PiDCoCB3b3JrZXJfdGhyZWFkKzB4MjU4LzB4MzY4Cj4+Pj4gwqAg
a3RocmVhZCsweDExOC8weDEyOAo+Pj4+IMKgIHJldF9mcm9tX2ZvcmsrMHgxMC8weDIwCj4+Pj4K
Pj4+PiBJTkZPOiB0YXNrIEI6MTkwMiBibG9ja2VkIGZvciBtb3JlIHRoYW4gMTIwIHNlY29uZHMu
Cj4+Pj4gwqDCoMKgwqDCoMKgIFRhaW50ZWQ6IEfCoMKgwqDCoMKgwqDCoMKgwqDCoCBPwqDCoMKg
wqDCoMKgIDYuMTIuNDEtZzNmZTA3ZGRmMDVhYiAjMQo+Pj4+ICJlY2hvIDAgPiAvcHJvYy9zeXMv
a2VybmVsL2h1bmdfdGFza190aW1lb3V0X3NlY3MiIGRpc2FibGVzIHRoaXMgCj4+Pj4gbWVzc2Fn
ZS4KPj4+PiB0YXNrOkLCoMKgwqDCoCBzdGF0ZTpEIHN0YWNrOjDCoMKgwqDCoCBwaWQ6MTkwMsKg
IHRnaWQ6MTYyNiBwcGlkOjExNTMgCj4+Pj4gZmxhZ3M6MHgwMDAwMDIwYwo+Pj4+IENhbGwgdHJh
Y2U6Cj4+Pj4gwqAgX19zd2l0Y2hfdG8rMHhmNC8weDE1OAo+Pj4+IMKgIF9fc2NoZWR1bGUrMHgy
N2MvMHg5MDgKPj4+PiDCoCBydF9tdXRleF9zY2hlZHVsZSsweDMwLzB4NjAKPj4+PiDCoCBfX3J0
X211dGV4X3Nsb3dsb2NrX2xvY2tlZC5jb25zdHByb3AuMCsweDQ2MC8weDhhOAo+Pj4+IMKgIHJ3
YmFzZV93cml0ZV9sb2NrKzB4MjRjLzB4Mzc4Cj4+Pj4gwqAgZG93bl93cml0ZSsweDFjLzB4MzAK
Pj4+PiDCoCBmMmZzX2JhbGFuY2VfZnMrMHgxODQvMHgyMDgKPj4+PiDCoCBmMmZzX21hcF9ibG9j
a3MrMHg5NGMvMHgxMTEwCj4+Pj4gwqAgZjJmc19maWxlX3dyaXRlX2l0ZXIrMHgyMjgvMHhiODAK
Pj4+PiDCoCBkb19pdGVyX3JlYWR2X3dyaXRldisweGYwLzB4MWUwCj4+Pj4gwqAgdmZzX3dyaXRl
disweDEzOC8weDJjOAo+Pj4+IMKgIGRvX3dyaXRldisweDg4LzB4MTMwCj4+Pj4gwqAgX19hcm02
NF9zeXNfd3JpdGV2KzB4MjgvMHg0MAo+Pj4+IMKgIGludm9rZV9zeXNjYWxsKzB4NTAvMHgxMjAK
Pj4+PiDCoCBlbDBfc3ZjX2NvbW1vbi5jb25zdHByb3AuMCsweGM4LzB4ZjAKPj4+PiDCoCBkb19l
bDBfc3ZjKzB4MjQvMHgzOAo+Pj4+IMKgIGVsMF9zdmMrMHgzMC8weGY4Cj4+Pj4gwqAgZWwwdF82
NF9zeW5jX2hhbmRsZXIrMHgxMjAvMHgxMzAKPj4+PiDCoCBlbDB0XzY0X3N5bmMrMHgxOTAvMHgx
OTgKPj4+Pgo+Pj4+IElORk86IHRhc2sgc3luYzoyNzY5ODQ5IGJsb2NrZWQgZm9yIG1vcmUgdGhh
biAxMjAgc2Vjb25kcy4KPj4+PiDCoMKgwqDCoMKgwqAgVGFpbnRlZDogR8KgwqDCoMKgwqDCoMKg
wqDCoMKgIE/CoMKgwqDCoMKgwqAgNi4xMi40MS1nM2ZlMDdkZGYwNWFiICMxCj4+Pj4gImVjaG8g
MCA+IC9wcm9jL3N5cy9rZXJuZWwvaHVuZ190YXNrX3RpbWVvdXRfc2VjcyIgZGlzYWJsZXMgdGhp
cyAKPj4+PiBtZXNzYWdlLgo+Pj4+IHRhc2s6c3luY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Rh
dGU6RCBzdGFjazowwqDCoMKgwqAgcGlkOjI3Njk4NDkgdGdpZDoyNzY5ODQ5IAo+Pj4+IHBwaWQ6
NzM2wqDCoMKgIGZsYWdzOjB4MDAwMDAyMGMKPj4+PiBDYWxsIHRyYWNlOgo+Pj4+IMKgIF9fc3dp
dGNoX3RvKzB4ZjQvMHgxNTgKPj4+PiDCoCBfX3NjaGVkdWxlKzB4MjdjLzB4OTA4Cj4+Pj4gwqAg
c2NoZWR1bGUrMHgzYy8weDExOAo+Pj4+IMKgIHdiX3dhaXRfZm9yX2NvbXBsZXRpb24rMHhiMC8w
eGU4Cj4+Pj4gwqAgc3luY19pbm9kZXNfc2IrMHhjOC8weDJiMAo+Pj4+IMKgIHN5bmNfaW5vZGVz
X29uZV9zYisweDI0LzB4MzgKPj4+PiDCoCBpdGVyYXRlX3N1cGVycysweGE4LzB4MTM4Cj4+Pj4g
wqAga3N5c19zeW5jKzB4NTQvMHhjOAo+Pj4+IMKgIF9fYXJtNjRfc3lzX3N5bmMrMHgxOC8weDMw
Cj4+Pj4gwqAgaW52b2tlX3N5c2NhbGwrMHg1MC8weDEyMAo+Pj4+IMKgIGVsMF9zdmNfY29tbW9u
LmNvbnN0cHJvcC4wKzB4YzgvMHhmMAo+Pj4+IMKgIGRvX2VsMF9zdmMrMHgyNC8weDM4Cj4+Pj4g
wqAgZWwwX3N2YysweDMwLzB4ZjgKPj4+PiDCoCBlbDB0XzY0X3N5bmNfaGFuZGxlcisweDEyMC8w
eDEzMAo+Pj4+IMKgIGVsMHRfNjRfc3luYysweDE5MC8weDE5OAo+Pj4+Cj4+Pj4gVGhlIHJvb3Qg
Y2F1c2UgaXMgYSBwb3RlbnRpYWwgZGVhZGxvY2sgYmV0d2VlbiB0aGUgZm9sbG93aW5nIHRhc2tz
Ogo+Pj4+Cj4+Pj4ga3dvcmtlci91ODoxMcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBU
aHJlYWQgQQo+Pj4+IC0gZjJmc193cml0ZV9zaW5nbGVfZGF0YV9wYWdlCj4+Pj4gwqAgLSBmMmZz
X2RvX3dyaXRlX2RhdGFfcGFnZQo+Pj4+IMKgwqAgLSBmb2xpb19zdGFydF93cml0ZWJhY2soWCkK
Pj4+PiDCoMKgIC0gZjJmc19vdXRwbGFjZV93cml0ZV9kYXRhCj4+Pj4gwqDCoMKgIC0gYmlvX2Fk
ZF9mb2xpbyhYKQo+Pj4+IMKgIC0gZm9saW9fdW5sb2NrKFgpCj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSB0cnVuY2F0ZV9pbm9kZV9wYWdlc19yYW5nZQo+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBfX2ZpbGVtYXBfZ2V0
X2ZvbGlvKFgsIEZHUF9MT0NLKQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgLSB0cnVuY2F0ZV9pbm9kZV9wYXJ0aWFsX2ZvbGlvKFgpCj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZm9saW9fd2FpdF93cml0ZWJhY2so
WCkKPj4+PiDCoCAtIGYyZnNfYmFsYW5jZV9mcwo+Pj4+IMKgwqAgLSBmMmZzX2djCj4+Pj4gwqDC
oMKgIC0gZG9fZ2FyYmFnZV9jb2xsZWN0Cj4+Pj4gwqDCoMKgwqAgLSBtb3ZlX2RhdGFfcGFnZQo+
Pj4+IMKgwqDCoMKgwqAgLSBmMmZzX2dldF9sb2NrX2RhdGFfcGFnZQo+Pj4+IMKgwqDCoMKgwqDC
oCAtIF9fZmlsZW1hcF9nZXRfZm9saW8oWCwgRkdQX0xPQ0spCj4+Pj4KPj4+PiBCb3RoIHRocmVh
ZHMgdHJ5IHRvIGFjY2VzcyBmb2xpbyBYLiBUaHJlYWQgQSBob2xkcyB0aGUgbG9jayBidXQgd2Fp
dHMKPj4+PiBmb3Igd3JpdGViYWNrLCB3aGlsZSBrd29ya2VyIHdhaXRzIGZvciB0aGUgbG9jay4g
VGhpcyBjYXVzZXMgYSAKPj4+PiBkZWFkbG9jay4KPj4+Pgo+Pj4+IE90aGVyIHRocmVhZHMgYWxz
byBlbnRlciBEIHN0YXRlLCB3YWl0aW5nIGZvciBsb2NrcyBzdWNoIGFzIGdjX2xvY2sgCj4+Pj4g
YW5kCj4+Pj4gd3JpdGVwYWdlcy4KPj4+Pgo+Pj4+IE9QVS9JUFUgREFUQSBmb2xpbyBhcmUgYWxs
IGFmZmVjdGVkIGJ5IHRoaXMgaXNzdWUuIFRvIGF2b2lkIHN1Y2gKPj4+PiBwb3RlbnRpYWwgZGVh
ZGxvY2tzLCBhbHdheXMgY29tbWl0IHRoZXNlIGNhY2hlZCBmb2xpb3MgYmVmb3JlCj4+Pj4gdHJp
Z2dlcmluZyBmMmZzX2djKCkgaW4gZjJmc19iYWxhbmNlX2ZzKCkuCj4+Pj4KPj4+PiB2MjoKPj4+
PiAtIENvbW1pdCBjYWNoZWQgT1BVL0lQVSBmb2xpb3MsIG5vdCBqdXN0IE9QVSBmb2xpb3MgYXMg
aW4gdjEuCj4+Pj4KPj4+PiBTdWdnZXN0ZWQtYnk6IENoYW8gPGNoYW9Aa2VybmVsLm9yZz4KPj4+
PiBTaWduZWQtb2ZmLWJ5OiBSdWlwZW5nIFFpIDxydWlwZW5ncWkzQGdtYWlsLmNvbT4KPj4+PiAt
LS0KPj4+PiDCoCBmcy9mMmZzL2RhdGEuY8KgwqDCoCB8IDI2ICsrKysrKysrKysrKysrKysrKysr
KysrKysrCj4+Pj4gwqAgZnMvZjJmcy9mMmZzLmjCoMKgwqAgfMKgIDEgKwo+Pj4+IMKgIGZzL2Yy
ZnMvc2VnbWVudC5jIHzCoCA5ICsrKysrKysrKwo+Pj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgMzYg
aW5zZXJ0aW9ucygrKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMv
ZjJmcy9kYXRhLmMKPj4+PiBpbmRleCAzMzhkZjdhMmFlYTYuLmZkMDMzNjZiMzIyOCAxMDA2NDQK
Pj4+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+Pj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+Pj4g
QEAgLTkzOSw2ICs5MzksMzIgQEAgdm9pZCBmMmZzX3N1Ym1pdF9tZXJnZWRfaXB1X3dyaXRlKHN0
cnVjdCAKPj4+PiBmMmZzX3NiX2luZm8gKnNiaSwKPj4+PiDCoMKgwqDCoMKgIH0KPj4+PiDCoCB9
Cj4+Pj4gwqAgK3ZvaWQgZjJmc19zdWJtaXRfYWxsX21lcmdlZF9pcHVfd3JpdGVzKHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSkKPj4+PiArewo+Pj4+ICvCoMKgwqAgc3RydWN0IGJpb19lbnRyeSAq
YmUsICp0bXA7Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZjJmc19iaW9faW5mbyAqaW87Cj4+Pj4gK8Kg
wqDCoCBlbnVtIHRlbXBfdHlwZSB0ZW1wOwo+Pj4+ICvCoMKgwqAgTElTVF9IRUFEKGxpc3QpOwo+
Pj4+ICsKPj4+PiArwqDCoMKgIGZvciAodGVtcCA9IEhPVDsgdGVtcCA8IE5SX1RFTVBfVFlQRTsg
dGVtcCsrKSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlvID0gc2JpLT53cml0ZV9pb1tEQVRBXSAr
IHRlbXA7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAobGlzdF9lbXB0eSgmaW8tPmJp
b19saXN0KSkKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4+Cj4+PiBO
ZWVkcyB0byBiZSBjb3ZlcmVkIHcvIGJpb19saXN0X2xvY2sgdG8gYXZvaWQgcmFjZSBjb25kaXRp
b24uCj4+Cj4+IEhpLENoYW8KPj4KPj4gVGhlIGxvY2tsZXNzIGxpc3RfZW1wdHkoKSBoZXJlIGlz
IGludGVudGlvbmFsIGFuZCBhY2NlcHRhYmxlLgo+Pgo+Pgo+PiBJZiBsaXN0X2VtcHR5KCkgcmV0
dXJucyB0cnVlIGJ1dCB0aGUgbGlzdCBiZWNvbWVzIG5vbi1lbXB0eQo+PiBhZnRlcndhcmRzIChk
dWUgdG8gcmFjZSksIHRoZSBuZXdseSBhZGRlZCBiaW8gd2lsbCBiZSBzdWJtaXR0ZWQKPj4gYnkg
dGhlIHN1YnNlcXVlbnQgd3JpdGUgcGF0aCwgc28gbm8gYmlvIHdpbGwgYmUgbG9zdC4KPgo+IEFo
LCByaWdodCwgd2Ugb25seSBuZWVkIHRvIHN1Ym1pdCB0aGUgZm9saW9zIGNhY2hlZCBieSBsb2Nh
bCB0aHJlYWQuCj4KPj4KPj4KPj4gU2ltaWxhciBwYXR0ZXJucyBleGlzdCBpbiB0aGUga2VybmVs
LCBlLmcuOgo+PiDCoMKgIG5ldC9yZmtpbGwvY29yZS5jOiByZmtpbGxfZm9wX3JlYWQoKQo+PiDC
oMKgwqDCoCAvKiBzaW5jZSB3ZSByZS1jaGVjayBhbmQgaXQganVzdCBjb21wYXJlcyBwb2ludGVy
cywKPj4gwqDCoMKgwqDCoCAqIHVzaW5nICFsaXN0X2VtcHR5KCkgd2l0aG91dCBsb2NraW5nIGlz
bid0IGEgcHJvYmxlbQo+PiDCoMKgwqDCoMKgICovCj4+IMKgwqAgZnMvZjJmcy9kYXRhLmM6IGYy
ZnNfc3VibWl0X21lcmdlZF9pcHVfd3JpdGUoKQo+PiDCoMKgwqDCoCBsaXN0X2VtcHR5KCkgaXMg
YWxzbyB1c2VkIHdpdGhvdXQgaG9sZGluZyBiaW9fbGlzdF9sb2NrCj4+IMKgwqDCoMKgIGFzIGEg
bG9ja2xlc3MgcHJlLWNoZWNrCj4+Cj4+Cj4+IElmIHlvdSdkIHByZWZlciwgd2UgY2FuIGFkZCBh
IGNvbW1lbnQgdG8gbWFrZSB0aGUgaW50ZW50IGNsZWFyOgo+Pgo+PiDCoMKgwqDCoCAvKiBsaXN0
X2VtcHR5KCkgd2l0aG91dCBsb2NrIGlzIHNhZmUgaGVyZSAtIFJFQURfT05DRSgpCj4+IMKgwqDC
oMKgwqAgKiBlbnN1cmVzIHBvaW50ZXIgcmVhZCBhdG9taWNpdHkuIEEgZmFsc2UgbmVnYXRpdmUg
aXMKPj4gwqDCoMKgwqDCoCAqIGFjY2VwdGFibGUgc2luY2UgYW55IGJpbyBhZGRlZCBjb25jdXJy
ZW50bHkgd2lsbCBiZQo+PiDCoMKgwqDCoMKgICogc3VibWl0dGVkIGJ5IHRoZSBuZXh0IHdyaXRl
IHBhdGguCj4+IMKgwqDCoMKgwqAgKi8KPj4gwqDCoMKgwqAgaWYgKGxpc3RfZW1wdHkoJmlvLT5i
aW9fbGlzdCkpCj4+IMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4+Pgo+Pj4+ICsKPj4+PiAr
wqDCoMKgwqDCoMKgwqAgZjJmc19kb3duX3dyaXRlKCZpby0+YmlvX2xpc3RfbG9jayk7Cj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIGxpc3Rfc3BsaWNlX2luaXQoJmlvLT5iaW9fbGlzdCwgJmxpc3QpOwo+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBmMmZzX3VwX3dyaXRlKCZpby0+YmlvX2xpc3RfbG9jayk7Cj4+
Pj4gKwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoYmUsIHRt
cCwgJmxpc3QsIGxpc3QpIHsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX3N1Ym1p
dF93cml0ZV9iaW8oc2JpLCBiZS0+YmlvLCBEQVRBKTsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBkZWxfYmlvX2VudHJ5KGJlKTsKPj4+PiArwqDCoMKgwqDCoMKgwqAgfQo+Pj4+ICsKPj4+
Cj4+PiBVbm5lY2Vzc2FyeSBibGFuayBsaW5lLgo+Pj4KPj4+IFRoYW5rcywKPj4KPj4gVGhhbmtz
IGZvciB5b3VyIGNvcnJlY3Rpb24uIFdpbGwgZml4IGluIHYzLgo+PiDCoMKgwqDCoCB2MzoKPj4g
wqDCoMKgwqAgLSBGaXhlZCBtaW5vciBncmFtbWF0aWNhbCBpc3N1ZXMKPj4gwqDCoMKgwqAgLSBB
ZGQgY29tbWVudCBvbiBsb2NrbGVzcyBsaXN0X2VtcHR5KCkgdG8gZXhwbGFpbiB3aHkgaXQgaXMg
c2FmZQo+PiDCoMKgIHdpdGhvdXQgaG9sZGluZyBiaW9fbGlzdF9sb2NrCj4KPiBTZWVtcyBmaW5l
Lgo+Cj4+Cj4+Cj4+IFRoYW5rcywKPj4KPj4+Cj4+Pj4gK8KgwqDCoCB9Cj4+Pj4gKwo+Pj4+ICt9
Cj4+Pj4gKwo+Pj4+IMKgIGludCBmMmZzX21lcmdlX3BhZ2VfYmlvKHN0cnVjdCBmMmZzX2lvX2lu
Zm8gKmZpbykKPj4+PiDCoCB7Cj4+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgYmlvICpiaW8gPSAqZmlv
LT5iaW87Cj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgK
Pj4+PiBpbmRleCBiYjM0ZTg2NGQwZWYuLmU5MDM4YWIxYjJiZCAxMDA2NDQKPj4+PiAtLS0gYS9m
cy9mMmZzL2YyZnMuaAo+Pj4+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4+Pj4gQEAgLTQxNDgsNiAr
NDE0OCw3IEBAIHZvaWQgZjJmc19zdWJtaXRfbWVyZ2VkX3dyaXRlX2ZvbGlvKHN0cnVjdCAKPj4+
PiBmMmZzX3NiX2luZm8gKnNiaSwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHN0cnVjdCBmb2xpbyAqZm9saW8sIGVudW0gcGFnZV90eXBlIHR5cGUpOwo+Pj4+IMKgIHZv
aWQgZjJmc19zdWJtaXRfbWVyZ2VkX2lwdV93cml0ZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmks
Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBi
aW8gKipiaW8sIHN0cnVjdCBmb2xpbyAqZm9saW8pOwo+Pj4+ICt2b2lkIGYyZnNfc3VibWl0X2Fs
bF9tZXJnZWRfaXB1X3dyaXRlcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpOwo+Pj4+IMKgIHZv
aWQgZjJmc19mbHVzaF9tZXJnZWRfd3JpdGVzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7Cj4+
Pj4gwqAgaW50IGYyZnNfc3VibWl0X3BhZ2VfYmlvKHN0cnVjdCBmMmZzX2lvX2luZm8gKmZpbyk7
Cj4+Pj4gwqAgaW50IGYyZnNfbWVyZ2VfcGFnZV9iaW8oc3RydWN0IGYyZnNfaW9faW5mbyAqZmlv
KTsKPj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQu
Ywo+Pj4+IGluZGV4IDZhOTdmZTc2NzEyYi4uODU2ZmZlOTFiOTRmIDEwMDY0NAo+Pj4+IC0tLSBh
L2ZzL2YyZnMvc2VnbWVudC5jCj4+Pj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPj4+PiBAQCAt
NDU0LDYgKzQ1NCwxNSBAQCB2b2lkIGYyZnNfYmFsYW5jZV9mcyhzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmksIAo+Pj4+IGJvb2wgbmVlZCkKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaW9fc2NoZWR1
bGUoKTsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZmluaXNoX3dhaXQoJnNiaS0+Z2NfdGhyZWFk
LT5mZ2djX3dxLCAmd2FpdCk7Cj4+Pj4gwqDCoMKgwqDCoCB9IGVsc2Ugewo+Pj4+ICsKPj4+PiAr
wqDCoMKgwqDCoMKgwqAgLyoKPj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIFN1Ym1pdCBhbGwgY2Fj
aGVkIE9QVS9JUFUgREFUQSBiaW9zIGJlZm9yZSB0cmlnZ2VyaW5nCj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqAgKiBmb3JlZ3JvdW5kIEdDIHRvIGF2b2lkIHBvdGVudGlhbCBkZWFkbG9ja3MuCj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqAgKi8KPj4+PiArCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGYyZnNfc3Vi
bWl0X21lcmdlZF93cml0ZShzYmksIERBVEEpOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBmMmZzX3N1
Ym1pdF9hbGxfbWVyZ2VkX2lwdV93cml0ZXMoc2JpKTsKPgo+IENhbiB3ZSByZWxvY2F0ZSBhYm92
ZSBjb2RlIHRvIGJlbG93IHRoZSB2YXJpYWJsZSBkZWZpbml0aW9ucz8KPgo+IFRoYW5rcywKPgpI
aSwgQ2hhbwoKU3VyZSwgd2lsbCBmaXggaXQgaW4gVjMuCgpCVFcsIFRvIGF2b2lkIHBvdGVudGlh
bCBkZWFkbG9ja3MsIHRoaXMgcGF0Y2ggc3VibWl0cyBjYWNoZWQgT1BVL0lQVSBmb2xpb3MKYmVm
b3JlIHRyaWdnZXJpbmcgZjJmc19nYygpIGluIGYyZnNfYmFsYW5jZV9mcygpLCB3aGljaCBjaGFu
Z2VzIHRoZQpleGlzdGluZyBJUFUvT1BVIEJJTyBsaWZlY3ljbGUuCgpGb3IgT1BVLCBpby0+aW9f
cndzZW0gcHJvdmlkZXMgdGhlIG5lY2Vzc2FyeSBzeW5jaHJvbml6YXRpb24uCkZvciBJUFUsIGlv
LT5iaW9fbGlzdF9sb2NrIGVuc3VyZXMgcmFjZS1mcmVlIHN1Ym1pc3Npb24uCkluIGJvdGggY2Fz
ZXMsIG5ldyBCSU9zIHdpbGwgYmUgYWxsb2NhdGVkIGFzIG5lZWRlZCBhZnRlciBzdWJtaXNzaW9u
LgoKSSBtYXkgaGF2ZSBtaXNzZWQgc29tZXRoaW5nIGluIHRoZSBjdXJyZW50IGltcGxlbWVudGF0
aW9uLgpZb3VyIHByb2Zlc3Npb25hbCByZXZpZXcgd291bGQgYmUgbXVjaCBhcHByZWNpYXRlZC4K
ClRoYW5rcywKCj4+Pj4gKwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZjJmc19nY19j
b250cm9sIGdjX2NvbnRyb2wgPSB7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLnZp
Y3RpbV9zZWdubyA9IE5VTExfU0VHTk8sCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LmluaXRfZ2NfdHlwZSA9IGYyZnNfc2JfaGFzX2Jsa3pvbmVkKHNiaSkgPwo+Pj4KPgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwK
