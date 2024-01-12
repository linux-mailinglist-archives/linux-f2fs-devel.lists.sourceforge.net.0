Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 367D782C709
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jan 2024 23:15:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rOPoI-0001ea-Lm;
	Fri, 12 Jan 2024 22:15:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rOPoG-0001eS-EU
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jan 2024 22:15:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mhMe8z8Sw2vM4e+MnbwTOmnay90Wc0ycXpHjBgOQgjI=; b=JUdXTTM5oRliLAB6gGpTfUur4U
 fhDTBTeO1xFUMIMJnr2h96nodBOWGjnTeHDapvp270N96BQ4llAFDd+UZNuFAPEA/BRpStDSKNXX/
 MfrhQ+TlE7wRhn5yyiAlV+eaFRef9vm4fiJ5Z0BjEvKXNBrjnergdfORAv+STB3MpSac=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mhMe8z8Sw2vM4e+MnbwTOmnay90Wc0ycXpHjBgOQgjI=; b=L0swd80RCqlegM5aj2kk4mR1KG
 YcQnmnfzD3p8N0CWeMWwzjthO+1Ylh233qz7D6AgOg+zlNJCrRaxr9wA8qAdp5tgrlflTgMxKUWTn
 WtuAnIWoSIyUhrzNF97ELjGjm+cNNQXOQRKiGsRQwfenPdIQimO+xqI42dN7mtik8s3Y=;
Received: from mail-ua1-f48.google.com ([209.85.222.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rOPoF-00086y-JK for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jan 2024 22:15:28 +0000
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-7cc4647543aso2018941241.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Jan 2024 14:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705097717; x=1705702517; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mhMe8z8Sw2vM4e+MnbwTOmnay90Wc0ycXpHjBgOQgjI=;
 b=UZNYl/BpdeNa5AJRG9NisrRrVX3gRkogbZXnI+QfTf9nxhtUehyXhW/9XUObPi80LX
 bWIC1iejaMzD8Te4CCdv4Jizdg+7aII09D4dX/A9Gw/596vA6GODl1qdbBEjBN8ikdEe
 fHFYKn99jsCynfb0NrrM8KN8yhHM/WP2+gTqYT3+7SKtdjItSaKV79FVUHBEhA87n3Cc
 r9D8vITxsMDhzmFdCBBxDfwSpDMLaDEaNnMJcku7gHkv+bJpxg9MQOLODpMcbP8ecley
 9CmjgYOzhot8g3jTOnnWCZZZQpVuiQgJ6USajPEl9l6SsY7vtky/iP5b6t+G9Dokz/io
 XmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705097717; x=1705702517;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mhMe8z8Sw2vM4e+MnbwTOmnay90Wc0ycXpHjBgOQgjI=;
 b=hpw6tuRGOfZ9cWWfdhMVYZwbNcGy9yI8vlDwanvGab1VaYNrygjzS6Pza3jzfmm/2l
 Dued6OW3uWoj6A854F0MifwOEi0uPvve9weB/4/aqMGBueKf0NqX7DerpQ1Z0wTDLzN7
 CcbKggPsQk+6HlcmBf7DkHrp26VSAhut6kR0UtpSB5BvOFnH/SoZ3qXpZUH4W95/vlIw
 lj9Xdzj+e+rD20AIIFCpseWYAO/Mu9OXtHUI5ikZL0Hw/Zk65WMvwvTZqqlkuVJsLxu0
 I2WKykrsqhKmlS1imhlOgRGHEoX/TD5jM8rRnd6FvKwg9iOzG/X7xSpZnLUCZ3TGQLSc
 IWNg==
X-Gm-Message-State: AOJu0YxdMeh8XYv/2dpzlNxv7/F66on+roJmuQ1+EjpON7pcy+uezfVv
 /ZdAGL/1piqm0T9sDAygKB091MSLMrE36WSR2cg=
X-Google-Smtp-Source: AGHT+IEeNFxFQtUxxk8Cp92BdPQ9DeDWBFE8dPARbDo7V83RFzc6XAOBg7gwxYZ1n6iIa85TJzyW4YgtF7Umz8vsdQs=
X-Received: by 2002:a05:6122:4491:b0:4b7:8199:5d17 with SMTP id
 cz17-20020a056122449100b004b781995d17mr1742638vkb.25.1705097717189; Fri, 12
 Jan 2024 14:15:17 -0800 (PST)
MIME-Version: 1.0
References: <20231228143152.1543509-1-chao@kernel.org>
 <CACOAw_xXGUt=2JJgq5yfW5ZG7EfZMm1iNTVxvfA9FoJVDwbH_A@mail.gmail.com>
 <dcefc352-d528-41e3-bc7a-5cb388f43240@kernel.org>
 <CACOAw_z=kVrD8ZctrK=ejh8TSMgzMf0-jaUM7q6CYtB3=Bqb8A@mail.gmail.com>
In-Reply-To: <CACOAw_z=kVrD8ZctrK=ejh8TSMgzMf0-jaUM7q6CYtB3=Bqb8A@mail.gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 12 Jan 2024 14:15:06 -0800
Message-ID: <CACOAw_y-nnM3ms-TAiHMxGRw9n+Ad5qdf+40yzQ-jVYg4uR-TA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Reviewed-by: Daeho Jeong On Thu, Jan 11, 2024 at 9:17 AM
    Daeho Jeong wrote: > > On Wed, Jan 10, 2024 at 5:26 PM Chao Yu wrote: >
    > > > On 2024/1/11 8:55, Daeho Jeong wrote: > > > On Thu, Dec 28, 2023 at
    6:33 AM Chao [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.48 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.48 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rOPoF-00086y-JK
Subject: Re: [f2fs-dev] [PATCH v3 1/6] f2fs: compress: fix to guarantee
 persisting compressed blocks by CP
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

UmV2aWV3ZWQtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+CgpPbiBUaHUs
IEphbiAxMSwgMjAyNCBhdCA5OjE34oCvQU0gRGFlaG8gSmVvbmcgPGRhZWhvNDNAZ21haWwuY29t
PiB3cm90ZToKPgo+IE9uIFdlZCwgSmFuIDEwLCAyMDI0IGF0IDU6MjbigK9QTSBDaGFvIFl1IDxj
aGFvQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIDIwMjQvMS8xMSA4OjU1LCBEYWVobyBK
ZW9uZyB3cm90ZToKPiA+ID4gT24gVGh1LCBEZWMgMjgsIDIwMjMgYXQgNjozM+KAr0FNIENoYW8g
WXUgPGNoYW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Pgo+ID4gPj4gSWYgZGF0YSBibG9jayBp
biBjb21wcmVzc2VkIGNsdXN0ZXIgaXMgbm90IHBlcnNpc3RlZCB3aXRoIG1ldGFkYXRhCj4gPiA+
PiBkdXJpbmcgY2hlY2twb2ludCwgYWZ0ZXIgU1BPUiwgdGhlIGRhdGEgbWF5IGJlIGNvcnJ1cHRl
ZCwgbGV0J3MKPiA+ID4+IGd1YXJhbnRlZSB0byB3cml0ZSBjb21wcmVzc2VkIHBhZ2UgYnkgY2hl
Y2twb2ludC4KPiA+ID4+Cj4gPiA+PiBGaXhlczogNGM4ZmY3MDk1YmVmICgiZjJmczogc3VwcG9y
dCBkYXRhIGNvbXByZXNzaW9uIikKPiA+ID4+IFNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9A
a2VybmVsLm9yZz4KPiA+ID4+IC0tLQo+ID4gPj4gdjM6Cj4gPiA+PiAtIHRyZWF0IGNvbXByZXNz
ZWQgcGFnZSBhcyBDUCBndWFyYW50ZWVkIGRhdGEgZXhwbGljdGx5Lgo+ID4gPj4gICBmcy9mMmZz
L2NvbXByZXNzLmMgfCAgNCArKystCj4gPiA+PiAgIGZzL2YyZnMvZGF0YS5jICAgICB8IDE3ICsr
KysrKysrKy0tLS0tLS0tCj4gPiA+PiAgIGZzL2YyZnMvZjJmcy5oICAgICB8ICA0ICsrKy0KPiA+
ID4+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkK
PiA+ID4+Cj4gPiA+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9jb21wcmVzcy5jIGIvZnMvZjJmcy9j
b21wcmVzcy5jCj4gPiA+PiBpbmRleCBjNWE0MzY0YzQ0ODIuLjk5NDBiNzg4NmU1ZCAxMDA2NDQK
PiA+ID4+IC0tLSBhL2ZzL2YyZnMvY29tcHJlc3MuYwo+ID4gPj4gKysrIGIvZnMvZjJmcy9jb21w
cmVzcy5jCj4gPiA+PiBAQCAtMTQxOCw2ICsxNDE4LDggQEAgdm9pZCBmMmZzX2NvbXByZXNzX3dy
aXRlX2VuZF9pbyhzdHJ1Y3QgYmlvICpiaW8sIHN0cnVjdCBwYWdlICpwYWdlKQo+ID4gPj4gICAg
ICAgICAgc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpID0gYmlvLT5iaV9wcml2YXRlOwo+ID4gPj4g
ICAgICAgICAgc3RydWN0IGNvbXByZXNzX2lvX2N0eCAqY2ljID0KPiA+ID4+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAoc3RydWN0IGNvbXByZXNzX2lvX2N0eCAqKXBhZ2VfcHJpdmF0ZShwYWdl
KTsKPiA+ID4+ICsgICAgICAgZW51bSBjb3VudF90eXBlIHR5cGUgPSBXQl9EQVRBX1RZUEUocGFn
ZSwKPiA+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZjJmc19pc19jb21wcmVz
c2VkX3BhZ2UocGFnZSkpOwo+ID4gPj4gICAgICAgICAgaW50IGk7Cj4gPiA+Pgo+ID4gPj4gICAg
ICAgICAgaWYgKHVubGlrZWx5KGJpby0+Ymlfc3RhdHVzKSkKPiA+ID4+IEBAIC0xNDI1LDcgKzE0
MjcsNyBAQCB2b2lkIGYyZnNfY29tcHJlc3Nfd3JpdGVfZW5kX2lvKHN0cnVjdCBiaW8gKmJpbywg
c3RydWN0IHBhZ2UgKnBhZ2UpCj4gPiA+Pgo+ID4gPj4gICAgICAgICAgZjJmc19jb21wcmVzc19m
cmVlX3BhZ2UocGFnZSk7Cj4gPiA+Pgo+ID4gPj4gLSAgICAgICBkZWNfcGFnZV9jb3VudChzYmks
IEYyRlNfV0JfREFUQSk7Cj4gPiA+PiArICAgICAgIGRlY19wYWdlX2NvdW50KHNiaSwgdHlwZSk7
Cj4gPiA+Pgo+ID4gPj4gICAgICAgICAgaWYgKGF0b21pY19kZWNfcmV0dXJuKCZjaWMtPnBlbmRp
bmdfcGFnZXMpKQo+ID4gPj4gICAgICAgICAgICAgICAgICByZXR1cm47Cj4gPiA+PiBkaWZmIC0t
Z2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+ID4gPj4gaW5kZXggZGNlOGRl
ZmRmNGM3Li44MWY5ZTJjYzQ5ZTIgMTAwNjQ0Cj4gPiA+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+
ID4gPj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPiA+ID4+IEBAIC00OCw3ICs0OCw3IEBAIHZvaWQg
ZjJmc19kZXN0cm95X2Jpb3NldCh2b2lkKQo+ID4gPj4gICAgICAgICAgYmlvc2V0X2V4aXQoJmYy
ZnNfYmlvc2V0KTsKPiA+ID4+ICAgfQo+ID4gPj4KPiA+ID4+IC1zdGF0aWMgYm9vbCBfX2lzX2Nw
X2d1YXJhbnRlZWQoc3RydWN0IHBhZ2UgKnBhZ2UpCj4gPiA+PiArYm9vbCBmMmZzX2lzX2NwX2d1
YXJhbnRlZWQoc3RydWN0IHBhZ2UgKnBhZ2UpCj4gPiA+PiAgIHsKPiA+ID4+ICAgICAgICAgIHN0
cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nID0gcGFnZS0+bWFwcGluZzsKPiA+ID4+ICAgICAg
ICAgIHN0cnVjdCBpbm9kZSAqaW5vZGU7Cj4gPiA+PiBAQCAtNjUsOCArNjUsNiBAQCBzdGF0aWMg
Ym9vbCBfX2lzX2NwX2d1YXJhbnRlZWQoc3RydWN0IHBhZ2UgKnBhZ2UpCj4gPiA+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgU19JU0RJUihpbm9kZS0+aV9tb2RlKSkKPiA+ID4+ICAgICAgICAg
ICAgICAgICAgcmV0dXJuIHRydWU7Cj4gPiA+Pgo+ID4gPj4gLSAgICAgICBpZiAoZjJmc19pc19j
b21wcmVzc2VkX3BhZ2UocGFnZSkpCj4gPiA+PiAtICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNl
Owo+ID4gPgo+ID4gPiBPdXQgb2YgY3VyaW9zaXR5LCB3aHkgZG9uJ3Qgd2Ugc2ltcGx5IGNoYW5n
ZSB0aGUgYWJvdmUgdG8gInJldHVybiB0cnVlIj8KPiA+Cj4gPiBEYWVobywKPiA+Cj4gPiBJIHVz
ZWQgdGhlIGltcGxlbWVudGF0aW9uLCBwbGVhc2UgY2hlY2sgdjEgYW5kIHJlbGF0ZWQgY29tbWVu
dHMKPiA+IGZyb20gSmFlZ2V1ayBhbmQgbWUsIGxldCBtZSBrbm93IGlmIHRoYXQgd2FzIG5vdCBj
bGVhciBlbm91Z2guIDopCj4gPgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZjJm
cy1kZXZlbC9hYWU2NTRlNy04YTdlLTQ3OGQtOWY1YS02NTgwN2EwZTAzNDNAa2VybmVsLm9yZy8K
Pgo+IE9oLCBJIG1pc3NlZCBpdC4gU29ycnl+Cj4KPiA+Cj4gPiA+Cj4gPiA+PiAgICAgICAgICBp
ZiAoKFNfSVNSRUcoaW5vZGUtPmlfbW9kZSkgJiYgSVNfTk9RVU9UQShpbm9kZSkpIHx8Cj4gPiA+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgcGFnZV9wcml2YXRlX2djaW5nKHBhZ2UpKQo+ID4g
Pj4gICAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiA+ID4+IEBAIC0zMzgsNyArMzM2LDcg
QEAgc3RhdGljIHZvaWQgZjJmc193cml0ZV9lbmRfaW8oc3RydWN0IGJpbyAqYmlvKQo+ID4gPj4K
PiA+ID4+ICAgICAgICAgIGJpb19mb3JfZWFjaF9zZWdtZW50X2FsbChidmVjLCBiaW8sIGl0ZXJf
YWxsKSB7Cj4gPiA+PiAgICAgICAgICAgICAgICAgIHN0cnVjdCBwYWdlICpwYWdlID0gYnZlYy0+
YnZfcGFnZTsKPiA+ID4+IC0gICAgICAgICAgICAgICBlbnVtIGNvdW50X3R5cGUgdHlwZSA9IFdC
X0RBVEFfVFlQRShwYWdlKTsKPiA+ID4+ICsgICAgICAgICAgICAgICBlbnVtIGNvdW50X3R5cGUg
dHlwZSA9IFdCX0RBVEFfVFlQRShwYWdlLCBmYWxzZSk7Cj4gPiA+Pgo+ID4gPj4gICAgICAgICAg
ICAgICAgICBpZiAocGFnZV9wcml2YXRlX2R1bW15KHBhZ2UpKSB7Cj4gPiA+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgY2xlYXJfcGFnZV9wcml2YXRlX2R1bW15KHBhZ2UpOwo+ID4gPj4gQEAg
LTc2Miw3ICs3NjAsNyBAQCBpbnQgZjJmc19zdWJtaXRfcGFnZV9iaW8oc3RydWN0IGYyZnNfaW9f
aW5mbyAqZmlvKQo+ID4gPj4gICAgICAgICAgICAgICAgICB3YmNfYWNjb3VudF9jZ3JvdXBfb3du
ZXIoZmlvLT5pb193YmMsIGZpby0+cGFnZSwgUEFHRV9TSVpFKTsKPiA+ID4+Cj4gPiA+PiAgICAg
ICAgICBpbmNfcGFnZV9jb3VudChmaW8tPnNiaSwgaXNfcmVhZF9pbyhmaW8tPm9wKSA/Cj4gPiA+
PiAtICAgICAgICAgICAgICAgICAgICAgICBfX3JlYWRfaW9fdHlwZShwYWdlKSA6IFdCX0RBVEFf
VFlQRShmaW8tPnBhZ2UpKTsKPiA+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgIF9fcmVhZF9p
b190eXBlKHBhZ2UpIDogV0JfREFUQV9UWVBFKGZpby0+cGFnZSwgZmFsc2UpKTsKPiA+ID4+Cj4g
PiA+PiAgICAgICAgICBpZiAoaXNfcmVhZF9pbyhiaW9fb3AoYmlvKSkpCj4gPiA+PiAgICAgICAg
ICAgICAgICAgIGYyZnNfc3VibWl0X3JlYWRfYmlvKGZpby0+c2JpLCBiaW8sIGZpby0+dHlwZSk7
Cj4gPiA+PiBAQCAtOTczLDcgKzk3MSw3IEBAIGludCBmMmZzX21lcmdlX3BhZ2VfYmlvKHN0cnVj
dCBmMmZzX2lvX2luZm8gKmZpbykKPiA+ID4+ICAgICAgICAgIGlmIChmaW8tPmlvX3diYykKPiA+
ID4+ICAgICAgICAgICAgICAgICAgd2JjX2FjY291bnRfY2dyb3VwX293bmVyKGZpby0+aW9fd2Jj
LCBmaW8tPnBhZ2UsIFBBR0VfU0laRSk7Cj4gPiA+Pgo+ID4gPj4gLSAgICAgICBpbmNfcGFnZV9j
b3VudChmaW8tPnNiaSwgV0JfREFUQV9UWVBFKHBhZ2UpKTsKPiA+ID4+ICsgICAgICAgaW5jX3Bh
Z2VfY291bnQoZmlvLT5zYmksIFdCX0RBVEFfVFlQRShwYWdlLCBmYWxzZSkpOwo+ID4gPj4KPiA+
ID4+ICAgICAgICAgICpmaW8tPmxhc3RfYmxvY2sgPSBmaW8tPm5ld19ibGthZGRyOwo+ID4gPj4g
ICAgICAgICAgKmZpby0+YmlvID0gYmlvOwo+ID4gPj4gQEAgLTEwMDcsNiArMTAwNSw3IEBAIHZv
aWQgZjJmc19zdWJtaXRfcGFnZV93cml0ZShzdHJ1Y3QgZjJmc19pb19pbmZvICpmaW8pCj4gPiA+
PiAgICAgICAgICBlbnVtIHBhZ2VfdHlwZSBidHlwZSA9IFBBR0VfVFlQRV9PRl9CSU8oZmlvLT50
eXBlKTsKPiA+ID4+ICAgICAgICAgIHN0cnVjdCBmMmZzX2Jpb19pbmZvICppbyA9IHNiaS0+d3Jp
dGVfaW9bYnR5cGVdICsgZmlvLT50ZW1wOwo+ID4gPj4gICAgICAgICAgc3RydWN0IHBhZ2UgKmJp
b19wYWdlOwo+ID4gPj4gKyAgICAgICBlbnVtIGNvdW50X3R5cGUgdHlwZTsKPiA+ID4+Cj4gPiA+
PiAgICAgICAgICBmMmZzX2J1Z19vbihzYmksIGlzX3JlYWRfaW8oZmlvLT5vcCkpOwo+ID4gPj4K
PiA+ID4+IEBAIC0xMDQ2LDcgKzEwNDUsOCBAQCB2b2lkIGYyZnNfc3VibWl0X3BhZ2Vfd3JpdGUo
c3RydWN0IGYyZnNfaW9faW5mbyAqZmlvKQo+ID4gPj4gICAgICAgICAgLyogc2V0IHN1Ym1pdHRl
ZCA9IHRydWUgYXMgYSByZXR1cm4gdmFsdWUgKi8KPiA+ID4+ICAgICAgICAgIGZpby0+c3VibWl0
dGVkID0gMTsKPiA+ID4+Cj4gPiA+PiAtICAgICAgIGluY19wYWdlX2NvdW50KHNiaSwgV0JfREFU
QV9UWVBFKGJpb19wYWdlKSk7Cj4gPiA+PiArICAgICAgIHR5cGUgPSBXQl9EQVRBX1RZUEUoYmlv
X3BhZ2UsIGZpby0+Y29tcHJlc3NlZF9wYWdlKTsKPiA+ID4+ICsgICAgICAgaW5jX3BhZ2VfY291
bnQoc2JpLCB0eXBlKTsKPiA+ID4+Cj4gPiA+PiAgICAgICAgICBpZiAoaW8tPmJpbyAmJgo+ID4g
Pj4gICAgICAgICAgICAgICghaW9faXNfbWVyZ2VhYmxlKHNiaSwgaW8tPmJpbywgaW8sIGZpbywg
aW8tPmxhc3RfYmxvY2tfaW5fYmlvLAo+ID4gPj4gQEAgLTEwNTksNyArMTA1OSw4IEBAIHZvaWQg
ZjJmc19zdWJtaXRfcGFnZV93cml0ZShzdHJ1Y3QgZjJmc19pb19pbmZvICpmaW8pCj4gPiA+PiAg
ICAgICAgICAgICAgICAgIGlmIChGMkZTX0lPX0FMSUdORUQoc2JpKSAmJgo+ID4gPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKGZpby0+dHlwZSA9PSBEQVRBIHx8IGZpby0+dHlw
ZSA9PSBOT0RFKSAmJgo+ID4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmlv
LT5uZXdfYmxrYWRkciAmIEYyRlNfSU9fU0laRV9NQVNLKHNiaSkpIHsKPiA+ID4+IC0gICAgICAg
ICAgICAgICAgICAgICAgIGRlY19wYWdlX2NvdW50KHNiaSwgV0JfREFUQV9UWVBFKGJpb19wYWdl
KSk7Cj4gPiA+PiArICAgICAgICAgICAgICAgICAgICAgICBkZWNfcGFnZV9jb3VudChzYmksIFdC
X0RBVEFfVFlQRShiaW9fcGFnZSwKPiA+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGZpby0+Y29tcHJlc3NlZF9wYWdlKSk7Cj4gPiA+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgZmlvLT5yZXRyeSA9IDE7Cj4gPiA+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgZ290byBza2lwOwo+ID4gPj4gICAgICAgICAgICAgICAgICB9Cj4gPiA+PiBkaWZm
IC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+ID4gPj4gaW5kZXggNjUy
OTRlM2IwYmVmLi41MGYzZDU0NmRlZDggMTAwNjQ0Cj4gPiA+PiAtLS0gYS9mcy9mMmZzL2YyZnMu
aAo+ID4gPj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPiA+ID4+IEBAIC0xMDgwLDcgKzEwODAsOCBA
QCBzdHJ1Y3QgZjJmc19zbV9pbmZvIHsKPiA+ID4+ICAgICogZjJmcyBtb25pdG9ycyB0aGUgbnVt
YmVyIG9mIHNldmVyYWwgYmxvY2sgdHlwZXMgc3VjaCBhcyBvbi13cml0ZWJhY2ssCj4gPiA+PiAg
ICAqIGRpcnR5IGRlbnRyeSBibG9ja3MsIGRpcnR5IG5vZGUgYmxvY2tzLCBhbmQgZGlydHkgbWV0
YSBibG9ja3MuCj4gPiA+PiAgICAqLwo+ID4gPj4gLSNkZWZpbmUgV0JfREFUQV9UWVBFKHApICAg
ICAgICAoX19pc19jcF9ndWFyYW50ZWVkKHApID8gRjJGU19XQl9DUF9EQVRBIDogRjJGU19XQl9E
QVRBKQo+ID4gPj4gKyNkZWZpbmUgV0JfREFUQV9UWVBFKHAsIGYpICAgICAgICAgICAgICAgICAg
ICAgXAo+ID4gPj4gKyAgICAgICAoZiB8fCBmMmZzX2lzX2NwX2d1YXJhbnRlZWQocCkgPyBGMkZT
X1dCX0NQX0RBVEEgOiBGMkZTX1dCX0RBVEEpCj4gPiA+PiAgIGVudW0gY291bnRfdHlwZSB7Cj4g
PiA+PiAgICAgICAgICBGMkZTX0RJUlRZX0RFTlRTLAo+ID4gPj4gICAgICAgICAgRjJGU19ESVJU
WV9EQVRBLAo+ID4gPj4gQEAgLTM4MDQsNiArMzgwNSw3IEBAIHZvaWQgZjJmc19pbml0X2NrcHRf
cmVxX2NvbnRyb2woc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKTsKPiA+ID4+ICAgICovCj4gPiA+
PiAgIGludCBfX2luaXQgZjJmc19pbml0X2Jpb3NldCh2b2lkKTsKPiA+ID4+ICAgdm9pZCBmMmZz
X2Rlc3Ryb3lfYmlvc2V0KHZvaWQpOwo+ID4gPj4gK2Jvb2wgZjJmc19pc19jcF9ndWFyYW50ZWVk
KHN0cnVjdCBwYWdlICpwYWdlKTsKPiA+ID4+ICAgaW50IGYyZnNfaW5pdF9iaW9fZW50cnlfY2Fj
aGUodm9pZCk7Cj4gPiA+PiAgIHZvaWQgZjJmc19kZXN0cm95X2Jpb19lbnRyeV9jYWNoZSh2b2lk
KTsKPiA+ID4+ICAgdm9pZCBmMmZzX3N1Ym1pdF9yZWFkX2JpbyhzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmksIHN0cnVjdCBiaW8gKmJpbywKPiA+ID4+IC0tCj4gPiA+PiAyLjQwLjEKPiA+ID4+Cj4g
PiA+Pgo+ID4gPj4KPiA+ID4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gPiA+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gPj4gTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiA+ID4+IGh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
