Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4961E7EEA00
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Nov 2023 00:35:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r3lt1-0004JJ-Cb;
	Thu, 16 Nov 2023 23:35:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wubo.oduw@gmail.com>) id 1r3lsx-0004Ia-Op
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Nov 2023 23:35:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rkULf3scFhzjS1dsneFzkF5D5dL5G0jCH8/xfWwP8Cg=; b=BOlUFvDGv4Vzpu93aUaxW6QCS6
 hBAZLVBtTEgG3WL+J3prptiVn5+jAniK4BP/F9eGpTMmizD4l/LNLcdQD0gYdWGLdfWzcnfOiOqPE
 Ya7+U3PROT5fqjKVtcYWZUMWV2gPwqj7mPceSSXjudKCh/A8r8h3vVFA9Mtk9XDiGne0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rkULf3scFhzjS1dsneFzkF5D5dL5G0jCH8/xfWwP8Cg=; b=YG61Ww5mv4fqCgzAOt5ViBbnXx
 Zs+6Sez7hP4dejrwULP7EommiEcO/Mg+HGAPYSgXUTLpj1vMnpzoQwkoCruAP0XLlhY49tDgnfo2c
 Va2Jqt2Tt3MrBZPYqa6lKnq/EJMFddZa2rHZAJvdJZP+eeCQxIImb+j+j9Dtab9MthS4=;
Received: from mail-pg1-f181.google.com ([209.85.215.181])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r3lst-007rm5-Uj for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Nov 2023 23:35:00 +0000
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-5bd33a450fdso1142003a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Nov 2023 15:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700177690; x=1700782490; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rkULf3scFhzjS1dsneFzkF5D5dL5G0jCH8/xfWwP8Cg=;
 b=g2bxVlBLV2WQ53mzufKClG7Jn6FUEMpeq9GRmA/lH11EBAnxfTrDV59zBAEzgEgxkE
 mHfaC9M7LDSL/1ByIVnW7WpkHvrHBIdBOHfxAMpbZPyfqvAjw0iV3+JoZU6A0ZRBDwXl
 eeWBNz1EsecYJJoNRhziATdUAQWgFREsUVAtLLMH3z3lS6nKxG3kJj684FFB4vqWWJkc
 85vXYtRvEastM/rwys4YHBXsbTYU9bTvaxfFUbXPTQux/OOmvUJwbz9YQwl6rHiUXReb
 rrz4S4+PKb30gri4p196TH0pR2Cnw65KSwLTKpg6HO1oudz4M4PNgYQmzxiTe6AfmZdM
 F9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700177690; x=1700782490;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rkULf3scFhzjS1dsneFzkF5D5dL5G0jCH8/xfWwP8Cg=;
 b=RzSDELIVjXpCfNCK6pnJbCCZAQBNiKLhD2014hRhjab5dS2D6ACJQLvVH1GS1Qctyb
 cmRPUDGReMaHfojeZ5jKiMKUxmTHszFLw0vPB+ZJNdtR2oscLUVJPzQUO9om1xpOfpU9
 ZqCQ6BidJ3GnglSIc4l+P9LX271+Ge0gHWXHJ8apajWXencz8ix1Yi3uc7tFMgx8LLvM
 Hwz9qqCZ30jkNOitD/Z8ZPI/fFjHnZlJZdaYDkX2TRkaOCyzYRvhCVL1Vh4Peu/U1PlS
 /qeS/5v2srVDfsmYOebcyETxSFAWOhbI/tSegp31EYvI0sg+phGnsnAK+fhkI1PRPb2y
 2voA==
X-Gm-Message-State: AOJu0YzgXgg4TCaZ4PV3/0K7/jgLFeJ7o1TpM/K8+lp9mxXHgA6zoo0W
 CiK4781cSvYK4fdSnexXVJ4X1Gm5Bg4=
X-Google-Smtp-Source: AGHT+IGGiCqLobfk0raoyD84ZNfIddYDfl8PqLow7tpR0awROI6jEQVNZwuOYWn087SjRblRYfWRTA==
X-Received: by 2002:a05:6a20:8f19:b0:187:afb0:c2f5 with SMTP id
 b25-20020a056a208f1900b00187afb0c2f5mr4278845pzk.3.1700177690176; 
 Thu, 16 Nov 2023 15:34:50 -0800 (PST)
Received: from [192.168.50.127] (awork111197.netvigator.com. [203.198.94.197])
 by smtp.gmail.com with ESMTPSA id
 du24-20020a056a002b5800b00686b649cdd0sm272060pfb.86.2023.11.16.15.34.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 15:34:49 -0800 (PST)
Message-ID: <faa90acc-c03e-2913-c19a-bd50fd93d197@gmail.com>
Date: Fri, 17 Nov 2023 07:34:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Chao Yu <chao@kernel.org>, Wu Bo <bo.wu@vivo.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20231030094024.263707-1-bo.wu@vivo.com>
 <c181256e-9f6e-d43e-4d02-a7d8d5286d56@kernel.org>
 <670ce4a6-f00c-dbe9-86e2-366311221cf3@gmail.com>
 <a69b7544-2312-486c-d655-8b86e370c55e@kernel.org>
From: Wu Bo <wubo.oduw@gmail.com>
In-Reply-To: <a69b7544-2312-486c-d655-8b86e370c55e@kernel.org>
X-Spam-Score: -2.4 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/11/11 12:49, Chao Yu wrote: > On 2023/11/8 21:48,
 Wu Bo wrote: >> On 2023/11/7 22:39, Chao Yu wrote: >>> On 2023/10/30 17:40,
 Wu Bo wrote: >>>> If GC victim has pinned block, it can't be recyc [...] 
 Content analysis details:   (-2.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.181 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [wubo.oduw[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.181 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.2 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1r3lst-007rm5-Uj
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: fix fallocate failed under pinned
 block situation
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

T24gMjAyMy8xMS8xMSAxMjo0OSwgQ2hhbyBZdSB3cm90ZToKPiBPbiAyMDIzLzExLzggMjE6NDgs
IFd1IEJvIHdyb3RlOgo+PiBPbiAyMDIzLzExLzcgMjI6MzksIENoYW8gWXUgd3JvdGU6Cj4+PiBP
biAyMDIzLzEwLzMwIDE3OjQwLCBXdSBCbyB3cm90ZToKPj4+PiBJZiBHQyB2aWN0aW0gaGFzIHBp
bm5lZCBibG9jaywgaXQgY2FuJ3QgYmUgcmVjeWNsZWQuCj4+Pj4gQW5kIGlmIEdDIGlzIGZvcmVn
cm91bmQgcnVubmluZywgYWZ0ZXIgbWFueSBmYWlsdXJlIHRyeSwgdGhlIHBpbm5lZCAKPj4+PiBm
aWxlCj4+Pj4gaXMgZXhwZWN0ZWQgdG8gYmUgY2xlYXIgcGluIGZsYWcuIFRvIGVuYWJsZSB0aGUg
c2VjdGlvbiBiZSByZWN5Y2xlZC4KPj4+Pgo+Pj4+IEJ1dCB3aGVuIGZhbGxvY2F0ZSB0cmlnZ2Vy
IEZHX0dDLCBHQyBjYW4gbmV2ZXIgcmVjeWNsZSB0aGUgcGlubmVkCj4+Pj4gc2VjdGlvbi4gQmVj
YXVzZSBHQyB3aWxsIGdvIHRvIHN0b3AgYmVmb3JlIHRoZSBmYWlsdXJlIHRyeSBtZWV0IHRoZQo+
Pj4+IHRocmVzaG9sZDoKPj4+PiDCoMKgwqDCoMKgaWYgKGhhc19lbm91Z2hfZnJlZV9zZWNzKHNi
aSwgc2VjX2ZyZWVkLCAwKSkgewo+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFnY19jb250cm9s
LT5ub19iZ19nYyAmJgo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0b3RhbF9zZWNfZnJl
ZWQgPCBnY19jb250cm9sLT5ucl9mcmVlX3NlY3MpCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGdvdG8gZ29fZ2NfbW9yZTsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gc3RvcDsKPj4+
PiDCoMKgwqDCoMKgfQo+Pj4+Cj4+Pj4gU28gd2hlbiBmYWxsb2NhdGUgdHJpZ2dlciBGR19HQywg
YXQgbGVhc3QgcmVjeWNsZSBvbmUuCj4+Pgo+Pj4gSG1tLi4uIGl0IG1heSBicmVhayBwaW5maWxl
J3Mgc2VtYW50aWNzIGF0IGxlYXN0IG9uIG9uZSBwaW5uZWQgZmlsZT8KPj4+IEluIHRoaXMgY2Fz
ZSwgSSBwcmVmZXIgdG8gZmFpbCBmYWxsb2NhdGUoKSByYXRoZXIgdGhhbiB1bnBpbm5pbmcgZmls
ZSwKPj4+IGluIG9yZGVyIHRvIGF2b2lkIGxlYXZpbmcgaW52YWxpZCBMQkEgcmVmZXJlbmNlcyBv
ZiB1bnBpbm5lZCBmaWxlIGhlbGQKPj4+IGJ5IHVzZXJzcGFjZS4KPj4KPj4gQXMgZjJmcyBkZXNp
Z25lZCBub3csIEZHX0dDIGlzIGFibGUgdG8gdW5waW4gdGhlIHBpbm5lZCBmaWxlLgo+Pgo+PiBm
YWxsb2NhdGUoKSB0cmlnZ2VyZWQgRkdfR0MsIGJ1dCBjYW4ndCByZWN5Y2xlIHNwYWNlLsKgIEl0
IGJyZWFrcyB0aGUKPj4gZGVzaWduIGxvZ2ljIG9mIEZHX0dDLgo+Cj4gWWVzLCBjb250cmFkaWN0
b3JpbmVzcyBleGlzdHMuCj4KPiBJTU8sIHVucGluIGZpbGUgYnkgR0MgbG9va3MgbW9yZSBkYW5n
ZXJvdXMsIGl0IG1heSBjYXVzZSBwb3RlbnRpYWwgZGF0YQo+IGNvcnJ1cHRpb24gdy8gYmVsb3cg
Y2FzZToKPiAxLiBhcHAgcGlucyBmaWxlICYgaG9sZHMgTEJBcyBvZiBkYXRhIGJsb2Nrcy4KPiAy
LiBHQyB1bnBpbnMgZmlsZSBhbmQgbWlncmF0ZXMgaXRzIGRhdGEgdG8gbmV3IExCQXMuCj4gMy4g
b3RoZXIgZmlsZSByZXVzZXMgcHJldmlvdXMgTEJBcy4KPiA0LiBhcHAgcmVhZC93cml0ZSBkYXRh
IHZpYSBwcmV2aW91cyBMQkFzLgo+Cj4gU28gSSBzdWdnZXN0IHRvIG5vcm1hbGl6ZSB1c2Ugb2Yg
cGluZmlsZSBhbmQgZG8gbm90IGFkZCBtb3JlIHVucGluIGNhc2VzCj4gaW4gZmlsZXN5c3RlbSBp
bm5lciBwcm9jZXNzZXMuCj4KPj4KPj4gVGhpcyBpc3N1ZSBpcyBoYXBwZW5lZCBpbiBBbmRyb2lk
IE9UQSBzY2VuYXJpby7CoCBmYWxsb2NhdGUoKSBhbHdheXMKPj4gcmV0dXJuIGZhaWx1cmUgY2F1
c2UgT1RBIGZhaWwuCj4KPiBDYW4geW91IHBsZWFzZSBjaGVjayB3aHkgb3RoZXIgcGlubmVkIGZp
bGVzIHdlcmUgc28gZnJhZ21lbnRlZCB0aGF0IAo+IGYyZnNfZ2MoKQo+IGNhbiBub3QgcmVjeWNs
ZSBvbmUgZnJlZSBzZWN0aW9uPwo+Ck5vdCBiZWNhdXNlIHBpbm5lZCBmaWxlcyB3ZXJlIGZyYWdt
ZW50ZWQsIGJ1dCBpZiB0aGUgR0MgdmljdGltIHNlY3Rpb24gCmhhcyBvbmUgYmxvY2sgaXMgcGlu
bmVkIHdpbGwgY2F1c2UgdGhpcyBpc3N1ZS4KCklmIHRoZSBzZWN0aW9uIGRvbid0IHVucGluIHRo
ZSBibG9jaywgaXQgY2FuJ3QgYmUgcmVjeWNsZWQuIEJ1dCB0aGVyZSBpcyAKaGlnaCBjaGFuY2Ug
dGhhdCB0aGUgcGlubmVkIHNlY3Rpb24gd2lsbCBiZSBjaG9zZW4gbmV4dCB0aW1lIHVuZGVyIGYy
ZnMgCmN1cnJlbnQgdmljdGltIHNlbGVjdGlvbiBzdHJhdGVneS4KClNvIGlmIHdlIHdhbnQgdG8g
YXZvaWQgdW5waW4gZmlsZXMsIEkgdGhpbmsgY2hhbmdlIHZpY3RpbSBzZWxlY3Rpb24gdG8gCmNv
bnNpZGVyaW5nIHBpbm5lZCBibG9ja3MgY2FuIGZpeCB0aGlzIGlzc3VlLgoKPiBUaGFua3MsCj4K
Pj4KPj4gwqAgwqBBbmQgdGhpcyBjb21taXQgY2hhbmdlZCBwcmV2aW91cyBiZWhhdmlvciBvZiBm
YWxsb2NhdGUoKToKPj4KPj4gQ29tbWl0IDJlNDJiN2Y4MTdhYyAoImYyZnM6IHN0b3AgYWxsb2Nh
dGluZyBwaW5uZWQgc2VjdGlvbnMgaWYgRUFHQUlOCj4+IGhhcHBlbnMiKQo+Pgo+PiBCZWZvcmUg
dGhpcyBjb21taXQsIGlmIGZhbGxvY2F0ZSgpIG1lZXQgdGhpcyBzaXR1YXRpb24sIGl0IHdpbGwg
dHJpZ2dlcgo+PiBGR19HQyB0byByZWN5Y2xlIHBpbm5lZCBzcGFjZSBmaW5hbGx5Lgo+Pgo+PiBG
R19HQyBpcyBleHBlY3RlZCB0byByZWN5Y2xlIHBpbm5lZCBzcGFjZSB3aGVuIHRoZXJlIGlzIG5v
IG1vcmUgZnJlZQo+PiBzcGFjZS7CoCBBbmQgdGhpcyBpcyB0aGUgcmlnaHQgdGltZSB0byBkbyBp
dCB3aGVuIGZhbGxvY2F0ZSgpIG5lZWQgZnJlZQo+PiBzcGFjZS4KPj4KPj4gSXQgaXMgd2VpcmQg
d2hlbiBmMmZzIHNob3dzIGVub3VnaCBzcGFyZSBzcGFjZSBidXQgY2FuJ3QgZmFsbG9jYXRlKCku
IFNvCj4+IEkgdGhpbmsgaXQgc2hvdWxkIGJlIGZpeGVkLgo+Pgo+Pj4KPj4+IFRob3VnaHRzPwo+
Pj4KPj4+IFRoYW5rcywKPj4+Cj4+Pj4KPj4+PiBUaGlzIGlzc3VlIGNhbiBiZSByZXByb2R1Y2Vk
IGJ5IGZpbGxpbmcgZjJmcyBzcGFjZSBhcyBmb2xsb3dpbmcgCj4+Pj4gbGF5b3V0Lgo+Pj4+IEV2
ZXJ5IHNlZ21lbnQgaGFzIG9uZSBibG9jayBpcyBwaW5uZWQ6Cj4+Pj4gKy0rLSstKy0rLSstKy0t
LS0tKy0rCj4+Pj4gfCB8IHxwfCB8IHwgfCAuLi4gfCB8IHNlZ19uCj4+Pj4gKy0rLSstKy0rLSst
Ky0tLS0tKy0rCj4+Pj4gKy0rLSstKy0rLSstKy0tLS0tKy0rCj4+Pj4gfCB8IHxwfCB8IHwgfCAu
Li4gfCB8IHNlZ19uKzEKPj4+PiArLSstKy0rLSstKy0rLS0tLS0rLSsKPj4+PiAuLi4KPj4+PiAr
LSstKy0rLSstKy0rLS0tLS0rLSsKPj4+PiB8IHwgfHB8IHwgfCB8IC4uLiB8IHwgc2VnX24rawo+
Pj4+ICstKy0rLSstKy0rLSstLS0tLSstKwo+Pj4+Cj4+Pj4gQW5kIGZvbGxvd2luZyBhcmUgc3Rl
cHMgdG8gcmVwcm9kdWNlIHRoaXMgaXNzdWU6Cj4+Pj4gZGQgaWY9L2Rldi96ZXJvIG9mPS4vZjJm
c19waW4uaW1nIGJzPTJNIGNvdW50PTEwMjQKPj4+PiBta2ZzLmYyZnMgZjJmc19waW4uaW1nCj4+
Pj4gbWtkaXIgZjJmcwo+Pj4+IG1vdW50IGYyZnNfcGluLmltZyAuL2YyZnMKPj4+PiBjZCBmMmZz
Cj4+Pj4gZGQgaWY9L2Rldi96ZXJvIG9mPS4vbGFyZ2VfcGFkZGluZyBicz0xTSBjb3VudD0xNzYw
Cj4+Pj4gLi9waW5fZmlsbGluZy5zaAo+Pj4+IHJtIHBhZGRpbmcqCj4+Pj4gc3luYwo+Pj4+IHRv
dWNoIGZhbGxvY2F0ZV80MG0KPj4+PiBmMmZzX2lvIHBpbmZpbGUgc2V0IGZhbGxvY2F0ZV80MG0K
Pj4+PiBmYWxsb2NhdGUgLWwgNDE5NDMwNDAgZmFsbG9jYXRlXzQwbQo+Pj4+Cj4+Pj4gZmFsbG9j
YXRlIGFsd2F5cyBmYWlsIHdpdGggRUFHQUlOIGV2ZW4gdGhlcmUgaGFzIGVub3VnaCBmcmVlIHNw
YWNlLgo+Pj4+Cj4+Pj4gJ3Bpbl9maWxsaW5nLnNoJyBpczoKPj4+PiBjb3VudD0xCj4+Pj4gd2hp
bGUgOgo+Pj4+IGRvCj4+Pj4gwqDCoMKgwqDCoCAjIGZpbGxpbmcgdGhlIHNlZyBzcGFjZQo+Pj4+
IMKgwqDCoMKgwqAgZm9yIGkgaW4gezEuLjUxMX06Cj4+Pj4gwqDCoMKgwqDCoCBkbwo+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCBuYW1lPXBhZGRpbmdfJGNvdW50LSRpCj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgIGVjaG8gd3JpdGUgJG5hbWUKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZGQgaWY9L2Rl
di96ZXJvIG9mPS4vJG5hbWUgYnM9NEsgY291bnQ9MSA+IC9kZXYvbnVsbCAyPiYxCj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgIGlmIFsgJD8gLW5lIDAgXTsgdGhlbgo+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZXhpdCAwCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGZpCj4+
Pj4gwqDCoMKgwqDCoCBkb25lCj4+Pj4gwqDCoMKgwqDCoCBzeW5jCj4+Pj4KPj4+PiDCoMKgwqDC
oMKgICMgcGluIG9uZSBibG9jayBpbiBhIHNlZ21lbnQKPj4+PiDCoMKgwqDCoMKgIG5hbWU9cGlu
X2ZpbGUkY291bnQKPj4+PiDCoMKgwqDCoMKgIGRkIGlmPS9kZXYvemVybyBvZj0uLyRuYW1lIGJz
PTRLIGNvdW50PTEgPiAvZGV2L251bGwgMj4mMQo+Pj4+IMKgwqDCoMKgwqAgc3luYwo+Pj4+IMKg
wqDCoMKgwqAgZjJmc19pbyBwaW5maWxlIHNldCAkbmFtZQo+Pj4+IMKgwqDCoMKgwqAgY291bnQ9
JCgoJGNvdW50ICsgMSkpCj4+Pj4gZG9uZQo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogV3UgQm8g
PGJvLnd1QHZpdm8uY29tPgo+Pj4+IC0tLQo+Pj4+IMKgwqAgZnMvZjJmcy9maWxlLmMgfCAyICst
Cj4+Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
Pj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4+
Pj4gaW5kZXggY2E1OTA0MTI5YjE2Li5lOGExMzYxNjU0M2YgMTAwNjQ0Cj4+Pj4gLS0tIGEvZnMv
ZjJmcy9maWxlLmMKPj4+PiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+Pj4+IEBAIC0xNjkwLDcgKzE2
OTAsNyBAQCBzdGF0aWMgaW50IGYyZnNfZXhwYW5kX2lub2RlX2RhdGEoc3RydWN0IGlub2RlCj4+
Pj4gKmlub2RlLCBsb2ZmX3Qgb2Zmc2V0LAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLmluaXRfZ2NfdHlwZSA9IEZHX0dDLAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLnNob3VsZF9taWdyYXRlX2Jsb2NrcyA9IGZhbHNlLAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLmVycl9nY19za2lwcGVkID0gdHJ1ZSwKPj4+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAubnJfZnJlZV9zZWNzID0gMCB9Owo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC5ucl9mcmVlX3NlY3MgPSAxIH07Cj4+Pj4gwqDCoMKgwqDCoMKgIHBnb2ZmX3QgcGdfc3RhcnQs
IHBnX2VuZDsKPj4+PiDCoMKgwqDCoMKgwqAgbG9mZl90IG5ld19zaXplOwo+Pj4+IMKgwqDCoMKg
wqDCoCBsb2ZmX3Qgb2ZmX2VuZDsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
