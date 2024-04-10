Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B73B689FF3D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Apr 2024 19:56:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rucBM-0002bL-6Q;
	Wed, 10 Apr 2024 17:56:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rucBH-0002bB-CC
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Apr 2024 17:56:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bUKio6AzaNS0zjy4l2NNvxED0I4SlVG57L0wJAYnTQI=; b=QgFahxZNsIiJzWy/fhTwupPjKk
 jigv2lqmFwMRNyS8OFFhoRvzQ1K+5vLcuNUDXqlMypL8CVJJCFwKc+VqAQSUOBNbe7594O2txLDDw
 HwDEJhBrfMF4PmBarttFD55xbAEzBHmtMUOXBuMnShLyGdtPHDNwzzhw+oCQMvDjdy2c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bUKio6AzaNS0zjy4l2NNvxED0I4SlVG57L0wJAYnTQI=; b=R+yTbR/uOo3kGqe/+cAuzQhI2G
 zzcShitQ2/RftcHkMRn8aQPI7CJ8aiVxgTbjHhnr2lmPXH48V7zmyOmxmSHs0h9U1dEUN2jFi63gd
 IEuL9xGQFWgap3YxRIhkdokjvclMnHVT4Q6MKlaIVt1Z3kTkQwCgWtN1bZ7QBRYuCTmA=;
Received: from mail-vs1-f44.google.com ([209.85.217.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rucBG-0004u2-QF for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Apr 2024 17:56:19 +0000
Received: by mail-vs1-f44.google.com with SMTP id
 ada2fe7eead31-47a0f54fb13so1191995137.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 10 Apr 2024 10:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712771768; x=1713376568; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bUKio6AzaNS0zjy4l2NNvxED0I4SlVG57L0wJAYnTQI=;
 b=lghekRdtb2tU0/c1OrEc3DbM6awcwD1oKfvT0S4dadYwA3Q/+TARPYtxrZcHGON8Uh
 LISMFjYSQVzcETf9wZbbt2sVK3Qmdsgp0Oltl/RbUdSMaVB9VuRPATVyARtT4C0bnRLB
 WJJvG8IxLCP/ezlWy2X4FlXCnGUucVvToKEhBAxubz1GpYnG2+FGiqOUfxId2ics4j5w
 +oqpT4afP1trXStw0Im16W5aNFILia1/m+HHzKo5C90UDiAK0h1XS3QDOaOpa6Jlq7RW
 mR52rAaOeunBp+anm9PbtE404G+AlNyHr1P9JZVlhu7n9/kzzEuwLlgISgHAd6ohaak9
 w07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712771768; x=1713376568;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bUKio6AzaNS0zjy4l2NNvxED0I4SlVG57L0wJAYnTQI=;
 b=b6+y/XlpTSB1/4N7vexOAtLq5PIjMppiW6f+6+mjkt0znUjty8df9B2KlVxIrWaXH+
 ukNkTR9zr5aCEvZD+jcUfwQV/i2OwD4bZJT1iw8/+SJGRauG70zKyVVvdaXj+IdmFJF/
 a9Dxhwsy3wa8BNTmf+RyywvbD2qh6+23pfy42/JhPwk1wc8Gj1bBYQoI/+WhfYNqdjNz
 C2po8oZzC1fAso3a9m1ZB3ba8n5nNgZoRIV6YufuApdplwYXUPjrsngXarIbq9FT+afX
 gLQCBVKs8gl7hjveGoEHJsa5ROuoNskUfUdIVSWijPBlyy1MltcmJJ5nmcAwrMZiKZ7J
 7kbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1p1uYOg0CxlP3elEbFhJNqhXbpJFueATbhDqVlbfnciVXq7L2VnOhC3v5DscHqo1VdA+fg8XK5aoyUiix8Mcfah5kWpNQ3enPs0ddhAFPJrgZRIe2Mw==
X-Gm-Message-State: AOJu0YyScPOjweyf5yzdH+6SqXmBdZY+XZZW85zR//NwvDnbBViHNyLw
 C8lrqiO2SS7YfU8vF93u2dcZop2Uk8f8DnBTej5Fj2tclUZR1qLZ0scozqu75xyjF6DRzWLdQaR
 5daMHxk1sLVt9YQwvSyufF13/pEA=
X-Google-Smtp-Source: AGHT+IHsRzs312QjrqWsWgFZvVSnqgeGsUFMNuDYS5nfzKd/riBo8njbsd6WTcOPQMUGazls1Z6/LXYowohceYJXAg8=
X-Received: by 2002:a05:6102:3c89:b0:478:3f7b:61 with SMTP id
 c9-20020a0561023c8900b004783f7b0061mr3903081vsv.32.1712771768082; Wed, 10 Apr
 2024 10:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240329102542.3577458-1-chao@kernel.org>
 <9280018c-c023-4254-9936-d79d3dfe84ff@kernel.org>
In-Reply-To: <9280018c-c023-4254-9936-d79d3dfe84ff@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 10 Apr 2024 10:55:57 -0700
Message-ID: <CACOAw_ySNneAHCNAaoQccz0eoVKJnKf6WJBiF6QuV8Gx_1G+iQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Apr 9, 2024 at 8:27 PM Chao Yu wrote: > > Ping,
   > > Missed to check this patch? > > On 2024/3/29 18:25, Chao Yu wrote: > >
    This patch adds unset subcommand for pinfile command. > > > > Usa [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.217.44 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1rucBG-0004u2-QF
Subject: Re: [f2fs-dev] [PATCH] f2fs_io: support unset subcommand for pinfile
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

T24gVHVlLCBBcHIgOSwgMjAyNCBhdCA4OjI34oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IFBpbmcsCj4KPiBNaXNzZWQgdG8gY2hlY2sgdGhpcyBwYXRjaD8KPgo+IE9u
IDIwMjQvMy8yOSAxODoyNSwgQ2hhbyBZdSB3cm90ZToKPiA+IFRoaXMgcGF0Y2ggYWRkcyB1bnNl
dCBzdWJjb21tYW5kIGZvciBwaW5maWxlIGNvbW1hbmQuCj4gPgo+ID4gVXNhZ2U6IGYyZnNfaW8g
cGluZmlsZSB1bnNldCBbdGFyZ2V0X2ZpbGVdCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZ
dSA8Y2hhb0BrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgIG1hbi9mMmZzX2lvLjggICAgICAgICAg
IHwgIDIgKy0KPiA+ICAgdG9vbHMvZjJmc19pby9mMmZzX2lvLmMgfCAxMSArKysrKysrKystLQo+
ID4gICAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL21hbi9mMmZzX2lvLjggYi9tYW4vZjJmc19pby44Cj4gPiBpbmRl
eCBmMDk3YmRlLi5iOWM5ZGM4IDEwMDY0NAo+ID4gLS0tIGEvbWFuL2YyZnNfaW8uOAo+ID4gKysr
IGIvbWFuL2YyZnNfaW8uOAo+ID4gQEAgLTQ0LDcgKzQ0LDcgQEAgZ29pbmcgZG93biB3aXRoIG1l
dGFkYXRhIGZsdXNoCj4gPiAgIGdvaW5nIGRvd24gd2l0aCBmc2NrIG1hcmsKPiA+ICAgLlJFCj4g
PiAgIC5UUAo+ID4gLVxmQnBpbmZpbGVcZlIgXGZJW2dldHxzZXRdIFtmaWxlXVxmUgo+ID4gK1xm
QnBpbmZpbGVcZlIgXGZJW2dldHxzZXR8dW5zZXRdIFtmaWxlXVxmUgo+ID4gICBHZXQgb3Igc2V0
IHRoZSBwaW5uaW5nIHN0YXR1cyBvbiBhIGZpbGUuCj4gPiAgIC5UUAo+ID4gICBcZkJmYWR2aXNl
XGZSIFxmSVthZHZpY2VdIFtvZmZzZXRdIFtsZW5ndGhdIFtmaWxlXVxmUgo+ID4gZGlmZiAtLWdp
dCBhL3Rvb2xzL2YyZnNfaW8vZjJmc19pby5jIGIvdG9vbHMvZjJmc19pby9mMmZzX2lvLmMKPiA+
IGluZGV4IGI4ZTRmMDIuLmE3YjU5M2EgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy9mMmZzX2lvL2Yy
ZnNfaW8uYwo+ID4gKysrIGIvdG9vbHMvZjJmc19pby9mMmZzX2lvLmMKPiA+IEBAIC00NDIsNyAr
NDQyLDcgQEAgc3RhdGljIHZvaWQgZG9fZmFkdmlzZShpbnQgYXJnYywgY2hhciAqKmFyZ3YsIGNv
bnN0IHN0cnVjdCBjbWRfZGVzYyAqY21kKQo+ID4KPiA+ICAgI2RlZmluZSBwaW5maWxlX2Rlc2Mg
InBpbiBmaWxlIGNvbnRyb2wiCj4gPiAgICNkZWZpbmUgcGluZmlsZV9oZWxwICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gLSJmMmZzX2lvIHBpbmZp
bGUgW2dldHxzZXRdIFtmaWxlXVxuXG4iICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiArImYy
ZnNfaW8gcGluZmlsZSBbZ2V0fHNldHx1bnNldF0gW2ZpbGVdXG5cbiIgICAgICAgICAgICAgICAg
IFwKPiA+ICAgImdldC9zZXQgcGlubmluZyBnaXZlbiB0aGUgZmlsZVxuIiAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+ID4KPiA+ICAgc3RhdGljIHZvaWQgZG9fcGluZmlsZShpbnQgYXJnYywg
Y2hhciAqKmFyZ3YsIGNvbnN0IHN0cnVjdCBjbWRfZGVzYyAqY21kKQo+ID4gQEAgLTQ2NCw3ICs0
NjQsMTQgQEAgc3RhdGljIHZvaWQgZG9fcGluZmlsZShpbnQgYXJnYywgY2hhciAqKmFyZ3YsIGNv
bnN0IHN0cnVjdCBjbWRfZGVzYyAqY21kKQo+ID4gICAgICAgICAgICAgICByZXQgPSBpb2N0bChm
ZCwgRjJGU19JT0NfU0VUX1BJTl9GSUxFLCAmcGluKTsKPiA+ICAgICAgICAgICAgICAgaWYgKHJl
dCAhPSAwKQo+ID4gICAgICAgICAgICAgICAgICAgICAgIGRpZV9lcnJubygiRjJGU19JT0NfU0VU
X1BJTl9GSUxFIGZhaWxlZCIpOwo+ID4gLSAgICAgICAgICAgICBwcmludGYoInNldF9waW5fZmls
ZTogJXUgYmxvY2tzIG1vdmVkIGluICVzXG4iLCByZXQsIGFyZ3ZbMl0pOwo+ID4gKyAgICAgICAg
ICAgICBwcmludGYoIiVzIHBpbmZpbGU6ICV1IGJsb2NrcyBtb3ZlZCBpbiAlc1xuIiwKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYXJndlsxXSwgcmV0LCBhcmd2WzJd
KTsKPiA+ICsgICAgIH0gZWxzZSBpZiAoIXN0cmNtcChhcmd2WzFdLCAidW5zZXQiKSkgewo+ID4g
KyAgICAgICAgICAgICBwaW4gPSAwOwo+ID4gKyAgICAgICAgICAgICByZXQgPSBpb2N0bChmZCwg
RjJGU19JT0NfU0VUX1BJTl9GSUxFLCAmcGluKTsKPiA+ICsgICAgICAgICAgICAgaWYgKHJldCAh
PSAwKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGRpZV9lcnJubygiRjJGU19JT0NfU0VUX1BJ
Tl9GSUxFIGZhaWxlZCIpOwo+ID4gKyAgICAgICAgICAgICBwcmludGYoIiVzIHBpbmZpbGUgaW4g
JXNcbiIsIGFyZ3ZbMV0sIGFyZ3ZbMl0pOwo+ID4gICAgICAgfSBlbHNlIGlmICghc3RyY21wKGFy
Z3ZbMV0sICJnZXQiKSkgewo+ID4gICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmxhZ3M7Cj4g
Pgo+CgpSZXZpZXdlZC1ieTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KClRo
YW5rcywKCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
