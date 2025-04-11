Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E82A8575D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Apr 2025 11:05:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u3AKI-0001rS-MW;
	Fri, 11 Apr 2025 09:05:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qkrwngud825@gmail.com>) id 1u3AKH-0001rG-Fr
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 09:05:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/WbicdprIISLBYN7NLcQujWF73Ru87OIUPOEuBNZQIY=; b=FtZTpNHA2PeOLZ3kfjRiEPu6aS
 Fwr6snFZcrLWsurqwMWpIpTIiPMhEU/pgGo/EHA1JwsrgopGz26eZIekCOlDXgQL3CRfb6KOhbpbK
 gM9RWZ66isEL88qJqHFdpbqqK5ecOC1DeClF1CkWrYrxzXfQQDtW96pLN2e2frSp8SrU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/WbicdprIISLBYN7NLcQujWF73Ru87OIUPOEuBNZQIY=; b=Jll2J75oO+Iu40O4yEQ4QoXhBo
 ddunZIk2iWfAogewmIYWLSmoY/vGAiGZ2q/XHyNFvpEemsIvnLNu0PH9bLDrrSl4qIGbeZcJuSRAX
 TehaPOA5Ooe6FfDxrzjOo1Xml5cQ9YoGCcypa1tdA8Bc+dIl9zANhsdIAoEDI8Gv6+5I=;
Received: from mail-ej1-f51.google.com ([209.85.218.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u3AK2-0000j9-Gd for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 09:05:30 +0000
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-ac2a9a74d9cso328845766b.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 11 Apr 2025 02:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744362308; x=1744967108; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/WbicdprIISLBYN7NLcQujWF73Ru87OIUPOEuBNZQIY=;
 b=TNw8Ss5K1VIz/cPHt0Zoh3WGVk5zrlW5CIMVc4Xf8UG0u3b2aUrR57BflRzecW7Aru
 6hGNNr858AtCQLBX16P+7b5VWyJeBpCWYVVuPWqZIOFA0k1jMTmpFfBvlwavqFSys+xA
 z+nvPR7YXuuKBAX/pqdZRADczd3E+AEBP0rkL8f9cIgvnzbyKsedZXy0ML/AwrZQMXq7
 kxPxYxOXMi+bn5IPBfQYQoDwiyNhCYvcHNFQ7frZi7kUepM4aS87GFUc1dLl3cP4zPmU
 6KU74S/LnBlg6aQ07zSCXdWCrqigsMun3AjuB9G1b0KKOcRAAunfQeJhdwGSyXXc1cZI
 N5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744362308; x=1744967108;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/WbicdprIISLBYN7NLcQujWF73Ru87OIUPOEuBNZQIY=;
 b=Xk41C/Iegxvml88EPC7u06sJpFkaxMQkfBY6nvKcW1KX1dvgG9HF76sRIihcnJmH+t
 nybRIMb5+SJanqA4NmYHIZExQbLzt9xmK925lzaL0exeIV2mjU2APJMK5dApeoXoX50p
 YmbhlRMRm2cR7wb3tnN8QEqd/TNJun7KtpYvUPYrjHpZRoeKXUpTaIpV7djStfRzVJ59
 zUb/XvbrIKXxOq6UPITioTU78qMmJRaLAGu5mWpVti475aKhTarUgmw++ZWsdRzmOH5v
 hAGURyPbVL6pvL3A4xxipd3czZqzx3BUaYmIjYRyA5ITXXFO9SDHn7A8pPoy1DzfGswv
 irCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/+jSWEzTFt9hcrFzK+p/GB+JzEGW7y1ll02RTBomzzklQg2LIMS/LvxOIrRzv+2kz0Qi2zfMjB6vEq/guGV65@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy/o9OmBrtvGbVNJC398omVHKJIeqAM9Phz0Z+DNSr1lXESKw9f
 p6O9lhm2Oel155G+1Mi0/YqF8vuzo1ttfCf8WwrjoCd8o4OYtB6aaZvCSZPIVTvJS2+G3pZ0fNx
 yEh8tns7AaTRzFa4iG2BlSJ2sw0kSe8j/ps0=
X-Gm-Gg: ASbGncvTqO1gMQT1JE/cRuUyXPIrFYiPPiJcDW722h+R0wen2hqkkiI09eymKSZFqMz
 o8CGS8lGtcsVOGqrj90rBg9zfh7bYDwUanBnL3aDzh4iqqOJaLxIo/uotScufEL0mD9m88iWEpc
 g8Vot04+Fa/YJZJyWu+qLemoE=
X-Google-Smtp-Source: AGHT+IHJ6l9/CNzxZzWlxnGGY8vDIaZVYGPt9YoOHUXq14hN86R5+ZJ+2m9M4ihG7dDDhEsOGoBCOL9ZgyzPc5ct3Ys=
X-Received: by 2002:a17:907:7ea4:b0:ac4:2ae:c970 with SMTP id
 a640c23a62f3a-acad34a1b34mr145311766b.21.1744362307621; Fri, 11 Apr 2025
 02:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250411085655.3645-1-chao@kernel.org>
In-Reply-To: <20250411085655.3645-1-chao@kernel.org>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Fri, 11 Apr 2025 02:04:55 -0700
X-Gm-Features: ATxdqUFOAdH5LURMcUP8-R9DWq2DMKK2lpQDnyNzlC8m8VggMDCBL-VQwAc5T28
Message-ID: <CAD14+f1vhq-8VdC2FC2j4yJiQJaUZ-s963h5hb2YM5-XeJc=zg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Doesn't it simply remove the flag and proceed? What happens
 if large nat bitmap is required (e.g., a lot of inodes)? Sounds like we should
 actively detect it and stop it from proceeding, not just discarding the flag.
 Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qkrwngud825[at]gmail.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.218.51 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [qkrwngud825[at]gmail.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.218.51 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.51 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.51 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1u3AK2-0000j9-Gd
Subject: Re: [f2fs-dev] [PATCH] Revert "resize.f2fs: add option for
 large_nat_bitmap feature"
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RG9lc24ndCBpdCBzaW1wbHkgcmVtb3ZlIHRoZSBmbGFnIGFuZCBwcm9jZWVkPwoKV2hhdCBoYXBw
ZW5zIGlmIGxhcmdlIG5hdCBiaXRtYXAgaXMgcmVxdWlyZWQgKGUuZy4sIGEgbG90IG9mIGlub2Rl
cyk/CgpTb3VuZHMgbGlrZSB3ZSBzaG91bGQgYWN0aXZlbHkgZGV0ZWN0IGl0IGFuZCBzdG9wIGl0
IGZyb20gcHJvY2VlZGluZywKbm90IGp1c3QgZGlzY2FyZGluZyB0aGUgZmxhZy4KCk9uIEZyaSwg
QXByIDExLCAyMDI1IGF0IDE6NTfigK9BTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+Cj4gVGhpcyByZXZlcnRzIGNvbW1pdCBkYWEwZjhiOWU5YjFlZWE2Yzg1ZTVjMTY5YjgwOTI1
NGQ5ZDcwNzRlLgo+Cj4gQXMgSnVoeXVuZyByZXBvcnRlZCBpbiBbMV06Cj4KPiBIZXJlJ3Mgd2hh
dCBJIGRpZDoKPiAxLiBSZW1vdW50ZWQgdG8gY2hlY2twb2ludD1kaXNhYmxlCj4gMi4gQ3JlYXRl
IGEgZG0tc25hcHNob3Qgb2YgdGhlIGN1cnJlbnQgcm9vdCBkZXZpY2UKPiAzLiBNb3VudCBzbmFw
c2hvdCB0byByZXBsYXkgdGhlIGxvZwo+IDQuIFVubW91bnQKPiA1LiBSZXNpemUgc2VjdG9yIDQ4
NzI0ODg5NiB0byA0ODY1MzkyNjQKPiAvLyAuL3Jlc2l6ZS5mMmZzIC1kIDMgLXMgLWkgL2Rldi9t
YXBwZXIvc25hcCAtdCA0ODY1MzkyNjQKPgo+IExhdGVzdCBmMmZzLXRvb2xzIHdhcyB1c2VkOgo+
IDMzYzViOTUzOWFmMiBmMmZzX2lvOiBhZGQgZnJhZ3JlYWQgY29tbWFuZCB0byBldmFsdWF0ZSBm
cmFnbWVudGVkCj4gYnVmZmVyIGZvciByZWFkcwo+Cj4gVGhpcyByZXByb2R1Y2VkIHRoZSBtb3Vu
dCBhbmQgZnNjayBmYWlsdXJlLgo+Cj4gTW91bnQgbG9nOgo+IFs0NDI0MzEuMDIwNTk0XSBGMkZT
LWZzIChkbS0yKTogaW52YWxpZCBjcmNfb2Zmc2V0OiAwCj4gWzQ0MjQzMS4xMzAwNTVdIEYyRlMt
ZnMgKGRtLTIpOiBTSVQgaXMgY29ycnVwdGVkIG5vZGUjIDEzNjE1MjAxIHZzIDEzNjE2MjkwCj4g
WzQ0MjQzMS4xMzk2ODRdIEYyRlMtZnMgKGRtLTIpOiBGYWlsZWQgdG8gaW5pdGlhbGl6ZSBGMkZT
IHNlZ21lbnQgbWFuYWdlciAoLTExNykKPgo+IEkgY2hlY2tlZCBiZWxvdyB0ZXN0Y2FzZXM6Cj4K
PiB0cnVuY2F0ZSAtcyAkKCg1MTIqMTAyNCoxMDI0KjEwMjQpKSBpbWcKPiBta2ZzLmYyZnMgLWYg
aW1nICQoKDI1NioxMDI0KjEwMjQpKQo+Cj4gRGVzY3JpcHRpb24gICAgICAgICAgICAgVGVzdCBj
b21tYW5kICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRlNDSyBvdXRwdXQKPiBh
KSBzaHJpbmsgdy8gLXMgICAgICAgICByZXNpemUuZjJmcyAtcyAtaSBpbWcgLXQgJCgoMTI4KjEw
MjQqMTAyNCkpICAgICBGaW5lCj4gYikgZXhwYW5kIHcvIC1zICAgICAgICAgcmVzaXplLmYyZnMg
LXMgLWkgaW1nIC10ICQoKDEwMjQqMTAyNCoxMDI0KSkgICAgQ29ycnVwdGVkCj4gYykgc2hyaW5r
IHcvbyAtcyAgICAgICAgcmVzaXplLmYyZnMgLWkgaW1nIC10ICQoKDEyOCoxMDI0KjEwMjQpKSAg
ICAgICAgTm8gcnVuCj4gZCkgZXhwYW5kIHcvbyAtcyAgICAgICAgcmVzaXplLmYyZnMgLWkgaW1n
IC10ICQoKDEwMjQqMTAyNCoxMDI0KSkgICAgICAgRmluZQo+Cj4gT3V0cHV0IGZyb20gYik6Cj4g
W0FTU0VSVF0gKGNoZWNrX2Jsb2NrX2NvdW50OjIyOTkpICAtLT4gV3JvbmcgU0lUIHZhbGlkIGJs
b2Nrczogc2Vnbm89MHgyOTQwMCwgMCB2cy4gMTMKPgo+IFRoZSByb290IGNhdXNlIGlzOiBzYWZl
IG1vZGUgKC1zIG9wdGlvbikgaXMgY29uZmxpY3Qgdy8gbGFyZ2UgbmF0IGJpdG1hcCBmZWF0dXJl
Cj4gKC1pIG9wdGlvbiksIHNpbmNlIG9uY2Ugd2UgZW5hYmxlIGxhcmdlIG5hdCBiaXRtYXAsIGxh
eW91dCBvZiBjaGVja3BvaW50IHdpbGwgYmUKPiBjaGFuZ2VkIFsyXSwgd2UgbXVzdCByZWxvY2F0
ZSBuYXQvc2l0X2JpdG1hcCB0byB0aGUgZW5kIG9mIG5ldyBsb2NhdGlvbiBvZgo+IGNwX2NoZWNr
c3VtLCBob3dldmVyIGluIHNhZmUgbW9kZSwgd2Ugd29uJ3QgY2hhbmdlIG1ldGFkYXRhIG9mIGNo
ZWNrcG9pbnQsIHNvIHdlCj4gbmVlZCB0byBrZWVwIG5hdC9zaXRfYml0bWFwIGFzIGl0IGlzLCB3
aGljaCBpbmNsdWRlcyBjaGVja3N1bSBkYXRhIGluIGl0cyBvbGQKPiBsb2NhdGlvbi4KPgo+IExl
dCdzIHJldmVydCAtaSBzdXBwb3J0IGZvciByZXNpemUuZjJmcyBmaXJzdCwgYW5kIHRoZW4gcmVl
bmFibGUgaXQgYWZ0ZXIKPiBmaXggYW5kIHdlbGwgdGVzdGVkLgo+Cj4gVGhhbmtzIGEgbG90IGZv
ciB0aGUgaGVscCBmcm9tIEp1aHl1bmcsIGluY2x1ZGluZyBwcm92aWRpbmcgcmVwcm9kdWNlciBh
bmQKPiBoaW50cy4KPgo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRl
dmVsL0NBRDE0K2YzRDZpUE9CeEVna1p4eFRzWENmd1JLYjlwaDY4SnRVazNIOWNuOG92THQ5d0Bt
YWlsLmdtYWlsLmNvbS8KPiBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJmcy1k
ZXZlbC8yMDE5MDUxNDA5MzM0MC40MDIxNy0yLXl1Y2hhbzBAaHVhd2VpLmNvbS8KPgo+IEZpeGVz
OiBkYWEwZjhiICgicmVzaXplLmYyZnM6IGFkZCBvcHRpb24gZm9yIGxhcmdlX25hdF9iaXRtYXAg
ZmVhdHVyZSIpCj4gUmVwb3J0ZWQtYnk6IEp1IEh5dW5nIFBhcmsgPHFrcnduZ3VkODI1QGdtYWls
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4gLS0tCj4g
IGZzY2svbWFpbi5jICAgfCA2ICstLS0tLQo+ICBmc2NrL3Jlc2l6ZS5jIHwgMyAtLS0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgOCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9mc2NrL21haW4uYyBiL2ZzY2svbWFpbi5jCj4gaW5kZXggNTI0ZGJiMS4uYWY0MDYxMyAx
MDA2NDQKPiAtLS0gYS9mc2NrL21haW4uYwo+ICsrKyBiL2ZzY2svbWFpbi5jCj4gQEAgLTE0MSw3
ICsxNDEsNiBAQCB2b2lkIHJlc2l6ZV91c2FnZSgpCj4gICAgICAgICBNU0coMCwgIltvcHRpb25z
XTpcbiIpOwo+ICAgICAgICAgTVNHKDAsICIgIC1kIGRlYnVnIGxldmVsIFtkZWZhdWx0OjBdXG4i
KTsKPiAgICAgICAgIE1TRygwLCAiICAtSCBzdXBwb3J0IHdyaXRlIGhpbnRcbiIpOwo+IC0gICAg
ICAgTVNHKDAsICIgIC1pIGV4dGVuZGVkIG5vZGUgYml0bWFwLCBub2RlIHJhdGlvIGlzIDIwJSUg
YnkgZGVmYXVsdFxuIik7Cj4gICAgICAgICBNU0coMCwgIiAgLW8gb3ZlcnByb3Zpc2lvbiBwZXJj
ZW50YWdlIFtkZWZhdWx0OmF1dG9dXG4iKTsKPiAgICAgICAgIE1TRygwLCAiICAtcyBzYWZlIHJl
c2l6ZSAoRG9lcyBub3QgcmVzaXplIG1ldGFkYXRhKVxuIik7Cj4gICAgICAgICBNU0coMCwgIiAg
LXQgdGFyZ2V0IHNlY3RvcnMgW2RlZmF1bHQ6IGRldmljZSBzaXplXVxuIik7Cj4gQEAgLTYwMiw3
ICs2MDEsNyBAQCB2b2lkIGYyZnNfcGFyc2Vfb3B0aW9ucyhpbnQgYXJnYywgY2hhciAqYXJndltd
KQo+ICAjZW5kaWYKPiAgICAgICAgIH0gZWxzZSBpZiAoIXN0cmNtcCgicmVzaXplLmYyZnMiLCBw
cm9nKSkgewo+ICAjaWZkZWYgV0lUSF9SRVNJWkUKPiAtICAgICAgICAgICAgICAgY29uc3QgY2hh
ciAqb3B0aW9uX3N0cmluZyA9ICJkOmZIc3Q6aW86ViI7Cj4gKyAgICAgICAgICAgICAgIGNvbnN0
IGNoYXIgKm9wdGlvbl9zdHJpbmcgPSAiZDpmSHN0Om86ViI7Cj4KPiAgICAgICAgICAgICAgICAg
Yy5mdW5jID0gUkVTSVpFOwo+ICAgICAgICAgICAgICAgICB3aGlsZSAoKG9wdGlvbiA9IGdldG9w
dChhcmdjLCBhcmd2LCBvcHRpb25fc3RyaW5nKSkgIT0gRU9GKSB7Cj4gQEAgLTYzNyw5ICs2MzYs
NiBAQCB2b2lkIGYyZnNfcGFyc2Vfb3B0aW9ucyhpbnQgYXJnYywgY2hhciAqYXJndltdKQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBzc2NhbmYob3B0YXJn
LCAiJSJQUkl4NjQiIiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICZjLnRhcmdldF9zZWN0b3JzKTsKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGJyZWFrOwo+IC0gICAgICAgICAgICAgICAgICAgICAgIGNhc2UgJ2knOgo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYy5sYXJnZV9uYXRfYml0bWFwID0gMTsK
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGNhc2UgJ28nOgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYy5u
ZXdfb3ZlcnByb3Zpc2lvbiA9IGF0b2Yob3B0YXJnKTsKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGJyZWFrOwo+IGRpZmYgLS1naXQgYS9mc2NrL3Jlc2l6ZS5jIGIvZnNjay9yZXNp
emUuYwo+IGluZGV4IDliM2IwNzEuLjI2ODFiOWYgMTAwNjQ0Cj4gLS0tIGEvZnNjay9yZXNpemUu
Ywo+ICsrKyBiL2ZzY2svcmVzaXplLmMKPiBAQCAtNTMxLDkgKzUzMSw2IEBAIHN0YXRpYyB2b2lk
IHJlYnVpbGRfY2hlY2twb2ludChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4KPiAgICAgICAg
IC8qIHVwZGF0ZSBuYXRfYml0cyBmbGFnICovCj4gICAgICAgICBmbGFncyA9IHVwZGF0ZV9uYXRf
Yml0c19mbGFncyhuZXdfc2IsIGNwLCBnZXRfY3AoY2twdF9mbGFncykpOwo+IC0gICAgICAgaWYg
KGMubGFyZ2VfbmF0X2JpdG1hcCkKPiAtICAgICAgICAgICAgICAgZmxhZ3MgfD0gQ1BfTEFSR0Vf
TkFUX0JJVE1BUF9GTEFHOwo+IC0KPiAgICAgICAgIGlmIChmbGFncyAmIENQX0NPTVBBQ1RfU1VN
X0ZMQUcpCj4gICAgICAgICAgICAgICAgIGZsYWdzICY9IH5DUF9DT01QQUNUX1NVTV9GTEFHOwo+
ICAgICAgICAgaWYgKGZsYWdzICYgQ1BfTEFSR0VfTkFUX0JJVE1BUF9GTEFHKQo+IC0tCj4gMi40
MC4xCj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==
