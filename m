Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C699EA3F986
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2025 16:54:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tlVMY-00010m-Ha;
	Fri, 21 Feb 2025 15:54:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1tlVMX-00010g-NO
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Feb 2025 15:54:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VAlKnvF+99/2m3lfV6+cqEZKBv2WazQ70+jW+VGN9e4=; b=dNkg6lGonWTd0LbZNmcnS+L2WY
 cRrV1i0L6QZF6v3xSAdxTH713PsMMI5MxJjjFVo14u+muse9w/AvT5IxXvpzUyacVj7Er1xIC3v58
 g3/U6iqijDYgmQVwEKXVId+mWBOrZO03PXl4anSYNOY0qEjvwojNtgDoX0bLrdiLBZjk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VAlKnvF+99/2m3lfV6+cqEZKBv2WazQ70+jW+VGN9e4=; b=YF5QcS2erD2y0FZSulUBvIKTcS
 hZweKPvBVe1xX1EYF8fuDvYoSBpUqlxr93+hpF6It9hIUYeVBQfrs1KdSNmIgxxw4iSEA62j0nd6p
 y7pTDmZjvnVmeaNRUGksX2feIHkRp00HsXGyvvVjb0zJ9MaJPTZ1OnkwatBwZwSWZJWk=;
Received: from mail-vk1-f179.google.com ([209.85.221.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tlVMW-0000UJ-G8 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Feb 2025 15:54:49 +0000
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-5209437e773so694853e0c.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 Feb 2025 07:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740153277; x=1740758077; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VAlKnvF+99/2m3lfV6+cqEZKBv2WazQ70+jW+VGN9e4=;
 b=A8tRH/0wRWiaCa9mJyiKRgWepLGiNwdFMw+K17SqNe7nxq+ZGegebAuErcieIlSfDZ
 Xlo6QFAuRutxop281SHHwRPgSk4z5DN1omN1vv3S9KXmSFZVarGCPKbDq33piL8IQmTp
 zP9cEkR7yFL9XFMrKJyuRJpq6KyxLAiajZmPQMgqTrZJVqF/L8+rNkv9f6nr2fsadOJ8
 pUCWDhvxPrq5MqKzexvhYAU1RY6HiUZDkz7K7QOKsIfZdYK+GZS9eP3VRxrxjE1kbd3V
 n8PCjcpEo6WAoRE3We5pfTTAXL+Cycr+X0v38VHq8DjXuuzxAoXydXB7jHMkRu6xcu/g
 22oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740153277; x=1740758077;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VAlKnvF+99/2m3lfV6+cqEZKBv2WazQ70+jW+VGN9e4=;
 b=fhKRXO1mBYAJHyfu4JoReelVgqOPCOsUat32NwFl7Y3C1XR1uGAtPoP+SirdY665Ie
 eqOBBpZ/QwmY1Y2zPagOuBhkovH+66U4e0aqNu6hmJDLNUdksfmkL5k2eQRuFGO3kqLx
 NlTibJYln/RwAIwToJ4S31ZLmHzN+rY2wlEUe8fTQJ+wH1gIdZ+1W03sT3iDcbSDdVDr
 LUNJLz4lbTiHTvVj9GZcq6WUPVBFrILGZF8bipic+u97hNeBVr8MCCNoGlqKNZLYWeGk
 8kpXC8vjbGh1UcPCFZXBgtVZFKUQuhNSyzGcoV0MfvV1NFBOYcFk6I6dFvzXlvwpnzGZ
 ff0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMfI6llO3NIlfF76weX8zJR7TwPqrtjPgDPwSCG7BVck129I1vj8Aon/o2kk4UTlhw2NpEX+u6U81Wjge2OHH5@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwSLNPAHL/cxK/7gYeLrmriERQoZJ3sW3k2CrFMiwejc75vkJV+
 7oyzvzhJSWMNPYjn9r2sEoJBor/Zshi6VzlzUVa3Nfr3Lh3jmb03FiZZc7i0Cs6xSvHZ7SVVQQx
 Xeja0RHMVHqCFLqC97oH979iyrWs=
X-Gm-Gg: ASbGnctKZIqFf4qYo3sMj3SQkn6H7d1B2Wmssg+QfPAT4dcqIPXNME1B1pOEKQi/TSV
 hVdeoicWORuGQVFNuNR56nfGoYINaUAAZ/rWyodac2f5/JvOJmTeYKPUfpjVP/bk6HpxCugd/mb
 z/vKQ5HCT/R968zm/Avmbar9UutcN7rJ5N/aO0PKc=
X-Google-Smtp-Source: AGHT+IGNJWciAvxYEU43nHmk601QXqX/yyFJBTmJeYfZwXATYOt+ya/3dlODsznzoAksL9U/MMx1wrMX1tanFDsjBKc=
X-Received: by 2002:a05:6122:1790:b0:520:8911:df12 with SMTP id
 71dfb90a1353d-521ee4b4ffemr1711921e0c.10.1740153277426; Fri, 21 Feb 2025
 07:54:37 -0800 (PST)
MIME-Version: 1.0
References: <20250220154904.2698964-1-daeho43@gmail.com>
 <e62dfe59-61a9-426f-bec4-69223b7247f9@kernel.org>
In-Reply-To: <e62dfe59-61a9-426f-bec4-69223b7247f9@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 21 Feb 2025 07:54:26 -0800
X-Gm-Features: AWEUYZmIXYjVM-71wxVtJACatMvbaTMJ5MG_qRydRZx-EkilO0T0WnAkuZKE-E4
Message-ID: <CACOAw_yOYnJ+zsFS339u8tonQNZkM9kjkAdouD9gooydQL0Zaw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Feb 20, 2025 at 6:19 PM Chao Yu wrote: > > On 2025/2/20
    23:49, Daeho Jeong wrote: > > From: Daeho Jeong > > > > When we support segment
    or section unit discard, we should only focus on > [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.179 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [209.85.221.179 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.179 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.179 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1tlVMW-0000UJ-G8
Subject: Re: [f2fs-dev] [PATCH] f2fs: do not use granularity control for
 segment or section unit discard
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBGZWIgMjAsIDIwMjUgYXQgNjoxOeKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI1LzIvMjAgMjM6NDksIERhZWhvIEplb25nIHdyb3RlOgo+ID4g
RnJvbTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+Cj4gPiBXaGVuIHdl
IHN1cHBvcnQgc2VnbWVudCBvciBzZWN0aW9uIHVuaXQgZGlzY2FyZCwgd2Ugc2hvdWxkIG9ubHkg
Zm9jdXMgb24KPiA+IGhvdyBhY3RpdmVseSB3ZSBzdWJtaXQgZGlzY2FyZCBjb21tYW5kcyBmb3Ig
b25seSBvbmUgdHlwZSBvZiBzaXplLCBzdWNoCj4gPiBhcyBzZWdtZW50IG9yIHNlY3Rpb24uIElu
IHRoaXMgY2FzZSwgd2UgZG9uJ3QgaGF2ZSB0byBtYW5hZ2Ugc21hbGxlcgo+ID4gc2l6ZWQgZGlz
Y2FyZHMuCj4gPgo+ID4gUmVwb3J0ZWQtYnk6IFlvaGFuIEpvdW5nIDx5b2hhbi5qb3VuZ0Bzay5j
b20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29t
Pgo+ID4gLS0tCj4gPiAgIGZzL2YyZnMvc2VnbWVudC5jIHwgMjkgKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDkgZGVs
ZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIvZnMvZjJm
cy9zZWdtZW50LmMKPiA+IGluZGV4IGMyODJlOGEwYTJlYy4uNDMxNmZmN2FhMGQxIDEwMDY0NAo+
ID4gLS0tIGEvZnMvZjJmcy9zZWdtZW50LmMKPiA+ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4g
PiBAQCAtMTY2MSwxMiArMTY2MSwyMCBAQCBzdGF0aWMgaW50IF9faXNzdWVfZGlzY2FyZF9jbWQo
c3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZjJmc190aW1lX292ZXIoc2JpLCBVTU9VTlRfRElTQ0FSRF9USU1FT1VUKSkKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICBicmVhazsKPiA+Cj4gPiAtICAgICAgICAgICAgIGlmIChpICsgMSA8
IGRwb2xpY3ktPmdyYW51bGFyaXR5KQo+ID4gLSAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+
ID4gKyAgICAgICAgICAgICAvKgo+ID4gKyAgICAgICAgICAgICAgKiBEbyBub3QgZ3JhbnVsYXJp
dHkgY29udHJvbCBmb3Igc2VnbWVudCBvciBzZWN0aW9uCj4gPiArICAgICAgICAgICAgICAqIHVu
aXQgZGlzY2FyZCwgc2luY2Ugd2UgaGF2ZSBvbmx5IG9uZSB0eXBlIG9mIGRpc2NhcmQgbGVuZ3Ro
Lgo+ID4gKyAgICAgICAgICAgICAgKi8KPiA+ICsgICAgICAgICAgICAgaWYgKGYyZnNfYmxvY2tf
dW5pdF9kaXNjYXJkKHNiaSkpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiAoaSArIDEg
PCBkcG9saWN5LT5ncmFudWxhcml0eSkKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGJyZWFrOwo+ID4KPiA+IC0gICAgICAgICAgICAgaWYgKGkgKyAxIDwgZGNjLT5tYXhfb3JkZXJl
ZF9kaXNjYXJkICYmIGRwb2xpY3ktPm9yZGVyZWQpIHsKPiA+IC0gICAgICAgICAgICAgICAgICAg
ICBfX2lzc3VlX2Rpc2NhcmRfY21kX29yZGVybHkoc2JpLCBkcG9saWN5LCAmaXNzdWVkKTsKPiA+
IC0gICAgICAgICAgICAgICAgICAgICByZXR1cm4gaXNzdWVkOwo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIGlmIChpICsgMSA8IGRjYy0+bWF4X29yZGVyZWRfZGlzY2FyZCAmJgo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkcG9saWN5LT5vcmRlcmVkKSB7Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX2lzc3VlX2Rpc2NhcmRfY21kX29yZGVybHko
c2JpLCBkcG9saWN5LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICZpc3N1ZWQpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IGlzc3VlZDsKPiA+ICsgICAgICAgICAgICAgICAgICAgICB9Cj4gPiAgICAgICAgICAgICAgIH0K
PiA+Cj4gPiAgICAgICAgICAgICAgIHBlbmRfbGlzdCA9ICZkY2MtPnBlbmRfbGlzdFtpXTsKPiA+
IEBAIC0xNzAxLDYgKzE3MDksMTMgQEAgc3RhdGljIGludCBfX2lzc3VlX2Rpc2NhcmRfY21kKHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPiA+Cj4gPiAgICAgICAgICAgICAgIGlmIChpc3N1ZWQg
Pj0gZHBvbGljeS0+bWF4X3JlcXVlc3RzIHx8IGlvX2ludGVycnVwdGVkKQo+ID4gICAgICAgICAg
ICAgICAgICAgICAgIGJyZWFrOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAvKgo+ID4gKyAgICAg
ICAgICAgICAgKiBXZSBvbmx5IHVzZSB0aGUgbGFyZ2VzdCBkaXNjYXJkIHVuaXQgZm9yIHNlZ21l
bnQgb3IKPiA+ICsgICAgICAgICAgICAgICogc2VjdGlvbiB1bml0IGRpc2NhcmQuCj4gPiArICAg
ICAgICAgICAgICAqLwo+ID4gKyAgICAgICAgICAgICBpZiAoIWYyZnNfYmxvY2tfdW5pdF9kaXNj
YXJkKHNiaSkpCj4gPiArICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiAgICAgICB9Cj4g
Pgo+ID4gICAgICAgaWYgKGRwb2xpY3ktPnR5cGUgPT0gRFBPTElDWV9VTU9VTlQgJiYgaXNzdWVk
KSB7Cj4gPiBAQCAtMjMyMCwxMCArMjMzNSw2IEBAIHN0YXRpYyBpbnQgY3JlYXRlX2Rpc2NhcmRf
Y21kX2NvbnRyb2woc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+ID4gICAgICAgZGNjLT5kaXNj
YXJkX2dyYW51bGFyaXR5ID0gREVGQVVMVF9ESVNDQVJEX0dSQU5VTEFSSVRZOwo+ID4gICAgICAg
ZGNjLT5tYXhfb3JkZXJlZF9kaXNjYXJkID0gREVGQVVMVF9NQVhfT1JERVJFRF9ESVNDQVJEX0dS
QU5VTEFSSVRZOwo+ID4gICAgICAgZGNjLT5kaXNjYXJkX2lvX2F3YXJlID0gRFBPTElDWV9JT19B
V0FSRV9FTkFCTEU7Cj4gPiAtICAgICBpZiAoRjJGU19PUFRJT04oc2JpKS5kaXNjYXJkX3VuaXQg
PT0gRElTQ0FSRF9VTklUX1NFR01FTlQpCj4gPiAtICAgICAgICAgICAgIGRjYy0+ZGlzY2FyZF9n
cmFudWxhcml0eSA9IEJMS1NfUEVSX1NFRyhzYmkpOwo+ID4gLSAgICAgZWxzZSBpZiAoRjJGU19P
UFRJT04oc2JpKS5kaXNjYXJkX3VuaXQgPT0gRElTQ0FSRF9VTklUX1NFQ1RJT04pCj4gPiAtICAg
ICAgICAgICAgIGRjYy0+ZGlzY2FyZF9ncmFudWxhcml0eSA9IEJMS1NfUEVSX1NFQyhzYmkpOwo+
Cj4gSGkgRGFlaG8sCj4KPiBJIHRoaW5rIHRoaXMgYnVnIHdhcyBpbnRyb2R1Y2VkIGJ5IGNvbW1p
dCA0Zjk5MzI2NGZlMjkgKCJmMmZzOiBpbnRyb2R1Y2UKPiBkaXNjYXJkX3VuaXQgbW91bnQgb3B0
aW9uIiksIHNpbmNlIGl0IHNldCBkaXNjYXJkX2dyYW51bGFyaXR5IHRvIHNlY3Rpb24KPiBzaXpl
IGluY29ycmVjdGx5IGZvciBkaXNjYXJkX3VuaXQ9c2VjdGlvbiBtb3VudCBvcHRpb24sIG9uY2Ug
c2VjdGlvbiBzaXplCj4gaXMgbGFyZ2UgdGhhbiBzZWdtZW50IHNpemUsIGRpc2NhcmRfZ3JhbnVs
YXJpdHkgd2lsbCBiZSBsYXJnZXIgdGhhbiA1MTIuCj4KPiBIb3dldmVyLCB3LyBjdXJyZW50IGlt
cGxlbWVudGF0aW9uLCB3ZSBvbmx5IHN1cHBvcnQgcmFuZ2Ugb2YgWzEsIDUxMl0gZm9yCj4gZGlz
Y2FyZF9ncmFudWxhcml0eSBwYXJhbWV0ZXIsIHJlc3VsdGluZyBpbiBmYWlsaW5nIHRvIHN1Ym1p
dHRpbmcgYWxsCj4gZGljYXJkcy4KPgo+IFNvLCB3aGF0IGRvIHlvdSB0aGluayBvZiBzZXR0aW5n
IGRpc2NhcmRfZ3JhbnVsYXJpdHkgdG8gNTEyIGZvciBib3RoCj4gZGlzY2FyZF91bml0PXNlZ21l
bnQgYW5kIGRpc2NhcmRfdW5pdD1zZWN0aW9uIG1vdW50IG9wdGlvbiwgYXMgSSBwcm9wb3NlZAo+
IGluIFsxXT8gVGhlbiwgZGlzY2FyZF90aHJlYWQgaW4gRFBPTElDWV9CRyBtb2RlIGNhbiBzdWJt
aXQgdGhvc2UgbGFyZ2Utc2l6ZWQKPiBkaXNjYXJkcy4KPgo+IFsxXSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1mMmZzLWRldmVsLzUzNTk4MTQ2LTFmMDEtNDFhZC05ODBlLTlmNGI5ODll
ODFhYkBrZXJuZWwub3JnLwoKWWVzLCBpdCBtYWtlcyBzZW5zZS4gVGhhbmtzLgoKPgo+IFRoYW5r
cywKPgo+ID4KPiA+ICAgICAgIElOSVRfTElTVF9IRUFEKCZkY2MtPmVudHJ5X2xpc3QpOwo+ID4g
ICAgICAgZm9yIChpID0gMDsgaSA8IE1BWF9QTElTVF9OVU07IGkrKykKPgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
