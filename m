Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHrgEeOksmnwOQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 12:34:59 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28803271086
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 12:34:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVKU1KaHdiFDSQ+w3b+9mzNDr9hY5QDuiso/s3EBbxs=; b=h/R1t22mOxO1UW+bTBiMgA33gJ
	tbxKbR1ptL+6xZVdt6SwwR89vie9igKinNjP2RT9cjHZ53I8QA5Qr2d3fmr80zAPmK4AoK5A8AtKf
	dN4Rwf0S76ypYUROYvqsXYNV8qKBSiqmIKflarMDEG/c+OlfDqONmV1DtzZWR75o2fo0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0eJY-00063V-1O;
	Thu, 12 Mar 2026 11:34:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1w0eJW-00063L-F5
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 11:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UFzsk61grvO/mU1kgbaRI2CcrLwltZAytNr13aL9opQ=; b=FF6Nc6BPvlV750BofRD49U2Ceq
 mlReF/DWXHasWgIWtTALhqUJ+TukU83bW9TzITo/WF43XKrntcW20odFoINK4KPGMfgemxAhrTq6S
 AOMalH5DJL8F4zkVVhU5cgqSfSaLxfvAl/6VAg/f2NiYZ+Io2/OzLAyy3v25UnQCFR7g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UFzsk61grvO/mU1kgbaRI2CcrLwltZAytNr13aL9opQ=; b=nC+H+ZL0RRJq/dpXenQNgFJZ/V
 TwnM2RaHq88f7a8YYYGDDCGcEsfWHS2nijO/XPEBZtqg/baEYLMaEyzwKxQyXwNZuxMW8gcLO+cvQ
 RkSsAMuvRl3MG5SRvg3wkel+TrYhd7h9Lsw886uiC0j7r6/L29eABpe2iMiv7iOBkUas=;
Received: from mail3-163.sinamail.sina.com.cn ([202.108.3.163])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0eJV-0002dS-5k for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 11:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1773315289; bh=UFzsk61grvO/mU1kgbaRI2CcrLwltZAytNr13aL9opQ=;
 h=Message-ID:Date:Subject:From;
 b=UxJnbGSa+tOLJ1lCSykZS35uxxF+4rq9rlPbafvOJvUF2oz3rs7QpEJqY5TgInQ8x
 HUCfr2QIg3k8XT/VPFeGOzjmK1pZ5I+Fk3P+arHZQdC5WtSeC6kdIKuuIn7TB1ZLWK
 /WXXE0mH7Cxbro1wBQmOA/e62jL1ATVkzJpSK3M8=
X-SMAIL-HELO: [10.189.138.37]
Received: from unknown (HELO [10.189.138.37])([114.247.175.249])
 by sina.com (10.54.253.34) with ESMTP
 id 69B2A4C900001D7E; Thu, 12 Mar 2026 19:34:35 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 7551466291732
X-SMAIL-UIID: 79BAAD5480B940DA86F072AA33482C5E-20260312-193435-1
Message-ID: <3565eb34-944e-44a1-b349-ae54b9745051@sina.com>
Date: Thu, 12 Mar 2026 19:34:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260216112737.67408-1-monty_pavel@sina.com>
 <f331751b-08ad-42d2-ad23-37d21e1364f8@kernel.org>
 <c7bdf38f-4cf5-490b-8e0f-35f4574f4b81@sina.com>
 <9dc584cd-d2fb-4a85-b1d0-ded944064603@kernel.org>
 <507df28a-6415-445a-9e88-0f119ee7ce10@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <507df28a-6415-445a-9e88-0f119ee7ce10@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/12/26 18:49, Chao Yu via Linux-f2fs-devel wrote: > On
 2026/3/12 18:41, Chao Yu wrote: >> On 2026/3/12 11:56, Yongpeng Yang wrote:
 >>> >>> On 3/12/26 08:49, Chao Yu via Linux-f2fs-devel wrote: >> [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1w0eJV-0002dS-5k
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.91 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,sina.com:mid]
X-Rspamd-Queue-Id: 28803271086
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ck9uIDMvMTIvMjYgMTg6NDksIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4g
T24gMjAyNi8zLzEyIDE4OjQxLCBDaGFvIFl1IHdyb3RlOgo+PiBPbiAyMDI2LzMvMTIgMTE6NTYs
IFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+Pgo+Pj4gT24gMy8xMi8yNiAwODo0OSwgQ2hhbyBZdSB2
aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4+PiBPbiAyMDI2LzIvMTYgMTk6MjcsIFlvbmdw
ZW5nIFlhbmcgd3JvdGU6Cj4+Pj4+IEZyb206IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25ncGVuZ0B4
aWFvbWkuY29tPgo+Pj4+Pgo+Pj4+PiBOZWl0aGVyIEYyRlMgbm9yIFZGUyBpbnZhbGlkYXRlcyB0
aGUgYmxvY2sgZGV2aWNlIHBhZ2UgY2FjaGUsIHdoaWNoCj4+Pj4+IHJlc3VsdHMgaW4gcmVhZGlu
ZyBzdGFsZSBtZXRhZGF0YS4gQW4gZXhhbXBsZSBzY2VuYXJpbyBpcyBzaG93biBiZWxvdzoKPj4+
Pj4KPj4+Pj4gVGVybWluYWwgQcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVGVy
bWluYWwgQgo+Pj4+PiBtb3VudCAvZGV2L3ZkYiAvbW50L2YyZnMKPj4+Pj4gdG91Y2ggbXggLy8g
aW5vID0gNAo+Pj4+PiBzeW5jCj4+Pj4+IGR1bXAuZjJmcyAtaSA0IC9kZXYvdmRiLy8gYmxvY2sg
b24gIltZL05dIgo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHRvdWNoIG14MiAvLyBpbm8gPSA1Cj4+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3luYwo+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHVtb3VudCAvbW50L2YyZnMKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkdW1wLmYyZnMgLWkgNSAvZGV2L3ZkYiAvLyBi
bG9jayBhZGRyCj4+Pj4+IGlzIDAKPj4+Pj4KPj4+Pj4gQWZ0ZXIgdW1vdW50LCB0aGUgYmxvY2sg
ZGV2aWNlIHBhZ2UgY2FjaGUgaXMgbm90IHB1cmdlZCwgY2F1c2luZwo+Pj4+PiBgZHVtcC5mMmZz
IC1pIDUgL2Rldi92ZGJgIHRvIHJlYWQgc3RhbGUgbWV0YWRhdGEgYW5kIHNlZSBpbm9kZSA1IHdp
dGgKPj4+Pj4gYmxvY2sgYWRkcmVzcyAwLgo+Pj4+Pgo+Pj4+PiBUaGlzIHBhdGNoIGNhbGxzIGlu
dmFsaWRhdGVfYmRldiBkdXJpbmcgdW1vdW50IHRvIGludmFsaWRhdGUgdGhlIGJsb2NrCj4+Pj4+
IGRldmljZSBwYWdlIGNhY2hlLCBwcmV2ZW50aW5nIHN0YWxlIG1ldGFkYXRhIGZyb20gYmVpbmcg
cmVhZC4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lvbmdw
ZW5nQHhpYW9taS5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiDCoMKgIGZzL2YyZnMvc3VwZXIuYyB8IDYg
KysrKysrCj4+Pj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+Pj4+Pgo+
Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zdXBlci5jIGIvZnMvZjJmcy9zdXBlci5jCj4+Pj4+
IGluZGV4IDFhNzU1OTk3YWZmNS4uMzlkM2I1MmNlYWMxIDEwMDY0NAo+Pj4+PiAtLS0gYS9mcy9m
MmZzL3N1cGVyLmMKPj4+Pj4gKysrIGIvZnMvZjJmcy9zdXBlci5jCj4+Pj4+IEBAIC0yMDkxLDYg
KzIwOTEsMTIgQEAgc3RhdGljIHZvaWQgZjJmc19wdXRfc3VwZXIoc3RydWN0Cj4+Pj4+IHN1cGVy
X2Jsb2NrICpzYikKPj4+Pj4gwqDCoCAjaWYgSVNfRU5BQkxFRChDT05GSUdfVU5JQ09ERSkKPj4+
Pj4gwqDCoMKgwqDCoMKgIHV0ZjhfdW5sb2FkKHNiLT5zX2VuY29kaW5nKTsKPj4+Pj4gwqDCoCAj
ZW5kaWYKPj4+Pj4gK8KgwqDCoCBzeW5jX2Jsb2NrZGV2KHNiLT5zX2JkZXYpOwo+Pj4+Cj4+Pj4g
V2Ugd2lsbCBjYWxsIHN5bmNfYmxvY2tkZXYgaW4gYmVsb3cgcGF0aD8KPj4+Pgo+Pj4+IC0ga2ls
bF9mMmZzX3N1cGVyCj4+Pj4gwqDCoC0ga2lsbF9ibG9ja19zdXBlcgo+Pj4+IMKgwqAgLSBnZW5l
cmljX3NodXRkb3duX3N1cGVyCj4+Pj4gwqDCoMKgIC0gcHV0X3N1cGVyCj4+Pj4gwqDCoCAtIHN5
bmNfYmxvY2tkZXYKPj4+Pgo+Pj4+IDE3MjEgdm9pZCBraWxsX2Jsb2NrX3N1cGVyKHN0cnVjdCBz
dXBlcl9ibG9jayAqc2IpCj4+Pj4gMTcyMiB7Cj4+Pj4gMTcyM8KgwqDCoMKgwqDCoMKgwqAgc3Ry
dWN0IGJsb2NrX2RldmljZSAqYmRldiA9IHNiLT5zX2JkZXY7Cj4+Pj4gMTcyNAo+Pj4+IDE3MjXC
oMKgwqDCoMKgwqDCoMKgIGdlbmVyaWNfc2h1dGRvd25fc3VwZXIoc2IpOwo+Pj4+IDE3MjbCoMKg
wqDCoMKgwqDCoMKgIGlmIChiZGV2KSB7Cj4+Pj4gMTcyN8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHN5bmNfYmxvY2tkZXYoYmRldik7Cj4+Pj4gMTcyOMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGJkZXZfZnB1dChzYi0+c19iZGV2X2ZpbGUpOwo+Pj4+IDE3MjnCoMKg
wqDCoMKgwqDCoMKgIH0KPj4+PiAxNzMwIH0KPj4+Pgo+Pj4+PiArwqDCoMKgIGludmFsaWRhdGVf
YmRldihzYi0+c19iZGV2KTsKPj4+Cj4+PiBUaGlzIHdvcmtzIGZvciBhbiBmMmZzIGluc3RhbmNl
IG1vdW50ZWQgb24gYSBzaW5nbGUgZGV2aWNlLCBidXQgaXQgZG9lcwo+Pj4gbm90IHdvcmsgZm9y
IG11bHRpLWRldmljZSBjb25maWd1cmF0aW9ucywgYmVjYXVzZSB0aGUgdmZzIGNhbm5vdCBiZQo+
Pj4gYXdhcmUgb2YgRkRFVigxKS4KPj4KPj4gWWVhaCwgSSBtZWFudCB3ZSBjYW4gYXZvaWQgZHVw
bGljYXRlZCBzeW5jX2Jsb2NrZGV2KCkgZm9yIG1haW4gZGV2aWNlIGluCj4+IGYyZnNfcHV0X3N1
cGVyKCkuCj4+CgpUaGUgY2FsbCB0cmFjZSBjb3JyZXNwb25kaW5nIHRvIHRoaXMgcGF0Y2ggaXMg
YXMgZm9sbG93czoKCmtpbGxfYmxvY2tfc3VwZXIKIC0gZ2VuZXJpY19zaHV0ZG93bl9zdXBlcgog
IC0gZjJmc19wdXRfc3VwZXIKICAgLSBzeW5jX2Jsb2NrZGV2CiAgIC0gaW52YWxpZGF0ZV9iZGV2
CiAtIHN5bmNfYmxvY2tkZXYKClRoZXJlIGlzIGluZGVlZCBhIGR1cGxpY2F0ZWQgY2FsbCB0byBz
eW5jX2Jsb2NrZGV2KCkuIEhvd2V2ZXIsIHNpbmNlIGFsbApkYXRhIG11c3QgYmUgd3JpdHRlbiB0
byBkaXNrIGJlZm9yZSBpbnZhbGlkYXRlX2JkZXYoKSBpcyBjYWxsZWQsCmYyZnNfcHV0X3N1cGVy
KCkgbXVzdCBjYWxsIHN5bmNfYmxvY2tkZXYoKS4gQmVjYXVzZSBpbnZhbGlkYXRlX2JkZXYoKQpo
YXMgYWxyZWFkeSBjbGVhcmVkIHRoZSBwYWdlIGNhY2hlLCB0aGUgc2Vjb25kIGNhbGwgdG8gc3lu
Y19ibG9ja2RldigpCiBkb2VzIG5vdGhpbmcuCgo+Pj4KPj4+Pgo+Pj4+IEkgZ3Vlc3Mgd2UgY2Fu
IGxlYXZlIHRoZSBkZXZpY2Ugdy8gdXB0b2RhdGUgY2FjaGUsIGluIGNhc2UgaWYgdGhlcmUgYXJl
Cj4+Pj4gbXVsdGlwbGUgdXNlciBvbiB0aGUgZGV2aWNlPwo+Pj4KPj4+IFRoZSBwYWdlIGNhY2hl
IG9mIHRoZSBibG9jayBkZXZpY2UgZmlsZSBtYXkgY29udGFpbiBkYXRhIHRoYXQgaXMgbm90Cj4+
PiB1cHRvZGF0ZS4gRm9yIGV4YW1wbGUsIGRhdGEgbWF5IGZpcnN0IGJlIHJlYWQgZGlyZWN0bHkg
dGhyb3VnaCB0aGUgYmxvY2sKPj4gwqA+IGRldmljZSBmaWxlLCBhbmQgdGhlbiB0aGUgc2FtZSBi
bG9ja3MgbWF5IGJlIHdyaXR0ZW4gdGhyb3VnaCBmMmZzLgo+PiBTaW5jZT4gZjJmcyB3cml0ZXMg
dG8gdGhlIGJsb2NrIGRldmljZSB2aWEgdGhlIHN1Ym1pdF9iaW8gcGF0aCwgaXQKPj4gZG9lcyBu
b3QKPj4+IHVwZGF0ZSB0aGUgcGFnZSBjYWNoZSBvZiB0aGUgYmxvY2sgZGV2aWNlIGZpbGUuIEFz
IGEgcmVzdWx0LCB0aGUgZGF0YSBpbgo+Pj4gdGhlIGJsb2NrIGRldmljZSBmaWxl4oCZcyBwYWdl
IGNhY2hlIG1heSBiZWNvbWUgc3RhbGUuIFRoZXJlZm9yZSwgdGhlIHBhZ2UKPj4+IGNhY2hlIG11
c3QgYmUgaW52YWxpZGF0ZWQgZHVyaW5nIHVubW91bnQuCj4+Cj4+IFdlbGwsIGNhbiB3ZSBjYWxs
IGlvY3RsKGZkLCBCTEtGTFNCVUYpIGZvciBhbGwgZGV2aWNlcyBiZWxvbmcgdG8gZjJmcwo+PiBp
bWcgbGlrZQo+PiB5b3UgZGlkIGluICgiZjJmcy10b29sczogaW52YWxpZGF0ZSBibG9jayBkZXZp
Y2UgcGFnZSBjYWNoZSBiZWZvcmUKPj4gcmVhZGluZwo+PiBtZXRhZGF0YSIpLCBkb2VzIHRoYXQg
Zml4IHRoZSBpc3N1ZT8KPiAKPiBPaCwgeW91IGFscmVhZHkgY2FsbGVkIHRoZSBpb2N0bCBmb3Ig
YWxsIGRldmljZXMuIERvZXMgdGhhdCBmaXggdGhlIGlzc3VlPwo+IAoKWWVzLCB0aGF0IGNhbiBm
aXggdGhpcyBpc3N1ZS4gRnJvbSBhIHN5c3RlbSByb2J1c3RuZXNzIHBlcnNwZWN0aXZlLCBib3Ro
CnRoZSBrZXJuZWwgYW5kIGYyZnMtdG9vbHMgc2hvdWxkIGVuc3VyZSB0aGF0IHRoZSB1cHRvZGF0
ZSBkYXRhIGlzIHJlYWQuClRoZXJlZm9yZSwgSSBtYWRlIGNoYW5nZXMgaW4gYm90aC4KClRoYW5r
cwpZb25ncGVuZywKCj4gVGhhbmtzLAo+IAo+Pgo+PiBUaGFua3MsCj4+Cj4+Pgo+Pj4gVGhhbmtz
Cj4+PiBZb25ncGVuZywKPj4+Cj4+Pj4KPj4+PiBUaGFua3MsCj4+Pj4KPj4+Pj4gK8KgwqDCoCBm
b3IgKGkgPSAxOyBpIDwgc2JpLT5zX25kZXZzOyBpKyspIHsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IHN5bmNfYmxvY2tkZXYoRkRFVihpKS5iZGV2KTsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGludmFs
aWRhdGVfYmRldihGREVWKGkpLmJkZXYpOwo+Pj4+PiArwqDCoMKgIH0KPj4+Pj4gwqDCoCB9Cj4+
Pj4+IMKgwqAgwqAgaW50IGYyZnNfc3luY19mcyhzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBpbnQg
c3luYykKPj4+Pgo+Pj4+Cj4+Pj4KPj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+Pj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+Pj4g
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4+PiBodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4+Pgo+Pgo+
IAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
