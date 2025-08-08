Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AFAB1E016
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Aug 2025 03:08:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgDFInlQ4IXHdNprEGrSBhzrEcfh0S4AICayseEv40c=; b=XWuA80jBNNVlv6sz/vrxnftIyW
	BhI3Ri/GS1pn+q6B8egF66IFYllm4EToP8708Vc8RI9+5bY9WnyLCh0GdvqRIj+XcyOOCmdn80CJm
	frUSFdRZ53KG8ECU1+1w5riGY/WaF+CtbE0Fpk7fEKdChNyIJdr7RNyEIR7shOH2HEIo=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ukBaX-0001hP-4j;
	Fri, 08 Aug 2025 01:08:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1ukBaW-0001hJ-9U
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 01:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r3eQ7rVkDjHljPJGyTGwqVmjvof0apAgtM+Mb2oIdIs=; b=Wg3W+b3oq8Sje5nSJpLrHLsEUF
 0FiWeLIF22LTeFaHvj05gmzo+sWyK4rVb9OHTtJMPv8FD6QeWvURT8O2nRKkPhzmYrEZtRzjXfnFb
 Q06pv5UOQmQeencHJvwmC7llUbeFCqi7gqd4iCJbCfQ8bo3bFV/DH+DD4tErSNzqXbLM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r3eQ7rVkDjHljPJGyTGwqVmjvof0apAgtM+Mb2oIdIs=; b=Iqk2oORrNZGfTDt0PJrq64FXPC
 iiWdffaicFuuqU8+HnIV+7Ql1wYSgqoCQJ6oU1LIKWGcd7MGKkrtCy9pZDyQIGJw7LvFpozZe/tIb
 Mg5JYgezzm9gAd3SlQh9Xeuo0VcaTsHWp+l48y06NwgbuE9mrrYd3vhQOMCZHa7e/n/Y=;
Received: from mail-wm1-f43.google.com ([209.85.128.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ukBaV-00042C-QM for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 01:08:04 +0000
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-459ddb41887so2211425e9.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 07 Aug 2025 18:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754615277; x=1755220077; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r3eQ7rVkDjHljPJGyTGwqVmjvof0apAgtM+Mb2oIdIs=;
 b=hAkK9rcvhTaoXl2XxUs2huE7TctdkGyhMzMT5gek6TnCLoqY2u6JWRCR/u5OGR8mK2
 lLVChq/ZaUnpJXRjc0mLGmbwmt1ywQyO/32cEj+fpA9wG0yU2KxooXkbDWUG0snNscFi
 wQV5EZHJVrHmZOfuAIOCRtlcEqpZwQWRs+0eOTxE+GeWCp/8CXS+fhAb3UhCdJbsaUmW
 NaSvp/YcnuyTELwcUFQ74cTBKil9PwQRI3BjfphhOrk6rbUHx7H/JJW2xEgzq0k7ab64
 wEvUMgexZcU8a7GVN/U5cv9bmp08bFdkWtPc1R9sR3PPK3sMcys/a1NDg7foeeic/Rr1
 riSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754615277; x=1755220077;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r3eQ7rVkDjHljPJGyTGwqVmjvof0apAgtM+Mb2oIdIs=;
 b=D/6Bl77vtrc4qqHAMVBrdfzS4cz+05FsfluNl9qy1LRaj5cay7VYRS+rvWn3mBg7Kg
 Xp14aE4BTQ8Rh0xy/oBhjj8Id4JmhJEkDnbDVTbDOTKYN2JsuSOo16PwdAK9kCxf4vBG
 b/a+IvTZTZbd+lN2CnZcp9iPARtIJLdnwZRKkaCXUsuRGikzjDxmwkonvgplcttBxFdb
 RyK0QRyhBj4W2naFXVK21u2ODRWXr+GfLjZkAsxL8+/5Lt4zohspf0OKNymTB9QEcwUK
 KIzv7+TmDUgzyGrr0FyWHWz+VBiYUzGLTcDIrLbmVPiGEVue+E1sUQwp8lr2aprK6PiQ
 yKZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpfKycMHUaHj6smdcF1j9MAvt8KWt5JwpwVZ+L/NOQ93GnP1BxIInkORDZrh/K53RIobsIvEJhr78LiPrcHA77@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwLIfZfm++E42Eh/rOX2QbaJ/lyHZ4Q2INgRsQSDAmeiImYCLgB
 S1Elo5pLee/y9JR3qn5luMgW/sVMuM4MbhDD1luRpKYQrJUN6Lvgc6idLNMM7BCgHPHfFEH7Zef
 p59pDGiOC4I+VOw8f4cTvwe/XA9kfz2239HlO
X-Gm-Gg: ASbGncsaJIV2/OXtI24Xe22uPsBkEbYUl+hcCGhYaxHfdaWOfus2UO8mNLa69o938qh
 46Om24kB4gTv968h+ZFbgluwxx3VEIhTCPJ4i2b+d8VqvXM0gto3yqllXvlIiY0fyJcPFBRi3qG
 MgKNa5yzS29ihXkbgij1CDXUJKkBaAMR3Nzvn+uag6F5t1jL4xs+qKoL9xKbRQZO9hQcr/KBpDR
 AXTa4Xm
X-Google-Smtp-Source: AGHT+IEZocG28lsVdx4WmXyb8tMnkkxxVJIR13Bp4wAasTNkMfgb79wuAfbCl8kCP05s9O0uN7IxhvfR8GcWLKSyR0I=
X-Received: by 2002:a05:600c:358a:b0:459:d7c4:9e28 with SMTP id
 5b1f17b1804b1-459f4c50c3amr2943505e9.0.1754615276953; Thu, 07 Aug 2025
 18:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250807014836.3780988-1-chao@kernel.org>
In-Reply-To: <20250807014836.3780988-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Fri, 8 Aug 2025 09:07:44 +0800
X-Gm-Features: Ac12FXwzxFsdSooevGSbA__Aw8caF8T_m6NgFpnzo_IiqTmxx2FEXioaWPMDkfA
Message-ID: <CAHJ8P3Krr4pCdOmnSJ6mp5bfGLLH4TJqd0FC7Qiw2V3iEL5VEw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu via Linux-f2fs-devel 于2025年8月7日周四 09:52写道：
    > > mount -t f2fs -o checkpoint=disable:10% /dev/vdb /mnt/f2fs/ > mount -t
    f2fs -o remount,checkpoint=enable /dev/vdb /mnt/f2fs/ [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [niuzhiguo84(at)gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [niuzhiguo84(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.43 listed in wl.mailspike.net]
X-Headers-End: 1ukBaV-00042C-QM
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to clear unusable_cap for
 checkpoint=enable
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

Q2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQ+CuS6jjIwMjXlubQ45pyIN+aXpeWRqOWbmyAwOTo1MuWGmemBk++8mgo+Cj4g
bW91bnQgLXQgZjJmcyAtbyBjaGVja3BvaW50PWRpc2FibGU6MTAlIC9kZXYvdmRiIC9tbnQvZjJm
cy8KPiBtb3VudCAtdCBmMmZzIC1vIHJlbW91bnQsY2hlY2twb2ludD1lbmFibGUgL2Rldi92ZGIg
L21udC9mMmZzLwo+Cj4ga2VybmVsIGxvZzoKPiBGMkZTLWZzICh2ZGIpOiBBZGp1c3QgdW51c2Fi
bGUgY2FwIGZvciBjaGVja3BvaW50PWRpc2FibGUgPSAyMDQ0NDAgLyAxMCUKPgo+IElmIHdlIGhh
cyBhc3NpZ25lZCBjaGVja3BvaW50PWVuYWJsZSBtb3VudCBvcHRpb24sIHVudXNhYmxlX2NhcHss
X3BlcmN9Cj4gcGFyYW1ldGVycyBvZiBjaGVja3BvaW50PWRpc2FibGUgc2hvdWxkIGJlIHJlc2V0
LCB0aGVuIGNhbGN1bGF0aW9uIGFuZAo+IGxvZyBwcmludCBjb3VsZCBiZSBhdm9pZCBpbiBhZGp1
c3RfdW51c2FibGVfY2FwX3BlcmMoKS4KPgo+IEZpeGVzOiAxYWUxOGY3MWNiNTIgKCJmMmZzOiBm
aXggY2hlY2twb2ludD1kaXNhYmxlOiV1JSUiKQo+IFNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPGNo
YW9Aa2VybmVsLm9yZz4KPiAtLS0KPiAgZnMvZjJmcy9zdXBlci5jIHwgNCArKysrCj4gIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVy
LmMgYi9mcy9mMmZzL3N1cGVyLmMKPiBpbmRleCBmMzcwMDQ3ODBjZTAuLmMxZjQ1ZGY5ZWZlYyAx
MDA2NDQKPiAtLS0gYS9mcy9mMmZzL3N1cGVyLmMKPiArKysgYi9mcy9mMmZzL3N1cGVyLmMKPiBA
QCAtMTAxNCw2ICsxMDE0LDEwIEBAIHN0YXRpYyBpbnQgZjJmc19wYXJzZV9wYXJhbShzdHJ1Y3Qg
ZnNfY29udGV4dCAqZmMsIHN0cnVjdCBmc19wYXJhbWV0ZXIgKnBhcmFtKQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIGN0eF9zZXRfb3B0KGN0eCwgRjJGU19NT1VOVF9ESVNBQkxFX0NIRUNLUE9J
TlQpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgICAgICAgICBj
YXNlIE9wdF9jaGVja3BvaW50X2VuYWJsZToKPiArICAgICAgICAgICAgICAgICAgICAgICBGMkZT
X0NUWF9JTkZPKGN0eCkudW51c2FibGVfY2FwX3BlcmMgPSAwOwo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGN0eC0+c3BlY19tYXNrIHw9IEYyRlNfU1BFQ19jaGVja3BvaW50X2Rpc2FibGVfY2Fw
X3BlcmM7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgRjJGU19DVFhfSU5GTyhjdHgpLnVudXNh
YmxlX2NhcCA9IDA7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY3R4LT5zcGVjX21hc2sgfD0g
RjJGU19TUEVDX2NoZWNrcG9pbnRfZGlzYWJsZV9jYXA7CkhpIENoYW8sCndoZW4gZW5hYmxlIGNo
ZWNrcG9pbnQsIHNob3VkIGl0IGJlOgpjdHgtPnNwZWNfbWFzayAmPSB+RjJGU19TUEVDX2NoZWNr
cG9pbnRfZGlzYWJsZV9jYXBfcGVyYzsKY3R4LT5zcGVjX21hc2sgJj0gfkYyRlNfU1BFQ19jaGVj
a3BvaW50X2Rpc2FibGVfY2FwOwpwbGVhc2UgY29ycmVjdCBtZSBpZiBJIG1pc3VuZGVyc3RhbmRp
bmcuCnRoYW5rcyEKPiAgICAgICAgICAgICAgICAgICAgICAgICBjdHhfY2xlYXJfb3B0KGN0eCwg
RjJGU19NT1VOVF9ESVNBQkxFX0NIRUNLUE9JTlQpOwo+ICAgICAgICAgICAgICAgICAgICAgICAg
IGJyZWFrOwo+ICAgICAgICAgICAgICAgICBkZWZhdWx0Ogo+IC0tCj4gMi40OS4wCj4KPgo+Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
