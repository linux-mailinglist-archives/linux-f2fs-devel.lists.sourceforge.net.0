Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED155C618AB
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 16 Nov 2025 17:32:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:References:To:From:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUN/lpUYXLJORdohN5rbiYB0kiQEwS3gKjlyqhA3LmA=; b=YyDH/1SdvgP906KVSxRfD4t8ID
	UWTayXjMlcDEac01nhPRnlIo5wJo1fTlZ4V2CehXADDKdOdATqEav4rEzokRl17mJjW4NJWDPah24
	FxxZdUh+BY0t/edQaHWatLH+0W5C/BGk28U+U+Iss7A+ackOsmAxV9/W1PYu7IwpZK4w=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vKffX-0006KF-V9;
	Sun, 16 Nov 2025 16:32:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vKffW-0006K9-Qp
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 16 Nov 2025 16:32:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YXlulzafkddq1QbUA6a2lc/rEASPI8/+3yFrQMjQ/W4=; b=QEguNVIZJtqGdJqoYwyAtnJWby
 yWScn8Ey8lXpGrHq99n58fKxZKRZOHMCISc0GY3D7f9bo7ttAmSySfA25GC/pGKXI1GsbnYg1hLUQ
 glejjpIubfJPabLyL09ghO8dNXD/Cs99s7wU9DPFk+UKVZsrkBJaxv/Hj744ZYUc7wNc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:
 Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YXlulzafkddq1QbUA6a2lc/rEASPI8/+3yFrQMjQ/W4=; b=WuQOD0D8bAAIGaE5zhBaC73C8x
 ldjZwqJH8sOnSd210tsFIJ72Iq6wkoM4aiGI/wdc7PJ9mBRyLFaE8hMDwMZV5/THTG8IoJPW71CvU
 wTwRXh2xj3+Nx1v0+0IBnL7Sdi5KIQ1FpjJxxig1Q/59Ej8dXzpildiEAR10OPPNe0BE=;
Received: from mail-pl1-f175.google.com ([209.85.214.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vKffW-0005Dw-7z for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 16 Nov 2025 16:32:02 +0000
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-297e982506fso42009115ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 16 Nov 2025 08:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763310711; x=1763915511; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YXlulzafkddq1QbUA6a2lc/rEASPI8/+3yFrQMjQ/W4=;
 b=MiBiMPR9nKvRf2cYxy4UkED8HLZk4/kT3AUs6wf5jX9qzFM/Hcl4bR2y8SEbUexfD+
 A54C3UTZbAT32yN65DYtArHmJCQfnMYhxumB4VT6tv5WlikTdmHoMV2CFay34L6n+DWQ
 DGA2FzQ78NFAnIiSoBugIdPxCsmYU5cOIpzCywIr5EFPPFvZMJ+S0IElQOUFozrpX79h
 lsfhjWegfyXS/QlC4+fXT9T5mjO0x2rekbeuQSGh0c67nt7eRy/nu2kl9kVFfITwCeM2
 yJ6k0dp7Ma3AabCjMs5khCd1i+rAyHfPU/Rtb8Sent4NTZuja9N3c89ypTvekILvbj+i
 yK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763310711; x=1763915511;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YXlulzafkddq1QbUA6a2lc/rEASPI8/+3yFrQMjQ/W4=;
 b=imLUfXD4AeUYk8IsgWv4ExHOUXgCLZcg3jazcyEO/J0iAXTghgc/fJn5OhT7NGspWz
 3IQGQuguKT+wbwpbtB0+w50j/DjB/tP0sLOXRtZSEKnd8JTcs4A32ELEoYGwlhfj3UvS
 DVJFCTBg3DoL3X0IxP4B4leURUBNqEWseDMa8pm7tdXQsSBi+wFHOK5UHlPB3UeyWsfZ
 L0NUgDr0fT7No7h8MVc3E2yYSnkwBlTY/8eYBxIMZoaWjo290w78Ye2l4BE/P7TCYEba
 reAi8moXpsUJ/4V0uYni/ruSi9QJWTO1zCEnXKfycVL2FGwg/pEzYrZgasuAkDeiht1o
 1T+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCOc7pj0UnV7AlyxH+BnZW3UN/A4Gs7F+48OuoBs9zEuYw8l15Y38D/DGo3G6kEa89MHoG59RzeMOM5ffhV7HE@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyoYG1AWmFCBxr2YnFUg67vw14PWJFuLcCWn5ckMGyE5RIHT/NU
 0WdHQAWqzJdWykEIUE3f4qHFcE1UTym+E82j+VJmdUsy+ITYsnJ8Av4T
X-Gm-Gg: ASbGncuv8jb9uZ36NFfc4wMy1UG9/0D9HgkL79Rwx0bXhByMCTtx7ZYh/M+GzH1RBgP
 jvaEIxkW7oRzJJuZCWWwFpnHcnXufe+XocLC93jBzpdX8OVc+oNQRF43c61ZUirj0f4lnKsLVqh
 plwCRkIjc+fGDWuf0tEtMgfvpsdbTPdZX8qGt6elo4B4+i04GOQRqbihdQ2kM58YqjDAxmOWTt3
 ha0eFG23COQ/vkAFoFe7oCDJ7QBqcZNaK1IIzgA6KCmMrqVtPzatwthIeKWNJr5vaxWf8+8krq8
 ljNtXw+XzqdtaErsBcKjmmTpOwuaiumjuBFGVvwrP96RK0NKOgf4klCkFmewege6yakuwJBsfpP
 ywrh7ogL3DaivZgx1JFj4/QNtWsR/yktbmoh22w788Kc0G0vQJcJOFazi8tZqDcXtjobqMnYTd0
 pxZ+Knwo+c1nmnKx8D0prf+B23TKc+5uWug6b0qVdmDVgFr6u11ykHtC/qj45bm5lj8EWw54Gu3
 CNG
X-Google-Smtp-Source: AGHT+IHqnrgoLFEwqtfbujnnq6D07GBKZDubvBmPh2oQJ83yG2xIDENjVSw1ZVFlsUApURkq+kiQFw==
X-Received: by 2002:a17:902:c94d:b0:295:6427:87d2 with SMTP id
 d9443c01a7336-2986a76f56cmr112843315ad.53.1763310711400; 
 Sun, 16 Nov 2025 08:31:51 -0800 (PST)
Received: from ?IPV6:2409:8a00:79b1:1770:bce6:2db6:229f:8124?
 ([2409:8a00:79b1:1770:bce6:2db6:229f:8124])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c234644sm114080405ad.10.2025.11.16.08.31.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Nov 2025 08:31:50 -0800 (PST)
Message-ID: <3b488053-b07b-428f-9415-741119af3d35@gmail.com>
Date: Mon, 17 Nov 2025 00:31:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>, Yongpeng Yang <yangyongpeng@xiaomi.com>
References: <20251110082223.902207-1-yangyongpeng.storage@gmail.com>
 <20251110082223.902207-3-yangyongpeng.storage@gmail.com>
 <aRT_KGOSGOGw3S4W@google.com>
 <4c31e634-f88e-4cec-8d1e-b8434a11ebee@kernel.org>
 <9df8fb59-8afb-4b20-b4fa-14bd873c9502@gmail.com>
 <1d03119c-bec1-4269-b385-34ce422125d3@kernel.org>
Content-Language: en-US
In-Reply-To: <1d03119c-bec1-4269-b385-34ce422125d3@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/15/2025 7:36 PM, Chao Yu via Linux-f2fs-devel wrote:
 > On 11/14/2025 3:37 PM, Yongpeng Yang wrote: >> On 11/14/25 08:51, Chao
 Yu via Linux-f2fs-devel wrote: >>> On 11/13/2025 5:42 AM, Jaegeuk K [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.175 listed in wl.mailspike.net]
X-Headers-End: 1vKffW-0005Dw-7z
Subject: Re: [f2fs-dev] [PATCH v2 3/3] f2fs: fix handling of zoned block
 devices with max_open_zones == 0
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ck9uIDExLzE1LzIwMjUgNzozNiBQTSwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90
ZToKPiBPbiAxMS8xNC8yMDI1IDM6MzcgUE0sIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+IE9uIDEx
LzE0LzI1IDA4OjUxLCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+Pj4gT24g
MTEvMTMvMjAyNSA1OjQyIEFNLCBKYWVnZXVrIEtpbSB3cm90ZToKPj4+PiBUaGlzIGJyZWFrcyB0
aGUgZGV2aWNlIGdpdmluZyAwIG9wZW4gem9uZSB3aGljaCB3YXMgd29ya2luZy4gSGVuY2UsIEkK
Pj4+PiBkcm9wcGVkCj4+Pj4gdGhlIGNoYW5nZS4KPj4+Pgo+Pj4+IE9uIDExLzEwLCBZb25ncGVu
ZyBZYW5nIHdyb3RlOgo+Pj4+PiBGcm9tOiBZb25ncGVuZyBZYW5nIDx5YW5neW9uZ3BlbmdAeGlh
b21pLmNvbT4KPj4+Pj4KPj4+Pj4gV2hlbiBlbXVsYXRpbmcgYSBaTlMgU1NEIG9uIHFlbXUgd2l0
aCB6b25lZC5tYXhfb3BlbiBzZXQgdG8gMCwgdGhlCj4+Pj4+IEYyRlMgY2FuIHN0aWxsIGJlIG1v
dW50ZWQgc3VjY2Vzc2Z1bGx5LiBUaGUgc3lzZnMgZW50cnkgc2hvd3MKPj4+Pj4gc2JpLT5tYXhf
b3Blbl96b25lcyBhcyBVSU5UX01BWC4KPj4+Pj4KPj4+Pj4gcm9vdEBmZWRvcmEtdm06fiMgY2F0
IC9zeXMvYmxvY2svbnZtZTBuMS9xdWV1ZS96b25lZAo+Pj4+PiBob3N0LW1hbmFnZWQKPj4+Pj4g
cm9vdEBmZWRvcmEtdm06fiMgY2F0IC9zeXMvYmxvY2svbnZtZTBuMS9xdWV1ZS9tYXhfb3Blbl96
b25lcwo+Pj4+PiAwCj4+Pj4+IHJvb3RAZmVkb3JhLXZtOn4jIG1rZnMuZjJmcyAtbSAtYyAvZGV2
L252bWUwbjEgL2Rldi92ZGEKPj4+Pj4gcm9vdEBmZWRvcmEtdm06fiMgbW91bnQgL2Rldi92ZGEg
L21udC9mMmZzLwo+Pj4+PiByb290QGZlZG9yYS12bTp+IyBjYXQgL3N5cy9mcy9mMmZzL3ZkYS9t
YXhfb3Blbl96b25lcwo+Pj4+PiA0Mjk0OTY3Mjk1Cj4+Pj4+Cj4+Pj4+IFRoZSByb290IGNhdXNl
IGlzIHRoYXQgc2JpLT5tYXhfb3Blbl96b25lcyBpcyBpbml0aWFsaXplZCB0byBVSU5UX01BWAo+
Pj4+PiBhbmQgb25seSB1cGRhdGVkIHdoZW4gdGhlIGRldmljZeKAmXMgbWF4X29wZW5fem9uZXMg
aXMgZ3JlYXRlciB0aGFuIDAuCj4+Pj4+IEhvd2V2ZXIsIGJvdGggdGhlIHNjc2kgZHJpdmVyIChz
ZF96YmNfcmVhZF96b25lcyBtYXkgYXNzaWducyAwIHRvCj4+Pj4+IGRldmljZSdzIG1heF9vcGVu
X3pvbmVzKSBhbmQgdGhlIG52bWUgZHJpdmVyIChudm1lX3F1ZXJ5X3pvbmVfaW5mbyAKPj4+Pj4g
ZG9uJ3QKPj4+Pj4gY2hlY2sgbWF4X29wZW5fem9uZXMpIGFsbG93IG1heF9vcGVuX3pvbmVzIHRv
IGJlIDAuCj4+Pj4+Cj4+Pj4+IFRoaXMgcGF0Y2ggZml4ZXMgdGhlIGlzc3VlIGJ5IHByZXZlbnRp
bmcgbW91bnRpbmcgb24gem9uZWQgU1NEcyB3aGVuCj4+Pj4+IG1heF9vcGVuX3pvbmVzIGlzIDAs
IHdoaWxlIHN0aWxsIGFsbG93aW5nIFNNUiBIRERzIHRvIGJlIG1vdW50ZWQuCj4+Pj4+IGluaXRf
Ymxrel9pbmZvKCkgaXMgb25seSBjYWxsZWQgYnkgZjJmc19zY2FuX2RldmljZXMoKSwgYW5kIHRo
ZQo+Pj4+PiBibGt6b25lZCBmZWF0dXJlIGhhcyBhbHJlYWR5IGJlZW4gY2hlY2tlZCB0aGVyZS4g
U28sIHRoaXMgcGF0Y2ggYWxzbwo+Pj4+PiByZW1vdmUgcmVkdW5kYW50IHpvbmVkIGRldmljZSBj
aGVja3MuCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25n
cGVuZ0B4aWFvbWkuY29tPgo+Pj4+PiAtLS0KPj4+Pj4gwqDCoCBmcy9mMmZzL3N1cGVyLmMgfCAz
NiArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KPj4+Pj4gwqDCoCAxIGZpbGUg
Y2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCj4+Pj4+Cj4+Pj4+IGRp
ZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKPj4+Pj4gaW5kZXgg
ZGI3YWZiODA2NDExLi42ZGM4OTQ1ZTI0YWYgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2ZzL2YyZnMvc3Vw
ZXIuYwo+Pj4+PiArKysgYi9mcy9mMmZzL3N1cGVyLmMKPj4+Pj4gQEAgLTQzNTMsMjEgKzQzNTMs
NiBAQCBzdGF0aWMgaW50IGluaXRfYmxrel9pbmZvKHN0cnVjdCBmMmZzX3NiX2luZm8KPj4+Pj4g
KnNiaSwgaW50IGRldmkpCj4+Pj4+IMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgbWF4X29wZW5f
em9uZXM7Cj4+Pj4+IMKgwqDCoMKgwqDCoCBpbnQgcmV0Owo+Pj4+PiAtwqDCoMKgIGlmICghZjJm
c19zYl9oYXNfYmxrem9uZWQoc2JpKSkKPj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+
Pj4+PiAtCj4+Pj4+IC3CoMKgwqAgaWYgKGJkZXZfaXNfem9uZWQoRkRFVihkZXZpKS5iZGV2KSkg
ewo+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgbWF4X29wZW5fem9uZXMgPSBiZGV2X21heF9vcGVuX3pv
bmVzKGJkZXYpOwo+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKG1heF9vcGVuX3pvbmVzICYmICht
YXhfb3Blbl96b25lcyA8IHNiaS0+bWF4X29wZW5fem9uZXMpKQo+Pj4+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzYmktPm1heF9vcGVuX3pvbmVzID0gbWF4X29wZW5fem9uZXM7Cj4+Pj4+IC3C
oMKgwqDCoMKgwqDCoCBpZiAoc2JpLT5tYXhfb3Blbl96b25lcyA8IEYyRlNfT1BUSU9OKHNiaSku
YWN0aXZlX2xvZ3MpIHsKPj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZjJmc19lcnIoc2Jp
LAo+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJ6b25lZDogbWF4IG9wZW4g
em9uZXMgJXUgaXMgdG9vIHNtYWxsLCBuZWVkIGF0Cj4+Pj4+IGxlYXN0ICV1IG9wZW4gem9uZXMi
LAo+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNiaS0+bWF4X29wZW5fem9u
ZXMsIEYyRlNfT1BUSU9OKHNiaSkuYWN0aXZlX2xvZ3MpOwo+Pj4+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4+Pj4gLcKgwqDCoMKgwqDCoMKgIH0KPj4+Pj4gLcKg
wqDCoCB9Cj4+Pj4+IC0KPj4+Pj4gwqDCoMKgwqDCoMKgIHpvbmVfc2VjdG9ycyA9IGJkZXZfem9u
ZV9zZWN0b3JzKGJkZXYpOwo+Pj4+PiDCoMKgwqDCoMKgwqAgaWYgKHNiaS0+YmxvY2tzX3Blcl9i
bGt6ICYmIHNiaS0+YmxvY2tzX3Blcl9ibGt6ICE9Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBTRUNUT1JfVE9fQkxPQ0soem9uZV9zZWN0b3JzKSkKPj4+Pj4gQEAg
LTQzNzgsNiArNDM2MywyNyBAQCBzdGF0aWMgaW50IGluaXRfYmxrel9pbmZvKHN0cnVjdCBmMmZz
X3NiX2luZm8KPj4+Pj4gKnNiaSwgaW50IGRldmkpCj4+Pj4+IMKgwqDCoMKgwqDCoCBpZiAobnJf
c2VjdG9ycyAmICh6b25lX3NlY3RvcnMgLSAxKSkKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAg
RkRFVihkZXZpKS5ucl9ibGt6Kys7Cj4+Pj4+ICvCoMKgwqAgbWF4X29wZW5fem9uZXMgPSBiZGV2
X21heF9vcGVuX3pvbmVzKGJkZXYpOwo+Pj4+PiArwqDCoMKgIGlmICghbWF4X29wZW5fem9uZXMp
IHsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC8qCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgICogU1NE
cyByZXF1aXJlIG1heF9vcGVuX3pvbmVzID4gMCB0byBiZSBtb3VudGFibGUuCj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgICogRm9yIEhERHMsIGlmIG1heF9vcGVuX3pvbmVzIGlzIHJlcG9ydGVkIGFz
IDAsIGl0IGRvZXNuJ3QKPj4+Pj4gbWF0dGVyLAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIHNl
dCBpdCB0byBGREVWKGRldmkpLm5yX2Jsa3ouCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgICovCj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoYmRldl9ub25yb3QoYmRldikpIHsKPj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZjJmc19lcnIoc2JpLCAiem9uZWQ6IFNTRCBkZXZpY2UgJXMgd2l0
aG91dCBvcGVuIHpvbmVzIiwKPj4+Pj4gRkRFVihkZXZpKS5wYXRoKTsKPj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+Pgo+Pj4gT2gsIHNvLCBmb3IgY29udmVu
dGlvbmFsIFVGUywgaXQgd2lsbCBnbyBpbnRvIHRoaXMgcGF0aCBhcyBTU0Qgdy8gemVybwo+Pj4g
b3BlbiB6b25lPwo+Pj4KPj4+IEFueSB3YXkgdG8gZGlzdGluZ3Vpc2ggdGhhdD8KPj4+Cj4+PiBU
aGFua3MsCj4+Pgo+Pgo+PiBzYmktPm1heF9vcGVuX3pvbmVzIG1pZ2h0IGJlIGNsYXNzaWZpZWQg
aW50byA0IGNhc2VzOgo+Pgo+PiAxLiBGb3Igbm9uIHJvdGF0aW9uYWwgZGV2aWNlcyB0aGF0IGhh
dmUgYm90aCBjb252ZW50aW9uYWwgem9uZXMgYW5kCj4+IHNlcXVlbnRpYWwgem9uZXMsIHdlIHNo
b3VsZCBzdGlsbCBlbnN1cmUgdGhhdCBtYXhfb3Blbl96b25lcyA+IDAuIElmIHRoZQo+PiAjIG9m
IHNlcXVlbnRpYWwgem9uZXMgZXhjZWVkcyBtYXhfb3Blbl96b25lcywgd2Ugc3RpbGwgbmVlZCB0
byBndWFyYW50ZWUKPj4gdGhhdCBtYXhfb3Blbl96b25lcyA+PSBGMkZTX09QVElPTihzYmkpLmFj
dGl2ZV9sb2dzLgo+Pgo+PiBJIHRlc3RlZCB0aGlzIHdpdGggbnVsbF9ibGsgYnkgZW11bGF0aW5n
IGEgZGV2aWNlIHRoYXQgaGFzIDEwCj4+IGNvbnZlbnRpb25hbCB6b25lcyBhbmQgNCBzZXF1ZW50
aWFsIHpvbmVzLCBhbmQgdGhlIGZpbGVzeXN0ZW0gY2FuIGJlCj4+IGZvcm1hdHRlZCBzdWNjZXNz
ZnVsbHkuIEluIHRoaXMgY2FzZSwgdGhlIGZpbGVzeXN0ZW0gc2hvdWxkIGFsc28gYmUKPj4gbW91
bnRhYmxlLCBhbmQgc2JpLT5tYXhfb3Blbl96b25lcyBzaG91bGQgYmUgMTQuIEhvd2V2ZXIsIGlm
Cj4+IHpvbmVfbWF4X29wZW4gaXMgc2V0IHRvIDMsIHRoZSBmaWxlc3lzdGVtIGNhbm5vdCBiZSBt
b3VudGVkLgo+Pgo+PiAjbW9kcHJvYmUgbnVsbF9ibGsgbnJfZGV2aWNlcz0xIHpvbmVkPTHCoCB6
b25lX25yX2NvbnY9MTDCoCB6b25lX3NpemU9MTAyNAo+PiBnYj0xNCBicz00MDk2IHJvdGF0aW9u
YWw9MCB6b25lX21heF9vcGVuPTQKPj4gI21rZnMuZjJmcyAtbSAtYyAvZGV2L251bGxiMCAvZGV2
L3ZkYSAtZgo+Pgo+PiBTbywgc2JpLT5tYXhfb3Blbl96b25lcyBtaWdodCBiZSAjIG9mIG1heF9v
cGVuX3pvbmVzIG9yICcjIG9mIHNlcXVlbnRpYWwKPj4gem9uZXMnICsgJyMgb2YgY29udmVudGlv
bmFsIHpvbmVzJy4KPj4KPj4gMi4gRm9yIG5vbiByb3RhdGlvbmFsIGRldmljZXMgd2hpY2ggb25s
eSBoYXZlIGNvbnZlbnRpb25hbCB6b25lcywgSSdtCj4+IG5vdCBzdXJlIHdoZXRoZXIgdGhlcmUg
YXJlIHpvbmVkIGZsYXNoIGRldmljZXMgdGhhdCBwcm92aWRlIG9ubHkKPiAKPiBJIGd1ZXNzIHRo
aXMgaXMgYSBzaW1pbGFyIGNhc2UsIHdlIHNob3VsZCBub3QgbGV0IG1vdW50KCkgZmFpbCBmb3Ig
c3VjaCAKPiBjYXNlLAo+IHJpZ2h0PwoKWWVzLCBpdCBzaG91bGQgYmUgbW91dGFibGUuIEknbGwg
dGFrZSBhbGwgdGhlc2UgY2FzZXMgaW50byBhY2NvdW50IGluCnRoZSB2MyBwYXRjaC4KCj4gCj4g
LSBtb2Rwcm9iZSBudWxsX2JsayBucl9kZXZpY2VzPTEgem9uZWQ9MSB6b25lX25yX2NvbnY9NTEy
IHpvbmVfc2l6ZT0yIFwKPiBnYj0xIGJzPTQwOTYgcm90YXRpb25hbD0wIHpvbmVfbWF4X29wZW49
NgoKVGhpcyBzY2VuYXJpbyBjYW5ub3QgYmUgZW11bGF0ZWQgd2l0aCBudWxsX2Jsay4gVGhlcmUg
bXVzdCBiZSBhdCBsZWFzdCAxCnNlcXVlbnRpYWwgem9uZSwgYW5kIHpvbmVfbWF4X29wZW4gaXMg
Z3JlYXRlciB0aGFuICMgb2Ygc2VxdWVudGlhbAp6b25lcywgd2hlcmVhcyBpbiByZWFsaXR5IG1h
eF9vcGVuX3pvbmVzIGlzIDAuCgpZb25ncGVuZywKCj4gLSBta2ZzLmYyZnMgLW0gL2Rldi9udWxs
YjAKPiAtIG1vdW50IC9kZXYvbnVsbGIwIC9tbnQvZjJmcwo+IAo+IFRoYW5rcywKPiAKPj4gY29u
dmVudGlvbmFsIHpvbmVzLiBJZiBzdWNoIGRldmljZXMgZG8gZXhpc3QsIHRoZW4gcmV0dXJuaW5n
IC1FSU5WQUwgaXMKPj4gaW5kZWVkIG5vdCBhcHByb3ByaWF0ZS4gc2JpLT5tYXhfb3Blbl96b25l
cyBzaG91bGQgYmUgIyBvZiBjb252ZW50aW9uYWwKPj4gem9uZXMuCj4+Cj4+IDMuIEZvciBub24g
cm90YXRpb25hbCBkZXZpY2VzIHdoaWNoIG9ubHkgaGF2ZSBzZXF1ZW50aWFsIHpvbmVzLCBzYmkt
Cj4+PiBtYXhfb3Blbl96b25lcyBzaG91bGQgYmUgIyBtYXhfb3Blbl96b25lcy4KPj4KPj4gNC4g
Rm9yIHJvdGF0aW9uYWwgZGV2aWNlcywgc2JpLT5tYXhfb3Blbl96b25lcyBzaG91bGQgYmUgIyB6
b25lcyBvcgo+PiBtYXhfb3Blbl96b25lcy4KPj4KPj4gQW0gSSBtaXNzaW5nIGFueSBvdGhlciBj
YXNlcz8KPj4KPj4gWW9uZ3BlbmcsCj4+Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoCBtYXhfb3Blbl96b25lcyA9IEZERVYoZGV2aSkubnJfYmxrejsKPj4+Pj4g
K8KgwqDCoCB9Cj4+Pj4+ICvCoMKgwqAgc2JpLT5tYXhfb3Blbl96b25lcyA9IG1pbl90KHVuc2ln
bmVkIGludCwgbWF4X29wZW5fem9uZXMsIHNiaS0KPj4+Pj4+IG1heF9vcGVuX3pvbmVzKTsKPj4+
Pj4gK8KgwqDCoCBpZiAoc2JpLT5tYXhfb3Blbl96b25lcyA8IEYyRlNfT1BUSU9OKHNiaSkuYWN0
aXZlX2xvZ3MpIHsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGYyZnNfZXJyKHNiaSwKPj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgInpvbmVkOiBtYXggb3BlbiB6b25lcyAldSBpcyB0b28gc21h
bGwsIG5lZWQgYXQgbGVhc3QgJXUKPj4+Pj4gb3BlbiB6b25lcyIsCj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHNiaS0+bWF4X29wZW5fem9uZXMsIEYyRlNfT1BUSU9OKHNiaSkuYWN0aXZl
X2xvZ3MpOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+Pj4+ICvCoMKg
wqAgfQo+Pj4+PiArCj4+Pj4+IMKgwqDCoMKgwqDCoCBGREVWKGRldmkpLmJsa3pfc2VxID0gZjJm
c19rdnphbGxvYyhzYmksCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIEJJVFNfVE9fTE9OR1MoRkRFVihkZXZpKS5ucl9ibGt6KQo+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHNpemVvZih1bnNpZ25lZCBs
b25nKSwKPj4+Pj4gLS0gCj4+Pj4+IDIuNDMuMAo+Pgo+Pgo+IAo+IAo+IAo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo=
