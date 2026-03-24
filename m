Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LORJldbwmnQbwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 10:37:27 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B588C305B27
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Mar 2026 10:37:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ketX0noKl/4E7gTgbT4fh0fIjwuXSZ16aUqhoUKHhiA=; b=R5UJSfrPceGmzi7FQTYY2ZW+qm
	ApP7jMMv+e1eI0t9VARBZsXS1FjiciPm7oRpo/39EbDJ86wx7PZCeLEpi8nJVgLWcFC+HCwW+h5lq
	vfXl5kAy1l2fjGf+77DDOLRRiCaE4Ho13Ilwxyr6Eap8/2ILQGRTTngF80lCQa/hJ5YM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w4yCG-00036E-RU;
	Tue, 24 Mar 2026 09:37:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1w4yCG-000367-2s
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 09:37:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8ovUy9rDpjm7Z8Kj36znCcJsjfgvSufVbOHYJXtav+Y=; b=hqMCWqcaLhIbjVyCzRnRNfs4jp
 BEbj6kbnZ1r7hmNFBSATepayN6OcMqRJrjHtLM1A+h/vQxp4WvidjSiaBnF7SoI0ywVA7f8XGDs4Q
 dpwGO0G/G55KSj6SVXJCvjQkZkmQw/0xklWE+/al44Rrbc2Vrjg156RETGzAk8EVvltE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8ovUy9rDpjm7Z8Kj36znCcJsjfgvSufVbOHYJXtav+Y=; b=byGEcNuWpOy7jpWi0s4HBwRKhr
 xPi3mQl0zTb87eFi0Qemifg5ypv2/0HSrQhLU9yMjNcuiUhHDvhlKDJtGyYxoMDUsbzaZHq8EVlki
 0BZCUvoitVjCiqBJHb6M5oGnlGXz+9rCgIxlCDZOnfXtmjWb22t7l5Lwr/4/eLLGktDE=;
Received: from smtp153-170.sina.com.cn ([61.135.153.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w4yCE-00063a-R1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Mar 2026 09:37:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1774345030; bh=8ovUy9rDpjm7Z8Kj36znCcJsjfgvSufVbOHYJXtav+Y=;
 h=Message-ID:Date:Subject:From;
 b=HLQhuc7RJkQ+vopPH0xy+owByJh6oMRLrDT0vFIpLpkwQBeSLYSOYFwiVN9Ky3g/B
 GZrJfjwPOKP5JAt0UMhCy8HJLuEyhft+EgtPC9HKbi/LB/6XT/GxMwX6WdKzE3tcA5
 s/shJupfilNFhXa+cmyFcp1g2strZbWC/70Omm0A=
X-SMAIL-HELO: [10.189.138.37]
Received: from unknown (HELO [10.189.138.37])([114.247.175.249])
 by sina.com (10.54.253.34) with ESMTP
 id 69C25B3500004108; Tue, 24 Mar 2026 17:36:56 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 8773476291787
X-SMAIL-UIID: 43E2879A97E647D4ADEE2F28B01FB295-20260324-173656-1
Message-ID: <cadbb2c8-c404-4582-a0c2-45fe8c262127@sina.com>
Date: Tue, 24 Mar 2026 17:36:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260216112737.67408-1-monty_pavel@sina.com>
 <f331751b-08ad-42d2-ad23-37d21e1364f8@kernel.org>
 <c7bdf38f-4cf5-490b-8e0f-35f4574f4b81@sina.com>
 <9dc584cd-d2fb-4a85-b1d0-ded944064603@kernel.org>
 <507df28a-6415-445a-9e88-0f119ee7ce10@kernel.org>
 <3565eb34-944e-44a1-b349-ae54b9745051@sina.com>
 <f4039e35-b84f-4ec8-b9a3-70fcdd9277b2@kernel.org>
 <eb60f2ef-2c74-4c9d-9547-323042be5233@sina.com>
 <95c41d72-0bcf-46d3-883b-793265cfd8cc@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <95c41d72-0bcf-46d3-883b-793265cfd8cc@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/24/26 16:34, Chao Yu via Linux-f2fs-devel wrote: > On
 3/13/26 17:42, Yongpeng Yang wrote: >> >> On 3/13/26 15:19,
 Chao Yu via Linux-f2fs-devel
 wrote: >>> On 3/12/2026 7:34 PM, Yongpeng Yang wrote [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1w4yCE-00063a-R1
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail-archive.com:url,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: B588C305B27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMy8yNC8yNiAxNjozNCwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPiBP
biAzLzEzLzI2IDE3OjQyLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pgo+PiBPbiAzLzEzLzI2IDE1
OjE5LCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+Pj4gT24gMy8xMi8yMDI2
IDc6MzQgUE0sIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+Pj4KPj4+PiBPbiAzLzEyLzI2IDE4OjQ5
LCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+Pj4+PiBPbiAyMDI2LzMvMTIg
MTg6NDEsIENoYW8gWXUgd3JvdGU6Cj4+Pj4+PiBPbiAyMDI2LzMvMTIgMTE6NTYsIFlvbmdwZW5n
IFlhbmcgd3JvdGU6Cj4+Pj4+Pj4KPj4+Pj4+PiBPbiAzLzEyLzI2IDA4OjQ5LCBDaGFvIFl1IHZp
YSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+Pj4+Pj4+PiBPbiAyMDI2LzIvMTYgMTk6MjcsIFlv
bmdwZW5nIFlhbmcgd3JvdGU6Cj4+Pj4+Pj4+PiBGcm9tOiBZb25ncGVuZyBZYW5nIDx5YW5neW9u
Z3BlbmdAeGlhb21pLmNvbT4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBOZWl0aGVyIEYyRlMgbm9yIFZG
UyBpbnZhbGlkYXRlcyB0aGUgYmxvY2sgZGV2aWNlIHBhZ2UgY2FjaGUsIHdoaWNoCj4+Pj4+Pj4+
PiByZXN1bHRzIGluIHJlYWRpbmcgc3RhbGUgbWV0YWRhdGEuIEFuIGV4YW1wbGUgc2NlbmFyaW8g
aXMgc2hvd24KPj4+Pj4+Pj4+IGJlbG93Ogo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFRlcm1pbmFsIEHC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRlcm1pbmFsIEIKPj4+Pj4+Pj4+IG1v
dW50IC9kZXYvdmRiIC9tbnQvZjJmcwo+Pj4+Pj4+Pj4gdG91Y2ggbXggLy8gaW5vID0gNAo+Pj4+
Pj4+Pj4gc3luYwo+Pj4+Pj4+Pj4gZHVtcC5mMmZzIC1pIDQgL2Rldi92ZGIvLyBibG9jayBvbiAi
W1kvTl0iCj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgdG91Y2ggbXgyIC8vIGlubyA9IDUKPj4+Pj4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBz
eW5jCj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgdW1vdW50IC9tbnQvZjJmcwo+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGR1bXAuZjJm
cyAtaSA1IC9kZXYvdmRiIC8vIGJsb2NrIGFkZHIKPj4+Pj4+Pj4+IGlzIDAKPj4+Pj4+Pj4+Cj4+
Pj4+Pj4+PiBBZnRlciB1bW91bnQsIHRoZSBibG9jayBkZXZpY2UgcGFnZSBjYWNoZSBpcyBub3Qg
cHVyZ2VkLCBjYXVzaW5nCj4+Pj4+Pj4+PiBgZHVtcC5mMmZzIC1pIDUgL2Rldi92ZGJgIHRvIHJl
YWQgc3RhbGUgbWV0YWRhdGEgYW5kIHNlZSBpbm9kZSA1Cj4+Pj4+Pj4+PiB3aXRoCj4+Pj4+Pj4+
PiBibG9jayBhZGRyZXNzIDAuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gVGhpcyBwYXRjaCBjYWxscyBp
bnZhbGlkYXRlX2JkZXYgZHVyaW5nIHVtb3VudCB0byBpbnZhbGlkYXRlIHRoZQo+Pj4+Pj4+Pj4g
YmxvY2sKPj4+Pj4+Pj4+IGRldmljZSBwYWdlIGNhY2hlLCBwcmV2ZW50aW5nIHN0YWxlIG1ldGFk
YXRhIGZyb20gYmVpbmcgcmVhZC4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBZ
b25ncGVuZyBZYW5nIDx5YW5neW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4+Pj4+Pj4+IC0tLQo+Pj4+
Pj4+Pj4gwqDCoMKgIGZzL2YyZnMvc3VwZXIuYyB8IDYgKysrKysrCj4+Pj4+Pj4+PiDCoMKgwqAg
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IGRpZmYg
LS1naXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKPj4+Pj4+Pj4+IGluZGV4
IDFhNzU1OTk3YWZmNS4uMzlkM2I1MmNlYWMxIDEwMDY0NAo+Pj4+Pj4+Pj4gLS0tIGEvZnMvZjJm
cy9zdXBlci5jCj4+Pj4+Pj4+PiArKysgYi9mcy9mMmZzL3N1cGVyLmMKPj4+Pj4+Pj4+IEBAIC0y
MDkxLDYgKzIwOTEsMTIgQEAgc3RhdGljIHZvaWQgZjJmc19wdXRfc3VwZXIoc3RydWN0Cj4+Pj4+
Pj4+PiBzdXBlcl9ibG9jayAqc2IpCj4+Pj4+Pj4+PiDCoMKgwqAgI2lmIElTX0VOQUJMRUQoQ09O
RklHX1VOSUNPREUpCj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCB1dGY4X3VubG9hZChzYi0+c19l
bmNvZGluZyk7Cj4+Pj4+Pj4+PiDCoMKgwqAgI2VuZGlmCj4+Pj4+Pj4+PiArwqDCoMKgIHN5bmNf
YmxvY2tkZXYoc2ItPnNfYmRldik7Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFdlIHdpbGwgY2FsbCBzeW5j
X2Jsb2NrZGV2IGluIGJlbG93IHBhdGg/Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IC0ga2lsbF9mMmZzX3N1
cGVyCj4+Pj4+Pj4+IMKgwqDCoC0ga2lsbF9ibG9ja19zdXBlcgo+Pj4+Pj4+PiDCoMKgwqAgLSBn
ZW5lcmljX3NodXRkb3duX3N1cGVyCj4+Pj4+Pj4+IMKgwqDCoMKgIC0gcHV0X3N1cGVyCj4+Pj4+
Pj4+IMKgwqDCoCAtIHN5bmNfYmxvY2tkZXYKPj4+Pj4+Pj4KPj4+Pj4+Pj4gMTcyMSB2b2lkIGtp
bGxfYmxvY2tfc3VwZXIoc3RydWN0IHN1cGVyX2Jsb2NrICpzYikKPj4+Pj4+Pj4gMTcyMiB7Cj4+
Pj4+Pj4+IDE3MjPCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYgPSBz
Yi0+c19iZGV2Owo+Pj4+Pj4+PiAxNzI0Cj4+Pj4+Pj4+IDE3MjXCoMKgwqDCoMKgwqDCoMKgIGdl
bmVyaWNfc2h1dGRvd25fc3VwZXIoc2IpOwo+Pj4+Pj4+PiAxNzI2wqDCoMKgwqDCoMKgwqDCoCBp
ZiAoYmRldikgewo+Pj4+Pj4+PiAxNzI3wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
c3luY19ibG9ja2RldihiZGV2KTsKPj4+Pj4+Pj4gMTcyOMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGJkZXZfZnB1dChzYi0+c19iZGV2X2ZpbGUpOwo+Pj4+Pj4+PiAxNzI5wqDCoMKg
wqDCoMKgwqDCoCB9Cj4+Pj4+Pj4+IDE3MzAgfQo+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gK8KgwqDCoCBp
bnZhbGlkYXRlX2JkZXYoc2ItPnNfYmRldik7Cj4+Pj4+Pj4KPj4+Pj4+PiBUaGlzIHdvcmtzIGZv
ciBhbiBmMmZzIGluc3RhbmNlIG1vdW50ZWQgb24gYSBzaW5nbGUgZGV2aWNlLCBidXQgaXQKPj4+
Pj4+PiBkb2VzCj4+Pj4+Pj4gbm90IHdvcmsgZm9yIG11bHRpLWRldmljZSBjb25maWd1cmF0aW9u
cywgYmVjYXVzZSB0aGUgdmZzIGNhbm5vdCBiZQo+Pj4+Pj4+IGF3YXJlIG9mIEZERVYoMSkuCj4+
Pj4+Pgo+Pj4+Pj4gWWVhaCwgSSBtZWFudCB3ZSBjYW4gYXZvaWQgZHVwbGljYXRlZCBzeW5jX2Js
b2NrZGV2KCkgZm9yIG1haW4KPj4+Pj4+IGRldmljZSBpbgo+Pj4+Pj4gZjJmc19wdXRfc3VwZXIo
KS4KPj4+Pj4+Cj4+Pj4KPj4+PiBUaGUgY2FsbCB0cmFjZSBjb3JyZXNwb25kaW5nIHRvIHRoaXMg
cGF0Y2ggaXMgYXMgZm9sbG93czoKPj4+Pgo+Pj4+IGtpbGxfYmxvY2tfc3VwZXIKPj4+PiDCoCAt
IGdlbmVyaWNfc2h1dGRvd25fc3VwZXIKPj4+PiDCoMKgIC0gZjJmc19wdXRfc3VwZXIKPj4+PiDC
oMKgwqAgLSBzeW5jX2Jsb2NrZGV2Cj4+Pj4gwqDCoMKgIC0gaW52YWxpZGF0ZV9iZGV2Cj4+Pj4g
wqAgLSBzeW5jX2Jsb2NrZGV2Cj4+Pj4KPj4+PiBUaGVyZSBpcyBpbmRlZWQgYSBkdXBsaWNhdGVk
IGNhbGwgdG8gc3luY19ibG9ja2RldigpLiBIb3dldmVyLCBzaW5jZSBhbGwKPj4+PiBkYXRhIG11
c3QgYmUgd3JpdHRlbiB0byBkaXNrIGJlZm9yZSBpbnZhbGlkYXRlX2JkZXYoKSBpcyBjYWxsZWQs
Cj4+Pj4gZjJmc19wdXRfc3VwZXIoKSBtdXN0IGNhbGwgc3luY19ibG9ja2RldigpLiBCZWNhdXNl
IGludmFsaWRhdGVfYmRldigpCj4+Pj4gaGFzIGFscmVhZHkgY2xlYXJlZCB0aGUgcGFnZSBjYWNo
ZSwgdGhlIHNlY29uZCBjYWxsIHRvIHN5bmNfYmxvY2tkZXYoKQo+Pj4+IMKgIGRvZXMgbm90aGlu
Zy4KPj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEkgZ3Vlc3Mgd2UgY2FuIGxlYXZlIHRo
ZSBkZXZpY2Ugdy8gdXB0b2RhdGUgY2FjaGUsIGluIGNhc2UgaWYKPj4+Pj4+Pj4gdGhlcmUgYXJl
Cj4+Pj4+Pj4+IG11bHRpcGxlIHVzZXIgb24gdGhlIGRldmljZT8KPj4+Pj4+Pgo+Pj4+Pj4+IFRo
ZSBwYWdlIGNhY2hlIG9mIHRoZSBibG9jayBkZXZpY2UgZmlsZSBtYXkgY29udGFpbiBkYXRhIHRo
YXQgaXMgbm90Cj4+Pj4+Pj4gdXB0b2RhdGUuIEZvciBleGFtcGxlLCBkYXRhIG1heSBmaXJzdCBi
ZSByZWFkIGRpcmVjdGx5IHRocm91Z2ggdGhlCj4+Pj4+Pj4gYmxvY2sKPj4+Pj4+IMKgwqA+IGRl
dmljZSBmaWxlLCBhbmQgdGhlbiB0aGUgc2FtZSBibG9ja3MgbWF5IGJlIHdyaXR0ZW4gdGhyb3Vn
aCBmMmZzLgo+Pj4+Pj4gU2luY2U+IGYyZnMgd3JpdGVzIHRvIHRoZSBibG9jayBkZXZpY2Ugdmlh
IHRoZSBzdWJtaXRfYmlvIHBhdGgsIGl0Cj4+Pj4+PiBkb2VzIG5vdAo+Pj4+Pj4+IHVwZGF0ZSB0
aGUgcGFnZSBjYWNoZSBvZiB0aGUgYmxvY2sgZGV2aWNlIGZpbGUuIEFzIGEgcmVzdWx0LCB0aGUK
Pj4+Pj4+PiBkYXRhIGluCj4+Pj4+Pj4gdGhlIGJsb2NrIGRldmljZSBmaWxl4oCZcyBwYWdlIGNh
Y2hlIG1heSBiZWNvbWUgc3RhbGUuIFRoZXJlZm9yZSwgdGhlCj4+Pj4+Pj4gcGFnZQo+Pj4+Pj4+
IGNhY2hlIG11c3QgYmUgaW52YWxpZGF0ZWQgZHVyaW5nIHVubW91bnQuCj4+Pj4+Pgo+Pj4+Pj4g
V2VsbCwgY2FuIHdlIGNhbGwgaW9jdGwoZmQsIEJMS0ZMU0JVRikgZm9yIGFsbCBkZXZpY2VzIGJl
bG9uZyB0byBmMmZzCj4+Pj4+PiBpbWcgbGlrZQo+Pj4+Pj4geW91IGRpZCBpbiAoImYyZnMtdG9v
bHM6IGludmFsaWRhdGUgYmxvY2sgZGV2aWNlIHBhZ2UgY2FjaGUgYmVmb3JlCj4+Pj4+PiByZWFk
aW5nCj4+Pj4+PiBtZXRhZGF0YSIpLCBkb2VzIHRoYXQgZml4IHRoZSBpc3N1ZT8KPj4+Pj4KPj4+
Pj4gT2gsIHlvdSBhbHJlYWR5IGNhbGxlZCB0aGUgaW9jdGwgZm9yIGFsbCBkZXZpY2VzLiBEb2Vz
IHRoYXQgZml4IHRoZQo+Pj4+PiBpc3N1ZT8KPj4+Pj4KPj4+Pgo+Pj4+IFllcywgdGhhdCBjYW4g
Zml4IHRoaXMgaXNzdWUuIEZyb20gYSBzeXN0ZW0gcm9idXN0bmVzcyBwZXJzcGVjdGl2ZSwgYm90
aAo+Pj4+IHRoZSBrZXJuZWwgYW5kIGYyZnMtdG9vbHMgc2hvdWxkIGVuc3VyZSB0aGF0IHRoZSB1
cHRvZGF0ZSBkYXRhIGlzIHJlYWQuCj4+Pj4gVGhlcmVmb3JlLCBJIG1hZGUgY2hhbmdlcyBpbiBi
b3RoLgo+Pj4KPj4+IFdlbGwsIEkgdGhpbmsgaXQgd2lsbCBiZSBhIGxpdHRsZSBiaXQgb3ZlcnBy
b3RlY3RpdmUsIGJlY2F1c2UgZjJmcyBrZXJuZWwKPj4+IG1vZHVsZSBpdHNlbGYgZG9lc24ndCBz
dWZmZXIgYW55IGlzc3VlLCBhbmQgZHVtcC5mMmZzIGFscmVhZHkgaGFzIGl0cwo+Pj4gd2F5IHRv
IGF2b2lkIGFjY2Vzc2luZyBzdGFsZSBkYXRhIHcvIHlvdXIgY2hhbmdlLgo+Pgo+PiBJIG92ZXJs
b29rZWQgdGhlIHBlcm1pc3Npb24gY2hlY2sgaW4gYmxrZGV2X2ZsdXNoYnVmLiBBZnRlciB1bm1v
dW50LAo+PiBub24tcm9vdCB1c2VycyBtYXkgc3RpbGwgcmVhZCBzdGFsZSBkYXRhLiBUaGVyZWZv
cmUsIGl0IGlzIHN0aWxsCj4+IG5lY2Vzc2FyeSB0byBlbnN1cmUgdGhhdCB0aGUgcGFnZSBjYWNo
ZSBpcyBpbnZhbGlkYXRlZCBhZnRlciB1bm1vdW50Lgo+Pgo+PiBibGtkZXZfaW9jdGwKPj4gIC0g
YmxrZGV2X2NvbW1vbl9pb2N0bAo+PiAgIC0gYmxrZGV2X2ZsdXNoYnVmCj4+Cj4+IHN0YXRpYyBp
bnQgYmxrZGV2X2ZsdXNoYnVmKHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYsIHVuc2lnbmVkIGNt
ZCwKPj4gICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYXJnKQo+PiB7Cj4+ICAgICAgICAg
aWYgKCFjYXBhYmxlKENBUF9TWVNfQURNSU4pKQo+PiAgICAgICAgICAgICAgICAgcmV0dXJuIC1F
QUNDRVM7Cj4gCj4gV2VsbCwgY2FuIHlvdSBkZXNjcmliZSB0aGUgcmFjZSBjYXNlIHRoYXQgbm9u
LXJvb3QgdXNlciBzdGlsbCByZWFkIHN0YWxlIGRhdGEKPiBpbiBjb21taXQgbWVzc2FnZT8KPiAK
Pj4KPj4gSSBhbHNvIG5vdGljZWQgdGhhdCBidHJmcyBoYXMgZW5jb3VudGVyZWQgYSBzaW1pbGFy
IGlzc3VlOgo+PiBodHRwczovL21haWwtYXJjaGl2ZS5jb20vbGludXgtYnRyZnNAdmdlci5rZXJu
ZWwub3JnL21zZzU0MTg4Lmh0bWwKPiAKPiBBbmQgaW5jbHVkaW5nIHRoaXMgZXhhbXBsZSBhcyB3
ZWxsLgoKT0ssIEknbGwgYWRkIHRoZXNlIHRvIGNvbW1pdCBtZXNzYWdlIGluIHYyIHBhdGNoLgoK
VGhhbmtzCllvbmdwZW5nLAoKPiAKPiBUaGFua3MsCj4gCj4+Cj4+IEluIHRoYXQgZGlzY3Vzc2lv
biwgdGhlIHNvbHV0aW9uIHdhcyB0byBjYWxsIGludmFsaWRhdGVfYmRldigpIHdoZW4gdGhlCj4+
IGRldmljZSBpcyBjbG9zZWQuCj4+Cj4+IFRoYW5rcwo+PiBZb25ncGVuZywKPj4KPj4+Cj4+PiBU
aGFua3MsCj4+Pgo+Pj4+Cj4+Pj4gVGhhbmtzCj4+Pj4gWW9uZ3BlbmcsCj4+Pj4KPj4+Pj4gVGhh
bmtzLAo+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IFRoYW5rcywKPj4+Pj4+Cj4+Pj4+Pj4KPj4+Pj4+PiBU
aGFua3MKPj4+Pj4+PiBZb25ncGVuZywKPj4+Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBUaGFua3Ms
Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiArwqDCoMKgIGZvciAoaSA9IDE7IGkgPCBzYmktPnNfbmRldnM7
IGkrKykgewo+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHN5bmNfYmxvY2tkZXYoRkRFVihpKS5i
ZGV2KTsKPj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpbnZhbGlkYXRlX2JkZXYoRkRFVihpKS5i
ZGV2KTsKPj4+Pj4+Pj4+ICvCoMKgwqAgfQo+Pj4+Pj4+Pj4gwqDCoMKgIH0KPj4+Pj4+Pj4+IMKg
wqDCoCDCoCBpbnQgZjJmc19zeW5jX2ZzKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIGludCBzeW5j
KQo+Pj4+Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+PgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
