Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1134F804124
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Dec 2023 22:49:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rAGoq-0000Ou-7M;
	Mon, 04 Dec 2023 21:49:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rAGon-0000Oj-2z
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Dec 2023 21:49:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ubRXQTeiFt9GpRXI/6OBGRrpxykvw56RWRgyn02NYIk=; b=A1jm9CONqmwVdQ2wrP+NdV/R9b
 LssxrdVRJHkJVsc3Ih82u8R7bnnoXncMHRQMYnyqdfnT88tEjHlXyhxCeOW9x9M8dXyuzqQJojZG8
 rbAuACfpY/PHdRIYDH6L11xXIy39tgG5cdiAcxJvbEJ8MTfJTn+TfdVewiQbuBe52uO4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ubRXQTeiFt9GpRXI/6OBGRrpxykvw56RWRgyn02NYIk=; b=it503dgf6Vo2+WGTIt5b0cr1Zv
 8HaY12O/5YoQ6+8vWslatuX/9tUTxuB0XE9wt3SJGHJ9e0SopEiDTrsubBExRcHe5mmDrsFjkGKE8
 trUkIn85M+agWzWIZd+6e+j65dmzNVFxKfmhQ+wfBC58XQ54J0InxlgugRh5EXRQVJMc=;
Received: from mail-yw1-f176.google.com ([209.85.128.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rAGom-0006L4-SU for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Dec 2023 21:49:33 +0000
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-5d8e816f77eso12685717b3.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 04 Dec 2023 13:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701726567; x=1702331367; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ubRXQTeiFt9GpRXI/6OBGRrpxykvw56RWRgyn02NYIk=;
 b=eLhNpuXEuVcIuLGkfoJAJBs8DikdiYaNcEkUSMIh0jgAWWw9nqm67oB6WBK9lrh6Fu
 kJ+qCn09JtotQYovuFWifVSCDhk7efQrY1RsPO6J3qMCUbuwPbD/xvDctC25Xblrhr4R
 cF2U8DXEtAW6tfgAQSmspVJS2k2S+AgEv3cP1Xgjee2nQTIIrCcnTJHXEjQERI0ifL59
 CBWVbLKuCb+iS4kwvMM/ZSWlL0WWlNWDK8uC+MiY71tIcre4dA8Nc7zgbp33+l2/Wnzh
 8LNOWzWSD2GvILLD9VTN8icGEDLd3+mJGkxxt6QswF4XlxhNUHIsORUF+YdLlvSu+nle
 PHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701726567; x=1702331367;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ubRXQTeiFt9GpRXI/6OBGRrpxykvw56RWRgyn02NYIk=;
 b=gfJ/HHN/CP2MovhrPxnWovOh6AIwipqpBA6zEfNbpsnXNI0eiw2ja8MWg7REelOj+r
 AGSBY96uhvMDuEak+49Pij5DhEKjCvIjxkS37p2vxS3dYendKsD7c00X9PTjDQGtoR3e
 TJez5d8wjrQ1BPdrVvx0r9gYVrMCBnwTYEuxdIycBvbqWpYR26dX++e8pJ/x6qCdpYMZ
 cSFNe8rd1/3FFkID4xJc7BaXNVmX8XxLjXl43wmVlR0jXsLgRxySOYSH/tj9khZwcXIf
 Hp6xpP+so2LmGAYS/nlNSENQjF+f+nVAgX/oPwwZ7M2GTsTp3LW/buCWpT46MXs0cUAl
 aJdg==
X-Gm-Message-State: AOJu0Ywt5rht5UuX+a/ZPsUBHN9/Fi4BxqM23JSSXdVvPKX37pu2iGEt
 TKmjPxoGONxT798d1JGxT5/9J8ZaX+0ajzD9yETvFLX9YlQ=
X-Google-Smtp-Source: AGHT+IElefo3g8xyw63YgpgwE6qjcPayyqksyAZn+TpsInT2m5BM3/xxggErNz95a8EeujF1i0HioktW+LG64o9DmKQ=
X-Received: by 2002:ac5:c24f:0:b0:4b2:e003:e16 with SMTP id
 n15-20020ac5c24f000000b004b2e0030e16mr1725996vkk.3.1701716001159; Mon, 04 Dec
 2023 10:53:21 -0800 (PST)
MIME-Version: 1.0
References: <20231204180428.925779-1-jaegeuk@kernel.org>
In-Reply-To: <20231204180428.925779-1-jaegeuk@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 4 Dec 2023 10:53:10 -0800
Message-ID: <CACOAw_x-QMsCyW9Tiw408TSfKXudBnJUJ7Pc3VkRmYQ-vi+eug@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  LGTM On Mon, Dec 4, 2023 at 10:06 AM Jaegeuk Kim wrote:
   > > If fsck can allocate a new zone, it'd be better to use that instead of
    > allocating a new one. > > And, it modifies kernel messages. > > Sign [...]
    
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.128.176 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.176 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rAGom-0006L4-SU
Subject: Re: [f2fs-dev] [PATCH 1/4] f2fs: allocate new section if it's not
 new
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

TEdUTQoKT24gTW9uLCBEZWMgNCwgMjAyMyBhdCAxMDowNuKAr0FNIEphZWdldWsgS2ltIDxqYWVn
ZXVrQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSWYgZnNjayBjYW4gYWxsb2NhdGUgYSBuZXcgem9u
ZSwgaXQnZCBiZSBiZXR0ZXIgdG8gdXNlIHRoYXQgaW5zdGVhZCBvZgo+IGFsbG9jYXRpbmcgYSBu
ZXcgb25lLgo+Cj4gQW5kLCBpdCBtb2RpZmllcyBrZXJuZWwgbWVzc2FnZXMuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgo+IC0tLQo+ICBmcy9mMmZz
L3NlZ21lbnQuYyB8IDMzICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwo+IGluZGV4IDA4ZTJm
NDRhMTI2NC4uOTA4MWM5YWY5NzdhIDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5jCj4g
KysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPiBAQCAtNDk0OSwyMCArNDk0OSwxOCBAQCBzdGF0aWMg
aW50IGNoZWNrX3pvbmVfd3JpdGVfcG9pbnRlcihzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4g
ICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gICAgICAgICB9Cj4KPiAtICAgICAgIGlmIChp
c19zZXRfY2twdF9mbGFncyhzYmksIENQX1VNT1VOVF9GTEFHKSkgewo+IC0gICAgICAgICAgICAg
ICAvKgo+IC0gICAgICAgICAgICAgICAgKiBJZiB0aGVyZSBhcmUgdmFsaWQgYmxvY2tzIGFuZCB0
aGUgd3JpdGUgcG9pbnRlciBkb2Vzbid0IG1hdGNoCj4gLSAgICAgICAgICAgICAgICAqIHdpdGgg
dGhlbSwgd2UgbmVlZCB0byByZXBvcnQgdGhlIGluY29uc2lzdGVuY3kgYW5kIGZpbGwKPiAtICAg
ICAgICAgICAgICAgICogdGhlIHpvbmUgdGlsbCB0aGUgZW5kIHRvIGNsb3NlIHRoZSB6b25lLiBU
aGlzIGluY29uc2lzdGVuY3kKPiAtICAgICAgICAgICAgICAgICogZG9lcyBub3QgY2F1c2Ugd3Jp
dGUgZXJyb3IgYmVjYXVzZSB0aGUgem9uZSB3aWxsIG5vdCBiZQo+IC0gICAgICAgICAgICAgICAg
KiBzZWxlY3RlZCBmb3Igd3JpdGUgb3BlcmF0aW9uIHVudGlsIGl0IGdldCBkaXNjYXJkZWQuCj4g
LSAgICAgICAgICAgICAgICAqLwo+IC0gICAgICAgICAgICAgICBmMmZzX25vdGljZShzYmksICJW
YWxpZCBibG9ja3MgYXJlIG5vdCBhbGlnbmVkIHdpdGggd3JpdGUgIgo+ICsgICAgICAgLyoKPiAr
ICAgICAgICAqIElmIHRoZXJlIGFyZSB2YWxpZCBibG9ja3MgYW5kIHRoZSB3cml0ZSBwb2ludGVy
IGRvZXNuJ3QgbWF0Y2gKPiArICAgICAgICAqIHdpdGggdGhlbSwgd2UgbmVlZCB0byByZXBvcnQg
dGhlIGluY29uc2lzdGVuY3kgYW5kIGZpbGwKPiArICAgICAgICAqIHRoZSB6b25lIHRpbGwgdGhl
IGVuZCB0byBjbG9zZSB0aGUgem9uZS4gVGhpcyBpbmNvbnNpc3RlbmN5Cj4gKyAgICAgICAgKiBk
b2VzIG5vdCBjYXVzZSB3cml0ZSBlcnJvciBiZWNhdXNlIHRoZSB6b25lIHdpbGwgbm90IGJlCj4g
KyAgICAgICAgKiBzZWxlY3RlZCBmb3Igd3JpdGUgb3BlcmF0aW9uIHVudGlsIGl0IGdldCBkaXNj
YXJkZWQuCj4gKyAgICAgICAgKi8KPiArICAgICAgIGYyZnNfbm90aWNlKHNiaSwgIlZhbGlkIGJs
b2NrcyBhcmUgbm90IGFsaWduZWQgd2l0aCB3cml0ZSAiCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICJwb2ludGVyOiB2YWxpZCBibG9ja1sweCV4LDB4JXhdIHdwWzB4JXgsMHgleF0iLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHRVRfU0VHTk8oc2JpLCBsYXN0X3ZhbGlkX2Js
b2NrKSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgR0VUX0JMS09GRl9GUk9NX1NFRzAo
c2JpLCBsYXN0X3ZhbGlkX2Jsb2NrKSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgd3Bf
c2Vnbm8sIHdwX2Jsa29mZik7Cj4gLSAgICAgICB9Cj4KPiAgICAgICAgIHJldCA9IGJsa2Rldl96
b25lX21nbXQoZmRldi0+YmRldiwgUkVRX09QX1pPTkVfRklOSVNILAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgem9uZS0+c3RhcnQsIHpvbmUtPmxlbiwgR0ZQX05PRlMpOwo+IEBA
IC01MDUzLDE1ICs1MDUxLDE4IEBAIHN0YXRpYyBpbnQgZml4X2N1cnNlZ193cml0ZV9wb2ludGVy
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgaW50IHR5cGUpCj4gICAgICAgICAgICAgICAgIGYy
ZnNfbm90aWNlKHNiaSwgIlVuYWxpZ25lZCBjdXJzZWdbJWRdIHdpdGggd3JpdGUgcG9pbnRlcjog
Igo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiY3Vyc2VnWzB4JXgsMHgleF0gd3BbMHgl
eCwweCV4XSIsIHR5cGUsIGNzLT5zZWdubywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Y3MtPm5leHRfYmxrb2ZmLCB3cF9zZWdubywgd3BfYmxrb2ZmKTsKPiAtICAgICAgIH0gZWxzZSB7
Cj4gLSAgICAgICAgICAgICAgIGYyZnNfbm90aWNlKHNiaSwgIk5vdCBzdWNjZXNzZnVsbHkgdW5t
b3VudGVkIGluIHRoZSBwcmV2aW91cyAiCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICJt
b3VudCIpOwo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBmMmZzX25vdGljZShzYmksICJBc3NpZ24g
bmV3IHNlY3Rpb24gdG8gY3Vyc2VnWyVkXTogIgo+IC0gICAgICAgICAgICAgICAgICAgImN1cnNl
Z1sweCV4LDB4JXhdIiwgdHlwZSwgY3MtPnNlZ25vLCBjcy0+bmV4dF9ibGtvZmYpOwo+ICsgICAg
ICAgLyogQWxsb2NhdGUgYSBuZXcgc2VjdGlvbiBpZiBpdCdzIG5vdCBuZXcuICovCj4gKyAgICAg
ICBpZiAoY3MtPm5leHRfYmxrb2ZmKSB7Cj4gKyAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBv
bGRfc2Vnbm8gPSBjcy0+c2Vnbm8sIG9sZF9ibGtvZmYgPSBjcy0+bmV4dF9ibGtvZmY7Cj4KPiAt
ICAgICAgIGYyZnNfYWxsb2NhdGVfbmV3X3NlY3Rpb24oc2JpLCB0eXBlLCB0cnVlKTsKPiArICAg
ICAgICAgICAgICAgZjJmc19hbGxvY2F0ZV9uZXdfc2VjdGlvbihzYmksIHR5cGUsIHRydWUpOwo+
ICsgICAgICAgICAgICAgICBmMmZzX25vdGljZShzYmksICJBc3NpZ24gbmV3IHNlY3Rpb24gdG8g
Y3Vyc2VnWyVkXTogIgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIlsweCV4LDB4
JXhdIC0+IFsweCV4LDB4JXhdIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHR5
cGUsIG9sZF9zZWdubywgb2xkX2Jsa29mZiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNzLT5zZWdubywgY3MtPm5leHRfYmxrb2ZmKTsKPiArICAgICAgIH0KPgo+ICAgICAgICAg
LyogY2hlY2sgY29uc2lzdGVuY3kgb2YgdGhlIHpvbmUgY3Vyc2VnIHBvaW50ZWQgdG8gKi8KPiAg
ICAgICAgIGlmIChjaGVja196b25lX3dyaXRlX3BvaW50ZXIoc2JpLCB6YmQsICZ6b25lKSkKPiAt
LQo+IDIuNDMuMC5yYzIuNDUxLmc4NjMxYmM3NDcyLWdvb2cKPgo+Cj4KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
