Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAvDGpB98WkOhQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Apr 2026 05:40:00 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E37D48EB32
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Apr 2026 05:39:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxE40iVo6m5Lf/Ghvv2XlW7RANQax3BWucje5+rcI30=; b=V12xNXv4fn95L2PmZEHurle/GJ
	r6+RkA/Um1/Llegewz7lz4ELNQayjakw0cV52Fg4im2jG2eaCCbSE2MKLRO7UDdGaG17UEqe+46op
	X0pA8tSF/O1PcTjjHYQtld0DamZ/3ztihBtry50/tqzC5YGRUL+LP3XCdQoNsgY6S5aY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wHvm6-0001aD-I4;
	Wed, 29 Apr 2026 03:39:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ruipengqi3@gmail.com>) id 1wHvm5-0001a5-5D
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Apr 2026 03:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G0kp7XTeDN8xQUCoZ7CCLc1Wu3tREkWK892pDwsUIm4=; b=lzzk2UiTokpnM/jOGl1eHFQROZ
 w3fCUnb8NLIpakBEPOVbhzAEtJFUh+kWRul+53OERewxIBHYnV/aC9FfPqxiyXay/hAdcbIBZgswp
 otbmkWs+/1quSFJnNkUZaNQSv/6p5ZK9tjTpeIAJtGvhHWEiYZvFeMnKlw/NLX34yaBI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G0kp7XTeDN8xQUCoZ7CCLc1Wu3tREkWK892pDwsUIm4=; b=NBPG2G0MnqUN62kByYyvhH8ZUa
 GjZ/YMCtTdu7czq0XdzUHA9yKBy9QtevDqRfxptZhPJn23ssQ/hOHaavcR/cfttLfWmp7RyNcOwzb
 yRgX2hx/V0grwhhKLGc/r5neRcSGo8aOCzap8k6aY6cBNbz1bE/3Nn3Hp1/7iRcRkCcw=;
Received: from mail-pl1-f174.google.com ([209.85.214.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wHvm4-0003eF-7s for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Apr 2026 03:39:44 +0000
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2a8fba3f769so54461145ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 28 Apr 2026 20:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777433973; x=1778038773; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G0kp7XTeDN8xQUCoZ7CCLc1Wu3tREkWK892pDwsUIm4=;
 b=sosXWBI2shfZVmrnv6kUy5rKuHfUAlCJ3DdR/u0AdUv89RBor6jU1Fct+xMLQ1TCRb
 UYNaKltuM7rZ47OVuexLq6iSp9s20AitINZCYlVt6dk2v4kBlISbRLeCmlHiOkz3XE7M
 sJrnAtrVDPA1XOQ12MICRuIuXwSzj5vplMcvZ7TKQiZpxBsrwFr9EwxUitEhYN8vMs92
 AHhcaLyh1lLNGBiWeSmoyqi+DJ6w5K7MWWXLryS74k3smuT7tbIULjDxxrPRDAXJSVoT
 ISnY3YcJVqYdcOxi4x9Uj+Pj40Rt01piwO/1KRpxZpvz6wc8pF03/dqn33oyql94haOX
 8SiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777433973; x=1778038773;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G0kp7XTeDN8xQUCoZ7CCLc1Wu3tREkWK892pDwsUIm4=;
 b=jJ+Gi0hpIO8+85yUF82CY3IMiNdekLGiDj9Z9jRjONLCYj3CzogFUcqAkbLXXbFAq8
 Sh5oPEq2k8cYiiHfmBLFNV+hFxCHRrxZw5bywhae0h7SXWI9Pna7zkeXpN/GzhjlbSfK
 /fOTtI1qJunzWnm+m6Jubp+zRkKdir9vEfIzx652CUkCBNdQ/3UmBJAh++P9Nvf+QAD1
 07lBoJjdrN2fhvM2E1s8K6vJ6mo3DpThX+ditDy+dHWt7oHxfA9uTGBbvMrUQtOvJOpi
 4aHF0p1RyGw1V86QBY/uNL36KtcTldxpVXMtHDuTZC67boZAsJm+a3U72FMsvpSOSNXw
 jkuA==
X-Gm-Message-State: AOJu0Yyop8jGtwV4+fDJ1YkiF9S8tFG9lbLNGgBgMyMlkvVlV7nHg8sN
 at1tgpXHsnwJ4zZ+hyHYC6Sz88aMyuDAJVPq5wsUnvraN9N+aiRrxPVN
X-Gm-Gg: AeBDieu5E8HR7SGhcscjbC1OEq6memsvuW+bmUjhZr3HLBuyWQe9T1uS4I1WITvAsgO
 sWh6Ni4s8dwVvnORp8vyR7p0XF3gYn/quIaCojrJvCIcXm7XHIUM/xWF5pyTwb+/zLxSGnI2r43
 6KcEt0wmc6ybgF5Ou33iyLUXvXFLOZ1gbEzTliYbXaJvejlo7J5K00s5rgklqntK+Uo4QJpc7an
 7aegzryMA1Yb88JaXEOuqMJfTDlKwcpwAu2RVPPhbpg3hd/qmDzYAZnQRcKvnTzGDf8QUZIW6E3
 OR0hHu4rKGc57kb1AkZ4o4qSMCWVvXT6+Dh5mTxRDWTG1vNj6oM5Vvp5bM3bl+5vPd6G3BmOkf9
 WWRpAmm9E+V7R45MrOnZAnT25ciYnGOuyXPBAcE8RoRPcrj3ilVpMY3nxvTr/qjGxrhypkE+P14
 KSLyHiWVSRK6xT6bW1IbQ2tZxI6pi4TMFlNX8TDxoqRrUpOUgw
X-Received: by 2002:a17:903:44a:b0:2b4:5b9e:4edd with SMTP id
 d9443c01a7336-2b97c403be5mr43587725ad.9.1777433973359; 
 Tue, 28 Apr 2026 20:39:33 -0700 (PDT)
Received: from [10.121.80.58] ([210.184.73.204])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b98895a919sm6452085ad.55.2026.04.28.20.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Apr 2026 20:39:32 -0700 (PDT)
Message-ID: <70254f4c-80ce-4c53-ba60-be023d0cd6fc@gmail.com>
Date: Wed, 29 Apr 2026 11:39:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <20260426093239.165767-1-ruipengqi3@gmail.com>
 <d799ebe3-cbdb-4abf-8667-8ef8b112b48a@kernel.org>
Content-Language: en-US
From: Ruipeng Qi <ruipengqi3@gmail.com>
In-Reply-To: <d799ebe3-cbdb-4abf-8667-8ef8b112b48a@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/4/27 16:38, Chao Yu wrote: > On 4/26/26 17:32,
 ruipengqi
 wrote: >> From: Ruipeng Qi >> >> When the f2fs filesystem space is nearly
 exhausted, we encounter >> deadlock >> issues as below: >> [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ruipengqi3(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [ruipengqi3(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.174 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wHvm4-0003eF-7s
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
X-Rspamd-Queue-Id: 4E37D48EB32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.91 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ruipengqi3@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruipengqi3@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[]

Ck9uIDIwMjYvNC8yNyAxNjozOCwgQ2hhbyBZdSB3cm90ZToKPiBPbiA0LzI2LzI2IDE3OjMyLCBy
dWlwZW5ncWkgd3JvdGU6Cj4+IEZyb206IFJ1aXBlbmcgUWkgPHJ1aXBlbmdxaTNAZ21haWwuY29t
Pgo+Pgo+PiBXaGVuIHRoZSBmMmZzIGZpbGVzeXN0ZW0gc3BhY2UgaXMgbmVhcmx5IGV4aGF1c3Rl
ZCwgd2UgZW5jb3VudGVyIAo+PiBkZWFkbG9jawo+PiBpc3N1ZXMgYXMgYmVsb3c6Cj4+Cj4+IElO
Rk86IHRhc2sgQToxODkwIGJsb2NrZWQgZm9yIG1vcmUgdGhhbiAxMjAgc2Vjb25kcy4KPj4gwqDC
oMKgwqDCoMKgIFRhaW50ZWQ6IEfCoMKgwqDCoMKgwqDCoMKgwqDCoCBPwqDCoMKgwqDCoMKgIDYu
MTIuNDEtZzNmZTA3ZGRmMDVhYiAjMQo+PiAiZWNobyAwID4gL3Byb2Mvc3lzL2tlcm5lbC9odW5n
X3Rhc2tfdGltZW91dF9zZWNzIiBkaXNhYmxlcyB0aGlzIAo+PiBtZXNzYWdlLgo+PiB0YXNrOkHC
oMKgwqAgc3RhdGU6RCBzdGFjazowwqDCoMKgwqAgcGlkOjE4OTDCoCB0Z2lkOjE2MjbCoCBwcGlk
OjExNTMgCj4+IGZsYWdzOjB4MDAwMDAyMDQKPj4gQ2FsbCB0cmFjZToKPj4gwqAgX19zd2l0Y2hf
dG8rMHhmNC8weDE1OAo+PiDCoCBfX3NjaGVkdWxlKzB4MjdjLzB4OTA4Cj4+IMKgIHNjaGVkdWxl
KzB4M2MvMHgxMTgKPj4gwqAgaW9fc2NoZWR1bGUrMHg0NC8weDY4Cj4+IMKgIGZvbGlvX3dhaXRf
Yml0X2NvbW1vbisweDE3NC8weDM3MAo+PiDCoCBmb2xpb193YWl0X2JpdCsweDIwLzB4MzgKPj4g
wqAgZm9saW9fd2FpdF93cml0ZWJhY2srMHg1NC8weGM4Cj4+IMKgIHRydW5jYXRlX2lub2RlX3Bh
cnRpYWxfZm9saW8rMHg3MC8weDFlMAo+PiDCoCB0cnVuY2F0ZV9pbm9kZV9wYWdlc19yYW5nZSsw
eDFiMC8weDQ1MAo+PiDCoCB0cnVuY2F0ZV9wYWdlY2FjaGUrMHg1NC8weDg4Cj4+IMKgIGYyZnNf
ZmlsZV93cml0ZV9pdGVyKzB4M2U4LzB4YjgwCj4+IMKgIGRvX2l0ZXJfcmVhZHZfd3JpdGV2KzB4
ZjAvMHgxZTAKPj4gwqAgdmZzX3dyaXRldisweDEzOC8weDJjOAo+PiDCoCBkb193cml0ZXYrMHg4
OC8weDEzMAo+PiDCoCBfX2FybTY0X3N5c193cml0ZXYrMHgyOC8weDQwCj4+IMKgIGludm9rZV9z
eXNjYWxsKzB4NTAvMHgxMjAKPj4gwqAgZWwwX3N2Y19jb21tb24uY29uc3Rwcm9wLjArMHhjOC8w
eGYwCj4+IMKgIGRvX2VsMF9zdmMrMHgyNC8weDM4Cj4+IMKgIGVsMF9zdmMrMHgzMC8weGY4Cj4+
IMKgIGVsMHRfNjRfc3luY19oYW5kbGVyKzB4MTIwLzB4MTMwCj4+IMKgIGVsMHRfNjRfc3luYysw
eDE5MC8weDE5OAo+Pgo+PiBJTkZPOiB0YXNrIGt3b3JrZXIvdTg6MTE6MjY4MDg1MyBibG9ja2Vk
IGZvciBtb3JlIHRoYW4gMTIwIHNlY29uZHMuCj4+IMKgwqDCoMKgwqDCoCBUYWludGVkOiBHwqDC
oMKgwqDCoMKgwqDCoMKgwqAgT8KgwqDCoMKgwqDCoCA2LjEyLjQxLWczZmUwN2RkZjA1YWIgIzEK
Pj4gImVjaG8gMCA+IC9wcm9jL3N5cy9rZXJuZWwvaHVuZ190YXNrX3RpbWVvdXRfc2VjcyIgZGlz
YWJsZXMgdGhpcyAKPj4gbWVzc2FnZS4KPj4gdGFzazprd29ya2VyL3U4OjExwqDCoCBzdGF0ZTpE
IHN0YWNrOjDCoMKgwqDCoCBwaWQ6MjY4MDg1MyB0Z2lkOjI2ODA4NTMgCj4+IHBwaWQ6MsKgwqDC
oMKgwqAgZmxhZ3M6MHgwMDAwMDIwOAo+PiBXb3JrcXVldWU6IHdyaXRlYmFjayB3Yl93b3JrZm4g
KGZsdXNoLTI1NDowKQo+PiBDYWxsIHRyYWNlOgo+PiDCoCBfX3N3aXRjaF90bysweGY0LzB4MTU4
Cj4+IMKgIF9fc2NoZWR1bGUrMHgyN2MvMHg5MDgKPj4gwqAgc2NoZWR1bGUrMHgzYy8weDExOAo+
PiDCoCBpb19zY2hlZHVsZSsweDQ0LzB4NjgKPj4gwqAgZm9saW9fd2FpdF9iaXRfY29tbW9uKzB4
MTc0LzB4MzcwCj4+IMKgIF9fZmlsZW1hcF9nZXRfZm9saW8rMHgyMTQvMHgzNDgKPj4gwqAgcGFn
ZWNhY2hlX2dldF9wYWdlKzB4MjAvMHg3MAo+PiDCoCBmMmZzX2dldF9yZWFkX2RhdGFfcGFnZSsw
eDE1MC8weDNlOAo+PiDCoCBmMmZzX2dldF9sb2NrX2RhdGFfcGFnZSsweDJjLzB4MTYwCj4+IMKg
IG1vdmVfZGF0YV9wYWdlKzB4NTAvMHg0NzgKPj4gwqAgZG9fZ2FyYmFnZV9jb2xsZWN0KzB4ZDM4
LzB4MTUyOAo+PiDCoCBmMmZzX2djKzB4MjQwLzB4N2UwCj4+IMKgIGYyZnNfYmFsYW5jZV9mcysw
eDFhMC8weDIwOAo+PiDCoCBmMmZzX3dyaXRlX3NpbmdsZV9kYXRhX3BhZ2UrMHg2ZTQvMHg3MzDC
oCAvLzB4ZmZmZmZlMGQ2Y2EwODMwMAo+PiDCoCBmMmZzX3dyaXRlX2NhY2hlX3BhZ2VzKzB4Mzc4
LzB4OWIwCj4+IMKgIGYyZnNfd3JpdGVfZGF0YV9wYWdlcysweDJlNC8weDM4OAo+PiDCoCBkb193
cml0ZXBhZ2VzKzB4OGMvMHgyYzgKPj4gwqAgX193cml0ZWJhY2tfc2luZ2xlX2lub2RlKzB4NGMv
MHg0OTgKPj4gwqAgd3JpdGViYWNrX3NiX2lub2RlcysweDIzNC8weDRhOAo+PiDCoCBfX3dyaXRl
YmFja19pbm9kZXNfd2IrMHg1OC8weDExOAo+PiDCoCB3Yl93cml0ZWJhY2srMHgyZjgvMHgzYzAK
Pj4gwqAgd2Jfd29ya2ZuKzB4MmM0LzB4NTA4Cj4+IMKgIHByb2Nlc3Nfb25lX3dvcmsrMHgxODAv
MHg0MDgKPj4gwqAgd29ya2VyX3RocmVhZCsweDI1OC8weDM2OAo+PiDCoCBrdGhyZWFkKzB4MTE4
LzB4MTI4Cj4+IMKgIHJldF9mcm9tX2ZvcmsrMHgxMC8weDIwMAo+Pgo+PiBJTkZPOiB0YXNrIGt3
b3JrZXIvdTg6ODoyNjQxMjk3IGJsb2NrZWQgZm9yIG1vcmUgdGhhbiAxMjAgc2Vjb25kcy4KPj4g
wqDCoMKgwqDCoMKgIFRhaW50ZWQ6IEfCoMKgwqDCoMKgwqDCoMKgwqDCoCBPwqDCoMKgwqDCoMKg
IDYuMTIuNDEtZzNmZTA3ZGRmMDVhYiAjMQo+PiAiZWNobyAwID4gL3Byb2Mvc3lzL2tlcm5lbC9o
dW5nX3Rhc2tfdGltZW91dF9zZWNzIiBkaXNhYmxlcyB0aGlzIAo+PiBtZXNzYWdlLgo+PiB0YXNr
Omt3b3JrZXIvdTg6OMKgwqDCoCBzdGF0ZTpEIHN0YWNrOjDCoMKgwqDCoCBwaWQ6MjY0MTI5NyB0
Z2lkOjI2NDEyOTcgCj4+IHBwaWQ6MsKgwqDCoMKgwqAgZmxhZ3M6MHgwMDAwMDIwOAo+PiBXb3Jr
cXVldWU6IHdyaXRlYmFjayB3Yl93b3JrZm4gKGZsdXNoLTI1NDowKQo+PiBDYWxsIHRyYWNlOgo+
PiDCoCBfX3N3aXRjaF90bysweGY0LzB4MTU4Cj4+IMKgIF9fc2NoZWR1bGUrMHgyN2MvMHg5MDgK
Pj4gwqAgcnRfbXV0ZXhfc2NoZWR1bGUrMHgzMC8weDYwCj4+IMKgIF9fcnRfbXV0ZXhfc2xvd2xv
Y2tfbG9ja2VkLmNvbnN0cHJvcC4wKzB4NDYwLzB4OGE4Cj4+IMKgIHJ3YmFzZV93cml0ZV9sb2Nr
KzB4MjRjLzB4Mzc4Cj4+IMKgIGRvd25fd3JpdGUrMHgxYy8weDMwCj4+IMKgIGYyZnNfYmFsYW5j
ZV9mcysweDE4NC8weDIwOAo+PiDCoCBmMmZzX3dyaXRlX2lub2RlKzB4ZjQvMHgzMjgKPj4gwqAg
X193cml0ZWJhY2tfc2luZ2xlX2lub2RlKzB4MzcwLzB4NDk4Cj4+IMKgIHdyaXRlYmFja19zYl9p
bm9kZXMrMHgyMzQvMHg0YTgKPj4gwqAgX193cml0ZWJhY2tfaW5vZGVzX3diKzB4NTgvMHgxMTgK
Pj4gwqAgd2Jfd3JpdGViYWNrKzB4MmY4LzB4M2MwCj4+IMKgIHdiX3dvcmtmbisweDJjNC8weDUw
OAo+PiDCoCBwcm9jZXNzX29uZV93b3JrKzB4MTgwLzB4NDA4Cj4+IMKgIHdvcmtlcl90aHJlYWQr
MHgyNTgvMHgzNjgKPj4gwqAga3RocmVhZCsweDExOC8weDEyOAo+PiDCoCByZXRfZnJvbV9mb3Jr
KzB4MTAvMHgyMAo+Pgo+PiBJTkZPOiB0YXNrIEI6MTkwMiBibG9ja2VkIGZvciBtb3JlIHRoYW4g
MTIwIHNlY29uZHMuCj4+IMKgwqDCoMKgwqDCoCBUYWludGVkOiBHwqDCoMKgwqDCoMKgwqDCoMKg
wqAgT8KgwqDCoMKgwqDCoCA2LjEyLjQxLWczZmUwN2RkZjA1YWIgIzEKPj4gImVjaG8gMCA+IC9w
cm9jL3N5cy9rZXJuZWwvaHVuZ190YXNrX3RpbWVvdXRfc2VjcyIgZGlzYWJsZXMgdGhpcyAKPj4g
bWVzc2FnZS4KPj4gdGFzazpCwqDCoMKgwqAgc3RhdGU6RCBzdGFjazowwqDCoMKgwqAgcGlkOjE5
MDLCoCB0Z2lkOjE2MjbCoCBwcGlkOjExNTMgCj4+IGZsYWdzOjB4MDAwMDAyMGMKPj4gQ2FsbCB0
cmFjZToKPj4gwqAgX19zd2l0Y2hfdG8rMHhmNC8weDE1OAo+PiDCoCBfX3NjaGVkdWxlKzB4Mjdj
LzB4OTA4Cj4+IMKgIHJ0X211dGV4X3NjaGVkdWxlKzB4MzAvMHg2MAo+PiDCoCBfX3J0X211dGV4
X3Nsb3dsb2NrX2xvY2tlZC5jb25zdHByb3AuMCsweDQ2MC8weDhhOAo+PiDCoCByd2Jhc2Vfd3Jp
dGVfbG9jaysweDI0Yy8weDM3OAo+PiDCoCBkb3duX3dyaXRlKzB4MWMvMHgzMAo+PiDCoCBmMmZz
X2JhbGFuY2VfZnMrMHgxODQvMHgyMDgKPj4gwqAgZjJmc19tYXBfYmxvY2tzKzB4OTRjLzB4MTEx
MAo+PiDCoCBmMmZzX2ZpbGVfd3JpdGVfaXRlcisweDIyOC8weGI4MAo+PiDCoCBkb19pdGVyX3Jl
YWR2X3dyaXRldisweGYwLzB4MWUwCj4+IMKgIHZmc193cml0ZXYrMHgxMzgvMHgyYzgKPj4gwqAg
ZG9fd3JpdGV2KzB4ODgvMHgxMzAKPj4gwqAgX19hcm02NF9zeXNfd3JpdGV2KzB4MjgvMHg0MAo+
PiDCoCBpbnZva2Vfc3lzY2FsbCsweDUwLzB4MTIwCj4+IMKgIGVsMF9zdmNfY29tbW9uLmNvbnN0
cHJvcC4wKzB4YzgvMHhmMAo+PiDCoCBkb19lbDBfc3ZjKzB4MjQvMHgzOAo+PiDCoCBlbDBfc3Zj
KzB4MzAvMHhmOAo+PiDCoCBlbDB0XzY0X3N5bmNfaGFuZGxlcisweDEyMC8weDEzMAo+PiDCoCBl
bDB0XzY0X3N5bmMrMHgxOTAvMHgxOTgKPj4KPj4gSU5GTzogdGFzayBzeW5jOjI3Njk4NDkgYmxv
Y2tlZCBmb3IgbW9yZSB0aGFuIDEyMCBzZWNvbmRzLgo+PiDCoMKgwqDCoMKgwqAgVGFpbnRlZDog
R8KgwqDCoMKgwqDCoMKgwqDCoMKgIE/CoMKgwqDCoMKgwqAgNi4xMi40MS1nM2ZlMDdkZGYwNWFi
ICMxCj4+ICJlY2hvIDAgPiAvcHJvYy9zeXMva2VybmVsL2h1bmdfdGFza190aW1lb3V0X3NlY3Mi
IGRpc2FibGVzIHRoaXMgCj4+IG1lc3NhZ2UuCj4+IHRhc2s6c3luY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3RhdGU6RCBzdGFjazowwqDCoMKgwqAgcGlkOjI3Njk4NDkgdGdpZDoyNzY5ODQ5IAo+
PiBwcGlkOjczNsKgwqDCoCBmbGFnczoweDAwMDAwMjBjCj4+IENhbGwgdHJhY2U6Cj4+IMKgIF9f
c3dpdGNoX3RvKzB4ZjQvMHgxNTgKPj4gwqAgX19zY2hlZHVsZSsweDI3Yy8weDkwOAo+PiDCoCBz
Y2hlZHVsZSsweDNjLzB4MTE4Cj4+IMKgIHdiX3dhaXRfZm9yX2NvbXBsZXRpb24rMHhiMC8weGU4
Cj4+IMKgIHN5bmNfaW5vZGVzX3NiKzB4YzgvMHgyYjAKPj4gwqAgc3luY19pbm9kZXNfb25lX3Ni
KzB4MjQvMHgzOAo+PiDCoCBpdGVyYXRlX3N1cGVycysweGE4LzB4MTM4Cj4+IMKgIGtzeXNfc3lu
YysweDU0LzB4YzgKPj4gwqAgX19hcm02NF9zeXNfc3luYysweDE4LzB4MzAKPj4gwqAgaW52b2tl
X3N5c2NhbGwrMHg1MC8weDEyMAo+PiDCoCBlbDBfc3ZjX2NvbW1vbi5jb25zdHByb3AuMCsweGM4
LzB4ZjAKPj4gwqAgZG9fZWwwX3N2YysweDI0LzB4MzgKPj4gwqAgZWwwX3N2YysweDMwLzB4ZjgK
Pj4gwqAgZWwwdF82NF9zeW5jX2hhbmRsZXIrMHgxMjAvMHgxMzAKPj4gwqAgZWwwdF82NF9zeW5j
KzB4MTkwLzB4MTk4Cj4+Cj4+IFRoZSByb290IGNhdXNlIGlzIGEgcG90ZW50aWFsIGRlYWRsb2Nr
IGJldHdlZW4gdGhlIGZvbGxvd2luZyB0YXNrczoKPj4KPj4ga3dvcmtlci91ODoxMcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUaHJlYWQgQQo+PiAtIGYyZnNfd3JpdGVfc2luZ2xlX2Rh
dGFfcGFnZQo+PiDCoCAtIGYyZnNfZG9fd3JpdGVfZGF0YV9wYWdlCj4+IMKgwqAgLSBmb2xpb19z
dGFydF93cml0ZWJhY2soWCkKPj4gwqDCoCAtIGYyZnNfb3V0cGxhY2Vfd3JpdGVfZGF0YQo+PiDC
oMKgwqAgLSBiaW9fYWRkX2ZvbGlvKFgpCj4+IMKgIC0gZm9saW9fdW5sb2NrKFgpCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gdHJ1bmNhdGVfaW5vZGVfcGFnZXNf
cmFuZ2UKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIF9fZmls
ZW1hcF9nZXRfZm9saW8oWCwgRkdQX0xPQ0spCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgLSB0cnVuY2F0ZV9pbm9kZV9wYXJ0aWFsX2ZvbGlvKFgpCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGZvbGlvX3dhaXRfd3JpdGVi
YWNrKFgpCj4+IMKgIC0gZjJmc19iYWxhbmNlX2ZzCj4+IMKgwqAgLSBmMmZzX2djCj4+IMKgwqDC
oCAtIGRvX2dhcmJhZ2VfY29sbGVjdAo+PiDCoMKgwqDCoCAtIG1vdmVfZGF0YV9wYWdlCj4+IMKg
wqDCoMKgwqAgLSBmMmZzX2dldF9sb2NrX2RhdGFfcGFnZQo+PiDCoMKgwqDCoMKgwqAgLSBfX2Zp
bGVtYXBfZ2V0X2ZvbGlvKFgsIEZHUF9MT0NLKQo+Pgo+PiBCb3RoIHRocmVhZHMgdHJ5IHRvIGFj
Y2VzcyBmb2xpbyBYLiBUaHJlYWQgQSBob2xkcyB0aGUgbG9jayBidXQgd2FpdHMKPj4gZm9yIHdy
aXRlYmFjaywgd2hpbGUga3dvcmtlciB3YWl0cyBmb3IgdGhlIGxvY2suIFRoaXMgY2F1c2VzIGEg
ZGVhZGxvY2suCj4+Cj4+IE90aGVyIHRocmVhZHMgYWxzbyBlbnRlciBEIHN0YXRlLCB3YWl0aW5n
IGZvciBsb2NrcyBzdWNoIGFzIGdjX2xvY2sgYW5kCj4+IHdyaXRlcGFnZXMuCj4+Cj4+IE9QVS9J
UFUgREFUQSBmb2xpbyBhcmUgYWxsIGFmZmVjdGVkIGJ5IHRoaXMgaXNzdWUuIFRvIGF2b2lkIHN1
Y2gKPj4gcG90ZW50aWFsIGRlYWRsb2NrcywgYWx3YXlzIGNvbW1pdCB0aGVzZSBjYWNoZWQgZm9s
aW9zIGJlZm9yZQo+PiB0cmlnZ2VyaW5nIGYyZnNfZ2MoKSBpbiBmMmZzX2JhbGFuY2VfZnMoKS4K
Pj4KPj4gdjI6Cj4+IC0gQ29tbWl0IGNhY2hlZCBPUFUvSVBVIGZvbGlvcywgbm90IGp1c3QgT1BV
IGZvbGlvcyBhcyBpbiB2MS4KPj4KPj4gU3VnZ2VzdGVkLWJ5OiBDaGFvIDxjaGFvQGtlcm5lbC5v
cmc+Cj4+IFNpZ25lZC1vZmYtYnk6IFJ1aXBlbmcgUWkgPHJ1aXBlbmdxaTNAZ21haWwuY29tPgo+
PiAtLS0KPj4gwqAgZnMvZjJmcy9kYXRhLmPCoMKgwqAgfCAyNiArKysrKysrKysrKysrKysrKysr
KysrKysrKwo+PiDCoCBmcy9mMmZzL2YyZnMuaMKgwqDCoCB8wqAgMSArCj4+IMKgIGZzL2YyZnMv
c2VnbWVudC5jIHzCoCA5ICsrKysrKysrKwo+PiDCoCAzIGZpbGVzIGNoYW5nZWQsIDM2IGluc2Vy
dGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRh
LmMKPj4gaW5kZXggMzM4ZGY3YTJhZWE2Li5mZDAzMzY2YjMyMjggMTAwNjQ0Cj4+IC0tLSBhL2Zz
L2YyZnMvZGF0YS5jCj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+IEBAIC05MzksNiArOTM5LDMy
IEBAIHZvaWQgZjJmc19zdWJtaXRfbWVyZ2VkX2lwdV93cml0ZShzdHJ1Y3QgCj4+IGYyZnNfc2Jf
aW5mbyAqc2JpLAo+PiDCoMKgwqDCoMKgIH0KPj4gwqAgfQo+PiDCoCArdm9pZCBmMmZzX3N1Ym1p
dF9hbGxfbWVyZ2VkX2lwdV93cml0ZXMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+PiArewo+
PiArwqDCoMKgIHN0cnVjdCBiaW9fZW50cnkgKmJlLCAqdG1wOwo+PiArwqDCoMKgIHN0cnVjdCBm
MmZzX2Jpb19pbmZvICppbzsKPj4gK8KgwqDCoCBlbnVtIHRlbXBfdHlwZSB0ZW1wOwo+PiArwqDC
oMKgIExJU1RfSEVBRChsaXN0KTsKPj4gKwo+PiArwqDCoMKgIGZvciAodGVtcCA9IEhPVDsgdGVt
cCA8IE5SX1RFTVBfVFlQRTsgdGVtcCsrKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpbyA9IHNiaS0+
d3JpdGVfaW9bREFUQV0gKyB0ZW1wOwo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAobGlzdF9l
bXB0eSgmaW8tPmJpb19saXN0KSkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7
Cj4KPiBOZWVkcyB0byBiZSBjb3ZlcmVkIHcvIGJpb19saXN0X2xvY2sgdG8gYXZvaWQgcmFjZSBj
b25kaXRpb24uCgpIaSxDaGFvCgpUaGUgbG9ja2xlc3MgbGlzdF9lbXB0eSgpIGhlcmUgaXMgaW50
ZW50aW9uYWwgYW5kIGFjY2VwdGFibGUuCgoKSWYgbGlzdF9lbXB0eSgpIHJldHVybnMgdHJ1ZSBi
dXQgdGhlIGxpc3QgYmVjb21lcyBub24tZW1wdHkKYWZ0ZXJ3YXJkcyAoZHVlIHRvIHJhY2UpLCB0
aGUgbmV3bHkgYWRkZWQgYmlvIHdpbGwgYmUgc3VibWl0dGVkCmJ5IHRoZSBzdWJzZXF1ZW50IHdy
aXRlIHBhdGgsIHNvIG5vIGJpbyB3aWxsIGJlIGxvc3QuCgoKU2ltaWxhciBwYXR0ZXJucyBleGlz
dCBpbiB0aGUga2VybmVsLCBlLmcuOgogwqAgbmV0L3Jma2lsbC9jb3JlLmM6IHJma2lsbF9mb3Bf
cmVhZCgpCiDCoMKgwqAgLyogc2luY2Ugd2UgcmUtY2hlY2sgYW5kIGl0IGp1c3QgY29tcGFyZXMg
cG9pbnRlcnMsCiDCoMKgwqDCoCAqIHVzaW5nICFsaXN0X2VtcHR5KCkgd2l0aG91dCBsb2NraW5n
IGlzbid0IGEgcHJvYmxlbQogwqDCoMKgwqAgKi8KIMKgIGZzL2YyZnMvZGF0YS5jOiBmMmZzX3N1
Ym1pdF9tZXJnZWRfaXB1X3dyaXRlKCkKIMKgwqDCoCBsaXN0X2VtcHR5KCkgaXMgYWxzbyB1c2Vk
IHdpdGhvdXQgaG9sZGluZyBiaW9fbGlzdF9sb2NrCiDCoMKgwqAgYXMgYSBsb2NrbGVzcyBwcmUt
Y2hlY2sKCgpJZiB5b3UnZCBwcmVmZXIsIHdlIGNhbiBhZGQgYSBjb21tZW50IHRvIG1ha2UgdGhl
IGludGVudCBjbGVhcjoKCiDCoMKgwqAgLyogbGlzdF9lbXB0eSgpIHdpdGhvdXQgbG9jayBpcyBz
YWZlIGhlcmUgLSBSRUFEX09OQ0UoKQogwqDCoMKgwqAgKiBlbnN1cmVzIHBvaW50ZXIgcmVhZCBh
dG9taWNpdHkuIEEgZmFsc2UgbmVnYXRpdmUgaXMKIMKgwqDCoMKgICogYWNjZXB0YWJsZSBzaW5j
ZSBhbnkgYmlvIGFkZGVkIGNvbmN1cnJlbnRseSB3aWxsIGJlCiDCoMKgwqDCoCAqIHN1Ym1pdHRl
ZCBieSB0aGUgbmV4dCB3cml0ZSBwYXRoLgogwqDCoMKgwqAgKi8KIMKgwqDCoCBpZiAobGlzdF9l
bXB0eSgmaW8tPmJpb19saXN0KSkKIMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+Cj4+ICsKPj4g
K8KgwqDCoMKgwqDCoMKgIGYyZnNfZG93bl93cml0ZSgmaW8tPmJpb19saXN0X2xvY2spOwo+PiAr
wqDCoMKgwqDCoMKgwqAgbGlzdF9zcGxpY2VfaW5pdCgmaW8tPmJpb19saXN0LCAmbGlzdCk7Cj4+
ICvCoMKgwqDCoMKgwqDCoCBmMmZzX3VwX3dyaXRlKCZpby0+YmlvX2xpc3RfbG9jayk7Cj4+ICsK
Pj4gK8KgwqDCoMKgwqDCoMKgIGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShiZSwgdG1wLCAmbGlz
dCwgbGlzdCkgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX3N1Ym1pdF93cml0ZV9i
aW8oc2JpLCBiZS0+YmlvLCBEQVRBKTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVsX2Jp
b19lbnRyeShiZSk7Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+ICsKPgo+IFVubmVjZXNzYXJ5IGJs
YW5rIGxpbmUuCj4KPiBUaGFua3MsCgpUaGFua3MgZm9yIHlvdXIgY29ycmVjdGlvbi4gV2lsbCBm
aXggaW4gdjMuCiDCoMKgwqAgdjM6CiDCoMKgwqAgLSBGaXhlZCBtaW5vciBncmFtbWF0aWNhbCBp
c3N1ZXMKIMKgwqDCoCAtIEFkZCBjb21tZW50IG9uIGxvY2tsZXNzIGxpc3RfZW1wdHkoKSB0byBl
eHBsYWluIHdoeSBpdCBpcyBzYWZlCiDCoCB3aXRob3V0IGhvbGRpbmcgYmlvX2xpc3RfbG9jawoK
ClRoYW5rcywKCj4KPj4gK8KgwqDCoCB9Cj4+ICsKPj4gK30KPj4gKwo+PiDCoCBpbnQgZjJmc19t
ZXJnZV9wYWdlX2JpbyhzdHJ1Y3QgZjJmc19pb19pbmZvICpmaW8pCj4+IMKgIHsKPj4gwqDCoMKg
wqDCoCBzdHJ1Y3QgYmlvICpiaW8gPSAqZmlvLT5iaW87Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZz
L2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCj4+IGluZGV4IGJiMzRlODY0ZDBlZi4uZTkwMzhhYjFi
MmJkIDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+PiArKysgYi9mcy9mMmZzL2YyZnMu
aAo+PiBAQCAtNDE0OCw2ICs0MTQ4LDcgQEAgdm9pZCBmMmZzX3N1Ym1pdF9tZXJnZWRfd3JpdGVf
Zm9saW8oc3RydWN0IAo+PiBmMmZzX3NiX2luZm8gKnNiaSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZm9saW8gKmZvbGlvLCBlbnVtIHBhZ2VfdHlwZSB0eXBl
KTsKPj4gwqAgdm9pZCBmMmZzX3N1Ym1pdF9tZXJnZWRfaXB1X3dyaXRlKHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHN0cnVjdCBiaW8gKipiaW8sIHN0cnVjdCBmb2xpbyAqZm9saW8pOwo+PiArdm9pZCBmMmZzX3N1
Ym1pdF9hbGxfbWVyZ2VkX2lwdV93cml0ZXMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKTsKPj4g
wqAgdm9pZCBmMmZzX2ZsdXNoX21lcmdlZF93cml0ZXMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
KTsKPj4gwqAgaW50IGYyZnNfc3VibWl0X3BhZ2VfYmlvKHN0cnVjdCBmMmZzX2lvX2luZm8gKmZp
byk7Cj4+IMKgIGludCBmMmZzX21lcmdlX3BhZ2VfYmlvKHN0cnVjdCBmMmZzX2lvX2luZm8gKmZp
byk7Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2YyZnMvc2VnbWVudC5j
Cj4+IGluZGV4IDZhOTdmZTc2NzEyYi4uODU2ZmZlOTFiOTRmIDEwMDY0NAo+PiAtLS0gYS9mcy9m
MmZzL3NlZ21lbnQuYwo+PiArKysgYi9mcy9mMmZzL3NlZ21lbnQuYwo+PiBAQCAtNDU0LDYgKzQ1
NCwxNSBAQCB2b2lkIGYyZnNfYmFsYW5jZV9mcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIAo+
PiBib29sIG5lZWQpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpb19zY2hlZHVsZSgpOwo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgZmluaXNoX3dhaXQoJnNiaS0+Z2NfdGhyZWFkLT5mZ2djX3dxLCAmd2Fp
dCk7Cj4+IMKgwqDCoMKgwqAgfSBlbHNlIHsKPj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgLyoKPj4g
K8KgwqDCoMKgwqDCoMKgwqAgKiBTdWJtaXQgYWxsIGNhY2hlZCBPUFUvSVBVIERBVEEgYmlvcyBi
ZWZvcmUgdHJpZ2dlcmluZwo+PiArwqDCoMKgwqDCoMKgwqDCoCAqIGZvcmVncm91bmQgR0MgdG8g
YXZvaWQgcG90ZW50aWFsIGRlYWRsb2Nrcy4KPj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8KPj4gKwo+
PiArwqDCoMKgwqDCoMKgwqAgZjJmc19zdWJtaXRfbWVyZ2VkX3dyaXRlKHNiaSwgREFUQSk7Cj4+
ICvCoMKgwqDCoMKgwqDCoCBmMmZzX3N1Ym1pdF9hbGxfbWVyZ2VkX2lwdV93cml0ZXMoc2JpKTsK
Pj4gKwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGYyZnNfZ2NfY29udHJvbCBnY19jb250
cm9sID0gewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAudmljdGltX3NlZ25vID0gTlVM
TF9TRUdOTywKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLmluaXRfZ2NfdHlwZSA9IGYy
ZnNfc2JfaGFzX2Jsa3pvbmVkKHNiaSkgPwo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
