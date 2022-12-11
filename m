Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C58649432
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 11 Dec 2022 13:30:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4LTS-0005j0-P8;
	Sun, 11 Dec 2022 12:30:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ssawgyw@gmail.com>) id 1p4LTQ-0005ih-Ii
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Dec 2022 12:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TXB5W428WcmiLDh9olLI0YAELLNF2UnndQkJgDlXhtk=; b=i8j371rNjMe+0Iz23G2lmz+o9b
 PPDz3ksI3nPS8MAftPOEqXIOV6ZISeMdqxLiPiiZtCUCxFuplZV+wGNHrwtAblQYiHdVbv8l9RkYq
 bNKeLvVr0ioSV5wiHGj7rPRn3SkzMU7eGg5vy+CqY468M8o4lUOgDEyOyPbSx1WqWhfM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TXB5W428WcmiLDh9olLI0YAELLNF2UnndQkJgDlXhtk=; b=fdvFsJKfIg9W7dcFcJLPDbWVaF
 xuiUAf3FIMVSTfvd8Y2kdoX/SjaiZ1evjUISwlbpp8x1UJ8jldCdv8KO74IJrSV8mckTuwJY9De80
 D/IsCfJRuw9uA+Jehe81fFbZ9fsspMIBF026H8B23ienNYx3BPcT6W1Mp0cbIe96uX2o=;
Received: from mail-pl1-f173.google.com ([209.85.214.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p4LTN-0006lJ-Ub for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 11 Dec 2022 12:30:27 +0000
Received: by mail-pl1-f173.google.com with SMTP id t2so6390025ply.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 11 Dec 2022 04:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TXB5W428WcmiLDh9olLI0YAELLNF2UnndQkJgDlXhtk=;
 b=KoKtLqBOByRsEcfyjWQLuoxwGM6iAXlVuWfSMJXj9gBME51IW/0T1ov2mSja5aLe0k
 CZrLrdq7nVtdxx4W+kmUZXSK+MCyz+oe8mfuZnDeH32DxROtXrP3k5xQb46uskeXZfN5
 mtTBe4T7GKZvsm79NJFSxYX1nZ2l+YyyHXYi4DJsnI/DwruI/SYZ+e632zlegMxYxW8G
 TIym35cFXDp5I2wtgeUynjAQIHYETZql6kELmLYGJhos2h6fL6FXEsI0IwjAASWRa+um
 annuXZ0cwr0d5pf4ayx5w/5rsxfgL/oFVxzauPt5PlpI+Hu8w0TnDeXGtdF7iXTnRD21
 rlgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TXB5W428WcmiLDh9olLI0YAELLNF2UnndQkJgDlXhtk=;
 b=2EoHOqWJdjMjV4z2qEaJVrd764YX8aeAjIugJENHg/rD3Et9j/eNyCedxvzSmtFj12
 YKeH66wRdjX9MEwf2fN6TFBX+Q64u6nxa82TeB/cNcwJyQ8ATsVk9S6h1SwgkiCQx6NW
 nqjcsjTBYH+l7R7EZIjwqIO31KHXi0SRHINP6w5z+aAI1rREahipzaylnI5rEUFuox/B
 u3gsgyxcrqGWzBg3BtZGhyboZuWeyZNcQQOG3qUuP5GtJ9X8ApTN1lhb7xig+qlU/E0Y
 oMSQ8RdxQ1SuszXPMLlk/1h4qi9jpu/V9XwUKFMvbVqXtwKvdsEvFTvKlt7XMVRB6U66
 xyKw==
X-Gm-Message-State: ANoB5pk7apD4SaGgtidV2g/IAJTi32lvAM+gH197lEgVbbxotTxwdkRr
 L1mSQrxuysTLM4wdKmIC1Db5M7yQdE6rDA==
X-Google-Smtp-Source: AA0mqf5KGDAJiOQZeIj6Gt4exWhqZP2aizPD5q3LuOo2o9CDxLBTTIMEfZaGP3etGnf+MCPuvTU+Fg==
X-Received: by 2002:a17:902:e30a:b0:189:deeb:8c94 with SMTP id
 q10-20020a170902e30a00b00189deeb8c94mr11162599plc.22.1670761816017; 
 Sun, 11 Dec 2022 04:30:16 -0800 (PST)
Received: from [127.0.0.1] (ec2-18-162-209-88.ap-east-1.compute.amazonaws.com.
 [18.162.209.88]) by smtp.gmail.com with ESMTPSA id
 x19-20020a633113000000b00478dad38eacsm3528425pgx.38.2022.12.11.04.30.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 04:30:15 -0800 (PST)
Message-ID: <3b51e6ae-5df5-60c4-3261-557b44e34291@gmail.com>
Date: Sun, 11 Dec 2022 20:30:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
References: <20221209112813.73700-1-Yuwei.Guan@zeekrlife.com>
 <810bd221-1f35-db79-e9f3-a521464b3eaf@kernel.org>
From: Yuwei Guan <ssawgyw@gmail.com>
In-Reply-To: <810bd221-1f35-db79-e9f3-a521464b3eaf@kernel.org>
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2022/12/11 10:52, Chao Yu 写道: > On 2022/12/9 19:28,
    Yuwei Guan wrote: >> In non-foreground gc mode, if no victim is selected,
    the gc process >> will wait for no_gc_sleep_time before waking up [...] 
 
 Content analysis details:   (-2.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [ssawgyw[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.214.173 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.214.173 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1p4LTN-0006lJ-Ub
Subject: Re: [f2fs-dev] [PATCH] f2fs: do decrease_sleep_time() if any of the
 victims have been selected
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

CgrlnKggMjAyMi8xMi8xMSAxMDo1MiwgQ2hhbyBZdSDlhpnpgZM6Cj4gT24gMjAyMi8xMi85IDE5
OjI4LCBZdXdlaSBHdWFuIHdyb3RlOgo+PiBJbiBub24tZm9yZWdyb3VuZCBnYyBtb2RlLCBpZiBu
byB2aWN0aW0gaXMgc2VsZWN0ZWQsIHRoZSBnYyBwcm9jZXNzCj4+IHdpbGwgd2FpdCBmb3Igbm9f
Z2Nfc2xlZXBfdGltZSBiZWZvcmUgd2FraW5nIHVwIGFnYWluLiBJbiB0aGlzCj4+IHN1YnNlcXVl
bnQgdGltZSwgZXZlbiB0aG91Z2ggYSB2aWN0aW0gd2lsbCBiZSBzZWxlY3RlZCwgdGhlIGdjIHBy
b2Nlc3MKPj4gc3RpbGwgd2FpdHMgZm9yIG5vX2djX3NsZWVwX3RpbWUgYmVmb3JlIHdha2luZyB1
cC4gVGhlIGNvbmZpZ3VyYXRpb24KPj4gb2Ygd2FpdF9tcyBpcyBub3QgcmVhc29uYWJsZS4KPj4K
Pj4gQWZ0ZXIgYW55IG9mIHRoZSB2aWN0aW1zIGhhdmUgYmVlbiBzZWxlY3RlZCwgd2UgbmVlZCB0
byBkbwo+PiBkZWNyZWFzZV9zbGVlcF90aW1lKCkgdG8gcmVkdWNlIHdhaXRfbXMuCj4+Cj4+IElm
IGl0IGlzIEdDX1VSR0VOVF9ISUdIIG9yIEdDX1VSR0VOVF9NSUQgZ2MgbW9kZSwKPj4gd2FpdF9t
cyB3aWxsIGtlZXAgdXJnZW50X3NsZWVwX3RpbWUgYWZ0ZXIgZXhlY3V0aW5nIAo+PiBkZWNyZWFz
ZV9zbGVlcF90aW1lKCkuCj4+Cj4+IEluIGRlY3JlYXNlX3NsZWVwX3RpbWUoKSB3YWl0X3RpbWUg
d2lsbCBiZSByZWR1Y2VkIHRvIG1heF9zbGVlcF90aW1lCj4+IGZyb20gbm9fZ2Nfc2xlZXBfdGlt
ZSwgaWYgKndhaXQgaXMgbm9fZ2Nfc2xlZXBfdGltZS4gQW5kIHRoZW4gaXQgZ29lcwo+PiBkb3du
IGluIHRoZSBuZXh0IHN0ZXAuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFl1d2VpIEd1YW4gPFl1d2Vp
Lkd1YW5AemVla3JsaWZlLmNvbT4KPj4gLS0tCj4+IMKgIGZzL2YyZnMvZ2MuYyB8IDIgKysKPj4g
wqAgZnMvZjJmcy9nYy5oIHwgNyArKysrKystCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2djLmMg
Yi9mcy9mMmZzL2djLmMKPj4gaW5kZXggZjBjNjUwNmQ4OTc1Li5jMDIzZmZlYjkyNjggMTAwNjQ0
Cj4+IC0tLSBhL2ZzL2YyZnMvZ2MuYwo+PiArKysgYi9mcy9mMmZzL2djLmMKPj4gQEAgLTE0MSw2
ICsxNDEsOCBAQCBzdGF0aWMgaW50IGdjX3RocmVhZF9mdW5jKHZvaWQgKmRhdGEpCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIGRvbid0IGJvdGhlciB3YWl0X21zIGJ5IGZvcmVncm91
bmQgZ2MgKi8KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFmb3JlZ3JvdW5kKQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdhaXRfbXMgPSBnY190aC0+bm9f
Z2Nfc2xlZXBfdGltZTsKPj4gK8KgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGRlY3JlYXNlX3NsZWVwX3RpbWUoZ2NfdGgsICZ3YWl0X21zKTsKPiAKPiBP
bmNlIEJHR0Mgc2VsZWN0cyB2YWxpZCB2aWN0aW0sIGl0IHdpbGwgZ28gZmFzdGVyIGFuZCBmYXRl
cj8KPiA+IEhvdyBhYm91dDoKPiAKPiAgwqDCoMKgwqB9IGVsc2Ugewo+ICDCoMKgwqDCoMKgwqDC
oCAvKiByZXNldCB3YWl0X21zIHRvIGRlZmF1bHQgc2xlZXAgdGltZSAqLwo+ICDCoMKgwqDCoMKg
wqDCoCBpZiAod2FpdF9tcyA9PSBnY190aC0+bm9fZ2Nfc2xlZXBfdGltZSkKPiAgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB3YWl0X21zID0gZ2NfdGgtPm1pbl9zbGVlcF90aW1lOwo+ICDCoMKgwqDC
oH0KSW5kZWVkLiBpdCB3aWxsIGdvIGZhc3RlciBhbmQgZmF0ZXIsIHVudGlsIHdhaXRfbXMgcmVk
dWNlcyB0byAKbWluX3NsZWVwX3RpbWUuIEJ1dCB5b3VyIHN1Z2dlc3Rpb24gc2VlbXMgbW9yZSBy
ZWFzb25hYmxlLCBJIHdpbGwgc2VuZCAKaXQgaW4gdjIgcGF0Y2guCj4gCj4gVGhhbmtzLAo+IAo+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGZvcmVncm91
bmQpCj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2djLmggYi9mcy9mMmZzL2djLmgKPj4gaW5kZXgg
MTliOTU2YzJkNjk3Li42NDAyNTg0ZGNkNzIgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvZ2MuaAo+
PiArKysgYi9mcy9mMmZzL2djLmgKPj4gQEAgLTE1MCw4ICsxNTAsMTMgQEAgc3RhdGljIGlubGlu
ZSB2b2lkIGRlY3JlYXNlX3NsZWVwX3RpbWUoc3RydWN0IAo+PiBmMmZzX2djX2t0aHJlYWQgKmdj
X3RoLAo+PiDCoCB7Cj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IG1pbl90aW1lID0gZ2NfdGgt
Pm1pbl9zbGVlcF90aW1lOwo+PiAtwqDCoMKgIGlmICgqd2FpdCA9PSBnY190aC0+bm9fZ2Nfc2xl
ZXBfdGltZSkKPj4gK8KgwqDCoCBpZiAoKndhaXQgPT0gZ2NfdGgtPnVyZ2VudF9zbGVlcF90aW1l
KQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+PiArCj4+ICvCoMKgwqAgaWYgKCp3YWl0ID09
IGdjX3RoLT5ub19nY19zbGVlcF90aW1lKSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAqd2FpdCA9
IGdjX3RoLT5tYXhfc2xlZXBfdGltZTsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4gK8Kg
wqDCoCB9Cj4+IMKgwqDCoMKgwqAgaWYgKChsb25nIGxvbmcpKndhaXQgLSAobG9uZyBsb25nKW1p
bl90aW1lIDwgKGxvbmcgbG9uZyltaW5fdGltZSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgICp3YWl0
ID0gbWluX3RpbWU7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=
