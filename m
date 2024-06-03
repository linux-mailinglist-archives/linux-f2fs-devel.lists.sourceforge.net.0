Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD558D7BE3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Jun 2024 08:52:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sE1Ya-0001uu-Ae;
	Mon, 03 Jun 2024 06:52:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1sE1YY-0001um-Qb
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Jun 2024 06:52:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dFYdwoyeltTtOFEgv/Zw8QRf1CDl0B6iKo/8Zi61M9s=; b=EvvH+sjxVcdSmsA55kwxF0UfQw
 PX7uDr189W3raiX2KDthWbCfFtH5fF4vIkCu6osbrHFylreOvVngCc33Elf/wxxpImF8zIPTUo3Ja
 P0LbNta0DAN84wxNZjQTrCpHNuMhz5tnOSJGNaAVQBFBOqR69eF+o+cKjy6L4gFP/9aw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dFYdwoyeltTtOFEgv/Zw8QRf1CDl0B6iKo/8Zi61M9s=; b=BwhNDPnTa/RyRn9qPHWUuuHGrR
 PJqJe6DQtI0Ikf6wVnyX5lJYRfPNr411LAeBADYNWI6D7425V6mflyvfd39GGUJjuIg7WAS1gSDFe
 QXuOHFBhtouGvGQ6iKpS6U6WZIM8hNn4aSjP3u5xVvf6cyLRND4qsfmb0jINHJznGeOs=;
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sE1YZ-0000Qj-9l for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Jun 2024 06:52:35 +0000
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-421338c4c3bso18113895e9.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 02 Jun 2024 23:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717397548; x=1718002348; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dFYdwoyeltTtOFEgv/Zw8QRf1CDl0B6iKo/8Zi61M9s=;
 b=iVoeSLQ9sf+8fZN6aPwLh3+Mtle5V/nLXbCgjrbPnX+7Jan+Pear4b79g1ni1AsHJb
 YNfKHkjSzRrrJ2fZHHVA0fggsrMU2cV33N5NsrA6LtUUH0LJCnTqXneDLb+2GNJyhZCo
 8V2AA1mAEGZKVAyVZPwdio8+SPCCQIIUK2Na59sjq6/V6r/y8s03USCqlgfgJ2/aN92j
 dlpdlN2paH+eGVcgwBhbZSituW+0DNOfWzSmsr8jLE2e6c8IqoXWCbk+dSwmkJHtJCvX
 M737tno8LQs4lbzk9Q7tt+CHqQ9NfrC1Litoid+6g5E11PzrhO+PTQr2Qq+12wz+XZDV
 hujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717397548; x=1718002348;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dFYdwoyeltTtOFEgv/Zw8QRf1CDl0B6iKo/8Zi61M9s=;
 b=pRgBL6+09Ijrodc1FELEZ6R3IzIXyL3HC39GhlgbeS559UvsXMDxeDZgHPEBBg1aYm
 pxjGzQ3F23BmxBhJg8PTuoiP/KWRfWP2Qp92yeCxsvSsL8iVrUyds2w7VpOFtISAaeE7
 B06SLU0sjqudXlwAiSPiHHDn/YRUgc9hz+ONCZnhkN+SedDbjl07E+87FUxTVQJ4pRBD
 3h7Xk1bYpp6D9VSykAe6y1Kzq606q0qn3OAmFehj09fi2XjhwNxS0gf8U/k5de7EPdhI
 8uHx9RZe3ZfbKBm29w8pyNVsPOgg7ZIH3+hRVvFPTL9kGGQqBSA89CGG+G6dbZcx0s1H
 QnCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMGA4IQbvxt9JRuNV9FfWPGj38l5BBlQOmdyavOJoCJRpWO/v+jO6QyOEgDJU3nNn8AFstsGqO1CzREV6q6NxI62NFwyykqgwWg2Tn/wZdvyUK/r67dA==
X-Gm-Message-State: AOJu0YxKOkmBCVrZJ0gw5G8b9PGqI/lPVBT3lXA2wtzeijdGaU4snLjt
 DHIwJo4Z7rA3GNm44CyPvuagQNkgfSWrVJ+Ij7sCxX4iGyYuIbofULllSv3YiPPic8DFg3qCcuc
 rd50enfw6gmjquTTsgccs1w3B7GU=
X-Google-Smtp-Source: AGHT+IGms2ug6jJFDGti/e1YMQ5AvDeI0/jP5FnBCgLhU6qEFiG/CAGUaZaPj+oJHKeMn2wPUzPtjdI4CmT0LCUree4=
X-Received: by 2002:a05:600c:198b:b0:421:2b3e:3a22 with SMTP id
 5b1f17b1804b1-4212e04a0d7mr66644065e9.14.1717397547472; Sun, 02 Jun 2024
 23:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <1717146645-18829-1-git-send-email-zhiguo.niu@unisoc.com>
 <b0c9f3dc-417a-4891-bdf0-25b849828e3b@kernel.org>
In-Reply-To: <b0c9f3dc-417a-4891-bdf0-25b849828e3b@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Mon, 3 Jun 2024 14:52:16 +0800
Message-ID: <CAHJ8P3LFkk0YnF-vnsd7wVMHXyhJN43Gfqtq3EBqjxoqgd88mg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Jun 3, 2024 at 2:39 PM Chao Yu wrote: > > On 2024/5/31
    17:10, Zhiguo Niu wrote: > > Use new Macro IOPRIO_PRIO_LEVEL to get ckpt
   thread ioprio data(level), > > it is more accurate and consi [...] 
 
 Content analysis details:   (-5.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [209.85.128.51 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.128.51 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.128.51 listed in bl.score.senderscore.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.51 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sE1YZ-0000Qj-9l
Subject: Re: [f2fs-dev] [PATCH] f2fs: use new ioprio Macro to get ckpt
 thread ioprio data
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
Cc: jaegeuk@kernel.org, ke.wang@unisoc.com, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBKdW4gMywgMjAyNCBhdCAyOjM54oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IE9uIDIwMjQvNS8zMSAxNzoxMCwgWmhpZ3VvIE5pdSB3cm90ZToKPiA+IFVz
ZSBuZXcgTWFjcm8gSU9QUklPX1BSSU9fTEVWRUwgdG8gZ2V0IGNrcHQgdGhyZWFkIGlvcHJpbyBk
YXRhKGxldmVsKSwKPiA+IGl0IGlzIG1vcmUgYWNjdXJhdGUgYW5kIGNvbnNpc3RlbiB3aXRoIHRo
ZSB3YXkgc2V0dGluZyBja3B0IHRocmVhZAo+ID4gaW9wcmlvKElPUFJJT19QUklPX1ZBTFVFKGNs
YXNzLCBkYXRhKSkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWmhpZ3VvIE5pdSA8emhpZ3VvLm5p
dUB1bmlzb2MuY29tPgo+ID4gLS0tCj4gPiAgIGZzL2YyZnMvc3lzZnMuYyB8IDIgKy0KPiA+ICAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2ZzL2YyZnMvc3lzZnMuYyBiL2ZzL2YyZnMvc3lzZnMuYwo+ID4gaW5kZXggNzI2
NzZjNS4uNTVkNDZkYSAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvc3lzZnMuYwo+ID4gKysrIGIv
ZnMvZjJmcy9zeXNmcy5jCj4gPiBAQCAtMzQwLDcgKzM0MCw3IEBAIHN0YXRpYyBzc2l6ZV90IGYy
ZnNfc2JpX3Nob3coc3RydWN0IGYyZnNfYXR0ciAqYSwKPiA+ICAgICAgIGlmICghc3RyY21wKGEt
PmF0dHIubmFtZSwgImNrcHRfdGhyZWFkX2lvcHJpbyIpKSB7Cj4gPiAgICAgICAgICAgICAgIHN0
cnVjdCBja3B0X3JlcV9jb250cm9sICpjcHJjID0gJnNiaS0+Y3ByY19pbmZvOwo+ID4gICAgICAg
ICAgICAgICBpbnQgY2xhc3MgPSBJT1BSSU9fUFJJT19DTEFTUyhjcHJjLT5ja3B0X3RocmVhZF9p
b3ByaW8pOwo+ID4gLSAgICAgICAgICAgICBpbnQgZGF0YSA9IElPUFJJT19QUklPX0RBVEEoY3By
Yy0+Y2twdF90aHJlYWRfaW9wcmlvKTsKPiA+ICsgICAgICAgICAgICAgaW50IGRhdGEgPSBJT1BS
SU9fUFJJT19MRVZFTChjcHJjLT5ja3B0X3RocmVhZF9pb3ByaW8pOwo+Cj4gU28sIGNhbiB5b3Ug
cGxlYXNlIHVzZSAnbGV2ZWwnIHRvIGluc3RlYWQgJ2RhdGEnIGluIGYyZnNfc2JpX3Nob3coKSBh
bmQKPiBfX3NiaV9zdG9yZSgpPwpIaSBDaGFvLAoKSU9QUklPX1BSSU9fREFUQSBpbiB0aGUgbmV3
IGtlcm5lbCB2ZXJzaW9uIGluY2x1ZGVzIHR3byBwYXJ0czogbGV2ZWwgYW5kIGhpbnQuCkluIF9f
c2JpX3N0b3JlLCAiIElPUFJJT19QUklPX1ZBTFVFKGNsYXNzLCBkYXRhKSIgIGlzIHVzZWQgdG8g
c2V0IGNrcHQKaW9wcmlvcml0eSwKYW5kIGl0IHdpbGwgcGFzcyBkZWZhdWx0IGhpbnQgdmFsdWUs
IHdlIGp1c3QgbmVlZCB0byBrZWVwIGNsYXNzIC9sZXZlbCByaWdodC4KCiAjZGVmaW5lIElPUFJJ
T19QUklPX1ZBTFVFKHByaW9jbGFzcywgcHJpb2xldmVsKSBcCiAgIGlvcHJpb192YWx1ZShwcmlv
Y2xhc3MsIHByaW9sZXZlbCwgSU9QUklPX0hJTlRfTk9ORSkKc28gaSB0aGluayB0aGlzIHBhcnQg
aXMgbm90IG5lZWRlZCB0byBtb2RpZnkuCgp0aGFua3MhCj4KPiBUaGFua3MsCj4KPiA+Cj4gPiAg
ICAgICAgICAgICAgIGlmIChjbGFzcyAhPSBJT1BSSU9fQ0xBU1NfUlQgJiYgY2xhc3MgIT0gSU9Q
UklPX0NMQVNTX0JFKQo+ID4gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
