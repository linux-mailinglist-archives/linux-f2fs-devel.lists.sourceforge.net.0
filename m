Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8835EA61A10
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Mar 2025 20:05:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ttALL-00007c-MU;
	Fri, 14 Mar 2025 19:05:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1ttALC-00006v-Uo
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Mar 2025 19:05:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V+9RYBlSqRiX3sFXlbBUdxZAuHY9PtDnv2uTp7oZT6w=; b=JQEc4jZHmJ+e8MlADTUSranFAR
 G7SC/1zh3engoNKtTpR4hiq+GPcZfD41zSnOGsl/sBC0nIx8w19QGHCPzPmofoEZ66ZNW5+a+cIuR
 Nwpkq1JKTnHwGB/YxrlhrxSsHUS3xdw9Fhq/0fkWczljrx8lZKzRfkoeh3nbAFeNCB2g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V+9RYBlSqRiX3sFXlbBUdxZAuHY9PtDnv2uTp7oZT6w=; b=Z+8x6iRnjm1rIOl2birUn+BfNn
 yKaVg3CCIC8hpeELXnRQ/fCXnyteC4QKZikRNMU0XwgCbsijk4evCAMXalf2MhqD772HYj8NhOe9r
 f00Nio6X6CLWNOfaOb/CnVYYE0HI9VMbCbc4PLMzfywxsR7ax1YwKC56FspHogCmxDTI=;
Received: from mail-ua1-f41.google.com ([209.85.222.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ttALC-0005Ub-Ud for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Mar 2025 19:05:07 +0000
Received: by mail-ua1-f41.google.com with SMTP id
 a1e0cc1a2514c-86929964ed3so2297283241.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 14 Mar 2025 12:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741979101; x=1742583901; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V+9RYBlSqRiX3sFXlbBUdxZAuHY9PtDnv2uTp7oZT6w=;
 b=MmdJqEt1oJorLkIw9bK7IHZUh3RpNedUjJA1guphgJ64AA2JwChpPt1QnBfb3U1eoK
 b/lHvWOt6IEjd8SqI27daYDRJN0ImwtIo+sSAPqkM74bXnHQ+1boOnUX10h0Pj+VYfkh
 2pxmYAJthGWPji2VjbzxeOz0Hw6pJWWrGwT1nQrgU0yNdJ4zRw6L2tdmQQeXAEwU8bFs
 x3rNVmBEw9AzFkCwcTEGPn/xnn5rUL1rpjWhi0GC/J+KeWLZ0FGwKnjQ/aE+oOtsl6Wi
 o6pBqh1xacULkr4aM0BqOSfgk/G1aDMvpYD59bwEO58uan+s6CjmPZz5wan8griilpfu
 x76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741979101; x=1742583901;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V+9RYBlSqRiX3sFXlbBUdxZAuHY9PtDnv2uTp7oZT6w=;
 b=Ey0UV1xZc1HwFPnZ6qzTyT9LToiLQ1f+hQ1gd27BadjO2UYOirMPPtDz7JWXD3/o4e
 pLWSsEmp1UPori1dNWWfCdVzvod81+1oQurcC3+YbYWnzzPsVg4jcqKSRSIognR7rNUA
 RLTVB3SQMhDxcS20umsK0a09GyBsfi9KWaD0TnuIyIiuBSafGutDyHiFWLdTVvr6p85b
 XkLUDhqfGVOSIEI4fMi9dD6vW+fWmm2AvoyOmZmAG5aLmZzTso/my1Zg96QFUSdTtewO
 BF31qaM9Vi5shmgKUyzbIxx6zJxUe4INYflJ3d6XcJmj2mjat9y0z9/CIfBt1PDhW3XD
 vCfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvNuDdAtzXR5QJmMMOZWGUcBEeHsEL0dTTiEH9mR8T3FxuNfesF9mwUo6kjI+xbArLFJd5Zj/9iXRv9V+LH6Au@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx59slcqqJWtul+seNBsgGBUlNs7+sQVYVMxqKPj7U+2/S7FRsv
 StjJRV7xblZmBhBqqREGg5YW9uDhMrmjW8MSX1S5nBvUxhkAZzF/LMbQv647OgktjCCoeEySbtB
 gJb0XwzVsq1fqfaNfhxqyw58ZwH4=
X-Gm-Gg: ASbGncuDj3Dw/ERHpbNMTF9/RWlZRg4IYTamq/6su5MqucsZiNi4Lv2zW4ZVinpfZrB
 LJDRh4xQh4Nli/soLoYTfUi9vz0/htztvXJcf0dAK2wJeBFfXvuk9nUcuHxLvJ5JAoWuoWtwa7y
 zvKiUdStyDP2NviPaJDdsBs5qwn97Ndmvl18bEzHDfNkJE/gxposV9pxDJBxU=
X-Google-Smtp-Source: AGHT+IHSxr4sqDV0Iyx6V7mpVn8a9lgdX17/Sft3eqo4Vh/Gr7EPaIw21V6PYc/Ax4PeyjP764VH/SCjWs4fEQFX9Ag=
X-Received: by 2002:a05:6122:91c:b0:523:a88b:9ac5 with SMTP id
 71dfb90a1353d-524499d5a99mr2787065e0c.9.1741979100992; Fri, 14 Mar 2025
 12:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250314120658epcas1p2d3ec037c294d4c907ce7fa2fe1c3aa27@epcas1p2.samsung.com>
 <20250314120651.443184-1-youngjin.gil@samsung.com>
In-Reply-To: <20250314120651.443184-1-youngjin.gil@samsung.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 14 Mar 2025 12:04:50 -0700
X-Gm-Features: AQ5f1JoR6iPCcAf1uBQxQ_-rGg6lhmrsBSsfLKffnPDtVLsKGXJBC4ZLXOW0OU4
Message-ID: <CACOAw_xVx_xHV9iVspKYK_sRnNYeqv1Ldk1teWyE-vyUNF1-Sw@mail.gmail.com>
To: Yeongjin Gil <youngjin.gil@samsung.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri, Mar 14, 2025 at 5:28 AM Yeongjin Gil wrote: > >
   In the case of the following call stack for an atomic file, > FI_DIRTY_INODE
    is set, but FI_ATOMIC_DIRTIED is not subsequently set. > > f2fs [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.41 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.222.41 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.222.41 listed in bl.score.senderscore.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.41 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1ttALC-0005Ub-Ud
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid atomicity corruption of
 atomic file
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
Cc: daehojeong@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 sj1557.seo@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpLCBNYXIgMTQsIDIwMjUgYXQgNToyOOKAr0FNIFllb25namluIEdpbCA8eW91bmdqaW4u
Z2lsQHNhbXN1bmcuY29tPiB3cm90ZToKPgo+IEluIHRoZSBjYXNlIG9mIHRoZSBmb2xsb3dpbmcg
Y2FsbCBzdGFjayBmb3IgYW4gYXRvbWljIGZpbGUsCj4gRklfRElSVFlfSU5PREUgaXMgc2V0LCBi
dXQgRklfQVRPTUlDX0RJUlRJRUQgaXMgbm90IHN1YnNlcXVlbnRseSBzZXQuCj4KPiBmMmZzX2Zp
bGVfd3JpdGVfaXRlcgo+ICAgZjJmc19tYXBfYmxvY2tzCj4gICAgIGYyZnNfcmVzZXJ2ZV9uZXdf
YmxvY2tzCj4gICAgICAgaW5jX3ZhbGlkX2Jsb2NrX2NvdW50Cj4gICAgICAgICBfX21hcmtfaW5v
ZGVfZGlydHkoZHF1b3QpCj4gICAgICAgICAgIGYyZnNfZGlydHlfaW5vZGUKPgo+IElmIEZJX0FU
T01JQ19ESVJUSUVEIGlzIG5vdCBzZXQsIGF0b21pYyBmaWxlIGNhbiBlbmNvdW50ZXIgY29ycnVw
dGlvbgo+IGR1ZSB0byBhIG1pc21hdGNoIGJldHdlZW4gb2xkIGZpbGUgc2l6ZSBhbmQgbmV3IGRh
dGEuCj4KPiBUbyByZXNvbHZlIHRoaXMgaXNzdWUsIEkgY2hhbmdlZCB0byBzZXQgRklfQVRPTUlD
X0RJUlRJRUQgd2hlbgo+IEZJX0RJUlRZX0lOT0RFIGlzIHNldC4gVGhpcyBlbnN1cmVzIHRoYXQg
RklfRElSVFlfSU5PREUsIHdoaWNoIHdhcwo+IHByZXZpb3VzbHkgY2xlYXJlZCBieSB0aGUgV3Jp
dGViYWNrIHRocmVhZCBkdXJpbmcgdGhlIGNvbW1pdCBhdG9taWMsIGlzCj4gc2V0IGFuZCBpX3Np
emUgaXMgdXBkYXRlZC4KPgo+IEZpeGVzOiBmY2NhYTgxZGU4N2UgKCJmMmZzOiBwcmV2ZW50IGF0
b21pYyBmaWxlIGZyb20gYmVpbmcgZGlydGllZCBiZWZvcmUgY29tbWl0IikKPiBSZXZpZXdlZC1i
eTogU3VuZ2pvbmcgU2VvIDxzajE1NTcuc2VvQHNhbXN1bmcuY29tPgo+IFJldmlld2VkLWJ5OiBT
dW5taW4gSmVvbmcgPHNfbWluLmplb25nQHNhbXN1bmcuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFll
b25namluIEdpbCA8eW91bmdqaW4uZ2lsQHNhbXN1bmcuY29tPgo+IC0tLQo+ICBmcy9mMmZzL2lu
b2RlLmMgfCA0ICstLS0KPiAgZnMvZjJmcy9zdXBlci5jIHwgNCArKysrCj4gIDIgZmlsZXMgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Zz
L2YyZnMvaW5vZGUuYyBiL2ZzL2YyZnMvaW5vZGUuYwo+IGluZGV4IGFhMmY0MTY5NmE4OC4uODNm
ODYyNTc4ZmM4IDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvaW5vZGUuYwo+ICsrKyBiL2ZzL2YyZnMv
aW5vZGUuYwo+IEBAIC0zNCwxMCArMzQsOCBAQCB2b2lkIGYyZnNfbWFya19pbm9kZV9kaXJ0eV9z
eW5jKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGJvb2wgc3luYykKPiAgICAgICAgIGlmIChmMmZzX2lu
b2RlX2RpcnRpZWQoaW5vZGUsIHN5bmMpKQo+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4KPiAt
ICAgICAgIGlmIChmMmZzX2lzX2F0b21pY19maWxlKGlub2RlKSkgewo+IC0gICAgICAgICAgICAg
ICBzZXRfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVRPTUlDX0RJUlRJRUQpOwo+ICsgICAgICAgaWYg
KGYyZnNfaXNfYXRvbWljX2ZpbGUoaW5vZGUpKQo+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4g
LSAgICAgICB9Cj4KPiAgICAgICAgIG1hcmtfaW5vZGVfZGlydHlfc3luYyhpbm9kZSk7Cj4gIH0K
PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zdXBlci5jIGIvZnMvZjJmcy9zdXBlci5jCj4gaW5kZXgg
Mzk3ZGYyNzE4ODVjLi5jMDhkNTJjNjQ2N2EgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9zdXBlci5j
Cj4gKysrIGIvZnMvZjJmcy9zdXBlci5jCj4gQEAgLTE1MzQsNiArMTUzNCwxMCBAQCBpbnQgZjJm
c19pbm9kZV9kaXJ0aWVkKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGJvb2wgc3luYykKPiAgICAgICAg
ICAgICAgICAgaW5jX3BhZ2VfY291bnQoc2JpLCBGMkZTX0RJUlRZX0lNRVRBKTsKPiAgICAgICAg
IH0KPiAgICAgICAgIHNwaW5fdW5sb2NrKCZzYmktPmlub2RlX2xvY2tbRElSVFlfTUVUQV0pOwo+
ICsKPiArICAgICAgIGlmICghcmV0ICYmIGYyZnNfaXNfYXRvbWljX2ZpbGUoaW5vZGUpKQo+ICsg
ICAgICAgICAgICAgICBzZXRfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVRPTUlDX0RJUlRJRUQpOwo+
ICsKPiAgICAgICAgIHJldHVybiByZXQ7Cj4gIH0KPgo+IC0tCj4gMi4zNC4xCj4KPgoKUmV2aWV3
ZWQtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+CgpUaGFua3MhCgo+Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
