Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0B9DCai6s2lXaQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 08:20:08 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FFB27EBB5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 08:20:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lU9q4FGfq60F96Kb1e7yM7fE5U0oiH2Gf6Vj/MWWWxI=; b=VVRvmRDl20t9FEQ2UrcL0KmKG7
	hHkaf1zo//bjSyGxgxZRqRDwEVZZOnfthsfAJJeyB5YlZlzl74qNLXJEEUFxAR0qPRz0OCJxvSRR0
	Bn8yXJrAdHgbaA4CGSQfIULvUb51+jt5LuHkWp9T6ca4Wry1X2ULVrPBizWOBCbXbwmE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0woL-0005hA-Ng;
	Fri, 13 Mar 2026 07:19:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w0woK-0005h3-Gn
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 07:19:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P6WvNxZWcySpsr9J3MSixRDVRJpAIduOhGz/HynjnFM=; b=dRXZsIxfJuchNnfVBSxpb+CWIn
 OHMfy7zdtEw1HSGqKSI+XM5XucnVat7kNV+AxkdbGuierIJf0Z1lkBZylpwvLhxY3aso8/IWtdNu6
 IxiEtGZaRTExBGHayHreIRyK8SnM2cmvQqVvNPfkG3a+Rf6dVLIijz0KTUxRHSDVSjTY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P6WvNxZWcySpsr9J3MSixRDVRJpAIduOhGz/HynjnFM=; b=StFcctz/dQk5PxFMDvV37j7jFk
 ICq0IGoT8qFebJlRMlVtK1VxWKtTNQzbAkkWGQKjtdwmVG6fGs7sSoQgz6lrWOHA2L2FPJTQE+aHq
 yuf3zLmrBSCNLpxGjXMiXEOEPIEH2kTtgkrHY8+gADKD5njsMmn1N0FBphbXaiHlW+Jw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0woJ-00074k-RG for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 07:19:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DBD586012B;
 Fri, 13 Mar 2026 07:19:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79A35C19421;
 Fri, 13 Mar 2026 07:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773386385;
 bh=wlmF7J+MfK1DUMied6P7c1ONdaeaFAc7ee62zSw5F8c=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=n3oqjuqEfIkhN6rf4VRrXBcx7ZvCTIGQXT0hTnirwodN74wJ575/DN1hJv5ezk1x7
 BsKNqo4B6VT+f+iEJF5SUVbo8fO9Up647n1pNWVsl9JURzpWc+FZ7MaUvXl+BAsE1y
 VHeOiJqP316Y+GwgcxKJBvh/h1lMKViI7vQM7YvIxYgkSwCXSz5XjJp6zylFu0AVXe
 swiDO1mz5e49N3wL2XuLEY8B01VlFtYOVqaRYP+EeMVFYGMWPtBD2vXCOOAzM4N0xm
 rx0eEeSYIXTV6ojeps0gqlZYbu5WfbKorZv0XGq/sK5r3ISCU7RXktrngyB/I7w5qX
 eYaRjjdTaAKBg==
Message-ID: <f4039e35-b84f-4ec8-b9a3-70fcdd9277b2@kernel.org>
Date: Fri, 13 Mar 2026 15:19:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260216112737.67408-1-monty_pavel@sina.com>
 <f331751b-08ad-42d2-ad23-37d21e1364f8@kernel.org>
 <c7bdf38f-4cf5-490b-8e0f-35f4574f4b81@sina.com>
 <9dc584cd-d2fb-4a85-b1d0-ded944064603@kernel.org>
 <507df28a-6415-445a-9e88-0f119ee7ce10@kernel.org>
 <3565eb34-944e-44a1-b349-ae54b9745051@sina.com>
Content-Language: en-US
In-Reply-To: <3565eb34-944e-44a1-b349-ae54b9745051@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/12/2026 7:34 PM, Yongpeng Yang wrote: > > On 3/12/26
 18:49, Chao Yu via Linux-f2fs-devel wrote: >> On 2026/3/12 18:41, Chao Yu
 wrote: >>> On 2026/3/12 11:56, Yongpeng Yang wrote: >>>> >>>> On 3/1 [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w0woJ-00074k-RG
Subject: Re: [f2fs-dev] [PATCH] f2fs: invalidate block device page cache on
 umount
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email]
X-Rspamd-Queue-Id: 56FFB27EBB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMy8xMi8yMDI2IDc6MzQgUE0sIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4gCj4gT24gMy8xMi8y
NiAxODo0OSwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4gT24gMjAyNi8z
LzEyIDE4OjQxLCBDaGFvIFl1IHdyb3RlOgo+Pj4gT24gMjAyNi8zLzEyIDExOjU2LCBZb25ncGVu
ZyBZYW5nIHdyb3RlOgo+Pj4+Cj4+Pj4gT24gMy8xMi8yNiAwODo0OSwgQ2hhbyBZdSB2aWEgTGlu
dXgtZjJmcy1kZXZlbCB3cm90ZToKPj4+Pj4gT24gMjAyNi8yLzE2IDE5OjI3LCBZb25ncGVuZyBZ
YW5nIHdyb3RlOgo+Pj4+Pj4gRnJvbTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9t
aS5jb20+Cj4+Pj4+Pgo+Pj4+Pj4gTmVpdGhlciBGMkZTIG5vciBWRlMgaW52YWxpZGF0ZXMgdGhl
IGJsb2NrIGRldmljZSBwYWdlIGNhY2hlLCB3aGljaAo+Pj4+Pj4gcmVzdWx0cyBpbiByZWFkaW5n
IHN0YWxlIG1ldGFkYXRhLiBBbiBleGFtcGxlIHNjZW5hcmlvIGlzIHNob3duIGJlbG93Ogo+Pj4+
Pj4KPj4+Pj4+IFRlcm1pbmFsIEHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRl
cm1pbmFsIEIKPj4+Pj4+IG1vdW50IC9kZXYvdmRiIC9tbnQvZjJmcwo+Pj4+Pj4gdG91Y2ggbXgg
Ly8gaW5vID0gNAo+Pj4+Pj4gc3luYwo+Pj4+Pj4gZHVtcC5mMmZzIC1pIDQgL2Rldi92ZGIvLyBi
bG9jayBvbiAiW1kvTl0iCj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0b3VjaCBteDIgLy8gaW5vID0gNQo+Pj4+Pj4gIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c3luYwo+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgdW1vdW50IC9tbnQvZjJmcwo+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHVtcC5mMmZzIC1pIDUg
L2Rldi92ZGIgLy8gYmxvY2sgYWRkcgo+Pj4+Pj4gaXMgMAo+Pj4+Pj4KPj4+Pj4+IEFmdGVyIHVt
b3VudCwgdGhlIGJsb2NrIGRldmljZSBwYWdlIGNhY2hlIGlzIG5vdCBwdXJnZWQsIGNhdXNpbmcK
Pj4+Pj4+IGBkdW1wLmYyZnMgLWkgNSAvZGV2L3ZkYmAgdG8gcmVhZCBzdGFsZSBtZXRhZGF0YSBh
bmQgc2VlIGlub2RlIDUgd2l0aAo+Pj4+Pj4gYmxvY2sgYWRkcmVzcyAwLgo+Pj4+Pj4KPj4+Pj4+
IFRoaXMgcGF0Y2ggY2FsbHMgaW52YWxpZGF0ZV9iZGV2IGR1cmluZyB1bW91bnQgdG8gaW52YWxp
ZGF0ZSB0aGUgYmxvY2sKPj4+Pj4+IGRldmljZSBwYWdlIGNhY2hlLCBwcmV2ZW50aW5nIHN0YWxl
IG1ldGFkYXRhIGZyb20gYmVpbmcgcmVhZC4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBZ
b25ncGVuZyBZYW5nIDx5YW5neW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4g
IMKgwqAgZnMvZjJmcy9zdXBlci5jIHwgNiArKysrKysKPj4+Pj4+ICDCoMKgIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKykKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9z
dXBlci5jIGIvZnMvZjJmcy9zdXBlci5jCj4+Pj4+PiBpbmRleCAxYTc1NTk5N2FmZjUuLjM5ZDNi
NTJjZWFjMSAxMDA2NDQKPj4+Pj4+IC0tLSBhL2ZzL2YyZnMvc3VwZXIuYwo+Pj4+Pj4gKysrIGIv
ZnMvZjJmcy9zdXBlci5jCj4+Pj4+PiBAQCAtMjA5MSw2ICsyMDkxLDEyIEBAIHN0YXRpYyB2b2lk
IGYyZnNfcHV0X3N1cGVyKHN0cnVjdAo+Pj4+Pj4gc3VwZXJfYmxvY2sgKnNiKQo+Pj4+Pj4gIMKg
wqAgI2lmIElTX0VOQUJMRUQoQ09ORklHX1VOSUNPREUpCj4+Pj4+PiAgwqDCoMKgwqDCoMKgIHV0
ZjhfdW5sb2FkKHNiLT5zX2VuY29kaW5nKTsKPj4+Pj4+ICDCoMKgICNlbmRpZgo+Pj4+Pj4gK8Kg
wqDCoCBzeW5jX2Jsb2NrZGV2KHNiLT5zX2JkZXYpOwo+Pj4+Pgo+Pj4+PiBXZSB3aWxsIGNhbGwg
c3luY19ibG9ja2RldiBpbiBiZWxvdyBwYXRoPwo+Pj4+Pgo+Pj4+PiAtIGtpbGxfZjJmc19zdXBl
cgo+Pj4+PiAgwqDCoC0ga2lsbF9ibG9ja19zdXBlcgo+Pj4+PiAgwqDCoCAtIGdlbmVyaWNfc2h1
dGRvd25fc3VwZXIKPj4+Pj4gIMKgwqDCoCAtIHB1dF9zdXBlcgo+Pj4+PiAgwqDCoCAtIHN5bmNf
YmxvY2tkZXYKPj4+Pj4KPj4+Pj4gMTcyMSB2b2lkIGtpbGxfYmxvY2tfc3VwZXIoc3RydWN0IHN1
cGVyX2Jsb2NrICpzYikKPj4+Pj4gMTcyMiB7Cj4+Pj4+IDE3MjPCoMKgwqDCoMKgwqDCoMKgIHN0
cnVjdCBibG9ja19kZXZpY2UgKmJkZXYgPSBzYi0+c19iZGV2Owo+Pj4+PiAxNzI0Cj4+Pj4+IDE3
MjXCoMKgwqDCoMKgwqDCoMKgIGdlbmVyaWNfc2h1dGRvd25fc3VwZXIoc2IpOwo+Pj4+PiAxNzI2
wqDCoMKgwqDCoMKgwqDCoCBpZiAoYmRldikgewo+Pj4+PiAxNzI3wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc3luY19ibG9ja2RldihiZGV2KTsKPj4+Pj4gMTcyOMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJkZXZfZnB1dChzYi0+c19iZGV2X2ZpbGUpOwo+Pj4+PiAx
NzI5wqDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4+IDE3MzAgfQo+Pj4+Pgo+Pj4+Pj4gK8KgwqDCoCBp
bnZhbGlkYXRlX2JkZXYoc2ItPnNfYmRldik7Cj4+Pj4KPj4+PiBUaGlzIHdvcmtzIGZvciBhbiBm
MmZzIGluc3RhbmNlIG1vdW50ZWQgb24gYSBzaW5nbGUgZGV2aWNlLCBidXQgaXQgZG9lcwo+Pj4+
IG5vdCB3b3JrIGZvciBtdWx0aS1kZXZpY2UgY29uZmlndXJhdGlvbnMsIGJlY2F1c2UgdGhlIHZm
cyBjYW5ub3QgYmUKPj4+PiBhd2FyZSBvZiBGREVWKDEpLgo+Pj4KPj4+IFllYWgsIEkgbWVhbnQg
d2UgY2FuIGF2b2lkIGR1cGxpY2F0ZWQgc3luY19ibG9ja2RldigpIGZvciBtYWluIGRldmljZSBp
bgo+Pj4gZjJmc19wdXRfc3VwZXIoKS4KPj4+Cj4gCj4gVGhlIGNhbGwgdHJhY2UgY29ycmVzcG9u
ZGluZyB0byB0aGlzIHBhdGNoIGlzIGFzIGZvbGxvd3M6Cj4gCj4ga2lsbF9ibG9ja19zdXBlcgo+
ICAgLSBnZW5lcmljX3NodXRkb3duX3N1cGVyCj4gICAgLSBmMmZzX3B1dF9zdXBlcgo+ICAgICAt
IHN5bmNfYmxvY2tkZXYKPiAgICAgLSBpbnZhbGlkYXRlX2JkZXYKPiAgIC0gc3luY19ibG9ja2Rl
dgo+IAo+IFRoZXJlIGlzIGluZGVlZCBhIGR1cGxpY2F0ZWQgY2FsbCB0byBzeW5jX2Jsb2NrZGV2
KCkuIEhvd2V2ZXIsIHNpbmNlIGFsbAo+IGRhdGEgbXVzdCBiZSB3cml0dGVuIHRvIGRpc2sgYmVm
b3JlIGludmFsaWRhdGVfYmRldigpIGlzIGNhbGxlZCwKPiBmMmZzX3B1dF9zdXBlcigpIG11c3Qg
Y2FsbCBzeW5jX2Jsb2NrZGV2KCkuIEJlY2F1c2UgaW52YWxpZGF0ZV9iZGV2KCkKPiBoYXMgYWxy
ZWFkeSBjbGVhcmVkIHRoZSBwYWdlIGNhY2hlLCB0aGUgc2Vjb25kIGNhbGwgdG8gc3luY19ibG9j
a2RldigpCj4gICBkb2VzIG5vdGhpbmcuCj4gCj4+Pj4KPj4+Pj4KPj4+Pj4gSSBndWVzcyB3ZSBj
YW4gbGVhdmUgdGhlIGRldmljZSB3LyB1cHRvZGF0ZSBjYWNoZSwgaW4gY2FzZSBpZiB0aGVyZSBh
cmUKPj4+Pj4gbXVsdGlwbGUgdXNlciBvbiB0aGUgZGV2aWNlPwo+Pj4+Cj4+Pj4gVGhlIHBhZ2Ug
Y2FjaGUgb2YgdGhlIGJsb2NrIGRldmljZSBmaWxlIG1heSBjb250YWluIGRhdGEgdGhhdCBpcyBu
b3QKPj4+PiB1cHRvZGF0ZS4gRm9yIGV4YW1wbGUsIGRhdGEgbWF5IGZpcnN0IGJlIHJlYWQgZGly
ZWN0bHkgdGhyb3VnaCB0aGUgYmxvY2sKPj4+ICDCoD4gZGV2aWNlIGZpbGUsIGFuZCB0aGVuIHRo
ZSBzYW1lIGJsb2NrcyBtYXkgYmUgd3JpdHRlbiB0aHJvdWdoIGYyZnMuCj4+PiBTaW5jZT4gZjJm
cyB3cml0ZXMgdG8gdGhlIGJsb2NrIGRldmljZSB2aWEgdGhlIHN1Ym1pdF9iaW8gcGF0aCwgaXQK
Pj4+IGRvZXMgbm90Cj4+Pj4gdXBkYXRlIHRoZSBwYWdlIGNhY2hlIG9mIHRoZSBibG9jayBkZXZp
Y2UgZmlsZS4gQXMgYSByZXN1bHQsIHRoZSBkYXRhIGluCj4+Pj4gdGhlIGJsb2NrIGRldmljZSBm
aWxl4oCZcyBwYWdlIGNhY2hlIG1heSBiZWNvbWUgc3RhbGUuIFRoZXJlZm9yZSwgdGhlIHBhZ2UK
Pj4+PiBjYWNoZSBtdXN0IGJlIGludmFsaWRhdGVkIGR1cmluZyB1bm1vdW50Lgo+Pj4KPj4+IFdl
bGwsIGNhbiB3ZSBjYWxsIGlvY3RsKGZkLCBCTEtGTFNCVUYpIGZvciBhbGwgZGV2aWNlcyBiZWxv
bmcgdG8gZjJmcwo+Pj4gaW1nIGxpa2UKPj4+IHlvdSBkaWQgaW4gKCJmMmZzLXRvb2xzOiBpbnZh
bGlkYXRlIGJsb2NrIGRldmljZSBwYWdlIGNhY2hlIGJlZm9yZQo+Pj4gcmVhZGluZwo+Pj4gbWV0
YWRhdGEiKSwgZG9lcyB0aGF0IGZpeCB0aGUgaXNzdWU/Cj4+Cj4+IE9oLCB5b3UgYWxyZWFkeSBj
YWxsZWQgdGhlIGlvY3RsIGZvciBhbGwgZGV2aWNlcy4gRG9lcyB0aGF0IGZpeCB0aGUgaXNzdWU/
Cj4+Cj4gCj4gWWVzLCB0aGF0IGNhbiBmaXggdGhpcyBpc3N1ZS4gRnJvbSBhIHN5c3RlbSByb2J1
c3RuZXNzIHBlcnNwZWN0aXZlLCBib3RoCj4gdGhlIGtlcm5lbCBhbmQgZjJmcy10b29scyBzaG91
bGQgZW5zdXJlIHRoYXQgdGhlIHVwdG9kYXRlIGRhdGEgaXMgcmVhZC4KPiBUaGVyZWZvcmUsIEkg
bWFkZSBjaGFuZ2VzIGluIGJvdGguCgpXZWxsLCBJIHRoaW5rIGl0IHdpbGwgYmUgYSBsaXR0bGUg
Yml0IG92ZXJwcm90ZWN0aXZlLCBiZWNhdXNlIGYyZnMga2VybmVsCm1vZHVsZSBpdHNlbGYgZG9l
c24ndCBzdWZmZXIgYW55IGlzc3VlLCBhbmQgZHVtcC5mMmZzIGFscmVhZHkgaGFzIGl0cwp3YXkg
dG8gYXZvaWQgYWNjZXNzaW5nIHN0YWxlIGRhdGEgdy8geW91ciBjaGFuZ2UuCgpUaGFua3MsCgo+
IAo+IFRoYW5rcwo+IFlvbmdwZW5nLAo+IAo+PiBUaGFua3MsCj4+Cj4+Pgo+Pj4gVGhhbmtzLAo+
Pj4KPj4+Pgo+Pj4+IFRoYW5rcwo+Pj4+IFlvbmdwZW5nLAo+Pj4+Cj4+Pj4+Cj4+Pj4+IFRoYW5r
cywKPj4+Pj4KPj4+Pj4+ICvCoMKgwqAgZm9yIChpID0gMTsgaSA8IHNiaS0+c19uZGV2czsgaSsr
KSB7Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgc3luY19ibG9ja2RldihGREVWKGkpLmJkZXYpOwo+
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGludmFsaWRhdGVfYmRldihGREVWKGkpLmJkZXYpOwo+Pj4+
Pj4gK8KgwqDCoCB9Cj4+Pj4+PiAgwqDCoCB9Cj4+Pj4+PiAgwqDCoCDCoCBpbnQgZjJmc19zeW5j
X2ZzKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIGludCBzeW5jKQo+Pj4+Pgo+Pj4+Pgo+Pj4+Pgo+
Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4+
PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+Pj4+PiBMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldAo+Pj4+PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4+Pj4KPj4+Cj4+Cj4+Cj4+Cj4+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IExpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwKPiAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
