Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D11AAC27C6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 May 2025 18:41:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qIev6M836UY/aXabjoVGv/8JIrN22dz2LKpG0DQfOD0=; b=ZrfXPOo2nCV68pEcfWNu1KV1wx
	yFJhmDkmSidQ6AKRc8sYtIyWVG/GrqPXPBrV5sPiKFfXMzmHIOoweiec7hNVeBzYvkxYv1btt8yt2
	y7lvOKSeom9RU54QpeZOPbbXF35Fji2UcwXqDbFyV4khzoYw5Xqw522WCTEjQt0pi0mU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uIVS7-0006Ik-W4;
	Fri, 23 May 2025 16:40:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1uIVS6-0006Id-Lu
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 May 2025 16:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rQrF9YRsflR7/GINj2+0t5pNix1EimXCUknfwsemFCk=; b=RMCc+9psVXEanvR8bvFEnm1Eca
 74nnuMFxbPL2daDeg7SVgx3ESCl8qyTx2p4rdQY/u+AUl6p8RW12XLGFdEPTF2Xzwo1E9vo993hzc
 wJhr5X8PC9uhh3iue/QyfMyg0ANsTDtMH7BO5oe7C/ZsfUJZXWixV5nSWVEO2JA+5sIA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rQrF9YRsflR7/GINj2+0t5pNix1EimXCUknfwsemFCk=; b=DaQMPHbnMPXLLxZG1uvX7wwvHC
 ZAGwkPJ+AXEOsRMhTni4svCpa2L6i8DDqwxQDdOfhRUvoedPwhDwIQ0EWbvzT8B4rYjech24nJJqo
 VYGLCKbUTv5jQZ31iJhFnwNxCnb7FhnM+0S0ouAroYX9dRmxN6rpUHyJhBlixw68f6C4=;
Received: from mail-ua1-f51.google.com ([209.85.222.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uIVS6-0006Ww-7v for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 May 2025 16:40:58 +0000
Received: by mail-ua1-f51.google.com with SMTP id
 a1e0cc1a2514c-86fea8329cdso33183241.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 23 May 2025 09:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748018447; x=1748623247; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rQrF9YRsflR7/GINj2+0t5pNix1EimXCUknfwsemFCk=;
 b=D2eyXN/jgbPywRjF+WJ7AVXpSYuHO7AzKII78GuRBEvtiBcjWzoHKlknAD+Owgqsz+
 TS4QX0l83ujQCFXDmMS4msRSb8lLMaGI7YIcBlgpxiPDagSVD/JgVgZi6Vcivv76T9cX
 8UxVx8WGWO1vQqmXmUCzHW/StNl5Qz+WeoideEpAI11S40/bDEnMKeY+KEWotUEUDq5I
 EAlnkFNqMmLRToeBvWOOrz9bW2VJMrZjs07EIszfhpBodTPzInf8a3Nf0TJsmvGBLUtd
 /MJxi7cl0kijbUUPlFmEm1nbklxqyzaqiaOkiweFPnCbhUN3KE+UIJq+AyPAv87qjjJw
 b6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748018447; x=1748623247;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rQrF9YRsflR7/GINj2+0t5pNix1EimXCUknfwsemFCk=;
 b=eZ6372EEgZ3IhVoc8sDeMDZW8qvP8KDYRyS8Ldc1qMZu9/kh/G5YcFo99EFMzZZ93f
 aDGK8fvom3OrgLcckuLufKUwMAyBU2sAJACsZtgbXIUt3DeUDLRrwk+E7zBSStE3Bj2S
 e0ngGAAbLT6KrTPG9CvimYlmG//g1luV13d0ciFzMGkjOWXCdwEr1CpFofEfHaGtK0Vj
 ujYjibk8lvOHZHmQ+h68A74Ci/FN87YCQc53jerbJl6F+EG4FXct26EEWf/Q/h5Ylz0D
 NPqtDzr7IT7G9qHrfuT/vqSYKLTyFe7UwKb+3wWCETO/OUQugA/86fHK+sPMsNnxTzxk
 wdqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9oXxo1WvDlczb4pURiCEBYEL8Oq8CXXH7K2JX52c6GNr6FcO9XF8Am3+rxuurf3uJsWmXsEDCy2YWxOYy8u0S@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyzGRRdT9O+GCMM6q3rwfBPKwr5++SVAIshlrY8Ow4I9Q1matJF
 1mN6PtckBOdLpcZzmfZT4LvgmSFfJQ4i5Z+QUo0ZGGfgqZdCgyqYUNpkOGBx8hYNWRPxEbzwHYa
 W7HAMtGa52iZcESEI/PAG/SeVvKvIFYo=
X-Gm-Gg: ASbGncu2GnQ+nvcx6OUgifuenl8BCFiLzjKnjfHY0S51ulNGvNoJdw2jSjdJ0MxFTI1
 9aFvY3J6NLcEpfASHdRGG5q+vXbxv6gL/IQ94jTk2qVqHl6TCzZKZ1CIInNnu2svywG08jGcQ4L
 hzws7CWHok1cEUHhmFBDJm4qDxtzs0DJz3CvLkPImsdQQWB4NPK/CvGDDukGHq0xXrOA==
X-Google-Smtp-Source: AGHT+IFJF3StJDxqiD0vWnc7KLhQkAqadAul90UhKf0HXRlPlhBzdYYdqyDiUxyvUltGjZEPkuIt8u8b9yB5Haiq2Kw=
X-Received: by 2002:a05:6122:1d48:b0:526:2210:5b68 with SMTP id
 71dfb90a1353d-52dba80aa18mr29570055e0c.4.1748018447322; Fri, 23 May 2025
 09:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250522182644.2176645-1-daeho43@gmail.com>
 <52eee781-f53c-46a9-8ce4-96c5a0589240@kernel.org>
In-Reply-To: <52eee781-f53c-46a9-8ce4-96c5a0589240@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 23 May 2025 09:40:36 -0700
X-Gm-Features: AX0GCFuDGCRC94xkoWEBxrP6Skv4W0yvPLEXQKva3_rO-JHqoXHFhlWGlpJD-LI
Message-ID: <CACOAw_xCQpmiRRuhjpGbB4mKzonE24Uyg=jtrxge-hFZrn5dXg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, May 22, 2025 at 7:06 PM Chao Yu wrote: > > On 5/23/25
 02:26, Daeho Jeong wrote: > > From: Daeho Jeong > > > > Otherwise, it doesn't
 work with a crash. > > > > Signed-off-by: Daeho Jeong [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.51 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.51 listed in wl.mailspike.net]
X-Headers-End: 1uIVS6-0006Ww-7v
Subject: Re: [f2fs-dev] [PATCH v2] mkfs.f2fs: ensure zone size is equal or
 bigger than segment size
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

T24gVGh1LCBNYXkgMjIsIDIwMjUgYXQgNzowNuKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiA1LzIzLzI1IDAyOjI2LCBEYWVobyBKZW9uZyB3cm90ZToKPiA+IEZy
b206IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPgo+ID4gT3RoZXJ3aXNl
LCBpdCBkb2Vzbid0IHdvcmsgd2l0aCBhIGNyYXNoLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERh
ZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPiAtLS0KPiA+IHYyOiByZWxvY2F0
ZSB0aGUgY29kZQo+ID4gLS0tCj4gPiAgbGliL2xpYmYyZnMuYyB8IDUgKysrKysKPiA+ICAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2xpYi9saWJm
MmZzLmMgYi9saWIvbGliZjJmcy5jCj4gPiBpbmRleCBkMjU3OWQ3Li4xNDhkYzEyIDEwMDY0NAo+
ID4gLS0tIGEvbGliL2xpYmYyZnMuYwo+ID4gKysrIGIvbGliL2xpYmYyZnMuYwo+ID4gQEAgLTEz
NDcsNiArMTM0NywxMSBAQCBpbnQgZjJmc19nZXRfZjJmc19pbmZvKHZvaWQpCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgfQo+ID4gICAgICAgICAgICAgICAgICAgICAgIGMuem9uZV9ibG9ja3Mg
PSBjLmRldmljZXNbaV0uem9uZV9ibG9ja3M7Cj4gPiAgICAgICAgICAgICAgIH0KPiA+ICsgICAg
ICAgICAgICAgaWYgKGMuem9uZV9ibG9ja3MgPCBERUZBVUxUX0JMT0NLU19QRVJfU0VHTUVOVCkg
ewo+Cj4gSWYgYy56b25lX2Jsb2NrcyBjYW4gbm90IGJlIGFsaWduZWQgdG8gREVGQVVMVF9CTE9D
S1NfUEVSX1NFR01FTlQsIGRvIHdlIG5lZWQgdG8KPiBoYW5kbGUgYmVsb3cgY29kZT8KCldlIG5l
ZWQgdG8gbWFrZSBzdXJlIHRoYXQgYy56b25lX2Jsb2NrcyBpcyBhIG11bHRpcGxlIG9mCkRFRkFV
TFRfQkxPQ0tTX1BFUl9TRUdNRU5ULCByaWdodD8KCj4KPiAgICAgICAgICAgICAgICAgLyoKPiAg
ICAgICAgICAgICAgICAgICogQWxpZ24gc2VjdGlvbnMgdG8gdGhlIGRldmljZSB6b25lIHNpemUg
YW5kIGFsaWduIEYyRlMgem9uZXMKPiAgICAgICAgICAgICAgICAgICogdG8gdGhlIGRldmljZSB6
b25lcy4gRm9yIEYyRlNfWk9ORURfSEEgbW9kZWwgd2l0aG91dCB0aGUKPiAgICAgICAgICAgICAg
ICAgICogQkxLWk9ORUQgZmVhdHVyZSBzZXQgYXQgZm9ybWF0IHRpbWUsIHRoaXMgaXMgb25seSBh
bgo+ICAgICAgICAgICAgICAgICAgKiBvcHRpbWl6YXRpb24gYXMgc2VxdWVudGlhbCB3cml0ZXMg
d2lsbCBub3QgYmUgZW5mb3JjZWQuCj4gICAgICAgICAgICAgICAgICAqLwo+ICAgICAgICAgICAg
ICAgICBjLnNlZ3NfcGVyX3NlYyA9IGMuem9uZV9ibG9ja3MgLyBERUZBVUxUX0JMT0NLU19QRVJf
U0VHTUVOVDsKPgo+IFRoYW5rcywKPgo+ID4gKyAgICAgICAgICAgICAgICAgICAgIE1TRygwLCAi
XHRFcnJvcjogem9uZSBzaXplIHNob3VsZCBub3QgYmUgbGVzcyAiCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAidGhhbiBzZWdtZW50IHNpemVcbiIpOwo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiAtMTsKPiA+ICsgICAgICAgICAgICAgfQo+ID4KPiA+ICAgICAgICAg
ICAgICAgLyoKPiA+ICAgICAgICAgICAgICAgICogQWxpZ24gc2VjdGlvbnMgdG8gdGhlIGRldmlj
ZSB6b25lIHNpemUgYW5kIGFsaWduIEYyRlMgem9uZXMKPgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291
cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
