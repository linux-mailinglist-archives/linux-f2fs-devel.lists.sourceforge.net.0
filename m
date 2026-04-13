Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oN6dKdCw3GldVQkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Apr 2026 11:01:04 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D223B3E972C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Apr 2026 11:01:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XxcrQpOYXIO+bzn+LK5ZOzDAkVTuimzblj5qu8UAZB0=; b=e6qYCS6MbVZ6shg/9yzWUlRgCq
	UKdnPWb7+iWSf14BoTkzXiToYxiVaY+MogBlzVG1IgV7J+GQTl0efGIfSihQvc9lU/Yf/KwTHgECd
	pc5sYvfBsmWHOes6adBupPxtJ3G3Qvkh2OXEWtSNYb2Jr+iDOEwsmKPg2BuuZx2IBAWE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wCDA5-0006U8-Jk;
	Mon, 13 Apr 2026 09:00:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jinbaoliu365@gmail.com>) id 1wCD9y-0006Ti-Ck
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Apr 2026 09:00:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HZLTA2wxeQJ1Gn74quGqLyBBER+2KkEx7pj+z4oFjKM=; b=dk0A+JfYB4dqnn9oIm6psXaSfn
 /tXnCFFqvLtJU/DSzKxQJv5z7/Dy0Qgump/LFfV6xIlDr+L3naHiVpi4ifz9xYcRzgSlEOm7HzQF3
 xpukFz7iKmVml+LEwiqceK0E4R4EDxEdypPohzvuvs8RyumW3YEesyCoHcxyf4I7sCj0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HZLTA2wxeQJ1Gn74quGqLyBBER+2KkEx7pj+z4oFjKM=; b=MQuROo46v1/Qr6gmWMyHz3VqF1
 MAT4jwQsOWCMBzWJWYE2ppRnTYEvJarJiVC+g2pOK39yodOXTBbVlUHE71IrhqMSdJcwTz0M0nxn3
 LKkkIcR0UySM83knCO0d/mmmbA3hYFYkOW8VBwnMlhyO/ESjuk0zcygdPW9n9x9/C+SI=;
Received: from mail-pj1-f53.google.com ([209.85.216.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wCD9x-0004GG-SK for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Apr 2026 09:00:46 +0000
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-354bc7c2c46so2604790a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 Apr 2026 02:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776070840; x=1776675640; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HZLTA2wxeQJ1Gn74quGqLyBBER+2KkEx7pj+z4oFjKM=;
 b=RCFlhgvmqKiNrOHwrJqkmxcFWmJYv83xR6TizVf9pTIB0kGfi/LSSthJTB2+ZuB5Az
 +t9qh2yeNW1I2Ymm80drOs4ZP4abMmpwfSnDSRDaTRW3Jzis3lDVCUSqYhhJPafl57h8
 P48WuM7wJkmvJu4LkiVoCNZAdXX19/4iOisb3icOFVhbYJHTwWB7P8ae9+mY33sgDvyn
 P/YaO99NbJcKrctvN3V+Orv+rEYVbO6ZHhOrE25jefnwOSpvTe+302tte2bV8LvOTeLw
 Q1Qn6Bjrqcl8bUopRxrBdMCwSo/Up6Iel1bIFQyF1ZkCgKUq5xNFwFjBdlRDwCDShouM
 PXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776070840; x=1776675640;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HZLTA2wxeQJ1Gn74quGqLyBBER+2KkEx7pj+z4oFjKM=;
 b=IuistASJspaXvdHL3HqV85Qxgg5OeHRyVqFvDp8aejDReylMyYTKBfk/u0DJ4atL06
 B6tegmj688CzUdRHprdMi59huhD/IaiEjQrcBtZzn4iBVvkLgx6XqAWw8sY/Gb1M0ZYq
 51fRLfg65M+Sx0xKiFnuOdMYNF1+vpEAOAJ2gRmx6ctsmBldof+32i2zZsJHvwaHVxG0
 DLpw/0L3nOuXxF0aXg+eZbvrQJCmawbs0nifjMcQNsrf7YeUgjgp1/uXDjoHQYUXWANg
 SvElgzklS3bO3XdoQN7cn/zYRIrPzSjQL4/F5j+j+dCT+wlSufMYKbBXoptXmH9I+8Wt
 7GQg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8+y0Vszch2PRJ9wpuQcJvMEpt7k64weSHt/WdyyLHJSSBl3ZlLLkrV8QkD2AFCYbuccMksbhwG72T8M8TVeLnc@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzMb49q5hmlaRMOQXY79jKm/QnCHPMafvWMyN80J8FQm1ih0y/F
 IDDpxFRN2xWyvCVU6PgfyqzJJuIoDMAi3GBL8lhRGUNFSXsUZ3R2n+z4
X-Gm-Gg: AeBDies9UQbjRZXvKI1WnjAQYUspO60ecpqa0bpGMQszEy7LQ3YHsfT8bmRS6YDKbpB
 fA/J3Nc1lFKd5Lvm1oDBJzbnR0vkiojSUb2GvCQbZYfCI+9c2058VM3LjYvwYS1b0s2Zwq/wyZ0
 Xrwr52GqSNobjz9pTqHm0h+c6KQmiPWLJu8TDaI1GsDbLccLkM0mrePtLNlnJg11RKGGJL1EZHr
 P9K8+VlLaXBRfytnZT8iWlcGjbmZMeBXDdZAn3t914iWuxR9AiKFx5ZmUWA/rnH1ovqlHahbDwm
 5H7N6BsgdwQ7hEyvo1TXklu9zbsGTtz5QAenGZjGYq3bTGbiaDjNnxWDSx+6++B7ZKhbChKN0Pb
 Snt28YBu1XQJCLjEGowHlMmxhCzsIBVim8+tTe0g4zf8JH0reIxJxIwLh3WrU+nuscRYJ2HVLC/
 0Bc40MdRMiq72io+cN2cdfQaX3C2kLOeaspb/o066rwWScgxINmuuQTCumnZCj/95n0iCP
X-Received: by 2002:a17:90b:3950:b0:35b:e4f8:7cc5 with SMTP id
 98e67ed59e1d1-35e4284c7e0mr12151201a91.25.1776070840094; 
 Mon, 13 Apr 2026 02:00:40 -0700 (PDT)
Received: from ?IPV6:2408:8607:1b00:8:dbf3:8a76:6140:2c95?
 ([2408:8607:1b00:8:dbf3:8a76:6140:2c95])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35e4122314dsm11592069a91.6.2026.04.13.02.00.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2026 02:00:39 -0700 (PDT)
Message-ID: <0b221a6c-eb89-4d86-b8ea-4169f6c66b08@gmail.com>
Date: Mon, 13 Apr 2026 17:00:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: jaegeuk@kernel.org
References: <20260402114559.2030042-1-jinbaoliu365@gmail.com>
Content-Language: en-US
From: liujinbao1 <jinbaoliu365@gmail.com>
In-Reply-To: <20260402114559.2030042-1-jinbaoliu365@gmail.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  ping 在 2026/4/2 19:45, liujinbao1 写道: > From: liujinbao1
    > > Add trace_f2fs_fault_report to trigger reporting upon f2fs_bug_on, >
   need_fsck, stop_checkpoint, and handle_eio. Since f2fs_bug_on and > [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [jinbaoliu365(at)gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [jinbaoliu365(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.216.53 listed in wl.mailspike.net]
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wCD9x-0004GG-SK
Subject: Re: [f2fs-dev] [PATCH] f2fs: Add trace_f2fs_fault_report
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
X-Spamd-Result: default: False [-0.91 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:liujinbao1@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jinbaoliu365@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
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
	FROM_NEQ_ENVFROM(0.00)[jinbaoliu365@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim,xiaomi.com:email]
X-Rspamd-Queue-Id: D223B3E972C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

cGluZwoK5ZyoIDIwMjYvNC8yIDE5OjQ1LCBsaXVqaW5iYW8xIOWGmemBkzoKPiBGcm9tOiBsaXVq
aW5iYW8xIDxsaXVqaW5iYW8xQHhpYW9taS5jb20+Cj4KPiBBZGQgdHJhY2VfZjJmc19mYXVsdF9y
ZXBvcnQgdG8gdHJpZ2dlciByZXBvcnRpbmcgdXBvbiBmMmZzX2J1Z19vbiwKPiBuZWVkX2ZzY2ss
IHN0b3BfY2hlY2twb2ludCwgYW5kIGhhbmRsZV9laW8uIFNpbmNlIGYyZnNfYnVnX29uIGFuZAo+
IG5lZWRfZnNjayBjYW4gYmUgdHJpZ2dlcmVkIGluIGh1bmRyZWRzIG9mIHNjZW5hcmlvcywgZGVm
aW5lIHNldF9zYmlfZmxhZwo+IGFzIGEgbWFjcm8gdG8gaGVscCBjYXB0dXJlIHRoZSBlZmZlY3Rp
dmUgZmF1bHQgZnVuY3Rpb24gYW5kIGxpbmUgbnVtYmVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogbGl1
amluYmFvMSA8bGl1amluYmFvMUB4aWFvbWkuY29tPgo+IC0tLQo+ICAgZnMvZjJmcy9jaGVja3Bv
aW50LmMgICAgICAgIHwgMTAgKysrKysrKysrKwo+ICAgZnMvZjJmcy9mMmZzLmggICAgICAgICAg
ICAgIHwgMjAgKysrKysrKysrKysrKysrKysrKy0KPiAgIGluY2x1ZGUvdHJhY2UvZXZlbnRzL2Yy
ZnMuaCB8IDIyICsrKysrKysrKysrKysrKysrKysrKysKPiAgIDMgZmlsZXMgY2hhbmdlZCwgNTEg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvY2hl
Y2twb2ludC5jIGIvZnMvZjJmcy9jaGVja3BvaW50LmMKPiBpbmRleCA2ZGQzOWI3ZGUxMWEuLjY5
ODU0MGMwZjYxOSAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL2NoZWNrcG9pbnQuYwo+ICsrKyBiL2Zz
L2YyZnMvY2hlY2twb2ludC5jCj4gQEAgLTI0LDYgKzI0LDggQEAKPiAgICNpbmNsdWRlICJpb3N0
YXQuaCIKPiAgICNpbmNsdWRlIDx0cmFjZS9ldmVudHMvZjJmcy5oPgo+ICAgCj4gK0VYUE9SVF9U
UkFDRVBPSU5UX1NZTUJPTF9HUEwoZjJmc19mYXVsdF9yZXBvcnQpOwo+ICsKPiAgIHN0YXRpYyBp
bmxpbmUgdm9pZCBnZXRfbG9ja19lbGFwc2VkX3RpbWUoc3RydWN0IGYyZnNfdGltZV9zdGF0ICp0
cykKPiAgIHsKPiAgIAl0cy0+dG90YWxfdGltZSA9IGt0aW1lX2dldCgpOwo+IEBAIC0yMzIsOSAr
MjM0LDE3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBmMmZzX3VubG9ja19hbGwoc3RydWN0IGYyZnNf
c2JfaW5mbyAqc2JpKQo+ICAgc3RhdGljIHN0cnVjdCBrbWVtX2NhY2hlICppbm9fZW50cnlfc2xh
YjsKPiAgIHN0cnVjdCBrbWVtX2NhY2hlICpmMmZzX2lub2RlX2VudHJ5X3NsYWI7Cj4gICAKPiAr
dm9pZCBmMmZzX2ZhdWx0X3JlcG9ydCh1bnNpZ25lZCBpbnQgZXJyX2NvZGUsIGNvbnN0IGNoYXIg
KmZ1bmMsIHVuc2lnbmVkIGludCBkYXRhKQo+ICt7Cj4gKwl0cmFjZV9mMmZzX2ZhdWx0X3JlcG9y
dChlcnJfY29kZSwgZnVuYywgZGF0YSk7Cj4gK30KPiArCj4gICB2b2lkIGYyZnNfc3RvcF9jaGVj
a3BvaW50KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYm9vbCBlbmRfaW8sCj4gICAJCQkJCQl1
bnNpZ25lZCBjaGFyIHJlYXNvbikKPiAgIHsKPiArCWlmIChyZWFzb24gIT0gU1RPUF9DUF9SRUFT
T05fU0hVVERPV04pCj4gKwkJZjJmc19mYXVsdF9yZXBvcnQoUkVQT1JUX0ZBVUxUX1NUT1BfQ1As
IF9fZnVuY19fLCByZWFzb24pOwo+ICsKPiAgIAlmMmZzX2J1aWxkX2ZhdWx0X2F0dHIoc2JpLCAw
LCAwLCBGQVVMVF9BTEwpOwo+ICAgCWlmICghZW5kX2lvKQo+ICAgCQlmMmZzX2ZsdXNoX21lcmdl
ZF93cml0ZXMoc2JpKTsKPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2Yy
ZnMuaAo+IGluZGV4IGJiMzRlODY0ZDBlZi4uYWMyZmE0YjZiZDM3IDEwMDY0NAo+IC0tLSBhL2Zz
L2YyZnMvZjJmcy5oCj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPiBAQCAtOTcsNiArOTcsMTUgQEAg
ZXh0ZXJuIGNvbnN0IGNoYXIgKmYyZnNfZmF1bHRfbmFtZVtGQVVMVF9NQVhdOwo+ICAgI2RlZmlu
ZSBERUZBVUxUX0ZBSUxVUkVfUkVUUllfQ09VTlQJCTEKPiAgICNlbmRpZgo+ICAgCj4gK2VudW0g
ewo+ICsJUkVQT1JUX0ZBVUxUX05FRURfRlNDSywKPiArCVJFUE9SVF9GQVVMVF9QQUdFX0VJTywK
PiArCVJFUE9SVF9GQVVMVF9TVE9QX0NQLAo+ICsJUkVQT1JUX0ZBVUxUX01BWCwKPiArfTsKPiAr
Cj4gK3ZvaWQgZjJmc19mYXVsdF9yZXBvcnQodW5zaWduZWQgaW50IGVycl9jb2RlLCBjb25zdCBj
aGFyICpmdW5jLCB1bnNpZ25lZCBpbnQgZGF0YSk7Cj4gKwo+ICAgLyoKPiAgICAqIEZvciBtb3Vu
dCBvcHRpb25zCj4gICAgKi8KPiBAQCAtMjI3NSwxMSArMjI4NCwxOCBAQCBzdGF0aWMgaW5saW5l
IGJvb2wgaXNfc2JpX2ZsYWdfc2V0KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgdW5zaWduZWQg
aW50IHR5cGUpCj4gICAJcmV0dXJuIHRlc3RfYml0KHR5cGUsICZzYmktPnNfZmxhZyk7Cj4gICB9
Cj4gICAKPiAtc3RhdGljIGlubGluZSB2b2lkIHNldF9zYmlfZmxhZyhzdHJ1Y3QgZjJmc19zYl9p
bmZvICpzYmksIHVuc2lnbmVkIGludCB0eXBlKQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgX19zZXRf
c2JpX2ZsYWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCB1bnNpZ25lZCBpbnQgdHlwZSkKPiAg
IHsKPiAgIAlzZXRfYml0KHR5cGUsICZzYmktPnNfZmxhZyk7Cj4gICB9Cj4gICAKPiArI2RlZmlu
ZSBzZXRfc2JpX2ZsYWcoc2JpLCB0eXBlKQkJCQlcCj4gK2RvIHsJCQkJCQkJXAo+ICsJX19zZXRf
c2JpX2ZsYWcoc2JpLCB0eXBlKTsJCQlcCj4gKwlpZiAoKHR5cGUpID09IFNCSV9ORUVEX0ZTQ0sp
CQkJXAo+ICsJCWYyZnNfZmF1bHRfcmVwb3J0KFJFUE9SVF9GQVVMVF9ORUVEX0ZTQ0ssIF9fZnVu
Y19fLCBfX0xJTkVfXyk7CVwKPiArfSB3aGlsZSAoMCkKPiArCj4gICBzdGF0aWMgaW5saW5lIHZv
aWQgY2xlYXJfc2JpX2ZsYWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCB1bnNpZ25lZCBpbnQg
dHlwZSkKPiAgIHsKPiAgIAljbGVhcl9iaXQodHlwZSwgJnNiaS0+c19mbGFnKTsKPiBAQCAtNTA2
NCw2ICs1MDgwLDggQEAgc3RhdGljIGlubGluZSB2b2lkIGYyZnNfaGFuZGxlX3BhZ2VfZWlvKHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiAgIAlpZiAodW5saWtlbHkoZjJmc19jcF9lcnJvcihz
YmkpKSkKPiAgIAkJcmV0dXJuOwo+ICAgCj4gKwlmMmZzX2ZhdWx0X3JlcG9ydChSRVBPUlRfRkFV
TFRfUEFHRV9FSU8sIF9fZnVuY19fLCB0eXBlKTsKPiArCj4gICAJaWYgKG9mcyA9PSBzYmktPnBh
Z2VfZWlvX29mc1t0eXBlXSkgewo+ICAgCQlpZiAoc2JpLT5wYWdlX2Vpb19jbnRbdHlwZV0rKyA9
PSBNQVhfUkVUUllfUEFHRV9FSU8pCj4gICAJCQlzZXRfY2twdF9mbGFncyhzYmksIENQX0VSUk9S
X0ZMQUcpOwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3RyYWNlL2V2ZW50cy9mMmZzLmggYi9pbmNs
dWRlL3RyYWNlL2V2ZW50cy9mMmZzLmgKPiBpbmRleCA5MzY0ZTY3NzU1NjIuLjAzOWM2OTVjNDVh
OCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3RyYWNlL2V2ZW50cy9mMmZzLmgKPiArKysgYi9pbmNs
dWRlL3RyYWNlL2V2ZW50cy9mMmZzLmgKPiBAQCAtMjU4Miw2ICsyNTgyLDI4IEBAIERFRklORV9F
VkVOVChmMmZzX3ByaW9yaXR5X3VwZGF0ZSwgZjJmc19wcmlvcml0eV9yZXN0b3JlLAo+ICAgCVRQ
X0FSR1Moc2JpLCBsb2NrX25hbWUsIGlzX3dyaXRlLCBwLCBvcmlnX3ByaW8sIG5ld19wcmlvKQo+
ICAgKTsKPiAgIAo+ICtUUkFDRV9FVkVOVChmMmZzX2ZhdWx0X3JlcG9ydCwKPiArCj4gKwlUUF9Q
Uk9UTyh1bnNpZ25lZCBpbnQgZXJyX2NvZGUsIGNvbnN0IGNoYXIgKmZ1bmMsIHVuc2lnbmVkIGlu
dCBkYXRhKSwKPiArCj4gKwlUUF9BUkdTKGVycl9jb2RlLCBmdW5jLCBkYXRhKSwKPiArCj4gKwlU
UF9TVFJVQ1RfX2VudHJ5KAo+ICsJCV9fZmllbGQodW5zaWduZWQgaW50LCBlcnJfY29kZSkKPiAr
CQlfX3N0cmluZyhmdW5jLCBmdW5jKQo+ICsJCV9fZmllbGQodW5zaWduZWQgaW50LCBkYXRhKQo+
ICsJKSwKPiArCj4gKwlUUF9mYXN0X2Fzc2lnbigKPiArCQlfX2VudHJ5LT5lcnJfY29kZSA9IGVy
cl9jb2RlOwo+ICsJCV9fYXNzaWduX3N0cihmdW5jLCBmdW5jKTsKPiArCQlfX2VudHJ5LT5kYXRh
ID0gZGF0YTsKPiArCSksCj4gKwo+ICsJVFBfcHJpbnRrKCJlcnJfY29kZT0ldSBmdW5jPSVzIGRh
dGE9JXUiLAo+ICsJCV9fZW50cnktPmVycl9jb2RlLCBfX2dldF9zdHIoZnVuYyksIF9fZW50cnkt
PmRhdGEpCj4gKyk7Cj4gKwo+ICAgI2VuZGlmIC8qIF9UUkFDRV9GMkZTX0ggKi8KPiAgIAo+ICAg
IC8qIFRoaXMgcGFydCBtdXN0IGJlIG91dHNpZGUgcHJvdGVjdGlvbiAqLwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
