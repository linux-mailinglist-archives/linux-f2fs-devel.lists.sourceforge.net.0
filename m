Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E38708481
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 May 2023 17:02:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pzf99-0003cq-Dh;
	Thu, 18 May 2023 15:02:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wubo.oduw@gmail.com>) id 1pzf97-0003ck-O0
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 15:02:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CoK00IvDzsh9+aKqB45P/1hvIg+G2G4PV8ZXqUFsdcU=; b=dJSdPdsCvXaXVj+hApBN26y4+F
 V/hY/h92UqZdKdOoIWmSpGE94mFQuc7/ujm7XvhELto7PmRSIXsZ1YmwwgW65rv7e08sK5hCI8gma
 4C5emk9iQxEviVhlKXHYA+PKRs6DdSXR+u+W6LQQWapOEtJGplqKoSvENAM6+C3UQXMg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CoK00IvDzsh9+aKqB45P/1hvIg+G2G4PV8ZXqUFsdcU=; b=Ydbdg/9Y8JPGRY4vc3a/ZiRo11
 XCs/pPwEXOx9hb4DaMfZ0A+31DLwz89WhMJj6srXrYASQdxttu5DO/rgt2JwyyRnJCVIl7LR3fR7k
 4TSmDwt0CK2Aa0xziqN5zy3j/f6nF9hflrdl8nnHFypE7H0e1psA2lDlVmTcah2saq7M=;
Received: from mail-pf1-f177.google.com ([209.85.210.177])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pzf93-00CSD2-I8 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 15:02:25 +0000
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-64d24136663so392513b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 May 2023 08:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684422136; x=1687014136;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CoK00IvDzsh9+aKqB45P/1hvIg+G2G4PV8ZXqUFsdcU=;
 b=V1fbw1T77nRy/lhnGOpp6lridH1ahnJP6ytYDL0MYFtupEvD6uoYezzJsYe2+E3879
 laMaQ9LsISaOIja7y6pYu3b8NQd5tMKkr/tjDzsYcxhRVoBTEbxmfyulNB7LldaFpsYO
 WxzN1hjcHlYlu0XWY+Y4P7aBSCSi3nGrzehFBTvS848iOA1wNG2aB8KsYfHCVJD+392T
 +zukQrqVmKd6Dv8DNLRStWH0CZJN/NCMfs97IyqyDDPsOPkPuZmuH2l2ssMTxR9z0T4r
 nh5GHbz8iy58BKDk/SNC0TFQzaHGJNgUUr0fa9tqEqfODOBAs6a9HphFNMF4jsdNb8Gz
 h4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684422136; x=1687014136;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CoK00IvDzsh9+aKqB45P/1hvIg+G2G4PV8ZXqUFsdcU=;
 b=MvXI0OeURf3EGHIW9e5VhwzF95UT7yby3mvAKgc0BZJ5WFm7MjY3LxQRZ9IHHGjSo5
 +7QuY3BLRPGtzdJZc3wgzYap59pymGPkXQyUPvIoXpumy3f8CH5dA+u3zkNUJEdt6f5W
 Vavq8PKEKNxuUobFVgga+DgWUEY3LYf3fRh1uimm7gbUQtdISsA4652SmTtCEEo5jePO
 2LRidzljgB4Ck3o4O9O9IIWCwq09oVOgVkQ7KqhILJFTaACQbCsnvuNVlO7hNHiPsI0C
 seuC8ZkU5e33dzBax9hJ0s4rkQr789tY7ykfxLQEpHqlmh4XMaSFgDzNS7SptCd/jVMw
 hFXA==
X-Gm-Message-State: AC+VfDxaYjJnFnb0Ki5SOFJjZ6tqeIJhCDvyBTwR+5VL7kg8JGCgRed3
 kEaik1zHQGUJdW5HHvWOPGs=
X-Google-Smtp-Source: ACHHUZ5qzHzd+aA8YOxF00DGxYrRuJgDbYOuvZESK2dR2HifWO/8GD9pCKskudbbvr8UsaZuio7iNQ==
X-Received: by 2002:aa7:88cf:0:b0:625:efa4:4c01 with SMTP id
 k15-20020aa788cf000000b00625efa44c01mr5329631pff.3.1684422135734; 
 Thu, 18 May 2023 08:02:15 -0700 (PDT)
Received: from [192.168.50.227] (n119236112082.netvigator.com.
 [119.236.112.82]) by smtp.gmail.com with ESMTPSA id
 e19-20020aa78c53000000b0063d2bb0d107sm1465767pfd.64.2023.05.18.08.02.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 May 2023 08:02:15 -0700 (PDT)
Message-ID: <ff35b3fa-5af8-ac9b-3fae-d60c422c4393@gmail.com>
Date: Thu, 18 May 2023 23:02:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <45eb63c6-a147-776a-99b5-7ac06848ede8@kernel.org>
 <20230517035953.47810-1-bo.wu@vivo.com>
 <94958409-f726-9da6-3b9f-76efa022ee9d@kernel.org>
 <4a512db8-cfca-80a5-ba62-780f56d014f6@gmail.com>
 <ZGVyOTqQy5ZhNvAr@google.com>
Content-Language: en-US
From: Wu Bo <wubo.oduw@gmail.com>
In-Reply-To: <ZGVyOTqQy5ZhNvAr@google.com>
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/18 08:32, Jaegeuk Kim wrote: > On 05/17,
 Wu Bo wrote:
 >> On 2023/5/17 16:36, Chao Yu wrote: >>> On 2023/5/17 11:59, Wu Bo wrote:
 >>>> On 2023/5/17 10:44, Chao Yu wrote: >>>>> On 2023/5/16 20 [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [wubo.oduw[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.177 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.177 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1pzf93-00CSD2-I8
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: pass I_NEW flag to trace event
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
Cc: linux-kernel@vger.kernel.org, Wu Bo <bo.wu@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy81LzE4IDA4OjMyLCBKYWVnZXVrIEtpbSB3cm90ZToKPiBPbiAwNS8xNywgV3UgQm8g
d3JvdGU6Cj4+IE9uIDIwMjMvNS8xNyAxNjozNiwgQ2hhbyBZdSB3cm90ZToKPj4+IE9uIDIwMjMv
NS8xNyAxMTo1OSwgV3UgQm8gd3JvdGU6Cj4+Pj4gT24gMjAyMy81LzE3IDEwOjQ0LCBDaGFvIFl1
IHdyb3RlOgo+Pj4+PiBPbiAyMDIzLzUvMTYgMjA6MDcsIFd1IEJvIHdyb3RlOgo+Pj4+Pj4gTW9k
aWZ5IHRoZSBvcmRlciBiZXR3ZWVuICd0cmFjZV9mMmZzX2lnZXQnICYKPj4+Pj4+ICd1bmxvY2tf
bmV3X2lub2RlJywgc28gdGhlCj4+Pj4+PiBJX05FVyBjYW4gcGFzcyB0byB0aGUgdHJhY2UgZXZl
bnQgd2hlbiB0aGUgaW5vZGUgaW5pdGlhbGlzZWQuCj4+Pj4+IFdoeSBpcyBpdCBuZWVkZWQ/IEFu
ZCB0cmFjZV9mMmZzX2lnZXQoKSB3b24ndCBwcmludCBpbm9kZS0+aV9zdGF0ZT8KPj4+PiBXaGVu
IGNvbm5lY3QgYSB0cmFjZV9wcm9iZSB0byBmMmZzX2lnZXQsIGl0IHdpbGwgYmUgYWJsZSB0bwo+
Pj4+IGRldGVybWluZSB3aGV0aGVyCj4+Pj4gdGhlIGlub2RlIGlzIG5ldyBpbml0aWFsaXNlZCBp
biBvcmRlciB0byBkbyBkaWZmZXJlbnQgcHJvY2Vzcy4KPj4+IEkgZGlkbid0IGdldCBpdCwgeW91
IHdhbnQgdG8gaG9vayBfX3RyYWNlcG9pbnRfZjJmc19pZ2V0KCkgdy8geW91ciBvd24KPj4+IGNh
bGxiYWNrPwo+PiBZZXMswqAgdG8gdXNlICd0cmFjZXBvaW50X3Byb2JlX3JlZ2lzdGVyICcgdG8g
cmVnaXN0ZXIgYSBwcm9iZSBhdAo+PiB0cmFjZV9mMmZzX2lnZXQKPiBXaHk/CgpTb3JyeSwgSSBk
b24ndCB1bmRlcnN0YW5kIHdoYXQgaXMgeW91ciByZWFsIHF1ZXN0aW9uLgoKSW4gbXkgdW5kZXJz
dGFuZGluZywgYSB0cmFjZV9ldmVudCBpcyBhbHNvIGHCoCBub24tdm9sYXRpbGUgcG9pbnQgaW4g
Cmtlcm5lbCBmb3IgcHJvYmluZy4KCkFuZCBmb3IgbXkgY2FzZSwgSSB3YW50IHRvIGRldmVsb3Ag
YSB0b29sIGJ5IHRyYWNlX3Byb2JlIHRvIGNvbGxlY3Qgc29tZSAKaW5mb3JtYXRpb24uCgpUaGFu
a3MKCj4KPj4+IFRoYW5rcywKPj4+Cj4+Pj4+IFRoYW5rcywKPj4+Pj4KPj4+Pj4+IFNpZ25lZC1v
ZmYtYnk6IFd1IEJvIDxiby53dUB2aXZvLmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4gIMKgwqAgZnMv
ZjJmcy9pbm9kZS5jIHwgMiArLQo+Pj4+Pj4gIMKgwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4+Pgo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMv
aW5vZGUuYyBiL2ZzL2YyZnMvaW5vZGUuYwo+Pj4+Pj4gaW5kZXggY2Y0MzI3YWQxMDZjLi5jYWY5
NTkyODlmZTcgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9mcy9mMmZzL2lub2RlLmMKPj4+Pj4+ICsrKyBi
L2ZzL2YyZnMvaW5vZGUuYwo+Pj4+Pj4gQEAgLTU3Nyw4ICs1NzcsOCBAQCBzdHJ1Y3QgaW5vZGUg
KmYyZnNfaWdldChzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLAo+Pj4+Pj4gdW5zaWduZWQgbG9uZyBp
bm8pCj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmlsZV9kb250X3RydW5jYXRlKGlub2Rl
KTsKPj4+Pj4+ICDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4gIMKgwqAgLcKgwqDCoCB1bmxvY2tfbmV3
X2lub2RlKGlub2RlKTsKPj4+Pj4+ICDCoMKgwqDCoMKgwqAgdHJhY2VfZjJmc19pZ2V0KGlub2Rl
KTsKPj4+Pj4+ICvCoMKgwqAgdW5sb2NrX25ld19pbm9kZShpbm9kZSk7Cj4+Pj4+PiAgwqDCoMKg
wqDCoMKgIHJldHVybiBpbm9kZTsKPj4+Pj4+ICDCoMKgwqDCoCBiYWRfaW5vZGU6Cj4+Pj4+Cj4+
Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4+
IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+Pj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cj4+Pj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPj4+Pj4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
